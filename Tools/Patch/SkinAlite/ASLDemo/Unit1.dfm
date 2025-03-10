object Form1: TForm1
  Left = 126
  Top = 112
  Width = 485
  Height = 350
  Caption = 'Demo of AlphaControls Lite'
  Color = clBtnFace
  Constraints.MinHeight = 350
  Constraints.MinWidth = 485
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object sPanel3: TsPanel
    Left = 7
    Top = 25
    Width = 200
    Height = 244
    BevelWidth = 3
    TabOrder = 0
    sStyle.GroupIndex = 0
    sStyle.SkinSection = 'TsPanel_Lowered'
    sStyle.Painting.Bevel = cbLoweredHard
    sStyle.Painting.Transparency = 100
    sStyle.Painting.Color = clBtnFace
    sStyle.Background.Gradient.Percent = 0
    BevelOuter = cbLoweredHard
    Caption = ' '
    object sPanel2: TsPanel
      Left = 19
      Top = 21
      Width = 156
      Height = 200
      Cursor = crHandPoint
      Hint = 'Drag this panel'
      BevelWidth = 5
      TabOrder = 0
      OnMouseDown = sPanel2MouseDown
      sStyle.Effects.Shadow.Transparency = 25
      sStyle.Effects.Shadow.DontUse = False
      sStyle.Effects.Shadow.Enabled = True
      sStyle.Effects.Shadow.Offset = 24
      sStyle.Effects.Shadow.Blur = 8
      sStyle.GroupIndex = 0
      sStyle.SkinSection = 'TsPanel'
      sStyle.Painting.Transparency = 50
      sStyle.Painting.Color = clBtnFace
      sStyle.Background.Gradient.Data = 
        '8421504;8421504;44;0;0;8421504;16777215;28;0;0;16777215;0;27;0;0' +
        ';0;0;0;0;0'
      BevelInner = cbLoweredHard
      Caption = ' '
      object sButton9: TsButton
        Left = 35
        Top = 145
        Width = 87
        Height = 41
        sStyle.Effects.Shadow.DontUse = False
        sStyle.Effects.Shadow.Enabled = True
        sStyle.GroupIndex = 0
        sStyle.SkinSection = 'TsButton'
        sStyle.Painting.Bevel = cbRaisedHard
        sStyle.Painting.Transparency = 100
        sStyle.Painting.Color = clBtnFace
        sStyle.Background.Gradient.Data = 
          '13221560;16777215;49;0;0;16777215;9996156;34;0;0;9996156;1677721' +
          '5;16;0;0;16777215;16777215;0;0;0'
        sStyle.HotStyle.HotBackground.Gradient.Data = 
          '16777215;9996156;6;0;0;9996156;16777215;47;0;0;16777215;14076606' +
          ';28;0;0;14076606;14275020;18;0;0;14275020;14275020;0;0;0'
        sStyle.HotStyle.HotPainting.FontColor = clNavy
        sStyle.HotStyle.HotPainting.Transparency = 75
        sStyle.BtnEffects.MaskedBorders.Predefined = pdBorder6
        sStyle.BtnEffects.MaskedBorders.Enabled = False
        Caption = 'Background changing'
        OnClick = sButton9Click
        FocusMargin = 3
        TabOrder = 0
      end
      object sCheckBox18: TsCheckBox
        Left = 27
        Top = 13
        Width = 96
        Height = 51
        Alignment = taCenter
        sStyle.GroupIndex = 0
        sStyle.SkinSection = 'TsCheckBox'
        sStyle.Painting.ColorBorderTop = clBtnHighlight
        sStyle.Painting.Color = clBtnFace
        sStyle.Painting.ParentColor = True
        sStyle.Caption.Layout = sclLeft
        sStyle.Caption.MaxWidth = 0
        sStyle.Caption.Font.Charset = DEFAULT_CHARSET
        sStyle.Caption.Font.Color = clWindowText
        sStyle.Caption.Font.Height = -11
        sStyle.Caption.Font.Name = 'MS Sans Serif'
        sStyle.Caption.Font.Style = []
        sStyle.Caption.Active = False
        ShowFocus = True
        Caption = 'Show application icon'
        ImgChecked = 0
        ImgUnchecked = 0
        ImgCheckedHot = 0
        ImgUncheckedHot = 0
        MultiLine = True
        TabOrder = 1
        OnChange = sCheckBox18Change
      end
      object sPanel5: TsPanel
        Left = 9
        Top = 128
        Width = 138
        Height = 3
        TabOrder = 2
        sStyle.GroupIndex = 0
        sStyle.SkinSection = 'TsPanel'
        sStyle.Painting.Color = clBtnFace
      end
      object sPanel6: TsPanel
        Left = 9
        Top = 68
        Width = 139
        Height = 18
        TabOrder = 3
        sStyle.GroupIndex = 0
        sStyle.SkinSection = 'TsPanel'
        sStyle.Painting.Color = clBtnFace
        Caption = 'Caption alignment :'
      end
      object ComboBox2: TComboBox
        Left = 13
        Top = 96
        Width = 131
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 4
        OnChange = ComboBox2Change
        Items.Strings = (
          'taLeftJustify'
          'taCenter'
          'taRightJustify')
      end
    end
  end
  object sButton1: TsButton
    Left = 212
    Top = 172
    Width = 75
    Height = 25
    BevelWidth = 1
    sStyle.Effects.Shadow.DontUse = False
    sStyle.GroupIndex = 0
    sStyle.SkinSection = 'TsButton'
    sStyle.Painting.Color = clBtnFace
    sStyle.Background.Gradient.Data = 
      '13221560;16777215;49;0;0;16777215;9996156;34;0;0;9996156;1677721' +
      '5;16;0;0;16777215;16777215;0;0;0'
    sStyle.HotStyle.HotBackground.Gradient.Data = 
      '16777215;9996156;6;0;0;9996156;16777215;47;0;0;16777215;14076606' +
      ';28;0;0;14076606;14275020;18;0;0;14275020;14275020;0;0;0'
    sStyle.HotStyle.HotPainting.Transparency = 0
    sStyle.BtnEffects.MaskedBorders.Predefined = pdBorder2
    sStyle.BtnEffects.MaskedBorders.Enabled = False
    Caption = 'sButton1'
    TabOrder = 1
  end
  object sButton2: TsButton
    Left = 288
    Top = 172
    Width = 75
    Height = 25
    BevelWidth = 1
    sStyle.Effects.Shadow.DontUse = False
    sStyle.GroupIndex = 0
    sStyle.SkinSection = 'TsButton'
    sStyle.Painting.Color = clBtnFace
    sStyle.Background.Gradient.Data = 
      '13221560;16777215;49;0;0;16777215;9996156;34;0;0;9996156;1677721' +
      '5;16;0;0;16777215;16777215;0;0;0'
    sStyle.HotStyle.HotBackground.Gradient.Data = 
      '16777215;9996156;6;0;0;9996156;16777215;47;0;0;16777215;14076606' +
      ';28;0;0;14076606;14275020;18;0;0;14275020;14275020;0;0;0'
    sStyle.HotStyle.HotPainting.Transparency = 0
    sStyle.BtnEffects.MaskedBorders.Predefined = pdBorder2
    sStyle.BtnEffects.MaskedBorders.Enabled = False
    Caption = 'sButton2'
    TabOrder = 2
  end
  object sButton3: TsButton
    Left = 364
    Top = 172
    Width = 75
    Height = 25
    BevelWidth = 1
    sStyle.Effects.Shadow.DontUse = False
    sStyle.GroupIndex = 0
    sStyle.SkinSection = 'TsButton'
    sStyle.Painting.Color = clBtnFace
    sStyle.Background.Gradient.Data = 
      '13221560;16777215;49;0;0;16777215;9996156;34;0;0;9996156;1677721' +
      '5;16;0;0;16777215;16777215;0;0;0'
    sStyle.HotStyle.HotBackground.Gradient.Data = 
      '16777215;9996156;6;0;0;9996156;16777215;47;0;0;16777215;14076606' +
      ';28;0;0;14076606;14275020;18;0;0;14275020;14275020;0;0;0'
    sStyle.HotStyle.HotPainting.Transparency = 0
    sStyle.BtnEffects.MaskedBorders.Predefined = pdBorder2
    sStyle.BtnEffects.MaskedBorders.Enabled = False
    Caption = 'sButton3'
    TabOrder = 3
  end
  object sButton5: TsButton
    Left = 223
    Top = 90
    Width = 212
    Height = 23
    sStyle.GroupIndex = 0
    sStyle.SkinSection = 'TsButton'
    sStyle.Painting.Bevel = cbNone
    sStyle.Painting.Transparency = 100
    sStyle.Painting.Color = clBtnFace
    sStyle.Background.Gradient.Data = 
      '13221560;16777215;49;0;0;16777215;9996156;34;0;0;9996156;1677721' +
      '5;16;0;0;16777215;16777215;0;0;0'
    sStyle.Background.Gradient.Percent = 0
    sStyle.HotStyle.HotBackground.Gradient.Data = '0;16777215;49;0;0;16777215;0;49;0;0;0;0;0;0;0'
    sStyle.HotStyle.HotPainting.Color = clYellow
    sStyle.HotStyle.HotPainting.FontColor = clNavy
    sStyle.HotStyle.HotPainting.FontStyle = [fsUnderline]
    sStyle.HotStyle.HotPainting.Transparency = 75
    sStyle.HotStyle.HotPainting.Bevel = cbNone
    sStyle.HotStyle.HotPainting.BevelWidth = 4
    sStyle.BtnEffects.Fading.Iterations = 12
    sStyle.BtnEffects.MaskedBorders.Predefined = pdBorder2
    sStyle.BtnEffects.MaskedBorders.Enabled = False
    Caption = 'support@alphaskins.com'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    OnClick = sButton5Click
    TabOrder = 4
  end
  object sButton6: TsButton
    Left = 223
    Top = 115
    Width = 212
    Height = 23
    sStyle.GroupIndex = 0
    sStyle.SkinSection = 'TsButton'
    sStyle.Painting.Bevel = cbNone
    sStyle.Painting.Transparency = 100
    sStyle.Painting.Color = clBtnFace
    sStyle.Background.Gradient.Data = 
      '13221560;16777215;49;0;0;16777215;9996156;34;0;0;9996156;1677721' +
      '5;16;0;0;16777215;16777215;0;0;0'
    sStyle.Background.Gradient.Percent = 0
    sStyle.HotStyle.HotBackground.Gradient.Data = '0;16777215;49;0;0;16777215;0;49;0;0;0;0;0;0;0'
    sStyle.HotStyle.HotPainting.Color = clYellow
    sStyle.HotStyle.HotPainting.FontColor = clNavy
    sStyle.HotStyle.HotPainting.FontStyle = [fsUnderline]
    sStyle.HotStyle.HotPainting.Transparency = 75
    sStyle.HotStyle.HotPainting.Bevel = cbNone
    sStyle.HotStyle.HotPainting.BevelWidth = 4
    sStyle.BtnEffects.Fading.Iterations = 12
    sStyle.BtnEffects.MaskedBorders.Predefined = pdBorder2
    sStyle.BtnEffects.MaskedBorders.Enabled = False
    Caption = 'http://www.alphaskins.com'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    OnClick = sButton6Click
    TabOrder = 5
  end
  object sButton4: TsBitBtn
    Left = 281
    Top = 229
    Width = 100
    Height = 53
    BevelWidth = 1
    sStyle.Effects.Shadow.DontUse = False
    sStyle.SoftControl = False
    sStyle.GroupIndex = 0
    sStyle.SkinSection = 'TsButton_BIG'
    sStyle.Painting.Transparency = 100
    sStyle.Painting.Color = clBtnFace
    sStyle.Background.Gradient.Data = 
      '7903644;16777215;22;0;0;16777215;7974069;38;0;0;7974069;5664888;' +
      '39;0;0;5664888;5664888;0;0;0'
    sStyle.HotStyle.HotBackground.Gradient.Data = 
      '8421504;16777215;46;0;0;16777215;16777215;17;0;0;16777215;842150' +
      '4;23;0;0;8421504;8388608;13;0;0;8388608;8388608;0;0;0'
    sStyle.HotStyle.HotPainting.Transparency = 50
    sStyle.HotStyle.HotPainting.BevelWidth = 8
    sStyle.BtnEffects.MaskedBorders.Predefined = pdBorder6
    sStyle.BtnEffects.MaskedBorders.Enabled = False
    Caption = 'Exit from program'
    Margin = 12
    OnClick = sButton4Click
    Cancel = True
    FocusMargin = 3
    TabOrder = 6
    Glyph.Data = {
      360C0000424D360C000000000000360000002800000020000000200000000100
      180000000000000C000000000000000000000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE3E3E3CCCC
      CCCCCC99CC9966CC9966CC9966CC9966CC9999F0CAA6DDDDDDFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEAEAEAF0CAA6CC99669966
      66996633996633996633996633996633996633996633CC9966CCCC99E3E3E3FF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD7D7D7CC99999966339966339966
      33996633996633996633996633996633996633996633996633996633CC9966F0
      CAA6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD7D7D7CC99669966339966339966339966
      3399663399663399663399663399663399663399663399663399663399663399
      6633CCCC99F1F1F1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFD7D7D7CC99669966339966339966339966339966
      3399663399663399663399663399663399663399663399663399663399663399
      6633996633C0C0C0F1F1F1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFEAEAEACC99669966339966339966339966339966339966
      33CC9966CCCC99C0C0C0F0CAA6CCCC99CC996699666699663399663399663399
      6633996633CC9966D7D7D7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFCCCC99996633996633996633996633996633CC9966CCCC
      99E3E3E3FFFFFFFFFFFFFFFFFFFFFFFFF1F1F1F0CAA6CC996699663399663399
      6633996633996633CC9999F1F1F1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFEAEAEACC9966996633996633996633996633CC9966D7D7D7F1F1
      F1EAEAEAF0CAA6CCCC99CC9999F0CAA6E3E3E3FFFFFFE3E3E3CC999999663399
      6633996633996633996633D7D7D7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFCCCCCC996633996633996633996633996633F0CAA6FFFFFFDDDD
      DDCC9999996666996633996633996633CC9966CCCCCCFFFFFFE3E3E3CC996699
      6633996633996633996633CC9999F1F1F1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFCCCC99996633996633996633996633CC9966F1F1F1EAEAEACC99
      99996633996633996633996633996633996633CC9966DDDDDDFFFFFFCCCC9999
      6633996633996633996633CC9966E3E3E3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFCC9999996633996633996633996633CCCC99FFFFFFCCCCCC9966
      66996633996633996633996633996633996633996633CCCC99F1F1F1D7D7D799
      9933996633996633996633999966DDDDDDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFF1F1F1CC9966996633996633996633996633CCCCCCFFFFFFCC99999966
      33996633996633996633996633996633996633996633CC9966E3E3E3F1F1F199
      9966996633996633996633996633DDDDDDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFF1F1F1CC9966996633996633996633996633D7D7D7FFFFFFCC99999966
      33996633996633CCCC99CCCCCC999966996633996633CC9966DDDDDDF1F1F199
      9966996633996633996633996633D7D7D7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFF1F1F1CC9966996633996633996633996633CCCCCCFFFFFFCCCC999966
      33996633996633DDDDDDF1F1F1CC9966996633996633CC9999EAEAEAEAEAEA99
      9966996633996633996633996633DDDDDDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFCC9999996633996633996633996633CC9999F1F1F1DDDDDDCC99
      66996633996633DDDDDDF1F1F1999966996633996633F0CAA6FFFFFFCCCCCC99
      6633996633996633996633CC9966E3E3E3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFCCCC99996633996633996633996633CC9966E3E3E3F1F1F1CCCC
      99996666996633DDDDDDF1F1F1CC9966996633CC9999EAEAEAF1F1F1CC999999
      6633996633996633996633CC9966EAEAEAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFDDDDDD996666996633996633996633996633CC9999F1F1F1F1F1
      F1F0CAA6996633DDDDDDF1F1F1CC9966CC9999EAEAEAFFFFFFF0CAA699663399
      6633996633996633996633CCCC99FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFF1F1F1CC9999996633996633996633996633996633CCCC99EAEA
      EAF1F1F1CC9966DDDDDDF1F1F1CC9966CCCCCCFFFFFFCCCC9999996699663399
      6633996633996633CC9966E3E3E3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFCCCCCC999966996633996633996633996633996633CC99
      66CCCC99999966DDDDDDF1F1F1CC9966CC9999CC999999663399663399663399
      6633996633996633CCCC99FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFF1F1F1CCCC999966339966339966339966339966339966
      33996633996633DDDDDDF1F1F1CC996699663399663399663399663399663399
      6633996633CC9999E3E3E3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFEAEAEACC99999966339966339966339966339966
      33996633996633DDDDDDF1F1F1CC996699663399663399663399663399663399
      6633CC9966DDDDDDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEAEAEACCCC999966669966339966339966
      33996633996633CC9966CC9966996633996633996633996633996633996633CC
      9966DDDDDDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1F1F1F0CAA6CC99669966339966
      33996633996633996633996633996633996633996633996633CC9966CCCC99E3
      E3E3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE3E3E3F0CAA6CC99
      99CC9966996633996633996633996633CC9966CC9966CCCC99DDDDDDF1F1F1FF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEAEA
      EADDDDDDD7D7D7F0CAA6CCCCCCD7D7D7DDDDDDEAEAEAFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
    Layout = blGlyphLeft
    Spacing = 3
  end
  object sPanel1: TsPanel
    Left = 6
    Top = 392
    Width = 436
    Height = 52
    TabOrder = 7
    sStyle.GroupIndex = 0
    sStyle.SkinSection = 'TsPanel'
    sStyle.Painting.Color = clBtnFace
    Caption = 'sPanel1'
  end
  object sPanel4: TsPanel
    Left = 224
    Top = 27
    Width = 213
    Height = 58
    TabOrder = 8
    sStyle.GroupIndex = 0
    sStyle.SkinSection = 'TsPanel'
    sStyle.Painting.Color = clBtnFace
    Caption = ' '
    object Label1: TLabel
      Left = 39
      Top = 12
      Width = 79
      Height = 13
      Caption = 'Available skins : '
      Transparent = True
    end
    object ComboBox1: TComboBox
      Left = 37
      Top = 27
      Width = 145
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
      OnChange = ComboBox1Change
    end
  end
  object sEdit1: TsEdit
    Left = 306
    Top = 146
    Width = 121
    Height = 21
    TabOrder = 9
    Text = 'sEdit1'
    sStyle.GroupIndex = 0
    sStyle.SkinSection = 'TsEdit'
    sStyle.Painting.ColorBorderTop = clBtnHighlight
    sStyle.Caption.Layout = sclLeft
    sStyle.Caption.MaxWidth = 0
    sStyle.Caption.Font.Charset = DEFAULT_CHARSET
    sStyle.Caption.Font.Color = clWindowText
    sStyle.Caption.Font.Height = -11
    sStyle.Caption.Font.Name = 'MS Sans Serif'
    sStyle.Caption.Font.Style = []
    sStyle.Caption.Text = 'Labeled edit'
    sStyle.Caption.Active = True
  end
  object sScrollBar1: TsScrollBar
    Left = 282
    Top = 205
    Width = 121
    Height = 16
    LargeChange = 10
    PageSize = 0
    TabOrder = 11
  end
  object sSkinManager1: TsSkinManager
    InternalSkins = <
      item
        Name = 'BlueGlass (internal)'
        GeneralData = <
          item
            SectionName = 'TsSpinEdit'
            ParentClassName = 'TsEdit'
            PaintingColor = clWhite
            PaintingBevel = cbRaisedSoft
            PaintingBevelWidth = 1
            ShadowBlur = 6
            ShadowColor = clBlack
            ShadowDontUse = False
            ShadowEnabled = False
            ReservedBoolean = False
            ShadowOffset = 3
            ShadowTransparency = 60
            FontColor = '0 -1 -1 -1 -1'
            HotFontColor = '0 -1 -1 -1 -1'
            PaintingTransparency = 0
            GradientPercent = 0
            GradientData = ' '
            ImagePercent = 0
            ShowFocus = False
            FadingEnabled = False
            FadingIntervalIn = 5
            FadingIntervalOut = 5
            FadingIterations = 5
            HotPaintingColor = clWhite
            HotPaintingTransparency = 0
            HotPaintingBevel = cbNone
            HotPaintingBevelWidth = 2
            HotGradientPercent = 0
            HotGradientData = ' '
            HotImagePercent = 0
            PaintingColorBorderTop = 7422976
            PaintingColorBorderBottom = 7422976
            SelectionBorderBevel = ebRaised
            SelectionBorderWidth = 1
            SelectionColor = clWhite
          end
          item
            SectionName = 'TsMemo'
            ParentClassName = 'TsEdit'
            PaintingColor = clWhite
            PaintingBevel = cbRaisedSoft
            PaintingBevelWidth = 1
            ShadowBlur = 6
            ShadowColor = clBlack
            ShadowDontUse = False
            ShadowEnabled = False
            ReservedBoolean = False
            ShadowOffset = 3
            ShadowTransparency = 60
            FontColor = '0 -1 -1 -1 -1'
            HotFontColor = '0 -1 -1 -1 -1'
            PaintingTransparency = 0
            GradientPercent = 0
            GradientData = ' '
            ImagePercent = 0
            ShowFocus = False
            FadingEnabled = False
            FadingIntervalIn = 5
            FadingIntervalOut = 5
            FadingIterations = 5
            HotPaintingColor = clWhite
            HotPaintingTransparency = 0
            HotPaintingBevel = cbNone
            HotPaintingBevelWidth = 2
            HotGradientPercent = 0
            HotGradientData = ' '
            HotImagePercent = 0
            PaintingColorBorderTop = 7422976
            PaintingColorBorderBottom = 7422976
            SelectionBorderBevel = ebRaised
            SelectionBorderWidth = 1
            SelectionColor = clWhite
          end
          item
            SectionName = 'TsCurrencyEdit'
            ParentClassName = 'TsEdit'
            PaintingColor = clWhite
            PaintingBevel = cbRaisedSoft
            PaintingBevelWidth = 1
            ShadowBlur = 6
            ShadowColor = clBlack
            ShadowDontUse = False
            ShadowEnabled = False
            ReservedBoolean = False
            ShadowOffset = 3
            ShadowTransparency = 60
            FontColor = '0 -1 -1 -1 -1'
            HotFontColor = '0 -1 -1 -1 -1'
            PaintingTransparency = 0
            GradientPercent = 0
            GradientData = ' '
            ImagePercent = 0
            ShowFocus = False
            FadingEnabled = False
            FadingIntervalIn = 5
            FadingIntervalOut = 5
            FadingIterations = 5
            HotPaintingColor = clWhite
            HotPaintingTransparency = 0
            HotPaintingBevel = cbNone
            HotPaintingBevelWidth = 2
            HotGradientPercent = 0
            HotGradientData = ' '
            HotImagePercent = 0
            PaintingColorBorderTop = 7422976
            PaintingColorBorderBottom = 7422976
            SelectionBorderBevel = ebRaised
            SelectionBorderWidth = 1
            SelectionColor = clWhite
          end
          item
            SectionName = 'TsMaskEdit'
            ParentClassName = 'TsEdit'
            PaintingColor = clWhite
            PaintingBevel = cbRaisedSoft
            PaintingBevelWidth = 1
            ShadowBlur = 6
            ShadowColor = clBlack
            ShadowDontUse = False
            ShadowEnabled = False
            ReservedBoolean = False
            ShadowOffset = 3
            ShadowTransparency = 60
            FontColor = '0 -1 -1 -1 -1'
            HotFontColor = '0 -1 -1 -1 -1'
            PaintingTransparency = 0
            GradientPercent = 0
            GradientData = ' '
            ImagePercent = 0
            ShowFocus = False
            FadingEnabled = False
            FadingIntervalIn = 5
            FadingIntervalOut = 5
            FadingIterations = 5
            HotPaintingColor = clWhite
            HotPaintingTransparency = 0
            HotPaintingBevel = cbNone
            HotPaintingBevelWidth = 2
            HotGradientPercent = 0
            HotGradientData = ' '
            HotImagePercent = 0
            PaintingColorBorderTop = 7422976
            PaintingColorBorderBottom = 7422976
            SelectionBorderBevel = ebRaised
            SelectionBorderWidth = 1
            SelectionColor = clWhite
          end
          item
            SectionName = 'TsFileNameEdit'
            ParentClassName = 'TsEdit'
            PaintingColor = clWhite
            PaintingBevel = cbRaisedSoft
            PaintingBevelWidth = 1
            ShadowBlur = 6
            ShadowColor = clBlack
            ShadowDontUse = False
            ShadowEnabled = False
            ReservedBoolean = False
            ShadowOffset = 3
            ShadowTransparency = 60
            FontColor = '0 -1 -1 -1 -1'
            HotFontColor = '0 -1 -1 -1 -1'
            PaintingTransparency = 0
            GradientPercent = 0
            GradientData = ' '
            ImagePercent = 0
            ShowFocus = False
            FadingEnabled = False
            FadingIntervalIn = 5
            FadingIntervalOut = 5
            FadingIterations = 5
            HotPaintingColor = clWhite
            HotPaintingTransparency = 0
            HotPaintingBevel = cbNone
            HotPaintingBevelWidth = 2
            HotGradientPercent = 0
            HotGradientData = ' '
            HotImagePercent = 0
            PaintingColorBorderTop = 7422976
            PaintingColorBorderBottom = 7422976
            SelectionBorderBevel = ebRaised
            SelectionBorderWidth = 1
            SelectionColor = clWhite
          end
          item
            SectionName = 'TsDateEdit'
            ParentClassName = 'TsEdit'
            PaintingColor = clWhite
            PaintingBevel = cbRaisedSoft
            PaintingBevelWidth = 1
            ShadowBlur = 6
            ShadowColor = clBlack
            ShadowDontUse = False
            ShadowEnabled = False
            ReservedBoolean = False
            ShadowOffset = 3
            ShadowTransparency = 60
            FontColor = '0 -1 -1 -1 -1'
            HotFontColor = '0 -1 -1 -1 -1'
            PaintingTransparency = 0
            GradientPercent = 0
            GradientData = ' '
            ImagePercent = 0
            ShowFocus = False
            FadingEnabled = False
            FadingIntervalIn = 5
            FadingIntervalOut = 5
            FadingIterations = 5
            HotPaintingColor = clWhite
            HotPaintingTransparency = 0
            HotPaintingBevel = cbNone
            HotPaintingBevelWidth = 2
            HotGradientPercent = 0
            HotGradientData = ' '
            HotImagePercent = 0
            PaintingColorBorderTop = 7422976
            PaintingColorBorderBottom = 7422976
            SelectionBorderBevel = ebRaised
            SelectionBorderWidth = 1
            SelectionColor = clWhite
          end
          item
            SectionName = 'TsDirectoryEdit'
            ParentClassName = 'TsEdit'
            PaintingColor = clWhite
            PaintingBevel = cbRaisedSoft
            PaintingBevelWidth = 1
            ShadowBlur = 6
            ShadowColor = clBlack
            ShadowDontUse = False
            ShadowEnabled = False
            ReservedBoolean = False
            ShadowOffset = 3
            ShadowTransparency = 60
            FontColor = '0 -1 -1 -1 -1'
            HotFontColor = '0 -1 -1 -1 -1'
            PaintingTransparency = 0
            GradientPercent = 0
            GradientData = ' '
            ImagePercent = 0
            ShowFocus = False
            FadingEnabled = False
            FadingIntervalIn = 5
            FadingIntervalOut = 5
            FadingIterations = 5
            HotPaintingColor = clWhite
            HotPaintingTransparency = 0
            HotPaintingBevel = cbNone
            HotPaintingBevelWidth = 2
            HotGradientPercent = 0
            HotGradientData = ' '
            HotImagePercent = 0
            PaintingColorBorderTop = 7422976
            PaintingColorBorderBottom = 7422976
            SelectionBorderBevel = ebRaised
            SelectionBorderWidth = 1
            SelectionColor = clWhite
          end
          item
            SectionName = 'TsListBox'
            ParentClassName = 'TsEdit'
            PaintingColor = clWhite
            PaintingBevel = cbRaisedSoft
            PaintingBevelWidth = 1
            ShadowBlur = 6
            ShadowColor = clBlack
            ShadowDontUse = False
            ShadowEnabled = False
            ReservedBoolean = False
            ShadowOffset = 3
            ShadowTransparency = 60
            FontColor = '0 -1 -1 -1 -1'
            HotFontColor = '0 -1 -1 -1 -1'
            PaintingTransparency = 0
            GradientPercent = 0
            GradientData = ' '
            ImagePercent = 0
            ShowFocus = False
            FadingEnabled = False
            FadingIntervalIn = 5
            FadingIntervalOut = 5
            FadingIterations = 5
            HotPaintingColor = clWhite
            HotPaintingTransparency = 0
            HotPaintingBevel = cbNone
            HotPaintingBevelWidth = 2
            HotGradientPercent = 0
            HotGradientData = ' '
            HotImagePercent = 0
            PaintingColorBorderTop = 7422976
            PaintingColorBorderBottom = 7422976
            SelectionBorderBevel = ebRaised
            SelectionBorderWidth = 1
            SelectionColor = clWhite
          end
          item
            SectionName = 'TsColorSelect'
            ParentClassName = 'TsButton'
            PaintingColor = clWhite
            PaintingBevel = cbNone
            PaintingBevelWidth = 2
            ShadowBlur = 6
            ShadowColor = clBlack
            ShadowDontUse = False
            ShadowEnabled = False
            ReservedBoolean = False
            ShadowOffset = 3
            ShadowTransparency = 60
            FontColor = '0 -1 -1 -1 -1'
            HotFontColor = '16774621 7954485 7954485 -1 -1'
            PaintingTransparency = 50
            GradientPercent = 100
            GradientData = '10383683;16437637;99;0;0;16437637;16437637;0;0;0'
            ImagePercent = 0
            ShowFocus = True
            FadingEnabled = True
            FadingIntervalIn = 5
            FadingIntervalOut = 5
            FadingIterations = 15
            HotPaintingColor = clWhite
            HotPaintingTransparency = 0
            HotPaintingBevel = cbNone
            HotPaintingBevelWidth = 2
            HotGradientPercent = 100
            HotGradientData = '16371206;5648131;99;0;0;5648131;5648131;0;0;0'
            HotImagePercent = 0
            PaintingColorBorderTop = clBlack
            PaintingColorBorderBottom = clBlack
            SelectionBorderBevel = ebLowered
            SelectionBorderWidth = 2
            SelectionColor = clWhite
          end
          item
            SectionName = 'TsCalcEdit'
            ParentClassName = 'TsEdit'
            PaintingColor = clWhite
            PaintingBevel = cbRaisedSoft
            PaintingBevelWidth = 1
            ShadowBlur = 6
            ShadowColor = clBlack
            ShadowDontUse = False
            ShadowEnabled = False
            ReservedBoolean = False
            ShadowOffset = 3
            ShadowTransparency = 60
            FontColor = '0 -1 -1 -1 -1'
            HotFontColor = '0 -1 -1 -1 -1'
            PaintingTransparency = 0
            GradientPercent = 0
            GradientData = ' '
            ImagePercent = 0
            ShowFocus = False
            FadingEnabled = False
            FadingIntervalIn = 5
            FadingIntervalOut = 5
            FadingIterations = 5
            HotPaintingColor = clWhite
            HotPaintingTransparency = 0
            HotPaintingBevel = cbNone
            HotPaintingBevelWidth = 2
            HotGradientPercent = 0
            HotGradientData = ' '
            HotImagePercent = 0
            PaintingColorBorderTop = 7422976
            PaintingColorBorderBottom = 7422976
            SelectionBorderBevel = ebRaised
            SelectionBorderWidth = 1
            SelectionColor = clWhite
          end
          item
            SectionName = 'TsEditButton'
            PaintingColor = clWhite
            PaintingBevel = cbNone
            PaintingBevelWidth = 2
            ShadowBlur = 6
            ShadowColor = clBlack
            ShadowDontUse = False
            ShadowEnabled = False
            ReservedBoolean = False
            ShadowOffset = 3
            ShadowTransparency = 60
            FontColor = '0 -1 -1 -1 -1'
            HotFontColor = '0 -1 -1 -1 -1'
            PaintingTransparency = 0
            GradientPercent = 0
            GradientData = ' '
            ImagePercent = 0
            ShowFocus = False
            FadingEnabled = False
            FadingIntervalIn = 5
            FadingIntervalOut = 5
            FadingIterations = 5
            HotPaintingColor = clWhite
            HotPaintingTransparency = 0
            HotPaintingBevel = cbNone
            HotPaintingBevelWidth = 2
            HotGradientPercent = 0
            HotGradientData = ' '
            HotImagePercent = 0
            PaintingColorBorderTop = clBlack
            PaintingColorBorderBottom = clBlack
            SelectionBorderBevel = ebLowered
            SelectionBorderWidth = 2
            SelectionColor = clWhite
          end
          item
            SectionName = 'TsBitBtn'
            ParentClassName = 'TsButton'
            PaintingColor = clWhite
            PaintingBevel = cbNone
            PaintingBevelWidth = 2
            ShadowBlur = 6
            ShadowColor = clBlack
            ShadowDontUse = False
            ShadowEnabled = False
            ReservedBoolean = False
            ShadowOffset = 3
            ShadowTransparency = 60
            FontColor = '0 -1 -1 -1 -1'
            HotFontColor = '16774621 7954485 7954485 -1 -1'
            PaintingTransparency = 50
            GradientPercent = 100
            GradientData = '10383683;16437637;99;0;0;16437637;16437637;0;0;0'
            ImagePercent = 0
            ShowFocus = True
            FadingEnabled = True
            FadingIntervalIn = 5
            FadingIntervalOut = 5
            FadingIterations = 15
            HotPaintingColor = clWhite
            HotPaintingTransparency = 0
            HotPaintingBevel = cbNone
            HotPaintingBevelWidth = 2
            HotGradientPercent = 100
            HotGradientData = '16371206;5648131;99;0;0;5648131;5648131;0;0;0'
            HotImagePercent = 0
            PaintingColorBorderTop = clBlack
            PaintingColorBorderBottom = clBlack
            SelectionBorderBevel = ebLowered
            SelectionBorderWidth = 2
            SelectionColor = clWhite
          end
          item
            SectionName = 'TsComboEdit'
            ParentClassName = 'TsEdit'
            PaintingColor = clWhite
            PaintingBevel = cbRaisedSoft
            PaintingBevelWidth = 1
            ShadowBlur = 6
            ShadowColor = clBlack
            ShadowDontUse = False
            ShadowEnabled = False
            ReservedBoolean = False
            ShadowOffset = 3
            ShadowTransparency = 60
            FontColor = '0 -1 -1 -1 -1'
            HotFontColor = '0 -1 -1 -1 -1'
            PaintingTransparency = 0
            GradientPercent = 0
            GradientData = ' '
            ImagePercent = 0
            ShowFocus = False
            FadingEnabled = False
            FadingIntervalIn = 5
            FadingIntervalOut = 5
            FadingIterations = 5
            HotPaintingColor = clWhite
            HotPaintingTransparency = 0
            HotPaintingBevel = cbNone
            HotPaintingBevelWidth = 2
            HotGradientPercent = 0
            HotGradientData = ' '
            HotImagePercent = 0
            PaintingColorBorderTop = 7422976
            PaintingColorBorderBottom = 7422976
            SelectionBorderBevel = ebRaised
            SelectionBorderWidth = 1
            SelectionColor = clWhite
          end
          item
            SectionName = 'TsTimerSpeedButton'
            ParentClassName = 'TsSpeedButton'
            PaintingColor = clWhite
            PaintingBevel = cbNone
            PaintingBevelWidth = 2
            ShadowBlur = 6
            ShadowColor = clBlack
            ShadowDontUse = False
            ShadowEnabled = False
            ReservedBoolean = False
            ShadowOffset = 3
            ShadowTransparency = 60
            FontColor = '3023890 -1 -1 -1 -1'
            HotFontColor = '16774621 7954485 7954485 -1 -1'
            PaintingTransparency = 100
            GradientPercent = 0
            GradientData = ' '
            ImagePercent = 0
            ShowFocus = False
            FadingEnabled = True
            FadingIntervalIn = 5
            FadingIntervalOut = 5
            FadingIterations = 15
            HotPaintingColor = 16639645
            HotPaintingTransparency = 50
            HotPaintingBevel = cbNone
            HotPaintingBevelWidth = 2
            HotGradientPercent = 100
            HotGradientData = 
              '15786450;15983053;3;0;0;15983053;9204561;12;0;0;9204561;15912247' +
              ';84;0;0;15912247;15912247;0;0;0'
            HotImagePercent = 0
            PaintingColorBorderTop = clBlack
            PaintingColorBorderBottom = clBlack
            SelectionBorderBevel = ebLowered
            SelectionBorderWidth = 2
            SelectionColor = clWhite
          end
          item
            SectionName = 'TsDBNavigator'
            ParentClassName = 'TsToolBar'
            PaintingColor = 14797990
            PaintingBevel = cbRaisedSoft
            PaintingBevelWidth = 2
            ShadowBlur = 6
            ShadowColor = clBlack
            ShadowDontUse = False
            ShadowEnabled = False
            ReservedBoolean = False
            ShadowOffset = 3
            ShadowTransparency = 60
            FontColor = '0 -1 -1 -1 -1'
            HotFontColor = '0 -1 -1 -1 -1'
            PaintingTransparency = 50
            GradientPercent = 100
            GradientData = '9527339;16769695;99;0;0;16769695;16769695;0;0;0'
            ImagePercent = 0
            ShowFocus = False
            FadingEnabled = False
            FadingIntervalIn = 5
            FadingIntervalOut = 5
            FadingIterations = 5
            HotPaintingColor = clWhite
            HotPaintingTransparency = 0
            HotPaintingBevel = cbNone
            HotPaintingBevelWidth = 2
            HotGradientPercent = 0
            HotGradientData = ' '
            HotImagePercent = 0
            PaintingColorBorderTop = clBlack
            PaintingColorBorderBottom = clBlack
            SelectionBorderBevel = ebLowered
            SelectionBorderWidth = 2
            SelectionColor = clWhite
          end
          item
            SectionName = 'TsNavButton'
            ParentClassName = 'TsToolButton'
            PaintingColor = clWhite
            PaintingBevel = cbNone
            PaintingBevelWidth = 2
            ShadowBlur = 6
            ShadowColor = clBlack
            ShadowDontUse = False
            ShadowEnabled = False
            ReservedBoolean = False
            ShadowOffset = 3
            ShadowTransparency = 60
            FontColor = '3023890 -1 -1 -1 -1'
            HotFontColor = '16774621 -1 -1 7099695 7099695'
            PaintingTransparency = 100
            GradientPercent = 0
            GradientData = ' '
            ImagePercent = 0
            ShowFocus = False
            FadingEnabled = True
            FadingIntervalIn = 5
            FadingIntervalOut = 5
            FadingIterations = 20
            HotPaintingColor = clWhite
            HotPaintingTransparency = 0
            HotPaintingBevel = cbNone
            HotPaintingBevelWidth = 2
            HotGradientPercent = 100
            HotGradientData = 
              '15786450;15983053;3;0;0;15983053;9204561;12;0;0;9204561;15912247' +
              ';84;0;0;15912247;15912247;0;0;0'
            HotImagePercent = 0
            PaintingColorBorderTop = clBlack
            PaintingColorBorderBottom = clBlack
            SelectionBorderBevel = ebLowered
            SelectionBorderWidth = 2
            SelectionColor = clWhite
          end
          item
            SectionName = 'TsDBEdit'
            ParentClassName = 'TsEdit'
            PaintingColor = clWhite
            PaintingBevel = cbRaisedSoft
            PaintingBevelWidth = 1
            ShadowBlur = 6
            ShadowColor = clBlack
            ShadowDontUse = False
            ShadowEnabled = False
            ReservedBoolean = False
            ShadowOffset = 3
            ShadowTransparency = 60
            FontColor = '0 -1 -1 -1 -1'
            HotFontColor = '0 -1 -1 -1 -1'
            PaintingTransparency = 0
            GradientPercent = 0
            GradientData = ' '
            ImagePercent = 0
            ShowFocus = False
            FadingEnabled = False
            FadingIntervalIn = 5
            FadingIntervalOut = 5
            FadingIterations = 5
            HotPaintingColor = clWhite
            HotPaintingTransparency = 0
            HotPaintingBevel = cbNone
            HotPaintingBevelWidth = 2
            HotGradientPercent = 0
            HotGradientData = ' '
            HotImagePercent = 0
            PaintingColorBorderTop = 7422976
            PaintingColorBorderBottom = 7422976
            SelectionBorderBevel = ebRaised
            SelectionBorderWidth = 1
            SelectionColor = clWhite
          end
          item
            SectionName = 'TsDBMemo'
            ParentClassName = 'TsMemo'
            PaintingColor = clWhite
            PaintingBevel = cbRaisedSoft
            PaintingBevelWidth = 1
            ShadowBlur = 6
            ShadowColor = clBlack
            ShadowDontUse = False
            ShadowEnabled = False
            ReservedBoolean = False
            ShadowOffset = 3
            ShadowTransparency = 60
            FontColor = '0 -1 -1 -1 -1'
            HotFontColor = '0 -1 -1 -1 -1'
            PaintingTransparency = 0
            GradientPercent = 0
            GradientData = ' '
            ImagePercent = 0
            ShowFocus = False
            FadingEnabled = False
            FadingIntervalIn = 5
            FadingIntervalOut = 5
            FadingIterations = 5
            HotPaintingColor = clWhite
            HotPaintingTransparency = 0
            HotPaintingBevel = cbNone
            HotPaintingBevelWidth = 2
            HotGradientPercent = 0
            HotGradientData = ' '
            HotImagePercent = 0
            PaintingColorBorderTop = 7422976
            PaintingColorBorderBottom = 7422976
            SelectionBorderBevel = ebRaised
            SelectionBorderWidth = 1
            SelectionColor = clWhite
          end
          item
            SectionName = 'TsDBLookupComboBox'
            ParentClassName = 'TsComboBox'
            PaintingColor = clWhite
            PaintingBevel = cbRaisedSoft
            PaintingBevelWidth = 1
            ShadowBlur = 6
            ShadowColor = clBlack
            ShadowDontUse = False
            ShadowEnabled = False
            ReservedBoolean = False
            ShadowOffset = 3
            ShadowTransparency = 60
            FontColor = '0 -1 -1 -1 -1'
            HotFontColor = '0 -1 -1 -1 -1'
            PaintingTransparency = 0
            GradientPercent = 0
            GradientData = ' '
            ImagePercent = 0
            ShowFocus = False
            FadingEnabled = False
            FadingIntervalIn = 5
            FadingIntervalOut = 5
            FadingIterations = 5
            HotPaintingColor = clWhite
            HotPaintingTransparency = 0
            HotPaintingBevel = cbNone
            HotPaintingBevelWidth = 2
            HotGradientPercent = 0
            HotGradientData = ' '
            HotImagePercent = 0
            PaintingColorBorderTop = 7422976
            PaintingColorBorderBottom = 7422976
            SelectionBorderBevel = ebRaised
            SelectionBorderWidth = 1
            SelectionColor = clWhite
          end
          item
            SectionName = 'TsDBListBox'
            ParentClassName = 'TsListBox'
            PaintingColor = clWhite
            PaintingBevel = cbRaisedSoft
            PaintingBevelWidth = 1
            ShadowBlur = 6
            ShadowColor = clBlack
            ShadowDontUse = False
            ShadowEnabled = False
            ReservedBoolean = False
            ShadowOffset = 3
            ShadowTransparency = 60
            FontColor = '0 -1 -1 -1 -1'
            HotFontColor = '0 -1 -1 -1 -1'
            PaintingTransparency = 0
            GradientPercent = 0
            GradientData = ' '
            ImagePercent = 0
            ShowFocus = False
            FadingEnabled = False
            FadingIntervalIn = 5
            FadingIntervalOut = 5
            FadingIterations = 5
            HotPaintingColor = clWhite
            HotPaintingTransparency = 0
            HotPaintingBevel = cbNone
            HotPaintingBevelWidth = 2
            HotGradientPercent = 0
            HotGradientData = ' '
            HotImagePercent = 0
            PaintingColorBorderTop = 7422976
            PaintingColorBorderBottom = 7422976
            SelectionBorderBevel = ebRaised
            SelectionBorderWidth = 1
            SelectionColor = clWhite
          end
          item
            SectionName = 'TsDBLookupListBox'
            ParentClassName = 'TsListBox'
            PaintingColor = clWhite
            PaintingBevel = cbRaisedSoft
            PaintingBevelWidth = 1
            ShadowBlur = 6
            ShadowColor = clBlack
            ShadowDontUse = False
            ShadowEnabled = False
            ReservedBoolean = False
            ShadowOffset = 3
            ShadowTransparency = 60
            FontColor = '0 -1 -1 -1 -1'
            HotFontColor = '0 -1 -1 -1 -1'
            PaintingTransparency = 0
            GradientPercent = 0
            GradientData = ' '
            ImagePercent = 0
            ShowFocus = False
            FadingEnabled = False
            FadingIntervalIn = 5
            FadingIntervalOut = 5
            FadingIterations = 5
            HotPaintingColor = clWhite
            HotPaintingTransparency = 0
            HotPaintingBevel = cbNone
            HotPaintingBevelWidth = 2
            HotGradientPercent = 0
            HotGradientData = ' '
            HotImagePercent = 0
            PaintingColorBorderTop = 7422976
            PaintingColorBorderBottom = 7422976
            SelectionBorderBevel = ebRaised
            SelectionBorderWidth = 1
            SelectionColor = clWhite
          end
          item
            SectionName = 'TsDBCheckBox'
            ParentClassName = 'TsCheckBox'
            PaintingColor = clWhite
            PaintingBevel = cbRaisedSoft
            PaintingBevelWidth = 1
            ShadowBlur = 6
            ShadowColor = clBlack
            ShadowDontUse = False
            ShadowEnabled = False
            ReservedBoolean = False
            ShadowOffset = 3
            ShadowTransparency = 60
            FontColor = '0 -1 -1 -1 -1'
            HotFontColor = '0 -1 -1 -1 -1'
            PaintingTransparency = 0
            GradientPercent = 0
            GradientData = ' '
            ImagePercent = 0
            ShowFocus = False
            FadingEnabled = False
            FadingIntervalIn = 5
            FadingIntervalOut = 5
            FadingIterations = 5
            HotPaintingColor = clWhite
            HotPaintingTransparency = 0
            HotPaintingBevel = cbNone
            HotPaintingBevelWidth = 2
            HotGradientPercent = 0
            HotGradientData = ' '
            HotImagePercent = 0
            PaintingColorBorderTop = 7422976
            PaintingColorBorderBottom = 7422976
            SelectionBorderBevel = ebRaised
            SelectionBorderWidth = 1
            SelectionColor = clWhite
          end
          item
            SectionName = 'TsDBComboBox'
            ParentClassName = 'TsComboBox'
            PaintingColor = clWhite
            PaintingBevel = cbRaisedSoft
            PaintingBevelWidth = 1
            ShadowBlur = 6
            ShadowColor = clBlack
            ShadowDontUse = False
            ShadowEnabled = False
            ReservedBoolean = False
            ShadowOffset = 3
            ShadowTransparency = 60
            FontColor = '0 -1 -1 -1 -1'
            HotFontColor = '0 -1 -1 -1 -1'
            PaintingTransparency = 0
            GradientPercent = 0
            GradientData = ' '
            ImagePercent = 0
            ShowFocus = False
            FadingEnabled = False
            FadingIntervalIn = 5
            FadingIntervalOut = 5
            FadingIterations = 5
            HotPaintingColor = clWhite
            HotPaintingTransparency = 0
            HotPaintingBevel = cbNone
            HotPaintingBevelWidth = 2
            HotGradientPercent = 0
            HotGradientData = ' '
            HotImagePercent = 0
            PaintingColorBorderTop = 7422976
            PaintingColorBorderBottom = 7422976
            SelectionBorderBevel = ebRaised
            SelectionBorderWidth = 1
            SelectionColor = clWhite
          end
          item
            SectionName = 'TsScrollBox'
            ParentClassName = 'TsPanel_Lowered'
            PaintingColor = 15921906
            PaintingBevel = cbNone
            PaintingBevelWidth = 2
            ShadowBlur = 6
            ShadowColor = clBlack
            ShadowDontUse = False
            ShadowEnabled = False
            ReservedBoolean = False
            ShadowOffset = 3
            ShadowTransparency = 60
            FontColor = '0 -1 -1 -1 -1'
            HotFontColor = '0 -1 -1 -1 -1'
            PaintingTransparency = 100
            GradientPercent = 0
            GradientData = '14927761;16777215;99;0;0;16777215;16777215;0;0;0'
            ImagePercent = 0
            ShowFocus = False
            FadingEnabled = False
            FadingIntervalIn = 5
            FadingIntervalOut = 5
            FadingIterations = 5
            HotPaintingColor = clWhite
            HotPaintingTransparency = 0
            HotPaintingBevel = cbNone
            HotPaintingBevelWidth = 2
            HotGradientPercent = 0
            HotGradientData = ' '
            HotImagePercent = 0
            PaintingColorBorderTop = clBlack
            PaintingColorBorderBottom = clBlack
            SelectionBorderBevel = ebLowered
            SelectionBorderWidth = 2
            SelectionColor = clWhite
          end
          item
            SectionName = 'TsGrip'
            ParentClassName = 'TsPanel_Lowered'
            PaintingColor = 15921906
            PaintingBevel = cbNone
            PaintingBevelWidth = 2
            ShadowBlur = 6
            ShadowColor = clBlack
            ShadowDontUse = False
            ShadowEnabled = False
            ReservedBoolean = False
            ShadowOffset = 3
            ShadowTransparency = 60
            FontColor = '0 -1 -1 -1 -1'
            HotFontColor = '0 -1 -1 -1 -1'
            PaintingTransparency = 100
            GradientPercent = 0
            GradientData = '14927761;16777215;99;0;0;16777215;16777215;0;0;0'
            ImagePercent = 0
            ShowFocus = False
            FadingEnabled = False
            FadingIntervalIn = 5
            FadingIntervalOut = 5
            FadingIterations = 5
            HotPaintingColor = clWhite
            HotPaintingTransparency = 0
            HotPaintingBevel = cbNone
            HotPaintingBevelWidth = 2
            HotGradientPercent = 0
            HotGradientData = ' '
            HotImagePercent = 0
            PaintingColorBorderTop = clBlack
            PaintingColorBorderBottom = clBlack
            SelectionBorderBevel = ebLowered
            SelectionBorderWidth = 2
            SelectionColor = clWhite
          end
          item
            SectionName = 'TsDragBar'
            ParentClassName = 'TsButton'
            PaintingColor = 11629100
            PaintingBevel = cbNone
            PaintingBevelWidth = 2
            ShadowBlur = 6
            ShadowColor = clBlack
            ShadowDontUse = False
            ShadowEnabled = False
            ReservedBoolean = False
            ShadowOffset = 3
            ShadowTransparency = 60
            FontColor = '0 -1 -1 -1 -1'
            HotFontColor = '16774621 7954485 7954485 -1 -1'
            PaintingTransparency = 50
            GradientPercent = 100
            GradientData = '10383683;16437637;99;0;0;16437637;16437637;0;0;0'
            ImagePercent = 0
            ShowFocus = True
            FadingEnabled = True
            FadingIntervalIn = 5
            FadingIntervalOut = 5
            FadingIterations = 15
            HotPaintingColor = clWhite
            HotPaintingTransparency = 0
            HotPaintingBevel = cbNone
            HotPaintingBevelWidth = 2
            HotGradientPercent = 100
            HotGradientData = '16371206;5648131;99;0;0;5648131;5648131;0;0;0'
            HotImagePercent = 0
            PaintingColorBorderTop = clBlack
            PaintingColorBorderBottom = clBlack
            SelectionBorderBevel = ebLowered
            SelectionBorderWidth = 2
            SelectionColor = clWhite
          end
          item
            SectionName = 'CalcPanel'
            ParentClassName = 'TsGauge'
            PaintingColor = clWhite
            PaintingBevel = cbNone
            PaintingBevelWidth = 2
            ShadowBlur = 6
            ShadowColor = clBlack
            ShadowDontUse = False
            ShadowEnabled = False
            ReservedBoolean = False
            ShadowOffset = 3
            ShadowTransparency = 60
            FontColor = '0 -1 -1 -1 -1'
            HotFontColor = '0 -1 -1 -1 -1'
            PaintingTransparency = 100
            GradientPercent = 0
            GradientData = ' '
            ImagePercent = 0
            ShowFocus = False
            FadingEnabled = False
            FadingIntervalIn = 5
            FadingIntervalOut = 5
            FadingIterations = 5
            HotPaintingColor = clWhite
            HotPaintingTransparency = 0
            HotPaintingBevel = cbNone
            HotPaintingBevelWidth = 2
            HotGradientPercent = 0
            HotGradientData = ' '
            HotImagePercent = 0
            PaintingColorBorderTop = clBlack
            PaintingColorBorderBottom = clBlack
            SelectionBorderBevel = ebLowered
            SelectionBorderWidth = 2
            SelectionColor = clWhite
          end
          item
            SectionName = 'TsContainer'
            ParentClassName = 'TsPanel_Lowered'
            PaintingColor = 14270630
            PaintingBevel = cbNone
            PaintingBevelWidth = 2
            ShadowBlur = 6
            ShadowColor = clBlack
            ShadowDontUse = False
            ShadowEnabled = False
            ReservedBoolean = False
            ShadowOffset = 3
            ShadowTransparency = 60
            FontColor = '0 -1 -1 -1 -1'
            HotFontColor = '0 -1 -1 -1 -1'
            PaintingTransparency = 70
            GradientPercent = 0
            GradientData = 
              '14135673;10056262;14;0;0;10056262;13810084;62;0;0;13810084;16041' +
              '885;23;0;0;16041885;16041885;0;0;0'
            ImagePercent = 0
            ShowFocus = False
            FadingEnabled = False
            FadingIntervalIn = 5
            FadingIntervalOut = 5
            FadingIterations = 5
            HotPaintingColor = clWhite
            HotPaintingTransparency = 0
            HotPaintingBevel = cbNone
            HotPaintingBevelWidth = 2
            HotGradientPercent = 0
            HotGradientData = ' '
            HotImagePercent = 0
            PaintingColorBorderTop = clBlack
            PaintingColorBorderBottom = clBlack
            SelectionBorderBevel = ebLowered
            SelectionBorderWidth = 2
            SelectionColor = clWhite
          end
          item
            SectionName = 'TsTabSheet'
            PaintingColor = clWhite
            PaintingBevel = cbNone
            PaintingBevelWidth = 2
            ShadowBlur = 6
            ShadowColor = clBlack
            ShadowDontUse = False
            ShadowEnabled = False
            ReservedBoolean = False
            ShadowOffset = 3
            ShadowTransparency = 60
            FontColor = '0 -1 -1 -1 -1'
            HotFontColor = '0 -1 -1 -1 -1'
            PaintingTransparency = 100
            GradientPercent = 0
            ImagePercent = 0
            ShowFocus = False
            FadingEnabled = False
            FadingIntervalIn = 5
            FadingIntervalOut = 5
            FadingIterations = 5
            HotPaintingColor = clWhite
            HotPaintingTransparency = 0
            HotPaintingBevel = cbNone
            HotPaintingBevelWidth = 2
            HotGradientPercent = 0
            HotGradientData = ' '
            HotImagePercent = 0
            PaintingColorBorderTop = clBlack
            PaintingColorBorderBottom = clBlack
            SelectionBorderBevel = ebLowered
            SelectionBorderWidth = 2
            SelectionColor = clWhite
          end
          item
            SectionName = 'TsPageControlBOTTOM'
            ParentClassName = 'TsPageControl'
            PaintingColor = 14797990
            PaintingBevel = cbRaisedSoft
            PaintingBevelWidth = 2
            ShadowBlur = 6
            ShadowColor = clBlack
            ShadowDontUse = False
            ShadowEnabled = False
            ReservedBoolean = False
            ShadowOffset = 3
            ShadowTransparency = 60
            FontColor = '0 -1 -1 -1 -1'
            HotFontColor = '0 -1 -1 -1 -1'
            PaintingTransparency = 100
            GradientPercent = 0
            GradientData = 
              '14927761;11240540;86;0;0;11240540;14329180;13;0;0;14329180;14329' +
              '180;0;0;0'
            ImagePercent = 0
            ShowFocus = False
            FadingEnabled = False
            FadingIntervalIn = 5
            FadingIntervalOut = 5
            FadingIterations = 5
            HotPaintingColor = clWhite
            HotPaintingTransparency = 0
            HotPaintingBevel = cbNone
            HotPaintingBevelWidth = 2
            HotGradientPercent = 0
            HotGradientData = ' '
            HotImagePercent = 0
            PaintingColorBorderTop = clBlack
            PaintingColorBorderBottom = clBlack
            SelectionBorderBevel = ebLowered
            SelectionBorderWidth = 2
            SelectionColor = clWhite
          end
          item
            SectionName = 'TsPageControlLEFT'
            ParentClassName = 'TsPageControl'
            PaintingColor = 14797990
            PaintingBevel = cbRaisedSoft
            PaintingBevelWidth = 2
            ShadowBlur = 6
            ShadowColor = clBlack
            ShadowDontUse = False
            ShadowEnabled = False
            ReservedBoolean = False
            ShadowOffset = 3
            ShadowTransparency = 60
            FontColor = '0 -1 -1 -1 -1'
            HotFontColor = '0 -1 -1 -1 -1'
            PaintingTransparency = 100
            GradientPercent = 0
            GradientData = 
              '14927761;11240540;86;0;0;11240540;14329180;13;0;0;14329180;14329' +
              '180;0;0;0'
            ImagePercent = 0
            ShowFocus = False
            FadingEnabled = False
            FadingIntervalIn = 5
            FadingIntervalOut = 5
            FadingIterations = 5
            HotPaintingColor = clWhite
            HotPaintingTransparency = 0
            HotPaintingBevel = cbNone
            HotPaintingBevelWidth = 2
            HotGradientPercent = 0
            HotGradientData = ' '
            HotImagePercent = 0
            PaintingColorBorderTop = clBlack
            PaintingColorBorderBottom = clBlack
            SelectionBorderBevel = ebLowered
            SelectionBorderWidth = 2
            SelectionColor = clWhite
          end
          item
            SectionName = 'TsPageControlRIGHT'
            ParentClassName = 'TsPageControl'
            PaintingColor = 14797990
            PaintingBevel = cbRaisedSoft
            PaintingBevelWidth = 2
            ShadowBlur = 6
            ShadowColor = clBlack
            ShadowDontUse = False
            ShadowEnabled = False
            ReservedBoolean = False
            ShadowOffset = 3
            ShadowTransparency = 60
            FontColor = '0 -1 -1 -1 -1'
            HotFontColor = '0 -1 -1 -1 -1'
            PaintingTransparency = 100
            GradientPercent = 0
            GradientData = 
              '14927761;11240540;86;0;0;11240540;14329180;13;0;0;14329180;14329' +
              '180;0;0;0'
            ImagePercent = 0
            ShowFocus = False
            FadingEnabled = False
            FadingIntervalIn = 5
            FadingIntervalOut = 5
            FadingIterations = 5
            HotPaintingColor = clWhite
            HotPaintingTransparency = 0
            HotPaintingBevel = cbNone
            HotPaintingBevelWidth = 2
            HotGradientPercent = 0
            HotGradientData = ' '
            HotImagePercent = 0
            PaintingColorBorderTop = clBlack
            PaintingColorBorderBottom = clBlack
            SelectionBorderBevel = ebLowered
            SelectionBorderWidth = 2
            SelectionColor = clWhite
          end
          item
            SectionName = 'TsTabSheetBOTTOM'
            PaintingColor = clWhite
            PaintingBevel = cbNone
            PaintingBevelWidth = 2
            ShadowBlur = 6
            ShadowColor = clBlack
            ShadowDontUse = False
            ShadowEnabled = False
            ReservedBoolean = False
            ShadowOffset = 3
            ShadowTransparency = 60
            FontColor = '0 -1 -1 -1 -1'
            HotFontColor = '0 -1 -1 -1 -1'
            PaintingTransparency = 0
            GradientPercent = 0
            GradientData = ' '
            ImagePercent = 0
            ShowFocus = False
            FadingEnabled = False
            FadingIntervalIn = 5
            FadingIntervalOut = 5
            FadingIterations = 5
            HotPaintingColor = clWhite
            HotPaintingTransparency = 0
            HotPaintingBevel = cbNone
            HotPaintingBevelWidth = 2
            HotGradientPercent = 0
            HotGradientData = ' '
            HotImagePercent = 0
            PaintingColorBorderTop = clBlack
            PaintingColorBorderBottom = clBlack
            SelectionBorderBevel = ebLowered
            SelectionBorderWidth = 2
            SelectionColor = clWhite
          end
          item
            SectionName = 'TsTabSheetLEFT'
            PaintingColor = clWhite
            PaintingBevel = cbNone
            PaintingBevelWidth = 2
            ShadowBlur = 6
            ShadowColor = clBlack
            ShadowDontUse = False
            ShadowEnabled = False
            ReservedBoolean = False
            ShadowOffset = 3
            ShadowTransparency = 60
            FontColor = '0 -1 -1 -1 -1'
            HotFontColor = '0 -1 -1 -1 -1'
            PaintingTransparency = 0
            GradientPercent = 0
            GradientData = ' '
            ImagePercent = 0
            ShowFocus = False
            FadingEnabled = False
            FadingIntervalIn = 5
            FadingIntervalOut = 5
            FadingIterations = 5
            HotPaintingColor = clWhite
            HotPaintingTransparency = 0
            HotPaintingBevel = cbNone
            HotPaintingBevelWidth = 2
            HotGradientPercent = 0
            HotGradientData = ' '
            HotImagePercent = 0
            PaintingColorBorderTop = clBlack
            PaintingColorBorderBottom = clBlack
            SelectionBorderBevel = ebLowered
            SelectionBorderWidth = 2
            SelectionColor = clWhite
          end
          item
            SectionName = 'TsTabSheetRIGHT'
            PaintingColor = clWhite
            PaintingBevel = cbNone
            PaintingBevelWidth = 2
            ShadowBlur = 6
            ShadowColor = clBlack
            ShadowDontUse = False
            ShadowEnabled = False
            ReservedBoolean = False
            ShadowOffset = 3
            ShadowTransparency = 60
            FontColor = '0 -1 -1 -1 -1'
            HotFontColor = '0 -1 -1 -1 -1'
            PaintingTransparency = 0
            GradientPercent = 0
            GradientData = ' '
            ImagePercent = 0
            ShowFocus = False
            FadingEnabled = False
            FadingIntervalIn = 5
            FadingIntervalOut = 5
            FadingIterations = 5
            HotPaintingColor = clWhite
            HotPaintingTransparency = 0
            HotPaintingBevel = cbNone
            HotPaintingBevelWidth = 2
            HotGradientPercent = 0
            HotGradientData = ' '
            HotImagePercent = 0
            PaintingColorBorderTop = clBlack
            PaintingColorBorderBottom = clBlack
            SelectionBorderBevel = ebLowered
            SelectionBorderWidth = 2
            SelectionColor = clWhite
          end
          item
            SectionName = 'TsSplitter'
            ParentClassName = 'TsSpeedButton_Small'
            PaintingColor = clWhite
            PaintingBevel = cbNone
            PaintingBevelWidth = 2
            ShadowBlur = 6
            ShadowColor = clBlack
            ShadowDontUse = False
            ShadowEnabled = False
            ReservedBoolean = False
            ShadowOffset = 3
            ShadowTransparency = 60
            FontColor = '3023890 -1 -1 -1 -1'
            HotFontColor = '16774621 7954485 7954485 -1 -1'
            PaintingTransparency = 100
            GradientPercent = 0
            GradientData = ' '
            ImagePercent = 0
            ShowFocus = False
            FadingEnabled = True
            FadingIntervalIn = 5
            FadingIntervalOut = 5
            FadingIterations = 1
            HotPaintingColor = 16639645
            HotPaintingTransparency = 70
            HotPaintingBevel = cbNone
            HotPaintingBevelWidth = 2
            HotGradientPercent = 0
            HotGradientData = 
              '15786450;15983053;3;0;0;15983053;9204561;12;0;0;9204561;15912247' +
              ';84;0;0;15912247;15912247;0;0;0'
            HotImagePercent = 0
            PaintingColorBorderTop = clBlack
            PaintingColorBorderBottom = clBlack
            SelectionBorderBevel = ebLowered
            SelectionBorderWidth = 2
            SelectionColor = clWhite
          end
          item
            SectionName = 'TsTabControlLEFT'
            ParentClassName = 'TsPageControlLEFT'
            PaintingColor = 14797990
            PaintingBevel = cbRaisedSoft
            PaintingBevelWidth = 2
            ShadowBlur = 6
            ShadowColor = clBlack
            ShadowDontUse = False
            ShadowEnabled = False
            ReservedBoolean = False
            ShadowOffset = 3
            ShadowTransparency = 60
            FontColor = '0 -1 -1 -1 -1'
            HotFontColor = '0 -1 -1 -1 -1'
            PaintingTransparency = 100
            GradientPercent = 0
            GradientData = 
              '14927761;11240540;86;0;0;11240540;14329180;13;0;0;14329180;14329' +
              '180;0;0;0'
            ImagePercent = 0
            ShowFocus = False
            FadingEnabled = False
            FadingIntervalIn = 5
            FadingIntervalOut = 5
            FadingIterations = 5
            HotPaintingColor = clWhite
            HotPaintingTransparency = 0
            HotPaintingBevel = cbNone
            HotPaintingBevelWidth = 2
            HotGradientPercent = 0
            HotGradientData = ' '
            HotImagePercent = 0
            PaintingColorBorderTop = clBlack
            PaintingColorBorderBottom = clBlack
            SelectionBorderBevel = ebLowered
            SelectionBorderWidth = 2
            SelectionColor = clWhite
          end
          item
            SectionName = 'TsTabControlRIGHT'
            ParentClassName = 'TsPageControlRIGHT'
            PaintingColor = 14797990
            PaintingBevel = cbRaisedSoft
            PaintingBevelWidth = 2
            ShadowBlur = 6
            ShadowColor = clBlack
            ShadowDontUse = False
            ShadowEnabled = False
            ReservedBoolean = False
            ShadowOffset = 3
            ShadowTransparency = 60
            FontColor = '0 -1 -1 -1 -1'
            HotFontColor = '0 -1 -1 -1 -1'
            PaintingTransparency = 100
            GradientPercent = 0
            GradientData = 
              '14927761;11240540;86;0;0;11240540;14329180;13;0;0;14329180;14329' +
              '180;0;0;0'
            ImagePercent = 0
            ShowFocus = False
            FadingEnabled = False
            FadingIntervalIn = 5
            FadingIntervalOut = 5
            FadingIterations = 5
            HotPaintingColor = clWhite
            HotPaintingTransparency = 0
            HotPaintingBevel = cbNone
            HotPaintingBevelWidth = 2
            HotGradientPercent = 0
            HotGradientData = ' '
            HotImagePercent = 0
            PaintingColorBorderTop = clBlack
            PaintingColorBorderBottom = clBlack
            SelectionBorderBevel = ebLowered
            SelectionBorderWidth = 2
            SelectionColor = clWhite
          end
          item
            SectionName = 'TsTabControlBOTTOM'
            ParentClassName = 'TsPageControlBOTTOM'
            PaintingColor = 14797990
            PaintingBevel = cbRaisedSoft
            PaintingBevelWidth = 2
            ShadowBlur = 6
            ShadowColor = clBlack
            ShadowDontUse = False
            ShadowEnabled = False
            ReservedBoolean = False
            ShadowOffset = 3
            ShadowTransparency = 60
            FontColor = '0 -1 -1 -1 -1'
            HotFontColor = '0 -1 -1 -1 -1'
            PaintingTransparency = 100
            GradientPercent = 0
            GradientData = 
              '14927761;11240540;86;0;0;11240540;14329180;13;0;0;14329180;14329' +
              '180;0;0;0'
            ImagePercent = 0
            ShowFocus = False
            FadingEnabled = False
            FadingIntervalIn = 5
            FadingIntervalOut = 5
            FadingIterations = 5
            HotPaintingColor = clWhite
            HotPaintingTransparency = 0
            HotPaintingBevel = cbNone
            HotPaintingBevelWidth = 2
            HotGradientPercent = 0
            HotGradientData = ' '
            HotImagePercent = 0
            PaintingColorBorderTop = clBlack
            PaintingColorBorderBottom = clBlack
            SelectionBorderBevel = ebLowered
            SelectionBorderWidth = 2
            SelectionColor = clWhite
          end
          item
            SectionName = 'TsCheckListBox'
            ParentClassName = 'SIMPLYEDIT'
            PaintingColor = clWhite
            PaintingBevel = cbNone
            PaintingBevelWidth = 2
            ShadowBlur = 6
            ShadowColor = clBlack
            ShadowDontUse = False
            ShadowEnabled = False
            ReservedBoolean = False
            ShadowOffset = 3
            ShadowTransparency = 60
            FontColor = '0 -1 -1 -1 -1'
            HotFontColor = '0 -1 -1 -1 -1'
            PaintingTransparency = 0
            GradientPercent = 0
            GradientData = ' '
            ImagePercent = 0
            ShowFocus = False
            FadingEnabled = False
            FadingIntervalIn = 5
            FadingIntervalOut = 5
            FadingIterations = 5
            HotPaintingColor = clWhite
            HotPaintingTransparency = 0
            HotPaintingBevel = cbNone
            HotPaintingBevelWidth = 2
            HotGradientPercent = 0
            HotGradientData = ' '
            HotImagePercent = 0
            PaintingColorBorderTop = clBlack
            PaintingColorBorderBottom = clBlack
            SelectionBorderBevel = ebLowered
            SelectionBorderWidth = 2
            SelectionColor = clWhite
          end
          item
            SectionName = 'TsMonthCalendar'
            ParentClassName = 'TsPanel'
            PaintingColor = 14797990
            PaintingBevel = cbRaisedSoft
            PaintingBevelWidth = 2
            ShadowBlur = 6
            ShadowColor = clBlack
            ShadowDontUse = False
            ShadowEnabled = False
            ReservedBoolean = False
            ShadowOffset = 3
            ShadowTransparency = 60
            FontColor = '0 -1 -1 -1 -1'
            HotFontColor = '0 -1 -1 -1 -1'
            PaintingTransparency = 50
            GradientPercent = 100
            GradientData = '16444627;12094791;99;0;0;12094791;12094791;0;0;0'
            ImagePercent = 0
            ShowFocus = False
            FadingEnabled = False
            FadingIntervalIn = 5
            FadingIntervalOut = 5
            FadingIterations = 5
            HotPaintingColor = clWhite
            HotPaintingTransparency = 0
            HotPaintingBevel = cbNone
            HotPaintingBevelWidth = 2
            HotGradientPercent = 0
            HotGradientData = ' '
            HotImagePercent = 0
            PaintingColorBorderTop = clBlack
            PaintingColorBorderBottom = clBlack
            SelectionBorderBevel = ebLowered
            SelectionBorderWidth = 2
            SelectionColor = clWhite
          end
          item
            SectionName = 'TsToolBar'
            ParentClassName = 'TsPanel'
            PaintingColor = 14797990
            PaintingBevel = cbRaisedSoft
            PaintingBevelWidth = 2
            ShadowBlur = 6
            ShadowColor = clBlack
            ShadowDontUse = False
            ShadowEnabled = False
            ReservedBoolean = False
            ShadowOffset = 3
            ShadowTransparency = 60
            FontColor = '0 -1 -1 -1 -1'
            HotFontColor = '0 -1 -1 -1 -1'
            PaintingTransparency = 50
            GradientPercent = 100
            GradientData = '9527339;16769695;99;0;0;16769695;16769695;0;0;0'
            ImagePercent = 0
            ShowFocus = False
            FadingEnabled = False
            FadingIntervalIn = 5
            FadingIntervalOut = 5
            FadingIterations = 5
            HotPaintingColor = clWhite
            HotPaintingTransparency = 0
            HotPaintingBevel = cbNone
            HotPaintingBevelWidth = 2
            HotGradientPercent = 0
            HotGradientData = ' '
            HotImagePercent = 0
            PaintingColorBorderTop = clBlack
            PaintingColorBorderBottom = clBlack
            SelectionBorderBevel = ebLowered
            SelectionBorderWidth = 2
            SelectionColor = clWhite
          end
          item
            SectionName = 'GRID'
            ParentClassName = 'SIMPLYEDIT'
            PaintingColor = clWhite
            PaintingBevel = cbNone
            PaintingBevelWidth = 2
            ShadowBlur = 6
            ShadowColor = clBlack
            ShadowDontUse = False
            ShadowEnabled = False
            ReservedBoolean = False
            ShadowOffset = 3
            ShadowTransparency = 60
            FontColor = '0 -1 -1 -1 -1'
            HotFontColor = '0 -1 -1 -1 -1'
            PaintingTransparency = 0
            GradientPercent = 0
            GradientData = ' '
            ImagePercent = 0
            ShowFocus = False
            FadingEnabled = False
            FadingIntervalIn = 5
            FadingIntervalOut = 5
            FadingIterations = 5
            HotPaintingColor = clWhite
            HotPaintingTransparency = 0
            HotPaintingBevel = cbNone
            HotPaintingBevelWidth = 2
            HotGradientPercent = 0
            HotGradientData = ' '
            HotImagePercent = 0
            PaintingColorBorderTop = clBlack
            PaintingColorBorderBottom = clBlack
            SelectionBorderBevel = ebLowered
            SelectionBorderWidth = 2
            SelectionColor = clWhite
          end
          item
            SectionName = 'TSLISTVIEW'
            ParentClassName = 'SIMPLYEDIT'
            PaintingColor = clWhite
            PaintingBevel = cbNone
            PaintingBevelWidth = 2
            ShadowBlur = 6
            ShadowColor = clBlack
            ShadowDontUse = False
            ShadowEnabled = False
            ReservedBoolean = False
            ShadowOffset = 3
            ShadowTransparency = 60
            FontColor = '0 -1 -1 -1 -1'
            HotFontColor = '0 -1 -1 -1 -1'
            PaintingTransparency = 0
            GradientPercent = 0
            GradientData = ' '
            ImagePercent = 0
            ShowFocus = False
            FadingEnabled = False
            FadingIntervalIn = 5
            FadingIntervalOut = 5
            FadingIterations = 5
            HotPaintingColor = clWhite
            HotPaintingTransparency = 0
            HotPaintingBevel = cbNone
            HotPaintingBevelWidth = 2
            HotGradientPercent = 0
            HotGradientData = ' '
            HotImagePercent = 0
            PaintingColorBorderTop = clBlack
            PaintingColorBorderBottom = clBlack
            SelectionBorderBevel = ebLowered
            SelectionBorderWidth = 2
            SelectionColor = clWhite
          end
          item
            SectionName = 'TSTREEVIEW'
            ParentClassName = 'SIMPLYEDIT'
            PaintingColor = clWhite
            PaintingBevel = cbNone
            PaintingBevelWidth = 2
            ShadowBlur = 6
            ShadowColor = clBlack
            ShadowDontUse = False
            ShadowEnabled = False
            ReservedBoolean = False
            ShadowOffset = 3
            ShadowTransparency = 60
            FontColor = '0 -1 -1 -1 -1'
            HotFontColor = '0 -1 -1 -1 -1'
            PaintingTransparency = 0
            GradientPercent = 0
            GradientData = ' '
            ImagePercent = 0
            ShowFocus = False
            FadingEnabled = False
            FadingIntervalIn = 5
            FadingIntervalOut = 5
            FadingIterations = 5
            HotPaintingColor = clWhite
            HotPaintingTransparency = 0
            HotPaintingBevel = cbNone
            HotPaintingBevelWidth = 2
            HotGradientPercent = 0
            HotGradientData = ' '
            HotImagePercent = 0
            PaintingColorBorderTop = clBlack
            PaintingColorBorderBottom = clBlack
            SelectionBorderBevel = ebLowered
            SelectionBorderWidth = 2
            SelectionColor = clWhite
          end
          item
            SectionName = 'TsGroupBox'
            PaintingColor = 14215660
            PaintingBevel = cbLoweredHard
            PaintingBevelWidth = 2
            ShadowBlur = 6
            ShadowColor = clBlack
            ShadowDontUse = False
            ShadowEnabled = False
            ReservedBoolean = False
            ShadowOffset = 3
            ShadowTransparency = 60
            FontColor = '0 -1 -1 -1 -1'
            HotFontColor = '0 -1 -1 -1 -1'
            PaintingTransparency = 100
            GradientPercent = 0
            ImagePercent = 0
            ShowFocus = False
            FadingEnabled = False
            FadingIntervalIn = 5
            FadingIntervalOut = 5
            FadingIterations = 5
            HotPaintingColor = clWhite
            HotPaintingTransparency = 0
            HotPaintingBevel = cbNone
            HotPaintingBevelWidth = 2
            HotGradientPercent = 0
            HotGradientData = ' '
            HotImagePercent = 0
            PaintingColorBorderTop = clBlack
            PaintingColorBorderBottom = clBlack
            SelectionBorderBevel = ebLowered
            SelectionBorderWidth = 2
            SelectionColor = clWhite
          end
          item
            SectionName = 'TsPanel'
            PaintingColor = 14797990
            PaintingBevel = cbRaisedSoft
            PaintingBevelWidth = 2
            ShadowBlur = 6
            ShadowColor = clBlack
            ShadowDontUse = False
            ShadowEnabled = False
            ReservedBoolean = False
            ShadowOffset = 3
            ShadowTransparency = 60
            FontColor = '0 -1 -1 -1 -1'
            HotFontColor = '0 -1 -1 -1 -1'
            PaintingTransparency = 50
            GradientPercent = 100
            GradientData = '16444627;12094791;99;0;0;12094791;12094791;0;0;0'
            ImagePercent = 0
            ShowFocus = False
            FadingEnabled = False
            FadingIntervalIn = 5
            FadingIntervalOut = 5
            FadingIterations = 5
            HotPaintingColor = clWhite
            HotPaintingTransparency = 0
            HotPaintingBevel = cbNone
            HotPaintingBevelWidth = 2
            HotGradientPercent = 0
            HotGradientData = ' '
            HotImagePercent = 0
            PaintingColorBorderTop = clBlack
            PaintingColorBorderBottom = clBlack
            SelectionBorderBevel = ebLowered
            SelectionBorderWidth = 2
            SelectionColor = clWhite
          end
          item
            SectionName = 'TsPageControl'
            ParentClassName = 'TsPanel'
            PaintingColor = 14797990
            PaintingBevel = cbRaisedSoft
            PaintingBevelWidth = 2
            ShadowBlur = 6
            ShadowColor = clBlack
            ShadowDontUse = False
            ShadowEnabled = False
            ReservedBoolean = False
            ShadowOffset = 3
            ShadowTransparency = 60
            FontColor = '0 -1 -1 -1 -1'
            HotFontColor = '0 -1 -1 -1 -1'
            PaintingTransparency = 100
            GradientPercent = 0
            GradientData = 
              '14927761;11240540;86;0;0;11240540;14329180;13;0;0;14329180;14329' +
              '180;0;0;0'
            ImagePercent = 0
            ShowFocus = False
            FadingEnabled = False
            FadingIntervalIn = 5
            FadingIntervalOut = 5
            FadingIterations = 5
            HotPaintingColor = clWhite
            HotPaintingTransparency = 0
            HotPaintingBevel = cbNone
            HotPaintingBevelWidth = 2
            HotGradientPercent = 0
            HotGradientData = ' '
            HotImagePercent = 0
            PaintingColorBorderTop = clBlack
            PaintingColorBorderBottom = clBlack
            SelectionBorderBevel = ebLowered
            SelectionBorderWidth = 2
            SelectionColor = clWhite
          end
          item
            SectionName = 'PROGRESSH'
            PaintingColor = clWhite
            PaintingBevel = cbNone
            PaintingBevelWidth = 2
            ShadowBlur = 6
            ShadowColor = clBlack
            ShadowDontUse = False
            ShadowEnabled = False
            ReservedBoolean = False
            ShadowOffset = 3
            ShadowTransparency = 60
            FontColor = '0 -1 -1 -1 -1'
            HotFontColor = '0 -1 -1 -1 -1'
            PaintingTransparency = 30
            GradientPercent = 100
            GradientData = 
              '11038517;16776960;52;1;0;16776960;10384184;47;1;0;10384184;10384' +
              '184;0;1;0'
            ImagePercent = 0
            ShowFocus = False
            FadingEnabled = False
            FadingIntervalIn = 5
            FadingIntervalOut = 5
            FadingIterations = 5
            HotPaintingColor = clWhite
            HotPaintingTransparency = 0
            HotPaintingBevel = cbNone
            HotPaintingBevelWidth = 2
            HotGradientPercent = 0
            HotGradientData = ' '
            HotImagePercent = 0
            PaintingColorBorderTop = clBlack
            PaintingColorBorderBottom = clBlack
            SelectionBorderBevel = ebLowered
            SelectionBorderWidth = 2
            SelectionColor = clWhite
          end
          item
            SectionName = 'TsGauge'
            PaintingColor = clWhite
            PaintingBevel = cbNone
            PaintingBevelWidth = 2
            ShadowBlur = 6
            ShadowColor = clBlack
            ShadowDontUse = False
            ShadowEnabled = False
            ReservedBoolean = False
            ShadowOffset = 3
            ShadowTransparency = 60
            FontColor = '0 -1 -1 -1 -1'
            HotFontColor = '0 -1 -1 -1 -1'
            PaintingTransparency = 100
            GradientPercent = 0
            GradientData = ' '
            ImagePercent = 0
            ShowFocus = False
            FadingEnabled = False
            FadingIntervalIn = 5
            FadingIntervalOut = 5
            FadingIterations = 5
            HotPaintingColor = clWhite
            HotPaintingTransparency = 0
            HotPaintingBevel = cbNone
            HotPaintingBevelWidth = 2
            HotGradientPercent = 0
            HotGradientData = ' '
            HotImagePercent = 0
            PaintingColorBorderTop = clBlack
            PaintingColorBorderBottom = clBlack
            SelectionBorderBevel = ebLowered
            SelectionBorderWidth = 2
            SelectionColor = clWhite
          end
          item
            SectionName = 'TsPanel_Lowered'
            PaintingColor = 14270630
            PaintingBevel = cbNone
            PaintingBevelWidth = 2
            ShadowBlur = 6
            ShadowColor = clBlack
            ShadowDontUse = False
            ShadowEnabled = False
            ReservedBoolean = False
            ShadowOffset = 3
            ShadowTransparency = 60
            FontColor = '0 -1 -1 -1 -1'
            HotFontColor = '0 -1 -1 -1 -1'
            PaintingTransparency = 100
            GradientPercent = 0
            GradientData = '14927761;16777215;99;0;0;16777215;16777215;0;0;0'
            ImagePercent = 0
            ShowFocus = False
            FadingEnabled = False
            FadingIntervalIn = 5
            FadingIntervalOut = 5
            FadingIterations = 5
            HotPaintingColor = clWhite
            HotPaintingTransparency = 0
            HotPaintingBevel = cbNone
            HotPaintingBevelWidth = 2
            HotGradientPercent = 0
            HotGradientData = ' '
            HotImagePercent = 0
            PaintingColorBorderTop = clBlack
            PaintingColorBorderBottom = clBlack
            SelectionBorderBevel = ebLowered
            SelectionBorderWidth = 2
            SelectionColor = clWhite
          end
          item
            SectionName = 'TsRadioButton'
            ParentClassName = 'TsEdit'
            PaintingColor = clWhite
            PaintingBevel = cbRaisedSoft
            PaintingBevelWidth = 1
            ShadowBlur = 6
            ShadowColor = clBlack
            ShadowDontUse = False
            ShadowEnabled = False
            ReservedBoolean = False
            ShadowOffset = 3
            ShadowTransparency = 60
            FontColor = '0 -1 -1 -1 -1'
            HotFontColor = '0 -1 -1 -1 -1'
            PaintingTransparency = 0
            GradientPercent = 0
            GradientData = ' '
            ImagePercent = 0
            ShowFocus = False
            FadingEnabled = False
            FadingIntervalIn = 5
            FadingIntervalOut = 5
            FadingIterations = 5
            HotPaintingColor = clWhite
            HotPaintingTransparency = 0
            HotPaintingBevel = cbNone
            HotPaintingBevelWidth = 2
            HotGradientPercent = 0
            HotGradientData = ' '
            HotImagePercent = 0
            PaintingColorBorderTop = 7422976
            PaintingColorBorderBottom = 7422976
            SelectionBorderBevel = ebRaised
            SelectionBorderWidth = 1
            SelectionColor = clWhite
          end
          item
            SectionName = 'TsCheckBox'
            ParentClassName = 'TsEdit'
            PaintingColor = clWhite
            PaintingBevel = cbRaisedSoft
            PaintingBevelWidth = 1
            ShadowBlur = 6
            ShadowColor = clBlack
            ShadowDontUse = False
            ShadowEnabled = False
            ReservedBoolean = False
            ShadowOffset = 3
            ShadowTransparency = 60
            FontColor = '0 -1 -1 -1 -1'
            HotFontColor = '0 -1 -1 -1 -1'
            PaintingTransparency = 0
            GradientPercent = 0
            GradientData = ' '
            ImagePercent = 0
            ShowFocus = False
            FadingEnabled = False
            FadingIntervalIn = 5
            FadingIntervalOut = 5
            FadingIterations = 5
            HotPaintingColor = clWhite
            HotPaintingTransparency = 0
            HotPaintingBevel = cbNone
            HotPaintingBevelWidth = 2
            HotGradientPercent = 0
            HotGradientData = ' '
            HotImagePercent = 0
            PaintingColorBorderTop = 7422976
            PaintingColorBorderBottom = 7422976
            SelectionBorderBevel = ebRaised
            SelectionBorderWidth = 1
            SelectionColor = clWhite
          end
          item
            SectionName = 'MenuLine'
            PaintingColor = clWhite
            PaintingBevel = cbNone
            PaintingBevelWidth = 2
            ShadowBlur = 6
            ShadowColor = clBlack
            ShadowDontUse = False
            ShadowEnabled = False
            ReservedBoolean = False
            ShadowOffset = 3
            ShadowTransparency = 60
            FontColor = '0 -1 -1 -1 -1'
            HotFontColor = '0 -1 -1 16771777 16771777'
            PaintingTransparency = 100
            GradientPercent = 100
            GradientData = 
              '7754286;16777215;9;0;0;16777215;9661497;17;0;0;9661497;14661514;' +
              '73;0;0;14661514;14661514;0;0;0'
            ImagePercent = 0
            ShowFocus = False
            FadingEnabled = False
            FadingIntervalIn = 5
            FadingIntervalOut = 5
            FadingIterations = 5
            HotPaintingColor = clWhite
            HotPaintingTransparency = 100
            HotPaintingBevel = cbNone
            HotPaintingBevelWidth = 2
            HotGradientPercent = 100
            HotGradientData = 
              '10054204;14659709;66;0;0;14659709;14598539;33;0;0;14598539;14598' +
              '539;0;0;0'
            HotImagePercent = 0
            PaintingColorBorderTop = clBlack
            PaintingColorBorderBottom = clBlack
            SelectionBorderBevel = ebLowered
            SelectionBorderWidth = 2
            SelectionColor = clWhite
          end
          item
            SectionName = 'TsColorBox'
            ParentClassName = 'SIMPLYEDIT'
            PaintingColor = clWhite
            PaintingBevel = cbNone
            PaintingBevelWidth = 2
            ShadowBlur = 6
            ShadowColor = clBlack
            ShadowDontUse = False
            ShadowEnabled = False
            ReservedBoolean = False
            ShadowOffset = 3
            ShadowTransparency = 60
            FontColor = '0 -1 -1 -1 -1'
            HotFontColor = '0 -1 -1 -1 -1'
            PaintingTransparency = 0
            GradientPercent = 0
            GradientData = ' '
            ImagePercent = 0
            ShowFocus = True
            FadingEnabled = False
            FadingIntervalIn = 5
            FadingIntervalOut = 5
            FadingIterations = 5
            HotPaintingColor = clWhite
            HotPaintingTransparency = 0
            HotPaintingBevel = cbNone
            HotPaintingBevelWidth = 2
            HotGradientPercent = 0
            HotGradientData = ' '
            HotImagePercent = 0
            PaintingColorBorderTop = clBlack
            PaintingColorBorderBottom = clBlack
            SelectionBorderBevel = ebLowered
            SelectionBorderWidth = 2
            SelectionColor = clWhite
          end
          item
            SectionName = 'TsColorBox_1'
            ParentClassName = 'ALPHAEDIT'
            PaintingColor = clWhite
            PaintingBevel = cbNone
            PaintingBevelWidth = 2
            ShadowBlur = 6
            ShadowColor = clBlack
            ShadowDontUse = False
            ShadowEnabled = False
            ReservedBoolean = False
            ShadowOffset = 3
            ShadowTransparency = 60
            FontColor = '0 -1 -1 -1 -1'
            HotFontColor = '16774621 7954485 7954485 -1 -1'
            PaintingTransparency = 50
            GradientPercent = 100
            GradientData = '10383683;16437637;99;0;0;16437637;16437637;0;0;0'
            ImagePercent = 0
            ShowFocus = True
            FadingEnabled = True
            FadingIntervalIn = 5
            FadingIntervalOut = 5
            FadingIterations = 15
            HotPaintingColor = clWhite
            HotPaintingTransparency = 0
            HotPaintingBevel = cbNone
            HotPaintingBevelWidth = 2
            HotGradientPercent = 100
            HotGradientData = '16371206;5648131;99;0;0;5648131;5648131;0;0;0'
            HotImagePercent = 0
            PaintingColorBorderTop = clBlack
            PaintingColorBorderBottom = clBlack
            SelectionBorderBevel = ebLowered
            SelectionBorderWidth = 2
            SelectionColor = clWhite
          end
          item
            SectionName = 'TsComboBox'
            ParentClassName = 'TsEdit'
            PaintingColor = clWhite
            PaintingBevel = cbRaisedSoft
            PaintingBevelWidth = 1
            ShadowBlur = 6
            ShadowColor = clBlack
            ShadowDontUse = False
            ShadowEnabled = False
            ReservedBoolean = False
            ShadowOffset = 3
            ShadowTransparency = 60
            FontColor = '0 -1 -1 -1 -1'
            HotFontColor = '0 -1 -1 -1 -1'
            PaintingTransparency = 0
            GradientPercent = 0
            GradientData = ' '
            ImagePercent = 0
            ShowFocus = False
            FadingEnabled = False
            FadingIntervalIn = 5
            FadingIntervalOut = 5
            FadingIterations = 5
            HotPaintingColor = clWhite
            HotPaintingTransparency = 0
            HotPaintingBevel = cbNone
            HotPaintingBevelWidth = 2
            HotGradientPercent = 0
            HotGradientData = ' '
            HotImagePercent = 0
            PaintingColorBorderTop = 7422976
            PaintingColorBorderBottom = 7422976
            SelectionBorderBevel = ebRaised
            SelectionBorderWidth = 1
            SelectionColor = clWhite
          end
          item
            SectionName = 'TsComboBoxEx'
            ParentClassName = 'SIMPLYEDIT'
            PaintingColor = clWhite
            PaintingBevel = cbNone
            PaintingBevelWidth = 2
            ShadowBlur = 6
            ShadowColor = clBlack
            ShadowDontUse = False
            ShadowEnabled = False
            ReservedBoolean = False
            ShadowOffset = 3
            ShadowTransparency = 60
            FontColor = '0 -1 -1 -1 -1'
            HotFontColor = '0 -1 -1 -1 -1'
            PaintingTransparency = 0
            GradientPercent = 0
            GradientData = ' '
            ImagePercent = 0
            ShowFocus = True
            FadingEnabled = False
            FadingIntervalIn = 5
            FadingIntervalOut = 5
            FadingIterations = 5
            HotPaintingColor = clWhite
            HotPaintingTransparency = 0
            HotPaintingBevel = cbNone
            HotPaintingBevelWidth = 2
            HotGradientPercent = 0
            HotGradientData = ' '
            HotImagePercent = 0
            PaintingColorBorderTop = clBlack
            PaintingColorBorderBottom = clBlack
            SelectionBorderBevel = ebLowered
            SelectionBorderWidth = 2
            SelectionColor = clWhite
          end
          item
            SectionName = 'TsComboBoxEx_1'
            ParentClassName = 'ALPHAEDIT'
            PaintingColor = clWhite
            PaintingBevel = cbNone
            PaintingBevelWidth = 2
            ShadowBlur = 6
            ShadowColor = clBlack
            ShadowDontUse = False
            ShadowEnabled = False
            ReservedBoolean = False
            ShadowOffset = 3
            ShadowTransparency = 60
            FontColor = '0 -1 -1 -1 -1'
            HotFontColor = '16774621 7954485 7954485 -1 -1'
            PaintingTransparency = 50
            GradientPercent = 100
            GradientData = '10383683;16437637;99;0;0;16437637;16437637;0;0;0'
            ImagePercent = 0
            ShowFocus = True
            FadingEnabled = True
            FadingIntervalIn = 5
            FadingIntervalOut = 5
            FadingIterations = 15
            HotPaintingColor = clWhite
            HotPaintingTransparency = 0
            HotPaintingBevel = cbNone
            HotPaintingBevelWidth = 2
            HotGradientPercent = 100
            HotGradientData = '16371206;5648131;99;0;0;5648131;5648131;0;0;0'
            HotImagePercent = 0
            PaintingColorBorderTop = clBlack
            PaintingColorBorderBottom = clBlack
            SelectionBorderBevel = ebLowered
            SelectionBorderWidth = 2
            SelectionColor = clWhite
          end
          item
            SectionName = 'ALPHAEDIT'
            ParentClassName = 'TSBUTTON'
            PaintingColor = clWhite
            PaintingBevel = cbNone
            PaintingBevelWidth = 2
            ShadowBlur = 6
            ShadowColor = clBlack
            ShadowDontUse = False
            ShadowEnabled = False
            ReservedBoolean = False
            ShadowOffset = 3
            ShadowTransparency = 60
            FontColor = '0 -1 -1 -1 -1'
            HotFontColor = '16774621 7954485 7954485 -1 -1'
            PaintingTransparency = 50
            GradientPercent = 100
            GradientData = '10383683;16437637;99;0;0;16437637;16437637;0;0;0'
            ImagePercent = 0
            ShowFocus = False
            FadingEnabled = True
            FadingIntervalIn = 5
            FadingIntervalOut = 5
            FadingIterations = 15
            HotPaintingColor = clWhite
            HotPaintingTransparency = 0
            HotPaintingBevel = cbNone
            HotPaintingBevelWidth = 2
            HotGradientPercent = 100
            HotGradientData = '16371206;5648131;99;0;0;5648131;5648131;0;0;0'
            HotImagePercent = 0
            PaintingColorBorderTop = clBlack
            PaintingColorBorderBottom = clBlack
            SelectionBorderBevel = ebLowered
            SelectionBorderWidth = 2
            SelectionColor = clWhite
          end
          item
            SectionName = 'ScrollBar1H'
            PaintingColor = clWhite
            PaintingBevel = cbNone
            PaintingBevelWidth = 2
            ShadowBlur = 6
            ShadowColor = clBlack
            ShadowDontUse = False
            ShadowEnabled = False
            ReservedBoolean = False
            ShadowOffset = 3
            ShadowTransparency = 60
            FontColor = '0 -1 -1 -1 -1'
            HotFontColor = '0 -1 -1 -1 -1'
            PaintingTransparency = 100
            GradientPercent = 0
            GradientData = ' '
            ImagePercent = 0
            ShowFocus = False
            FadingEnabled = False
            FadingIntervalIn = 5
            FadingIntervalOut = 5
            FadingIterations = 5
            HotPaintingColor = clWhite
            HotPaintingTransparency = 100
            HotPaintingBevel = cbNone
            HotPaintingBevelWidth = 2
            HotGradientPercent = 0
            HotGradientData = ' '
            HotImagePercent = 0
            PaintingColorBorderTop = clBlack
            PaintingColorBorderBottom = clBlack
            SelectionBorderBevel = ebLowered
            SelectionBorderWidth = 2
            SelectionColor = clWhite
          end
          item
            SectionName = 'ScrollBar2H'
            ParentClassName = 'ScrollBar1H'
            PaintingColor = clWhite
            PaintingBevel = cbNone
            PaintingBevelWidth = 2
            ShadowBlur = 6
            ShadowColor = clBlack
            ShadowDontUse = False
            ShadowEnabled = False
            ReservedBoolean = False
            ShadowOffset = 3
            ShadowTransparency = 60
            FontColor = '0 -1 -1 -1 -1'
            HotFontColor = '0 -1 -1 -1 -1'
            PaintingTransparency = 100
            GradientPercent = 0
            GradientData = ' '
            ImagePercent = 0
            ShowFocus = False
            FadingEnabled = False
            FadingIntervalIn = 5
            FadingIntervalOut = 5
            FadingIterations = 5
            HotPaintingColor = clWhite
            HotPaintingTransparency = 100
            HotPaintingBevel = cbNone
            HotPaintingBevelWidth = 2
            HotGradientPercent = 0
            HotGradientData = ' '
            HotImagePercent = 0
            PaintingColorBorderTop = clBlack
            PaintingColorBorderBottom = clBlack
            SelectionBorderBevel = ebLowered
            SelectionBorderWidth = 2
            SelectionColor = clWhite
          end
          item
            SectionName = 'ScrollBar1V'
            PaintingColor = clWhite
            PaintingBevel = cbNone
            PaintingBevelWidth = 2
            ShadowBlur = 6
            ShadowColor = clBlack
            ShadowDontUse = False
            ShadowEnabled = False
            ReservedBoolean = False
            ShadowOffset = 3
            ShadowTransparency = 60
            FontColor = '0 -1 -1 -1 -1'
            HotFontColor = '0 -1 -1 -1 -1'
            PaintingTransparency = 100
            GradientPercent = 0
            GradientData = ' '
            ImagePercent = 0
            ShowFocus = False
            FadingEnabled = False
            FadingIntervalIn = 5
            FadingIntervalOut = 5
            FadingIterations = 5
            HotPaintingColor = clWhite
            HotPaintingTransparency = 100
            HotPaintingBevel = cbNone
            HotPaintingBevelWidth = 2
            HotGradientPercent = 0
            HotGradientData = ' '
            HotImagePercent = 0
            PaintingColorBorderTop = clBlack
            PaintingColorBorderBottom = clBlack
            SelectionBorderBevel = ebLowered
            SelectionBorderWidth = 2
            SelectionColor = clWhite
          end
          item
            SectionName = 'ScrollBar2V'
            ParentClassName = 'ScrollBar1V'
            PaintingColor = clWhite
            PaintingBevel = cbNone
            PaintingBevelWidth = 2
            ShadowBlur = 6
            ShadowColor = clBlack
            ShadowDontUse = False
            ShadowEnabled = False
            ReservedBoolean = False
            ShadowOffset = 3
            ShadowTransparency = 60
            FontColor = '0 -1 -1 -1 -1'
            HotFontColor = '0 -1 -1 -1 -1'
            PaintingTransparency = 100
            GradientPercent = 0
            GradientData = ' '
            ImagePercent = 0
            ShowFocus = False
            FadingEnabled = False
            FadingIntervalIn = 5
            FadingIntervalOut = 5
            FadingIterations = 5
            HotPaintingColor = clWhite
            HotPaintingTransparency = 100
            HotPaintingBevel = cbNone
            HotPaintingBevelWidth = 2
            HotGradientPercent = 0
            HotGradientData = ' '
            HotImagePercent = 0
            PaintingColorBorderTop = clBlack
            PaintingColorBorderBottom = clBlack
            SelectionBorderBevel = ebLowered
            SelectionBorderWidth = 2
            SelectionColor = clWhite
          end
          item
            SectionName = 'SIMPLYEDIT'
            PaintingColor = clWhite
            PaintingBevel = cbNone
            PaintingBevelWidth = 2
            ShadowBlur = 6
            ShadowColor = clBlack
            ShadowDontUse = False
            ShadowEnabled = False
            ReservedBoolean = False
            ShadowOffset = 3
            ShadowTransparency = 60
            FontColor = '0 -1 -1 -1 -1'
            HotFontColor = '0 -1 -1 -1 -1'
            PaintingTransparency = 0
            GradientPercent = 0
            GradientData = ' '
            ImagePercent = 0
            ShowFocus = False
            FadingEnabled = False
            FadingIntervalIn = 5
            FadingIntervalOut = 5
            FadingIterations = 5
            HotPaintingColor = clWhite
            HotPaintingTransparency = 0
            HotPaintingBevel = cbNone
            HotPaintingBevelWidth = 2
            HotGradientPercent = 0
            HotGradientData = ' '
            HotImagePercent = 0
            PaintingColorBorderTop = clBlack
            PaintingColorBorderBottom = clBlack
            SelectionBorderBevel = ebLowered
            SelectionBorderWidth = 2
            SelectionColor = clWhite
          end
          item
            SectionName = 'TsSpeedButton_Small'
            ParentClassName = 'TsSpeedButton'
            PaintingColor = clWhite
            PaintingBevel = cbNone
            PaintingBevelWidth = 2
            ShadowBlur = 6
            ShadowColor = clBlack
            ShadowDontUse = False
            ShadowEnabled = False
            ReservedBoolean = False
            ShadowOffset = 3
            ShadowTransparency = 60
            FontColor = '3023890 -1 -1 -1 -1'
            HotFontColor = '16774621 7954485 7954485 -1 -1'
            PaintingTransparency = 100
            GradientPercent = 0
            GradientData = ' '
            ImagePercent = 0
            ShowFocus = False
            FadingEnabled = True
            FadingIntervalIn = 5
            FadingIntervalOut = 5
            FadingIterations = 1
            HotPaintingColor = 16639645
            HotPaintingTransparency = 70
            HotPaintingBevel = cbNone
            HotPaintingBevelWidth = 2
            HotGradientPercent = 0
            HotGradientData = 
              '15786450;15983053;3;0;0;15983053;9204561;12;0;0;9204561;15912247' +
              ';84;0;0;15912247;15912247;0;0;0'
            HotImagePercent = 0
            PaintingColorBorderTop = clBlack
            PaintingColorBorderBottom = clBlack
            SelectionBorderBevel = ebLowered
            SelectionBorderWidth = 2
            SelectionColor = clWhite
          end
          item
            SectionName = 'TsStatusBar'
            PaintingColor = clWhite
            PaintingBevel = cbNone
            PaintingBevelWidth = 2
            ShadowBlur = 6
            ShadowColor = clBlack
            ShadowDontUse = False
            ShadowEnabled = False
            ReservedBoolean = False
            ShadowOffset = 3
            ShadowTransparency = 60
            FontColor = '0 -1 -1 -1 -1'
            HotFontColor = '0 -1 -1 -1 -1'
            PaintingTransparency = 0
            GradientPercent = 100
            GradientData = 
              '8544324;12359779;18;0;0;12359779;11305555;81;0;0;11305555;113055' +
              '55;0;0;0'
            ImagePercent = 0
            ShowFocus = False
            FadingEnabled = False
            FadingIntervalIn = 5
            FadingIntervalOut = 5
            FadingIterations = 5
            HotPaintingColor = clWhite
            HotPaintingTransparency = 0
            HotPaintingBevel = cbNone
            HotPaintingBevelWidth = 2
            HotGradientPercent = 0
            HotGradientData = ' '
            HotImagePercent = 0
            PaintingColorBorderTop = clBlack
            PaintingColorBorderBottom = clBlack
            SelectionBorderBevel = ebLowered
            SelectionBorderWidth = 2
            SelectionColor = clWhite
          end
          item
            SectionName = 'SCROLLBTNRight'
            ParentClassName = 'SCROLLBTNBOTTOM'
            PaintingColor = clWhite
            PaintingBevel = cbNone
            PaintingBevelWidth = 2
            ShadowBlur = 6
            ShadowColor = clBlack
            ShadowDontUse = False
            ShadowEnabled = False
            ReservedBoolean = False
            ShadowOffset = 3
            ShadowTransparency = 60
            FontColor = '0 -1 -1 -1 -1'
            HotFontColor = '0 -1 -1 -1 -1'
            PaintingTransparency = 100
            GradientPercent = 0
            GradientData = ' '
            ImagePercent = 0
            ShowFocus = False
            FadingEnabled = False
            FadingIntervalIn = 5
            FadingIntervalOut = 5
            FadingIterations = 5
            HotPaintingColor = clWhite
            HotPaintingTransparency = 100
            HotPaintingBevel = cbNone
            HotPaintingBevelWidth = 2
            HotGradientPercent = 0
            HotGradientData = ' '
            HotImagePercent = 0
            PaintingColorBorderTop = clBlack
            PaintingColorBorderBottom = clBlack
            SelectionBorderBevel = ebLowered
            SelectionBorderWidth = 2
            SelectionColor = clWhite
          end
          item
            SectionName = 'SCROLLBTNTop'
            ParentClassName = 'SCROLLBTNBOTTOM'
            PaintingColor = clWhite
            PaintingBevel = cbNone
            PaintingBevelWidth = 2
            ShadowBlur = 6
            ShadowColor = clBlack
            ShadowDontUse = False
            ShadowEnabled = False
            ReservedBoolean = False
            ShadowOffset = 3
            ShadowTransparency = 60
            FontColor = '0 -1 -1 -1 -1'
            HotFontColor = '0 -1 -1 -1 -1'
            PaintingTransparency = 100
            GradientPercent = 0
            GradientData = ' '
            ImagePercent = 0
            ShowFocus = False
            FadingEnabled = False
            FadingIntervalIn = 5
            FadingIntervalOut = 5
            FadingIterations = 5
            HotPaintingColor = clWhite
            HotPaintingTransparency = 100
            HotPaintingBevel = cbNone
            HotPaintingBevelWidth = 2
            HotGradientPercent = 0
            HotGradientData = ' '
            HotImagePercent = 0
            PaintingColorBorderTop = clBlack
            PaintingColorBorderBottom = clBlack
            SelectionBorderBevel = ebLowered
            SelectionBorderWidth = 2
            SelectionColor = clWhite
          end
          item
            SectionName = 'SCROLLBTNLeft'
            ParentClassName = 'SCROLLBTNBOTTOM'
            PaintingColor = clWhite
            PaintingBevel = cbNone
            PaintingBevelWidth = 2
            ShadowBlur = 6
            ShadowColor = clBlack
            ShadowDontUse = False
            ShadowEnabled = False
            ReservedBoolean = False
            ShadowOffset = 3
            ShadowTransparency = 60
            FontColor = '0 -1 -1 -1 -1'
            HotFontColor = '0 -1 -1 -1 -1'
            PaintingTransparency = 100
            GradientPercent = 0
            GradientData = ' '
            ImagePercent = 0
            ShowFocus = False
            FadingEnabled = False
            FadingIntervalIn = 5
            FadingIntervalOut = 5
            FadingIterations = 5
            HotPaintingColor = clWhite
            HotPaintingTransparency = 100
            HotPaintingBevel = cbNone
            HotPaintingBevelWidth = 2
            HotGradientPercent = 0
            HotGradientData = ' '
            HotImagePercent = 0
            PaintingColorBorderTop = clBlack
            PaintingColorBorderBottom = clBlack
            SelectionBorderBevel = ebLowered
            SelectionBorderWidth = 2
            SelectionColor = clWhite
          end
          item
            SectionName = 'SCROLLBTNBottom'
            PaintingColor = clWhite
            PaintingBevel = cbNone
            PaintingBevelWidth = 2
            ShadowBlur = 6
            ShadowColor = clBlack
            ShadowDontUse = False
            ShadowEnabled = False
            ReservedBoolean = False
            ShadowOffset = 3
            ShadowTransparency = 60
            FontColor = '0 -1 -1 -1 -1'
            HotFontColor = '0 -1 -1 -1 -1'
            PaintingTransparency = 100
            GradientPercent = 0
            GradientData = ' '
            ImagePercent = 0
            ShowFocus = False
            FadingEnabled = False
            FadingIntervalIn = 5
            FadingIntervalOut = 5
            FadingIterations = 5
            HotPaintingColor = clWhite
            HotPaintingTransparency = 100
            HotPaintingBevel = cbNone
            HotPaintingBevelWidth = 2
            HotGradientPercent = 0
            HotGradientData = ' '
            HotImagePercent = 0
            PaintingColorBorderTop = clBlack
            PaintingColorBorderBottom = clBlack
            SelectionBorderBevel = ebLowered
            SelectionBorderWidth = 2
            SelectionColor = clWhite
          end
          item
            SectionName = 'TsTrackBar'
            PaintingColor = 15791348
            PaintingBevel = cbNone
            PaintingBevelWidth = 2
            ShadowBlur = 3
            ShadowColor = clBlack
            ShadowDontUse = False
            ShadowEnabled = True
            ReservedBoolean = False
            ShadowOffset = 4
            ShadowTransparency = 50
            FontColor = '0 -1 -1 -1 -1'
            HotFontColor = '0 -1 -1 -1 -1'
            PaintingTransparency = 100
            GradientPercent = 100
            GradientData = '16777215;8421504;99;0;0;8421504;8421504;0;0;0'
            ImagePercent = 0
            ShowFocus = False
            FadingEnabled = True
            FadingIntervalIn = 5
            FadingIntervalOut = 5
            FadingIterations = 5
            HotPaintingColor = clWhite
            HotPaintingTransparency = 100
            HotPaintingBevel = cbNone
            HotPaintingBevelWidth = 2
            HotGradientPercent = 0
            HotGradientData = ' '
            HotImagePercent = 0
            PaintingColorBorderTop = clBlack
            PaintingColorBorderBottom = clBlack
            SelectionBorderBevel = ebLowered
            SelectionBorderWidth = 2
            SelectionColor = clWhite
          end
          item
            SectionName = 'ScrollSliderH'
            ParentClassName = 'SCROLLBTNBottom'
            PaintingColor = clWhite
            PaintingBevel = cbNone
            PaintingBevelWidth = 2
            ShadowBlur = 6
            ShadowColor = clBlack
            ShadowDontUse = False
            ShadowEnabled = False
            ReservedBoolean = False
            ShadowOffset = 3
            ShadowTransparency = 60
            FontColor = '0 -1 -1 -1 -1'
            HotFontColor = '0 -1 -1 -1 -1'
            PaintingTransparency = 100
            GradientPercent = 0
            GradientData = ' '
            ImagePercent = 0
            ShowFocus = False
            FadingEnabled = False
            FadingIntervalIn = 5
            FadingIntervalOut = 5
            FadingIterations = 5
            HotPaintingColor = clWhite
            HotPaintingTransparency = 100
            HotPaintingBevel = cbNone
            HotPaintingBevelWidth = 2
            HotGradientPercent = 0
            HotGradientData = ' '
            HotImagePercent = 0
            PaintingColorBorderTop = clBlack
            PaintingColorBorderBottom = clBlack
            SelectionBorderBevel = ebLowered
            SelectionBorderWidth = 2
            SelectionColor = clWhite
          end
          item
            SectionName = 'ScrollSliderV'
            ParentClassName = 'SCROLLBTNBOTTOM'
            PaintingColor = clWhite
            PaintingBevel = cbNone
            PaintingBevelWidth = 2
            ShadowBlur = 6
            ShadowColor = clBlack
            ShadowDontUse = False
            ShadowEnabled = False
            ReservedBoolean = False
            ShadowOffset = 3
            ShadowTransparency = 60
            FontColor = '0 -1 -1 -1 -1'
            HotFontColor = '0 -1 -1 -1 -1'
            PaintingTransparency = 100
            GradientPercent = 0
            GradientData = ' '
            ImagePercent = 0
            ShowFocus = False
            FadingEnabled = False
            FadingIntervalIn = 5
            FadingIntervalOut = 5
            FadingIterations = 5
            HotPaintingColor = clWhite
            HotPaintingTransparency = 100
            HotPaintingBevel = cbNone
            HotPaintingBevelWidth = 2
            HotGradientPercent = 0
            HotGradientData = ' '
            HotImagePercent = 0
            PaintingColorBorderTop = clBlack
            PaintingColorBorderBottom = clBlack
            SelectionBorderBevel = ebLowered
            SelectionBorderWidth = 2
            SelectionColor = clWhite
          end
          item
            SectionName = 'GLOBALINFO'
            PaintingColor = 13282167
            PaintingBevel = cbNone
            PaintingBevelWidth = 2
            ShadowBlur = 6
            ShadowColor = clBlack
            ShadowDontUse = False
            ShadowEnabled = False
            ReservedBoolean = False
            ShadowOffset = 3
            ShadowTransparency = 60
            FontColor = '0 -1 -1 -1 -1'
            HotFontColor = '0 -1 -1 -1 -1'
            PaintingTransparency = 0
            GradientPercent = 0
            GradientData = ' '
            ImagePercent = 0
            ShowFocus = False
            FadingEnabled = False
            FadingIntervalIn = 5
            FadingIntervalOut = 5
            FadingIterations = 5
            HotPaintingColor = clWhite
            HotPaintingTransparency = 0
            HotPaintingBevel = cbNone
            HotPaintingBevelWidth = 2
            HotGradientPercent = 0
            HotGradientData = ' '
            HotImagePercent = 0
            PaintingColorBorderTop = clBlack
            PaintingColorBorderBottom = clBlack
            SelectionBorderBevel = ebLowered
            SelectionBorderWidth = 2
            SelectionColor = clWhite
          end
          item
            SectionName = 'TFRAME'
            ParentClassName = 'TSPANEL_LOWERED'
            PaintingColor = 14270630
            PaintingBevel = cbNone
            PaintingBevelWidth = 2
            ShadowBlur = 6
            ShadowColor = clBlack
            ShadowDontUse = False
            ShadowEnabled = False
            ReservedBoolean = False
            ShadowOffset = 3
            ShadowTransparency = 60
            FontColor = '0 -1 -1 -1 -1'
            HotFontColor = '0 -1 -1 -1 -1'
            PaintingTransparency = 100
            GradientPercent = 0
            GradientData = '14927761;16777215;99;0;0;16777215;16777215;0;0;0'
            ImagePercent = 0
            ShowFocus = False
            FadingEnabled = False
            FadingIntervalIn = 5
            FadingIntervalOut = 5
            FadingIterations = 5
            HotPaintingColor = clWhite
            HotPaintingTransparency = 0
            HotPaintingBevel = cbNone
            HotPaintingBevelWidth = 2
            HotGradientPercent = 0
            HotGradientData = ' '
            HotImagePercent = 0
            PaintingColorBorderTop = clBlack
            PaintingColorBorderBottom = clBlack
            SelectionBorderBevel = ebLowered
            SelectionBorderWidth = 2
            SelectionColor = clWhite
          end
          item
            SectionName = 'PROGRESSV'
            PaintingColor = clWhite
            PaintingBevel = cbNone
            PaintingBevelWidth = 2
            ShadowBlur = 6
            ShadowColor = clBlack
            ShadowDontUse = False
            ShadowEnabled = False
            ReservedBoolean = False
            ShadowOffset = 3
            ShadowTransparency = 60
            FontColor = '0 -1 -1 -1 -1'
            HotFontColor = '0 -1 -1 -1 -1'
            PaintingTransparency = 30
            GradientPercent = 100
            GradientData = 
              '11038517;16776960;52;0;0;16776960;10384184;47;0;0;10384184;10384' +
              '184;0;0;0'
            ImagePercent = 0
            ShowFocus = False
            FadingEnabled = False
            FadingIntervalIn = 5
            FadingIntervalOut = 5
            FadingIterations = 5
            HotPaintingColor = clWhite
            HotPaintingTransparency = 0
            HotPaintingBevel = cbNone
            HotPaintingBevelWidth = 2
            HotGradientPercent = 0
            HotGradientData = ' '
            HotImagePercent = 0
            PaintingColorBorderTop = clBlack
            PaintingColorBorderBottom = clBlack
            SelectionBorderBevel = ebLowered
            SelectionBorderWidth = 2
            SelectionColor = clWhite
          end
          item
            SectionName = 'TsButton_BIG'
            ParentClassName = 'TsButton'
            PaintingColor = 13605716
            PaintingBevel = cbNone
            PaintingBevelWidth = 2
            ShadowBlur = 6
            ShadowColor = clBlack
            ShadowDontUse = False
            ShadowEnabled = False
            ReservedBoolean = False
            ShadowOffset = 3
            ShadowTransparency = 60
            FontColor = '0 -1 -1 -1 -1'
            HotFontColor = '16774621 7954485 7954485 -1 -1'
            PaintingTransparency = 80
            GradientPercent = 100
            GradientData = 
              '16777215;11433745;77;0;0;11433745;13017186;21;0;0;13017186;13017' +
              '186;0;0;0'
            ImagePercent = 0
            ShowFocus = True
            FadingEnabled = True
            FadingIntervalIn = 5
            FadingIntervalOut = 5
            FadingIterations = 15
            HotPaintingColor = clWhite
            HotPaintingTransparency = 80
            HotPaintingBevel = cbNone
            HotPaintingBevelWidth = 2
            HotGradientPercent = 100
            HotGradientData = 
              '16777215;16703892;56;0;0;16703892;11898726;43;0;0;11898726;11898' +
              '726;0;0;0'
            HotImagePercent = 0
            PaintingColorBorderTop = clBlack
            PaintingColorBorderBottom = clBlack
            SelectionBorderBevel = ebLowered
            SelectionBorderWidth = 2
            SelectionColor = clWhite
          end
          item
            SectionName = 'TsTabControl'
            ParentClassName = 'TsPageControl'
            PaintingColor = 14797990
            PaintingBevel = cbRaisedSoft
            PaintingBevelWidth = 2
            ShadowBlur = 6
            ShadowColor = clBlack
            ShadowDontUse = False
            ShadowEnabled = False
            ReservedBoolean = False
            ShadowOffset = 3
            ShadowTransparency = 60
            FontColor = '0 -1 -1 -1 -1'
            HotFontColor = '0 -1 -1 -1 -1'
            PaintingTransparency = 100
            GradientPercent = 100
            GradientData = '16777215;8999681;99;0;0;8999681;8999681;0;0;0'
            ImagePercent = 0
            ShowFocus = False
            FadingEnabled = False
            FadingIntervalIn = 5
            FadingIntervalOut = 5
            FadingIterations = 5
            HotPaintingColor = clWhite
            HotPaintingTransparency = 0
            HotPaintingBevel = cbNone
            HotPaintingBevelWidth = 2
            HotGradientPercent = 0
            HotGradientData = ' '
            HotImagePercent = 0
            PaintingColorBorderTop = clBlack
            PaintingColorBorderBottom = clBlack
            SelectionBorderBevel = ebLowered
            SelectionBorderWidth = 2
            SelectionColor = clWhite
          end
          item
            SectionName = 'MainMenu'
            PaintingColor = 12753765
            PaintingBevel = cbNone
            PaintingBevelWidth = 2
            ShadowBlur = 6
            ShadowColor = clBlack
            ShadowDontUse = False
            ShadowEnabled = False
            ReservedBoolean = False
            ShadowOffset = 3
            ShadowTransparency = 60
            FontColor = '0 -1 -1 -1 -1'
            HotFontColor = '0 -1 -1 -1 -1'
            PaintingTransparency = 0
            GradientPercent = 0
            GradientData = 
              '16777215;15716271;15;1;0;15716271;13215350;72;1;0;13215350;16777' +
              '215;11;1;0;16777215;16777215;0;1;0'
            ImagePercent = 0
            ShowFocus = False
            FadingEnabled = False
            FadingIntervalIn = 5
            FadingIntervalOut = 5
            FadingIterations = 5
            HotPaintingColor = clWhite
            HotPaintingTransparency = 0
            HotPaintingBevel = cbNone
            HotPaintingBevelWidth = 2
            HotGradientPercent = 0
            HotGradientData = ' '
            HotImagePercent = 0
            PaintingColorBorderTop = clBlack
            PaintingColorBorderBottom = clBlack
            SelectionBorderBevel = ebLowered
            SelectionBorderWidth = 2
            SelectionColor = clWhite
          end
          item
            SectionName = 'MenuItem'
            PaintingColor = clWhite
            PaintingBevel = cbNone
            PaintingBevelWidth = 2
            ShadowBlur = 6
            ShadowColor = clBlack
            ShadowDontUse = False
            ShadowEnabled = False
            ReservedBoolean = False
            ShadowOffset = 3
            ShadowTransparency = 60
            FontColor = '0 -1 -1 -1 -1'
            HotFontColor = '0 -1 -1 16439433 16439433'
            PaintingTransparency = 100
            GradientPercent = 0
            ImagePercent = 0
            ShowFocus = False
            FadingEnabled = False
            FadingIntervalIn = 5
            FadingIntervalOut = 5
            FadingIterations = 5
            HotPaintingColor = 12147712
            HotPaintingTransparency = 50
            HotPaintingBevel = cbNone
            HotPaintingBevelWidth = 2
            HotGradientPercent = 100
            HotGradientData = '8481867;16765514;99;0;0;16765514;16765514;0;0;0'
            HotImagePercent = 0
            PaintingColorBorderTop = clBlack
            PaintingColorBorderBottom = clBlack
            SelectionBorderBevel = ebLowered
            SelectionBorderWidth = 2
            SelectionColor = clWhite
          end
          item
            SectionName = 'TsEdit'
            PaintingColor = clWhite
            PaintingBevel = cbRaisedSoft
            PaintingBevelWidth = 1
            ShadowBlur = 6
            ShadowColor = clBlack
            ShadowDontUse = False
            ShadowEnabled = False
            ReservedBoolean = False
            ShadowOffset = 3
            ShadowTransparency = 60
            FontColor = '0 -1 -1 -1 -1'
            HotFontColor = '0 -1 -1 -1 -1'
            PaintingTransparency = 0
            GradientPercent = 0
            GradientData = ' '
            ImagePercent = 0
            ShowFocus = False
            FadingEnabled = False
            FadingIntervalIn = 5
            FadingIntervalOut = 5
            FadingIterations = 5
            HotPaintingColor = clWhite
            HotPaintingTransparency = 0
            HotPaintingBevel = cbNone
            HotPaintingBevelWidth = 2
            HotGradientPercent = 0
            HotGradientData = ' '
            HotImagePercent = 0
            PaintingColorBorderTop = 7422976
            PaintingColorBorderBottom = 7422976
            SelectionBorderBevel = ebRaised
            SelectionBorderWidth = 1
            SelectionColor = clWhite
          end
          item
            SectionName = 'DIVIDER'
            PaintingColor = clWhite
            PaintingBevel = cbNone
            PaintingBevelWidth = 2
            ShadowBlur = 6
            ShadowColor = clBlack
            ShadowDontUse = False
            ShadowEnabled = False
            ReservedBoolean = False
            ShadowOffset = 3
            ShadowTransparency = 60
            FontColor = '0 -1 -1 -1 -1'
            HotFontColor = '0 -1 -1 -1 -1'
            PaintingTransparency = 0
            GradientPercent = 0
            GradientData = ' '
            ImagePercent = 0
            ShowFocus = False
            FadingEnabled = False
            FadingIntervalIn = 5
            FadingIntervalOut = 5
            FadingIterations = 5
            HotPaintingColor = clWhite
            HotPaintingTransparency = 0
            HotPaintingBevel = cbNone
            HotPaintingBevelWidth = 2
            HotGradientPercent = 0
            HotGradientData = ' '
            HotImagePercent = 0
            PaintingColorBorderTop = clBlack
            PaintingColorBorderBottom = clBlack
            SelectionBorderBevel = ebLowered
            SelectionBorderWidth = 2
            SelectionColor = clWhite
          end
          item
            SectionName = 'TABTOP'
            PaintingColor = clWhite
            PaintingBevel = cbNone
            PaintingBevelWidth = 2
            ShadowBlur = 6
            ShadowColor = clBlack
            ShadowDontUse = False
            ShadowEnabled = False
            ReservedBoolean = False
            ShadowOffset = 3
            ShadowTransparency = 60
            FontColor = '0 -1 -1 -1 -1'
            HotFontColor = '0 -1 -1 -1 -1'
            PaintingTransparency = 50
            GradientPercent = 100
            GradientData = '16765568;7621153;99;0;0;7621153;7621153;0;0;0'
            ImagePercent = 0
            ShowFocus = False
            FadingEnabled = False
            FadingIntervalIn = 5
            FadingIntervalOut = 5
            FadingIterations = 5
            HotPaintingColor = clWhite
            HotPaintingTransparency = 0
            HotPaintingBevel = cbNone
            HotPaintingBevelWidth = 2
            HotGradientPercent = 100
            HotGradientData = '9065984;16772535;99;0;0;16772535;16772535;0;0;0'
            HotImagePercent = 0
            PaintingColorBorderTop = clBlack
            PaintingColorBorderBottom = clBlack
            SelectionBorderBevel = ebLowered
            SelectionBorderWidth = 2
            SelectionColor = clWhite
          end
          item
            SectionName = 'TABRIGHT'
            PaintingColor = clWhite
            PaintingBevel = cbNone
            PaintingBevelWidth = 2
            ShadowBlur = 6
            ShadowColor = clBlack
            ShadowDontUse = False
            ShadowEnabled = False
            ReservedBoolean = False
            ShadowOffset = 3
            ShadowTransparency = 60
            FontColor = '0 -1 -1 -1 -1'
            HotFontColor = '0 -1 -1 -1 -1'
            PaintingTransparency = 50
            GradientPercent = 100
            GradientData = '16765568;7621153;99;1;0;7621153;7621153;0;1;0'
            ImagePercent = 0
            ShowFocus = False
            FadingEnabled = False
            FadingIntervalIn = 5
            FadingIntervalOut = 5
            FadingIterations = 5
            HotPaintingColor = clWhite
            HotPaintingTransparency = 0
            HotPaintingBevel = cbNone
            HotPaintingBevelWidth = 2
            HotGradientPercent = 100
            HotGradientData = '16773030;9201478;99;1;0;9201478;9201478;0;1;0'
            HotImagePercent = 0
            PaintingColorBorderTop = clBlack
            PaintingColorBorderBottom = clBlack
            SelectionBorderBevel = ebLowered
            SelectionBorderWidth = 2
            SelectionColor = clWhite
          end
          item
            SectionName = 'TABLEFT'
            PaintingColor = clWhite
            PaintingBevel = cbNone
            PaintingBevelWidth = 2
            ShadowBlur = 6
            ShadowColor = clBlack
            ShadowDontUse = False
            ShadowEnabled = False
            ReservedBoolean = False
            ShadowOffset = 3
            ShadowTransparency = 60
            FontColor = '0 -1 -1 -1 -1'
            HotFontColor = '0 -1 -1 -1 -1'
            PaintingTransparency = 50
            GradientPercent = 100
            GradientData = '16765568;7621153;99;1;0;7621153;7621153;0;1;0'
            ImagePercent = 0
            ShowFocus = False
            FadingEnabled = False
            FadingIntervalIn = 5
            FadingIntervalOut = 5
            FadingIterations = 5
            HotPaintingColor = clWhite
            HotPaintingTransparency = 0
            HotPaintingBevel = cbNone
            HotPaintingBevelWidth = 2
            HotGradientPercent = 100
            HotGradientData = '9065984;16773574;99;1;0;16773574;16773574;0;1;0'
            HotImagePercent = 0
            PaintingColorBorderTop = clBlack
            PaintingColorBorderBottom = clBlack
            SelectionBorderBevel = ebLowered
            SelectionBorderWidth = 2
            SelectionColor = clWhite
          end
          item
            SectionName = 'TABBOTTOM'
            PaintingColor = clWhite
            PaintingBevel = cbNone
            PaintingBevelWidth = 2
            ShadowBlur = 6
            ShadowColor = clBlack
            ShadowDontUse = False
            ShadowEnabled = False
            ReservedBoolean = False
            ShadowOffset = 3
            ShadowTransparency = 60
            FontColor = '0 -1 -1 -1 -1'
            HotFontColor = '0 -1 -1 -1 -1'
            PaintingTransparency = 50
            GradientPercent = 100
            GradientData = '11567919;16777215;99;0;0;16777215;16777215;0;0;0'
            ImagePercent = 0
            ShowFocus = False
            FadingEnabled = False
            FadingIntervalIn = 5
            FadingIntervalOut = 5
            FadingIterations = 5
            HotPaintingColor = clWhite
            HotPaintingTransparency = 0
            HotPaintingBevel = cbNone
            HotPaintingBevelWidth = 2
            HotGradientPercent = 100
            HotGradientData = '9065984;16774593;99;0;0;16774593;16774593;0;0;0'
            HotImagePercent = 0
            PaintingColorBorderTop = clBlack
            PaintingColorBorderBottom = clBlack
            SelectionBorderBevel = ebLowered
            SelectionBorderWidth = 2
            SelectionColor = clWhite
          end
          item
            SectionName = 'FormTitle'
            PaintingColor = clWhite
            PaintingBevel = cbNone
            PaintingBevelWidth = 2
            ShadowBlur = 6
            ShadowColor = clBlack
            ShadowDontUse = False
            ShadowEnabled = False
            ReservedBoolean = False
            ShadowOffset = 3
            ShadowTransparency = 60
            FontColor = '6636336 -1 -1 16043927 16043927'
            HotFontColor = '16380390 4072704 4072704 -1 -1'
            PaintingTransparency = 50
            GradientPercent = 100
            GradientData = 
              '7754286;16777215;9;0;0;16777215;9661497;17;0;0;9661497;14661514;' +
              '73;0;0;14661514;14661514;0;0;0'
            ImagePercent = 0
            ShowFocus = False
            FadingEnabled = False
            FadingIntervalIn = 5
            FadingIntervalOut = 5
            FadingIterations = 5
            HotPaintingColor = clWhite
            HotPaintingTransparency = 0
            HotPaintingBevel = cbNone
            HotPaintingBevelWidth = 2
            HotGradientPercent = 100
            HotGradientData = 
              '16640930;12422978;45;0;0;12422978;9726787;7;0;0;9726787;12619056' +
              ';46;0;0;12619056;12619056;0;0;0'
            HotImagePercent = 0
            PaintingColorBorderTop = clBlack
            PaintingColorBorderBottom = clBlack
            SelectionBorderBevel = ebLowered
            SelectionBorderWidth = 2
            SelectionColor = clWhite
          end
          item
            SectionName = 'Form'
            PaintingColor = 13679769
            PaintingBevel = cbNone
            PaintingBevelWidth = 2
            ShadowBlur = 6
            ShadowColor = clBlack
            ShadowDontUse = False
            ShadowEnabled = False
            ReservedBoolean = True
            ShadowOffset = 3
            ShadowTransparency = 60
            FontColor = '0 -1 -1 -1 -1'
            HotFontColor = '0 -1 -1 -1 -1'
            PaintingTransparency = 0
            GradientPercent = 0
            GradientData = '14071693;13878443;99;0;0;13878443;13878443;0;0;0'
            ImagePercent = 100
            ShowFocus = False
            FadingEnabled = False
            FadingIntervalIn = 5
            FadingIntervalOut = 5
            FadingIterations = 5
            HotPaintingColor = 13679769
            HotPaintingTransparency = 0
            HotPaintingBevel = cbNone
            HotPaintingBevelWidth = 2
            HotGradientPercent = 0
            HotGradientData = '14071693;13878443;99;0;0;13878443;13878443;0;0;0'
            HotImagePercent = 100
            PaintingColorBorderTop = clBlack
            PaintingColorBorderBottom = clBlack
            SelectionBorderBevel = ebLowered
            SelectionBorderWidth = 2
            SelectionColor = clWhite
          end
          item
            SectionName = 'TsToolButton'
            PaintingColor = clWhite
            PaintingBevel = cbNone
            PaintingBevelWidth = 2
            ShadowBlur = 6
            ShadowColor = clBlack
            ShadowDontUse = False
            ShadowEnabled = False
            ReservedBoolean = False
            ShadowOffset = 3
            ShadowTransparency = 60
            FontColor = '3023890 -1 -1 -1 -1'
            HotFontColor = '16774621 -1 -1 7099695 7099695'
            PaintingTransparency = 100
            GradientPercent = 0
            GradientData = ' '
            ImagePercent = 0
            ShowFocus = False
            FadingEnabled = True
            FadingIntervalIn = 5
            FadingIntervalOut = 5
            FadingIterations = 20
            HotPaintingColor = clWhite
            HotPaintingTransparency = 0
            HotPaintingBevel = cbNone
            HotPaintingBevelWidth = 2
            HotGradientPercent = 100
            HotGradientData = 
              '15786450;15983053;3;0;0;15983053;9204561;12;0;0;9204561;15912247' +
              ';84;0;0;15912247;15912247;0;0;0'
            HotImagePercent = 0
            PaintingColorBorderTop = clBlack
            PaintingColorBorderBottom = clBlack
            SelectionBorderBevel = ebLowered
            SelectionBorderWidth = 2
            SelectionColor = clWhite
          end
          item
            SectionName = 'TsButton'
            PaintingColor = clWhite
            PaintingBevel = cbNone
            PaintingBevelWidth = 2
            ShadowBlur = 6
            ShadowColor = clBlack
            ShadowDontUse = False
            ShadowEnabled = False
            ReservedBoolean = False
            ShadowOffset = 3
            ShadowTransparency = 60
            FontColor = '0 -1 -1 -1 -1'
            HotFontColor = '16774621 7954485 7954485 -1 -1'
            PaintingTransparency = 50
            GradientPercent = 100
            GradientData = '10383683;16437637;99;0;0;16437637;16437637;0;0;0'
            ImagePercent = 0
            ShowFocus = True
            FadingEnabled = True
            FadingIntervalIn = 5
            FadingIntervalOut = 5
            FadingIterations = 15
            HotPaintingColor = clWhite
            HotPaintingTransparency = 0
            HotPaintingBevel = cbNone
            HotPaintingBevelWidth = 2
            HotGradientPercent = 100
            HotGradientData = '16371206;5648131;99;0;0;5648131;5648131;0;0;0'
            HotImagePercent = 0
            PaintingColorBorderTop = clBlack
            PaintingColorBorderBottom = clBlack
            SelectionBorderBevel = ebLowered
            SelectionBorderWidth = 2
            SelectionColor = clWhite
          end
          item
            SectionName = 'TsSpeedButton'
            PaintingColor = clWhite
            PaintingBevel = cbNone
            PaintingBevelWidth = 2
            ShadowBlur = 6
            ShadowColor = clBlack
            ShadowDontUse = False
            ShadowEnabled = False
            ReservedBoolean = False
            ShadowOffset = 3
            ShadowTransparency = 60
            FontColor = '3023890 -1 -1 -1 -1'
            HotFontColor = '16774621 7954485 7954485 -1 -1'
            PaintingTransparency = 100
            GradientPercent = 0
            GradientData = ' '
            ImagePercent = 0
            ShowFocus = False
            FadingEnabled = True
            FadingIntervalIn = 5
            FadingIntervalOut = 5
            FadingIterations = 15
            HotPaintingColor = 16639645
            HotPaintingTransparency = 50
            HotPaintingBevel = cbNone
            HotPaintingBevelWidth = 2
            HotGradientPercent = 100
            HotGradientData = 
              '15786450;15983053;3;0;0;15983053;9204561;12;0;0;9204561;15912247' +
              ';84;0;0;15912247;15912247;0;0;0'
            HotImagePercent = 0
            PaintingColorBorderTop = clBlack
            PaintingColorBorderBottom = clBlack
            SelectionBorderBevel = ebLowered
            SelectionBorderWidth = 2
            SelectionColor = clWhite
          end
          item
            PaintingColor = clBlack
            PaintingBevel = cbNone
            PaintingBevelWidth = 0
            ShadowBlur = 0
            ShadowColor = clBlack
            ShadowDontUse = False
            ShadowEnabled = False
            ReservedBoolean = False
            ShadowOffset = 0
            ShadowTransparency = 0
            PaintingTransparency = 0
            GradientPercent = 0
            ImagePercent = 0
            ShowFocus = False
            FadingEnabled = False
            FadingIntervalIn = 0
            FadingIntervalOut = 0
            FadingIterations = 0
            HotPaintingColor = clBlack
            HotPaintingTransparency = 0
            HotPaintingBevel = cbNone
            HotPaintingBevelWidth = 0
            HotGradientPercent = 0
            HotImagePercent = 0
            PaintingColorBorderTop = clBlack
            PaintingColorBorderBottom = clBlack
            SelectionBorderBevel = ebNone
            SelectionBorderWidth = 0
            SelectionColor = clBlack
          end>
        Images = <
          item
            SectionName = 'TSGROUPBOX'
            PropertyName = 'BORDERSMASK'
            Left = 63
            Top = 72
            Right = 84
            Bottom = 114
            ImageCount = 1
            MaskType = 1
          end
          item
            SectionName = 'TSPANEL'
            PropertyName = 'BORDERSMASK'
            Left = 189
            Top = 72
            Right = 210
            Bottom = 114
            ImageCount = 1
            MaskType = 1
          end
          item
            SectionName = 'TSPAGECONTROL'
            PropertyName = 'BORDERSMASK'
            Left = 135
            Top = 60
            Right = 147
            Bottom = 72
            ImageCount = 1
            MaskType = 0
          end
          item
            SectionName = 'PROGRESSH'
            PropertyName = 'BORDERSMASK'
            Left = 189
            Top = 72
            Right = 210
            Bottom = 114
            ImageCount = 1
            MaskType = 1
          end
          item
            SectionName = 'TSGAUGE'
            PropertyName = 'BORDERSMASK'
            Left = 210
            Top = 72
            Right = 231
            Bottom = 114
            ImageCount = 1
            MaskType = 1
          end
          item
            SectionName = 'TSPANEL_LOWERED'
            PropertyName = 'BORDERSMASK'
            Left = 210
            Top = 72
            Right = 231
            Bottom = 114
            ImageCount = 1
            MaskType = 1
          end
          item
            SectionName = 'TSRADIOBUTTON'
            PropertyName = 'GLYPHCHECKED'
            Left = 49
            Top = 154
            Right = 97
            Bottom = 190
            ImageCount = 3
            MaskType = 1
          end
          item
            SectionName = 'TSRADIOBUTTON'
            PropertyName = 'GLYPHUNCHECKED'
            Left = 0
            Top = 154
            Right = 48
            Bottom = 190
            ImageCount = 3
            MaskType = 1
          end
          item
            SectionName = 'TSCHECKBOX'
            PropertyName = 'GLYPHCHECKED'
            Left = 147
            Top = 154
            Right = 195
            Bottom = 190
            ImageCount = 3
            MaskType = 1
          end
          item
            SectionName = 'TSCHECKBOX'
            PropertyName = 'GLYPHUNCHECKED'
            Left = 98
            Top = 154
            Right = 146
            Bottom = 190
            ImageCount = 3
            MaskType = 1
          end
          item
            SectionName = 'TSCOLORBOX'
            PropertyName = 'GLYPHMASK'
            Left = 195
            Top = 154
            Right = 252
            Bottom = 188
            ImageCount = 3
            MaskType = 1
          end
          item
            SectionName = 'TSCOLORBOX_1'
            PropertyName = 'GLYPHMASK'
            Left = 195
            Top = 154
            Right = 252
            Bottom = 188
            ImageCount = 3
            MaskType = 1
          end
          item
            SectionName = 'TSCOMBOBOX'
            PropertyName = 'GLYPHMASK'
            Left = 195
            Top = 154
            Right = 252
            Bottom = 188
            ImageCount = 3
            MaskType = 1
          end
          item
            SectionName = 'TSCOMBOBOXEX'
            PropertyName = 'GLYPHMASK'
            Left = 195
            Top = 154
            Right = 252
            Bottom = 188
            ImageCount = 3
            MaskType = 1
          end
          item
            SectionName = 'TSCOMBOBOXEX_1'
            PropertyName = 'GLYPHMASK'
            Left = 195
            Top = 154
            Right = 252
            Bottom = 188
            ImageCount = 3
            MaskType = 1
          end
          item
            SectionName = 'ALPHAEDIT'
            PropertyName = 'BORDERSMASK'
            Left = 63
            Top = 72
            Right = 126
            Bottom = 114
            ImageCount = 3
            MaskType = 1
          end
          item
            SectionName = 'SCROLLBAR1H'
            PropertyName = 'BORDERSMASK'
            Left = 276
            Top = 84
            Right = 291
            Bottom = 114
            ImageCount = 1
            MaskType = 1
          end
          item
            SectionName = 'SCROLLBAR2H'
            PropertyName = 'BORDERSMASK'
            Left = 276
            Top = 84
            Right = 291
            Bottom = 114
            ImageCount = 1
            MaskType = 1
          end
          item
            SectionName = 'SCROLLBAR1V'
            PropertyName = 'BORDERSMASK'
            Left = 261
            Top = 84
            Right = 276
            Bottom = 114
            ImageCount = 1
            MaskType = 1
          end
          item
            SectionName = 'SCROLLBAR2V'
            PropertyName = 'BORDERSMASK'
            Left = 261
            Top = 84
            Right = 276
            Bottom = 114
            ImageCount = 1
            MaskType = 1
          end
          item
            SectionName = 'SIMPLYEDIT'
            PropertyName = 'BORDERSMASK'
            Left = 252
            Top = 36
            Right = 264
            Bottom = 48
            ImageCount = 1
            MaskType = 0
          end
          item
            SectionName = 'TSSPEEDBUTTON_SMALL'
            PropertyName = 'BORDERSMASK'
            Left = 270
            Top = 21
            Right = 297
            Bottom = 39
            ImageCount = 3
            MaskType = 1
          end
          item
            SectionName = 'TSSTATUSBAR'
            PropertyName = 'GRIPIMAGE'
            Left = 252
            Top = 0
            Right = 270
            Bottom = 36
            ImageCount = 1
            MaskType = 1
          end
          item
            SectionName = 'SCROLLBTNRIGHT'
            PropertyName = 'BORDERSMASK'
            Left = 0
            Top = 72
            Right = 63
            Bottom = 114
            ImageCount = 3
            MaskType = 1
          end
          item
            SectionName = 'SCROLLBTNRIGHT'
            PropertyName = 'GLYPHMASK'
            Left = 264
            Top = 39
            Right = 282
            Bottom = 47
            ImageCount = 3
            MaskType = 0
          end
          item
            SectionName = 'SCROLLBTNTOP'
            PropertyName = 'BORDERSMASK'
            Left = 0
            Top = 72
            Right = 63
            Bottom = 114
            ImageCount = 3
            MaskType = 1
          end
          item
            SectionName = 'SCROLLBTNTOP'
            PropertyName = 'GLYPHMASK'
            Left = 264
            Top = 47
            Right = 291
            Bottom = 52
            ImageCount = 3
            MaskType = 0
          end
          item
            SectionName = 'SCROLLBTNLEFT'
            PropertyName = 'BORDERSMASK'
            Left = 0
            Top = 72
            Right = 63
            Bottom = 114
            ImageCount = 3
            MaskType = 1
          end
          item
            SectionName = 'SCROLLBTNLEFT'
            PropertyName = 'GLYPHMASK'
            Left = 282
            Top = 39
            Right = 300
            Bottom = 47
            ImageCount = 3
            MaskType = 0
          end
          item
            SectionName = 'SCROLLBTNBOTTOM'
            PropertyName = 'BORDERSMASK'
            Left = 0
            Top = 72
            Right = 63
            Bottom = 114
            ImageCount = 3
            MaskType = 1
          end
          item
            SectionName = 'SCROLLBTNBOTTOM'
            PropertyName = 'GLYPHMASK'
            Left = 264
            Top = 53
            Right = 291
            Bottom = 58
            ImageCount = 3
            MaskType = 0
          end
          item
            SectionName = 'TSTRACKBAR'
            PropertyName = 'SLIDERCHANNEL'
            Left = 210
            Top = 60
            Right = 216
            Bottom = 72
            ImageCount = 1
            MaskType = 1
          end
          item
            SectionName = 'TSTRACKBAR'
            PropertyName = 'SLIDERMASK'
            Left = 270
            Top = 0
            Right = 303
            Bottom = 21
            ImageCount = 3
            MaskType = 0
          end
          item
            SectionName = 'TSTRACKBAR'
            PropertyName = 'SLIDERVMASK'
            Left = 147
            Top = 60
            Right = 210
            Bottom = 71
            ImageCount = 3
            MaskType = 0
          end
          item
            SectionName = 'SCROLLSLIDERH'
            PropertyName = 'BORDERSMASK'
            Left = 0
            Top = 72
            Right = 63
            Bottom = 114
            ImageCount = 3
            MaskType = 1
          end
          item
            SectionName = 'SCROLLSLIDERH'
            PropertyName = 'GLYPHMASK'
            Left = 291
            Top = 84
            Right = 299
            Bottom = 98
            ImageCount = 1
            MaskType = 1
          end
          item
            SectionName = 'SCROLLSLIDERV'
            PropertyName = 'BORDERSMASK'
            Left = 0
            Top = 72
            Right = 63
            Bottom = 114
            ImageCount = 3
            MaskType = 1
          end
          item
            SectionName = 'SCROLLSLIDERV'
            PropertyName = 'GLYPHMASK'
            Left = 292
            Top = 98
            Right = 299
            Bottom = 114
            ImageCount = 1
            MaskType = 1
          end
          item
            SectionName = 'PROGRESSV'
            PropertyName = 'BORDERSMASK'
            Left = 189
            Top = 72
            Right = 210
            Bottom = 114
            ImageCount = 1
            MaskType = 1
          end
          item
            SectionName = 'TSBUTTON_BIG'
            PropertyName = 'BORDERSMASK'
            Left = 0
            Top = 0
            Right = 135
            Bottom = 72
            ImageCount = 3
            MaskType = 1
          end
          item
            SectionName = 'MAINMENU'
            PropertyName = 'BORDERSMASK'
            Left = 189
            Top = 72
            Right = 210
            Bottom = 114
            ImageCount = 1
            MaskType = 1
          end
          item
            SectionName = 'MENUITEM'
            PropertyName = 'BORDERSMASK'
            Left = 126
            Top = 72
            Right = 168
            Bottom = 114
            ImageCount = 2
            MaskType = 1
          end
          item
            SectionName = 'DIVIDER'
            PropertyName = 'BORDERSMASK'
            Left = 298
            Top = 21
            Right = 301
            Bottom = 39
            ImageCount = 1
            MaskType = 1
          end
          item
            SectionName = 'TABTOP'
            PropertyName = 'BORDERSMASK'
            Left = 0
            Top = 190
            Right = 30
            Bottom = 250
            ImageCount = 1
            MaskType = 1
          end
          item
            SectionName = 'TABRIGHT'
            PropertyName = 'BORDERSMASK'
            Left = 90
            Top = 190
            Right = 120
            Bottom = 250
            ImageCount = 1
            MaskType = 1
          end
          item
            SectionName = 'TABLEFT'
            PropertyName = 'BORDERSMASK'
            Left = 60
            Top = 190
            Right = 90
            Bottom = 250
            ImageCount = 1
            MaskType = 1
          end
          item
            SectionName = 'TABBOTTOM'
            PropertyName = 'BORDERSMASK'
            Left = 30
            Top = 190
            Right = 60
            Bottom = 250
            ImageCount = 1
            MaskType = 1
          end
          item
            SectionName = 'FORMTITLE'
            PropertyName = 'BORDERSMASK'
            Left = 231
            Top = 60
            Right = 261
            Bottom = 114
            ImageCount = 1
            MaskType = 1
          end
          item
            SectionName = 'FORM'
            PropertyName = 'BICONCLOSE'
            Left = 244
            Top = 114
            Right = 304
            Bottom = 154
            ImageCount = 3
            MaskType = 1
          end
          item
            SectionName = 'FORM'
            PropertyName = 'BICONHELP'
            Left = 183
            Top = 114
            Right = 243
            Bottom = 154
            ImageCount = 3
            MaskType = 1
          end
          item
            SectionName = 'FORM'
            PropertyName = 'BICONMAX'
            Left = 122
            Top = 114
            Right = 182
            Bottom = 154
            ImageCount = 3
            MaskType = 1
          end
          item
            SectionName = 'FORM'
            PropertyName = 'BICONMIN'
            Left = 61
            Top = 114
            Right = 121
            Bottom = 154
            ImageCount = 3
            MaskType = 1
          end
          item
            SectionName = 'FORM'
            PropertyName = 'BICONNORM'
            Left = 122
            Top = 114
            Right = 182
            Bottom = 154
            ImageCount = 3
            MaskType = 1
          end
          item
            SectionName = 'FORM'
            PropertyName = 'BORDERSMASK'
            Left = 135
            Top = 60
            Right = 147
            Bottom = 72
            ImageCount = 1
            MaskType = 0
          end
          item
            SectionName = 'FORM'
            PropertyName = 'GRIPIMAGE'
            Left = 252
            Top = 0
            Right = 270
            Bottom = 36
            ImageCount = 1
            MaskType = 1
          end
          item
            SectionName = 'FORM'
            PropertyName = 'HOTIMAGEFILE'
            Left = 252
            Top = 154
            Right = 303
            Bottom = 190
            ImageCount = 3
            MaskType = 1
          end
          item
            SectionName = 'FORM'
            PropertyName = 'IMAGEFILE'
            Left = 252
            Top = 154
            Right = 303
            Bottom = 190
            ImageCount = 3
            MaskType = 1
          end
          item
            SectionName = 'FORM'
            PropertyName = 'TITLEBUTTON'
            Left = 0
            Top = 114
            Right = 60
            Bottom = 154
            ImageCount = 3
            MaskType = 1
          end
          item
            SectionName = 'TSTOOLBUTTON'
            PropertyName = 'BORDERSMASK'
            Left = 126
            Top = 72
            Right = 189
            Bottom = 114
            ImageCount = 3
            MaskType = 1
          end
          item
            SectionName = 'TSBUTTON'
            PropertyName = 'BORDERSMASK'
            Left = 63
            Top = 72
            Right = 126
            Bottom = 114
            ImageCount = 3
            MaskType = 1
          end
          item
            SectionName = 'TSSPEEDBUTTON'
            PropertyName = 'BORDERSMASK'
            Left = 135
            Top = 0
            Right = 252
            Bottom = 60
            ImageCount = 3
            MaskType = 1
          end>
        Patterns = <>
        MasterBitmap.Data = {
          D67E0300424DD67E030000000000360400002800000030010000FA0000000100
          180000000000A07A030000000000000000000001000000000000FFFFFF00FF00
          FF0000000000B200B2004C004C00440044002D002D000C000C00F801F800E904
          E900FF05FF00FFFDFF00DB00D400C600B300760047007324530062002D008C3E
          62009D506100290000000D010100190303004102000057262400633326002D14
          0B00DCD3D000621B000040281E00885B4800A3502700734C3800983B0700B390
          7C00C7AA9A00443D3900854F2F00A9877300BFA49400B09D9100CEB9AC00FEF4
          EE007D3300009A603800D592670066483300795A4500A780660095735C00CAA2
          8600BEA08B00B3978500CAB3A300D8CBC200563A250061442F00C0AD9F00F8F4
          F100522602006D411D006F4929003123180059463700826751009A7F6A00FADB
          C200713F13007A56360087603E00F8BB8400C2A08100C7A68800CFAD8F00CAA9
          8B0081706100D5C6B9006D533A00DCAC7B00DCB58D00DEBB9900CBAE9100EECD
          AC00F3D2B100EFCFAF00D0B59B003E3B3800F1E8DF00EBE2D900FCFBFA00A858
          000098714500C5955F00A67E5100FED5A700CFB49800B6A38F009D938800E6DB
          CF00814D1200B2895700B6956D00BC9D7900E7C59E00D8C3AA00CBC2B700F5F0
          EA00A16D2800A8763600EBB26900CCA16B00FDCC8E0074604500BDA27E00D9C6
          AD00DFCEB800F7F3EE00FDFAF600BA7002006A40030087581600E8AC5600D1AA
          7300C4A37300C3A98300BFA78400C7AE8A00C3AB8900CAB29000DBC29D00DBD4
          CA00F9F7F40092641D00B68538008B683200C4944900CCAE7E00D2B68900CDB6
          9100CFB89400CBB69600CDB99A00D5C2A400F2EDE500D18804007C4F02005950
          4100D1BE9C0093600100EBA00A005C471D00C5A25B00FEE7BB00DFCCA600E7D7
          B700E7DBC400CDAD6600CEB06E00D5B97B00D9BF8600E6CC9500F0D69E00F1DA
          AA00C5B59400E4D3AF00D7C8A700D7C8A800D1B46F00DCC59000DACDAF00DFD4
          BA00EDE3CA00F3EBD700F7F2E600FBCA4600E4D4A600FAF7EF00FFC40400ECE6
          D300FBF9F300EDE3BF00FFF8DF00E0D39F00E6DAAD00F9F6EA00F1EBCD00FFDE
          0400F5F2DF00FFF9C700FFFBD800FFEE3800FFF56800FFFEE400FFFE9900FFFF
          EF00FFFFF700FEFEFC0065656400FFFFFE00FEFEFE00FDFDFD00F9F9F900F6F6
          F600F4F4F400F3F3F300F1F1F100EDEDED00E9E9E900E5E5E500E1E1E100DBDB
          DB00D6D6D600D1D1D100CACACA00C3C3C300BDBDBD00BBBBBB00B8B8B800B7B7
          B700B2B2B200ACACAC00A5A5A5009F9F9F009999990094949400909090008A8A
          8A00848484007B7B7B00747474006E6E6E0067676700626262005E5E5E005B5B
          5B005959590056565600515151004C4C4C0046464600434343003E3E3E003B3B
          3B003A3A3A0038383800353535002D2D2D002929290026262600232323002121
          2100191919000F0F0F000B0B0B000707070005050500010101000000002D2D2D
          5B5B5BB8B8B8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5B5B5BFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFF0000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000000000FFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B
          5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B
          5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B
          5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B
          5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FF0000002D2D2D5B5B5BB8B8B8FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF5B5B5BFFFFFFFFFFFFFFFFFFFFFFFF0000000000002D2D2D2D2D2D2D2D2D2D
          2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D
          2D2D2D2D2D2D2D2D2D2D2D2D000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF0000000000005B5B5BB8B8B8FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB8B8B85B5B5B
          000000000000FFFFFFFFFFFFFFFFFFFFFFFFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000002D2D2D
          5B5B5BB8B8B8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5B5B5BFFFFFFFFFFFFFFFFFF000000
          2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D
          2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D
          2D2D000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000003A3A3A5B5B5B
          B8B8B8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFB8B8B85B5B5B3A3A3A000000FFFFFFFFFFFFFF
          FFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FF0000002D2D2D5B5B5BB8B8B8FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF5B5B5BFFFFFFFFFFFF0000002D2D2D2D2D2D2D2D2D2D2D2D3A3A3A3A3A3A5B
          5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B
          5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B3A3A3A3A3A3A000000FFFFFFFFFFFFFFFF
          FFFFFFFF0000003A3A3A5B5B5BB8B8B8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          B8B8B85B5B5B3A3A3A000000FFFFFFFFFFFFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000002D2D2D
          5B5B5BB8B8B8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5B5B5BFFFFFF0000002D2D2D2D2D2D
          2D2D2D3A3A3A3A3A3A5B5B5B5B5B5BB8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8
          B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B85B
          5B5B5B5B5B3A3A3A000000FFFFFFFFFFFF0000002D2D2D3A3A3A5B5B5BB8B8B8
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB8B8B85B5B5B3A3A3A2D2D2D000000FF
          FFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FF0000002D2D2D5B5B5BB8B8B8FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF5B5B5BFFFFFF0000002D2D2D2D2D2D3A3A3A5B5B5B5B5B5BB8B8B8B8B8B8FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB8B8B8B8B8B85B5B5B000000FFFFFFFFFF
          FF0000002D2D2D5B5B5BB8B8B8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFB8B8B85B5B5B2D2D2D000000FFFFFFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000002D2D2D
          5B5B5BB8B8B8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5B5B5B0000002D2D2D2D2D2D3A3A3A
          5B5B5B5B5B5BB8B8B8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFB8B8B85B5B5B5B5B5B0000002D2D2D2D2D2D5B5B5BB8B8B8FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB8B8B85B5B5B2D2D2D2D2D2D00
          0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FF0000002D2D2D5B5B5BB8B8B8FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF5B5B5B0000002D2D2D2D2D2D3A3A3A5B5B5BB8B8B8FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB8B8B85B5B5B0000
          002D2D2D2D2D2D5B5B5BB8B8B8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFB8B8B85B5B5B2D2D2D2D2D2D000000FF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000002D2D2D
          5B5B5BB8B8B8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5B5B5B0000002D2D2D3A3A3A5B5B5B
          B8B8B8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF5B5B5B0000002D2D2D2D2D2D5B5B5BB8B8B8FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB8B8B85B5B5B2D2D2D2D2D2D00
          0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FF0000002D2D2D5B5B5BB8B8B8FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF5B5B5B0000002D2D2D3A3A3A5B5B5BB8B8B8FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5B5B5B0000
          002D2D2D2D2D2D5B5B5BB8B8B8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFB8B8B85B5B5B2D2D2D2D2D2D000000FF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000002D2D2D
          5B5B5BB8B8B8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5B5B5B0000002D2D2D5B5B5BB8B8B8
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF5B5B5B0000002D2D2D2D2D2D5B5B5BB8B8B8FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB8B8B85B5B5B2D2D2D2D2D2D00
          0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FF0000002D2D2D5B5B5BB8B8B8FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF5B5B5B0000002D2D2D5B5B5BB8B8B8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5B5B5B0000
          002D2D2D2D2D2D5B5B5BB8B8B8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFB8B8B85B5B5B2D2D2D2D2D2D000000FF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000002D2D2D
          5B5B5BB8B8B8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5B5B5B0000002D2D2D5B5B5BB8B8B8
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF5B5B5B0000002D2D2D2D2D2D5B5B5BB8B8B8FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB8B8B85B5B5B2D2D2D2D2D2D00
          0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FF0000002D2D2D5B5B5BB8B8B8FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF5B5B5B0000002D2D2D5B5B5BB8B8B8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5B5B5B0000
          002D2D2D2D2D2D5B5B5BB8B8B8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFB8B8B85B5B5B2D2D2D2D2D2D000000FF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000002D2D2D
          5B5B5BB8B8B8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5B5B5B0000002D2D2D5B5B5BB8B8B8
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF5B5B5B0000002D2D2D2D2D2D5B5B5BB8B8B8FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB8B8B85B5B5B2D2D2D2D2D2D00
          0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FF0000002D2D2D5B5B5BB8B8B8FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF5B5B5B0000002D2D2D5B5B5BB8B8B8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5B5B5B0000
          002D2D2D2D2D2D5B5B5BB8B8B8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFB8B8B85B5B5B2D2D2D2D2D2D000000FF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000002D2D2D
          5B5B5BB8B8B8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5B5B5B0000002D2D2D5B5B5BB8B8B8
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF5B5B5B0000002D2D2D2D2D2D5B5B5BB8B8B8FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB8B8B85B5B5B2D2D2D2D2D2D00
          0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FF0000002D2D2D5B5B5BB8B8B8FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF5B5B5B0000002D2D2D5B5B5BB8B8B8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5B5B5B0000
          002D2D2D2D2D2D5B5B5BB8B8B8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFB8B8B85B5B5B2D2D2D2D2D2D000000FF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000002D2D2D
          5B5B5BB8B8B8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5B5B5B0000002D2D2D5B5B5BB8B8B8
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF5B5B5B0000002D2D2D2D2D2D5B5B5BB8B8B8FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB8B8B85B5B5B2D2D2D2D2D2D00
          0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FF0000002D2D2D5B5B5BB8B8B8FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF5B5B5B0000002D2D2D5B5B5BB8B8B8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5B5B5B0000
          002D2D2D2D2D2D5B5B5BB8B8B8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFB8B8B85B5B5B2D2D2D2D2D2D000000FF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000002D2D2D
          3A3A3A5B5B5BB8B8B8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5B5B5B0000002D2D2D5B5B5BB8B8B8
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF5B5B5B0000002D2D2D2D2D2D5B5B5BB8B8B8FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB8B8B85B5B5B2D2D2D2D2D2D00
          0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FF0000002D2D2D3A3A3A5B5B5BB8B8B8FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF5B5B5B0000002D2D2D5B5B5BB8B8B8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5B5B5B0000
          002D2D2D2D2D2D3A3A3A5B5B5BB8B8B8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          B8B8B85B5B5B3A3A3A2D2D2D2D2D2D000000FF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000002D2D2D
          2D2D2D3A3A3A5B5B5BB8B8B8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFB8B8B85B5B5B0000002D2D2D5B5B5BB8B8B8
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF5B5B5B0000002D2D2D2D2D2D3A3A3A5B5B5BB8B8B8
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB8B8B85B5B5B3A3A3A2D2D2D2D2D2D00
          0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FF0000002D2D2D2D2D2D3A3A3A5B5B5B5B5B5BB8B8B8FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB8B8B85B5B
          5B5B5B5B0000002D2D2D5B5B5BB8B8B8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5B5B5B0000
          002D2D2D2D2D2D2D2D2D3A3A3A5B5B5BB8B8B8FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB8B8B8
          5B5B5B3A3A3A2D2D2D2D2D2D2D2D2D000000FF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFFFFFF000000
          2D2D2D2D2D2D3A3A3A5B5B5B5B5B5BB8B8B8B8B8B8FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFB8B8B8B8B8B85B5B5B000000FFFFFF0000002D2D2D5B5B5BB8B8B8
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF5B5B5BFFFFFF0000002D2D2D2D2D2D3A3A3A5B5B5B
          5B5B5BB8B8B8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFB8B8B85B5B5B5B5B5B3A3A3A2D2D2D2D2D2D000000FF
          FFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFFFFFF0000002D2D2D2D2D2D2D2D2D3A3A3A3A3A3A5B
          5B5B5B5B5BB8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8
          B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B85B5B5B5B5B5B3A3A3A0000
          00FFFFFF0000002D2D2D5B5B5BB8B8B8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5B5B5BFFFF
          FF0000002D2D2D2D2D2D2D2D2D3A3A3A5B5B5B5B5B5BB8B8B8B8B8B8FFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB8B8B8B8B8B85B5B5B5B5B5B
          3A3A3A2D2D2D2D2D2D2D2D2D000000FFFFFFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFFFFFFFFFFFF
          0000002D2D2D2D2D2D2D2D2D2D2D2D3A3A3A3A3A3A5B5B5B5B5B5B5B5B5B5B5B
          5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B
          5B5B5B5B5B3A3A3A3A3A3A000000FFFFFFFFFFFF0000002D2D2D5B5B5BB8B8B8
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF5B5B5BFFFFFFFFFFFF0000002D2D2D2D2D2D2D2D2D
          3A3A3A3A3A3A5B5B5B5B5B5BB8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8
          B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8
          B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8
          B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8
          B8B8B8B85B5B5B5B5B5B3A3A3A3A3A3A2D2D2D2D2D2D2D2D2D000000FFFFFFFF
          FFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFFFFFFFFFFFFFFFFFF0000002D2D2D2D2D2D2D2D2D2D
          2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D
          2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D000000FFFFFFFFFF
          FFFFFFFF0000002D2D2D5B5B5BB8B8B8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5B5B5BFFFF
          FFFFFFFFFFFFFF0000002D2D2D2D2D2D2D2D2D2D2D2D3A3A3A3A3A3A5B5B5B5B
          5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B
          5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B
          5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B
          5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B3A3A3A3A3A3A2D2D2D2D2D2D
          2D2D2D2D2D2D000000FFFFFFFFFFFFFFFFFFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFFFFFFFFFFFF
          FFFFFFFFFFFF0000000000002D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D
          2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D
          2D2D000000000000FFFFFFFFFFFFFFFFFFFFFFFF0000002D2D2D5B5B5BB8B8B8
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF5B5B5BFFFFFFFFFFFFFFFFFFFFFFFF000000000000
          2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D
          2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D
          2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D
          2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D
          2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D000000000000FFFFFFFFFFFFFFFFFFFF
          FFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF0000002D2D2D5B5B5BB8B8B8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5B5B5BFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFE6CC95E6CC95
          92641DB68538CDAD6692641DA87636A87636B68538B68538B68538B68538C494
          49C49449C49449F0D69EF0D69EE6CC95F0D69EF0D69EF0D69EF0D69EF0D69EF0
          D69EF0D69E92641D92641D92641D522602522602FF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFEFEFCFFFFF7FFFFF7FFFFEFFFFEE4FFFBD8FF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          8758167C4F027C4F026A40036A40036A40036A40036A40036A40036A40036A40
          036A40036A40036A40036A40036A40036A400352260252260252260252260252
          26025226025226025226025226025226025226025226025226025226026A4003
          6A40036A40036A40036A40036A40036A40036A40036A40036A40036A40036A40
          036A40036A40037C4F027C4F02875816FF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFE6CC95E6CC9592641DB68538CDAD66A87636FFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5226
          02522602FF00FFFF00FFFF00FFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFCFEFEFCFFFFF7FEFEFCFFFFF7
          FFFFEFFFFEE4FFFBD8FFF9C7FEE7BBF0D69EFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FF92641D8758167C4F027C4F027C4F027C4F026A40036A
          40036A40036A40036A40036A40036A40036A40036A40036A40036A40036A4003
          6A40035226025226025226025226025226025226025226025226025226025226
          025226025226025226025226026A40036A40036A40036A40036A40036A40036A
          40036A40036A40036A40036A40036A40036A40037C4F027C4F027C4F027C4F02
          87581692641DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFE6CC95E6CC95
          92641DB68538CDAD66A87636FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF522602522602FF00FFFF00FFFF00FFFFFFFF
          FFFFFFFFFFFFFFFDFFFFFDFFFEE7BBF1DAAAF0D69EE6CC95F0D69EF0D69EF0D6
          9EF0D69EF0D69EF0D69EF0D69EF0D69EF0D69EE6CC95FEE7BBFEE7BBF1DAAADC
          C590D5B97BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC49449A8763692641D
          8758166A40036A40037C4F027C4F02FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFF92641D92641DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF7C4F027C4F026A40036A400387581692641DA87636C49449FF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFE6CC95E6CC9592641DB68538D1B46FB68538FFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5226
          02522602FF00FFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFEFFFFBD8FF
          F9C7FEE7BBFEE7BBFEE7BBFEE7BBFEE7BBFEE7BBFEE7BBFEE7BBFEE7BBFEE7BB
          FEE7BBE6CC95D5B97BC49449D5B97BD5B97BC5A25BC49449FF00FFFF00FFFF00
          FFFF00FFD5B97BC5A25BB6853892641D6A40036A40037C4F02FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF92641D92641DFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7C4F026A40036A4003
          92641DB68538C5A25BD5B97BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFE6CC95E6CC95
          92641DB68538CDAD66B68538FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF522602522602FF00FFFFFFFFFFFFFFFFFFFF
          FFFFF7FFFFF7FFFFFFFFFFFFFFFFFFFFFEE4FFFBD8FFF9C7FFF9C7FFF9C7FFF9
          C7FFF9C7FFF9C7FFF9C7FFF9C7FFF9C7FFF9C7F0D69ED5B97BC4944992641DB6
          8538B68538A8763692641DFF00FFFF00FFF0D69EDCC590D5B97BB6853892641D
          92641D92641DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFF92641D92641DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF92641D92641D92641DB68538D5B97BDCC590F0D69EFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFF0D69EF0D69E92641DB68538CDAD66A87636FFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5226
          02522602FF00FFFFFFFFFFFFFFFFF9C7FFF9C7FFFFFFFFFFFFFEE7BBC5A25B92
          641D92641D92641D92641D8B68328B6832CEB06ECDAD66C5A25BC5A25BC5A25B
          C5A25BC5A25BC5A25BB68538A8763692641D92641D92641D875816FF00FFFF00
          FFFEE7BBF1DAAAD5B97B92641DA87636B68538C49449FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0D69EF0D69EFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC49449B68538
          A8763692641DD5B97BF1DAAAFEE7BBFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFF1DAAAFEE7BB
          875816A87636CDAD66A87636FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF522602522602FFFFFFFFFFFFFFFFFFDCC590
          FEE7BBFFFFEFE6CC95B6853892641D92641D8B68328B68328B68329871459871
          45CDAD66CDAD66C5A25BC5A25BC5A25BC5A25BC5A25BC5A25BC5A25BB6853892
          641D6A40038758167C4F02875816FFFBD8FFF9C7FEE7BBC49449C49449B68538
          C5A25BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFF0D69EF0D69EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFC5A25BB68538C49449C49449FEE7BBFFF9C7FF
          FBD8FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFEE7BBFEE7BB875816A87636C5A25B92641DFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6A40
          036A4003FFFFFFFFFFFFC49449C5A25BF1DAAAF0D69EB6853892641D92641D92
          641DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFC4944992641D6A40036A40037C4F027C4F02FFFE
          E4FFFBD8FEE7BBD5B97BD5B97BC5A25BC5A25BFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0D69EF0D69EFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC5A25B
          C5A25BD5B97BD5B97BFEE7BBFFFBD8FFFEE4FF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFEE7BBFEE7BB
          7C4F0292641DC5A25B92641DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF6A40036A4003FFFFF7FFFFF792641DB68538
          D9BF86C5A25B92641D875816FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF7C4F026A40037C4F027C4F02FFFFEFFFFEE4E6CC95E6CC95F0D69EC5A25B
          C5A25BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFF0D69EF0D69EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFC5A25BC5A25BF0D69EE6CC95E6CC95FFFEE4FF
          FFEFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFFF9C7FFF9C77C4F0292641DC4944992641DFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6A40
          036A4003FFFEE4FFFEE4875816A87636CEB06E92641D875816FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7C4F027C4F026A4003FFFF
          F7FFFFEFF0D69EFEE7BBFFF9C7C5A25BC5A25BFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0D69EF0D69EFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC5A25B
          C5A25BFFF9C7FEE7BBF0D69EFFFFEFFFFFF7FF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFFFBD8FFFBD8
          7C4F0292641DC5A25B92641DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF6A40036A4003FFFBD8FFFBD87C4F0292641D
          C5A25B92641D875816FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFF7C4F026A40036A4003FFFFF7FFFFF7F0D69EFEE7BBFFF9C7C5A25B
          C5A25BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFF0D69EF0D69EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFC5A25BC5A25BFFF9C7FEE7BBF0D69EFFFFF7FF
          FFF7FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFFFBD8FFFBD87C4F0292641DC5A25B92641DFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6A40
          036A4003FFFBD8FFFBD87C4F0292641DC5A25B92641DFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6A40036A4003FEFE
          FCFEFEFCF0D69EFEE7BBFFF9C7C5A25BC5A25BFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0D69EF0D69EFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC5A25B
          C5A25BFFF9C7FEE7BBF0D69EFEFEFCFEFEFCFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFFFBD8FFFBD8
          7C4F0292641DC5A25B92641DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF6A40036A4003FFFBD8FFFBD87C4F0292641D
          C5A25B92641DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF6A40036A4003FFFFFFFFFFF7F0D69EFEE7BBFFF9C7C5A25B
          C5A25BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFE6CC95E6CC95FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFC5A25BC5A25BFFF9C7FEE7BBF0D69EFFFFF7FF
          FFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFFFBD8FFFBD87C4F0292641DC5A25B92641DFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6A40
          036A4003FFFBD8FFFBD87C4F0292641DC5A25B92641DFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6A40036A4003FFFF
          FFFEFEFCF0D69EFEE7BBFFF9C7CDAD66CDAD66FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0D69EF0D69EFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCDAD66
          CDAD66FFF9C7FEE7BBF0D69EFEFEFCFFFFFFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFFFBD8FFFBD8
          7C4F0292641DC5A25B92641DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF6A40036A4003FFFBD8FFFBD87C4F0292641D
          C5A25B92641DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF6A40036A4003FFFFFFFEFEFCF0D69EFEE7BBFFF9C7CEB06E
          CDAD66FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFF0D69EF0D69EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFCDAD66CEB06EFFF9C7FEE7BBF0D69EFEFEFCFF
          FFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFFFBD8FFFBD87C4F0292641DC5A25B92641DFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6A40
          036A4003FFFBD8FFFBD87C4F0292641DC5A25B92641DFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6A40036A4003FFFF
          FFFFFFFFF0D69EFEE7BBFFF9C78B6832987145FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC49449C49449FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF987145
          8B6832FFF9C7FEE7BBF0D69EFFFFFFFFFFFFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFFFBD8FFFBD8
          7C4F0292641DC5A25B92641DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF6A40036A4003FFFBD8FFFBD87C4F0292641D
          C5A25B92641DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF6A40036A4003FFFFFFFFFFFFF0D69EFEE7BBFFF9C78B6832
          987145FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFC49449C49449FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFF9871458B6832FFF9C7FEE7BBF0D69EFFFFFFFF
          FFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFFFBD8FFFBD87C4F0292641DC5A25B92641DFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6A40
          036A4003FFFBD8FFFBD87C4F0292641DC5A25B92641DFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6A40036A4003FFFF
          FFFFFFFFF0D69EFEE7BBFFF9C792641D8B6832FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC49449C49449FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8B6832
          92641DFFF9C7FEE7BBF0D69EFFFFFFFFFFFFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFFFBD8FFFBD8
          7C4F0292641DC5A25B92641DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF6A40036A4003FFFBD8FFFBD87C4F0292641D
          C5A25B92641DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF6A40036A4003FFFFFFFFFFFFE6CC95FEE7BBFFF9C792641D
          8B6832FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFB68538B68538FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFF8B683292641DFFF9C7FEE7BBE6CC95FFFFFFFF
          FFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFFFBD8FFFBD87C4F0292641DC5A25B92641D875816FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7C4F026A40
          036A4003FFFBD8FFFBD87C4F0292641DC5A25B92641DFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6A40036A4003FFFF
          FFFFFFFFF0D69EFEE7BBFFFBD892641D8B6832FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB68538B68538FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8B6832
          92641DFFFBD8FEE7BBF0D69EFFFFFFFFFFFFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFFFEE4FFFEE4
          875816A87636CEB06E92641D875816FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF7C4F027C4F026A4003FFF9C7FFF9C77C4F0292641D
          C4944992641DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF6A40036A4003FFFFFFFFFFFFF1DAAAFFF9C7FFFEE492641D
          92641D92641DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFB68538B68538FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF92641D92641D92641DFFFEE4FFF9C7F1DAAAFFFFFFFF
          FFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFFFFF7FFFFF792641DB68538D9BF86C5A25B92641D87
          5816FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7C4F026A40037C4F
          027C4F02FEE7BBFEE7BB7C4F0292641DC5A25B92641DFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6A40036A4003FFFF
          FFFFFFFFFEE7BBFFFBD8FFFFFFC5A25B92641D92641DFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB68538B68538FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF92641D92641D
          C5A25BFFFFFFFFFBD8FEE7BBFFFFFFFFFFFFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFFFFFFFFFFFF
          C49449C5A25BF1DAAAF0D69EB6853892641D92641D92641DFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFC4944992641D6A40036A40037C4F027C4F02FEE7BBFEE7BB875816A87636
          C5A25B92641DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF6A40036A4003FFFFFFFFFFFFFFFDFFFFFFEFFFFFFFFEE7BB
          B6853892641D875816FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFA87636A87636FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF87581692641DB68538FEE7BBFFFFFFFFFFEFFFFDFFFFFFFFFF
          FFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFFFFFFFFFFFFFFFFFFDCC590FEE7BBFFFFEFE6CC95B6
          853892641D92641D8B68328B68328B6832987145987145CDAD66CDAD66C5A25B
          C5A25BC5A25BC5A25BC5A25BC5A25BC5A25BB6853892641D6A40038758167C4F
          02875816F1DAAAFEE7BB875816A87636CDAD66A87636FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF522602522602FFFF
          FFFFFFFFFFFDFFFFFFEFFFFFFFFFFFFFE6CC95B6853892641D875816875816FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA87636A87636FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF87581687581692641DB68538E6CC95
          FFFFFFFFFFFFFFFFEFFFFDFFFFFFFFFFFFFFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFFFFFF
          FFFFFFFFF9C7FFF9C7FFFFFFFFFFFFFEE7BBC5A25B92641D92641D92641D9264
          1D8B68328B6832CEB06ECDAD66C5A25BC5A25BC5A25BC5A25BC5A25BC5A25BB6
          8538A8763692641D92641D92641D875816FF00FFF0D69EF0D69E92641DB68538
          CDAD66A87636FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF522602522602FF00FFFFFFFFFFFFFFFFFFFFFFFFF7FFFFFF
          FFFFEFF0D69EC5A25B92641D92641D92641D92641D92641D92641D92641D9264
          1D92641D92641D92641D92641D92641D92641DA87636A87636B68538B68538A8
          7636A8763692641D92641DA87636A87636B68538B68538A87636A8763692641D
          92641D92641D92641D92641D92641D92641D92641D92641D92641D92641D9264
          1D92641D92641DC5A25BF0D69EFFFFEFFFFFFFFFFFF7FFFFFFFFFFFFFFFFFFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFFFFFFFFFFFFFFFFFFFFFFF7FFFFF7FFFFFFFF
          FFFFFFFFFFFFFEE4FFFBD8FFF9C7FFF9C7FFF9C7FFF9C7FFF9C7FFF9C7FFF9C7
          FFF9C7FFF9C7FFF9C7F0D69ED5B97BC4944992641DB68538B68538A876369264
          1DFF00FFE6CC95E6CC9592641DB68538CDAD66B68538FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF522602522602FF00
          FFFFFFFFFFFFFFFFFFFFFFFFF7FFF9C7FEE7BBF1DAAAD9BF86CEB06EC5A25BC5
          A25BC5A25BC5A25BC5A25BC5A25BC5A25BC5A25BC5A25BC5A25BC49449C5A25B
          C5A25BCDAD66CDAD66CDAD66D1B46FCDAD66CDAD66CDAD66CDAD66CDAD66CDAD
          66D1B46FCDAD66CDAD66CDAD66C5A25BC5A25BC49449C5A25BC5A25BC5A25BC5
          A25BC5A25BC5A25BC5A25BC5A25BC5A25BC5A25BCEB06ED9BF86F1DAAAFEE7BB
          FFF9C7FFFFF7FFFFFFFFFFFFFFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFEFFFFBD8FFF9C7FEE7BBFEE7BBFEE7
          BBFEE7BBFEE7BBFEE7BBFEE7BBFEE7BBFEE7BBFEE7BBFEE7BBE6CC95D5B97BC4
          9449D5B97BD5B97BC5A25BC49449FF00FFFF00FFE6CC95E6CC9592641DB68538
          D1B46FB68538FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF522602522602FF00FFFF00FFFFFFFFFFFFFFFFFFFFFFF9C7
          DCC590F1DAAAD9BF86CEB06EC5A25BC5A25BC5A25BC5A25BC5A25BC5A25BC5A2
          5BC5A25BC5A25BC5A25BC49449C5A25BC5A25BCDAD66CDAD66CDAD66D1B46FCD
          AD66CDAD66CDAD66CDAD66CDAD66CDAD66D1B46FCDAD66CDAD66CDAD66C5A25B
          C5A25BC49449C5A25BC5A25BC5A25BC5A25BC5A25BC5A25BC5A25BC5A25BC5A2
          5BC5A25BCEB06ED9BF86F1DAAAFEE7BBFFF9C7FFFFFFFFFFFFFFFFFFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFFFFFFFFFFFFFFFFFFFFFDFFFF
          FDFFFEE7BBF1DAAAF0D69EE6CC95F0D69EF0D69EF0D69EF0D69EF0D69EF0D69E
          F0D69EF0D69EF0D69EE6CC95FEE7BBFEE7BBF1DAAADCC590D5B97BFF00FFFF00
          FFFF00FFE6CC95E6CC9592641DB68538CDAD66A87636FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF522602522602FF00
          FFFF00FFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFF1DAAAD9BF86CEB06EC5A25BC5
          A25BC5A25BC5A25BC5A25BC5A25BC5A25BC5A25BC5A25BC5A25BC49449C5A25B
          C5A25BCDAD66CDAD66CDAD66D1B46FCDAD66CDAD66CDAD66CDAD66CDAD66CDAD
          66D1B46FCDAD66CDAD66CDAD66C5A25BC5A25BC49449C5A25BC5A25BC5A25BC5
          A25BC5A25BC5A25BC5A25BC5A25BC5A25BC5A25BCEB06ED9BF86F1DAAAFEE7BB
          FFF9C7FFFFFFFFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFEFEFCFEFEFCFFFFF7FEFEFCFFFFF7FFFFEFFFFEE4FFFBD8FF
          F9C7FEE7BBF0D69EFF00FFFF00FFFF00FFFF00FFE6CC95E6CC9592641DB68538
          CDAD66A87636FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF522602522602FF00FFFF00FFFF00FFFF00FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFF7FFFEE4FFFBD8FFFBD8FFFBD8FFFBD8FFFBD8FFFBD8FFFB
          D8FFFBD8FFFBD8FFFBD8FFF9C7FEE7BBFEE7BBFEE7BBF0D69EE6CC95E6CC95E6
          CC95E6CC95E6CC95E6CC95E6CC95E6CC95E6CC95E6CC95F0D69EFEE7BBFEE7BB
          FEE7BBFFF9C7FFFBD8FFFBD8FFFBD8FFFBD8FFFBD8FFFBD8FFFBD8FFFBD8FFFB
          D8FFFBD8FFFEE4FFFFF7FFFFFFFFFFFFFFFFFFFFFFFFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FEFEFCFFFFF7FFFFF7FFFFEFFFFEE4FFFBD8FF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFE6CC95E6CC9592641DB68538CDAD6692641DA87636A87636B68538B6
          8538B68538B68538C49449C49449C49449F0D69EF0D69EE6CC95F0D69EF0D69E
          F0D69EF0D69EF0D69EF0D69EF0D69E92641D92641D92641D522602522602FF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFFFFFFFFFFFFFFFFF7FFFEE4FFFBD8FF
          FBD8FFFBD8FFFBD8FFFBD8FFFBD8FFFBD8FFFBD8FFFBD8FFFBD8FFF9C7FEE7BB
          FEE7BBF1DAAAF0D69EE6CC95E6CC95E6CC95E6CC95E6CC95E6CC95E6CC95E6CC
          95E6CC95E6CC95F0D69EF1DAAAFEE7BBFEE7BBFFF9C7FFFBD8FFFBD8FFFBD8FF
          FBD8FFFBD8FFFBD8FFFBD8FFFBD8FFFBD8FFFBD8FFFEE4FFFFF7FFFFFFFFFFFF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFFFFFFFFFFFF
          FEFEFEFEFEFEFDFDFDF9F9F9F9F9F9F6F6F6F6F6F6F6F6F6F9F9F9F9F9F9FDFD
          FDFEFEFEFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDF6F6F6F4
          F4F4F4F4F4F4F4F4F6F6F6FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFEFEFEFEFEFEFDFDFDF9F9F9F9
          F9F9F6F6F6F6F6F6F6F6F6F9F9F9F9F9F9FDFDFDFEFEFEFEFEFEFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFDFDFDF6F6F6F4F4F4F4F4F4F4F4F4F6F6F6FDFD
          FDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFCFB894CFB894CFB894CFB894CFB894CFB894
          CFB894CFB894CFB894CFB894CFB894CFB894CFB894CFB894CFB894CFB894CFB8
          94CFB894CFB894CFB894CFB894CFB894CFB894CFB894CFB894CFB894CFB894CF
          B894CFB894CFB894CFB894CFB894CFB894CFB894CFB894CFB894CFB894CFB894
          CFB894CFB894CFB894CFB894CFB894CFB894CFB894CFB894CFB894CFB894CFB8
          94CFB894CFB894CFB894FFFFFFFEFEFEFDFDFDFCFBFAF6F6F6F4F4F4F1F1F1ED
          EDEDEDEDEDEDEDEDF1F1F1F4F4F4F6F6F6FCFBFAFDFDFDFEFEFEFFFFFFFFFFFF
          FFFFFFFDFDFDF6F6F6F1F1F1E9E9E9E5E5E5E5E5E5E5E5E5E9E9E9F1F1F1F6F6
          F6FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFF
          FEFEFEFDFDFDFCFBFAF6F6F6F4F4F4F1F1F1EDEDEDEDEDEDEDEDEDF1F1F1F4F4
          F4F6F6F6FCFBFAFDFDFDFEFEFEFFFFFFFFFFFFFFFFFFFDFDFDF6F6F6F1F1F1E9
          E9E9E5E5E5E5E5E5E5E5E5E9E9E9F1F1F1F6F6F6FDFDFDFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCAB2
          90CAB290CAB290CAB290CAB290CAB290CAB290CAB290CAB290CAB290CAB290CA
          B290CAB290CAB290CAB290CAB290CAB290CAB290CAB290CAB290CAB290CAB290
          CAB290CAB290CAB290CAB290CAB290CAB290CAB290CAB290CAB290CAB290CAB2
          90CAB290CAB290CAB290CAB290CAB290CAB290CAB290CAB290CAB290CAB290CA
          B290CAB290CAB290CAB290CAB290CAB290CAB290CAB290CAB290FFFFFFFEFEFE
          FCFBFAF6F6F6F1F1F1676767676767676767676767676767E9E9E9EDEDEDF1F1
          F1F6F6F6FCFBFAFEFEFEFFFFFFFFFFFFFDFDFDF3F3F3E5E5E54C4C4C4C4C4C4C
          4C4C4C4C4C4C4C4CE5E5E5E5E5E5E9E9E9F3F3F3FDFDFDFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFF515151515151515151515151515151FFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFEFEFEFCFBFAF6F6F6F1F1F167676767
          6767676767676767676767E9E9E9EDEDEDF1F1F1F6F6F6FCFBFAFEFEFEFFFFFF
          FFFFFFFDFDFDF3F3F3E5E5E54C4C4C4C4C4C4C4C4C4C4C4C4C4C4CE5E5E5E5E5
          E5E9E9E9F3F3F3FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF51515151
          5151515151515151515151FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FF
          FFFFFFFFFFFFFFFFFFF3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3
          F3F3F3F3F3F3F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3F3F3F3F3F3F3
          F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFF3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3
          F3F3F3F3F3F3F3FFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFF3F3F3F3
          F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFF3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3
          F3F3F3F3F3F3F3F3F3F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3F3F3F3
          F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFCFBFAF4F4
          F4EDEDEDEDEDEDF4F4F4F9F9F9FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFC3AB89C3AB89C3AB89C3AB89C3AB89C3AB89
          C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB
          89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3
          AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89
          C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB
          89C3AB89C3AB89C3AB89FEFEFEFDFDFDF6F6F667676767676767676767676767
          6767676767676767676767676767E9E9E9F1F1F1F6F6F6FDFDFDFEFEFEFFFFFF
          F6F6F64C4C4C4C4C4C2121212121212121212121212121214C4C4C4C4C4CE5E5
          E5E9E9E9F6F6F6FFFFFFFFFFFFFFFFFFFFFFFF51515151515126262626262626
          2626262626262626515151515151FFFFFFFFFFFFFFFFFFFFFFFFFF00FFFEFEFE
          FDFDFDF6F6F66767676767676767676767676767676767676767676767676767
          67E9E9E9F1F1F1F6F6F6FDFDFDFEFEFEFFFFFFF6F6F64C4C4C4C4C4C21212121
          21212121212121212121214C4C4C4C4C4CE5E5E5E9E9E9F6F6F6FFFFFFFFFFFF
          FFFFFFFFFFFF5151515151512626262626262626262626262626265151515151
          51FFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFF9494949494948A8A8A84
          84848484848484848484848484848A8A8A949494949494F3F3F3FFFFFFFFFFFF
          FFFFFFFFFFFF9494949494948A8A8A8484848484848484848484848484848A8A
          8A949494949494F3F3F3FFFFFFFFFFFFFFFFFFFFFFFF9494949494948A8A8A84
          84848484848484848484848484848A8A8A949494949494F3F3F3FFFFFFFFFFFF
          FF00FFFFFFFFFFFFFF9494949494948A8A8A8484848484848484848484848484
          848A8A8A949494949494F3F3F3FFFFFFFFFFFFFFFFFFFFFFFF9494949494948A
          8A8A8484848484848484848484848484848A8A8A949494949494F3F3F3FFFFFF
          FFFFFFFFFFFFFFFFFF9494949494948A8A8A8484848484848484848484848484
          848A8A8A949494949494F3F3F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFEFEFEF9F9F9F1F1F1E5E5E5D6D6D6D6D6D6E5E5E5F1F1F1F9F9F9
          FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFDFDFDF4F4F4E1E1E1D1D1D1D1D1D1E1E1E1F6F6F6FDFDFDFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFA7
          84BFA784BFA784BFA784BFA784BFA784BFA784BFA784BFA784BFA784BFA784BF
          A784BFA784BFA784BFA784BFA784BFA784BFA784BFA784BFA784BFA784BFA784
          BFA784BFA784BFA784BFA784BFA784BFA784BFA784BFA784BFA784BFA784BFA7
          84BFA784BFA784BFA784BFA784BFA784BFA784BFA784BFA784BFA784BFA784BF
          A784BFA784BFA784BFA784BFA784BFA784BFA784BFA784BFA784FEFEFEF9F9F9
          6767676767676767676767676767676767676767676767676767676767676767
          67EDEDEDF4F4F4F9F9F9FEFEFEFDFDFD4C4C4C4C4C4C21212121212121212121
          21212121212121212121214C4C4C4C4C4CE5E5E5F1F1F1FDFDFDFFFFFFFFFFFF
          5151515151512626262626262626262626262626262626262626265151515151
          51FFFFFFFFFFFFFFFFFFFF00FFFEFEFEF9F9F967676767676767676767676767
          6767676767676767676767676767676767676767EDEDEDF4F4F4F9F9F9FEFEFE
          FDFDFD4C4C4C4C4C4C2121212121212121212121212121212121212121214C4C
          4C4C4C4CE5E5E5F1F1F1FDFDFDFFFFFFFFFFFF51515151515126262626262626
          2626262626262626262626262626515151515151FFFFFFFFFFFFFFFFFFFF00FF
          FFFFFF9494948A8A8A7B7B7B7474746E6E6E6E6E6E6E6E6E6E6E6E6E6E6E7474
          747B7B7B8A8A8A949494F3F3F3FFFFFFFFFFFF9494948A8A8A6E6E6E5E5E5E56
          56565656565656565656565656565E5E5E6E6E6E8A8A8A949494F3F3F3FFFFFF
          FFFFFF9494948A8A8A6E6E6E5E5E5E5656565656565656565656565656565E5E
          5E6E6E6E8A8A8A949494F3F3F3FFFFFFFF00FFFFFFFF9494948A8A8A7B7B7B74
          74746E6E6E6E6E6E6E6E6E6E6E6E6E6E6E7474747B7B7B8A8A8A949494F3F3F3
          FFFFFFFFFFFF9494948A8A8A6E6E6E5E5E5E5656565656565656565656565656
          565E5E5E6E6E6E8A8A8A949494F3F3F3FFFFFFFFFFFF9494948A8A8A6E6E6E5E
          5E5E5656565656565656565656565656565E5E5E6E6E6E8A8A8A949494F3F3F3
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDF9F9F9F1F1F1E1E1E1D1D1
          D1C3C3C3C3C3C3D1D1D1E1E1E1F1F1F1F9F9F9FDFDFDFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDF3F3F3DBDBDBC3C3C3B2B2B2B2B2B2
          C3C3C3DBDBDBF4F4F4FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFCFB894CFB894CFB894CFB894CFB894CFB894
          CFB894CFB894CFB894CFB894CFB894CFB894CFB894CFB894CFB894CFB894CFB8
          94CFB894CFB894CFB894CFB894CFB894CFB894CFB894CFB894CFB894CFB894CF
          B894CFB894CFB894CFB894CFB894CFB894CFB894CFB894CFB894CFB894CFB894
          CFB894CFB894CFB894CFB894CFB894CFB894CFB894CFB894CFB894CFB894CFB8
          94CFB894CFB894CFB894FDFDFDF9F9F967676767676767676767676767676767
          6767676767676767676767676767676767E9E9E9F1F1F1F9F9F9FDFDFDF6F6F6
          4C4C4C2121212121212121212121212121212121212121212121212121214C4C
          4CE5E5E5E9E9E9F6F6F6FFFFFFFFFFFF51515126262626262626262626262626
          2626262626262626262626262626515151FFFFFFFFFFFFFFFFFFFF00FFFDFDFD
          F9F9F96767676767676767676767676767676767676767676767676767676767
          67676767E9E9E9F1F1F1F9F9F9FDFDFDF6F6F64C4C4C21212121212121212121
          21212121212121212121212121212121214C4C4CE5E5E5E9E9E9F6F6F6FFFFFF
          FFFFFF5151512626262626262626262626262626262626262626262626262626
          26515151FFFFFFFFFFFFFFFFFFFF00FFFFFFFF9494947B7B7B6E6E6E6262625E
          5E5E5E5E5E5E5E5E5E5E5E5E5E5E6262626E6E6E7B7B7B949494F3F3F3FFFFFF
          FFFFFF9494946E6E6E5656564646463E3E3E3B3B3B3B3B3B3B3B3B3E3E3E4646
          465656566E6E6E949494F3F3F3FFFFFFFFFFFF9494946E6E6E5656564646463E
          3E3E3B3B3B3B3B3B3B3B3B3E3E3E4646465656566E6E6E949494F3F3F3FFFFFF
          FF00FFFFFFFF9494947B7B7B6E6E6E6262625E5E5E5E5E5E5E5E5E5E5E5E5E5E
          5E6262626E6E6E7B7B7B949494F3F3F3FFFFFFFFFFFF9494946E6E6E56565646
          46463E3E3E3B3B3B3B3B3B3B3B3B3E3E3E4646465656566E6E6E949494F3F3F3
          FFFFFFFFFFFF9494946E6E6E5656564646463E3E3E3B3B3B3B3B3B3B3B3B3E3E
          3E4646465656566E6E6E949494F3F3F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD
          FDFDF9F9F9F1F1F1E1E1E1D1D1D1000000000000B8B8B8C3C3C3D1D1D1E1E1E1
          F1F1F1F9F9F9FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFBFAF4F4
          F4DBDBDBC3C3C30000000000009F9F9FACACACC3C3C3DBDBDBF4F4F4FDFDFDFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCAB2
          90CAB290CAB290CAB290CAB290CAB290CAB290CAB290CAB290CAB290CAB290CA
          B290CAB290CAB290CAB290CAB290CAB290CAB290CAB290CAB290CAB290CAB290
          CAB290CAB290CAB290CAB290CAB290CAB290CAB290CAB290CAB290CAB290CAB2
          90CAB290CAB290CAB290CAB290CAB290CAB290CAB290CAB290CAB290CAB290CA
          B290CAB290CAB290CAB290CAB290CAB290CAB290CAB290CAB290FDFDFD676767
          6767676767676767676767676767676767676767676767676767676767676767
          67676767EDEDEDF6F6F6FDFDFD4C4C4C4C4C4C21212121212121212121212121
          21212121212121212121212121214C4C4C4C4C4CE5E5E5F4F4F4FFFFFF515151
          5151512626262626262626262626262626262626262626262626262626265151
          51515151FFFFFFFFFFFFFF00FFFDFDFD67676767676767676767676767676767
          6767676767676767676767676767676767676767676767EDEDEDF6F6F6FDFDFD
          4C4C4C4C4C4C2121212121212121212121212121212121212121212121212121
          214C4C4C4C4C4CE5E5E5F4F4F4FFFFFF51515151515126262626262626262626
          2626262626262626262626262626262626515151515151FFFFFFFFFFFFFF00FF
          FFFFFF8A8A8A7474746262625959595151515151515151515151515151515959
          596262627474748A8A8AF3F3F3FFFFFFFFFFFF8A8A8A5E5E5E46464635353529
          29292929292929292929292929293535354646465E5E5E8A8A8AF3F3F3FFFFFF
          FFFFFF8A8A8A5E5E5E4646463535352929292929292929292929292929293535
          354646465E5E5E8A8A8AF3F3F3FFFFFFFF00FFFFFFFF8A8A8A74747462626259
          59595151515151515151515151515151515959596262627474748A8A8AF3F3F3
          FFFFFFFFFFFF8A8A8A5E5E5E4646463535352929292929292929292929292929
          293535354646465E5E5E8A8A8AF3F3F3FFFFFFFFFFFF8A8A8A5E5E5E46464635
          35352929292929292929292929292929293535354646465E5E5E8A8A8AF3F3F3
          FFFFFFFFFFFFFFFFFFFFFFFFFEFEFEF9F9F9F1F1F1E1E1E1D1D1D10000000000
          00000000000000B7B7B7BDBDBDD1D1D1E1E1E1F1F1F1F9F9F9FEFEFEFFFFFFFF
          FFFFFFFFFFFFFFFFFCFBFAF4F4F4DBDBDBC3C3C3000000000000000000000000
          9F9F9FACACACC3C3C3DBDBDBF6F6F6FCFBFAFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFF000000000000000000000000000000000000FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFC3AB89C3AB89C3AB89C3AB89C3AB89C3AB89
          C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB
          89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3
          AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89
          C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB
          89C3AB89C3AB89C3AB89FDFDFD67676767676767676767676767676767676767
          6767676767676767676767676767676767676767EDEDEDF6F6F6FDFDFD4C4C4C
          2121212121212121212121212121212121212121212121212121212121212121
          214C4C4CE5E5E5F4F4F4FFFFFF51515126262626262626262626262626262626
          2626262626262626262626262626262626515151FFFFFFFFFFFFFF00FFFDFDFD
          6767676767676767676767676767676767676767676767676767676767676767
          67676767676767EDEDEDF6F6F6FDFDFD4C4C4C21212121212121212121212121
          21212121212121212121212121212121212121214C4C4CE5E5E5F4F4F4FFFFFF
          5151512626262626262626262626262626262626262626262626262626262626
          26262626515151FFFFFFFFFFFFFF00FFFFFFFF8484846E6E6E5E5E5E5151514C
          4C4C4C4C4C4C4C4C4C4C4C4C4C4C5151515E5E5E6E6E6E848484F3F3F3FFFFFF
          FFFFFF8484845656563E3E3E2929292121212121212121212121212121212929
          293E3E3E565656848484F3F3F3FFFFFFFFFFFF8484845656563E3E3E29292921
          21212121212121212121212121212929293E3E3E565656848484F3F3F3FFFFFF
          FF00FFFFFFFF8484846E6E6E5E5E5E5151514C4C4C4C4C4C4C4C4C4C4C4C4C4C
          4C5151515E5E5E6E6E6E848484F3F3F3FFFFFFFFFFFF8484845656563E3E3E29
          29292121212121212121212121212121212929293E3E3E565656848484F3F3F3
          FFFFFFFFFFFF8484845656563E3E3E2929292121212121212121212121212121
          212929293E3E3E565656848484F3F3F3FFFFFFFFFFFFFFFFFFFEFEFEF9F9F9F1
          F1F1E1E1E1D1D1D1000000000000000000000000000000000000B7B7B7BDBDBD
          D1D1D1E1E1E1F1F1F1F9F9F9FEFEFEFFFFFFFFFFFFFDFDFDF4F4F4DBDBDBC3C3
          C30000000000000000000000000000000000009F9F9FACACACC3C3C3DBDBDBF4
          F4F4FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000
          000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFBFA7
          84BFA784BFA784BFA784BFA784BFA784BFA784BFA784BFA784BFA784BFA784BF
          A784BFA784BFA784BFA784BFA784BFA784BFA784BFA784BFA784BFA784BFA784
          BFA784BFA784BFA784BFA784BFA784BFA784BFA784BFA784BFA784BFA784BFA7
          84BFA784BFA784BFA784BFA784BFA784BFA784BFA784BFA784BFA784BFA784BF
          A784BFA784BFA784BFA784BFA784BFA784BFA784BFA784BFA784FDFDFD676767
          6767676767676767676767676767676767676767676767676767676767676767
          67676767EDEDEDF6F6F6FDFDFD4C4C4C21212121212121212121212121212121
          21212121212121212121212121212121214C4C4CE5E5E5F4F4F4FFFFFF515151
          2626262626262626262626262626262626262626262626262626262626262626
          26515151FFFFFFFFFFFFFF00FFFDFDFD67676767676767676767676767676767
          6767676767676767676767676767676767676767676767EDEDEDF6F6F6FDFDFD
          4C4C4C2121212121212121212121212121212121212121212121212121212121
          212121214C4C4CE5E5E5F4F4F4FFFFFF51515126262626262626262626262626
          2626262626262626262626262626262626262626515151FFFFFFFFFFFFFF00FF
          FFFFFF8484846E6E6E5E5E5E5151514C4C4C4C4C4C4C4C4C4C4C4C4C4C4C5151
          515E5E5E6E6E6E848484F3F3F3FFFFFFFFFFFF8484845656563B3B3B29292921
          21212121212121212121212121212929293B3B3B565656848484F3F3F3FFFFFF
          FFFFFF8484845656563B3B3B2929292121212121212121212121212121212929
          293B3B3B565656848484F3F3F3FFFFFFFF00FFFFFFFF8484846E6E6E5E5E5E51
          51514C4C4C4C4C4C4C4C4C4C4C4C4C4C4C5151515E5E5E6E6E6E848484F3F3F3
          FFFFFFFFFFFF8484845656563B3B3B2929292121212121212121212121212121
          212929293B3B3B565656848484F3F3F3FFFFFFFFFFFF8484845656563B3B3B29
          29292121212121212121212121212121212929293B3B3B565656848484F3F3F3
          FFFFFFFFFFFFFFFFFFFDFDFDF4F4F4E5E5E5D1D1D10000000000000000000000
          00000000000000000000000000B7B7B7BDBDBDD1D1D1E5E5E5F4F4F4FCFBFAFF
          FFFFFFFFFFF9F9F9E1E1E1C3C3C3000000000000000000000000000000000000
          0000000000009F9F9FACACACC3C3C3E1E1E1F6F6F6FDFDFDFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF00000000000000000000000000000000000000000000000000
          0000000000FFFFFFFFFFFFFFFFFFCFB894CFB894CFB894CFB894CFB894CFB894
          CFB894CFB894CFB894CFB894CFB894CFB894CFB894CFB894CFB894CFB894CFB8
          94CFB894CFB894CFB894CFB894CFB894CFB894CFB894CFB894CFB894CFB894CF
          B894CFB894CFB894CFB894CFB894CFB894CFB894CFB894CFB894CFB894CFB894
          CFB894CFB894CFB894CFB894CFB894CFB894CFB894CFB894CFB894CFB894CFB8
          94CFB894CFB894CFB894FDFDFD67676767676767676767676767676767676767
          6767676767676767676767676767676767676767EDEDEDF6F6F6FDFDFD4C4C4C
          2121212121212121212121212121212121212121212121212121212121212121
          214C4C4CE5E5E5F4F4F4FFFFFF51515126262626262626262626262626262626
          2626262626262626262626262626262626515151FFFFFFFFFFFFFF00FFFDFDFD
          6767676767676767676767676767676767676767676767676767676767676767
          67676767676767EDEDEDF6F6F6FDFDFD4C4C4C21212121212121212121212121
          21212121212121212121212121212121212121214C4C4CE5E5E5F4F4F4FFFFFF
          5151512626262626262626262626262626262626262626262626262626262626
          26262626515151FFFFFFFFFFFFFF00FFFFFFFF8484846E6E6E5E5E5E5151514C
          4C4C4C4C4C4C4C4C4C4C4C4C4C4C5151515E5E5E6E6E6E848484F3F3F3FFFFFF
          FFFFFF8484845656563B3B3B2929292121212121212121212121212121212929
          293B3B3B565656848484F3F3F3FFFFFFFFFFFF8484845656563B3B3B29292921
          21212121212121212121212121212929293B3B3B565656848484F3F3F3FFFFFF
          FF00FFFFFFFF8484846E6E6E5E5E5E5151514C4C4C4C4C4C4C4C4C4C4C4C4C4C
          4C5151515E5E5E6E6E6E848484F3F3F3FFFFFFFFFFFF8484845656563B3B3B29
          29292121212121212121212121212121212929293B3B3B565656848484F3F3F3
          FFFFFFFFFFFF8484845656563B3B3B2929292121212121212121212121212121
          212929293B3B3B565656848484F3F3F3FFFFFFFFFFFFFFFFFFF9F9F9EDEDEDDB
          DBDB000000000000000000000000000000000000000000000000000000000000
          B8B8B8CACACADBDBDBEDEDEDF9F9F9FFFFFFFFFFFFF3F3F3D6D6D60000000000
          00000000000000000000000000000000000000000000000000A5A5A5B7B7B7D1
          D1D1F3F3F3FCFBFAFFFFFFFFFFFFFFFFFFFFFFFF000000000000000000000000
          000000000000000000000000000000000000000000000000FFFFFFFFFFFFCAB2
          90CAB290CAB290CAB290CAB290CAB290CAB290CAB290CAB290CAB290CAB290CA
          B290CAB290CAB290CAB290CAB290CAB290CAB290CAB290CAB290CAB290CAB290
          CAB290CAB290CAB290CAB290CAB290CAB290CAB290CAB290CAB290CAB290CAB2
          90CAB290CAB290CAB290CAB290CAB290CAB290CAB290CAB290CAB290CAB290CA
          B290CAB290CAB290CAB290CAB290CAB290CAB290CAB290CAB290FDFDFD676767
          6767676767676767676767676767676767676767676767676767676767676767
          67676767F1F1F1F9F9F9FDFDFD4C4C4C21212121212121212121212121212121
          21212121212121212121212121212121214C4C4CE9E9E9F6F6F6FFFFFF515151
          2626262626262626262626262626262626262626262626262626262626262626
          26515151FFFFFFFFFFFFFF00FFFDFDFD67676767676767676767676767676767
          6767676767676767676767676767676767676767676767F1F1F1F9F9F9FDFDFD
          4C4C4C2121212121212121212121212121212121212121212121212121212121
          212121214C4C4CE9E9E9F6F6F6FFFFFF51515126262626262626262626262626
          2626262626262626262626262626262626262626515151FFFFFFFFFFFFFF00FF
          FFFFFF8484846E6E6E5E5E5E5151514C4C4C4C4C4C4C4C4C4C4C4C4C4C4C5151
          515E5E5E6E6E6E848484F3F3F3FFFFFFFFFFFF8484845656563B3B3B29292921
          21212121212121212121212121212929293B3B3B565656848484F3F3F3FFFFFF
          FFFFFF8484845656563B3B3B2929292121212121212121212121212121212929
          293B3B3B565656848484F3F3F3FFFFFFFF00FFFFFFFF8484846E6E6E5E5E5E51
          51514C4C4C4C4C4C4C4C4C4C4C4C4C4C4C5151515E5E5E6E6E6E848484F3F3F3
          FFFFFFFFFFFF8484845656563B3B3B2929292121212121212121212121212121
          212929293B3B3B565656848484F3F3F3FFFFFFFFFFFF8484845656563B3B3B29
          29292121212121212121212121212121212929293B3B3B565656848484F3F3F3
          FFFFFFFFFFFFFFFFFFF9F9F9F1F1F10000000000000000000000000000000000
          00000000000000000000000000000000000000CACACADBDBDBF1F1F1F9F9F9FF
          FFFFFFFFFFF3F3F3000000000000000000000000000000000000000000000000
          000000000000000000000000BBBBBBD6D6D6F3F3F3FDFDFDFFFFFFFFFFFFFFFF
          FF00000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000FFFFFFC3AB89C3AB89C3AB89C3AB89C3AB89C3AB89
          C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB
          89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3
          AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89
          C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB
          89C3AB89C3AB89C3AB89FEFEFE67676767676767676767676767676767676767
          6767676767676767676767676767676767676767F4F4F4F9F9F9FEFEFE4C4C4C
          4C4C4C2121212121212121212121212121212121212121212121212121214C4C
          4C4C4C4CF1F1F1FDFDFDFFFFFF51515151515126262626262626262626262626
          2626262626262626262626262626515151515151FFFFFFFFFFFFFF00FFFEFEFE
          6767676767676767676767676767676767676767676767676767676767676767
          67676767676767F4F4F4F9F9F9FEFEFE4C4C4C4C4C4C21212121212121212121
          21212121212121212121212121212121214C4C4C4C4C4CF1F1F1FDFDFDFFFFFF
          5151515151512626262626262626262626262626262626262626262626262626
          26515151515151FFFFFFFFFFFFFF00FFFFFFFF8484846E6E6E5E5E5E5151514C
          4C4C4C4C4C4C4C4C4C4C4C4C4C4C5151515E5E5E6E6E6E848484F3F3F3FFFFFF
          FFFFFF8484845656563E3E3E2929292121212121212121212121212121212929
          293E3E3E565656848484F3F3F3FFFFFFFFFFFF8484845656563E3E3E29292921
          21212121212121212121212121212929293E3E3E565656848484F3F3F3FFFFFF
          FF00FFFFFFFF8484846E6E6E5E5E5E5151514C4C4C4C4C4C4C4C4C4C4C4C4C4C
          4C5151515E5E5E6E6E6E848484F3F3F3FFFFFFFFFFFF8484845656563E3E3E29
          29292121212121212121212121212121212929293E3E3E565656848484F3F3F3
          FFFFFFFFFFFF8484845656563E3E3E2929292121212121212121212121212121
          212929293E3E3E565656848484F3F3F3FFFFFFFFFFFFFFFFFFFDFDFD00000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000E9E9E9F6F6F6FDFDFDFFFFFFFFFFFF0000000000000000000000
          00000000000000000000000000000000000000000000000000000000000000E5
          E5E5F9F9F9FEFEFEFFFFFFFFFFFFFFFFFF000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000FFFFFFBFA7
          84BFA784BFA784BFA784BFA784BFA784BFA784BFA784BFA784BFA784BFA784BF
          A784BFA784BFA784BFA784BFA784BFA784BFA784BFA784BFA784BFA784BFA784
          BFA784BFA784BFA784BFA784BFA784BFA784BFA784BFA784BFA784BFA784BFA7
          84BFA784BFA784BFA784BFA784BFA784BFA784BFA784BFA784BFA784BFA784BF
          A784BFA784BFA784BFA784BFA784BFA784BFA784BFA784BFA784FEFEFEFDFDFD
          6767676767676767676767676767676767676767676767676767676767676767
          67F1F1F1F6F6F6FDFDFDFEFEFEFFFFFF4C4C4C21212121212121212121212121
          21212121212121212121212121214C4C4CE5E5E5F6F6F6FFFFFFFFFFFFFFFFFF
          5151512626262626262626262626262626262626262626262626262626265151
          51FFFFFFFFFFFFFFFFFFFF00FFFEFEFEFDFDFD67676767676767676767676767
          6767676767676767676767676767676767676767F1F1F1F6F6F6FDFDFDFEFEFE
          FFFFFF4C4C4C2121212121212121212121212121212121212121212121212121
          214C4C4CE5E5E5F6F6F6FFFFFFFFFFFFFFFFFF51515126262626262626262626
          2626262626262626262626262626262626515151FFFFFFFFFFFFFFFFFFFF00FF
          FFFFFF8A8A8A7474746262625959595151515151515151515151515151515959
          596262627474748A8A8AF3F3F3FFFFFFFFFFFF8A8A8A5E5E5E46464635353529
          29292929292929292929292929293535354646465E5E5E8A8A8AF3F3F3FFFFFF
          FFFFFF8A8A8A5E5E5E4646463535352929292929292929292929292929293535
          354646465E5E5E8A8A8AF3F3F3FFFFFFFF00FFFFFFFF8A8A8A74747462626259
          59595151515151515151515151515151515959596262627474748A8A8AF3F3F3
          FFFFFFFFFFFF8A8A8A5E5E5E4646463535352929292929292929292929292929
          293535354646465E5E5E8A8A8AF3F3F3FFFFFFFFFFFF8A8A8A5E5E5E46464635
          35352929292929292929292929292929293535354646465E5E5E8A8A8AF3F3F3
          FFFFFFFFFFFFFFFFFFFDFDFD0000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000F3F3F3FDFDFDFEFEFEFF
          FFFFFFFFFF000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000F6F6F6FDFDFDFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF00000000000000000000000000000000000000000000
          0000FFFFFFFFFFFFFFFFFFFFFFFFCFB894CFB894CFB894CFB894CFB894CFB894
          CFB894CFB894CFB894CFB894CFB894CFB894CFB894CFB894CFB894CFB894CFB8
          94CFB894CFB894CFB894CFB894CFB894CFB894CFB894CFB894CFB894CFB894CF
          B894CFB894CFB894CFB894CFB894CFB894CFB894CFB894CFB894CFB894CFB894
          CFB894CFB894CFB894CFB894CFB894CFB894CFB894CFB894CFB894CFB894CFB8
          94CFB894CFB894CFB894FFFFFFFEFEFE67676767676767676767676767676767
          6767676767676767676767676767676767F6F6F6FCFBFAFEFEFEFFFFFFFFFFFF
          4C4C4C4C4C4C2121212121212121212121212121212121212121214C4C4C4C4C
          4CF3F3F3FDFDFDFFFFFFFFFFFFFFFFFF51515151515126262626262626262626
          2626262626262626262626515151515151FFFFFFFFFFFFFFFFFFFF00FFFFFFFF
          FEFEFE6767676767676767676767676767676767676767676767676767676767
          67676767F6F6F6FCFBFAFEFEFEFFFFFFFFFFFF4C4C4C4C4C4C21212121212121
          21212121212121212121212121214C4C4C4C4C4CF3F3F3FDFDFDFFFFFFFFFFFF
          FFFFFF5151515151512626262626262626262626262626262626262626265151
          51515151FFFFFFFFFFFFFFFFFFFF00FFFFFFFF9494947B7B7B6E6E6E6262625E
          5E5E5E5E5E5E5E5E5E5E5E5E5E5E6262626E6E6E7B7B7B949494F3F3F3FFFFFF
          FFFFFF9494946E6E6E5656564646463E3E3E3B3B3B3B3B3B3B3B3B3E3E3E4646
          465656566E6E6E949494F3F3F3FFFFFFFFFFFF9494946E6E6E5656564646463E
          3E3E3B3B3B3B3B3B3B3B3B3E3E3E4646465656566E6E6E949494F3F3F3FFFFFF
          FF00FFFFFFFF9494947B7B7B6E6E6E6262625E5E5E5E5E5E5E5E5E5E5E5E5E5E
          5E6262626E6E6E7B7B7B949494F3F3F3FFFFFFFFFFFF9494946E6E6E56565646
          46463E3E3E3B3B3B3B3B3B3B3B3B3E3E3E4646465656566E6E6E949494F3F3F3
          FFFFFFFFFFFF9494946E6E6E5656564646463E3E3E3B3B3B3B3B3B3B3B3B3E3E
          3E4646465656566E6E6E949494F3F3F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFF9F9F9000000000000000000000000000000000000000000000000D6D6D6
          DBDBDBEDEDEDF9F9F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFD0000
          00000000000000000000000000000000000000000000D6D6D6D6D6D6F1F1F1FC
          FBFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000
          000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFCAB2
          90CAB290CAB290CAB290CAB290CAB290CAB290CAB290CAB290CAB290CAB290CA
          B290CAB290CAB290CAB290CAB290CAB290CAB290CAB290CAB290CAB290CAB290
          CAB290CAB290CAB290CAB290CAB290CAB290CAB290CAB290CAB290CAB290CAB2
          90CAB290CAB290CAB290CAB290CAB290CAB290CAB290CAB290CAB290CAB290CA
          B290CAB290CAB290CAB290CAB290CAB290CAB290CAB290CAB290FFFFFFFEFEFE
          FDFDFD676767676767676767676767676767676767676767676767676767F6F6
          F6FCFBFAFDFDFDFEFEFEFFFFFFFFFFFFFFFFFF4C4C4C4C4C4C21212121212121
          21212121212121214C4C4C4C4C4CF6F6F6FDFDFDFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFF515151515151262626262626262626262626262626515151515151FFFF
          FFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFEFEFEFDFDFD67676767676767676767
          6767676767676767676767676767676767F6F6F6FCFBFAFDFDFDFEFEFEFFFFFF
          FFFFFFFFFFFF4C4C4C4C4C4C2121212121212121212121212121214C4C4C4C4C
          4CF6F6F6FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF51515151515126262626
          2626262626262626262626515151515151FFFFFFFFFFFFFFFFFFFFFFFFFF00FF
          FFFFFF9494948A8A8A7B7B7B7474746E6E6E6E6E6E6E6E6E6E6E6E6E6E6E7474
          747B7B7B8A8A8A949494FFFFFFFFFFFFFFFFFF9494948A8A8A6E6E6E5E5E5E56
          56565656565656565656565656565E5E5E6E6E6E8A8A8A949494FFFFFFFFFFFF
          FFFFFF9494948A8A8A6E6E6E5E5E5E5656565656565656565656565656565E5E
          5E6E6E6E8A8A8A949494FFFFFFFFFFFFFF00FFFFFFFF9494948A8A8A7B7B7B74
          74746E6E6E6E6E6E6E6E6E6E6E6E6E6E6E7474747B7B7B8A8A8A949494FFFFFF
          FFFFFFFFFFFF9494948A8A8A6E6E6E5E5E5E5656565656565656565656565656
          565E5E5E6E6E6E8A8A8A949494FFFFFFFFFFFFFFFFFF9494948A8A8A6E6E6E5E
          5E5E5656565656565656565656565656565E5E5E6E6E6E8A8A8A949494FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFD0000000000000000000000
          00000000000000000000000000F1F1F1EDEDEDF6F6F6FCFBFAFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFDFDFD000000000000000000000000000000000000
          000000000000F1F1F1F1F1F1F9F9F9FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF00000000000000000000000000000000000000000000
          0000FFFFFFFFFFFFFFFFFFFFFFFFC3AB89C3AB89C3AB89C3AB89C3AB89C3AB89
          C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB
          89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3
          AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89
          C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB
          89C3AB89C3AB89C3AB89FFFFFFFFFFFFFEFEFEFEFEFEFDFDFD67676767676767
          6767676767676767F9F9F9F9F9F9FDFDFDFEFEFEFEFEFEFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFF4C4C4C4C4C4C4C4C4C4C4C4C4C4C4CF6F6F6FDFDFDFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF51515151515151
          5151515151515151FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFF
          FFFFFFFEFEFEFEFEFEFDFDFD676767676767676767676767676767F9F9F9F9F9
          F9FDFDFDFEFEFEFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4C4C4C4C
          4C4C4C4C4C4C4C4C4C4C4CF6F6F6FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF515151515151515151515151515151FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFF9494949494948A8A8A84
          84848484848484848484848484848A8A8A949494949494FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFF9494949494948A8A8A8484848484848484848484848484848A8A
          8A949494949494FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9494949494948A8A8A84
          84848484848484848484848484848A8A8A949494949494FFFFFFFFFFFFFFFFFF
          FF00FFFFFFFFFFFFFF9494949494948A8A8A8484848484848484848484848484
          848A8A8A949494949494FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9494949494948A
          8A8A8484848484848484848484848484848A8A8A949494949494FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFF9494949494948A8A8A8484848484848484848484848484
          848A8A8A949494949494FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFEFEFE000000000000000000000000000000000000000000000000FDFDFD
          F9F9F9FDFDFDFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
          00000000000000000000000000000000000000000000FDFDFDFDFDFDFDFDFDFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFA7
          84BFA784BFA784BFA784BFA784BFA784BFA784BFA784BFA784BFA784BFA784BF
          A784BFA784BFA784BFA784BFA784BFA784BFA784BFA784BFA784BFA784BFA784
          BFA784BFA784BFA784BFA784BFA784BFA784BFA784BFA784BFA784BFA784BFA7
          84BFA784BFA784BFA784BFA784BFA784BFA784BFA784BFA784BFA784BFA784BF
          A784BFA784BFA784BFA784BFA784BFA784BFA784BFA784BFA784FFFFFFFFFFFF
          FFFFFFFFFFFFFEFEFEFEFEFEFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFEFEFEFEFE
          FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFEFEFEFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFEFEFEFEFEFEFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFCFB894CFB894CFB894CFB894CFB894CFB894
          CFB894CFB894CFB894CFB894CFB894CFB894CFB894CFB894CFB894CFB894CFB8
          94CFB894CFB894CFB894CFB894CFB894CFB894CFB894CFB894CFB894CFB894CF
          B894CFB894CFB894CFB894CFB894CFB894CFB894CFB894CFB894CFB894CFB894
          CFB894CFB894CFB894CFB894CFB894CFB894CFB894CFB894CFB894CFB894CFB8
          94CFB894CFB894CFB894FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCAB2
          90CAB290CAB290CAB290CAB290CAB290CAB290CAB290CAB290CAB290CAB290CA
          B290CAB290CAB290CAB290CAB290CAB290CAB290CAB290CAB290CAB290CAB290
          CAB290CAB290CAB290CAB290CAB290CAB290CAB290CAB290CAB290CAB290CAB2
          90CAB290CAB290CAB290CAB290CAB290CAB290CAB290CAB290CAB290CAB290CA
          B290CAB290CAB290CAB290CAB290CAB290CAB290CAB290CAB290000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000FF00FF00000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000FF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFC3AB89C3AB89C3AB89C3AB89C3AB89C3AB89
          C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB
          89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3
          AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89
          C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB
          89C3AB89C3AB89C3AB8900000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000FF00FF000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000000000000B0B0B0B0B0B0B
          0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B
          0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B
          0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B
          0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B
          0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0BBFA7
          84BFA784BFA784BFA784BFA784BFA784BFA784BFA784BFA784BFA784BFA784BF
          A784BFA784BFA784BFA784BFA784BFA784BFA784BFA784BFA784BFA784BFA784
          BFA784BFA784BFA784BFA784BFA784BFA784BFA784BFA784BFA784BFA784BFA7
          84BFA784BFA784BFA784BFA784BFA784BFA784BFA784BFA784BFA784BFA784BF
          A784BFA784BFA784BFA784BFA784BFA784BFA784BFA784BFA784000000000000
          000000000000000000854F2F854F2F854F2F854F2F854F2F0000000000000000
          0000000000000000000000000000000000000000000000000066483366483366
          4833664833664833000000000000000000000000000000000000000000000000
          00000000000000000082675195735CA98773B39785B6A38F0000000000000000
          00000000000000000000FF00FF000000000000000000000000000000563A2556
          3A25563A25563A25563A25000000000000000000000000000000000000000000
          000000000000000000000000563A25563A25563A25563A25563A250000000000
          0000000000000000000000000000000000000000000000000000000074604581
          70618170619A7F6A9D9388000000000000000000000000000000000000FF00FF
          FF00FFFF00FFFF00FF0000000000000000000000000000000000000000000000
          00000000000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00000000000000
          0000000000000000000000000000000000000000000000FF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FF0000000000000000000000000000000000000000000000
          00000000000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00000000
          0000000000000000000000000000000000000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FF0000000000000000000000000000000000000000
          00000000000000000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00000000
          0000000000010101050505050505010101000000000000000000FF00FFFF00FF
          FF00FF0B0B0B0000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000000000000B
          0B0B000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000B0B0B0B0B0B0B0B0B0B0B0B0000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000B0B0BCFB894CFB894CFB894CFB894CFB894CFB894
          CFB894CFB894CFB894CFB894CFB894CFB894CFB894CFB894CFB894CFB894CFB8
          94CFB894CFB894CFB894CFB894CFB894CFB894CFB894CFB894CFB894CFB894CF
          B894CFB894CFB894CFB894CFB894CFB894CFB894CFB894CFB894CFB894CFB894
          CFB894CFB894CFB894CFB894CFB894CFB894CFB894CFB894CFB894CFB894CFB8
          94CFB894CFB894CFB894000000000000000000854F2F854F2FB6956DFFF8DFFF
          FEE4FFFFEFB39785854F2F854F2F000000000000000000000000000000000000
          000000664833664833FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6648336648330000
          00000000000000000000000000000000000000563A256D533ACAB3A3FFFFFFFF
          FFFFFFFFFFEBE2D9BFA494C0AD9F000000000000000000000000FF00FF000000
          000000000000563A25563A25B39785FFFFFFFFFFFFFFFFFFC0AD9F563A25563A
          25000000000000000000000000000000000000000000563A25563A25B39785FF
          FFFFFFFFFFFFFFFFC0AD9F563A25563A25000000000000000000000000000000
          000000000000563A25664833C0AD9FFFFFFFFFFFFFFFFFFFD8CBC29D93889D93
          88000000000000000000000000FF00FFFF00FFFF00FF983B07983B07983B0798
          3B07983B07983B07983B07983B07983B07983B07983B07000000FF00FFFF00FF
          FF00FFFF00FF000000312318795A45795A45795A45795A45795A45795A45795A
          45795A45312318000000FF00FFFF00FFFF00FFFF00FF0000002D140B61442F66
          48336D533A6D533A795A45795A45795A45795A45312318000000FF00FFFF00FF
          FF00FFFF00FFFF00FF983B07983B07983B07983B07983B07983B07983B07983B
          07983B07983B07983B07000000FF00FFFF00FFFF00FFFF00FF00000031231879
          5A45795A456D533A6D533A795A45795A45795A45795A45312318000000FF00FF
          FF00FFFF00FFFF00FF0000002D140B61442F6648336648335946375946376D53
          3A795A45795A45312318000000FF00FFFF00FF0B0B0B00000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000B0B0B0B0B0B0B0B0B0000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000B0B0B0B0B0B0B0B0B0B0B0B000000000000000000000000000000000000
          000000D18804D188040000000000000000000000000000000000000B0B0BCAB2
          90CAB290CAB290CAB290CAB290CAB290CAB290CAB290CAB290CAB290CAB290CA
          B290CAB290CAB290CAB290CAB290CAB290CAB290CAB290CAB290CAB290CAB290
          CAB290CAB290CAB290CAB290CAB290CAB290CAB290CAB290CAB290CAB290CAB2
          90CAB290CAB290CAB290CAB290CAB290CAB290CAB290CAB290CAB290CAB290CA
          B290CAB290CAB290CAB290CAB290CAB290CAB290CAB290CAB290000000000000
          854F2FA78066FADBC2F1EBCDF3EBD7FFF8DFFFFEE4FFFFEFFFFFF7B39785854F
          2F000000000000000000000000000000664833CBC2B7FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF664833000000000000000000000000000000
          563A25A98773FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1E8DFC0AD
          9F000000000000000000FF00FF000000000000563A2595735CFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFC0AD9F563A25000000000000000000000000
          000000563A2595735CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0AD
          9F563A25000000000000000000000000000000563A25A98773FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFDBD4CA9D9388000000000000000000FF00FF
          FF00FF983B07D59267F3F3F3F2EDE5F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3
          F3F3F3F3DCAC7B983B07000000FF00FFFF00FF000000595041FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD8CBC2312318000000FF00FF
          FF00FF00000040281ED1AA73DCB58DE7D7B7ECE6D3F5F0EAFCFBFAFFFFFFFFFF
          FFFFFFFFD8CBC2312318000000FF00FFFF00FFFF00FF983B07D59267F3F3F3F1
          E8DFD1D1D1B2B2B2B2B2B2D1D1D1EDEDEDF3F3F3F3F3F3DCAC7B983B07000000
          FF00FFFF00FF000000595041FFFFFFF9F9F9DBDBDBBBBBBBBBBBBBDBDBDBF9F9
          F9FFFFFFFFFFFFD8CBC2312318000000FF00FFFF00FF00000040281ED1AA73D2
          B689CAB3A3000000000000949494B2B2B2DBDBDBF9F9F9D8CBC2312318000000
          FF00FF0B0B0B000000000000000000000000000000000000000000000000B685
          38B685380000000000000000000000000000000000000000000B0B0B0B0B0B0B
          0B0B000000000000000000000000000000000000000000D18804D18804000000
          0000000000000000000000000000000000000B0B0B0B0B0B0B0B0B0B0B0B0000
          00000000000000000000000000000000D18804FBCA46FBCA46D1880400000000
          00000000000000000000000B0B0BC3AB89C3AB89C3AB89C3AB89C3AB89C3AB89
          C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB
          89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3
          AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89
          C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB
          89C3AB89C3AB89C3AB89000000000000854F2FDCC590EFCFAFFADBC2F1EBCDFF
          FBD8FFF8DFFFFEE4FFFFEFFFFFEF854F2F000000000000000000000000000000
          664833FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6648
          3300000000000000000000000000000040281EDBD4CAFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFBFA494000000000000000000FF00FF000000
          000000563A25CEB9ACEBE2D9FFFFFF2D140B2D140B2D140BFFFFFFFFFFFFFFFF
          FF563A25000000000000000000000000000000563A25CEB9ACEBE2D9FFFFFF2D
          140B2D140B2D140BFFFFFFFFFFFFFFFFFF563A25000000000000000000000000
          00000040281ED6D6D6F6F6F6FFFFFF2D140B2D140B2D140BFFFFFFFFFFFFFFFF
          FF9D9388000000000000000000FF00FFFF00FF983B07F1EBCDEDE3BFF1EBCDF7
          F2E6F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3983B07000000FF00FF
          FF00FF000000FFFFFFFCFBFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF795A45000000FF00FFFF00FF000000C5955FD1AA73DCB58DE7
          D7B7ECE6D3F5F0EAFCFBFAFFFFFFFFFFFFFFFFFFFFFFFF795A45000000FF00FF
          FF00FFFF00FF983B07F1EBCDE7D7B7DACDAF000000000000909090ACACACD1D1
          D1EDEDEDF3F3F3F3F3F3983B07000000FF00FFFF00FF000000FFFFFFF6F6F6DB
          DBDB000000000000999999B2B2B2DBDBDBF9F9F9FFFFFFFFFFFF795A45000000
          FF00FFFF00FF000000C5955FC4A373BDA27E0000002626262626260000009F9F
          9FB2B2B2DBDBDBF9F9F9795A45000000FF00FF0B0B0B00000000000000000000
          0000000000000000000000B68538DCB58DDEBB99B28957000000000000000000
          0000000000000000000B0B0B0B0B0B0B0B0B0000000000000000000000000000
          00000000D18804FBCA46FBCA46D1880400000000000000000000000000000000
          00000B0B0B0B0B0B0B0B0B0B0B0B000000000000000000000000000000BA7002
          FBCA46FBCA46FFF568FBCA46D188040000000000000000000000000B0B0BBFA7
          84BFA784BFA784BFA784BFA784BFA784BFA784BFA784BFA784BFA784BFA784BF
          A784BFA784BFA784BFA784BFA784BFA784BFA784BFA784BFA784BFA784BFA784
          BFA784BFA784BFA784BFA784BFA784BFA784BFA784BFA784BFA784BFA784BFA7
          84BFA784BFA784BFA784BFA784BFA784BFA784BFA784BFA784BFA784BFA784BF
          A784BFA784BFA784BFA784BFA784BFA784BFA784BFA784BFA784000000854F2F
          A67E51DCAC7BDCC590F3D2B1FADBC2F1EBCDF3EBD7FFF8DFFFF8DFFFF8DFB390
          7C854F2F0000000000000000006648339A7F6AFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF66483300000000000000000040281E
          795A45CEB9ACEBE2D9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEBE2
          D9B6A38F000000000000FF00FF000000563A25795A45B39785CEB9AC57262457
          26245656564343432D140BFFFFFFFFFFFFB6A38F563A25000000000000000000
          563A25795A45B39785CEB9AC5726245726245656564343432D140BFFFFFFFFFF
          FFB6A38F563A2500000000000000000040281E746045BDBDBDE1E1E157262457
          26245656564343432D140BFFFFFFFFFFFFD8CBC29D9388000000000000FF00FF
          FF00FF983B07EDE3BFEECDACEDE3BFF1EBCDF5F0EAF3F3F3F3F3F3F3F3F3F3F3
          F3F3F3F3F3F3F3983B07000000FF00FFFF00FF000000FCFBFAF5F0EAFDFDFDFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF795A45000000FF00FF
          FF00FF000000C5955FCCA16BDCB58DE7D7B7ECE6D3F5F0EAFCFBFAFFFFFFFFFF
          FFFFFFFFFFFFFF795A45000000FF00FFFF00FFFF00FF983B07E7D7B7CFAD8F00
          0000262626262626000000999999ACACACD1D1D1EDEDEDF3F3F3983B07000000
          FF00FFFF00FF000000F6F6F6D1D1D10000002626262626260000009F9F9FB2B2
          B2DBDBDBF9F9F9FFFFFF795A45000000FF00FFFF00FF000000C5955FB6956D00
          00002626262626262626262626260000009F9F9FB2B2B2DBDBDB795A45000000
          FF00FF0B0B0B000000000000000000000000000000000000A87636D1AA73DCB5
          8DDEBB99DCB58DB289570000000000000000000000000000000B0B0B0B0B0B0B
          0B0B000000000000000000000000000000BA7002FBCA46FBCA46FFF568FBCA46
          D188040000000000000000000000000000000B0B0B0B0B0B0B0B0B0B0B0B0000
          00000000000000000000A85800EBA00AFBCA46FBCA46FBCA46FFF568FBCA46D1
          88040000000000000000000B0B0BCFB894CFB894CFB894CFB894CFB894CFB894
          CFB894CFB894CFB894CFB894CFB894CFB894CFB894CFB894CFB894CFB894CFB8
          94CFB894CFB894CFB894CFB894CFB894CFB894CFB894CFB894CFB894CFB894CF
          B894CFB894CFB894CFB894CFB894CFB894CFB894CFB894CFB894CFB894CFB894
          CFB894CFB894CFB894CFB894CFB894CFB894CFB894CFB894CFB894CFB894CFB8
          94CFB894CFB894CFB894000000854F2FC5955FCCA16BDCAC7BDCC590EFCFAFFA
          DBC2FADBC2F1EBCDF3EBD7FFFBD8FFFBD8854F2F000000000000000000664833
          CEB9ACDBD4CAFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF66483300000000000000000040281E9A7F6AB39785D5C6B9F5F0EAFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB39785000000000000FF00FF000000
          563A2595735C9A7F6A734C38A35027A350275726241903033E3B382D140BFFFF
          FFFFFFFF563A25000000000000000000563A2595735C9A7F6A734C38A35027A3
          50275726241903033E3B382D140BFFFFFFFFFFFF563A25000000000000000000
          40281E9A7F6AB09D91734C38A35027A350275726241903033E3B382D140BFFFF
          FFFFFFFF9A7F6A000000000000FF00FFFF00FF983B07EECDACDEBB99EECDACED
          E3BFF3EBD7F5F0EAF3F3F3F3F3F3F3F3F3F3F3F3F3F3F3983B07000000FF00FF
          FF00FF000000F5F0EAE6DBCFF5F0EAFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF795A45000000FF00FFFF00FF000000C5955FB28957D2B689E4
          D3AFECE6D3F5F0EAFDFAF6FFFFFFFFFFFFFFFFFFFFFFFF795A45000000FF00FF
          FF00FFFF00FF983B07E7C59E0000002626262626262626262626260000009999
          99ACACACD1D1D1EDEDED983B07000000FF00FFFF00FF000000E1E1E100000026
          26262626262626262626260000009F9F9FB2B2B2DBDBDBF9F9F9795A45000000
          FF00FFFF00FF000000C5955F747474CACACAE5E5E5626262EBE2D9FFFFFF2626
          260000009F9F9FB2B2B26D533A010101FF00FF0B0B0B00000000000000000000
          00000000009A6038C5955FCCA16BD1AA73D2B689DCB58DDCB58DB28957000000
          0000000000000000000B0B0B0B0B0B0B0B0B000000000000000000000000A858
          00EBA00AFBCA46FBCA46FBCA46FFF568FBCA46D1880400000000000000000000
          00000B0B0B0B0B0B0B0B0B0B0B0B000000000000000000983B07D18804EBA00A
          EBA00AFBCA46FBCA46FBCA46FBCA46FBCA46D188040000000000000B0B0BCAB2
          90CAB290CAB290CAB290CAB290CAB290CAB290CAB290CAB290CAB290CAB290CA
          B290CAB290CAB290CAB290CAB290CAB290CAB290CAB290CAB290CAB290CAB290
          CAB290CAB290CAB290CAB290CAB290CAB290CAB290CAB290CAB290CAB290CAB2
          90CAB290CAB290CAB290CAB290CAB290CAB290CAB290CAB290CAB290CAB290CA
          B290CAB290CAB290CAB290CAB290CAB290CAB290CAB290CAB290000000854F2F
          B28957C5955FCCA16BDCAC7BDCC590EECDACFADBC2FADBC2FADBC2F1EBCDF1EB
          CD854F2F000000000000000000664833B39785C0AD9FDBD4CAFDFDFDFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF664833000000000000000000312318
          8267519A7F6AC0AD9FDBD4CAF7F3EEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFA98773000000000000FF00FF000000563A2574604582675195735CD9BF86C5
          A25BA350271903030D0101190303FFFFFFFFFFFF563A25000000000000000000
          563A2574604582675195735CD9BF86C5A25BA350271903030D0101190303FFFF
          FFFFFFFF563A250000000000000000003123188170619A7F6A95735CD9BF86C5
          A25BA350271903030D0101190303FFFFFFFFFFFF9A7F6A000000000000FF00FF
          FF00FF983B07DEBB99DCAC7BDEBB99EECDACEDE3BFF3EBD7F5F0EAF3F3F3F3F3
          F3F3F3F3F3F3F3983B07000000FF00FFFF00FF000000E6DBCFD5C6B9E6DBCFF7
          F3EEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF795A45000000FF00FF
          FF00FF000000B28957A67E51C4A373D5C2A4EDE3CAF2EDE5FAF7EFFDFAF6FCFB
          FAFCFBFAFCFBFA795A45000000FF00FFFF00FFFF00FF983B07747474CACACAE5
          E5E5626262E4D3AFFFFFFF262626000000999999ACACACD1D1D1983B07000000
          FF00FFFF00FF000000747474CACACAE5E5E5626262EDEDEDFFFFFF2626260000
          009F9F9FB2B2B2DBDBDB795A45000000FF00FFFF00FF000000B28957A67E51C4
          A373D5C2A4EDE3CAF2EDE5FAF7EFFFFFFF262626000000999999594637070707
          F801F80B0B0B000000000000000000000000814D12A87636B28957C5955FCCA1
          6BD1AA73CCAE7EDCB58DD2B689B289570000000000000000000B0B0B0B0B0B0B
          0B0B000000000000000000983B07D18804EBA00AEBA00AFBCA46FBCA46FBCA46
          FBCA46FBCA46D188040000000000000000000B0B0B0B0B0B0B0B0B0B0B0B0000
          00000000A85800D18804D18804D18804EBA00AEBA00AEBA00AFBCA46FBCA46FB
          CA46FBCA46D188040000000B0B0BC3AB89C3AB89C3AB89C3AB89C3AB89C3AB89
          C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB
          89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3
          AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89
          C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB
          89C3AB89C3AB89C3AB89000000854F2FB28957C4A373C5955FCCA16BDCAC7BDC
          B58DE7C59EEFCFAFF3D2B1FADBC2FADBC2854F2F000000000000000000664833
          9A7F6ACAB3A3CAB3A3D8CBC2F5F0EAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF6648330000000000000000002D140B795A45A98773B39785CAB3A3E6DBCFF5
          F0EAFDFDFDFFFFFFFFFFFFFFFFFFFFFFFF9A7F6A000000000000FF00FF000000
          563A25795A45A98773B39785F7F2E6F1EBCDCDAD66A350271903032D140BFCFB
          FAFFFFFF563A25000000000000000000563A25795A4595735CB39785F7F2E6F1
          EBCDCDAD66A350271903032D140BFCFBFAFFFFFF563A25000000000000000000
          3123187460459D9388B39785F7F2E6F1EBCDCDAD66A350271903032D140BFFFF
          FFFFFFFF817061000000000000FF00FFFF00FF983B07DCAC7BCCA16BDCAC7BDE
          BB99EFCFAFEDE3BFF3EBD7F1F1F1F3F3F3F3F3F3F3F3F3983B07000000FF00FF
          FF00FF000000D5C6B9CAB3A3D5C6B9E6DBCFF8F4F1FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF795A45000000FF00FFFF00FF000000A87636987145B28957C7
          AE8ADFCEB8ECE6D3F2EDE5F5F0EAF5F0EAF5F0EAF5F0EA6D533A000000FF00FF
          FF00FFFF00FF983B07DCAC7BCCA16BDCAC7BDEBB99EFCFAFEDE3BFFFFFFF2626
          26000000999999ACACAC983B07010101FF00FFFF00FF000000D5C6B9CAB3A3D5
          C6B9E6DBCFF8F4F1FFFFFFFFFFFF2626260000009F9F9FB2B2B26D533A010101
          FF00FFFF00FF000000A87636987145B28957C7AE8ADFCEB8ECE6D3F2EDE5F5F0
          EAFFFFFF2626260000005946370B0B0BE904E90B0B0B00000000000000000087
          5816A16D28A87636A87636B68538B28957C5955FCCA16BD1AA73D2B689CCAE7E
          B289570000000000000B0B0B0B0B0B0B0B0B000000000000A85800D18804D188
          04D18804EBA00AEBA00AEBA00AFBCA46FBCA46FBCA46FBCA46D1880400000000
          00000B0B0B0B0B0B0B0B0B0B0B0B000000983B07FDCC8EFFF9C7FFFE99D18804
          EBA00AD18804EBA00AEBA00AFBCA46FBCA46FBCA46FBCA46BA70020B0B0BBFA7
          84BFA784BFA784BFA784BFA784BFA784BFA784BFA784BFA784BFA784BFA784BF
          A784BFA784BFA784BFA784BFA784BFA784BFA784BFA784BFA784BFA784BFA784
          BFA784BFA784BFA784BFA784BFA784BFA784BFA784BFA784BFA784BFA784BFA7
          84BFA784BFA784BFA784BFA784BFA784BFA784BFA784BFA784BFA784BFA784BF
          A784BFA784BFA784BFA784BFA784BFA784BFA784BFA784BFA784000000854F2F
          B6956DF2EDE5C4A373C5955FC5955FD1AA73DCAC7BDCB58DE6CC95E7C59EEECD
          AC854F2F000000000000000000664833B39785FFFFFFCBC2B7B6A38FCBC2B7EB
          E2D9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6648330000000000000000002D140B
          817061E5E5E5B39785B39785CAB3A3D8CBC2EBE2D9F5F0EAFCFBFAFFFFFFFFFF
          FF95735C000000000000FF00FF000000563A259A7F6AFFFFFFC0AD9FCEB9ACFD
          FAF6EDE3CAC494496333262D140BD8CBC2E6DBCF563A25000000000000000000
          563A25826751FFFFFFC0AD9FCEB9ACFDFAF6EDE3CAC494496333262D140BD8CB
          C2E6DBCF563A25000000000000000000312318817061E9E9E9C0AD9FCEB9ACFD
          FAF6EDE3CAC494496333262D140BFFFFFFFFFFFF826751000000000000FF00FF
          FF00FF983B07CCA16BC5955FCCA16BD2B689E7C59EF3D2B1EDE3BFF5F2DFF1F1
          F1F3F3F3F3F3F3983B07000000FF00FFFF00FF000000CAB3A3B6A38FCAB3A3D8
          CBC2EBE2D9F9F7F4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF795A45000000FF00FF
          FF00FF0000009A60389A6038A67E51B6956DCDB691DFCEB8EDE3CAECE6D3ECE6
          D3ECE6D3ECE6D36D533A000000FF00FFFF00FFFF00FF983B07CCA16BC5955FCC
          A16BD2B689E7C59EF3D2B1EDE3BFFFFFFF262626000000999999713F13050505
          FF00FFFF00FF000000CAB3A3B6A38FCAB3A3D8CBC2EBE2D9F9F7F4FFFFFFFFFF
          FF2626260000009F9F9F594637050505FF00FFFF00FF0000009A60389A6038A6
          7E51B6956DCDB691DFCEB8EDE3CAECE6D3ECE6D3FFFFFF2626260000000F0F0F
          E904E90B0B0B000000000000814D12DCB58DE4D3AFDEBB99A87636B68538A876
          36B28957C5955FCCA16BD1AA73CCAE7ECCAE7EA876360000000B0B0B0B0B0B0B
          0B0B000000983B07FDCC8EFFF9C7FFFE99D18804EBA00AD18804EBA00AEBA00A
          FBCA46FBCA46FBCA46FBCA46BA70020000000B0B0B0B0B0B0B0B0B0B0B0B0000
          00621B00A85800BA7002BA7002EBA00AFBCA46D18804D18804EBA00AEBA00AEB
          A00AD18804D18804A858000B0B0BCFB894CFB894CFB894CFB894CFB894CFB894
          CFB894CFB894CFB894CFB894CFB894CFB894CFB894CFB894CFB894CFB894CFB8
          94CFB894CFB894CFB894CFB894CFB894CFB894CFB894CFB894CFB894CFB894CF
          B894CFB894CFB894CFB894CFB894CFB894CFB894CFB894CFB894CFB894CFB894
          CFB894CFB894CFB894CFB894CFB894CFB894CFB894CFB894CFB894CFB894CFB8
          94CFB894CFB894CFB894000000854F2FA78066F2EDE5CFAD8FB28957B28957C5
          955FCCA16BD1AA73DCAC7BDCB58DA67E51854F2F000000000000000000664833
          B3907CFFFFFFFFFFFFA98773B39785C0AD9FD5C6B9E6DBCFF5F0EAFFFFFFB397
          856648330000000000000000002D140B746045E5E5E5B09D919A7F6AB3907CB6
          A38FCAB3A3D8CBC2EBE2D9F5F0EAB6A38F826751000000000000FF00FF000000
          563A259A7F6AFFFFFFCBC2B7CEB9ACCAB3A3FBF9F39A6038572624A98773B6A3
          8F826751563A25000000000000000000563A25795A45FFFFFFB39785CEB9ACCA
          B3A3FBF9F39A6038572624A98773B6A38F826751563A25000000000000000000
          3123185B5B5BE9E9E9B09D91CEB9ACCAB3A3FBF9F39A6038572624E6DBCFF1E8
          DFB39785746045000000000000FF00FFFF00FF983B07C5955FC5B594C5955FCC
          A16BDCB58DE7C59EF3D2B1F1EBCDF5F2DFF3F3F3F3F3F3983B07000000FF00FF
          FF00FF000000B6A38FD5C6B9B6A38FCAB3A3D8CBC2EBE2D9F9F7F4FFFFFFFFFF
          FFFFFFFFFFFFFF795A45000000FF00FFFF00FF0000008B6832A67E51987145A6
          7E51B6956DCFAD8FDFCCA6E7D7B7E7D7B7E7D7B7E7D7B7664833000000FF00FF
          FF00FFFF00FF983B07C5955FC5B594C5955FCCA16BDCB58DE7C59EF3D2B1F1EB
          CDFFFFFF262626000000713F13050505FF00FFFF00FF000000B6A38FD5C6B9B6
          A38FCAB3A3D8CBC2EBE2D9F9F7F4FFFFFFFFFFFF262626000000594637050505
          FF00FFFF00FF0000008B6832A67E51987145A67E51B6956DCFAD8FDFCCA6E7D7
          B7E7D7B7E7D7B7FFFFFF0F0F0F070707E904E90B0B0B000000000000621B0087
          5816875816A35027A87636D1AA73A87636A87636B68538B28957C5955FB28957
          B68538A16D280000000B0B0B0B0B0B0B0B0B000000621B00A85800BA7002BA70
          02EBA00AFBCA46D18804D18804EBA00AEBA00AEBA00AD18804D18804A8580000
          00000B0B0B0B0B0B0B0B0B0B0B0B000000000000000000000000BA7002FDCC8E
          EBA00ABA7002BA7002D18804D18804D188040000000000000000000B0B0BCAB2
          90CAB290CAB290CAB290CAB290CAB290CAB290CAB290CAB290CAB290CAB290CA
          B290CAB290CAB290CAB290CAB290CAB290CAB290CAB290CAB290CAB290CAB290
          CAB290CAB290CAB290CAB290CAB290CAB290CAB290CAB290CAB290CAB290CAB2
          90CAB290CAB290CAB290CAB290CAB290CAB290CAB290CAB290CAB290CAB290CA
          B290CAB290CAB290CAB290CAB290CAB290CAB290CAB290CAB290000000000000
          87603EC2A081EBE2D9CAA98BBC9D79B28957B28957C5955FC5955FCCA16B854F
          2F000000000000000000000000000000795A45D8CBC2FFFFFFFFFFFFC0AD9FB3
          907CB39785C0AD9FCBC2B7DBD4CA664833000000000000000000000000000000
          3123189A7F6ADBDBDBB09D919D9388A98773B3907CB6A38FCAB3A3D8CBC26D53
          3A000000000000000000FF00FF000000000000664833C0AD9FFFFFFFCBC2B7BF
          A494A98773885B4882675195735C9A7F6A563A25000000000000000000000000
          00000061442F9A7F6AFFFFFFB39785BFA494A98773885B4882675195735C9A7F
          6A563A25000000000000000000000000000000312318848484DBDBDBB09D91BF
          A494A98773885B48B09D91CAB3A3D5C6B9664833000000000000000000FF00FF
          FF00FF983B07C5B594F3F3F3D5C2A4C5955FD1AA73DCB58DE7C59EF3D2B1F1EB
          CDF5F2DFF3F3F3983B07000000FF00FFFF00FF000000D5C6B9FFFFFFE6DBCFBF
          A494CEB9ACD8CBC2EBE2D9F9F7F4FFFFFFFFFFFFFFFFFF795A45000000FF00FF
          FF00FF000000A87636C5955FB28957987145A67E51B6956DC4A373D2B689DCB5
          8DDCB58DDCB58D61442F000000FF00FFFF00FFFF00FF983B07C5B594F3F3F3D5
          C2A4C5955FD1AA73DCB58DE7C59EF3D2B1F1EBCDFFFFFF0F0F0F7D3300050505
          FF00FFFF00FF000000D5C6B9FFFFFFE6DBCFBFA494CEB9ACD8CBC2EBE2D9F9F7
          F4FFFFFFFFFFFF0F0F0F6D533A050505FF00FFFF00FF000000A87636C5955FB2
          8957987145A67E51B6956DC4A373D2B689DCB58DDCB58DDCB58D262626010101
          F801F80B0B0B000000000000000000000000000000875816DCB58DA876368758
          16A35027A16D28A87636A876360000000000000000000000000B0B0B0B0B0B0B
          0B0B000000000000000000000000BA7002FDCC8EEBA00ABA7002BA7002D18804
          D18804D188040000000000000000000000000B0B0B0B0B0B0B0B0B0B0B0B0000
          00000000000000000000A85800FDCC8ED18804BA7002BA7002BA7002D18804A8
          58000000000000000000000B0B0BC3AB89C3AB89C3AB89C3AB89C3AB89C3AB89
          C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB
          89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3
          AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89
          C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB
          89C3AB89C3AB89C3AB89000000000000854F2F9A6038C2A081F2EDE5F2EDE5B6
          956DA67E51B28957B28957987145854F2F000000000000000000000000000000
          6648336D533AD8CBC2FFFFFFFFFFFFB3978595735C9A7F6AB6A38F95735C6648
          330000000000000000000000000000002D140B40281E9A7F6AE5E5E5E5E5E59A
          7F6A8267519A7F6AB3907C826751563A25000000000000000000FF00FF000000
          000000563A2561442FC0AD9FFFFFFFFFFFFF9A7F6A6D533A795A458267516D53
          3A563A25000000000000000000000000000000563A25563A259A7F6AFFFFFFFF
          FFFF8267516D533A795A458267516D533A563A25000000000000000000000000
          0000002D140B40281E848484E9E9E9E5E5E59A7F6A8170619A7F6A9D93888267
          51563A25000000000000000000FF00FFFF00FF983B07F3F3F3D5C2A4F3F3F3ED
          E3BFC5955FD1AA73DCB58DE7C59EF3D2B1F1EBCDF3F3F3983B07000000FF00FF
          FF00FF000000FFFFFFE6DBCFFFFFFFFEFEFEBFA494CEB9ACD8CBC2F1E8DFF9F9
          F9FFFFFFFFFFFF312318000000FF00FFFF00FF000000C49449B68538C5955FC5
          955F9A6038A67E51B28957C5955FCCA16BD1AA73D1AA732D140B000000FF00FF
          FF00FFFF00FF983B07F3F3F3D5C2A4F3F3F3EDE3BFC5955FD1AA73DCB58DE7C5
          9EF3D2B1F1EBCD262626983B07010101FF00FFFF00FF000000FFFFFFE6DBCFFF
          FFFFFEFEFEBFA494CEB9ACD8CBC2F1E8DFF9F9F9FFFFFF262626312318010101
          FF00FFFF00FF000000C49449B68538C5955FC5955F9A6038A67E51B28957C595
          5FCCA16BD1AA73D1AA732D140B000000FF00FF0B0B0B00000000000000000000
          0000000000875816DCB58DA16D28814D12875816A35027A16D28875816000000
          0000000000000000000B0B0B0B0B0B0B0B0B000000000000000000000000A858
          00FDCC8ED18804BA7002BA7002BA7002D18804A8580000000000000000000000
          00000B0B0B0B0B0B0B0B0B0B0B0B000000000000000000000000621B00A85800
          983B07983B07983B07983B07983B077D33000000000000000000000B0B0BBFA7
          84BFA784BFA784BFA784BFA784BFA784BFA784BFA784BFA784BFA784BFA784BF
          A784BFA784BFA784BFA784BFA784BFA784BFA784BFA784BFA784BFA784BFA784
          BFA784BFA784BFA784BFA784BFA784BFA784BFA784BFA784BFA784BFA784BFA7
          84BFA784BFA784BFA784BFA784BFA784BFA784BFA784BFA784BFA784BFA784BF
          A784BFA784BFA784BFA784BFA784BFA784BFA784BFA784BFA784000000000000
          000000854F2F87603EA78066B6956DA67E51A876369A6038854F2F854F2F0000
          00000000000000000000000000000000000000664833795A45A987739A7F6A79
          5A45795A45795A45664833664833000000000000000000000000000000000000
          0000002D140B3123187460458170616D533A6D533A61442F40281E563A250000
          00000000000000000000FF00FF000000000000000000563A256648339A7F6A9A
          7F6A66483361442F61442F563A25563A25000000000000000000000000000000
          000000000000563A2561442F795A45795A4561442F61442F61442F563A25563A
          250000000000000000000000000000000000000000002D140B3123185B5B5B81
          706159504174604559463740281E563A25000000000000000000000000FF00FF
          FF00FF983B07A35027F3F3F3EDE3BFC5955FD1AA73DCB58DE7C59EF3D2B1F1EB
          CDF5F2DFD59267983B07FF00FFFF00FFFF00FF00000040281EFFFFFFFEFEFEBF
          A494CEB9ACD8CBC2F1E8DFF9F9F9FFFFFFFFFFFF595041000000FF00FFFF00FF
          FF00FF0000002D140BC49449C494498B6832987145A67E51B28957C5955FC595
          5FC5955F40281E000000FF00FFFF00FFFF00FFFF00FF983B07A35027F3F3F3ED
          E3BFC5955FD1AA73DCB58DE7C59EF3D2B1F1EBCDF5F2DFD59267983B07FF00FF
          FF00FFFF00FF00000040281EFFFFFFFEFEFEBFA494CEB9ACD8CBC2F1E8DFF9F9
          F9FFFFFFFFFFFF595041000000FF00FFFF00FFFF00FF0000002D140BC49449C4
          94498B6832987145A67E51B28957C5955FC5955FC5955F40281E000000FF00FF
          FF00FF0B0B0B000000000000000000000000000000621B00875816713F13713F
          13713F13713F13713F13713F130000000000000000000000000B0B0B0B0B0B0B
          0B0B000000000000000000000000621B00A85800983B07983B07983B07983B07
          983B077D33000000000000000000000000000B0B0B0B0B0B0B0B0B0B0B0B0000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000B0B0BCFB894CFB894CFB894CFB894CFB894CFB894
          CFB894CFB894CFB894CFB894CFB894CFB894CFB894CFB894CFB894CFB894CFB8
          94CFB894CFB894CFB894CFB894CFB894CFB894CFB894CFB894CFB894CFB894CF
          B894CFB894CFB894CFB894CFB894CFB894CFB894CFB894CFB894CFB894CFB894
          CFB894CFB894CFB894CFB894CFB894CFB894CFB894CFB894CFB894CFB894CFB8
          94CFB894CFB894CFB894000000000000000000000000000000854F2F854F2F85
          4F2F854F2F854F2F000000000000000000000000000000000000000000000000
          0000000000000000006648336648336648336648336648330000000000000000
          000000000000000000000000000000000000000000000000002D140B2D140B31
          231831231840281E000000000000000000000000000000000000FF00FF000000
          000000000000000000000000563A25563A25563A25563A25563A250000000000
          00000000000000000000000000000000000000000000000000000000563A2556
          3A25563A25563A25563A25000000000000000000000000000000000000000000
          00000000000000000000000031231831231831231831231840281E0000000000
          00000000000000000000000000FF00FFFF00FFFF00FF983B07983B07983B0798
          3B07983B07983B07983B07983B07983B07983B07983B07FF00FFFF00FFFF00FF
          FF00FFFF00FF0000000000000000000000000000000000000000000000000000
          00000000000000FF00FFFF00FFFF00FFFF00FFFF00FF00000000000000000000
          0000000000000000000000000000000000000000000000FF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FF983B07983B07983B07983B07983B07983B07983B07983B
          07983B07983B07983B07FF00FFFF00FFFF00FFFF00FFFF00FF00000000000000
          0000000000000000000000000000000000000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FF0000000000000000000000000000000000000000000000
          00000000000000000000FF00FFFF00FFFF00FF0B0B0B00000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000000000000B
          0B0B0B0B0B0B0B0B0B0B0B0B0B0B000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000B0B0BCAB2
          90CAB290CAB290CAB290CAB290CAB290CAB290CAB290CAB290CAB290CAB290CA
          B290CAB290CAB290CAB290CAB290CAB290CAB290CAB290CAB290CAB290CAB290
          CAB290CAB290CAB290CAB290CAB290CAB290CAB290CAB290CAB290CAB290CAB2
          90CAB290CAB290CAB290CAB290CAB290CAB290CAB290CAB290CAB290CAB290CA
          B290CAB290CAB290CAB290CAB290CAB290CAB290CAB290CAB290000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000FF00FF00000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000FF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FF0000000000000B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B
          0B0B0B0B0B0B0B0B0B0B0B0B0B0000000000000B0B0B0B0B0B0B0B0B0B0B0B0B
          0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B
          0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B
          0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B
          0B0B0B0B0B0B0B0B0B0B0B0B0B0BC3AB89C3AB89C3AB89C3AB89C3AB89C3AB89
          C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB
          89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3
          AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89
          C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB89C3AB
          89C3AB89C3AB89C3AB8900000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000FF00FF000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000B0B0B0B0B0B000000000000000000000000000000000000
          0000000000000000000000000000000000000B0B0B0B0B0B0B0B0B0B0B0BBFA7
          84BFA784BFA784BFA784BFA784BFA784BFA784BFA784BFA784BFA784BFA784BF
          A784BFA784BFA784BFA784BFA784BFA784BFA784BFA784BFA784BFA784BFA784
          BFA784BFA784BFA784BFA784BFA784BFA784BFA784BFA784BFA784BFA784BFA7
          84BFA784BFA784BFA784BFA784BFA784BFA784BFA784BFA784BFA784BFA784BF
          A784BFA784BFA784BFA784BFA784BFA784BFA784BFA784BFA784FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFEFEFEFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFDFDFDF9F9F9F6F6F6F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F6F6F6
          F9F9F9FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FEFEFEFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFEFEFEFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDF9F9F9F6
          F6F6F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F6F6F6F9F9F9FDFDFDFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFEFEFEFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDF9F9F9F6F6F6F1F1F1F1F1F1F1
          F1F1F1F1F1F1F1F1F1F1F1F6F6F6F9F9F9FDFDFDFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFDFDFDF9F9F9F6F6F6F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1
          F1F1F6F6F6F9F9F9FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFEFEFEFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFD
          FDF9F9F9F6F6F6F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F6F6F6F9F9F9FD
          FDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEF6F6F6EDEDEDE9
          E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9EDEDEDF6F6F6FEFEFEFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDF6F6F6EDEDEDE1E1E1D6D6D6D1D1
          D1D1D1D1D1D1D1D1D1D1D6D6D6E1E1E1EDEDEDF6F6F6FDFDFDFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
          FFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEF6F6F6EDEDEDE9E9E9E9E9E9E9E9E9E9
          E9E9E9E9E9E9E9E9EDEDEDF6F6F6FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFDFDFDF6F6F6EDEDEDE1E1E1D6D6D6D1D1D1D1D1D1D1D1D1D1D1
          D1D6D6D6E1E1E1EDEDEDF6F6F6FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFF
          FFFFFFFFFEFEFEF6F6F6EDEDEDE9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9ED
          EDEDF6F6F6FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFD
          F6F6F6EDEDEDE1E1E1D6D6D6D1D1D1D1D1D1D1D1D1D1D1D1D6D6D6E1E1E1EDED
          EDF6F6F6FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEF6F6
          F6EDEDEDE9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9EDEDEDF6F6F6FEFEFEFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDF6F6F6EDEDEDE1E1E1
          D6D6D6D1D1D1D1D1D1D1D1D1D1D1D1D6D6D6E1E1E1EDEDEDF6F6F6FDFDFDFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEF6F6F6EDEDEDE9E9E9E9E9
          E9E9E9E9E9E9E9E9E9E9E9E9E9EDEDEDF6F6F6FEFEFEFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFDFDFDF6F6F6EDEDEDE1E1E1D6D6D6D1D1D1D1D1D1
          D1D1D1D1D1D1D6D6D6E1E1E1EDEDEDF6F6F6FDFDFDFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFEFEFEF6F6F6CACACAB8B8B8B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
          B2CACACAE1E1E1F6F6F6FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDF6
          F6F6E5E5E5CACACAB2B2B2A5A5A59F9F9F9999999F9F9F9F9F9FA5A5A5B8B8B8
          D1D1D1E5E5E5F6F6F6FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F9
          F9E5E5E5E1E1E1E1E1E1E1E1E1D6D6D6E1E1E1E1E1E1E5E5E5F9F9F9FFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFEFEFEF6F6F6
          CACACAB8B8B8B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2CACACAE1E1E1F6F6
          F6FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDF6F6F6E5E5E5CACACAB2
          B2B2A5A5A59F9F9F9999999F9F9F9F9F9FA5A5A5B8B8B8D1D1D1E5E5E5F6F6F6
          FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F9F9E5E5E5E1E1E1E1E1
          E1E1E1E1D6D6D6E1E1E1E1E1E1E5E5E5F9F9F9FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFEFEFEF6F6F6CACACAB8B8B8B2B2B2
          B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2CACACAE1E1E1F6F6F6FEFEFEFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFDFDFDF6F6F6E5E5E5CACACAB2B2B2A5A5A59F9F9F99
          99999F9F9F9F9F9FA5A5A5B8B8B8D1D1D1E5E5E5F6F6F6FDFDFDFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFF9F9F9E5E5E5E1E1E1E1E1E1E1E1E1D6D6D6E1E1
          E1E1E1E1E5E5E5F9F9F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFF
          FFFFFFFFFFFFFFFFFEFEFEF6F6F6CACACAB8B8B8B2B2B2B2B2B2B2B2B2B2B2B2
          B2B2B2B2B2B2CACACAE1E1E1F6F6F6FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFDFDFDF6F6F6E5E5E5CACACAB2B2B2A5A5A59F9F9F9999999F9F9F9F9F9FA5
          A5A5B8B8B8D1D1D1E5E5E5F6F6F6FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFF9F9F9E5E5E5E1E1E1E1E1E1E1E1E1D6D6D6E1E1E1E1E1E1E5E5E5F9F9
          F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFE
          FEFEF6F6F6CACACAB8B8B8B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2CACACA
          E1E1E1F6F6F6FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDF6F6F6E5E5
          E5CACACAB2B2B2A5A5A59F9F9F9999999F9F9F9F9F9FA5A5A5B8B8B8D1D1D1E5
          E5E5F6F6F6FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F9F9E5E5E5
          E1E1E1E1E1E1E1E1E1D6D6D6E1E1E1E1E1E1E5E5E5F9F9F9FFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEF6F6F6B8B8B801010100000000
          0000000000000000000000000000010101999999C3C3C3E1E1E1F6F6F6FEFEFE
          FFFFFFFFFFFFFFFFFFFDFDFDF6F6F6E5E5E5BDBDBD0B0B0B0505050505050505
          050101010505050505050B0B0B909090ACACACCACACAE5E5E5F6F6F6FDFDFDFF
          FFFFFFFFFFFFFFFFFFFFFFF9F9F9D1D1D10B0B0B070707070707070707010101
          0707070707070B0B0BD1D1D1F9F9F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
          FFFFFFFFFFFFFFFEFEFEF6F6F6B8B8B801010100000000000000000000000000
          0000000000010101999999C3C3C3E1E1E1F6F6F6FEFEFEFFFFFFFFFFFFFFFFFF
          FDFDFDF6F6F6E5E5E5BDBDBD0B0B0B0505050505050505050101010505050505
          050B0B0B909090ACACACCACACAE5E5E5F6F6F6FDFDFDFFFFFFFFFFFFFFFFFFFF
          FFFFF9F9F9D1D1D10B0B0B0707070707070707070101010707070707070B0B0B
          D1D1D1F9F9F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFEFE
          FEF6F6F6B8B8B801010100000000000000000000000000000000000001010199
          9999C3C3C3E1E1E1F6F6F6FEFEFEFFFFFFFFFFFFFFFFFFFDFDFDF6F6F6E5E5E5
          BDBDBD0B0B0B0505050505050505050101010505050505050B0B0B909090ACAC
          ACCACACAE5E5E5F6F6F6FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFF9F9F9D1D1D10B
          0B0B0707070707070707070101010707070707070B0B0BD1D1D1F9F9F9FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFEFEFEF6F6F6B8B8B80101
          01000000000000000000000000000000000000010101999999C3C3C3E1E1E1F6
          F6F6FEFEFEFFFFFFFFFFFFFFFFFFFDFDFDF6F6F6E5E5E5BDBDBD0B0B0B050505
          0505050505050101010505050505050B0B0B909090ACACACCACACAE5E5E5F6F6
          F6FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFF9F9F9D1D1D10B0B0B07070707070707
          07070101010707070707070B0B0BD1D1D1F9F9F9FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF00FFFFFFFFFFFFFFFEFEFEF6F6F6B8B8B80101010000000000000000
          00000000000000000000010101999999C3C3C3E1E1E1F6F6F6FEFEFEFFFFFFFF
          FFFFFFFFFFFDFDFDF6F6F6E5E5E5BDBDBD0B0B0B050505050505050505010101
          0505050505050B0B0B909090ACACACCACACAE5E5E5F6F6F6FDFDFDFFFFFFFFFF
          FFFFFFFFFFFFFFF9F9F9D1D1D10B0B0B07070707070707070701010107070707
          07070B0B0BD1D1D1F9F9F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFE
          F6F6F6B8B8B80101010000000000000000000000000000000000000000000000
          00010101999999C3C3C3E1E1E1F6F6F6FEFEFEFFFFFFFDFDFDF6F6F6E5E5E5BD
          BDBD0B0B0B000000000000000000000000000000000000000000000000070707
          8A8A8AACACACCACACAE5E5E5F6F6F6FDFDFDFFFFFFFFFFFFF9F9F9D1D1D10B0B
          0B0000000000000000000000000000000000000000000000000B0B0BD1D1D1F9
          F9F9FFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFEFEFEF6F6F6B8B8B8010101
          000000000000000000000000000000000000000000000000010101999999C3C3
          C3E1E1E1F6F6F6FEFEFEFFFFFFFDFDFDF6F6F6E5E5E5BDBDBD0B0B0B00000000
          00000000000000000000000000000000000000000707078A8A8AACACACCACACA
          E5E5E5F6F6F6FDFDFDFFFFFFFFFFFFF9F9F9D1D1D10B0B0B0000000000000000
          000000000000000000000000000000000B0B0BD1D1D1F9F9F9FFFFFFFFFFFFFF
          FFFFFFFFFFFF00FFFFFFFFFEFEFEF6F6F6B8B8B8010101000000000000000000
          000000000000000000000000000000010101999999C3C3C3E1E1E1F6F6F6FEFE
          FEFFFFFFFDFDFDF6F6F6E5E5E5BDBDBD0B0B0B00000000000000000000000000
          00000000000000000000000707078A8A8AACACACCACACAE5E5E5F6F6F6FDFDFD
          FFFFFFFFFFFFF9F9F9D1D1D10B0B0B0000000000000000000000000000000000
          000000000000000B0B0BD1D1D1F9F9F9FFFFFFFFFFFFFFFFFFFFFFFFFF00FFFF
          FFFFFEFEFEF6F6F6B8B8B8010101000000000000000000000000000000000000
          000000000000010101999999C3C3C3E1E1E1F6F6F6FEFEFEFFFFFFFDFDFDF6F6
          F6E5E5E5BDBDBD0B0B0B00000000000000000000000000000000000000000000
          00000707078A8A8AACACACCACACAE5E5E5F6F6F6FDFDFDFFFFFFFFFFFFF9F9F9
          D1D1D10B0B0B0000000000000000000000000000000000000000000000000B0B
          0BD1D1D1F9F9F9FFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFEFEFEF6F6F6B8
          B8B8010101000000000000000000000000000000000000000000000000010101
          999999C3C3C3E1E1E1F6F6F6FEFEFEFFFFFFFDFDFDF6F6F6E5E5E5BDBDBD0B0B
          0B0000000000000000000000000000000000000000000000000707078A8A8AAC
          ACACCACACAE5E5E5F6F6F6FDFDFDFFFFFFFFFFFFF9F9F9D1D1D10B0B0B000000
          0000000000000000000000000000000000000000000B0B0BD1D1D1F9F9F9FFFF
          FFFFFFFFFFFFFFFFFFFFFEFEFEF6F6F6B8B8B801010100000000000000000000
          0000000000000000000000000000000000000000010101999999C3C3C3E1E1E1
          F6F6F6FEFEFEF9F9F9E9E9E9C3C3C30B0B0B0000000000000000000000000000
          000000000000000000000000000000000707078A8A8AACACACD1D1D1E9E9E9F9
          F9F9FFFFFFF9F9F9D1D1D10B0B0B000000000000000000000000000000000000
          0000000000000000000000000B0B0BD1D1D1F9F9F9FFFFFFFFFFFFFFFFFFFF00
          FFFEFEFEF6F6F6B8B8B801010100000000000000000000000000000000000000
          0000000000000000000000010101999999C3C3C3E1E1E1F6F6F6FEFEFEF9F9F9
          E9E9E9C3C3C30B0B0B0000000000000000000000000000000000000000000000
          000000000000000707078A8A8AACACACD1D1D1E9E9E9F9F9F9FFFFFFF9F9F9D1
          D1D10B0B0B000000000000000000000000000000000000000000000000000000
          0000000B0B0BD1D1D1F9F9F9FFFFFFFFFFFFFFFFFFFF00FFFEFEFEF6F6F6B8B8
          B801010100000000000000000000000000000000000000000000000000000000
          0000010101999999C3C3C3E1E1E1F6F6F6FEFEFEF9F9F9E9E9E9C3C3C30B0B0B
          0000000000000000000000000000000000000000000000000000000000000707
          078A8A8AACACACD1D1D1E9E9E9F9F9F9FFFFFFF9F9F9D1D1D10B0B0B00000000
          00000000000000000000000000000000000000000000000000000B0B0BD1D1D1
          F9F9F9FFFFFFFFFFFFFFFFFFFF00FFFEFEFEF6F6F6B8B8B80101010000000000
          00000000000000000000000000000000000000000000000000010101999999C3
          C3C3E1E1E1F6F6F6FEFEFEF9F9F9E9E9E9C3C3C30B0B0B000000000000000000
          0000000000000000000000000000000000000000000707078A8A8AACACACD1D1
          D1E9E9E9F9F9F9FFFFFFF9F9F9D1D1D10B0B0B00000000000000000000000000
          00000000000000000000000000000000000B0B0BD1D1D1F9F9F9FFFFFFFFFFFF
          FFFFFFFF00FFFEFEFEF6F6F6B8B8B80101010000000000000000000000000000
          00000000000000000000000000000000010101999999C3C3C3E1E1E1F6F6F6FE
          FEFEF9F9F9E9E9E9C3C3C30B0B0B000000000000000000000000000000000000
          0000000000000000000000000707078A8A8AACACACD1D1D1E9E9E9F9F9F9FFFF
          FFF9F9F9D1D1D10B0B0B00000000000000000000000000000000000000000000
          00000000000000000B0B0BD1D1D1F9F9F9FFFFFFFFFFFFFFFFFFFDFDFDC3C3C3
          0101010000000000000000000000000000000000000000000000000000000000
          00000000000000010101999999CACACAE9E9E9FDFDFDF4F4F4CACACA0B0B0B00
          0000000000000000000000000000000000000000000000000000000000000000
          0000000707078A8A8AB7B7B7DBDBDBF4F4F4F9F9F9D1D1D10B0B0B0000000000
          000000000000000000000000000000000000000000000000000000000000000B
          0B0BD1D1D1F9F9F9FFFFFFFFFFFFFF00FFFDFDFDC3C3C3010101000000000000
          0000000000000000000000000000000000000000000000000000000000000101
          01999999CACACAE9E9E9FDFDFDF4F4F4CACACA0B0B0B00000000000000000000
          00000000000000000000000000000000000000000000000000000707078A8A8A
          B7B7B7DBDBDBF4F4F4F9F9F9D1D1D10B0B0B0000000000000000000000000000
          000000000000000000000000000000000000000000000B0B0BD1D1D1F9F9F9FF
          FFFFFFFFFFFF00FFFDFDFDC3C3C3010101000000000000000000000000000000
          000000000000000000000000000000000000000000010101999999CACACAE9E9
          E9FDFDFDF4F4F4CACACA0B0B0B00000000000000000000000000000000000000
          00000000000000000000000000000000000707078A8A8AB7B7B7DBDBDBF4F4F4
          F9F9F9D1D1D10B0B0B0000000000000000000000000000000000000000000000
          000000000000000000000000000B0B0BD1D1D1F9F9F9FFFFFFFFFFFFFF00FFFD
          FDFDC3C3C3010101000000000000000000000000000000000000000000000000
          000000000000000000000000010101999999CACACAE9E9E9FDFDFDF4F4F4CACA
          CA0B0B0B00000000000000000000000000000000000000000000000000000000
          00000000000000000707078A8A8AB7B7B7DBDBDBF4F4F4F9F9F9D1D1D10B0B0B
          0000000000000000000000000000000000000000000000000000000000000000
          000000000B0B0BD1D1D1F9F9F9FFFFFFFFFFFFFF00FFFDFDFDC3C3C301010100
          0000000000000000000000000000000000000000000000000000000000000000
          000000010101999999CACACAE9E9E9FDFDFDF4F4F4CACACA0B0B0B0000000000
          0000000000000000000000000000000000000000000000000000000000000007
          07078A8A8AB7B7B7DBDBDBF4F4F4F9F9F9D1D1D10B0B0B000000000000000000
          0000000000000000000000000000000000000000000000000000000B0B0BD1D1
          D1F9F9F9FFFFFFFFFFFFE1E1E101010100000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000010101B2B2B2
          E5E5E5F9F9F9E9E9E90F0F0F0000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000B0B0BA5A5A5D1D1D1F1
          F1F1E5E5E50B0B0B000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000B0B0BE5E5E5FEFEFEFFFFFFFF00
          FFE1E1E101010100000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000010101B2B2B2E5E5E5F9F9F9E9E9E9
          0F0F0F0000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000B0B0BA5A5A5D1D1D1F1F1F1E5E5E50B0B0B00
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000B0B0BE5E5E5FEFEFEFFFFFFFF00FFE1E1E10101010000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000010101B2B2B2E5E5E5F9F9F9E9E9E90F0F0F000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000B0B0BA5A5A5D1D1D1F1F1F1E5E5E50B0B0B00000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0B0B0BE5E5E5FEFEFEFFFFFFFF00FFE1E1E10101010000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000001
          0101B2B2B2E5E5E5F9F9F9E9E9E90F0F0F000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000B0B0BA5A5
          A5D1D1D1F1F1F1E5E5E50B0B0B00000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000B0B0BE5E5E5FEFEFE
          FFFFFFFF00FFE1E1E10101010000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000010101B2B2B2E5E5E5F9
          F9F9E9E9E90F0F0F000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000B0B0BA5A5A5D1D1D1F1F1F1E5E5
          E50B0B0B00000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000B0B0BE5E5E5FEFEFEFFFFFFCACACA000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000009F9F9FE1E1E1F9F9F9DBDBDB01010100000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000010101999999D1D1D1EDEDEDD6D6D60101010000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000010101D6D6D6FDFDFDFFFFFFFF00FFCACACA000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000009F9F9FE1E1E1F9F9F9DBDBDB01010100000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000010101
          999999D1D1D1EDEDEDD6D6D60101010000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000010101D6D6D6FD
          FDFDFFFFFFFF00FFCACACA000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000009F9F9FE1E1
          E1F9F9F9DBDBDB01010100000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000010101999999D1D1D1EDEDED
          D6D6D60101010000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000010101D6D6D6FDFDFDFFFFFFFF00FFCA
          CACA000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000009F9F9FE1E1E1F9F9F9DBDBDB0101
          0100000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000010101999999D1D1D1EDEDEDD6D6D6010101000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000010101D6D6D6FDFDFDFFFFFFFF00FFCACACA00000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000009F9F9FE1E1E1F9F9F9DBDBDB0101010000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000010101999999D1D1D1EDEDEDD6D6D6010101000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000101
          01D6D6D6FDFDFDFFFFFFCACACA00000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000000000009F9F9F
          E1E1E1F9F9F9D1D1D10000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000909090D1D1D1ED
          EDEDC3C3C3000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000C3C3C3FDFDFDFFFFFFFF00
          FFCACACA00000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000009F9F9FE1E1E1F9F9F9D1D1D1
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000909090D1D1D1EDEDEDC3C3C300000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000C3C3C3FDFDFDFFFFFFFF00FFCACACA0000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000009F9F9FE1E1E1F9F9F9D1D1D1000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000909090D1D1D1EDEDEDC3C3C300000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000C3C3C3FDFDFDFFFFFFFF00FFCACACA0000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00009F9F9FE1E1E1F9F9F9D1D1D1000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000009090
          90D1D1D1EDEDEDC3C3C300000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000C3C3C3FDFDFD
          FFFFFFFF00FFCACACA0000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000009F9F9FE1E1E1F9
          F9F9D1D1D1000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000909090D1D1D1EDEDEDC3C3
          C300000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000C3C3C3FDFDFDFFFFFFCACACA000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000009F9F9FE5E5E5F9F9F9E9E9E907070700000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000050505A5A5A5D6D6D6F1F1F1DBDBDB0707070000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000070707E1E1E1FEFEFEFFFFFFFF00FFCACACA000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000009F9F9FE5E5E5F9F9F9E9E9E907070700000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000050505
          A5A5A5D6D6D6F1F1F1DBDBDB0707070000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000070707E1E1E1FE
          FEFEFFFFFFFF00FFCACACA000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000009F9F9FE5E5
          E5F9F9F9E9E9E907070700000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000050505A5A5A5D6D6D6F1F1F1
          DBDBDB0707070000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000070707E1E1E1FEFEFEFFFFFFFF00FFCA
          CACA000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000009F9F9FE5E5E5F9F9F9E9E9E90707
          0700000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000050505A5A5A5D6D6D6F1F1F1DBDBDB070707000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000070707E1E1E1FEFEFEFFFFFFFF00FFCACACA00000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000009F9F9FE5E5E5F9F9F9E9E9E90707070000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000050505A5A5A5D6D6D6F1F1F1DBDBDB070707000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000707
          07E1E1E1FEFEFEFFFFFFCACACA00000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000A5A5A5
          E9E9E9FDFDFDEDEDED0707070000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000050505B2B2B2E1E1E1F4
          F4F4E1E1E1070707000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000070707E1E1E1FEFEFEFFFFFFFF00
          FFCACACA00000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000A5A5A5E9E9E9FDFDFDEDEDED
          0707070000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000050505B2B2B2E1E1E1F4F4F4E1E1E107070700
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000070707E1E1E1FEFEFEFFFFFFFF00FFCACACA0000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000A5A5A5E9E9E9FDFDFDEDEDED070707000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000050505B2B2B2E1E1E1F4F4F4E1E1E107070700000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          070707E1E1E1FEFEFEFFFFFFFF00FFCACACA0000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000A5A5A5E9E9E9FDFDFDEDEDED070707000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000050505B2B2
          B2E1E1E1F4F4F4E1E1E107070700000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000070707E1E1E1FEFEFE
          FFFFFFFF00FFCACACA0000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000A5A5A5E9E9E9FD
          FDFDEDEDED070707000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000050505B2B2B2E1E1E1F4F4F4E1E1
          E107070700000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000070707E1E1E1FEFEFEFFFFFFE5E5E5010101
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000010101CACACAF6F6F6FEFEFEF1F1F10F0F0F00000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000B0B0BCACACAEDEDEDF9F9F9E5E5E50F0F0F0000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000F0F0FE5E5E5FFFFFFFFFFFFFF00FFE5E5E5010101000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00010101CACACAF6F6F6FEFEFEF1F1F10F0F0F00000000000000000000000000
          00000000000000000000000000000000000000000000000000000000000B0B0B
          CACACAEDEDEDF9F9F9E5E5E50F0F0F0000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000F0F0FE5E5E5FF
          FFFFFFFFFFFF00FFE5E5E5010101000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000010101CACACAF6F6
          F6FEFEFEF1F1F10F0F0F00000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000B0B0BCACACAEDEDEDF9F9F9
          E5E5E50F0F0F0000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000F0F0FE5E5E5FFFFFFFFFFFFFF00FFE5
          E5E5010101000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000010101CACACAF6F6F6FEFEFEF1F1F10F0F
          0F00000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000B0B0BCACACAEDEDEDF9F9F9E5E5E50F0F0F000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000F0F0FE5E5E5FFFFFFFFFFFFFF00FFE5E5E501010100000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000010101CACACAF6F6F6FEFEFEF1F1F10F0F0F0000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000B0B0BCACACAEDEDEDF9F9F9E5E5E50F0F0F000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000F0F
          0FE5E5E5FFFFFFFFFFFFFFFFFFD1D1D101010100000000000000000000000000
          0000000000000000000000000000000000000000000000010101B8B8B8F6F6F6
          FEFEFEFFFFFFFDFDFDE9E9E90F0F0F0000000000000000000000000000000000
          000000000000000000000000000000000000000B0B0BBDBDBDE5E5E5F6F6F6FD
          FDFDF9F9F9D1D1D10F0F0F000000000000000000000000000000000000000000
          0000000000000000000000000000000F0F0FD1D1D1F9F9F9FFFFFFFFFFFFFF00
          FFFFFFFFD1D1D101010100000000000000000000000000000000000000000000
          0000000000000000000000000000010101B8B8B8F6F6F6FEFEFEFFFFFFFDFDFD
          E9E9E90F0F0F0000000000000000000000000000000000000000000000000000
          000000000000000000000B0B0BBDBDBDE5E5E5F6F6F6FDFDFDF9F9F9D1D1D10F
          0F0F000000000000000000000000000000000000000000000000000000000000
          0000000000000F0F0FD1D1D1F9F9F9FFFFFFFFFFFFFF00FFFFFFFFD1D1D10101
          0100000000000000000000000000000000000000000000000000000000000000
          0000000000010101B8B8B8F6F6F6FEFEFEFFFFFFFDFDFDE9E9E90F0F0F000000
          0000000000000000000000000000000000000000000000000000000000000000
          000B0B0BBDBDBDE5E5E5F6F6F6FDFDFDF9F9F9D1D1D10F0F0F00000000000000
          00000000000000000000000000000000000000000000000000000000000F0F0F
          D1D1D1F9F9F9FFFFFFFFFFFFFF00FFFFFFFFD1D1D10101010000000000000000
          00000000000000000000000000000000000000000000000000000000010101B8
          B8B8F6F6F6FEFEFEFFFFFFFDFDFDE9E9E90F0F0F000000000000000000000000
          0000000000000000000000000000000000000000000000000B0B0BBDBDBDE5E5
          E5F6F6F6FDFDFDF9F9F9D1D1D10F0F0F00000000000000000000000000000000
          00000000000000000000000000000000000000000F0F0FD1D1D1F9F9F9FFFFFF
          FFFFFFFF00FFFFFFFFD1D1D10101010000000000000000000000000000000000
          00000000000000000000000000000000000000010101B8B8B8F6F6F6FEFEFEFF
          FFFFFDFDFDE9E9E90F0F0F000000000000000000000000000000000000000000
          0000000000000000000000000000000B0B0BBDBDBDE5E5E5F6F6F6FDFDFDF9F9
          F9D1D1D10F0F0F00000000000000000000000000000000000000000000000000
          00000000000000000000000F0F0FD1D1D1F9F9F9FFFFFFFFFFFFFFFFFFFFFFFF
          D1D1D10101010000000000000000000000000000000000000000000000000000
          00000000010101B8B8B8F6F6F6FEFEFEFFFFFFFFFFFFFFFFFFFDFDFDE9E9E90F
          0F0F000000000000000000000000000000000000000000000000000000000000
          0B0B0BBDBDBDE5E5E5F6F6F6FDFDFDFFFFFFFFFFFFF9F9F9D1D1D10F0F0F0000
          000000000000000000000000000000000000000000000000000000000F0F0FD1
          D1D1F9F9F9FFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFD1D1D1010101000000
          000000000000000000000000000000000000000000000000000000010101B8B8
          B8F6F6F6FEFEFEFFFFFFFFFFFFFFFFFFFDFDFDE9E9E90F0F0F00000000000000
          00000000000000000000000000000000000000000000000B0B0BBDBDBDE5E5E5
          F6F6F6FDFDFDFFFFFFFFFFFFF9F9F9D1D1D10F0F0F0000000000000000000000
          000000000000000000000000000000000000000F0F0FD1D1D1F9F9F9FFFFFFFF
          FFFFFFFFFFFF00FFFFFFFFFFFFFFD1D1D1010101000000000000000000000000
          000000000000000000000000000000000000010101B8B8B8F6F6F6FEFEFEFFFF
          FFFFFFFFFFFFFFFDFDFDE9E9E90F0F0F00000000000000000000000000000000
          00000000000000000000000000000B0B0BBDBDBDE5E5E5F6F6F6FDFDFDFFFFFF
          FFFFFFF9F9F9D1D1D10F0F0F0000000000000000000000000000000000000000
          000000000000000000000F0F0FD1D1D1F9F9F9FFFFFFFFFFFFFFFFFFFF00FFFF
          FFFFFFFFFFD1D1D1010101000000000000000000000000000000000000000000
          000000000000000000010101B8B8B8F6F6F6FEFEFEFFFFFFFFFFFFFFFFFFFDFD
          FDE9E9E90F0F0F00000000000000000000000000000000000000000000000000
          00000000000B0B0BBDBDBDE5E5E5F6F6F6FDFDFDFFFFFFFFFFFFF9F9F9D1D1D1
          0F0F0F0000000000000000000000000000000000000000000000000000000000
          000F0F0FD1D1D1F9F9F9FFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFD1D1D101
          0101000000000000000000000000000000000000000000000000000000000000
          010101B8B8B8F6F6F6FEFEFEFFFFFFFFFFFFFFFFFFFDFDFDE9E9E90F0F0F0000
          000000000000000000000000000000000000000000000000000000000B0B0BBD
          BDBDE5E5E5F6F6F6FDFDFDFFFFFFFFFFFFF9F9F9D1D1D10F0F0F000000000000
          0000000000000000000000000000000000000000000000000F0F0FD1D1D1F9F9
          F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD1D1D101010100000000000000
          0000000000000000000000000000000000010101B8B8B8F6F6F6FEFEFEFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFDFDFDE9E9E90F0F0F0000000000000000000000
          000000000000000000000000000B0B0BC3C3C3E5E5E5F6F6F6FDFDFDFFFFFFFF
          FFFFFFFFFFFFFFFFF9F9F9D1D1D10F0F0F000000000000000000000000000000
          0000000000000000000F0F0FD1D1D1F9F9F9FFFFFFFFFFFFFFFFFFFFFFFFFF00
          FFFFFFFFFFFFFFFFFFFFD1D1D101010100000000000000000000000000000000
          0000000000000000010101B8B8B8F6F6F6FEFEFEFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFDFDFDE9E9E90F0F0F0000000000000000000000000000000000000000
          000000000B0B0BC3C3C3E5E5E5F6F6F6FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFF9
          F9F9D1D1D10F0F0F000000000000000000000000000000000000000000000000
          0F0F0FD1D1D1F9F9F9FFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFF
          FFD1D1D101010100000000000000000000000000000000000000000000000001
          0101B8B8B8F6F6F6FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDE9E9E9
          0F0F0F0000000000000000000000000000000000000000000000000B0B0BC3C3
          C3E5E5E5F6F6F6FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFF9F9F9D1D1D10F0F0F00
          00000000000000000000000000000000000000000000000F0F0FD1D1D1F9F9F9
          FFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFD1D1D10101010000
          00000000000000000000000000000000000000000000010101B8B8B8F6F6F6FE
          FEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDE9E9E90F0F0F000000000000
          0000000000000000000000000000000000000B0B0BC3C3C3E5E5E5F6F6F6FDFD
          FDFFFFFFFFFFFFFFFFFFFFFFFFF9F9F9D1D1D10F0F0F00000000000000000000
          00000000000000000000000000000F0F0FD1D1D1F9F9F9FFFFFFFFFFFFFFFFFF
          FFFFFFFF00FFFFFFFFFFFFFFFFFFFFD1D1D10101010000000000000000000000
          00000000000000000000000000010101B8B8B8F6F6F6FEFEFEFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFDFDFDE9E9E90F0F0F000000000000000000000000000000
          0000000000000000000B0B0BC3C3C3E5E5E5F6F6F6FDFDFDFFFFFFFFFFFFFFFF
          FFFFFFFFF9F9F9D1D1D10F0F0F00000000000000000000000000000000000000
          00000000000F0F0FD1D1D1F9F9F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFD1D1D10101010000000000000000000000000000000000000101
          01C3C3C3F6F6F6FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD
          FDFDE9E9E90F0F0F0707070707070707070101010707070707070F0F0FD1D1D1
          EDEDEDF6F6F6FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F9F9D1D1
          D10F0F0F0707070707070707070101010707070707070F0F0FD1D1D1F9F9F9FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFD1D1D1
          010101000000000000000000000000000000000000010101C3C3C3F6F6F6FEFE
          FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDE9E9E90F0F0F07
          07070707070707070101010707070707070F0F0FD1D1D1EDEDEDF6F6F6FDFDFD
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F9F9D1D1D10F0F0F0707070707
          070707070101010707070707070F0F0FD1D1D1F9F9F9FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFD1D1D1010101000000000000
          000000000000000000000000010101C3C3C3F6F6F6FEFEFEFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDE9E9E90F0F0F07070707070707070701
          01010707070707070F0F0FD1D1D1EDEDEDF6F6F6FDFDFDFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFF9F9F9D1D1D10F0F0F0707070707070707070101010707
          070707070F0F0FD1D1D1F9F9F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFF
          FFFFFFFFFFFFFFFFFFFFFFD1D1D1010101000000000000000000000000000000
          000000010101C3C3C3F6F6F6FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFDFDFDE9E9E90F0F0F0707070707070707070101010707070707070F
          0F0FD1D1D1EDEDEDF6F6F6FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          F9F9F9D1D1D10F0F0F0707070707070707070101010707070707070F0F0FD1D1
          D1F9F9F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFF
          FFFFD1D1D1010101000000000000000000000000000000000000010101C3C3C3
          F6F6F6FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDE9E9
          E90F0F0F0707070707070707070101010707070707070F0F0FD1D1D1EDEDEDF6
          F6F6FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F9F9D1D1D10F0F0F
          0707070707070707070101010707070707070F0F0FD1D1D1F9F9F9FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE5E5E5E5E5E5E5
          E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5FDFDFDFEFEFEFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDF1F1F1EDEDEDE9E9E9E9E9
          E9E1E1E1E9E9E9E9E9E9E9E9E9F6F6F6F9F9F9FDFDFDFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F9F9E5E5E5E1E1E1E1E1E1E1E1E1D6D6D6
          E1E1E1E1E1E1E5E5E5F9F9F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5
          E5E5E5E5E5E5E5E5FDFDFDFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFDFDFDF1F1F1EDEDEDE9E9E9E9E9E9E1E1E1E9E9E9E9E9
          E9E9E9E9F6F6F6F9F9F9FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFF9F9F9E5E5E5E1E1E1E1E1E1E1E1E1D6D6D6E1E1E1E1E1E1E5E5E5
          F9F9F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFE5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5FD
          FDFDFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FDFDFDF1F1F1EDEDEDE9E9E9E9E9E9E1E1E1E9E9E9E9E9E9E9E9E9F6F6F6F9F9
          F9FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F9F9E5
          E5E5E1E1E1E1E1E1E1E1E1D6D6D6E1E1E1E1E1E1E5E5E5F9F9F9FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE5E5
          E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5FDFDFDFEFEFEFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDF1F1F1EDEDED
          E9E9E9E9E9E9E1E1E1E9E9E9E9E9E9E9E9E9F6F6F6F9F9F9FDFDFDFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F9F9E5E5E5E1E1E1E1E1E1E1
          E1E1D6D6D6E1E1E1E1E1E1E5E5E5F9F9F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE5E5E5E5E5E5E5E5E5E5E5
          E5E5E5E5E5E5E5E5E5E5E5E5E5FDFDFDFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDF1F1F1EDEDEDE9E9E9E9E9E9E1E1E1
          E9E9E9E9E9E9E9E9E9F6F6F6F9F9F9FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFF9F9F9E5E5E5E1E1E1E1E1E1E1E1E1D6D6D6E1E1E1E1
          E1E1E5E5E5F9F9F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFE
          FEFEFEFEFEFEFEFEFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFEFEFEFEFEFEFEFEFEFE
          FEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000FF00FF000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000FF00FF000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000000000FF00FF00
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000FF00FF00000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000000000FF00
          FF00000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000FF00FF0000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000FF00FF0000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000FF00FF0000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000FF00FF000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000FF00FF000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000000000FF00FF00
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000FF00FF00000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000051515146464643
          4343434343434343434343464646515151000000000000000000000000000000
          000000000000000000000000000000000000000000A858007D3300621B00621B
          00621B00621B007D3300A8580000000000000000000000000000000000000000
          00000000000000000000000000000000007D3300621B00621B007D33007D3300
          7D33007D3300A85800000000000000000000000000000000000000000000FF00
          FF00000000000000000000000000000051515146464643434343434343434343
          4343464646515151000000000000000000000000000000000000000000000000
          000000000000000000000000A858007D3300621B00621B00621B00621B007D33
          00A8580000000000000000000000000000000000000000000000000000000000
          00000000000000007D3300621B00621B007D33007D33007D33007D3300A85800
          000000000000000000000000000000000000000000FF00FF0000000000000000
          0000000000000051515146464643434343434343434343434346464651515100
          0000000000000000000000000000000000000000000000000000000000000000
          000000A858007D3300621B00621B00621B00621B007D3300A858000000000000
          0000000000000000000000000000000000000000000000000000000000000098
          3B077D33007D33007D33007D33007D33007D3300A85800000000000000000000
          000000000000000000000000FF00FF0000000000000000000000000000005151
          5146464643434343434343434343434346464651515100000000000000000000
          0000000000000000000000000000000000000000000000000000A858007D3300
          621B00621B00621B00621B007D3300A858000000000000000000000000000000
          00000000000000000000000000000000000000000000983B077D33007D33007D
          33007D33007D33007D3300A85800000000000000000000000000000000000000
          000000FF00FF0000000000000000000000000000005151514646464343434343
          4343434343434346464651515100000000000000000000000000000000000000
          0000000000000000000000000000000000A858007D33007D33007D33007D3300
          7D33007D3300A858000000000000000000000000000000000000000000000000
          00000000000000000000000000983B077D33007D33007D33007D33007D33007D
          3300A85800000000000000000000000000000000000000000000000000000000
          0000000000006D533A987145C5955FEBB269EBB269EBB269EBB269C5955F9871
          456D533A00000000000000000000000000000000000000000000000000000000
          0000A85800FFC404FFDE04FFF568FFF568FFF568FFF568FFDE04FFC404A85800
          0000000000000000000000000000000000000000000000000000000000007D33
          00EBA00AFFDE04FFF568FFF568FFF568FFF568FFDE04FFC404A8580000000000
          0000000000000000000000000000FF00FF0000000000000000000000006D533A
          987145C5955FEBB269EBB269EBB269EBB269C5955F9871456D533A0000000000
          00000000000000000000000000000000000000000000000000A85800FFC404FF
          DE04FFF568FFF568FFF568FFF568FFDE04FFC404A85800000000000000000000
          0000000000000000000000000000000000000000007D3300EBA00AFFDE04FFF5
          68FFF568FFF568FFF568FFDE04FFC404A8580000000000000000000000000000
          0000000000FF00FF0000000000000000000000006D533A987145C5955FEBB269
          EBB269EBB269EBB269C5955F9871456D533A0000000000000000000000000000
          00000000000000000000000000000000A85800FFC404FFDE04FFF568FFF568FF
          F568FFF568FFDE04FFC404A85800000000000000000000000000000000000000
          0000000000000000000000007D3300EBA00AFFDE04FFF568FFF568FFF568FFF5
          68FFDE04FFC404A85800000000000000000000000000000000000000FF00FF00
          00000000000000000000006D533A987145C5955FEBB269EBB269EBB269EBB269
          C5955F9871456D533A0000000000000000000000000000000000000000000000
          00000000000000A85800FFC404FFDE04FFF568FFF568FFF568FFF568FFDE04FF
          C404A85800000000000000000000000000000000000000000000000000000000
          0000007D3300EBA00AFFDE04FFF568FFF568FFF568FFF568FFDE04FFC404A858
          00000000000000000000000000000000000000FF00FF00000000000000000000
          00006D533A987145C5955FEBB269EBB269EBB269EBB269C5955F9871456D533A
          000000000000000000000000000000000000000000000000000000000000A858
          00FFC404FFDE04FFF568FFF568FFF568FFF568FFDE04FFC404A8580000000000
          00000000000000000000000000000000000000000000000000007D3300EBA00A
          FFDE04FFF568FFF568FFF568FFF568FFDE04FFC404A858000000000000000000
          000000000000000000000000000000000000008B6832EBB269FDCC8EFED5A7FE
          D5A7FED5A7FED5A7FED5A7FED5A7FDCC8EEBB2698B6832000000000000000000
          000000000000000000000000000000D18804FFEE38FFF9C7FFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFBD8FFEE38D1880400000000000000000000000000
          0000000000000000000000983B07FFDE04FFFE99FFFEE4FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFEFFFF568EBA00A000000000000000000000000000000FF00
          FF0000000000000000008B6832EBB269FDCC8EFED5A7FED5A7FED5A7FED5A7FE
          D5A7FED5A7FDCC8EEBB2698B6832000000000000000000000000000000000000
          000000000000D18804FFEE38FFF9C7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFBD8FFEE38D1880400000000000000000000000000000000000000000000
          0000983B07FFDE04FFFE99FFFEE4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEF
          FFF568EBA00A000000000000000000000000000000FF00FF0000000000000000
          008B6832EBB269FDCC8EFED5A7FED5A7FED5A7FED5A7FED5A7FED5A7FDCC8EEB
          B2698B6832000000000000000000000000000000000000000000000000D18804
          FFEE38FFFBD8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBD8FFEE38D188
          04000000000000000000000000000000000000000000000000983B07FFDE04FF
          FE99FFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFF568EBA00A000000
          000000000000000000000000FF00FF0000000000000000008B6832EBB269FDCC
          8EFED5A7FED5A7FED5A7FED5A7FED5A7FED5A7FDCC8EEBB2698B683200000000
          0000000000000000000000000000000000000000D18804FFEE38FFF9C7FFFFFF
          FFFFFFBA7002BA7002FFFFFFFFFFFFFFFBD8FFEE38D188040000000000000000
          00000000000000000000000000000000983B07FFDE04FFFE99FFFFEFFFFFFFD1
          8804D18804FFFFFFFFFFFFFFFFEFFFF568EBA00A000000000000000000000000
          000000FF00FF0000000000000000008B6832EBB269FDCC8EFED5A7FED5A7FED5
          A7FED5A7FED5A7FED5A7FDCC8EEBB2698B683200000000000000000000000000
          0000000000000000000000D18804FFF568FFFBD8FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFEE4FFF568D188040000000000000000000000000000000000
          00000000000000983B07FFDE04FFFE99FFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFEFFFF568EBA00A000000000000000000000000000000000000000000
          8B6832E8AC56FDCC8EFED5A7FED5A7FED5A7FED5A7FED5A7FED5A7FED5A7FED5
          A7FDCC8EE8AC568B6832000000000000000000000000000000000000BA7002FF
          EE38FFF9C7FFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7FFF9C7
          FFEE38BA7002000000000000000000000000000000000000621B00FFC404FFEE
          38FFFE99FFFEE4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9C7FFEE38D1
          8804000000000000000000000000FF00FF0000000000008B6832E8AC56FDCC8E
          FED5A7FED5A7FED5A7FED5A7FED5A7FED5A7FED5A7FED5A7FDCC8EE8AC568B68
          32000000000000000000000000000000000000BA7002FFEE38FFF9C7FFFFEFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7FFF9C7FFEE38BA7002000000
          000000000000000000000000000000621B00FFC404FFEE38FFFE99FFFEE4FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9C7FFEE38D1880400000000000000
          0000000000FF00FF0000000000008B6832E8AC56FDCC8EFED5A7FED5A7FED5A7
          FED5A7FED5A7FED5A7FED5A7FED5A7FDCC8EE8AC568B68320000000000000000
          00000000000000000000BA7002FFEE38FFF9C7FEFEFCFFFFFFFFFFFFFFDE04EB
          A00AFFFFFFFFFFFFFFFFFFFFF9C7FFEE38BA7002000000000000000000000000
          000000000000621B00FFC404FFEE38FFFE99FFFFEFFFFFFFEBA00AFFDE04FFFF
          FFFFFFFFFFFFFFFFFBD8FFEE38D18804000000000000000000000000FF00FF00
          00000000008B6832E8AC56FDCC8EFED5A7FED5A7FED5A7FED5A7FED5A7FED5A7
          FED5A7FED5A7FDCC8EE8AC568B68320000000000000000000000000000000000
          00BA7002FFEE38FFF9C7FFFFF7FFFFFFFFFFFFBA7002BA7002FFFFFFFFFFFFFE
          FEFCFFF9C7FFEE38BA7002000000000000000000000000000000000000621B00
          FFC404FFEE38FFFE99FFFFEFFFFFFFD18804D18804FFFFFFFFFFFFFFFFFFFFFB
          D8FFEE38D18804000000000000000000000000FF00FF0000000000008B6832E8
          AC56FDCC8EFED5A7FED5A7FED5A7FED5A7FED5A7FED5A7FED5A7FED5A7FDCC8E
          E8AC568B6832000000000000000000000000000000000000BA7002FFEE38FFF9
          C7FFC404FFDE04FFFFFFFFFFFFFFFFFFFFFFFFFFEE38FFC404FFF9C7FFEE38BA
          7002000000000000000000000000000000000000621B00FFC404FFEE38FFC404
          FFEE38FFFFFFFFFFFFFFFFFFFFFFFFFFEE38FFDE04FFFBD8FFF568D188040000
          00000000000000000000000000826751B68538EBB269F8BB84FDCC8EFDCC8EFE
          D5A7FED5A7FED5A7FED5A7FDCC8EFDCC8EF8BB84EBB269B68538826751000000
          000000000000000000EBA00AFFC404FFEE38FFFE99FFF9C7FFFEE4FFFFF7FFFF
          F7FFFFF7FFFFF7FFFFEFFFF9C7FFFE99FFF568FFC404EBA00A00000000000000
          00000000007D3300A85800FFC404FFEE38FFF568FFF9C7FFFFEFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFEE4FFF9C7FFF568FFC404EBA00A000000000000000000FF00
          FF000000826751B68538EBB269F8BB84FDCC8EFDCC8EFED5A7FED5A7FED5A7FE
          D5A7FDCC8EFDCC8EF8BB84EBB269B68538826751000000000000000000000000
          EBA00AFFC404FFEE38FFFE99FFF9C7FFFEE4FFFFF7FFFFF7FFFFF7FFFFF7FFFF
          EFFFF9C7FFFE99FFF568FFC404EBA00A0000000000000000000000007D3300A8
          5800FFC404FFEE38FFF568FFF9C7FFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFEE4
          FFF9C7FFF568FFC404EBA00A000000000000000000FF00FF000000826751B685
          38EBB269F8BB84FDCC8EFDCC8EFED5A7FED5A7FED5A7FED5A7FDCC8EFDCC8EF8
          BB84EBB269B68538826751000000000000000000000000EBA00AFFC404FFEE38
          FFF9C7FFFBD8FFFFEFFFFFFFFFDE04D18804FFFFFFFFFFEFFFFBD8FFF9C7FFF5
          68FFC404EBA00A0000000000000000000000007D3300A85800FFC404FFEE38FF
          F568FFF9C7FFFFEFD18804FFDE04FFFFFFFFFFFFFFFFEFFFF9C7FFF568FFC404
          EBA00A000000000000000000FF00FF000000826751B68538EBB269F8BB84FDCC
          8EFDCC8EFED5A7FED5A7FED5A7FED5A7FDCC8EFDCC8EF8BB84EBB269B6853882
          6751000000000000000000000000EBA00AFFC404FFEE38FFFE99FFFBD8FFFEE4
          FEFEFCFEFEFCFEFEFCFEFEFCFFFFEFFFFBD8FFF9C7FFF568FFC404EBA00A0000
          000000000000000000007D3300A85800FFC404FFEE38FFF568FFF9C7FFFFEFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFEFFFF9C7FFF568FFC404EBA00A000000000000
          000000FF00FF000000826751B68538EBB269F8BB84FDCC8EFDCC8EFED5A7FED5
          A7FED5A7FED5A7FDCC8EFDCC8EF8BB84EBB269B6853882675100000000000000
          0000000000EBA00AFFC404FFF568FFF9C7983B07983B07FFDE04FFFFFFFFFFFF
          FFDE04983B07983B07FFF9C7FFF568FFC404EBA00A0000000000000000000000
          007D3300A85800FFC404FFEE38A85800A85800FFDE04FFFFFFFFFFFFFFEE38A8
          5800A85800FFF9C7FFF568FFC404EBA00A0000000000000000000000007A5636
          B68538E8AC56EBB269F8BB84FDCC8EFDCC8EFDCC8EFDCC8EFDCC8EFDCC8EF8BB
          84EBB269E8AC56B685387A5636000000000000000000000000A85800FFC404FF
          EE38FFF568FFFE99FFF9C7FFFBD8FFFBD8FFFBD8FFFBD8FFF9C7FFFE99FFF568
          FFEE38FFC404A85800000000000000000000000000410200BA7002FFC404FFDE
          04FFEE38FFF568FFFE99FFFE99FFFE99FFFE99FFFE99FFFE99FFF568FFEE38FF
          C404A85800000000000000000000FF00FF0000007A5636B68538E8AC56EBB269
          F8BB84FDCC8EFDCC8EFDCC8EFDCC8EFDCC8EFDCC8EF8BB84EBB269E8AC56B685
          387A5636000000000000000000000000A85800FFC404FFEE38FFF568FFFE99FF
          F9C7FFFBD8FFFBD8FFFBD8FFFBD8FFF9C7FFFE99FFF568FFEE38FFC404A85800
          000000000000000000000000410200BA7002FFC404FFDE04FFEE38FFFE99FFF9
          C7FFFBD8FFFEE4FFFEE4FFFEE4FFF9C7FFF568FFEE38FFC404A8580000000000
          0000000000FF00FF0000007A5636B68538E8AC56EBB269F8BB84FDCC8EFDCC8E
          FDCC8EFDCC8EFDCC8EFDCC8EF8BB84EBB269E8AC56B685387A56360000000000
          00000000000000A85800FFC404FFEE38FFF568FFFE99FFF9C7FFFBD8FFDE04A8
          5800FFFBD8FFFBD8FFF9C7FFF568FFEE38FFC404A85800000000000000000000
          000000621B00BA7002FFC404FFDE04FFEE38FFFE99FFF9C7BA7002FFC404FFFF
          EFFFFEE4FFF9C7FFFE99FFEE38FFC404A85800000000000000000000FF00FF00
          00007A5636B68538E8AC56EBB269F8BB84FDCC8EFDCC8EFDCC8EFDCC8EFDCC8E
          FDCC8EF8BB84EBB269E8AC56B685387A5636000000000000000000000000A858
          00FFC404FFEE38FFF568FFFE99FFF9C7FFFBD8BA7002BA7002FFFBD8FFF9C7FF
          F9C7FFF568FFEE38FFC404A85800000000000000000000000000621B00BA7002
          FFC404FFDE04FFEE38FFFE99FFF9C7BA7002BA7002FFFFEFFFFEE4FFF9C7FFFE
          99FFEE38FFC404A85800000000000000000000FF00FF0000007A5636B68538E8
          AC56EBB269F8BB84FDCC8EFDCC8EFDCC8EFDCC8EFDCC8EFDCC8EF8BB84EBB269
          E8AC56B685387A5636000000000000000000000000A85800FFC404FFEE38FFF5
          68FFF9C7983B07983B07FFC404FFC404983B07983B07FFF9C7FFF568FFEE38FF
          C404A85800000000000000000000000000621B00BA7002FFC404FFDE04FFEE38
          A85800A85800FFC404FFC404A85800A85800FFF9C7FFFE99FFEE38FFC404A858
          00000000000000000000000000875816B68538C49449E8AC56EBB269F8BB84F8
          BB84F8BB84F8BB84F8BB84F8BB84EBB269E8AC56C49449B68538875816000000
          0000000000000000007D3300FFC404FFDE04FFEE38FFF568FFFE99FFFE99FFFE
          99FFFE99FFFE99FFFE99FFF568FFEE38FFDE04FFC4047D330000000000000000
          0000000000290000A85800EBA00AFFC404FFDE04FFDE04FFEE38FFEE38FFEE38
          FFEE38FFEE38FFEE38FFDE04FFDE04FFC4047D3300000000000000000000FF00
          FF000000875816B68538C49449E8AC56EBB269F8BB84F8BB84F8BB84F8BB84F8
          BB84F8BB84EBB269E8AC56C49449B68538875816000000000000000000000000
          7D3300FFC404FFDE04FFEE387D33007D33007D33007D33007D33007D3300983B
          077D3300FFEE38FFDE04FFC4047D3300000000000000000000000000290000A8
          5800EBA00AFFC404983B07983B07983B07983B07983B07983B07A85800983B07
          FFEE38FFDE04FFC4047D3300000000000000000000FF00FF000000875816B685
          38C49449E8AC56EBB269F8BB84F8BB84F8BB84F8BB84F8BB84F8BB84EBB269E8
          AC56C49449B685388758160000000000000000000000007D3300FFC404FFDE04
          FFEE38410200410200410200621B00621B00621B00410200410200FFEE38FFDE
          04FFC4047D3300000000000000000000000000410200BA7002EBA00AFFC40441
          0200621B00621B00621B00621B00621B00621B00410200FFEE38FFDE04FFC404
          7D3300000000000000000000FF00FF000000875816B68538C49449E8AC56EBB2
          69F8BB84F8BB84F8BB84F8BB84F8BB84F8BB84EBB269E8AC56C49449B6853887
          58160000000000000000000000007D3300FFC404FFDE04FFEE38FFF568FFFE99
          FFFE997D33007D33007D3300FFFE99FFF568FFEE38FFDE04FFC4047D33000000
          00000000000000000000410200BA7002EBA00AFFC404FFDE04FFEE38FFF5687D
          33007D3300983B07FFFE99FFF568FFEE38FFDE04FFC4047D3300000000000000
          000000FF00FF000000875816B68538C49449E8AC56EBB269F8BB84F8BB84F8BB
          84F8BB84F8BB84F8BB84EBB269E8AC56C49449B6853887581600000000000000
          00000000007D3300FFC404FFDE04FFEE38FFF568FFFE997D33007D33007D3300
          7D3300FFFE99FFF568FFEE38FFDE04FFC404983B070000000000000000000000
          00410200BA7002EBA00AFFC404FFDE04FFEE387D3300983B07983B077D3300FF
          FE99FFF568FFEE38FFDE04FFC4047D33000000000000000000000000006A4003
          B68538B68538C49449E8AC56EBB269EBB269EBB269EBB269EBB269EBB269E8AC
          56C49449B68538B685386A4003000000000000000000000000410200FFC404FF
          C404FFDE04FFDE04FFEE38FFEE38FFEE38FFEE38FFEE38FFEE38FFDE04FFDE04
          FFC404FFC4044102000000000000000000000000000D0101A85800BA7002EBA0
          0AFFC404FFDE04FFDE04FFDE04FFDE04FFDE04FFDE04FFDE04FFDE04FFC404FF
          C404410200000000000000000000FF00FF0000006A4003B68538B68538C49449
          E8AC56EBB269EBB269EBB269EBB269EBB269EBB269E8AC56C49449B68538B685
          386A4003000000000000000000000000410200FFC404FFC404FFDE047D33007D
          33007D33007D33007D33007D33007D33007D3300FFDE04FFC404FFC404410200
          0000000000000000000000000D0101A85800BA7002EBA00A983B07983B07983B
          07983B07983B07983B07983B07983B07FFDE04FFC404FFC40441020000000000
          0000000000FF00FF0000006A4003B68538B68538C49449E8AC56EBB269EBB269
          EBB269EBB269EBB269EBB269E8AC56C49449B68538B685386A40030000000000
          00000000000000410200FFC404FFC404FFDE0419030319030329000041020041
          0200410200290000190303FFDE04FFC404FFC404410200000000000000000000
          0000000D0101A85800BA7002EBA00A2900004102004102004102004102004102
          00410200290000FFDE04FFC404FFC404410200000000000000000000FF00FF00
          00006A4003B68538B68538C49449E8AC56EBB269EBB269EBB269EBB269EBB269
          EBB269E8AC56C49449B68538B685386A40030000000000000000000000004102
          00FFC404FFC404FFDE04FFDE04FFEE38FFEE38FFEE38FFEE38410200410200FF
          DE04FFDE04FFC404FFC4044102000000000000000000000000000D0101A85800
          BA7002EBA00AFFC404FFDE04FFDE04FFDE04FFEE38410200410200FFDE04FFDE
          04FFC404FFC404410200000000000000000000FF00FF0000006A4003B68538B6
          8538C49449E8AC56EBB269EBB269EBB269EBB269EBB269EBB269E8AC56C49449
          B68538B685386A4003000000000000000000000000410200FFC404FFC404FFDE
          04FFDE04FFEE38621B00621B00621B00621B00FFEE38FFDE04FFDE04FFC404FF
          C404621B00000000000000000000000000190303A85800BA7002EBA00AFFC404
          FFDE04621B00621B00621B00621B00FFEE38FFDE04FFDE04FFC404FFC4044102
          000000000000000000000000005C471DA87636A16D28B68538C49449C49449C4
          9449C49449C49449C49449C49449C49449B68538A16D28A876365C471D000000
          000000000000000000621B00EBA00AEBA00AFFC404FFDE04FFDE04FFDE04FFDE
          04FFDE04FFDE04FFDE04FFDE04FFC404EBA00AEBA00A621B0000000000000000
          00000000001903037D33007D3300A85800D18804FFC404FFC404FFC404FFC404
          FFC404FFC404FFC404FFC404D18804D18804410200000000000000000000FF00
          FF0000005C471DA87636A16D28B68538C49449C49449C49449C49449C49449C4
          9449C49449C49449B68538A16D28A876365C471D000000000000000000000000
          621B00EBA00AEBA00AFFC404FFC404FFDE04FFDE04FFDE04FFDE04FFDE04FFDE
          04FFC404FFC404EBA00AEBA00A621B000000000000000000000000001903037D
          33007D3300A85800D18804FFC404FFC404FFC404FFC404FFC404FFC404FFC404
          FFC404D18804D18804410200000000000000000000FF00FF0000005C471DA876
          36A16D28B68538C49449C49449C49449C49449C49449C49449C49449C49449B6
          8538A16D28A876365C471D000000000000000000000000621B00EBA00AEBA00A
          FFC404FFC404FFDE04FFDE04983B07190303FFDE04FFDE04FFDE04FFC404EBA0
          0AEBA00A621B000000000000000000000000001903037D33007D3300BA7002EB
          A00AFFC404FFC4042900007D3300FFC404FFC404FFC404FFC404D18804D18804
          410200000000000000000000FF00FF0000005C471DA87636A16D28B68538C494
          49C49449C49449C49449C49449C49449C49449C49449B68538A16D28A876365C
          471D000000000000000000000000621B00EBA00AEBA00AFFC404FFC404290000
          410200FFDE04FFDE04290000290000FFC404FFC404EBA00AEBA00A621B000000
          000000000000000000001903037D33007D3300BA7002EBA00A190303290000FF
          C404FFC404290000290000FFC404FFC404D18804D18804410200000000000000
          000000FF00FF0000005C471DA87636A16D28B68538C49449C49449C49449C494
          49C49449C49449C49449C49449B68538A16D28A876365C471D00000000000000
          0000000000621B00FFC404EBA00AFFC404FFC4042900004102007D33007D3300
          410200290000FFDE04FFC404EBA00AFFC404621B000000000000000000000000
          001903037D33007D3300BA7002EBA00A4102004102007D33007D330041020041
          0200FFC404FFC404D18804D18804410200000000000000000000000000595959
          8B6832A87636B68538C49449C49449C49449C49449C49449C49449C49449C494
          49B68538A876368B6832595959000000000000000000000000A85800BA7002FF
          C404FFC404FFC404FFDE04FFDE04FFDE04FFDE04FFDE04FFDE04FFC404FFC404
          FFC404BA7002A85800000000000000000000000000410200621B007D3300983B
          07D18804EBA00AEBA00AFFC404FFC404FFC404FFC404FFC404D18804D1880498
          3B077D3300000000000000000000FF00FF0000005959598B6832A87636B68538
          C49449C49449C49449C49449C49449C49449C49449C49449B68538A876368B68
          32595959000000000000000000000000A85800BA7002FFC404FFC404FFC404FF
          DE04FFDE04FFDE04FFDE04FFDE04FFDE04FFC404FFC404FFC404BA7002A85800
          000000000000000000000000410200621B007D3300983B07D18804EBA00AEBA0
          0AFFC404FFC404FFC404FFC404FFC404D18804D18804983B077D330000000000
          0000000000FF00FF0000005959598B6832A87636B68538C49449C49449C49449
          C49449C49449C49449C49449C49449B68538A876368B68325959590000000000
          00000000000000BA7002BA7002FFC404FFC404FFC404FFDE04FFDE047D330001
          0101FFDE04FFDE04FFC404FFC404FFC404BA7002BA7002000000000000000000
          000000621B00621B00983B07A85800D18804EBA00AEBA00A190303621B00FFC4
          04FFC404FFC404EBA00AD18804983B077D3300000000000000000000FF00FF00
          00005959598B6832A87636B68538C49449C49449C49449C49449C49449C49449
          C49449C49449B68538A876368B6832595959000000000000000000000000A858
          00BA7002FFC404FFC404FFC404290000290000290000290000290000290000FF
          C404FFC404FFC404BA7002A85800000000000000000000000000621B00621B00
          983B07983B07D188040D0101190303190303190303290000290000FFC404EBA0
          0AD18804983B077D3300000000000000000000FF00FF0000005959598B6832A8
          7636B68538C49449C49449C49449C49449C49449C49449C49449C49449B68538
          A876368B6832595959000000000000000000000000BA7002BA7002FFC404FFC4
          04190303290000983B07FFDE04FFDE04983B07290000190303FFC404FFC404BA
          7002BA7002000000000000000000000000621B00621B00983B07A85800190303
          290000A85800FFC404FFC404A85800290000190303EBA00AD18804983B077D33
          00000000000000000000000000000000563A2595735CBC9D79CFB894DBC29DDB
          C29DDBC29DDBC29DDBC29DDBC29DD1BE9CBC9D7995735C563A25000000000000
          000000000000000000000000410200FFC404FFDE04FFFE99FFFE99FFFE99FFFE
          99FFFE99FFFE99FFFE99FFFE99FFDE04FFC40441020000000000000000000000
          00000000000000000D0101983B07EBA00AFFC404FFC404FFDE04FFDE04FFDE04
          FFDE04FFDE04FFDE04FFC404BA7002290000000000000000000000000000FF00
          FF000000000000563A2595735CBC9D79CFB894DBC29DDBC29DDBC29DDBC29DDB
          C29DDBC29DD1BE9CBC9D7995735C563A25000000000000000000000000000000
          000000410200FFC404FFDE04FFFE99FFFE99FFFE99FFFE99FFFE99FFFE99FFFE
          99FFFE99FFDE04FFC4044102000000000000000000000000000000000000000D
          0101983B07EBA00AFFC404FFC404FFDE04FFDE04FFDE04FFDE04FFDE04FFDE04
          FFC404BA7002290000000000000000000000000000FF00FF000000000000563A
          2595735CBC9D79CFB894DBC29DDBC29DDBC29DDBC29DDBC29DDBC29DD1BE9CBC
          9D7995735C563A25000000000000000000000000000000000000410200FFC404
          FFDE04FFFE99FFFE99FFFE99FFDE04A85800FFFE99FFFE99FFFE99FFDE04FFC4
          044102000000000000000000000000000000000000000D0101983B07EBA00AFF
          C404FFC404FFDE04A85800FFC404FFDE04FFDE04FFDE04FFC404BA7002290000
          000000000000000000000000FF00FF000000000000563A2595735CBC9D79CFB8
          94DBC29DDBC29DDBC29DDBC29DDBC29DDBC29DD1BE9CBC9D7995735C563A2500
          0000000000000000000000000000000000410200FFC404FFDE04FFFE99FFFE99
          D18804D18804D18804D18804FFFE99FFFE99FFDE04FFC4044102000000000000
          000000000000000000000000000D0101983B07EBA00AFFC404FFC4047D33007D
          3300983B07983B07FFDE04FFDE04FFC404BA7002290000000000000000000000
          000000FF00FF000000000000563A2595735CBC9D79CFB894DBC29DDBC29DDBC2
          9DDBC29DDBC29DDBC29DD1BE9CBC9D7995735C563A2500000000000000000000
          0000000000000000410200FFC404FFDE04BA7002FFDE04FFFE99FFFE99FFFE99
          FFFE99FFDE04BA7002FFDE04FFC4044102000000000000000000000000000000
          00000000190303983B07EBA00ABA7002FFDE04FFDE04FFDE04FFDE04FFDE04FF
          DE04BA7002FFC404D18804290000000000000000000000000000000000000000
          000000595041B6A38FDBD4CAF2EDE5F2EDE5F2EDE5F2EDE5F2EDE5F2EDE5DBD4
          CAB6A38F59504100000000000000000000000000000000000000000000000098
          3B07FFEE38FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEE38
          983B07000000000000000000000000000000000000000000000000410200EBA0
          0AFFDE04FFDE04FFEE38FFEE38FFEE38FFF568FFF568FFDE04FFC40441020000
          0000000000000000000000000000FF00FF000000000000000000595041B6A38F
          DBD4CAF2EDE5F2EDE5F2EDE5F2EDE5F2EDE5F2EDE5DBD4CAB6A38F5950410000
          00000000000000000000000000000000000000000000983B07FFEE38FFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEE38983B07000000000000
          000000000000000000000000000000000000410200EBA00AFFDE04FFDE04FFEE
          38FFEE38FFEE38FFF568FFF568FFDE04FFC40441020000000000000000000000
          0000000000FF00FF000000000000000000595041B6A38FDBD4CAF2EDE5F2EDE5
          F2EDE5F2EDE5F2EDE5F2EDE5DBD4CAB6A38F5950410000000000000000000000
          00000000000000000000000000983B07FFEE38FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFEE38983B07000000000000000000000000000000
          000000000000000000410200EBA00AFFDE04FFEE38FFEE38FFEE38FFF568FFF5
          68FFF568FFDE04FFC404410200000000000000000000000000000000FF00FF00
          0000000000000000595041B6A38FDBD4CAF2EDE5F2EDE5F2EDE5F2EDE5F2EDE5
          F2EDE5DBD4CAB6A38F5950410000000000000000000000000000000000000000
          00000000983B07FFEE38FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFEE38983B07000000000000000000000000000000000000000000000000
          410200EBA00AFFDE04FFDE04FFEE38FFEE38FFEE38FFF568FFF568FFDE04FFC4
          04410200000000000000000000000000000000FF00FF00000000000000000059
          5041B6A38FDBD4CAF2EDE5F2EDE5F2EDE5F2EDE5F2EDE5F2EDE5DBD4CAB6A38F
          595041000000000000000000000000000000000000000000000000983B07FFEE
          38FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEE38983B0700
          0000000000000000000000000000000000000000000000410200EBA00AFFDE04
          FFEE38FFEE38FFEE38FFF568FFF568FFF568FFDE04FFC4044102000000000000
          00000000000000000000000000000000000000000000443D399D9388CBC2B7DB
          D4CADBD4CADBD4CADBD4CACBC2B79D9388443D39000000000000000000000000
          000000000000000000000000000000000000621B00FFDE04FFF9C7FFFFFFFFFF
          FFFFFFFFFFFFFFFFF9C7FFDE04621B0000000000000000000000000000000000
          0000000000000000000000000000190303D18804FFC404FFDE04FFDE04FFDE04
          FFDE04FFC404EBA00A290000000000000000000000000000000000000000FF00
          FF000000000000000000000000443D399D9388CBC2B7DBD4CADBD4CADBD4CADB
          D4CACBC2B79D9388443D39000000000000000000000000000000000000000000
          000000000000000000621B00FFDE04FFF9C7FFFFFFFFFFFFFFFFFFFFFFFFFFF9
          C7FFDE04621B0000000000000000000000000000000000000000000000000000
          0000000000190303D18804FFC404FFDE04FFDE04FFDE04FFDE04FFC404EBA00A
          290000000000000000000000000000000000000000FF00FF0000000000000000
          00000000443D399D9388CBC2B7DBD4CADBD4CADBD4CADBD4CACBC2B79D938844
          3D39000000000000000000000000000000000000000000000000000000000000
          621B00FFDE04FFF9C7FFFFFFFFFFFFFFFFFFFFFFFFFFF9C7FFDE04621B000000
          00000000000000000000000000000000000000000000000000000000190303D1
          8804FFC404FFDE04FFDE04FFDE04FFDE04FFC404EBA00A290000000000000000
          000000000000000000000000FF00FF000000000000000000000000443D399D93
          88CBC2B7DBD4CADBD4CADBD4CADBD4CACBC2B79D9388443D3900000000000000
          0000000000000000000000000000000000000000000000621B00FFDE04FFF9C7
          FFFFFFFFFFFFFFFFFFFFFFFFFFF9C7FFDE04621B000000000000000000000000
          00000000000000000000000000000000000000190303D18804FFC404FFDE04FF
          DE04FFDE04FFDE04FFC404EBA00A290000000000000000000000000000000000
          000000FF00FF000000000000000000000000443D399D9388CBC2B7DBD4CADBD4
          CADBD4CADBD4CACBC2B79D9388443D3900000000000000000000000000000000
          0000000000000000000000000000621B00FFDE04FFF9C7FFFFFFFFFFFFFFFFFF
          FFFFFFFFF9C7FFDE04621B000000000000000000000000000000000000000000
          00000000000000000000290000D18804FFC404FFDE04FFDE04FFDE04FFDE04FF
          C404EBA00A290000000000000000000000000000000000000000000000000000
          0000000000000000005959592626260B0B0B0B0B0B0B0B0B0B0B0B2626265959
          5900000000000000000000000000000000000000000000000000000000000000
          0000000000BA70020D01010000000000000000000000000D0101BA7002000000
          0000000000000000000000000000000000000000000000000000000000000000
          00621B00000000000000000000000000000000000000621B0000000000000000
          0000000000000000000000000000FF00FF000000000000000000000000000000
          5959592626260B0B0B0B0B0B0B0B0B0B0B0B2626265959590000000000000000
          00000000000000000000000000000000000000000000000000000000BA70020D
          01010000000000000000000000000D0101BA7002000000000000000000000000
          000000000000000000000000000000000000000000000000621B000000000000
          00000000000000000000000000621B0000000000000000000000000000000000
          0000000000FF00FF0000000000000000000000000000005959592626260B0B0B
          0B0B0B0B0B0B0B0B0B2626265959590000000000000000000000000000000000
          00000000000000000000000000000000000000BA70020D010100000000000000
          00000000000D0101BA7002000000000000000000000000000000000000000000
          000000000000000000000000000000621B000000000000000000000000000000
          00000000621B00000000000000000000000000000000000000000000FF00FF00
          00000000000000000000000000005959592626260B0B0B0B0B0B0B0B0B0B0B0B
          2626265959590000000000000000000000000000000000000000000000000000
          00000000000000000000BA70020D01010000000000000000000000000D0101BA
          7002000000000000000000000000000000000000000000000000000000000000
          000000000000621B00000000000000000000000000000000000000621B000000
          00000000000000000000000000000000000000FF00FF00000000000000000000
          00000000005959592626260B0B0B0B0B0B0B0B0B0B0B0B262626595959000000
          0000000000000000000000000000000000000000000000000000000000000000
          00BA70020D01010000000000000000000000000D0101BA700200000000000000
          0000000000000000000000000000000000000000000000000000000000621B00
          000000000000000000000000000000000000621B000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000000000FF00
          FF00000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000FF00FF0000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000FF00FF0000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000FF00FF0000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000FF00FF000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000FF00FF000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000000000FF00FF00
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000FF00FF00000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000000000FF00
          FF00000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000FF00FF0000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000FF00FF0000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000FF00FF0000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000FFFFFFFFFFFF
          5959595959595959595959595959595959595959595959595959595959595959
          59595959595959595959595959595959595959FFFFFFFFFFFFFFFFFFFFFFFF35
          3535353535353535353535353535353535353535353535353535353535353535
          353535353535353535353535353535353535FFFFFFFFFFFFFFFFFFFFFFFF3535
          3535353535353535353535353535353535353535353535353535353535353535
          3535353535353535353535353535353535FFFFFFFFFFFFFFFFFFFFFFFF595959
          5959595959595959595959595959595959595959595959595959595959595959
          59595959595959595959595959595959FFFFFFFFFFFFFFFFFFFFFFFF3B3B3B3B
          3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B
          3B3B3B3B3B3B3B3B3B3B3B3B3B3B3BFFFFFFFFFFFFFFFFFFFFFFFF3535353535
          3535353535353535353535353535353535353535353535353535353535353535
          3535353535353535353535353535FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3B3B3B3B3B3B3B
          3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B
          3B3B3B3B3B3B3B3B3B3B3B3BFFFFFFFFFFFFFFFFFFFFFFFF3535353535353535
          3535353535353535353535353535353535353535353535353535353535353535
          3535353535353535353535FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3B3B3B
          3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B
          3B3B3B3BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3B3B3B3B3B3B3B3B3B3B
          3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B
          3B3B3B3B3B3B3B3B3BFFFFFFFFFFFF0B0B0B0B0B0B0F0F0F1919192121212626
          2629292929292929292929292929292929292929292929292929292929292929
          2929292929292929292929292929292929292929292929262626212121191919
          0F0F0F0F0F0F0F0F0FE5E5E59F9F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F
          9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F
          9F9F9FFF00FFFFFFFF000000000000000000000000000000000000FF00FFFF00
          FFFF00FFFF00FFFF00FFFFFFFF5B5B5B5B5B5B5B5B5B5B5B5B5E5E5E5E5E5E5E
          5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5B5B5B5B5B5B
          5B5B5B5B5B5BFFFFFFFFFFFF3535353535353535353838383A3A3A3A3A3A3A3A
          3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A38383835353535
          3535353535FFFFFFFFFFFF3838383838383838383A3A3A3B3B3B3B3B3B3B3B3B
          3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3A3A3A3838383838
          38383838FFFFFFFFFFFF5B5B5B5B5B5B5E5E5E62626262626262626262626262
          62626262626262626262626262626262626262626262626262625E5E5E5B5B5B
          5B5B5BFFFFFFFFFFFF3B3B3B4343436767677B7B7B9090909F9F9FA5A5A5A5A5
          A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A59F9F9F9090905656563B
          3B3BFFFFFFFFFFFF3838383838383B3B3B3E3E3E3E3E3E434343434343434343
          4343434343434343434343434343434343433E3E3E3E3E3E3B3B3B3838383838
          38FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFF3B3B3B4343436767677B7B7B9090909F9F9FA5A5A5A5A5A5A5A5
          A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A59F9F9F9090905656563B3B3BFF
          FFFFFFFFFF3838383838383B3B3B3E3E3E3E3E3E434343434343434343434343
          4343434343434343434343434343433E3E3E3E3E3E3B3B3B383838383838FFFF
          FFFFFFFFFFFFFF3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B
          3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3BFFFFFFFFFFFF
          FFFFFF3B3B3B3E3E3E4C4C4C5151515656565656565656565656565656565656
          565656565656565656565151514C4C4C4343433A3A3A3838383B3B3BFFFFFF0F
          0F0F0F0F0F2121213535354C4C4C5E5E5E656564656564656564656564656564
          6565646565646565646565646565646565646565646565646565646565646565
          646565646565645E5E5E4C4C4C3535352121210F0F0F0F0F0FE5E5E59F9F9FFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F
          9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9FFF00FF00000000000000000000
          0000000000000000FFFFFFFF00FFFF00FFFF00FFFF00FFFF00FF5959595B5B5B
          5B5B5B5E5E5E6262626767676767676767676767676767676767676767676767
          676767676767676767676262625E5E5E5B5B5B5B5B5B59595935353535353538
          38383A3A3A3E3E3E434343464646464646464646464646464646464646464646
          4646464646464343433E3E3E3A3A3A3838383535353535353535353838383A3A
          3A3E3E3E4343434646464646464C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C
          4C4C4646464646464343433E3E3E3A3A3A3838383535355959595B5B5B5E5E5E
          6565646E6E6E7474747474747B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B
          7B7474747474746E6E6E6565645E5E5E5B5B5B5959593B3B3B3E3E3E5E5E5E7B
          7B7B999999B2B2B2BDBDBDCACACACACACACACACACACACACACACACACACACACACA
          CACACACACACABDBDBDB2B2B29999995656563B3B3B3535353838383E3E3E4343
          434C4C4C5656565959595B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B59
          59595656564C4C4C4343433E3E3E383838353535FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3B3B3B3E3E3E5E5E5E7B7B7B99
          9999B2B2B2BDBDBDCACACACACACACACACACACACACACACACACACACACACACACACA
          CACACABDBDBDB2B2B29999995656563B3B3B3535353838383E3E3E4343434C4C
          4C5656565959595B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B59595956
          56564C4C4C4343433E3E3E383838353535FFFFFF3B3B3B3E3E3E4343434C4C4C
          4C4C4C5151515151515151515151515151515151515151514C4C4C4C4C4C4343
          433E3E3E3B3B3B3B3B3B3B3B3BFFFFFF3B3B3B4343435E5E5E67676774747474
          74747B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B747474747474676767
          5E5E5E4C4C4C3E3E3E3838383B3B3B0F0F0F1919193A3A3A6565649F9F9FC3C3
          C3D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1
          D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1C3C3C39F9F9F656564
          3A3A3A1919190F0F0FE5E5E59F9F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F9F9F9F9F9FFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF00FFFFFFFF000000000000000000000000000000000000FF00FFFF00
          FFFF00FFFF00FFFF00FF5959595B5B5B5E5E5E6565646E6E6E7474747474747B
          7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7474747474746E6E6E656564
          5E5E5E5B5B5B5959593535353535353A3A3A4343434C4C4C5151515656565959
          595959595959595959595959595959595959595656565151514C4C4C4343433A
          3A3A3535353535353535353838383E3E3E4343434C4C4C5656565959595B5B5B
          5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5959595656564C4C4C4343433E3E
          3E3838383535355959595E5E5E6565646E6E6E8484848A8A8A94949499999999
          99999999999999999999999999999999999494948A8A8A8484846E6E6E656564
          5E5E5E5959593B3B3B4C4C4C676767909090B2B2B2CACACADBDBDBE5E5E5E5E5
          E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5DBDBDBCACACAB2B2B290
          90903B3B3B3535353B3B3B4343435151516565647474747B7B7B848484848484
          8484848484848484848484848484847B7B7B7474746565645151514343433B3B
          3B353535FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFF3B3B3B4C4C4C676767909090B2B2B2CACACADBDBDBE5E5E5E5E5E5E5E5
          E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5DBDBDBCACACAB2B2B29090903B
          3B3B3535353B3B3B4343435151516565647474747B7B7B848484848484848484
          8484848484848484848484847B7B7B7474746565645151514343433B3B3B3535
          35FFFFFF3E3E3E4C4C4C5B5B5B6767677474747B7B7B7B7B7B7B7B7B7B7B7B7B
          7B7B7B7B7B7B7B7B7474746767675B5B5B4C4C4C3E3E3E3B3B3B3B3B3BFFFFFF
          3B3B3B6767677B7B7B9090909F9F9FA5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5
          A5A5A5A5A5A5A5A5A5A59F9F9F9090907B7B7B6767674C4C4C3A3A3A3B3B3B0F
          0F0F1919194343437B7B7BBDBDBDE9E9E9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFE9E9E9BDBDBD7B7B7B4343431919190F0F0FE5E5E59F9F9FFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          9F9F9F9F9F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FF00000000000000000000
          0000000000000000FFFFFFFF00FFFF00FFFF00FFFF00FFFF00FF5959595B5B5B
          6262626E6E6E7B7B7B8484848A8A8A9090909090909090909090909090909090
          909090908A8A8A8484847B7B7B6E6E6E6262625B5B5B5959593535353838383E
          3E3E4C4C4C5B5B5B6767676E6E6E747474747474747474747474747474747474
          7474746E6E6E6767675B5B5B4C4C4C3E3E3E3838383535353535353A3A3A4343
          434C4C4C5E5E5E67676774747474747474747474747474747474747474747474
          74747474746767675E5E5E4C4C4C4343433A3A3A3535355959596262626E6E6E
          848484999999ACACACBBBBBBC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
          C3BBBBBBACACAC9999998484846E6E6E6262625959593B3B3B5151517474749F
          9F9FBDBDBDDBDBDBEDEDEDF6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6
          F6F6F6F6F6F6EDEDEDDBDBDBBDBDBD9F9F9F3B3B3B3535353E3E3E4C4C4C6565
          648484849F9F9FACACACB2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2AC
          ACAC9F9F9F8484846565644C4C4C3E3E3E353535FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3B3B3B5151517474749F9F9FBD
          BDBDDBDBDBEDEDEDF6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6
          F6F6F6EDEDEDDBDBDBBDBDBD9F9F9F3B3B3B3535353E3E3E4C4C4C6565648484
          849F9F9FACACACB2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2ACACAC9F
          9F9F8484846565644C4C4C3E3E3E3535353E3E3E4C4C4C6262628484849F9F9F
          B2B2B2BBBBBBBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBBBBBBB2B2B29F9F9F8484
          846262624C4C4C3E3E3E3B3B3B3B3B3B3B3B3B7B7B7B999999B2B2B2BDBDBDCA
          CACACACACACACACACACACACACACACACACACACACACACACACACACABDBDBDB2B2B2
          9999997B7B7B5E5E5E4343433B3B3B0F0F0F1919194343437B7B7BBDBDBDE9E9
          E9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE9E9E9BDBDBD7B7B7B
          4343431919190F0F0FE5E5E59F9F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F9F9F9F9F9FFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF00FFFFFFFF000000000000000000000000000000000000FF00FFFF00
          FFFF00FFFF00FFFF00FF5959595E5E5E6767677474748484849090909999999F
          9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F999999909090848484747474
          6767675E5E5E5959593535353A3A3A4343435151516767677474748484848484
          8484848484848484848484848484848484848484848474747467676751515143
          43433A3A3A3535353535353B3B3B4646465656566767677B7B7B8484848A8A8A
          8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8484847B7B7B6767675656564646
          463B3B3B3535355959596262627474748A8A8AACACACCACACAD6D6D6E1E1E1E1
          E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1D6D6D6CACACAACACAC8A8A8A747474
          6262625959593B3B3B565656747474A5A5A5CACACAE5E5E5F6F6F6FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F6F6E5E5E5CACACAA5
          A5A53B3B3B3535353E3E3E5656567474749F9F9FBBBBBBD1D1D1DBDBDBDBDBDB
          DBDBDBDBDBDBDBDBDBDBDBDBDBDBDBD1D1D1BBBBBB9F9F9F7474745656563E3E
          3E353535FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFF3B3B3B565656747474A5A5A5CACACAE5E5E5F6F6F6FFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F6F6E5E5E5CACACAA5A5A53B
          3B3B3535353E3E3E5656567474749F9F9FBBBBBBD1D1D1DBDBDBDBDBDBDBDBDB
          DBDBDBDBDBDBDBDBDBDBDBDBD1D1D1BBBBBB9F9F9F7474745656563E3E3E3535
          354343435B5B5B848484B2B2B2D1D1D1E5E5E5E9E9E9E9E9E9E9E9E9E9E9E9E9
          E9E9E9E9E9E9E9E9E5E5E5D1D1D1B2B2B28484845B5B5B4343433B3B3B3B3B3B
          3B3B3B909090B2B2B2CACACADBDBDBE5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5
          E5E5E5E5E5E5E5E5E5E5DBDBDBCACACAB2B2B29090906767674C4C4C3B3B3B0F
          0F0F1919194343437B7B7BBDBDBDE9E9E9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFE9E9E9BDBDBD7B7B7B4343431919190F0F0FE5E5E59F9F9FFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          9F9F9F9F9F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FF00000000000000000000
          0000000000000000FFFFFFFF00FFFF00FFFF00FFFF00FFFF00FF5959595E5E5E
          6767677474748A8A8A999999A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5
          A5A5A5A5A5A5A59999998A8A8A7474746767675E5E5E5959593535353A3A3A46
          46465656566E6E6E848484909090949494949494949494949494949494949494
          9494949090908484846E6E6E5656564646463A3A3A3535353535353B3B3B4646
          4659595974747484848490909094949494949494949494949494949494949494
          94949090908484847474745959594646463B3B3B353535595959626262747474
          949494BBBBBBD6D6D6EDEDEDF6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6
          F6EDEDEDD6D6D6BBBBBB9494947474746262625959593B3B3B5656567B7B7BA5
          A5A5CACACAE5E5E5F6F6F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFF6F6F6E5E5E5CACACAA5A5A53B3B3B3535354343435959597B7B
          7BACACACD1D1D1E9E9E9F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3E9
          E9E9D1D1D1ACACAC7B7B7B595959434343353535FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3B3B3B5656567B7B7BA5A5A5CA
          CACAE5E5E5F6F6F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFF6F6F6E5E5E5CACACAA5A5A53B3B3B3535354343435959597B7B7BACAC
          ACD1D1D1E9E9E9F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3E9E9E9D1
          D1D1ACACAC7B7B7B5959594343433535354C4C4C6767679F9F9FD1D1D1F1F1F1
          FDFDFDFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFDFDFDF1F1F1D1D1
          D19F9F9F6767674C4C4C3B3B3B3B3B3B3B3B3B9F9F9FBDBDBDDBDBDBEDEDEDF6
          F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6EDEDEDDBDBDB
          BDBDBD9F9F9F7474745151513B3B3B0F0F0F1919194343437B7B7BBDBDBDE9E9
          E9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE9E9E9BDBDBD7B7B7B
          4343431919190F0F0FE5E5E59F9F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F9F9F9F9F9FFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF00FFFFFFFF000000000000000000000000000000000000FF00FFFF00
          FFFF00FFFF00FFFF00FF5959595E5E5E6767677B7B7B9090909F9F9FA5A5A5AC
          ACACACACACACACACACACACACACACACACACACACACA5A5A59F9F9F9090907B7B7B
          6767675E5E5E5959593535353A3A3A4646465959597474748484849494949999
          9999999999999999999999999999999999999994949484848474747459595946
          46463A3A3A3535353535353B3B3B4C4C4C5B5B5B7474748A8A8A949494999999
          9999999999999999999999999999999999999494948A8A8A7474745B5B5B4C4C
          4C3B3B3B3535355959596262627B7B7B999999C3C3C3E1E1E1F6F6F6FFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F6F6E1E1E1C3C3C39999997B7B7B
          6262625959593B3B3B5656567B7B7BA5A5A5CACACAE5E5E5F6F6F6FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F6F6E5E5E5CACACAA5
          A5A53B3B3B3535354343435B5B5B848484B2B2B2DBDBDBF3F3F3FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3F3F3DBDBDBB2B2B28484845B5B5B4343
          43353535FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFF3B3B3B5656567B7B7BA5A5A5CACACAE5E5E5F6F6F6FFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F6F6E5E5E5CACACAA5A5A53B
          3B3B3535354343435B5B5B848484B2B2B2DBDBDBF3F3F3FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFF3F3F3DBDBDBB2B2B28484845B5B5B4343433535
          354C4C4C747474B2B2B2E5E5E5FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFDFDFDE5E5E5B2B2B27474744C4C4C3B3B3B3B3B3B
          3B3B3BA5A5A5CACACAE5E5E5F6F6F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFF6F6F6E5E5E5CACACAA5A5A57474745656563B3B3B0F
          0F0F1919194343437B7B7BBDBDBDE9E9E9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFE9E9E9BDBDBD7B7B7B4343431919190F0F0FE5E5E59F9F9FFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          9F9F9F9F9F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FF00000000000000000000
          0000000000000000FFFFFFFF00FFFF00FFFF00FFFF00FFFF00FF5959595E5E5E
          6767677B7B7B9090909F9F9FA5A5A5ACACACACACACACACACACACACACACACACAC
          ACACACACA5A5A59F9F9F9090907B7B7B6767675E5E5E5959593535353A3A3A46
          4646595959747474848484949494999999999999999999999999999999999999
          9999999494948484847474745959594646463A3A3A3535353535353B3B3B4C4C
          4C5B5B5B7474748A8A8A94949499999999999999999999999999999999999999
          99999494948A8A8A7474745B5B5B4C4C4C3B3B3B3535355959596262627B7B7B
          999999C3C3C3E1E1E1F6F6F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFF6F6F6E1E1E1C3C3C39999997B7B7B6262625959593B3B3B5656567B7B7BA5
          A5A5CACACAE5E5E5F6F6F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFF6F6F6E5E5E5CACACAA5A5A53B3B3B3535354343435B5B5B8484
          84B2B2B2DBDBDBF3F3F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3
          F3F3DBDBDBB2B2B28484845B5B5B434343353535FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3B3B3B5656567B7B7BA5A5A5CA
          CACAE5E5E5F6F6F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFF6F6F6E5E5E5CACACAA5A5A53B3B3B3535354343435B5B5B848484B2B2
          B2DBDBDBF3F3F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3F3F3DB
          DBDBB2B2B28484845B5B5B4343433535355151517B7B7BBBBBBBE9E9E9FEFEFE
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEE9E9
          E9BBBBBB7B7B7B5151513B3B3B3B3B3B3B3B3BA5A5A5CACACAE5E5E5F6F6F6FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F6F6E5E5E5
          CACACAA5A5A57B7B7B5656563B3B3B0F0F0F1919194343437B7B7BBDBDBDE9E9
          E9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE9E9E9BDBDBD7B7B7B
          4343431919190F0F0FE5E5E59F9F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F9F9F9F9F9FFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF00FFFFFFFFF8BB84F8BB84F8BB84F8BB84F8BB84F8BB84FF00FFFF00
          FFFF00FFFF00FFFF00FF5959595E5E5E6767677B7B7B9090909F9F9FA5A5A5AC
          ACACACACACACACACACACACACACACACACACACACACA5A5A59F9F9F9090907B7B7B
          6767675E5E5E5959593535353A3A3A4646465959597474748484849494949999
          9999999999999999999999999999999999999994949484848474747459595946
          46463A3A3A3535353535353B3B3B4C4C4C5B5B5B7474748A8A8A949494999999
          9999999999999999999999999999999999999494948A8A8A7474745B5B5B4C4C
          4C3B3B3B3535355959596262627B7B7B999999C3C3C3E1E1E1F6F6F6FFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F6F6E1E1E1C3C3C39999997B7B7B
          6262625959593B3B3B5656567B7B7BA5A5A5CACACAE5E5E5F6F6F6FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F6F6E5E5E5CACACAA5
          A5A53B3B3B3535354343435B5B5B848484B2B2B2DBDBDBF3F3F3FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3F3F3DBDBDBB2B2B28484845B5B5B4343
          43353535FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFF3B3B3B5656567B7B7BA5A5A5CACACAE5E5E5F6F6F6FFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F6F6E5E5E5CACACAA5A5A53B
          3B3B3535354343435B5B5B848484B2B2B2DBDBDBF3F3F3FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFF3F3F3DBDBDBB2B2B28484845B5B5B4343433535
          355151517B7B7BBDBDBDE9E9E9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFE9E9E9BDBDBD7B7B7B5151513B3B3B3B3B3B
          3B3B3BA5A5A5CACACAE5E5E5F6F6F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFF6F6F6E5E5E5CACACAA5A5A57B7B7B5656563B3B3B0F
          0F0F1919194343437B7B7BBDBDBDE9E9E9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFE9E9E9BDBDBD7B7B7B4343431919190F0F0FE5E5E59F9F9FFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          9F9F9F9F9F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFEF4EEFEF4EEFEF4EEFE
          F4EEFEF4EEFEF4EEFFFFFFFF00FFFF00FFFF00FFFF00FFFF00FF5959595E5E5E
          6767677B7B7B9090909F9F9FA5A5A5ACACACACACACACACACACACACACACACACAC
          ACACACACA5A5A59F9F9F9090907B7B7B6767675E5E5E5959593535353A3A3A46
          4646595959747474848484949494999999999999999999999999999999999999
          9999999494948484847474745959594646463A3A3A3535353535353B3B3B4C4C
          4C5B5B5B7474748A8A8A94949499999999999999999999999999999999999999
          99999494948A8A8A7474745B5B5B4C4C4C3B3B3B3535355959596262627B7B7B
          999999C3C3C3E1E1E1F6F6F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFF6F6F6E1E1E1C3C3C39999997B7B7B6262625959593B3B3B5656567B7B7BA5
          A5A5CACACAE5E5E5F6F6F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFF6F6F6E5E5E5CACACAA5A5A53B3B3B3535354343435B5B5B8484
          84B2B2B2DBDBDBF3F3F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3
          F3F3DBDBDBB2B2B28484845B5B5B434343353535FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3B3B3B5656567B7B7BA5A5A5CA
          CACAE5E5E5F6F6F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFF6F6F6E5E5E5CACACAA5A5A53B3B3B3535354343435B5B5B848484B2B2
          B2DBDBDBF3F3F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3F3F3DB
          DBDBB2B2B28484845B5B5B4343433535355151517B7B7BBDBDBDE9E9E9FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE9E9
          E9BDBDBD7B7B7B5151513B3B3B3B3B3B3B3B3BA5A5A5CACACAE5E5E5F6F6F6FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F6F6E5E5E5
          CACACAA5A5A57B7B7B5656563B3B3B0F0F0F1919194343437B7B7BBDBDBDE9E9
          E9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE9E9E9BDBDBD7B7B7B
          4343431919190F0F0FE5E5E59F9F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F9F9F9F9F9FFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF00FFFFFFFFF8BB84F8BB84F8BB84F8BB84F8BB84F8BB84FF00FFFF00
          FFFF00FFFF00FFFF00FF5959595E5E5E6767677B7B7B9090909F9F9FA5A5A5AC
          ACACACACACACACACACACACACACACACACACACACACA5A5A59F9F9F9090907B7B7B
          6767675E5E5E5959593535353A3A3A4646465959597474748484849494949999
          9999999999999999999999999999999999999994949484848474747459595946
          46463A3A3A3535353535353B3B3B4C4C4C5B5B5B7474748A8A8A949494999999
          9999999999999999999999999999999999999494948A8A8A7474745B5B5B4C4C
          4C3B3B3B3535355959596262627B7B7B999999C3C3C3E1E1E1F6F6F6FFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F6F6E1E1E1C3C3C39999997B7B7B
          6262625959593B3B3B5656567B7B7BA5A5A5CACACAE5E5E5F6F6F6FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F6F6E5E5E5CACACAA5
          A5A53B3B3B3535354343435B5B5B848484B2B2B2DBDBDBF3F3F3FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3F3F3DBDBDBB2B2B28484845B5B5B4343
          43353535FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFF3B3B3B5656567B7B7BA5A5A5CACACAE5E5E5F6F6F6FFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F6F6E5E5E5CACACAA5A5A53B
          3B3B3535354343435B5B5B848484B2B2B2DBDBDBF3F3F3FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFF3F3F3DBDBDBB2B2B28484845B5B5B4343433535
          355151517B7B7BBDBDBDE9E9E9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFE9E9E9BDBDBD7B7B7B5151513B3B3B3B3B3B
          3B3B3BA5A5A5CACACAE5E5E5F6F6F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFF6F6F6E5E5E5CACACAA5A5A57B7B7B5656563B3B3B0F
          0F0F1919194343437B7B7BBDBDBDE9E9E9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFE9E9E9BDBDBD7B7B7B4343431919190F0F0FE5E5E59F9F9FFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          9F9F9F9F9F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFEF4EEFEF4EEFEF4EEFE
          F4EEFEF4EEFEF4EEFFFFFFFF00FFFF00FFFF00FFFF00FFFF00FF5959595E5E5E
          6767677B7B7B9090909F9F9FA5A5A5ACACACACACACACACACACACACACACACACAC
          ACACACACA5A5A59F9F9F9090907B7B7B6767675E5E5E5959593535353A3A3A46
          4646595959747474848484949494999999999999999999999999999999999999
          9999999494948484847474745959594646463A3A3A3535353535353B3B3B4C4C
          4C5B5B5B7474748A8A8A94949499999999999999999999999999999999999999
          99999494948A8A8A7474745B5B5B4C4C4C3B3B3B3535355959596262627B7B7B
          999999C3C3C3E1E1E1F6F6F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFF6F6F6E1E1E1C3C3C39999997B7B7B6262625959593B3B3B5656567B7B7BA5
          A5A5CACACAE5E5E5F6F6F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFF6F6F6E5E5E5CACACAA5A5A53B3B3B3535354343435B5B5B8484
          84B2B2B2DBDBDBF3F3F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3
          F3F3DBDBDBB2B2B28484845B5B5B434343353535FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3B3B3B5656567B7B7BA5A5A5CA
          CACAE5E5E5F6F6F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFF6F6F6E5E5E5CACACAA5A5A53B3B3B3535354343435B5B5B848484B2B2
          B2DBDBDBF3F3F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3F3F3DB
          DBDBB2B2B28484845B5B5B4343433535355151517B7B7BBDBDBDE9E9E9FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE9E9
          E9BDBDBD7B7B7B5151513B3B3B3B3B3B3B3B3BA5A5A5CACACAE5E5E5F6F6F6FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F6F6E5E5E5
          CACACAA5A5A57B7B7B5656563B3B3B0F0F0F1919194343437B7B7BBDBDBDE9E9
          E9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE9E9E9BDBDBD7B7B7B
          4343431919190F0F0FE5E5E59F9F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F9F9F9F9F9FFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF00FFFFFFFFF8BB84F8BB84F8BB84F8BB84F8BB84F8BB84FF00FFFF00
          FFFF00FFFF00FFFF00FF5959595E5E5E6767677B7B7B9090909F9F9FA5A5A5AC
          ACACACACACACACACACACACACACACACACACACACACA5A5A59F9F9F9090907B7B7B
          6767675E5E5E5959593535353A3A3A4646465959597474748484849494949999
          9999999999999999999999999999999999999994949484848474747459595946
          46463A3A3A3535353535353B3B3B4C4C4C5B5B5B7474748A8A8A949494999999
          9999999999999999999999999999999999999494948A8A8A7474745B5B5B4C4C
          4C3B3B3B3535355959596262627B7B7B999999C3C3C3E1E1E1F6F6F6FFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F6F6E1E1E1C3C3C39999997B7B7B
          6262625959593B3B3B565656747474A5A5A5CACACAE5E5E5F6F6F6FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F6F6E5E5E5CACACAA5
          A5A53B3B3B3535354343435B5B5B848484B2B2B2DBDBDBF3F3F3FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3F3F3DBDBDBB2B2B28484845B5B5B4343
          43353535FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFF3B3B3B565656747474A5A5A5CACACAE5E5E5F6F6F6FFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F6F6E5E5E5CACACAA5A5A53B
          3B3B3535354343435B5B5B848484B2B2B2DBDBDBF3F3F3FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFF3F3F3DBDBDBB2B2B28484845B5B5B4343433535
          355151517B7B7BBDBDBDE9E9E9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFE9E9E9BDBDBD7B7B7B5151513B3B3B3B3B3B
          3B3B3BA5A5A5CACACAE5E5E5F6F6F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFF6F6F6E5E5E5CACACAA5A5A57B7B7B5656563B3B3B0F
          0F0F1919194343437B7B7BBDBDBDE9E9E9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFE9E9E9BDBDBD7B7B7B4343431919190F0F0FE5E5E59F9F9FFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F
          9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9FFF00FFFEF4EEFEF4EEFEF4EEFE
          F4EEFEF4EEFEF4EEFFFFFFFF00FFFF00FFFF00FFFF00FFFF00FF5959595E5E5E
          6767677474748A8A8A999999A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5
          A5A5A5A5A5A5A59999998A8A8A7474746767675E5E5E5959593535353A3A3A46
          46465656566E6E6E848484909090949494949494949494949494949494949494
          9494949090908484846E6E6E5656564646463A3A3A3535353535353B3B3B4646
          4659595974747484848490909094949494949494949494949494949494949494
          94949090908484847474745959594646463B3B3B353535595959626262747474
          949494BBBBBBD6D6D6EDEDEDF6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6
          F6EDEDEDD6D6D6BBBBBB9494947474746262625959593B3B3B5151517474749F
          9F9FBDBDBDDBDBDBEDEDEDF6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6
          F6F6F6F6F6F6EDEDEDDBDBDBBDBDBD9F9F9F3B3B3B3535354343435959597B7B
          7BACACACD1D1D1E9E9E9F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3E9
          E9E9D1D1D1ACACAC7B7B7B595959434343353535FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3B3B3B5151517474749F9F9FBD
          BDBDDBDBDBEDEDEDF6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6
          F6F6F6EDEDEDDBDBDBBDBDBD9F9F9F3B3B3B3535354343435959597B7B7BACAC
          ACD1D1D1E9E9E9F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3E9E9E9D1
          D1D1ACACAC7B7B7B5959594343433535355151517B7B7BBBBBBBE9E9E9FEFEFE
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEE9E9
          E9BBBBBB7B7B7B5151513B3B3B3B3B3B3B3B3BA5A5A5CACACAE5E5E5F6F6F6FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F6F6E5E5E5
          CACACAA5A5A57B7B7B5656563B3B3B0F0F0F1919194343437B7B7BBDBDBDE9E9
          E9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE9E9E9BDBDBD7B7B7B
          4343431919190F0F0FE5E5E59F9F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F9F9F9F9F9FE5E5E5E5E5E5E5E5E5E5
          E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5
          E5E5E5FF00FFFFFFFFF8BB84F8BB84F8BB84F8BB84F8BB84F8BB84FF00FFFF00
          FFFF00FFFF00FFFF00FF5959595E5E5E6767677474748484849090909999999F
          9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F999999909090848484747474
          6767675E5E5E5959593535353A3A3A4343435151516767677474748484848484
          8484848484848484848484848484848484848484848474747467676751515143
          43433A3A3A3535353535353B3B3B4646465656566767677B7B7B8484848A8A8A
          8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8484847B7B7B6767675656564646
          463B3B3B3535355959596262627474748A8A8AACACACCACACAD6D6D6E1E1E1E1
          E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1D6D6D6CACACAACACAC8A8A8A747474
          6262625959593B3B3B4C4C4C676767909090B2B2B2CACACADBDBDBE5E5E5E5E5
          E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5DBDBDBCACACAB2B2B290
          90903B3B3B3535353E3E3E5656567474749F9F9FBBBBBBD1D1D1DBDBDBDBDBDB
          DBDBDBDBDBDBDBDBDBDBDBDBDBDBDBD1D1D1BBBBBB9F9F9F7474745656563E3E
          3E353535FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFF3B3B3B4C4C4C676767909090B2B2B2CACACADBDBDBE5E5E5E5E5E5E5E5
          E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5DBDBDBCACACAB2B2B29090903B
          3B3B3535353E3E3E5656567474749F9F9FBBBBBBD1D1D1DBDBDBDBDBDBDBDBDB
          DBDBDBDBDBDBDBDBDBDBDBDBD1D1D1BBBBBB9F9F9F7474745656563E3E3E3535
          354C4C4C747474B2B2B2E5E5E5FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFDFDFDE5E5E5B2B2B27474744C4C4C3B3B3B3B3B3B
          3B3B3BA5A5A5CACACAE5E5E5F6F6F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFF6F6F6E5E5E5CACACAA5A5A57474745656563B3B3B0F
          0F0F1919194343437B7B7BBDBDBDE9E9E9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFE9E9E9BDBDBD7B7B7B4343431919190F0F0FD592677A5636FA
          DBC2FADBC2FADBC2FADBC2FADBC2FADBC2FADBC2FADBC2FADBC2FADBC2FADBC2
          D59267FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFEF4EEFEF4EEFEF4EEFE
          F4EEFEF4EEFEF4EEFFFFFFFF00FFFF00FFFF00FFFF00FFFF00FF5959595B5B5B
          6262626E6E6E7B7B7B8484848A8A8A9090909090909090909090909090909090
          909090908A8A8A8484847B7B7B6E6E6E6262625B5B5B5959593535353838383E
          3E3E4C4C4C5B5B5B6767676E6E6E747474747474747474747474747474747474
          7474746E6E6E6767675B5B5B4C4C4C3E3E3E3838383535353535353A3A3A4343
          434C4C4C5E5E5E67676774747474747474747474747474747474747474747474
          74747474746767675E5E5E4C4C4C4343433A3A3A3535355959596262626E6E6E
          848484999999ACACACBBBBBBC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
          C3BBBBBBACACAC9999998484846E6E6E6262625959593B3B3B4343435E5E5E7B
          7B7B999999B2B2B2BDBDBDCACACACACACACACACACACACACACACACACACACACACA
          CACACACACACABDBDBDB2B2B29999997B7B7B3B3B3B3535353E3E3E4C4C4C6565
          648484849F9F9FACACACB2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2AC
          ACAC9F9F9F8484846565644C4C4C3E3E3E353535FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3B3B3B4343435E5E5E7B7B7B99
          9999B2B2B2BDBDBDCACACACACACACACACACACACACACACACACACACACACACACACA
          CACACABDBDBDB2B2B29999997B7B7B3B3B3B3535353E3E3E4C4C4C6565648484
          849F9F9FACACACB2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2ACACAC9F
          9F9F8484846565644C4C4C3E3E3E3535354C4C4C6767679F9F9FD1D1D1F1F1F1
          FDFDFDFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFDFDFDF1F1F1D1D1
          D19F9F9F6767674C4C4C3B3B3B3B3B3B3B3B3B9F9F9FBDBDBDDBDBDBEDEDEDF6
          F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6EDEDEDDBDBDB
          BDBDBD9F9F9F7474745151513B3B3B0F0F0F1919194343437B7B7BBDBDBDE9E9
          E9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE9E9E9BDBDBD7B7B7B
          4343431919190F0F0FD592677A5636FADBC2FADBC2FADBC2FADBC2FADBC2FADB
          C2FADBC2FADBC2FADBC2FADBC2FADBC2D59267FFFFFFD59267D59267D59267D5
          9267D59267D59267D59267D59267D59267D59267D59267D59267D59267D59267
          D59267FFFFFF000000FFFFFF000000FFFFFF000000FFFFFF000000FF00FFFF00
          FFFF00FFFF00FFFF00FF5959595B5B5B5E5E5E6565646E6E6E7474747474747B
          7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7474747474746E6E6E656564
          5E5E5E5B5B5B5959593535353535353A3A3A4343434C4C4C5151515656565959
          595959595959595959595959595959595959595656565151514C4C4C4343433A
          3A3A3535353535353535353838383E3E3E4343434C4C4C5656565959595B5B5B
          5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5959595656564C4C4C4343433E3E
          3E3838383535355959595E5E5E6565646E6E6E8484848A8A8A94949499999999
          99999999999999999999999999999999999494948A8A8A8484846E6E6E656564
          5E5E5E5959593B3B3B3A3A3A4C4C4C6767677B7B7B9090909F9F9FA5A5A5A5A5
          A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A59F9F9F9090907B7B7B67
          67673B3B3B3535353B3B3B4343435151516565647474747B7B7B848484848484
          8484848484848484848484848484847B7B7B7474746565645151514343433B3B
          3B353535FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFF3B3B3B3A3A3A4C4C4C6767677B7B7B9090909F9F9FA5A5A5A5A5A5A5A5
          A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A59F9F9F9090907B7B7B6767673B
          3B3B3535353B3B3B4343435151516565647474747B7B7B848484848484848484
          8484848484848484848484847B7B7B7474746565645151514343433B3B3B3535
          35FFFFFF5B5B5B848484B2B2B2D1D1D1E5E5E5E9E9E9E9E9E9E9E9E9E9E9E9E9
          E9E9E9E9E9E9E9E9E5E5E5D1D1D1B2B2B28484845B5B5B4343433B3B3BFFFFFF
          3B3B3B909090B2B2B2CACACADBDBDBE5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5
          E5E5E5E5E5E5E5E5E5E5DBDBDBCACACAB2B2B29090906767674C4C4C3B3B3B0F
          0F0F1919194343437B7B7BBDBDBDE9E9E9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFE9E9E9BDBDBD7B7B7B4343431919190F0F0FD592677A5636FA
          DBC2FADBC2FADBC2FADBC2FADBC2FADBC2FADBC2FADBC2FADBC2FADBC2FADBC2
          D59267FFFFFFFADBC2FADBC2FADBC2FADBC2FADBC2FADBC2FADBC2FADBC2FADB
          C2FADBC2FADBC2FADBC2FADBC2FADBC2FADBC200000000000000000000000000
          0000000000000000000000FF00FFFF00FFFF00FFFF00FFFF00FF5959595B5B5B
          5B5B5B5E5E5E6262626767676767676767676767676767676767676767676767
          676767676767676767676262625E5E5E5B5B5B5B5B5B59595935353535353538
          38383A3A3A3E3E3E434343464646464646464646464646464646464646464646
          4646464646464343433E3E3E3A3A3A3838383535353535353535353838383A3A
          3A3E3E3E4343434646464646464C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C
          4C4C4646464646464343433E3E3E3A3A3A3838383535355959595B5B5B5E5E5E
          6565646E6E6E7474747474747B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B
          7B7474747474746E6E6E6565645E5E5E5B5B5B5959593B3B3B3838383E3E3E4C
          4C4C5E5E5E6767677474747474747B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B
          7B7B7B7474747474746767675E5E5E4343433B3B3B3535353838383E3E3E4343
          434C4C4C5656565959595B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B59
          59595656564C4C4C4343433E3E3E383838353535FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3B3B3B3838383E3E3E4C4C4C5E
          5E5E6767677474747474747B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B7B
          7474747474746767675E5E5E4343433B3B3B3535353838383E3E3E4343434C4C
          4C5656565959595B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B59595956
          56564C4C4C4343433E3E3E383838353535FFFFFF4C4C4C6262628484849F9F9F
          B2B2B2BBBBBBBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBBBBBBB2B2B29F9F9F8484
          846262624C4C4C3E3E3E3B3B3BFFFFFF3B3B3B565656999999B2B2B2BDBDBDCA
          CACACACACACACACACACACACACACACACACACACACACACACACACACABDBDBDB2B2B2
          9999997B7B7B5E5E5E3E3E3E3B3B3B0F0F0F1919193E3E3E7B7B7BBDBDBDE9E9
          E9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE9E9E9BDBDBD7B7B7B
          3E3E3E1919190F0F0FD592677A5636FADBC2FADBC2FADBC2FADBC2FADBC2FADB
          C2FADBC2FADBC2FADBC2FADBC2FADBC2D59267FFFFFFFADBC2FADBC2FADBC2FA
          DBC2FADBC2FADBC2FADBC2FADBC2FADBC2FADBC2FADBC2FADBC2FADBC2FADBC2
          FADBC2000000000000000000000000000000000000000000000000FF00FFFF00
          FFFF00FFFF00FFFF00FFFFFFFF5B5B5B5B5B5B5B5B5B5B5B5B5E5E5E5E5E5E5E
          5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5B5B5B5B5B5B
          5B5B5B5B5B5BFFFFFFFFFFFF3535353535353535353838383A3A3A3A3A3A3A3A
          3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A3A38383835353535
          3535353535FFFFFFFFFFFF3838383838383838383A3A3A3B3B3B3B3B3B3B3B3B
          3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3A3A3A3838383838
          38383838FFFFFFFFFFFF5B5B5B5B5B5B5E5E5E62626262626262626262626262
          62626262626262626262626262626262626262626262626262625E5E5E5B5B5B
          5B5B5BFFFFFFFFFFFF3B3B3B3838383A3A3A4343434C4C4C5151515656565656
          565656565656565656565656565656565656565656565151514C4C4C3E3E3E3B
          3B3BFFFFFFFFFFFF3838383838383B3B3B3E3E3E3E3E3E434343434343434343
          4343434343434343434343434343434343433E3E3E3E3E3E3B3B3B3838383838
          38FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFF3B3B3B3838383A3A3A4343434C4C4C5151515656565656565656
          565656565656565656565656565656565656565151514C4C4C3E3E3E3B3B3BFF
          FFFFFFFFFF3838383838383B3B3B3E3E3E3E3E3E434343434343434343434343
          4343434343434343434343434343433E3E3E3E3E3E3B3B3B383838383838FFFF
          FFFFFFFFFFFFFF4C4C4C5B5B5B6767677474747B7B7B7B7B7B7B7B7B7B7B7B7B
          7B7B7B7B7B7B7B7B7474746767675B5B5B4C4C4C3E3E3E3B3B3BFFFFFFFFFFFF
          FFFFFF3B3B3B5656569090909F9F9FA5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5
          A5A5A5A5A5A5A5A5A5A59F9F9F9090907B7B7B6767674343433B3B3BFFFFFF0F
          0F0F1919193838386E6E6EB7B7B7E5E5E5FDFDFDFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFDFDFDE5E5E5B7B7B76E6E6E3838381919190F0F0FD592677A5636FA
          DBC2FADBC2FADBC2FADBC2FADBC2FADBC2FADBC2FADBC2FADBC2FADBC2FADBC2
          D59267FFFFFFFADBC2FADBC2FADBC2FADBC2FADBC2FADBC2FADBC2FADBC2FADB
          C2FADBC2FADBC2FADBC2FADBC2FADBC2FADBC200000000000000000000000000
          0000000000000000000000FF00FFFF00FFFF00FFFF00FFFF00FFFFFFFFFFFFFF
          5959595959595959595959595959595959595959595959595959595959595959
          59595959595959595959595959595959595959FFFFFFFFFFFFFFFFFFFFFFFF35
          3535353535353535353535353535353535353535353535353535353535353535
          353535353535353535353535353535353535FFFFFFFFFFFFFFFFFFFFFFFF3535
          3535353535353535353535353535353535353535353535353535353535353535
          3535353535353535353535353535353535FFFFFFFFFFFFFFFFFFFFFFFF595959
          5959595959595959595959595959595959595959595959595959595959595959
          59595959595959595959595959595959FFFFFFFFFFFFFFFFFFFFFFFF3B3B3B3B
          3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B
          3B3B3B3B3B3B3B3B3B3B3B3B3B3B3BFFFFFFFFFFFFFFFFFFFFFFFF3535353535
          3535353535353535353535353535353535353535353535353535353535353535
          3535353535353535353535353535FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3B3B3B3B3B3B3B
          3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B
          3B3B3B3B3B3B3B3B3B3B3B3BFFFFFFFFFFFFFFFFFFFFFFFF3535353535353535
          3535353535353535353535353535353535353535353535353535353535353535
          3535353535353535353535FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4C4C4C
          4C4C4C5151515151515151515151515151515151515151514C4C4C4C4C4C4343
          433E3E3EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3B3B3B3B3B3B3B3B3B3B
          3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B
          3B3B3B3B3B3B3B3B3BFFFFFFFFFFFF0F0F0F0F0F0F2929295E5E5EA5A5A5DBDB
          DBF9F9F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F9F9DBDBDBA5A5A55E5E5E
          2929290F0F0F0F0F0FD592677A5636FADBC2FADBC2FADBC2FADBC2FADBC2FADB
          C2FADBC2FADBC2FADBC2FADBC2FADBC2D59267FFFFFFFADBC2FADBC2FADBC2FA
          DBC2FADBC2FADBC2FADBC2FADBC2FADBC2FADBC2FADBC2FADBC2FADBC2FADBC2
          FADBC2000000000000000000000000000000000000000000000000FF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FF7460457A563674604574604574604574
          6045746045746045746045746045746045746045746045746045746045746045
          656564FF00FFFF00FFFF00FFFF00FF7460457A56367460457460457460457460
          4574604574604574604574604574604574604574604574604574604574604565
          6564FF00FFFF00FFFF00FFFF00FF7460457A5636746045746045746045746045
          7460457460457460457460457460457460457460457460457460457460456565
          64FF00FFFF00FFFF00FFFF00FF7460457A563674604574604574604574604574
          6045746045746045746045746045746045746045746045746045746045656564
          FF00FFFF00FFFF00FFFF00FF814D12814D12814D12814D12814D12814D12814D
          12814D12814D12814D12814D12814D12814D12814D12814D12814D12814D12FF
          00FFFF00FFFF00FFFF00FF814D126A4003713F13713F13713F13713F13713F13
          713F13713F13713F13713F13713F13713F13713F13713F136A4003814D12FF00
          FFFF00FFFF00FFFF00FF7460457A563674604574604574604574604574604574
          6045746045746045746045746045746045746045746045746045656564FF00FF
          FF00FFFF00FFFF00FF814D12814D12814D12814D12814D12814D12814D12814D
          12814D12814D12814D12814D12814D12814D12814D12814D12814D12FF00FFFF
          00FFFF00FFFF00FF814D126A4003713F13713F13713F13713F13713F13713F13
          713F13713F13713F13713F13713F13713F13713F136A4003814D12FF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FF6D411D82675195735C95735C95735C95735C95
          735C95735C95735C95735C95735C826751572624FF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FF814D12814D12814D12814D12814D12814D12814D12814D12814D
          12814D12814D12814D12814D12814D12814D12814D12814D12FF00FFFF00FFFF
          FFFF0F0F0F2121214C4C4C909090CACACAF1F1F1FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFF1F1F1CACACA9090904C4C4C2121210F0F0FFFFFFFD592677A5636FA
          DBC2FADBC2FADBC2FADBC2FADBC2FADBC2FADBC2FADBC2FADBC2FADBC2FADBC2
          D59267FFFFFFFADBC2FADBC2FADBC2FADBC2FADBC2FADBC2FADBC2FADBC2FADB
          C2FADBC2FADBC2FADBC2FADBC2FADBC2FADBC200000000000000000000000000
          0000000000000000000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6F4929
          DCC590EDE3BFF1EBCDF3EBD7F5F2DFF5F2DFF5F2DFF5F2DFF5F2DFF5F2DFF5F2
          DFF5F2DFF5F2DFF9F6EAFAF7EFFEFEFCFFFFFF6E6E6EFF00FFFF00FF6F4929C4
          9449DCC590E7D7B7EDE3BFF3EBD7F3EBD7F3EBD7F3EBD7F3EBD7F3EBD7F3EBD7
          F3EBD7F9F6EAF9F6EAF9F6EAF9F6EADCC5906E6E6EFF00FFFF00FF6F4929A16D
          28C49449CDAD66D9BF86E6CC95E4D4A6E4D4A6E4D4A6E4D4A6E4D4A6E4D4A6E4
          D4A6E4D4A6E4D4A6E6DAADE4D4A6D5B97B6E6E6EFF00FFFF00FF6F4929DCC590
          EDE3BFF1EBCDF3EBD7F5F2DFF5F2DFF5F2DFF5F2DFF5F2DFF5F2DFF5F2DFF5F2
          DFF5F2DFF9F6EAFAF7EFFEFEFCFFFFFF6E6E6EFF00FFFF00FF92641D92641DC5
          A25BE0D39FEDE3BFEDE3BFEDE3BFEDE3BFEDE3BFEDE3BFEDE3BFEDE3BFEDE3BF
          EDE3BFEDE3BFEDE3BFEDE3BFC5A25B814D12FF00FFFF00FF6A40032D140B713F
          138758168B6832A16D28A87636A87636A87636A87636A87636A87636A16D28A1
          6D28A16D28A876368B6832875816875816FF00FFFF00FF6F4929DCC590EDE3BF
          F1EBCDF3EBD7F5F2DFF5F2DFF5F2DFF5F2DFF5F2DFF5F2DFF5F2DFF5F2DFF5F2
          DFF9F6EAFAF7EFFEFEFCFFFFFF6E6E6EFF00FFFF00FF92641D92641DC5A25BE0
          D39FEDE3BFEDE3BFEDE3BFEDE3BFEDE3BFEDE3BFEDE3BFEDE3BFEDE3BFEDE3BF
          EDE3BFEDE3BFEDE3BFC5A25B814D12FF00FFFF00FF6A40032D140B713F138758
          168B6832A16D28A87636A87636A87636A87636A87636A87636A16D28A16D28A1
          6D28A876368B6832875816875816FF00FFFF00FFFF00FF7D33007D33009A6038
          C0AD9FD8CBC2D8CBC2D8CBC2D8CBC2D8CBC2D8CBC2D8CBC2D8CBC2DCD3D0DCD3
          D0B09D91826751572624FF00FFFF00FFFF00FF92641DC5A25BD5B97BDCC590DF
          CCA6E7D7B7E7D7B7E7D7B7E7D7B7E7D7B7E7D7B7E7D7B7E7D7B7E7D7B7E7DBC4
          ECE6D3F5F2DFF7F2E6814D12FF00FFFFFFFF0F0F0F1919193A3A3A747474B8B8
          B8E9E9E9FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDE9E9E9B8B8B87474743A3A3A
          1919190F0F0FFFFFFFD592677A5636FADBC2FADBC2FADBC2FADBC2FADBC2FADB
          C2FADBC2FADBC2FADBC2FADBC2FADBC2D59267FFFFFFFADBC2FADBC2FADBC2FA
          DBC2FADBC2FADBC2FADBC2FADBC2FADBC2FADBC2FADBC2FADBC2FADBC2FADBC2
          FADBC2000000FFFFFF000000FFFFFF000000FFFFFF000000FFFFFFFF00FFFF00
          FFFF00FFFF00FFFF00FF713F13B28957A87636DCC590EDE3BFF1EBCDF3EBD7F5
          F2DFF5F2DFF5F2DFF5F2DFF5F2DFF5F2DFF5F2DFF9F6EAFAF7EFFEFEFCFFFFFF
          F3EBD7FFFFFF656564713F1392641DC49449EDE3BFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFDCC590656564713F13A16D28C49449CDAD66D9BF86E0D39FE6DAADE6DAAD
          E6DAADE6DAADE6DAADE6DAADE6DAADE6DAADE6DAADE7D7B7E6DAADE0D39FEDE3
          BFD5B97B656564713F13B28957A87636DCC590EDE3BFF1EBCDF3EBD7F5F2DFF5
          F2DFF5F2DFF5F2DFF5F2DFF5F2DFF5F2DFF9F6EAFAF7EFFEFEFCFFFFFFF3EBD7
          FFFFFF6565648758166A400392641DEDE3BFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEDE3BFC5
          A25B814D125226025226026A400392641DA87636B6956DC3A983C7AE8AC7AE8A
          C7AE8AC7AE8AC7AE8AC7AE8AC7AE8AC3A983C2A081BC9D79B6956DB289578758
          16814D12713F13B28957A87636DCC590EDE3BFF1EBCDF3EBD7F5F2DFF5F2DFF5
          F2DFF5F2DFF5F2DFF5F2DFF5F2DFF9F6EAFAF7EFFEFEFCFFFFFFF3EBD7FFFFFF
          6565648758166A400392641DEDE3BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEDE3BFC5A25B81
          4D125226025226026A400392641DA87636B6956DC3A983C7AE8AC7AE8AC7AE8A
          C7AE8AC7AE8AC7AE8AC7AE8AC3A983C2A081BC9D79B6956DB28957875816814D
          12FF00FFA35027A350279A60389A6038A78066A98773A98773A98773A98773A9
          8773A98773A98773A98773BFA494EBE2D9F1F1F1E1E1E19D9388572624FF00FF
          875816A67E51B28957CDAD66D2B689DFCCA6E4D3AFE4D3AFE4D3AFE4D3AFE4D3
          AFE4D3AFE4D3AFE4D3AFE7D7B7E7DBC4ECE6D3F2EDE5F7F2E6F7F2E6814D12FF
          FFFF0F0F0F0F0F0F2323234C4C4C848484BBBBBBE9E9E9FDFDFDFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFD
          FDE9E9E9BBBBBB8484844C4C4C2323230F0F0F0F0F0FFFFFFFD592677A5636FA
          DBC2FADBC2FADBC2FADBC2FADBC2FADBC2FADBC2FADBC2FADBC2FADBC2FADBC2
          D59267FFFFFFFADBC2FADBC2FADBC2FADBC2FADBC2FADBC2FADBC2FADBC2FADB
          C2FADBC2FADBC2FADBC2FADBC2FADBC2FADBC2FFFFFFF8BB84FFFFFFF8BB84FF
          FFFFF8BB84FFFFFFF8BB84FF00FFFF00FFFF00FFFF00FFFF00FF713F13C5955F
          B68538D1AA73E0D39FEDE3BFF1EBCDF1EBCDF1EBCDF1EBCDF1EBCDF1EBCDF1EB
          CDF1EBCDF1EBCDF5F2DFF9F6EAFEFEFCFFFFFFFEFEFC746045713F13A16D28C5
          A25BDCC590F9F6EAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F6EA746045713F13A87636CDAD
          66DCC590EDE3BFF5F2DFFAF7EFFBF9F3FBF9F3FBF9F3FBF9F3FBF9F3FBF9F3FB
          F9F3FBF9F3FBF9F3FAF7EFF3EBD7E0D39FE4D4A6746045713F13C5955FB68538
          D1AA73E0D39FEDE3BFF1EBCDF1EBCDF1EBCDF1EBCDF1EBCDF1EBCDF1EBCDF1EB
          CDF1EBCDF5F2DFF9F6EAFEFEFCFFFFFFFEFEFC74604587581692641DEDE3BFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEDE3BF814D12522602814D126A4003A16D
          28B28957C4A373CDB691D9C6ADD9C6ADD9C6ADD9C6ADD9C6ADD9C6ADD8C3AAD5
          C2A4CDB99ACAB290C3A983BC9D79A16D28713F13713F13C5955FB68538D1AA73
          E0D39FEDE3BFF1EBCDF1EBCDF1EBCDF1EBCDF1EBCDF1EBCDF1EBCDF1EBCDF1EB
          CDF5F2DFF9F6EAFEFEFCFFFFFFFEFEFC74604587581692641DEDE3BFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFEDE3BF814D12522602814D126A4003A16D28B289
          57C4A373CDB691D9C6ADD9C6ADD9C6ADD9C6ADD9C6ADD9C6ADD8C3AAD5C2A4CD
          B99ACAB290C3A983BC9D79A16D28713F13FF00FFA87636DCB58DD59267B28957
          A876369A60389A60389A60389A60389A60389A60389A60389A60389A6038BEA0
          8BF2EDE5FCFBFAE1E1E1826751FF00FF8758168B6832A67E51C5955FCEB06EDC
          C590DFCCA6DFCCA6DFCCA6DFCCA6DFCCA6DFCCA6DFCCA6DFCCA6DFCCA6E7D7B7
          EDE3CAF1E8DFF2EDE5F5F2DF814D12FFFFFFFFFFFF0F0F0F1919192626263E3E
          3E676767999999BDBDBDCACACACACACAD1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1
          D1D1D1D1D1D1D1D1CACACACACACABDBDBD9999996767673E3E3E262626191919
          0F0F0FFFFFFFFFFFFFD592677A5636FADBC2FADBC2FADBC2FADBC2FADBC2FADB
          C2FADBC2FADBC2FADBC2FADBC2FADBC2D59267FFFFFFFADBC2FADBC2FADBC2FA
          DBC2FADBC2FADBC2FADBC2FADBC2FADBC2FADBC2FADBC2FADBC2FADBC2FADBC2
          FADBC2FEF4EEF8BB84FEF4EEF8BB84FEF4EEF8BB84FEF4EEF8BB84FF00FFFF00
          FFFF00FFFF00FFFF00FF713F13C5955FD5B97BC5955FD9BF86E4D4A6E6DAADED
          E3BFEDE3BFEDE3BFEDE3BFEDE3BFEDE3BFEDE3BFEDE3BFF1EBCDF3EBD7F9F6EA
          FEFEFCFAF7EF746045713F13A87636DCC590CEB06EDCC590FFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFF9F6EA746045713F13B68538CDAD66DCC590EDE3BFF7F2E6FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAF7EFE6DA
          ADE6DAAD746045713F13C5955FD5B97BC5955FD9BF86E4D4A6E6DAADEDE3BFED
          E3BFEDE3BFEDE3BFEDE3BFEDE3BFEDE3BFEDE3BFF1EBCDF3EBD7F9F6EAFEFEFC
          FAF7EF746045875816A16D28C5A25BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFED
          E3BF814D1252260287581692641DA16D28C49449CDAD66DCC590DACDAFDFCCA6
          DFCCA6DFCCA6DFCCA6DFCCA6DFCCA6D9C6ADDFCEB8D9C6ADCFB498C3A983A876
          36713F13713F13C5955FD5B97BC5955FD9BF86E4D4A6E6DAADEDE3BFEDE3BFED
          E3BFEDE3BFEDE3BFEDE3BFEDE3BFEDE3BFF1EBCDF3EBD7F9F6EAFEFEFCFAF7EF
          746045875816A16D28C5A25BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEDE3BF81
          4D1252260287581692641DA16D28C49449CDAD66DCC590DACDAFDFCCA6DFCCA6
          DFCCA6DFCCA6DFCCA6DFCCA6D9C6ADDFCEB8D9C6ADCFB498C3A983A87636713F
          13A35027DCAC7BFEE7BBFDCC8EF8BB84DCAC7BD59267D59267D59267D59267D5
          9267D59267C5955FC5955FA67E51A67E51BFA494F2EDE5F1F1F1B09D91572624
          8758167A5636987145A67E51C5A25BD5B97BDCC590DCC590DCC590DCC590DCC5
          90DCC590DCC590DCC590DCC590DFCCA6E7DBC4EDE3CAECE6D3ECE6D3814D12FF
          FFFFFFFFFFFFFFFF0F0F0F0F0F0F1919192929293E3E3E5151515959595E5E5E
          6262626565646565646565646565646565646565646262625E5E5E5959595151
          513E3E3E2929291919190F0F0F0F0F0FFFFFFFFFFFFFFFFFFFD592677A5636FA
          DBC2FADBC2FADBC2FADBC2FADBC2FADBC2FADBC2FADBC2FADBC2FADBC2FADBC2
          D59267FFFFFFFADBC2FADBC2FADBC2FADBC2FADBC2FADBC2FADBC2FADBC2FADB
          C2FADBC2FADBC2FADBC2FADBC2FADBC2FADBC2FEF4EEF8BB84FEF4EEF8BB84FE
          F4EEF8BB84FEF4EEF8BB84FF00FFFF00FFFF00FFFF00FFFF00FF6D411DC5955F
          DCC590C49449CCA16BDCC590E4D4A6E6DAADE6DAADE6DAADE6DAADE6DAADE6DA
          ADE6DAADE6DAADEDE3BFF1EBCDF5F2DFFAF7EFF9F6EA7460456D411DA16D28E7
          D7B7C5A25BD5B97BE7D7B7F9F6EAFEFEFCFEFEFCFEFEFCFEFEFCFEFEFCFEFEFC
          FEFEFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F6EA7460456D411DC49449C5A2
          5BD9BF86E4D4A6F3EBD7F9F6EAF9F6EAF9F6EAF9F6EAF9F6EAF9F6EAF9F6EAFB
          F9F3FFFFFFFFFFFFFFFFFFFBF9F3E7D7B7E4D4A67460456D411DC5955FDCC590
          C49449CCA16BDCC590E4D4A6E6DAADE6DAADE6DAADE6DAADE6DAADE6DAADE6DA
          ADE6DAADEDE3BFF1EBCDF5F2DFFAF7EFF9F6EA746045875816C5A25BA87636C5
          A25BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEDE3BF814D12522602A8763692641D9264
          1DC49449D1B46FDCC590E4D3AFE4D3AFE4D3AFE4D3AFE4D3AFE4D3AFE4D4A6E4
          D3AFE4D3AFE7DBC4D9C6ADCBB696A87636713F136D411DC5955FDCC590C49449
          CCA16BDCC590E4D4A6E6DAADE6DAADE6DAADE6DAADE6DAADE6DAADE6DAADE6DA
          ADEDE3BFF1EBCDF5F2DFFAF7EFF9F6EA746045875816C5A25BA87636C5A25BFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFEDE3BF814D12522602A8763692641D92641DC494
          49D1B46FDCC590E4D3AFE4D3AFE4D3AFE4D3AFE4D3AFE4D3AFE4D4A6E4D3AFE4
          D3AFE7DBC4D9C6ADCBB696A87636713F13A35027FFF8DFFFF9C7FEE7BBFEE7BB
          FED5A7FDCC8EFDCC8EFDCC8EFDCC8EFDCC8EFDCC8EF8BB84F8BB84DCAC7BC595
          5FA67E51BEA08BEBE2D9DCD3D08267518758166F49298B6832987145B28957C5
          A25BCEB06ECEB06ECEB06ECEB06ECEB06ECEB06ECEB06ECEB06ECEB06ED9BF86
          DFCCA6E7D7B7E7DBC4E7DBC4814D12FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF0F0F0F19191919191921212126262629292929292929292929292929292929
          29292929292929292626262121211919191919190F0F0FFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFD592677A5636FADBC2FADBC2FADBC2FADBC2FADBC2FADB
          C2FADBC2FADBC2FADBC2FADBC2FADBC2D59267FFFFFFFADBC2FADBC2FADBC2FA
          DBC2FADBC2FADBC2FADBC2FADBC2FADBC2FADBC2FADBC2FADBC2FADBC2FADBC2
          FADBC2FEF4EEF8BB84FEF4EEF8BB84FEF4EEF8BB84FEF4EEF8BB84FF00FFFF00
          FFFF00FFFF00FFFF00FF713F13B28957D9BF86B68538C49449D9BF86E0D39FE0
          D39FE0D39FE0D39FE0D39FE0D39FE0D39FE0D39FE6DAADE6DAADEDE3BFF1EBCD
          F9F6EAF5F2DF746045713F1392641DE4D4A6C5A25BC5A25BDCC590EDE3BFF3EB
          D7F3EBD7F3EBD7F3EBD7F3EBD7F3EBD7F3EBD7F9F6EAFEFEFCFFFFFFFFFFFFFF
          FFFFF9F6EA746045713F13C49449C49449D5B97BE4D4A6EDE3BFF3EBD7F3EBD7
          F3EBD7F3EBD7F3EBD7F3EBD7F3EBD7F5F2DFF9F6EAFFFFFFFFFFFFFBF9F3E6DA
          ADE4D4A6746045713F13B28957D9BF86B68538C49449D9BF86E0D39FE0D39FE0
          D39FE0D39FE0D39FE0D39FE0D39FE0D39FE6DAADE6DAADEDE3BFF1EBCDF9F6EA
          F5F2DF746045814D12E0D39FA16D28A87636E0D39FFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFED
          E3BF814D12522602A8763692641D92641DB68538D1B46FDCC590E4D4A6E4D4A6
          E4D4A6E4D4A6E4D4A6E4D4A6E4D4A6E4D3AFE7D7B7DFD4BADFCEB8D5C2A4A67E
          51814D12713F13B28957D9BF86B68538C49449D9BF86E0D39FE0D39FE0D39FE0
          D39FE0D39FE0D39FE0D39FE0D39FE6DAADE6DAADEDE3BFF1EBCDF9F6EAF5F2DF
          746045814D12E0D39FA16D28A87636E0D39FFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEDE3BF81
          4D12522602A8763692641D92641DB68538D1B46FDCC590E4D4A6E4D4A6E4D4A6
          E4D4A6E4D4A6E4D4A6E4D4A6E4D3AFE7D7B7DFD4BADFCEB8D5C2A4A67E51814D
          12A35027FFFFEFFFFBD8FFFBD8FFF9C7FEE7BBFEE7BBFED5A7FED5A7FED5A7FE
          D5A7FED5A7FED5A7FED5A7FDCC8EDCAC7BA67E519A6038BFA494DCD3D095735C
          814D126F49297A56368B6832A67E51C5A25BC5A25BC5A25BC5A25BC5A25BC5A2
          5BC5A25BC5A25BC5A25BC5A25BCEB06EDCC590DFCCA6E7D7B7E7D7B7814D1256
          5656565656565656191919000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000191919565656565656D592677A5636FA
          DBC2FADBC2FADBC2FADBC2FADBC2FADBC2FADBC2FADBC2FADBC2FADBC2FADBC2
          D59267FFFFFFFADBC2FADBC2FADBC2FADBC2FADBC2FADBC2FADBC2FADBC2FADB
          C2FADBC2FADBC2FADBC2FADBC2FADBC2FADBC2FEF4EEF8BB84FEF4EEF8BB84FE
          F4EEF8BB84FEF4EEF8BB84FF00FFFF00FFFF00FFFF00FFFF00FF713F13A67E51
          D9BF86A87636B68538D1AA73DCC590E0D39FE0D39FE0D39FE0D39FE0D39FE0D3
          9FE0D39FE0D39FE6DAADEDE3BFF1EBCDF5F2DFF5F2DF746045713F13875816DC
          C590B68538C5A25BDCC590E7D7B7EDE3BFEDE3BFEDE3BFEDE3BFEDE3BFEDE3BF
          EDE3BFF3EBD7FEFEFCFFFFFFFFFFFFFFFFFFF3EBD7746045713F13C49449C494
          49D1B46FE0D39FEDE3BFF1EBCDF1EBCDF1EBCDF1EBCDF1EBCDF1EBCDF1EBCDF3
          EBD7F5F2DFFBF9F3FFFFFFFBF9F3E6DAADE4D4A6746045713F13A67E51D9BF86
          A87636B68538D1AA73DCC590E0D39FE0D39FE0D39FE0D39FE0D39FE0D39FE0D3
          9FE0D39FE6DAADEDE3BFF1EBCDF5F2DFF5F2DF746045814D12D5B97BA16D28A1
          6D28C5A25BEDE3BFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEDE3BF814D12522602A8763692641D9264
          1DB68538CEB06ED5B97BE6DAADE6DAADE6DAADE6DAADE6DAADE6DAADE6DAADE4
          D4A6E4D3AFE7D7B7E7DBC4D8C3AAA67E51814D12713F13A67E51D9BF86A87636
          B68538D1AA73DCC590E0D39FE0D39FE0D39FE0D39FE0D39FE0D39FE0D39FE0D3
          9FE6DAADEDE3BFF1EBCDF5F2DFF5F2DF746045814D12D5B97BA16D28A16D28C5
          A25BEDE3BFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFEDE3BF814D12522602A8763692641D92641DB685
          38CEB06ED5B97BE6DAADE6DAADE6DAADE6DAADE6DAADE6DAADE6DAADE4D4A6E4
          D3AFE7D7B7E7DBC4D8C3AAA67E51814D12A35027FFFFF7FFFEE4FFF8DFFFF9C7
          FEE7BBFEE7BBFEE7BBFEE7BBFEE7BBFEE7BBFEE7BBFEE7BBFEE7BBFED5A7F8BB
          84C5955F9A6038A98773D8CBC295735C814D126F49297A56368B6832A67E51C5
          A25BC5A25BC5A25BC5A25BC5A25BC5A25BC5A25BC5A25BC5A25BC5A25BCEB06E
          DCC590DFCCA6E4D3AFE7D7B7814D12565656B3907C826751885B48795A45734C
          38734C38734C38734C38734C38734C38734C38734C38734C38734C38734C3873
          4C38734C38734C38734C38734C38734C38734C38734C38734C38734C38734C38
          734C38734C38565656D592677A5636FADBC2FADBC2FADBC2FADBC2FADBC2FADB
          C2FADBC2FADBC2FADBC2FADBC2FADBC2D59267FFFFFF7A56367A56367A56367A
          56367A56367A56367A56367A56367A56367A56367A56367A56367A56367A5636
          7A5636FEF4EEF8BB84FEF4EEF8BB84FEF4EEF8BB84FEF4EEF8BB84FF00FFFF00
          FFFF00FFFF00FFFF00FF713F13A67E51D9BF86A87636B68538D1AA73DCC590E0
          D39FE0D39FE0D39FE0D39FE0D39FE0D39FE0D39FE0D39FE6DAADEDE3BFF1EBCD
          F5F2DFF5F2DF746045713F13875816DCC590B68538C5A25BDCC590E7D7B7EDE3
          BFEDE3BFEDE3BFEDE3BFEDE3BFEDE3BFEDE3BFF3EBD7FEFEFCFFFFFFFFFFFFFF
          FFFFF3EBD7746045713F13C49449C49449CDAD66E6CC95E4D4A6F1EBCDF1EBCD
          F1EBCDF1EBCDF1EBCDF1EBCDF1EBCDF1EBCDF3EBD7F9F6EAFFFFFFFBF9F3E6DA
          ADE4D4A6746045713F13A67E51D9BF86A87636B68538D1AA73DCC590E0D39FE0
          D39FE0D39FE0D39FE0D39FE0D39FE0D39FE0D39FE6DAADEDE3BFF1EBCDF5F2DF
          F5F2DF746045814D12C5A25B92641DA16D28C5A25BE0D39FEDE3BFEDE3BFEDE3
          BFEDE3BFEDE3BFEDE3BFEDE3BFFAF7EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFED
          E3BF814D12522602A8763692641D92641DB68538CEB06ED5B97BE6DAADE6DAAD
          E6DAADE6DAADE6DAADE6DAADE6DAADE4D4A6E4D3AFE7D7B7E7DBC4D9C6ADA67E
          51814D12713F13A67E51D9BF86A87636B68538D1AA73DCC590E0D39FE0D39FE0
          D39FE0D39FE0D39FE0D39FE0D39FE0D39FE6DAADEDE3BFF1EBCDF5F2DFF5F2DF
          746045814D12C5A25B92641DA16D28C5A25BE0D39FEDE3BFEDE3BFEDE3BFEDE3
          BFEDE3BFEDE3BFEDE3BFFAF7EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEDE3BF81
          4D12522602A8763692641D92641DB68538CEB06ED5B97BE6DAADE6DAADE6DAAD
          E6DAADE6DAADE6DAADE6DAADE4D4A6E4D3AFE7D7B7E7DBC4D9C6ADA67E51814D
          12A35027FFFFF7FFFEE4FFF8DFFFF9C7FEE7BBFEE7BBFEE7BBFEE7BBFEE7BBFE
          E7BBFEE7BBFEE7BBFEE7BBFED5A7F8BB84C5955F9A6038A98773D8CBC295735C
          814D126F49297A56368B6832A67E51C5A25BC5A25BC5A25BC5A25BC5A25BC5A2
          5BC5A25BC5A25BC5A25BC5A25BCEB06EDCC590DFCCA6E4D3AFE7D7B7814D1256
          565682675195735CA7806695735C826751795A45795A45795A45795A45795A45
          795A45795A45795A45795A45795A45795A45795A45795A45795A45795A45795A
          45795A45795A45795A45795A45795A45734C38734C38191919D592677A5636FA
          DBC2FADBC2FADBC2FADBC2FADBC2FADBC2FADBC2FADBC2FADBC2FADBC2FADBC2
          D59267FFFFFFD59267D59267D59267D59267D59267D59267D59267D59267D592
          67D59267D59267D59267D59267D59267D59267FEF4EEFFFFFFFEF4EEFFFFFFFE
          F4EEFFFFFFFEF4EEFFFFFFFF00FFFF00FFFF00FFFF00FFFF00FF713F13A67E51
          D9BF86A87636B68538D1AA73DCC590E0D39FE0D39FE0D39FE0D39FE0D39FE0D3
          9FE0D39FE0D39FE6DAADEDE3BFF1EBCDF5F2DFF5F2DF746045713F13875816DC
          C590B68538C5A25BDCC590E7D7B7EDE3BFEDE3BFEDE3BFEDE3BFEDE3BFEDE3BF
          EDE3BFF3EBD7FEFEFCFFFFFFFFFFFFFFFFFFF3EBD7746045713F13C49449C494
          49CDAD66E6CC95E4D4A6F1EBCDF1EBCDF1EBCDF1EBCDF1EBCDF1EBCDF1EBCDF1
          EBCDF3EBD7F9F6EAFFFFFFFBF9F3E6DAADE4D4A6746045713F13A67E51D9BF86
          A87636B68538D1AA73DCC590E0D39FE0D39FE0D39FE0D39FE0D39FE0D39FE0D3
          9FE0D39FE6DAADEDE3BFF1EBCDF5F2DFF5F2DF746045814D12C5A25B92641DA1
          6D28C5A25BE0D39FEDE3BFEDE3BFEDE3BFEDE3BFEDE3BFEDE3BFEDE3BFFAF7EF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEDE3BF814D12522602A8763692641D9264
          1DB68538CEB06ED5B97BE6DAADE6DAADE6DAADE6DAADE6DAADE6DAADE6DAADE4
          D4A6E4D3AFE7D7B7E7DBC4D9C6ADA67E51814D12713F13A67E51D9BF86A87636
          B68538D1AA73DCC590E0D39FE0D39FE0D39FE0D39FE0D39FE0D39FE0D39FE0D3
          9FE6DAADEDE3BFF1EBCDF5F2DFF5F2DF746045814D12C5A25B92641DA16D28C5
          A25BE0D39FEDE3BFEDE3BFEDE3BFEDE3BFEDE3BFEDE3BFEDE3BFFAF7EFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFEDE3BF814D12522602A8763692641D92641DB685
          38CEB06ED5B97BE6DAADE6DAADE6DAADE6DAADE6DAADE6DAADE6DAADE4D4A6E4
          D3AFE7D7B7E7DBC4D9C6ADA67E51814D12A35027FFFFF7FFFFEFFFF8DFFFFBD8
          FEE7BBFEE7BBFEE7BBFEE7BBFEE7BBFEE7BBFEE7BBFEE7BBFEE7BBFED5A7FDCC
          8ED592679A6038A98773D8CBC295735C814D126F49297A56368B6832A67E51C5
          A25BC5A25BC5A25BC5A25BC5A25BC5A25BC5A25BC5A25BC5A25BC5A25BCEB06E
          DCC590DFCCA6E4D3AFE7D7B7814D12191919885B48A78066B3907CCFAD8FCFAD
          8FBEA08BBEA08BBEA08BBEA08BBEA08BBEA08BBEA08BBEA08BBEA08BBEA08BBE
          A08BBEA08BBEA08BBEA08BBEA08BBEA08BBEA08BBEA08BB3907C9A7F6A826751
          795A45734C38000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FF713F13A67E51D9BF86A87636B68538D1AA73DCC590E0
          D39FE0D39FE0D39FE0D39FE0D39FE0D39FE0D39FE0D39FE6DAADEDE3BFF1EBCD
          F5F2DFF5F2DF746045713F13875816DCC590B68538C5A25BDCC590E7D7B7EDE3
          BFEDE3BFEDE3BFEDE3BFEDE3BFEDE3BFEDE3BFF3EBD7FEFEFCFFFFFFFFFFFFFF
          FFFFF3EBD7746045713F13C49449C49449CDAD66E6CC95E4D4A6F1EBCDF1EBCD
          F1EBCDF1EBCDF1EBCDF1EBCDF1EBCDF1EBCDF3EBD7F9F6EAFFFFFFFBF9F3E6DA
          ADE4D4A6746045713F13A67E51D9BF86A87636B68538D1AA73DCC590E0D39FE0
          D39FE0D39FE0D39FE0D39FE0D39FE0D39FE0D39FE6DAADEDE3BFF1EBCDF5F2DF
          F5F2DF746045814D12C5A25B92641DA16D28C5A25BE0D39FEDE3BFEDE3BFEDE3
          BFEDE3BFEDE3BFEDE3BFEDE3BFFAF7EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFED
          E3BF814D12522602A8763692641D92641DB68538CEB06ED5B97BE6DAADE6DAAD
          E6DAADE6DAADE6DAADE6DAADE6DAADE4D4A6E4D3AFE7D7B7E7DBC4D9C6ADA67E
          51814D12713F13A67E51D9BF86A87636B68538D1AA73DCC590E0D39FE0D39FE0
          D39FE0D39FE0D39FE0D39FE0D39FE0D39FE6DAADEDE3BFF1EBCDF5F2DFF5F2DF
          746045814D12C5A25B92641DA16D28C5A25BE0D39FEDE3BFEDE3BFEDE3BFEDE3
          BFEDE3BFEDE3BFEDE3BFFAF7EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEDE3BF81
          4D12522602A8763692641D92641DB68538CEB06ED5B97BE6DAADE6DAADE6DAAD
          E6DAADE6DAADE6DAADE6DAADE4D4A6E4D3AFE7D7B7E7DBC4D9C6ADA67E51814D
          12A35027FEFEFCFFFFEFFFFEE4FFFBD8FEE7BBFEE7BBFEE7BBFEE7BBFEE7BBFE
          E7BBFEE7BBFEE7BBFEE7BBFED5A7FDCC8ED592679A6038A98773D8CBC295735C
          814D126F49297A56368B6832A67E51C5A25BC5A25BC5A25BC5A25BC5A25BC5A2
          5BC5A25BC5A25BC5A25BC5A25BCEB06EDCC590DFCCA6E4D3AFE7D7B7814D1200
          00007A5636826751A78066CFAD8FEECDACE7C59EDBC29DDBC29DDBC29DDBC29D
          DBC29DDBC29DDBC29DDBC29DDBC29DDBC29DDBC29DDBC29DDBC29DDBC29DDBC2
          9DDBC29DDBC29DCFAD8FB3907C95735C795A45734C38000000FF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF713F13A67E51
          D9BF86A87636B68538D1AA73DCC590E0D39FE0D39FE0D39FE0D39FE0D39FE0D3
          9FE0D39FE0D39FE6DAADEDE3BFF1EBCDF5F2DFF5F2DF746045713F13875816DC
          C590B68538C5A25BDCC590E7D7B7EDE3BFEDE3BFEDE3BFEDE3BFEDE3BFEDE3BF
          EDE3BFF3EBD7FEFEFCFFFFFFFFFFFFFFFFFFF3EBD7746045713F13C49449C494
          49CDAD66E6CC95E4D4A6F1EBCDF1EBCDF1EBCDF1EBCDF1EBCDF1EBCDF1EBCDF1
          EBCDF3EBD7F9F6EAFFFFFFFBF9F3E6DAADE4D4A6746045713F13A67E51D9BF86
          A87636B68538D1AA73DCC590E0D39FE0D39FE0D39FE0D39FE0D39FE0D39FE0D3
          9FE0D39FE6DAADEDE3BFF1EBCDF5F2DFF5F2DF746045814D12C5A25B92641DA1
          6D28C5A25BE0D39FEDE3BFEDE3BFEDE3BFEDE3BFEDE3BFEDE3BFEDE3BFFAF7EF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEDE3BF814D12522602A8763692641D9264
          1DB68538CEB06ED5B97BE6DAADE6DAADE6DAADE6DAADE6DAADE6DAADE6DAADE4
          D4A6E4D3AFE7D7B7E7DBC4D9C6ADA67E51814D12713F13A67E51D9BF86A87636
          B68538D1AA73DCC590E0D39FE0D39FE0D39FE0D39FE0D39FE0D39FE0D39FE0D3
          9FE6DAADEDE3BFF1EBCDF5F2DFF5F2DF746045814D12C5A25B92641DA16D28C5
          A25BE0D39FEDE3BFEDE3BFEDE3BFEDE3BFEDE3BFEDE3BFEDE3BFFAF7EFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFEDE3BF814D12522602A8763692641D92641DB685
          38CEB06ED5B97BE6DAADE6DAADE6DAADE6DAADE6DAADE6DAADE6DAADE4D4A6E4
          D3AFE7D7B7E7DBC4D9C6ADA67E51814D12A35027FEFEFCFFFFEFFFFEE4FFFBD8
          FEE7BBFEE7BBFEE7BBFEE7BBFEE7BBFEE7BBFEE7BBFEE7BBFEE7BBFED5A7FDCC
          8ED592679A6038A98773D8CBC295735C814D126F49297A56368B6832A67E51C5
          A25BC5A25BC5A25BC5A25BC5A25BC5A25BC5A25BC5A25BC5A25BC5A25BCEB06E
          DCC590DFCCA6E4D3AFE7D7B7814D120000006F4929885B4895735CBC9D79DBC2
          9DEFCFAFEFCFAFEFCFAFEFCFAFEFCFAFEFCFAFEFCFAFEFCFAFEFCFAFEFCFAFEF
          CFAFEFCFAFEFCFAFEFCFAFEFCFAFEFCFAFEFCFAFEECDACDBC29DBEA08B9A7F6A
          795A45734C38000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FF713F13A67E51D9BF86A87636B68538D1AA73DCC590E0
          D39FE0D39FE0D39FE0D39FE0D39FE0D39FE0D39FE0D39FE6DAADEDE3BFF1EBCD
          F5F2DFF5F2DF746045713F13875816DCC590B68538C5A25BDCC590E7D7B7EDE3
          BFEDE3BFEDE3BFEDE3BFEDE3BFEDE3BFEDE3BFF3EBD7FEFEFCFFFFFFFFFFFFFF
          FFFFF3EBD7746045713F13C49449C49449CDAD66E6CC95E4D4A6F1EBCDF1EBCD
          F1EBCDF1EBCDF1EBCDF1EBCDF1EBCDF1EBCDF3EBD7F9F6EAFFFFFFFBF9F3E6DA
          ADE4D4A6746045713F13A67E51D9BF86A87636B68538D1AA73DCC590E0D39FE0
          D39FE0D39FE0D39FE0D39FE0D39FE0D39FE0D39FE6DAADEDE3BFF1EBCDF5F2DF
          F5F2DF746045814D12C5A25B92641DA16D28C5A25BE0D39FEDE3BFEDE3BFEDE3
          BFEDE3BFEDE3BFEDE3BFEDE3BFFAF7EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFED
          E3BF814D12522602A8763692641D92641DB68538CEB06ED5B97BE6DAADE6DAAD
          E6DAADE6DAADE6DAADE6DAADE6DAADE4D4A6E4D3AFE7D7B7E7DBC4D9C6ADA67E
          51814D12713F13A67E51D9BF86A87636B68538D1AA73DCC590E0D39FE0D39FE0
          D39FE0D39FE0D39FE0D39FE0D39FE0D39FE6DAADEDE3BFF1EBCDF5F2DFF5F2DF
          746045814D12C5A25B92641DA16D28C5A25BE0D39FEDE3BFEDE3BFEDE3BFEDE3
          BFEDE3BFEDE3BFEDE3BFFAF7EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEDE3BF81
          4D12522602A8763692641D92641DB68538CEB06ED5B97BE6DAADE6DAADE6DAAD
          E6DAADE6DAADE6DAADE6DAADE4D4A6E4D3AFE7D7B7E7DBC4D9C6ADA67E51814D
          12A35027FFFFFEFFFFEFFFFEE4FFFBD8FEE7BBFEE7BBFEE7BBFEE7BBFEE7BBFE
          E7BBFEE7BBFEE7BBFEE7BBFED5A7FDCC8ED592679A6038A98773D8CBC295735C
          814D126F49297A56368B6832A67E51C5A25BC5A25BC5A25BC5A25BC5A25BC5A2
          5BC5A25BC5A25BC5A25BC5A25BCEB06EDCC590DFCCA6E4D3AFE7D7B7814D1200
          00006F49297A563695735CBC9D79DEBB99EECDACF3D2B1F3D2B1F3D2B1F3D2B1
          F3D2B1F3D2B1F3D2B1F3D2B1F3D2B1F3D2B1F3D2B1F3D2B1F3D2B1F3D2B1F3D2
          B1F3D2B1EFCFAFDBC29DBEA08B9A7F6A795A45734C38000000FF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF713F13A67E51
          D9BF86A87636B68538D1AA73DCC590E0D39FE0D39FE0D39FE0D39FE0D39FE0D3
          9FE0D39FE0D39FE6DAADEDE3BFF1EBCDF5F2DFF5F2DF746045713F13875816DC
          C590B68538C5A25BDCC590E7D7B7EDE3BFEDE3BFEDE3BFEDE3BFEDE3BFEDE3BF
          EDE3BFF3EBD7FEFEFCFFFFFFFFFFFFFFFFFFF3EBD7746045713F13C49449C494
          49CDAD66E6CC95E4D4A6F1EBCDF1EBCDF1EBCDF1EBCDF1EBCDF1EBCDF1EBCDF1
          EBCDF3EBD7F9F6EAFFFFFFFBF9F3E6DAADE4D4A6746045713F13A67E51D9BF86
          A87636B68538D1AA73DCC590E0D39FE0D39FE0D39FE0D39FE0D39FE0D39FE0D3
          9FE0D39FE6DAADEDE3BFF1EBCDF5F2DFF5F2DF746045814D12C5A25B92641DA1
          6D28C5A25BE0D39FEDE3BFEDE3BFEDE3BFEDE3BFEDE3BFEDE3BFEDE3BFFAF7EF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEDE3BF814D12522602A8763692641D9264
          1DB68538CEB06ED5B97BE6DAADE6DAADE6DAADE6DAADE6DAADE6DAADE6DAADE6
          DAADE7D7B7E7D7B7E6DBCFDACDAFA67E51814D12713F13A67E51D9BF86A87636
          B68538D1AA73DCC590E0D39FE0D39FE0D39FE0D39FE0D39FE0D39FE0D39FE0D3
          9FE6DAADEDE3BFF1EBCDF5F2DFF5F2DF746045814D12C5A25B92641DA16D28C5
          A25BE0D39FEDE3BFEDE3BFEDE3BFEDE3BFEDE3BFEDE3BFEDE3BFFAF7EFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFEDE3BF814D12522602A8763692641D92641DB685
          38CEB06ED5B97BE6DAADE6DAADE6DAADE6DAADE6DAADE6DAADE6DAADE6DAADE7
          D7B7E7D7B7E6DBCFDACDAFA67E51814D12A35027FFFFFFFFFFF7FFFEE4FFFBD8
          FEE7BBFEE7BBFEE7BBFEE7BBFEE7BBFEE7BBFEE7BBFEE7BBFEE7BBFED5A7FDCC
          8ED592679A6038A98773D8CBC295735C814D126F49297A56368B6832A67E51C5
          A25BC5A25BC5A25BC5A25BC5A25BC5A25BC5A25BC5A25BC5A25BC5A25BCEB06E
          DCC590DFCCA6E4D3AFE7D7B7814D120000006F49297A563695735CBC9D79DEBB
          99EECDACF3D2B1F3D2B1F3D2B1F3D2B1F3D2B1F3D2B1F3D2B1F3D2B1F3D2B1F3
          D2B1F3D2B1F3D2B1F3D2B1F3D2B1F3D2B1F3D2B1EFCFAFDBC29DBEA08B9A7F6A
          795A45734C38000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FF713F13A87636D5B97B9A6038A87636CCA16BD5B97BDC
          C590DCC590DCC590DCC590DCC590DCC590DCC590E0D39FE4D4A6E6DAADF1EBCD
          F3EBD7F3EBD7746045713F13875816E4D4A6B68538B68538D5B97BDCC590E7D7
          B7E7D7B7E7D7B7E7D7B7E7D7B7E7D7B7E7D7B7EDE3BFF3EBD7FFFFFFFFFFFFFF
          FFFFF3EBD7746045713F13C49449C49449CDAD66E6CC95E4D4A6F1EBCDF1EBCD
          F1EBCDF1EBCDF1EBCDF1EBCDF1EBCDF1EBCDF3EBD7F9F6EAFFFFFFFAF7EFE6DA
          ADE6CC95746045713F13A87636D5B97B9A6038A87636CCA16BD5B97BDCC590DC
          C590DCC590DCC590DCC590DCC590DCC590E0D39FE4D4A6E6DAADF1EBCDF3EBD7
          F3EBD7746045814D12C5A25B92641DA16D28C5A25BE0D39FEDE3BFEDE3BFEDE3
          BFEDE3BFEDE3BFEDE3BFEDE3BFFAF7EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFED
          E3BF814D12522602A16D28875816875816A87636C5A25BD5B97BD5B97BD5B97B
          D5B97BD5B97BD5B97BD5B97BD5B97BE6CC95E0D39FDFCCA6DFCCA6D7C8A7A67E
          51814D12713F13A87636D5B97B9A6038A87636CCA16BD5B97BDCC590DCC590DC
          C590DCC590DCC590DCC590DCC590E0D39FE4D4A6E6DAADF1EBCDF3EBD7F3EBD7
          746045814D12C5A25B92641DA16D28C5A25BE0D39FEDE3BFEDE3BFEDE3BFEDE3
          BFEDE3BFEDE3BFEDE3BFFAF7EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEDE3BF81
          4D12522602A16D28875816875816A87636C5A25BD5B97BD5B97BD5B97BD5B97B
          D5B97BD5B97BD5B97BD5B97BE6CC95E0D39FDFCCA6DFCCA6D7C8A7A67E51814D
          12A35027FFFFFFFEFEFCFFFFEFFFF8DFFFF9C7FEE7BBFEE7BBFEE7BBFEE7BBFE
          E7BBFEE7BBFEE7BBFEE7BBFEE7BBFDCC8ED592679A6038A98773D8CBC295735C
          814D126F49297A56368B6832A67E51C5A25BC5A25BC5A25BC5A25BC5A25BC5A2
          5BC5A25BC5A25BC5A25BC5A25BCEB06EDCC590DFCCA6E4D3AFE7D7B7814D1200
          00006F49297A563695735CBC9D79DEBB99EECDACF3D2B1F3D2B1F3D2B1F3D2B1
          F3D2B1F3D2B1F3D2B1F3D2B1F3D2B1F3D2B1F3D2B1F3D2B1F3D2B1F3D2B1F3D2
          B1F3D2B1EFCFAFDBC29DBEA08B9A7F6A795A45734C38000000FF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF713F13A16D28
          D1AA73854F2F9A6038B68538CCA16BD1AA73D1AA73D1AA73D1AA73D1AA73D1AA
          73D1AA73D9BF86DCC590E4D4A6EDE3BFF1EBCDF1EBCD746045713F13814D12DC
          C59092641DA16D28C5A25BD5B97BDCC590DCC590DCC590DCC590DCC590DCC590
          DCC590DCC590E4D4A6FEFEFCFFFFFFFFFFFFEDE3BF746045713F13B68538B685
          38C5A25BD9BF86E4D4A6E4D4A6E4D4A6E4D4A6E4D4A6E4D4A6E4D4A6E4D4A6ED
          E3BFEDE3BFF3EBD7F7F2E6F5F2DFE0D39FD9BF86746045713F13A16D28D1AA73
          854F2F9A6038B68538CCA16BD1AA73D1AA73D1AA73D1AA73D1AA73D1AA73D1AA
          73D9BF86DCC590E4D4A6EDE3BFF1EBCDF1EBCD746045814D12D5B97B87581692
          641DA87636C5A25BE0D39FE0D39FE0D39FE0D39FE0D39FE0D39FE0D39FEDE3BF
          FAF7EFFFFFFFFFFFFFFFFFFFFFFFFFEDE3BF814D12522602A16D28814D126A40
          0392641DB68538C5A25BCEB06ECEB06ECEB06ECEB06ECEB06ECEB06ECEB06ED1
          B46FD5B97BD5B97BD9BF86D2B689A87636814D12713F13A16D28D1AA73854F2F
          9A6038B68538CCA16BD1AA73D1AA73D1AA73D1AA73D1AA73D1AA73D1AA73D9BF
          86DCC590E4D4A6EDE3BFF1EBCDF1EBCD746045814D12D5B97B87581692641DA8
          7636C5A25BE0D39FE0D39FE0D39FE0D39FE0D39FE0D39FE0D39FEDE3BFFAF7EF
          FFFFFFFFFFFFFFFFFFFFFFFFEDE3BF814D12522602A16D28814D126A40039264
          1DB68538C5A25BCEB06ECEB06ECEB06ECEB06ECEB06ECEB06ECEB06ED1B46FD5
          B97BD5B97BD9BF86D2B689A87636814D12A35027FFFFFFFFFFFFFFFFFFFFFFEF
          FFF8DFFFF9C7FEE7BBFEE7BBFEE7BBFEE7BBFEE7BBFEE7BBFEE7BBFEE7BBFED5
          A7DCAC7BA87636A78066C0AD9F826751814D126F49296F49298B6832987145B2
          8957C5A25BC5A25BC5A25BC5A25BC5A25BC5A25BC5A25BC5A25BC5A25BC5A25B
          D5B97BDCC590DFCCA6DFCCA6814D120000006F49297A563695735CBC9D79DEBB
          99EECDACF3D2B1F3D2B1F3D2B1F3D2B1F3D2B1F3D2B1F3D2B1F3D2B1F3D2B1F3
          D2B1F3D2B1F3D2B1F3D2B1F3D2B1F3D2B1F3D2B1EFCFAFDBC29DBEA08B9A7F6A
          795A45734C38000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FF713F13B28957E6DAADA87636854F2F9A6038A87636B6
          8538B68538B68538B68538B68538B68538B68538C49449CCA16BD9BF86E0D39F
          EDE3BFEDE3BF746045713F13A16D28F3EBD7C5A25B814D12A16D28B68538C5A2
          5BC5A25BC5A25BC5A25BC5A25BC5A25BC5A25BC5A25BD5B97BDCC590F9F6EAFF
          FFFFE7D7B7746045713F13B68538A87636C49449CDAD66D9BF86E6CC95E6CC95
          E6CC95E6CC95E6CC95E6CC95E6CC95E0D39FE4D4A6E4D4A6EDE3BFF1EBCDD9BF
          86CDAD66746045713F13B28957E6DAADA87636854F2F9A6038A87636B68538B6
          8538B68538B68538B68538B68538B68538C49449CCA16BD9BF86E0D39FEDE3BF
          EDE3BF746045814D12C5A25B713F13814D12A16D28A87636C5A25BC5A25BC5A2
          5BC5A25BC5A25BC5A25BC5A25BC5A25BD5B97BFFFFFFFFFFFFFFFFFFFFFFFFE0
          D39F814D1252260292641D875816814D126A400392641DA87636B68538B68538
          B68538B68538B68538B68538B68538B68538C49449C5A25BC5A25BC49449A16D
          28814D12713F13B28957E6DAADA87636854F2F9A6038A87636B68538B68538B6
          8538B68538B68538B68538B68538C49449CCA16BD9BF86E0D39FEDE3BFEDE3BF
          746045814D12C5A25B713F13814D12A16D28A87636C5A25BC5A25BC5A25BC5A2
          5BC5A25BC5A25BC5A25BC5A25BD5B97BFFFFFFFFFFFFFFFFFFFFFFFFE0D39F81
          4D1252260292641D875816814D126A400392641DA87636B68538B68538B68538
          B68538B68538B68538B68538B68538C49449C5A25BC5A25BC49449A16D28814D
          12A35027DCB58DFFFFFFFFFFFFFFFFFFFFFFEFFFF8DFFFFBD8FFFBD8FFFBD8FF
          FBD8FFFBD8FFF9C7FFF9C7FFF9C7FEE7BBF8BB84B289579A60389A60386D411D
          814D126F49296F49296F49298B6832987145A67E51A67E51A67E51A67E51A67E
          51A67E51A67E51A67E51A67E51B28957C5A25BCEB06ED2B689DCC590814D1200
          00006F49297A563695735CBC9D79DEBB99EECDACF3D2B1F3D2B1F3D2B1F3D2B1
          F3D2B1F3D2B1F3D2B1F3D2B1F3D2B1F3D2B1F3D2B1F3D2B1F3D2B1F3D2B1F3D2
          B1F3D2B1EFCFAFDBC29DBEA08B9A7F6A795A45734C38000000FF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF713F13D9BF86
          FBF9F3F5F2DFA87636854F2F9A6038A87636A87636A87636A87636A87636A876
          36A87636B68538C49449C5955FD1AA73DCC590DCC5907A5636713F13C5A25BFF
          FFFFFFFFFFC5A25B92641DB68538B68538B68538B68538B68538B68538B68538
          B68538C5A25BC5A25BCEB06EDCC590EDE3BFDCC5907A5636713F13C49449B685
          38A87636C49449C5A25BCDAD66CDAD66CDAD66CDAD66CDAD66CDAD66CDAD66D1
          B46FD5B97BD9BF86DCC590DCC590CDAD66C494497A5636713F13D9BF86FBF9F3
          F5F2DFA87636854F2F9A6038A87636A87636A87636A87636A87636A87636A876
          36B68538C49449C5955FD1AA73DCC590DCC5907A5636814D12FAF7EFA16D2852
          2602814D1292641DA16D28A16D28A16D28A16D28A16D28A16D28A16D28A16D28
          A87636C5A25BFFFFFFFFFFFFEDE3BFC5A25B814D12522602A16D2892641DA16D
          28814D126A400387581692641D92641D92641D92641D92641D92641D92641D92
          641D92641DA16D28A87636A87636875816814D12713F13D9BF86FBF9F3F5F2DF
          A87636854F2F9A6038A87636A87636A87636A87636A87636A87636A87636B685
          38C49449C5955FD1AA73DCC590DCC5907A5636814D12FAF7EFA16D2852260281
          4D1292641DA16D28A16D28A16D28A16D28A16D28A16D28A16D28A16D28A87636
          C5A25BFFFFFFFFFFFFEDE3BFC5A25B814D12522602A16D2892641DA16D28814D
          126A400387581692641D92641D92641D92641D92641D92641D92641D92641D92
          641DA16D28A87636A87636875816814D12FF00FFA35027FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFEFFFFEE4FFFEE4FFFEE4FFFEE4FFF8DFFFF8DFFFF8DFFFFBD8FEE7
          BBFDCC8ED592679A60387D3300FF00FF814D126F49296F49296F49296F49298B
          68328B68328B68328B68328B68328B68328B68328B68328B68328B6832987145
          A67E51C5955FCDAD66D5B97B814D120000006F49297A563695735CBC9D79DEBB
          99EECDACF3D2B1F3D2B1F3D2B1F3D2B1F3D2B1F3D2B1F3D2B1F3D2B1F3D2B1F3
          D2B1F3D2B1F3D2B1F3D2B1F3D2B1F3D2B1F3D2B1EFCFAFDBC29DBEA08B9A7F6A
          795A45734C38000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FF713F136F4929D9BF86FBF9F3E6DAADD1AA73D5B97BD9
          BF86D9BF86D9BF86D9BF86D9BF86D9BF86D9BF86D9BF86D9BF86DCC590D5B97B
          B68538A87636746045713F13000000E4D4A6FFFFFFF3EBD7DCC590E4D4A6DCC5
          90DCC590DCC590DCC590DCC590DCC590DCC590E4D4A6E7D7B7DCC590C5A25BC4
          9449C49449746045713F13C49449C5A25BB68538A87636B68538C49449C49449
          C49449C49449C49449C49449C49449C49449C49449C5A25BCDAD66CDAD66C494
          49A16D28746045713F136F4929D9BF86FBF9F3E6DAADD1AA73D5B97BD9BF86D9
          BF86D9BF86D9BF86D9BF86D9BF86D9BF86D9BF86D9BF86DCC590D5B97BB68538
          A87636746045713F13FFFFFFFFFFFFA16D28713F1387581692641D92641D9264
          1D92641D92641D92641D92641DA16D28A16D28A87636C5A25BEDE3BF92641D92
          641D814D122D140BA8763652260292641D875816814D1287581692641D92641D
          92641D92641D92641D92641D92641D92641D92641D92641D713F136A40035226
          02A16D28713F136F4929D9BF86FBF9F3E6DAADD1AA73D5B97BD9BF86D9BF86D9
          BF86D9BF86D9BF86D9BF86D9BF86D9BF86D9BF86DCC590D5B97BB68538A87636
          746045713F13FFFFFFFFFFFFA16D28713F1387581692641D92641D92641D9264
          1D92641D92641D92641DA16D28A16D28A87636C5A25BEDE3BF92641D92641D81
          4D122D140BA8763652260292641D875816814D1287581692641D92641D92641D
          92641D92641D92641D92641D92641D92641D92641D713F136A4003522602A16D
          28FF00FFA35027DCB58DFFFFFFFFFFFFFFFFFFFEFEFCFFFFF7FFFFEFFFFFEFFF
          FFEFFFFFEFFFFEE4FFFEE4FFFBD8FFF9C7FEE7BBDCB58DA350277D3300FF00FF
          713F136F49296F49296F49296F49296F49297A56367A56367A56367A56367A56
          367A56367A56367A56367A56368B6832987145A67E51B28957C5A25B814D1200
          00006F49297A563695735CBC9D79DEBB99EECDACF3D2B1F3D2B1F3D2B1F3D2B1
          F3D2B1F3D2B1F3D2B1F3D2B1F3D2B1F3D2B1F3D2B1F3D2B1F3D2B1F3D2B1F3D2
          B1F3D2B1EFCFAFDBC29DBEA08B9A7F6A795A45734C38000000FF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF713F13
          6F4929D9BF86B28957A16D28A87636A67E51A67E51A67E51A67E51A67E51A67E
          51A67E51B28957C5955FC5955FC5955FB28957713F13FF00FFFF00FF713F1300
          0000C5A25BA16D28814D12875816875816875816875816875816875816875816
          87581692641DA16D28A87636A16D2892641D713F13FF00FFFF00FF713F13C494
          49C49449B68538B68538C49449C49449C49449C49449C49449C49449C49449C4
          9449C49449C49449B68538A87636A16D28713F13FF00FFFF00FF713F136F4929
          D9BF86B28957A16D28A87636A67E51A67E51A67E51A67E51A67E51A67E51A67E
          51B28957C5955FC5955FC5955FB28957713F13FF00FFFF00FF713F13FFFFFFFA
          F7EFC5A25BD5B97BC5A25BC5A25BC5A25BC5A25BC5A25BC5A25BC5A25BD5B97B
          E0D39FC5A25BA16D2892641D6A4003814D12FF00FFFF00FF2D140BA87636A16D
          2892641DA16D28A16D28A87636A87636A87636A87636A87636A87636A87636A8
          7636A87636875816875816563A25522602FF00FFFF00FF713F136F4929D9BF86
          B28957A16D28A87636A67E51A67E51A67E51A67E51A67E51A67E51A67E51B289
          57C5955FC5955FC5955FB28957713F13FF00FFFF00FF713F13FFFFFFFAF7EFC5
          A25BD5B97BC5A25BC5A25BC5A25BC5A25BC5A25BC5A25BC5A25BD5B97BE0D39F
          C5A25BA16D2892641D6A4003814D12FF00FFFF00FF2D140BA87636A16D289264
          1DA16D28A16D28A87636A87636A87636A87636A87636A87636A87636A87636A8
          7636875816875816563A25522602FF00FFFF00FFFF00FFA35027A35027DCB58D
          FFFFFFFFFFFFFFFFFFFFFFFEFEFEFCFEFEFCFFFFF7FFFFF7FFFFF7FFFFEFFFF8
          DFDCAC7BA35027A35027FF00FFFF00FFFF00FF713F136F49296F49296F49296F
          49296F49296F49296F49296F49296F49296F49296F49296F49296F49296F4929
          7A56368B6832A67E51814D12FF00FF0000006F49297A563695735CBC9D79DEBB
          99EECDACF3D2B1F3D2B1F3D2B1F3D2B1F3D2B1F3D2B1F3D2B1F3D2B1F3D2B1F3
          D2B1F3D2B1F3D2B1F3D2B1F3D2B1F3D2B1F3D2B1EFCFAFDBC29DBEA08B9A7F6A
          795A45734C38000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FF713F13713F13713F13713F13713F1371
          3F13713F13713F13713F13713F13713F13713F13713F136D411D713F13713F13
          713F13FF00FFFF00FFFF00FFFF00FF713F13713F13713F13713F13713F13713F
          13713F13713F13713F13713F13713F13713F13713F136D411D713F13713F1371
          3F13FF00FFFF00FFFF00FFFF00FF713F13713F13713F13713F13713F13713F13
          713F13713F13713F13713F13713F13713F13713F136D411D713F13713F13713F
          13FF00FFFF00FFFF00FFFF00FF713F13713F13713F13713F13713F13713F1371
          3F13713F13713F13713F13713F13713F13713F136D411D713F13713F13713F13
          FF00FFFF00FFFF00FFFF00FF713F13814D12814D12814D12814D12814D12814D
          12814D12814D12814D12814D12814D12814D12875816875816875816875816FF
          00FFFF00FFFF00FFFF00FF2D140B522602522602522602522602522602522602
          5226025226025226025226025226025226025226025226026A4003522602FF00
          FFFF00FFFF00FFFF00FF713F13713F13713F13713F13713F13713F13713F1371
          3F13713F13713F13713F13713F13713F136D411D713F13713F13713F13FF00FF
          FF00FFFF00FFFF00FF713F13814D12814D12814D12814D12814D12814D12814D
          12814D12814D12814D12814D12814D12875816875816875816875816FF00FFFF
          00FFFF00FFFF00FF2D140B522602522602522602522602522602522602522602
          5226025226025226025226025226025226025226026A4003522602FF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFA35027A35027A35027A35027A35027A35027A3
          5027A35027A35027A35027A35027A35027A35027FF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FF713F13814D12814D12814D12814D12814D12814D12814D12814D
          12814D12814D12814D12814D12875816875816875816875816FF00FFFF00FF00
          00006F49297A563695735CBC9D79DEBB99EECDACF3D2B1F3D2B1F3D2B1F3D2B1
          F3D2B1F3D2B1F3D2B1F3D2B1F3D2B1F3D2B1F3D2B1F3D2B1F3D2B1F3D2B1F3D2
          B1F3D2B1EFCFAFDBC29DBEA08B9A7F6A795A45734C38000000FF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDF6F6F6F4F4F4F3F3F3F3F3
          F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3
          F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3F3
          F4F4F4F6F6F6FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDF4F4F4F1
          F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1
          F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1
          F1F1F1F1F1F1F1F1F1F1F4F4F4FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFCFBFAF3F3F3EDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDED
          EDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDED
          EDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDF3F3F3FCFBFAFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFF00FF5226025226025226025226
          02522602522602522602522602FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFFFFFF9F9F9F9F9F9F9F9F9F9F9F9FFF
          FFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FF0000006F49297A563695735CBC9D79DEBB
          99EECDACF3D2B1F3D2B1F3D2B1F3D2B1F3D2B1F3D2B1F3D2B1F3D2B1F3D2B1F3
          D2B1F3D2B1F3D2B1F3D2B1F3D2B1F3D2B1F3D2B1EFCFAFDBC29DBEA08B9A7F6A
          795A45734C38000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDF6F6F6F4
          F4F4EDEDEDE5E5E5DBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDB
          DBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDB
          DBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBE5E5E5EDEDEDF4F4F4F6F6F6FD
          FDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FDFDFDF4F4F4F1F1F1E9E9E9DBDBDBD1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1
          D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1
          D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1DBDBDBE9E9E9
          F1F1F1F4F4F4FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFDFDFDF4F4F4F1F1F1E9E9E9DBDBDBD1D1D1D1D1D1D1
          D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1
          D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1
          D1D1D1D1DBDBDBE9E9E9F1F1F1F4F4F4FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFF
          00FF522602A16D28A16D28A16D28A16D28A16D28A16D28A16D28A16D28522602
          FF00FFFF00FF61442F61442F61442F61442F61442F61442F61442F61442F6144
          2F61442F61442F61442F61442F61442F61442FFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFA85800A8580093600192641DA16D28A16D28A16D28A16D28A16D28
          A16D28A16D28A16D28A16D28A16D28875816FF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FF936001BA7002D18804C49449E8AC56E8AC56E8AC56E8AC56E8AC56E8
          AC56E8AC56E8AC56E8AC56E8AC56CDAD66FF00FFFF00FFFF00FFFF00FFFF00FF
          E5E5E59F9F9F9F9F9F9F9F9F9F9F9F9F9F9FFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00
          00006F49297A563695735CBC9D79DEBB99EECDACF3D2B1F3D2B1F3D2B1F3D2B1
          F3D2B1F3D2B1F3D2B1F3D2B1F3D2B1F3D2B1F3D2B1F3D2B1F3D2B1F3D2B1F3D2
          B1F3D2B1EFCFAFDBC29DBEA08B9A7F6A795A45734C38000000FF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFFFFFFFFFFFF
          FFFFFFFFFFFFFDFDFDF1F1F1E5E5E5DBDBDBDBDBDBD1D1D1D1D1D1D1D1D1D1D1
          D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1
          D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1
          D1D1D1D1D1D1DBDBDBDBDBDBE5E5E5F1F1F1FDFDFDFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDEDEDEDDBDBDBD1D1D1D1D1D1CACACAC3
          C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
          C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
          C3C3C3C3C3C3C3C3C3C3CACACAD1D1D1D1D1D1DBDBDBEDEDEDFDFDFDFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDEDEDEDDBDBDB
          D1D1D1D1D1D1CACACAC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
          C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
          C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3CACACAD1D1D1D1D1D1DBDBDB
          EDEDEDFDFDFDFFFFFFFFFFFFFFFFFF522602C5A25BE8AC56E8AC56E8AC56E8AC
          56E8AC56E8AC56E8AC56E8AC56A16D2852260261442F87603EDCAC7BDCC590E6
          CC95F1DAAAF1DAAAEDE3BFEDE3BFEDE3BFEDE3BFEDE3BFEDE3BFF1EBCDF3EBD7
          A9877361442FFF00FFFF00FFFF00FFFF00FFBA7002EBA00AEBA00AEBA00AFBCA
          46FBCA46FBCA46FBCA46FBCA46FBCA46FBCA46FBCA46FBCA46EBB269EBB269C4
          9449875816FF00FFFF00FFFF00FFFF00FF7C4F02A85800D18804EBA00AFBCA46
          FBCA46FBCA46FBCA46FBCA46FBCA46FBCA46FBCA46FBCA46EBB269F8BB84EBB2
          69EBB269FF00FFFF00FFFF00FFFF00FFE5E5E59F9F9FFFFFFFFFFFFF9F9F9F9F
          9F9FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FF0000006F49297A563695735CB3907CDEBB
          99EECDACF3D2B1F3D2B1F3D2B1F3D2B1F3D2B1F3D2B1F3D2B1F3D2B1F3D2B1F3
          D2B1F3D2B1F3D2B1F3D2B1F3D2B1F3D2B1F3D2B1EFCFAFDBC29DBEA08B9A7F6A
          795A45734C38000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFFFFFFFFFFFFFFFFFFFDFDFDF3F3F3E1E1E1D6D6D6D1
          D1D1D1D1D1747474656564656564656564656564656564656564656564656564
          6565646565646565646565646565646565646565646565646565646565646565
          64656564656564656564656564656564656564747474D1D1D1D1D1D1D6D6D6E1
          E1E1F1F1F1FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDEDEDED
          D6D6D6CACACAC3C3C3C3C3C35656564646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646565656C3C3C3
          C3C3C3CACACAD6D6D6EDEDEDFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFDFDFDEDEDEDD6D6D6CACACAC3C3C3C3C3C356565646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          4646464646464646464646464646464646464646464646464646464646464646
          46464646565656C3C3C3C3C3C3CACACAD6D6D6EDEDEDFDFDFDFFFFFFFFFFFF52
          2602E8AC56C5A25B854F2F854F2F854F2F854F2F854F2F854F2FE8AC56A16D28
          52260261442FC5955FCCA16BDCAC7BDCC590E6CC95F0D69EF1DAAAF1DAAAF1DA
          AAF1DAAAF1DAAAEDE3BFEDE3BFF1EBCDF3EBD7A9877361442FFF00FFFF00FFFF
          00FFBA7002EBA00AFFC404FFC404FBCA46FBCA46FBCA46FBCA46FBCA46FBCA46
          FBCA46FBCA46FFF568FFF568FFF568F8BB84C49449875816FF00FFFF00FFFF00
          FF7C4F02936001D18804EBA00AFBCA46FBCA46FBCA46FBCA46FBCA46FBCA46FB
          CA46FBCA46FBCA46FFF568FFF568FDCC8EFDCC8EEBB269FF00FFFF00FFFF00FF
          E5E5E59F9F9FFFFFFFFFFFFF9F9F9F9F9F9FFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00
          0000B09D91B09D9195735CB3907CCFAD8FEECDACF3D2B1F3D2B1F3D2B1F3D2B1
          F3D2B1F3D2B1F3D2B1F3D2B1F3D2B1F3D2B1F3D2B1F3D2B1F3D2B1F3D2B1F3D2
          B1F3D2B1EFCFAFDBC29DBEA08B9A7F6A795A45734C38000000FF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFFFFFFFFFFFF
          FDFDFDF3F3F3E1E1E1D6D6D67474746565646565645656565151515151515959
          595B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B
          5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B595959515151
          515151565656656564656564747474D6D6D6E1E1E1F1F1F1FDFDFDFFFFFFFFFF
          FFFFFFFFFFFFFFFDFDFDEDEDEDDBDBDBCACACA5656564646464343432D2D2D19
          1919212121212121232323262626262626262626262626262626262626262626
          2626262626262626262626262626262626262626262626262626262626262323
          232121212121211919192D2D2D434343464646565656CACACAD6D6D6EDEDEDFD
          FDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDEDEDEDDBDBDBCACACA565656
          4646464343432D2D2D1919192121212121212323232626262626262626262626
          2626262626262626262626262626262626262626262626262626262626262626
          26262626262626262323232121212121211919192D2D2D434343464646565656
          CACACAD6D6D6EDEDEDFDFDFDFFFFFF522602E8AC56A16D28854F2FE8AC56E8AC
          56E8AC56E8AC56854F2FE8AC56A16D2852260261442FB28957C5955FD1AA73DC
          AC7BDCC590E6CC95E6CC95E6CC95E7C59EF0D69EF0D69EF1DAAAF1DAAAEDE3BF
          F1EBCDF1EBCDA9877361442FFF00FFFF00FFBA7002EBA00AEBA00AFFC404FFC4
          04FBCA46FBCA46FBCA46FBCA46FBCA46FBCA46FBCA46FBCA46FBCA46FFF568FF
          F568EBB269C49449875816FF00FFFF00FF7C4F02936001D18804EBA00AFFC404
          FBCA46FBCA46FBCA46FBCA46FBCA46FBCA46FBCA46FBCA46FBCA46FFF568FFF5
          68FFF568F8BB84EBB269FF00FFFF00FFE5E5E59F9F9F9F9F9F9F9F9F9F9F9F9F
          9F9FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FF000000CBC2B7D8CBC2826751A78066CFAD
          8FE7C59EEECDACF3D2B1F3D2B1F3D2B1F3D2B1F3D2B1F3D2B1F3D2B1F3D2B1F3
          D2B1F3D2B1F3D2B1F3D2B1F3D2B1F3D2B1F3D2B1EECDACDBC29DBEA08B95735C
          795A45734C38000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFFFFFFFDFDFDF1F1F1E1E1E1D6D6D67474745151514C
          4C4C5151515B5B5B6565646767676E6E6E747474747474747474747474747474
          7474747474747474747474747474747474747474747474747474747474747474
          747474747474747474746E6E6E6767676565645B5B5B5151514C4C4C51515174
          7474D1D1D1E1E1E1F1F1F1FDFDFDFFFFFFFFFFFFFDFDFDEDEDEDD6D6D6CACACA
          5151512929291919192121212929292D2D2D3838383B3B3B4343434343434343
          4343434343434343434343434343434343434343434343434343434343434343
          43434343434343434343434343434343433B3B3B3838382D2D2D292929212121
          191919292929515151CACACAD6D6D6EDEDEDFDFDFDFFFFFFFFFFFFFFFFFFFDFD
          FDEDEDEDD6D6D6CACACA5151512929291919192121212929292D2D2D3838383B
          3B3B434343434343434343434343434343434343434343434343434343434343
          4343434343434343434343434343434343434343434343434343433B3B3B3838
          382D2D2D292929212121191919292929515151CACACAD6D6D6EDEDEDFDFDFD52
          2602E8AC56A16D28854F2FE8AC56E8AC56E8AC56E8AC56854F2FE8AC56A16D28
          52260261442FA67E51C5955FCCA16BD1AA73DCAC7BD9BF86D9BF86DCC590DCC5
          90DCC590E6CC95E6CC95E6CC95F0D69EF1DAAAEDE3BFEDE3BFA7806661442FFF
          00FF936001D18804EBA00AEBA00AFFC404FFC404FFC404FBCA46FBCA46FBCA46
          FBCA46FBCA46FBCA46FBCA46FBCA46FBCA46FFF568FBCA46C49449875816FF00
          FF6A4003936001BA7002D18804EBA00AFFC404FFC404FBCA46FBCA46FBCA46FB
          CA46FBCA46FBCA46FBCA46FBCA46FBCA46FBCA46FBCA46E8AC56C49449FF00FF
          FFFFFFE5E5E5E5E5E5E5E5E5E5E5E5FFFFFFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0B
          0B0BB7B7B7F9F7F4B09D9195735CB3907CCFAD8FE7C59EEECDACEECDACEECDAC
          EECDACEECDACEECDACEECDACEECDACEECDACEECDACEECDACEECDACEECDACEECD
          ACEECDACEECDACDEBB99BC9D7995735C795A452D140B000000FF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFFFFFFF6F6F6
          E5E5E5D6D6D68484846565645151515B5B5B6767677474748484848A8A8A9090
          9090909094949494949494949494949494949494949494949494949494949494
          94949494949494949494949494949494949494949494949090909090908A8A8A
          8484847474746767675E5E5E515151656564747474D1D1D1E5E5E5F6F6F6FFFF
          FFFFFFFFF4F4F4DBDBDBCACACA6767674343431919192626263535354343434C
          4C4C5656565E5E5E656564676767676767676767676767676767676767676767
          6767676767676767676767676767676767676767676767676767676767676565
          645E5E5E5656564C4C4C434343353535292929191919434343515151CACACADB
          DBDBF4F4F4FFFFFFFFFFFFFFFFFFF4F4F4DBDBDBCACACA676767434343191919
          2626263535354343434C4C4C5656565E5E5E6565646767676767676767676767
          6767676767676767676767676767676767676767676767676767676767676767
          67676767676767676565645E5E5E5656564C4C4C434343353535292929191919
          434343515151CACACADBDBDBF4F4F4522602E8AC56A16D28854F2FE8AC56E8AC
          56E8AC56E8AC56854F2FE8AC56A16D2852260261442FA67E51B6956DC5955FCC
          A16BD1AA73DCAC7BDCAC7BDCAC7BDCAC7BDCAC7BDCAC7BDCAC7BD9BF86DCC590
          E6CC95F0D69EF1DAAAF1DAAA95735C61442F936001D18804D18804EBA00AEBA0
          0AFFC404FFC404FFC404FFC404FFC404FFC404FFC404FFC404FFC404FBCA46FB
          CA46FBCA46FBCA46FBCA46B68538814D126A4003936001BA7002D18804EBA00A
          FFC404FFC404FFC404FFC404FFC404FFC404FFC404FFC404FFC404FBCA46FBCA
          46FBCA46FBCA46E8AC56C49449A16D28FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF434343FCFBFAF9F7F4B09D91A780
          66B3907CCFAD8FCFAD8FDEBB99DEBB99DEBB99DEBB99DEBB99DEBB99DEBB99DE
          BB99DEBB99DEBB99DEBB99DEBB99DEBB99DEBB99DEBB99CFAD8FBC9D7995735C
          885B48000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFFFFFFEDEDEDDBDBDB74747465656456565665656474
          74748484849494949F9F9FACACACB2B2B2B7B7B7BBBBBBBBBBBBBDBDBDBDBDBD
          BDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBD
          BDBBBBBBBBBBBBB7B7B7B2B2B2ACACAC9F9F9F94949484848474747467676759
          5959565656747474DBDBDBEDEDEDFFFFFFFFFFFFE9E9E9D1D1D1515151434343
          1919192D2D2D3E3E3E5151516565647474748484848A8A8A9090909090909494
          9494949494949494949494949494949494949494949494949494949494949494
          94949494949494949494949090909090908A8A8A848484747474676767515151
          4343432D2D2D2121212D2D2D515151D1D1D1E9E9E9FFFFFFFFFFFFFFFFFFE9E9
          E9D1D1D15151514343431919192D2D2D3E3E3E5151516565647474748484848A
          8A8A909090909090949494949494949494949494949494949494949494949494
          9494949494949494949494949494949494949494949090909090908A8A8A8484
          847474746767675151514343432D2D2D2121212D2D2D515151D1D1D1E9E9E952
          2602E8AC56A16D28854F2FE8AC56E8AC56E8AC56E8AC56854F2FE8AC56A16D28
          52260261442FA98773C2A081C2A081C4A373C5955FCCA16BCCA16BCCA16BCCA1
          6BCCA16BCCA16BCCA16BD1AA73DCAC7BDCAC7BD9BF86E6CC9595735C61442FFF
          00FF936001C49449E8AC56E8AC56EBA00AEBA00AEBA00AEBA00AEBA00AEBA00A
          EBA00AEBA00AFFC404FFC404FFC404FFC404FBCA46FBCA46FBCA46B68538FF00
          FF6A4003875816A16D28B68538D18804EBA00AEBA00AEBA00AEBA00AEBA00AEB
          A00AEBA00AEBA00AEBA00AFFC404FFC404EBA00AEBA00AD18804BA7002FF00FF
          D59267D59267D59267D59267D59267FFFFFFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FF3A3A3AF3F3F3FFFFFFF9F7F4B09D9195735CA78066B3907CB3907CBC9D79
          BC9D79BC9D79BC9D79BC9D79BC9D79BC9D79BC9D79BC9D79BC9D79BC9D79BC9D
          79BC9D79BC9D79BC9D79A7806695735C885B48000000FF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFFFFFFE1E1E1
          7474745151515656566767677474748A8A8A9F9F9FB2B2B2C3C3C3CACACAD1D1
          D1D6D6D6DBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDB
          DBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBD6D6D6D1D1D1CACACA
          C3C3C3B2B2B29F9F9F9090907B7B7B676767515151565656747474E1E1E1FFFF
          FFFFFFFFDBDBDB5656562929291919192D2D2D4343435B5B5B7474748A8A8A99
          9999A5A5A5B2B2B2B2B2B2B7B7B7B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8
          B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B7B7B7B2B2
          B2B2B2B2A5A5A59999998A8A8A7474745E5E5E4646462D2D2D21212129292956
          5656DBDBDBFFFFFFFFFFFFFFFFFFDBDBDB5656562929291919192D2D2D434343
          5B5B5B7474748A8A8A999999A5A5A5B2B2B2B2B2B2B7B7B7B8B8B8B8B8B8B8B8
          B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8
          B8B8B8B8B8B7B7B7B2B2B2B2B2B2A5A5A59999998A8A8A7474745E5E5E464646
          2D2D2D212121292929565656DBDBDB522602E8AC56A16D28854F2F854F2F854F
          2F854F2F854F2F854F2FE8AC56A16D2852260261442FBDA27ED5C2A4D1BE9CC7
          A688B6956DC5955FC5955FB28957B28957C5955FC5955FC5955FC5955FCCA16B
          CCA16BDCAC7B98714561442FFF00FFFF00FF92641DCDAD66F0D69ED9BF86E8AC
          56EBA00AEBA00AEBA00AEBA00AEBA00AEBA00AEBA00AEBA00AEBA00AEBA00AFF
          C404FFC404FFC404D18804FF00FFFF00FF522602875816A87636B68538B68538
          D18804D18804D18804D18804D18804D18804D18804D18804D18804EBA00AEBA0
          0AD18804D18804BA7002FF00FFFF00FFD592677A5636FADBC2FADBC2D59267FF
          FFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0B0B0B848484F9F7F4FFFFFFF9F7
          F4B09D919A7F6A95735C95735C95735C95735C95735C95735C95735C95735C95
          735C95735C95735C95735C95735C95735C95735C95735C95735C95735C826751
          2D140B000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFFFFFFDBDBDB6565644C4C4C5E5E5E747474909090A5
          A5A5BBBBBBCACACADBDBDBE5E5E5F1F1F1F1F1F1F4F4F4F4F4F4F4F4F4F4F4F4
          F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4
          F4F4F4F4F4F4F4F1F1F1F1F1F1E5E5E5E1E1E1D1D1D1BDBDBDA5A5A590909074
          7474626262515151656564DBDBDBFFFFFFFFFFFFD1D1D1434343191919292929
          4343435E5E5E7B7B7B949494ACACACBDBDBDCACACAD1D1D1D1D1D1D6D6D6D6D6
          D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6
          D6D6D6D6D6D6D6D6D6D6D6D6D6D6D1D1D1D1D1D1CACACABDBDBDACACAC949494
          7B7B7B6262624646462D2D2D191919434343D1D1D1FFFFFFFFFFFFFFFFFFD1D1
          D14343431919192929294343435E5E5E7B7B7B949494ACACACBDBDBDCACACAD1
          D1D1D1D1D1D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6
          D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D1D1D1D1D1D1CACA
          CABDBDBDACACAC9494947B7B7B6262624646462D2D2D191919434343D1D1D152
          2602E8AC56E8AC56A16D28A16D28A16D28A16D28A16D28C5A25BE8AC56A16D28
          52260261442FBDA27EDFCEB8E7D7B7D1BE9CBC9D79B28957A67E51A67E51A67E
          51A67E51B28957B28957B28957B28957C5955F87603E61442FFF00FFFF00FFFF
          00FF92641DCDAD66F1DAAAF0D69ED1B46FC49449D18804D18804D18804D18804
          D18804D18804D18804D18804EBA00AEBA00AEBA00ABA7002FF00FFFF00FFFF00
          FF522602713F13987145A67E51B68538A16D28BA7002BA7002BA7002BA7002BA
          7002BA7002BA7002BA7002BA7002BA7002BA7002BA7002FF00FFFF00FFFF00FF
          D592677A5636FADBC2FADBC2D59267FFFFFFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FF0B0B0B848484F3F3F3FCFBFAF3F3F3F3F3F3B09D919A7F6A9A7F6A
          9A7F6A9A7F6A9A7F6A9A7F6A9A7F6A9A7F6A9A7F6A9A7F6A9A7F6A9A7F6A9A7F
          6A9A7F6A885B48885B48885B48312318000000FF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFFFFFF5E5E5E
          5151515959596E6E6E8484849F9F9FBDBDBDD1D1D1E5E5E5F4F4F4FDFDFDFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          F6F6F6E9E9E9D6D6D6C3C3C3A5A5A58A8A8A6E6E6E5959595151515E5E5EFFFF
          FFFFFFFF3E3E3E2929292121213A3A3A565656747474949494B2B2B2C3C3C3D6
          D6D6E1E1E1E5E5E5EDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDED
          EDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDED
          EDE5E5E5E1E1E1D6D6D6CACACAB2B2B29999997B7B7B5B5B5B3B3B3B2323232D
          2D2D3E3E3EFFFFFFFFFFFFFFFFFF3E3E3E2929292121213A3A3A565656747474
          949494B2B2B2C3C3C3D6D6D6E1E1E1E5E5E5EDEDEDEDEDEDEDEDEDEDEDEDEDED
          EDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDED
          EDEDEDEDEDEDEDEDEDEDEDE5E5E5E1E1E1D6D6D6CACACAB2B2B29999997B7B7B
          5B5B5B3B3B3B2323232D2D2D3E3E3EFF00FF522602E8AC56E8AC56E8AC56E8AC
          56E8AC56E8AC56E8AC56A16D28522602FF00FF61442F746045D1BE9CDFCEB8D8
          C3AABDA27EA67E51987145987145987145987145987145A67E51A67E51B28957
          87603E61442FFF00FFFF00FFFF00FFFF00FF7C4F02C49449DCC590E4D4A6D5B9
          7BC49449D18804BA7002BA7002BA7002BA7002D18804D18804D18804D18804D1
          8804BA7002FF00FFFF00FFFF00FFFF00FF5226026A40038758168B68328B6832
          92641D9360017C4F027C4F027C4F027C4F027C4F029360019360019360019360
          01936001FF00FFFF00FFFF00FFFF00FFD592677A56367A56367A5636D59267FF
          FFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0B0B0B3A3A3A4343
          43848484F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1
          F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1E1E1E1595041000000000000000000
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFFFFFF5B5B5B4C4C4C6262627B7B7B999999B2B2B2D1
          D1D1E5E5E5F9F9F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F9F9E9E9E9D1D1D1B7B7B799
          99997B7B7B6565645151515B5B5BFFFFFFFFFFFF3E3E3E191919292929464646
          6E6E6E8A8A8AACACACCACACADBDBDBEDEDEDF3F3F3F9F9F9F9F9F9F9F9F9FDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDF9F9F9F9F9F9F9F9F9F6F6F6EDEDEDE1E1E1CACACA
          B2B2B29090906E6E6E4646462D2D2D1919193E3E3EFFFFFFFFFFFFFFFFFF3E3E
          3E1919192929294646466E6E6E8A8A8AACACACCACACADBDBDBEDEDEDF3F3F3F9
          F9F9F9F9F9F9F9F9FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF9F9F9F9F9F9F9F9F9F6F6
          F6EDEDEDE1E1E1CACACAB2B2B29090906E6E6E4646462D2D2D1919193E3E3EFF
          00FFFF00FF522602522602522602522602522602522602522602522602FF00FF
          FF00FFFF00FF61442F61442F61442F61442F61442F61442F61442F61442F6144
          2F61442F61442F61442F61442F61442F61442FFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FF875816A87636B28957B68538A16D28936001936001936001936001
          936001936001936001936001BA7002936001FF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FF5226026A4003713F13713F136A40036A40036A40036A40036A40036A
          40036A40036A40036A40036A40036A4003FF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFD59267D59267D59267D59267FF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FF0B0B0B3A3A3A434343434343434343
          4343434343434343434343434343434343434343434343434343434343434343
          433A3A3A0B0B0BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFFFFFF5B5B5B
          515151676767848484A5A5A5C3C3C3E1E1E1F6F6F6FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFF9F9F9E5E5E5CACACAA5A5A58484846767675151515B5B5BFFFF
          FFFFFFFF3E3E3E1919193535355151517B7B7B9F9F9FBDBDBDDBDBDBEDEDEDF9
          F9F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFF9F9F9EDEDEDDBDBDBC3C3C3A5A5A57B7B7B56565635353519
          19193E3E3EFFFFFFFFFFFFFFFFFF3E3E3E1919193535355151517B7B7B9F9F9F
          BDBDBDDBDBDBEDEDEDF9F9F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F9F9EDEDEDDBDBDBC3C3C3A5A5A5
          7B7B7B5656563535351919193E3E3EFFFFFFFFFFFFFFFFFFFFFFFF6262626E6E
          6E7474747B7B7B7B7B7B8484848484848A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A
          8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A
          8A8A8A8484848484847B7B7B7B7B7B7474746E6E6E626262FFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFF000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000000000000000000000
          000000000000000000000000000000FFFFFFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFFFFFF5B5B5B5959596E6E6E909090B2B2B2D1D1D1ED
          EDEDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEDEDEDD1D1D1B2
          B2B29090906E6E6E5959595B5B5BFFFFFFFFFFFF3E3E3E2121213B3B3B5E5E5E
          8A8A8AACACACCACACAE5E5E5F6F6F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F6F6E5E5E5
          CACACAACACAC8A8A8A5E5E5E3B3B3B2121213E3E3EFFFFFFFFFFFFFFFFFF3E3E
          3E2121213B3B3B5E5E5E8A8A8AACACACCACACAE5E5E5F6F6F6FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFF6F6F6E5E5E5CACACAACACAC8A8A8A5E5E5E3B3B3B2121213E3E3EFF
          FFFFFFFFFF5E5E5E6767677474747B7B7B8A8A8A9090909999999F9F9F9F9F9F
          A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5
          A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A59F9F9F9F9F9F9999999090908A
          8A8A7B7B7B7474746767675E5E5EFFFFFFFFFFFFFFFFFFFFFFFF212121292929
          3535353B3B3B4343434C4C4C4C4C4C5151515656565656565959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          59595959595656565656565151514C4C4C4C4C4C4343433B3B3B353535000000
          000000FFFFFFFFFFFFFFFFFFFFFFFF2121212929293535354343434C4C4C5656
          566262626767676E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E
          6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E
          6E6E6E6E6E6E6767676262625656564C4C4C000000000000FFFFFFFFFFFF0000
          00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
          0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFFFFFF5B5B5B
          5B5B5B747474909090B2B2B2D6D6D6F1F1F1FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFF1F1F1D6D6D6B7B7B79494947474745B5B5B5B5B5BFFFF
          FFFFFFFF3E3E3E232323434343656564909090B2B2B2D1D1D1E9E9E9F9F9F9FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFF9F9F9EDEDEDD1D1D1B2B2B290909065656443434323
          23233E3E3EFFFFFFFFFFFFFFFFFF3E3E3E232323434343656564909090B2B2B2
          D1D1D1E9E9E9F9F9F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F9F9EDEDEDD1D1D1B2B2B2
          9090906565644343432323233E3E3EFFFFFF5E5E5E6E6E6E7B7B7B8A8A8A9494
          949F9F9FA5A5A5ACACACB2B2B2B7B7B7BBBBBBBDBDBDBDBDBDBDBDBDBDBDBDBD
          BDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBD
          BBBBBBB7B7B7B2B2B2ACACACA5A5A59F9F9F9494948A8A8A7B7B7B6E6E6E5E5E
          5EFFFFFFFFFFFF2121212D2D2D3838384343434C4C4C5656565E5E5E65656467
          67676E6E6E6E6E6E747474747474747474747474747474747474747474747474
          7474747474747474747474747474747474747474746E6E6E6E6E6E6767676565
          645E5E5E5656564C4C4C4343433838382D2D2D000000FFFFFFFFFFFF19191926
          26263535354646465656566565647474747B7B7B8484848A8A8A909090909090
          9090909090909090909090909090909090909090909090909090909090909090
          909090909090909090909090909090909090908A8A8A8484847B7B7B74747465
          6564565656464646000000FFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6A4003FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFFFFFF5B5B5B5B5B5B747474949494BBBBBBDBDBDBF4
          F4F4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4F4F4DBDBDBBB
          BBBB9494947474745B5B5B5B5B5BFFFFFFFFFFFF3E3E3E262626434343676767
          949494B7B7B7D6D6D6EDEDEDF9F9F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDEDEDED
          D6D6D6B8B8B89494946767674343432626263E3E3EFFFFFFFFFFFFFFFFFF3E3E
          3E262626434343676767949494B7B7B7D6D6D6EDEDEDF9F9F9FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFDFDFDEDEDEDD6D6D6B8B8B89494946767674343432626263E3E3EFF
          FFFF6767677B7B7B8A8A8A999999A5A5A5B2B2B2BBBBBBC3C3C3CACACACACACA
          D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1
          D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1CACACACACACAC3C3C3BBBBBBB2
          B2B2A5A5A59999998A8A8A7B7B7B676767FFFFFFFFFFFF292929383838464646
          5656566262626E6E6E7474747B7B7B8484848A8A8A9090909090909090909090
          9090909090909090909090909090909090909090909090909090909090909090
          90909090909090908A8A8A8484847B7B7B7474746E6E6E626262565656464646
          383838000000FFFFFFFFFFFF2323233535354343435656566767677B7B7B8A8A
          8A9494949F9F9FA5A5A5ACACACACACACACACACACACACACACACACACACACACACAC
          ACACACACACACACACACACACACACACACACACACACACACACACACACACACACACACACAC
          ACACACA5A5A59F9F9F9494948A8A8A7B7B7B676767565656000000FFFFFF0000
          00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
          0000FF00FFFF00FFFF00FFFF00FF6A4003FF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FF6A4003FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FF6A40036A40036A4003FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFFFFFF5B5B5B
          5B5B5B747474949494BDBDBDDBDBDBF6F6F6FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFF6F6F6DBDBDBBDBDBD9494947474745B5B5B5B5B5BFFFF
          FFFFFFFF3E3E3E292929434343676767949494B8B8B8D6D6D6EDEDEDFDFDFDFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFDFDFDEDEDEDD6D6D6B8B8B894949467676743434329
          29293E3E3EFFFFFFFFFFFFFFFFFF3E3E3E292929434343676767949494B8B8B8
          D6D6D6EDEDEDFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDEDEDEDD6D6D6B8B8B8
          9494946767674343432929293E3E3E6262627474748A8A8A999999A5A5A5B7B7
          B7C3C3C3CACACAD6D6D6DBDBDBE1E1E1E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5
          E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5
          E5E5E5E1E1E1DBDBDBD6D6D6CACACAC3C3C3B7B7B7A5A5A59999998A8A8A7474
          746262622626263535354343435656566565647474748484849090909494949F
          9F9FA5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5
          A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A59F9F9F9494
          949090908484847474746565645656564343433535350000001919192929293A
          3A3A4C4C4C6565647B7B7B9090909F9F9FACACACB7B7B7BDBDBDC3C3C3C3C3C3
          C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
          C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3BDBDBDB7B7B7ACACAC9F9F9F90
          90907B7B7B6565644C4C4C000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF00FFFF00FFFF00FF6A40036A40
          036A4003FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6A40036A40036A4003FF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FF6A40036A40036A40036A40036A4003
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFFFFFF5B5B5B5B5B5B747474999999BDBDBDDBDBDBF6
          F6F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F6F6DBDBDBBD
          BDBD9999997474745B5B5B5B5B5BFFFFFFFFFFFF3E3E3E292929434343676767
          949494BDBDBDD6D6D6EDEDEDFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDEDEDED
          D6D6D6BDBDBD9494946767674343432929293E3E3EFFFFFFFFFFFFFFFFFF3E3E
          3E292929434343676767949494BDBDBDD6D6D6EDEDEDFDFDFDFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFDFDFDEDEDEDD6D6D6BDBDBD9494946767674343432929293E3E3E6E
          6E6E7B7B7B949494A5A5A5B7B7B7C3C3C3D1D1D1DBDBDBE5E5E5EDEDEDF1F1F1
          F4F4F4F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6
          F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F4F4F4F1F1F1EDEDEDE5E5E5DBDBDBD1
          D1D1C3C3C3B7B7B7A5A5A59494947B7B7B6E6E6E2D2D2D3B3B3B4C4C4C626262
          7474748484849494949F9F9FACACACB2B2B2B8B8B8BDBDBDBDBDBDBDBDBDBDBD
          BDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBD
          BDBDBDBDBDBDBDBDB8B8B8B2B2B2ACACAC9F9F9F949494848484747474626262
          4C4C4C3B3B3B0000002121212D2D2D4343435656567474748A8A8A9F9F9FB2B2
          B2BDBDBDCACACAD1D1D1D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6
          D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6
          D6D6D6D1D1D1CACACABDBDBDB2B2B29F9F9F8A8A8A7474745656560000000000
          00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
          0000FF00FFFF00FF6A40036A40036A40036A40036A4003FF00FFFF00FFFF00FF
          FF00FF6A40036A40036A40036A40036A4003FF00FFFF00FFFF00FFFF00FF6A40
          036A40036A40036A40036A40036A40036A4003FF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFFFFFF5B5B5B
          5B5B5B747474999999BDBDBDDBDBDBF6F6F6FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFF6F6F6DBDBDBBDBDBD9999997474745B5B5B5B5B5BFFFF
          FFFFFFFF3E3E3E292929434343676767949494BDBDBDD6D6D6EDEDEDFDFDFDFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFDFDFDEDEDEDD6D6D6BDBDBD94949467676743434329
          29293E3E3EFFFFFFFFFFFFFFFFFF3E3E3E292929434343676767949494BDBDBD
          D6D6D6EDEDEDFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDEDEDEDD6D6D6BDBDBD
          9494946767674343432929293E3E3E7474748A8A8A9F9F9FB2B2B2C3C3C3D1D1
          D1E1E1E1E9E9E9F3F3F3F9F9F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFF9F9F9F3F3F3E9E9E9E1E1E1D1D1D1C3C3C3B2B2B29F9F9F8A8A
          8A7474743535354343435656566E6E6E848484949494A5A5A5B2B2B2BDBDBDC3
          C3C3CACACAD1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1
          D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1CACACAC3C3C3BDBD
          BDB2B2B2A5A5A59494948484846E6E6E56565643434300000021212135353546
          46466262627B7B7B949494ACACACBDBDBDD1D1D1DBDBDBE1E1E1E5E5E5E9E9E9
          E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9
          E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E5E5E5E1E1E1DBDBDBD1D1D1BDBDBDAC
          ACAC9494947B7B7B626262000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF00FF6A40036A40036A40036A40
          036A40036A40036A4003FF00FFFF00FF6A40036A40036A40036A40036A40036A
          40036A4003FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFFFFFF5B5B5B5B5B5B747474999999BDBDBDDBDBDBF6
          F6F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F6F6DBDBDBBD
          BDBD9999997474745B5B5B5B5B5BFFFFFFFFFFFF3E3E3E292929434343676767
          949494BDBDBDD6D6D6EDEDEDFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDEDEDED
          D6D6D6BDBDBD9494946767674343432929293E3E3EFFFFFFFFFFFFFFFFFF3E3E
          3E292929434343676767949494BDBDBDD6D6D6EDEDEDFDFDFDFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFDFDFDEDEDEDD6D6D6BDBDBD9494946767674343432929293E3E3E7B
          7B7B909090A5A5A5BBBBBBCACACADBDBDBE9E9E9F6F6F6FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F6F6E9
          E9E9DBDBDBCACACABBBBBBA5A5A59090907B7B7B3838384C4C4C5E5E5E747474
          9090909F9F9FB2B2B2C3C3C3CACACAD6D6D6DBDBDBE1E1E1E1E1E1E1E1E1E1E1
          E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1
          E1E1E1E1E1E1E1E1DBDBDBD6D6D6CACACAC3C3C3B2B2B29F9F9F909090747474
          5E5E5E4C4C4C0000002323233535354C4C4C6767678484849F9F9FB7B7B7CACA
          CADBDBDBE5E5E5EDEDEDF3F3F3F3F3F3F3F3F3F4F4F4F4F4F4F4F4F4F4F4F4F4
          F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F3F3F3F3F3F3
          F3F3F3EDEDEDE5E5E5DBDBDBCACACAB7B7B79F9F9F8484846767670000000000
          00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
          0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFFFFFF5B5B5B
          5B5B5B747474999999BDBDBDDBDBDBF6F6F6FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFF6F6F6DBDBDBBDBDBD9999997474745B5B5B5B5B5BFFFF
          FFFFFFFF3E3E3E292929434343676767949494BDBDBDD6D6D6EDEDEDFDFDFDFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFDFDFDEDEDEDD6D6D6BDBDBD94949467676743434329
          29293E3E3EFFFFFFFFFFFFFFFFFF3E3E3E292929434343676767949494BDBDBD
          D6D6D6EDEDEDFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDEDEDEDD6D6D6BDBDBD
          9494946767674343432929293E3E3E7B7B7B999999ACACACC3C3C3D6D6D6E5E5
          E5F3F3F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3F3F3E5E5E5D6D6D6C3C3C3ACACAC9999
          997B7B7B3B3B3B4C4C4C6565647B7B7B949494ACACACBDBDBDCACACADBDBDBE1
          E1E1E9E9E9EDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDED
          EDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDE9E9E9E1E1E1DBDB
          DBCACACABDBDBDACACAC9494947B7B7B6565644C4C4C0000002626263A3A3A51
          51516E6E6E8A8A8AA5A5A5BDBDBDD1D1D1E1E1E1EDEDEDF6F6F6FCFBFAFCFBFA
          FCFBFAFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFCFBFAFCFBFAFCFBFAF6F6F6EDEDEDE1E1E1D1D1D1BD
          BDBDA5A5A58A8A8A6E6E6E000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FF6A40036A40036A40036A40036A40036A4003
          6A4003FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFFFFFF5B5B5B5B5B5B747474949494BDBDBDDBDBDBF6
          F6F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F6F6DBDBDBBD
          BDBD9494947474745B5B5B5B5B5BFFFFFFFFFFFF3E3E3E292929434343676767
          949494B8B8B8D6D6D6EDEDEDFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDEDEDED
          D6D6D6B8B8B89494946767674343432929293E3E3EFFFFFFFFFFFFFFFFFF3E3E
          3E292929434343676767949494B8B8B8D6D6D6EDEDEDFDFDFDFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFDFDFDEDEDEDD6D6D6B8B8B89494946767674343432929293E3E3E84
          84849F9F9FB2B2B2CACACADBDBDBEDEDEDF9F9F9FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9
          F9F9EDEDEDDBDBDBCACACAB2B2B29F9F9F8484843E3E3E515151676767848484
          9F9F9FB2B2B2C3C3C3D6D6D6E1E1E1EDEDEDF3F3F3F6F6F6F6F6F6F6F6F6F6F6
          F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6
          F6F6F6F6F6F6F6F6F3F3F3EDEDEDE1E1E1D6D6D6C3C3C3B2B2B29F9F9F848484
          6767675151510000002626263B3B3B5151516E6E6E909090ACACACC3C3C3D6D6
          D6E5E5E5F3F3F3FCFBFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFCFBFAF3F3F3E5E5E5D6D6D6C3C3C3ACACAC9090906E6E6E0000000000
          00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
          0000FF00FF6A40036A40036A40036A40036A40036A40036A4003FF00FFFF00FF
          6A40036A40036A40036A40036A40036A40036A4003FF00FFFF00FFFF00FFFF00
          FF6A40036A40036A40036A40036A4003FF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFFFFFF5B5B5B
          5B5B5B747474949494BBBBBBDBDBDBF4F4F4FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFF4F4F4DBDBDBBBBBBB9494947474745B5B5B5B5B5BFFFF
          FFFFFFFF3E3E3E262626434343676767949494B8B8B8D6D6D6EDEDEDFDFDFDFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFDFDFDEDEDEDD6D6D6B8B8B894949467676743434326
          26263E3E3EFFFFFFFFFFFFFFFFFF3E3E3E262626434343676767949494B8B8B8
          D6D6D6EDEDEDFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDEDEDEDD6D6D6B8B8B8
          9494946767674343432626263E3E3E8484849F9F9FB7B7B7CACACAE1E1E1F1F1
          F1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1F1F1E1E1E1CACACAB7B7B79F9F
          9F8484843E3E3E5656566E6E6E8A8A8AA5A5A5B8B8B8CACACADBDBDBE9E9E9F3
          F3F3F9F9F9FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF9F9F9F3F3F3E9E9
          E9DBDBDBCACACAB8B8B8A5A5A58A8A8A6E6E6E5656560000002929293B3B3B56
          56566E6E6E909090ACACACC3C3C3D6D6D6E9E9E9F3F3F3FCFBFAFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFBFAF3F3F3E9E9E9D6D6D6C3
          C3C3ACACAC9090906E6E6E000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF00FFFF00FF6A40036A40036A40
          036A40036A4003FF00FFFF00FFFF00FFFF00FF6A40036A40036A40036A40036A
          4003FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6A40036A40036A4003FF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFFFFFF5B5B5B5B5B5B747474949494B7B7B7D6D6D6F1
          F1F1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1F1F1D6D6D6B7
          B7B79494947474745B5B5B5B5B5BFFFFFFFFFFFF3E3E3E232323434343656564
          909090B7B7B7D6D6D6EDEDEDF9F9F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F9F9EDEDED
          D6D6D6B7B7B79090906565644343432323233E3E3EFFFFFFFFFFFFFFFFFF3E3E
          3E232323434343656564909090B7B7B7D6D6D6EDEDEDF9F9F9FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFF9F9F9EDEDEDD6D6D6B7B7B79090906565644343432323233E3E3E8A
          8A8AA5A5A5BBBBBBD1D1D1E5E5E5F4F4F4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFF4F4F4E5E5E5D1D1D1BBBBBBA5A5A58A8A8A4343435656566E6E6E909090
          A5A5A5BDBDBDD1D1D1E1E1E1EDEDEDF6F6F6FDFDFDFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFDFDFDF6F6F6EDEDEDE1E1E1D1D1D1BDBDBDA5A5A5909090
          6E6E6E5656560000002929293B3B3B5656566E6E6E909090ACACACC3C3C3D6D6
          D6E9E9E9F3F3F3FCFBFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFCFBFAF3F3F3E9E9E9D6D6D6C3C3C3ACACAC9090906E6E6E000000FFFF
          FF000000000000000000000000000000000000000000000000000000000000FF
          FFFFFF00FFFF00FFFF00FF6A40036A40036A4003FF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FF6A40036A40036A4003FF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FF6A4003FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFFFFFF5B5B5B
          5959596E6E6E909090B2B2B2D1D1D1F1F1F1FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFF1F1F1D1D1D1B2B2B29090906E6E6E5959595B5B5BFFFF
          FFFFFFFF3E3E3E2121213B3B3B5E5E5E8A8A8AB2B2B2D1D1D1E5E5E5F9F9F9FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFF9F9F9E5E5E5D1D1D1B2B2B28A8A8A5E5E5E3B3B3B21
          21213E3E3EFFFFFFFFFFFFFFFFFF3E3E3E2121213B3B3B5E5E5E8A8A8AB2B2B2
          D1D1D1E5E5E5F9F9F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F9F9E5E5E5D1D1D1B2B2B2
          8A8A8A5E5E5E3B3B3B2121213E3E3E8A8A8AA5A5A5BDBDBDD1D1D1E5E5E5F6F6
          F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F6F6E5E5E5D1D1D1BDBDBDA5A5
          A58A8A8A434343595959747474909090A5A5A5BDBDBDD1D1D1E1E1E1EDEDEDF6
          F6F6FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDF6F6F6EDED
          EDE1E1E1D1D1D1BDBDBDA5A5A59090907474745959590000002929293B3B3B56
          56566E6E6E909090ACACACC3C3C3D6D6D6E9E9E9F4F4F4FDFDFDFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDF4F4F4E9E9E9D6D6D6C3
          C3C3ACACAC9090906E6E6E000000FF00FFA16D28A16D28A16D28A16D28A16D28
          A16D28A16D28A16D28A16D28A16D28FF00FFFF00FFFF00FFFF00FFFF00FF6A40
          03FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6A4003FF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFFFFFF5B5B5B515151676767848484ACACACCACACAE5
          E5E5F9F9F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F9F9E5E5E5CACACAAC
          ACAC8484846767675151515B5B5BFFFFFFFFFFFF3E3E3E212121383838565656
          848484A5A5A5C3C3C3DBDBDBF1F1F1F9F9F9FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F9F9F1F1F1DBDBDB
          C3C3C3A5A5A58484845656563838382121213E3E3EFFFFFFFFFFFFFFFFFF3E3E
          3E212121383838565656848484A5A5A5C3C3C3DBDBDBF1F1F1F9F9F9FFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFF9F9F9F1F1F1DBDBDBC3C3C3A5A5A58484845656563838382121213E3E3E8A
          8A8AA5A5A5BDBDBDD1D1D1E5E5E5F6F6F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFF6F6F6E5E5E5D1D1D1BDBDBDA5A5A58A8A8A434343595959747474909090
          A5A5A5BDBDBDD1D1D1E1E1E1EDEDEDF6F6F6FDFDFDFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFDFDFDF6F6F6EDEDEDE1E1E1D1D1D1BDBDBDA5A5A5909090
          7474745959590000002929293B3B3B5656566E6E6E909090ACACACC3C3C3D6D6
          D6E9E9E9F4F4F4FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFDFDFDF4F4F4E9E9E9D6D6D6C3C3C3ACACAC9090906E6E6E000000A16D
          28FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA1
          6D28FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FF6A4003FF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FF6A4003FF00FFFF00FFFF00FFFF00FFFFFFFF5E5E5E
          5151516565647B7B7B999999BBBBBBD6D6D6F1F1F1FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFF1F1F1D6D6D6BBBBBB9999997B7B7B6565645151515E5E5EFFFF
          FFFFFFFF3E3E3E1919192D2D2D4C4C4C747474949494B2B2B2CACACAE1E1E1ED
          EDEDF6F6F6F9F9F9F9F9F9F9F9F9FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDF9F9F9F9F9
          F9F9F9F9F6F6F6EDEDEDE1E1E1CACACAB2B2B29494947474744C4C4C2D2D2D19
          19193E3E3EFFFFFFFFFFFFFFFFFF3E3E3E1919192D2D2D4C4C4C747474949494
          B2B2B2CACACAE1E1E1EDEDEDF6F6F6F9F9F9F9F9F9F9F9F9FDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDF9F9F9F9F9F9F9F9F9F6F6F6EDEDEDE1E1E1CACACAB2B2B2949494
          7474744C4C4C2D2D2D1919193E3E3E8A8A8AA5A5A5BDBDBDD1D1D1E5E5E5F6F6
          F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F6F6E5E5E5D1D1D1BDBDBDA5A5
          A58A8A8A434343595959747474909090A5A5A5BDBDBDD1D1D1E1E1E1EDEDEDF6
          F6F6FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDF6F6F6EDED
          EDE1E1E1D1D1D1BDBDBDA5A5A59090907474745959590000002929293B3B3B56
          56566E6E6E909090ACACACC3C3C3D6D6D6E9E9E9F4F4F4FDFDFDFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDF4F4F4E9E9E9D6D6D6C3
          C3C3ACACAC9090906E6E6E000000A16D28FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA16D28FF00FF6A4003FF00FFFF00FFFF00
          FFFF00FFFF00FF6A4003FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6A40036A
          4003FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6A4003FF00FFFF00FFFF00FF
          FF00FFFF00FF6A4003FF00FFFF00FFFF00FFFF00FFFF00FF6A40036A4003FF00
          FFFF00FFFF00FFFF00FFFFFFFF7B7B7B5656565B5B5B6E6E6E909090ACACACC3
          C3C3DBDBDBEDEDEDF9F9F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F9F9EDEDEDDBDBDBC3C3C3ACACAC90
          90906E6E6E5B5B5B5656567B7B7BFFFFFFFFFFFF5E5E5E2D2D2D2626263E3E3E
          5E5E5E8484849F9F9FB7B7B7CACACADBDBDBE5E5E5E9E9E9EDEDEDEDEDEDEDED
          EDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDED
          EDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDE9E9E9E5E5E5DBDBDBCACACAB7B7B7
          9F9F9F8484845E5E5E3E3E3E2626262D2D2D5E5E5EFFFFFFFFFFFFFFFFFF5E5E
          5E2D2D2D2626263E3E3E5E5E5E8484849F9F9FB7B7B7CACACADBDBDBE5E5E5E9
          E9E9EDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDED
          EDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDE9E9E9E5E5
          E5DBDBDBCACACAB7B7B79F9F9F8484845E5E5E3E3E3E2626262D2D2D5E5E5E8A
          8A8AA5A5A5BDBDBDD1D1D1E5E5E5F6F6F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFF6F6F6E5E5E5D1D1D1BDBDBDA5A5A58A8A8A434343595959747474909090
          A5A5A5BDBDBDD1D1D1E1E1E1EDEDEDF6F6F6FDFDFDFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFDFDFDF6F6F6EDEDEDE1E1E1D1D1D1BDBDBDA5A5A5909090
          7474745959590000002929293B3B3B5656566E6E6E909090ACACACC3C3C3D6D6
          D6E9E9E9F4F4F4FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFDFDFDF4F4F4E9E9E9D6D6D6C3C3C3ACACAC9090906E6E6E000000A16D
          28FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA1
          6D28FF00FF6A40036A4003FF00FFFF00FFFF00FFFF00FF6A40036A4003FF00FF
          FF00FFFF00FFFF00FFFF00FF6A40036A40036A4003FF00FFFF00FFFF00FFFF00
          FF6A40036A4003FF00FFFF00FFFF00FFFF00FF6A40036A4003FF00FFFF00FFFF
          00FFFF00FF6A40036A40036A4003FF00FFFF00FFFF00FFFF00FFFFFFFFFDFDFD
          5E5E5E5151516565647B7B7B949494ACACACC3C3C3D1D1D1E1E1E1E9E9E9F1F1
          F1F1F1F1F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4
          F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F1F1F1F1F1F1E9E9E9
          E1E1E1D1D1D1C3C3C3ACACAC9494947B7B7B6565645151515E5E5EFDFDFDFFFF
          FFFFFFFFFDFDFD3E3E3E1919192D2D2D464646676767848484999999B2B2B2C3
          C3C3CACACAD1D1D1D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6
          D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6
          D6D1D1D1CACACAC3C3C3B2B2B29999998484846767674646462D2D2D1919193E
          3E3EFDFDFDFFFFFFFFFFFFFFFFFFFDFDFD3E3E3E1919192D2D2D464646676767
          848484999999B2B2B2C3C3C3CACACAD1D1D1D6D6D6D6D6D6D6D6D6D6D6D6D6D6
          D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6
          D6D6D6D6D6D6D6D6D6D6D6D1D1D1CACACAC3C3C3B2B2B2999999848484676767
          4646462D2D2D1919193E3E3EFDFDFD8A8A8AA5A5A5BDBDBDD1D1D1E5E5E5F6F6
          F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F6F6E5E5E5D1D1D1BDBDBDA5A5
          A58A8A8A434343595959747474909090A5A5A5BDBDBDD1D1D1E1E1E1EDEDEDF6
          F6F6FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDF6F6F6EDED
          EDE1E1E1D1D1D1BDBDBDA5A5A59090907474745959590000002929293B3B3B56
          56566E6E6E909090ACACACC3C3C3D6D6D6E9E9E9F3F3F3FCFBFAFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFBFAF3F3F3E9E9E9D6D6D6C3
          C3C3ACACAC9090906E6E6E000000A16D28FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA16D28FF00FF6A40036A40036A4003FF00
          FFFF00FFFF00FF6A40036A40036A4003FF00FFFF00FFFF00FFFF00FF6A40036A
          40036A40036A4003FF00FFFF00FF6A40036A40036A4003FF00FFFF00FFFF00FF
          6A40036A40036A4003FF00FFFF00FFFF00FF6A40036A40036A40036A4003FF00
          FFFF00FFFF00FFFF00FFFFFFFFFFFFFF7B7B7B5656565959596767677B7B7B94
          9494A5A5A5B2B2B2C3C3C3CACACAD1D1D1D6D6D6DBDBDBDBDBDBDBDBDBDBDBDB
          DBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDB
          DBDBDBDBDBDBDBD6D6D6D1D1D1CACACAC3C3C3B2B2B2A5A5A59494947B7B7B67
          67675959595656567B7B7BFFFFFFFFFFFFFFFFFFFFFFFF6262622D2D2D212121
          3535354C4C4C6565647B7B7B9090909F9F9FACACACB2B2B2B2B2B2B7B7B7B8B8
          B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8
          B8B8B8B8B8B8B8B8B8B8B8B7B7B7B2B2B2B2B2B2ACACAC9F9F9F9090907B7B7B
          6565644C4C4C3535352121212D2D2D626262FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF6262622D2D2D2121213535354C4C4C6565647B7B7B9090909F9F9FACACACB2
          B2B2B2B2B2B7B7B7B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8
          B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B8B7B7B7B2B2B2B2B2B2ACAC
          AC9F9F9F9090907B7B7B6565644C4C4C3535352121212D2D2D626262FFFFFF8A
          8A8AA5A5A5BDBDBDD1D1D1E5E5E5F6F6F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFF6F6F6E5E5E5D1D1D1BDBDBDA5A5A58A8A8A434343595959747474909090
          A5A5A5BDBDBDD1D1D1E1E1E1EDEDEDF6F6F6FDFDFDFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFDFDFDF6F6F6EDEDEDE1E1E1D1D1D1BDBDBDA5A5A5909090
          7474745959590000002929293B3B3B5656566E6E6E909090ACACACC3C3C3D6D6
          D6E9E9E9F3F3F3FCFBFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFCFBFAF3F3F3E9E9E9D6D6D6C3C3C3ACACAC9090906E6E6E000000A16D
          28FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA1
          6D28FF00FF6A40036A40036A40036A4003FF00FFFF00FF6A40036A40036A4003
          6A4003FF00FFFF00FFFF00FF6A40036A40036A4003FF00FFFF00FF6A40036A40
          036A40036A4003FF00FFFF00FF6A40036A40036A40036A4003FF00FFFF00FFFF
          00FFFF00FF6A40036A40036A4003FF00FFFF00FFFF00FFFF00FFFFFFFFFFFFFF
          FFFFFF7B7B7B5656565959596767677B7B7B8A8A8A9999999F9F9FACACACB2B2
          B2B7B7B7BBBBBBBBBBBBBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBD
          BDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBBBBBBBBBBBBB7B7B7B2B2B2ACACAC
          9F9F9F9999998A8A8A7B7B7B6767675959595656567B7B7BFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF5B5B5B2D2D2D2323233535354646465B5B5B6767677B
          7B7B8484848A8A8A909090909090949494949494949494949494949494949494
          9494949494949494949494949494949494949494949494949494949090909090
          908A8A8A8484847B7B7B6767675B5B5B4646463535352323232D2D2D5B5B5BFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5B5B5B2D2D2D232323353535
          4646465B5B5B6767677B7B7B8484848A8A8A9090909090909494949494949494
          9494949494949494949494949494949494949494949494949494949494949494
          94949494949090909090908A8A8A8484847B7B7B6767675B5B5B464646353535
          2323232D2D2D5B5B5BFFFFFFFFFFFF8A8A8AA5A5A5BBBBBBD1D1D1E5E5E5F4F4
          F4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4F4F4E5E5E5D1D1D1BBBBBBA5A5
          A58A8A8A4343435656566E6E6E909090A5A5A5BDBDBDD1D1D1E1E1E1EDEDEDF6
          F6F6FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDF6F6F6EDED
          EDE1E1E1D1D1D1BDBDBDA5A5A59090906E6E6E5656560000002626263B3B3B51
          51516E6E6E909090ACACACC3C3C3D6D6D6E5E5E5F3F3F3FCFBFAFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFBFAF3F3F3E5E5E5D6D6D6C3
          C3C3ACACAC9090906E6E6E000000A16D28FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA16D28FF00FF6A40036A40036A4003FF00
          FFFF00FFFF00FF6A40036A40036A4003FF00FFFF00FFFF00FFFF00FF6A40036A
          4003FF00FFFF00FFFF00FFFF00FF6A40036A40036A4003FF00FFFF00FFFF00FF
          6A40036A40036A4003FF00FFFF00FFFF00FFFF00FFFF00FF6A40036A4003FF00
          FFFF00FFFF00FFFF00FFFFFFFFFFFFFFFFFFFFFFFFFF7B7B7B56565656565662
          62626E6E6E7B7B7B8484848A8A8A909090909090949494949494949494949494
          9494949494949494949494949494949494949494949494949494949494949494
          949494949494949090909090908A8A8A8484847B7B7B6E6E6E62626256565656
          56567B7B7BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5B5B5B
          2D2D2D2121212D2D2D3A3A3A4646465151515B5B5B5E5E5E6565646767676767
          6767676767676767676767676767676767676767676767676767676767676767
          67676767676767676767676767676565645E5E5E5B5B5B5151514646463A3A3A
          2D2D2D2121212D2D2D5B5B5BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF5B5B5B2D2D2D2121212D2D2D3A3A3A4646465151515B5B5B5E
          5E5E656564676767676767676767676767676767676767676767676767676767
          6767676767676767676767676767676767676767676767676565645E5E5E5B5B
          5B5151514646463A3A3A2D2D2D2121212D2D2D5B5B5BFFFFFFFFFFFFFFFFFF84
          84849F9F9FB7B7B7CACACAE1E1E1F1F1F1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFF1F1F1E1E1E1CACACAB7B7B79F9F9F8484843E3E3E5656566E6E6E8A8A8A
          A5A5A5B8B8B8CACACADBDBDBE9E9E9F3F3F3F9F9F9FDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDF9F9F9F3F3F3E9E9E9DBDBDBCACACAB8B8B8A5A5A58A8A8A
          6E6E6E5656560000002626263A3A3A5151516E6E6E8A8A8AA5A5A5BDBDBDD1D1
          D1E1E1E1EDEDEDF6F6F6FCFBFAFCFBFAFCFBFAFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFCFBFAFCFBFA
          FCFBFAF6F6F6EDEDEDE1E1E1D1D1D1BDBDBDA5A5A58A8A8A6E6E6E000000A16D
          28FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA1
          6D28FF00FF6A40036A4003FF00FFFF00FFFF00FFFF00FF6A40036A4003FF00FF
          FF00FFFF00FFFF00FFFF00FF6A4003FF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FF6A40036A4003FF00FFFF00FFFF00FFFF00FF6A40036A4003FF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FF6A4003FF00FFFF00FFFF00FFFF00FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFF7B7B7B5151515151515959595E5E5E6767676E6E6E6E6E
          6E74747474747474747474747474747474747474747474747474747474747474
          74747474747474747474747474747474747474747474747474746E6E6E6E6E6E
          6767675E5E5E5959595151515151517B7B7BFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5B5B5B29292919191921212129292935
          35353A3A3A3B3B3B434343434343434343434343434343434343434343434343
          4343434343434343434343434343434343434343434343434343434343434343
          433B3B3B3A3A3A3535352929292121211919192929295B5B5BFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5B5B5B292929
          1919192121212929293535353A3A3A3B3B3B4343434343434343434343434343
          4343434343434343434343434343434343434343434343434343434343434343
          43434343434343434343433B3B3B3A3A3A353535292929212121191919292929
          5B5B5BFFFFFFFFFFFFFFFFFFFFFFFF8484849F9F9FB2B2B2CACACADBDBDBEDED
          EDF9F9F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F9F9EDEDEDDBDBDBCACACAB2B2B29F9F
          9F8484843E3E3E5151516767678484849F9F9FB2B2B2C3C3C3D6D6D6E1E1E1ED
          EDEDF3F3F3F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6
          F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F3F3F3EDEDEDE1E1
          E1D6D6D6C3C3C3B2B2B29F9F9F8484846767675151510000002323233535354C
          4C4C6767678484849F9F9FB7B7B7CACACADBDBDBE5E5E5EDEDEDF3F3F3F3F3F3
          F3F3F3F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4
          F4F4F4F4F4F4F4F4F4F4F3F3F3F3F3F3F3F3F3EDEDEDE5E5E5DBDBDBCACACAB7
          B7B79F9F9F848484676767000000A16D28FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA16D28FF00FF6A4003FF00FFFF00FFFF00
          FFFF00FFFF00FF6A4003FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6A4003FF00FFFF00FFFF00FF
          FF00FFFF00FF6A4003FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7B7B7B6E
          6E6E6565645656565151515151515959595B5B5B5B5B5B5B5B5B5B5B5B5B5B5B
          5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B5B
          5B5B5B5B5B5B5B5B5B5B5959595151515151515656566565646E6E6E7B7B7BFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFF6262624C4C4C4646462D2D2D1919192121212323232323232626262626
          2626262626262626262626262626262626262626262626262626262626262626
          26262626262626262626262626262323232323232121211919192D2D2D464646
          4C4C4C626262FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFF6262624C4C4C4646462D2D2D19191921212123
          2323232323262626262626262626262626262626262626262626262626262626
          2626262626262626262626262626262626262626262626262323232323232121
          211919192D2D2D4646464C4C4C626262FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7B
          7B7B999999ACACACC3C3C3D6D6D6E5E5E5F3F3F3FFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3
          F3F3E5E5E5D6D6D6C3C3C3ACACAC9999997B7B7B3B3B3B4C4C4C6565647B7B7B
          949494ACACACBDBDBDCACACADBDBDBE1E1E1E9E9E9EDEDEDEDEDEDEDEDEDEDED
          EDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDEDED
          EDEDEDEDEDEDEDEDE9E9E9E1E1E1DBDBDBCACACABDBDBDACACAC9494947B7B7B
          6565644C4C4C0000002121213535354646466262627B7B7B949494ACACACBDBD
          BDD1D1D1DBDBDBE1E1E1E5E5E5E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9
          E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9E9
          E5E5E5E1E1E1DBDBDBD1D1D1BDBDBDACACAC9494947B7B7B626262000000A16D
          28FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA1
          6D28FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4343435151514343
          43FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF434343515151434343FFFFFFFF
          FFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFF00FFFF00FFFF00FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7B7B7B6E6E6E6E6E6E6E6E
          6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E
          6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E
          6E6E6E7B7B7BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6262624C
          4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C
          4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C
          4C4C4C4C4C4C4C4C4C4C626262FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFF6262624C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C
          4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C
          4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C4C626262FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7B7B7B909090A5A5A5BBBBBBCACACADBDB
          DBE9E9E9F6F6F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFF6F6F6E9E9E9DBDBDBCACACABBBBBBA5A5A59090
          907B7B7B3838384C4C4C5E5E5E7474749090909F9F9FB2B2B2C3C3C3CACACAD6
          D6D6DBDBDBE1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1
          E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1DBDBDBD6D6D6CACA
          CAC3C3C3B2B2B29F9F9F9090907474745E5E5E4C4C4C0000002121212D2D2D43
          43435656567474748A8A8A9F9F9FB2B2B2BDBDBDCACACAD1D1D1D6D6D6D6D6D6
          D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6
          D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D1D1D1CACACABDBDBDB2B2B29F
          9F9F8A8A8A747474565656000000A16D28FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA16D28FF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF3838385E5E5E909090ACACAC9090905E5E5E383838FFFFFFFFFFFF383838
          5E5E5E909090ACACAC9090905E5E5E383838FFFFFFFF00FFFFFFFFFFFFFFFFFF
          FFFF00FFFF00FFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF74
          74748A8A8A9F9F9FB2B2B2C3C3C3D1D1D1E1E1E1E9E9E9F3F3F3F9F9F9FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F9F9F3F3F3E9E9E9E1
          E1E1D1D1D1C3C3C3B2B2B29F9F9F8A8A8A7474743535354343435656566E6E6E
          848484949494A5A5A5B2B2B2BDBDBDC3C3C3CACACAD1D1D1D1D1D1D1D1D1D1D1
          D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1
          D1D1D1D1D1D1D1D1CACACAC3C3C3BDBDBDB2B2B2A5A5A59494948484846E6E6E
          5656564343430000001919192929293A3A3A4C4C4C6565647B7B7B9090909F9F
          9FACACACB7B7B7BDBDBDC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
          C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
          C3C3C3BDBDBDB7B7B7ACACAC9F9F9F9090907B7B7B6565644C4C4C000000FF00
          FFA16D28A16D28A16D28A16D28A16D28A16D28A16D28A16D28A16D28A16D28FF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5E5E5EACACACE5E5E5F1F1F1E5E5
          E5ACACAC5E5E5EFFFFFFFFFFFF5E5E5EACACACE5E5E5F1F1F1E5E5E5ACACAC5E
          5E5EFFFFFFFF00FF848484848484848484FF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC600B376004762002D62002D6200
          2D62002D62002D62002D62002D62002D62002D62002D62002D62002D62002D62
          002D62002D62002D62002D62002D62002D62002D62002D62002D62002D62002D
          62002D760047C600B3FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC600B376004762
          002D62002D62002D62002D62002D62002D62002D62002D62002D62002D62002D
          62002D62002D62002D62002D62002D62002D62002D62002D62002D62002D6200
          2D62002D62002D62002D760047C600B3FF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFB200B24C004C2D002D2D002D2D002D2D002D2D002D2D002D2D002D2D00
          2D2D002D2D002D2D002D2D002D2D002D2D002D2D002D2D002D2D002D2D002D2D
          002D2D002D2D002D2D002D2D002D2D002D2D002D4C004CB200B2FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FF6E6E6E7B7B7B949494A5A5A5B7B7B7C3C3
          C3D1D1D1DBDBDBE5E5E5EDEDEDF1F1F1F4F4F4F6F6F6F6F6F6F6F6F6F6F6F6F6
          F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6
          F4F4F4F1F1F1EDEDEDE5E5E5DBDBDBD1D1D1C3C3C3B7B7B7A5A5A59494947B7B
          7B6E6E6E2D2D2D3B3B3B4C4C4C6262627474748484849494949F9F9FACACACB2
          B2B2B8B8B8BDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBD
          BDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDB8B8B8B2B2B2ACAC
          AC9F9F9F9494948484847474746262624C4C4C3B3B3B00000019191923232335
          35354343435656566767677B7B7B8A8A8A9494949F9F9FA5A5A5ACACACACACAC
          ACACACACACACACACACACACACACACACACACACACACACACACACACACACACACACACAC
          ACACACACACACACACACACACACACACACACACACACA5A5A59F9F9F9494948A8A8A7B
          7B7B676767565656434343000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF43
          4343909090E5E5E5FFFFFFFFFFFFFFFFFFE5E5E5909090434343434343909090
          E5E5E5FFFFFFFFFFFFFFFFFFE5E5E5909090434343FF00FF848484FFFFFF8484
          84FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC600B376004762
          002D62002D410200410200410200410200410200410200410200410200410200
          4102004102004102004102004102004102004102004102004102004102004102
          0041020041020041020041020041020041020041020062002D62002D760047C6
          00B3FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          C600B376004762002D62002D4102004102004102004102004102004102004102
          0041020041020041020041020041020041020041020041020041020041020041
          020041020041020041020041020041020041020041020041020041020062002D
          62002D760047C600B3FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFB200B24C004C2D002D2D002D00000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000002D002D2D002D4C004CB200B2FF00FFFF00FFFF00FFFF00FF62
          62627474748A8A8A999999A5A5A5B7B7B7C3C3C3CACACAD6D6D6DBDBDBE1E1E1
          E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5
          E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E5E1E1E1DBDBDBD6D6D6CACACAC3
          C3C3B7B7B7A5A5A59999998A8A8A747474626262262626353535434343565656
          6565647474748484849090909494949F9F9FA5A5A5A5A5A5A5A5A5A5A5A5A5A5
          A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5
          A5A5A5A5A5A5A5A5A5A5A59F9F9F949494909090848484747474656564565656
          4343433535350000000F0F0F1919192626263535354646465656566565647474
          747B7B7B8484848A8A8A90909090909090909090909090909090909090909090
          9090909090909090909090909090909090909090909090909090909090909090
          9090908A8A8A8484847B7B7B747474656564565656464646353535000000FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF515151ACACACF1F1F1FFFFFFFFFFFFFFFF
          FFF1F1F1ACACAC515151515151ACACACF1F1F1FFFFFFFFFFFFFFFFFFF1F1F1AC
          ACAC515151FF00FF848484FFFFFF848484FF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFC600B37600474102004102004102004102004102004102004102
          0041020041020041020041020041020041020041020041020041020041020041
          0200410200410200410200410200410200410200410200410200410200410200
          410200410200410200410200410200760047C600B3FF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFC600B376004741020041020041020041020041
          0200410200410200410200410200410200410200410200410200410200410200
          4102004102004102004102004102004102004102004102004102004102004102
          00410200410200410200410200410200410200410200760047C600B3FF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB200B2440044000000
          0000000000006F492987603E87603E87603E87603E87603E87603E87603E8760
          3E87603E87603E87603E87603E87603E87603E87603E87603E87603E87603E87
          603E87603E87603E87603E87603E87603E87603E6F4929000000000000000000
          440044B200B2FF00FFFF00FFFF00FFFFFFFF6767677B7B7B8A8A8A999999A5A5
          A5B2B2B2BBBBBBC3C3C3CACACACACACAD1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1
          D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1
          D1D1D1CACACACACACAC3C3C3BBBBBBB2B2B2A5A5A59999998A8A8A7B7B7B6767
          67FFFFFFFFFFFF2929293838384646465656566262626E6E6E7474747B7B7B84
          84848A8A8A909090909090909090909090909090909090909090909090909090
          9090909090909090909090909090909090909090909090908A8A8A8484847B7B
          7B7474746E6E6E626262565656464646383838292929FFFFFFFFFFFF19191921
          21212929293535354343434C4C4C5656566262626767676E6E6E6E6E6E6E6E6E
          6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E
          6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6767676262625656564C
          4C4C434343353535292929FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF43
          4343909090E5E5E5FFFFFFFFFFFFFFFFFFE5E5E5909090434343434343909090
          E5E5E5FFFFFFFFFFFFFFFFFFE5E5E5909090434343FF00FF848484FFFFFF8484
          84FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFDB00D476004741020041020041
          0200410200572624572624633326633326633326633326633326633326633326
          6333266333266333266333266333266333266333266333266333266333266333
          2663332663332663332663332663332657262457262441020041020041020041
          0200760047C600B3FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFDB00D4760047
          4102004102004102004102006F492987603E87603E87603E87603E87603E8760
          3E87603E87603E87603E87603E87603E87603E87603E87603E87603E87603E87
          603E87603E87603E87603E87603E87603E87603E87603E87603E6F4929410200
          410200410200410200760047C600B3FF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFDB00D44400440000006F492987603E987145D2B689DBC29DE4D3AFE7
          D7B7EDE3CAEDE3CAECE6D3F3EBD7F3EBD7F3EBD7F3EBD7F3EBD7F3EBD7F3EBD7
          F3EBD7F3EBD7F3EBD7F3EBD7F3EBD7F3EBD7F1EBCDEDE3CAEDE3CAE7D7B7E4D3
          AFDBC29DD2B68998714587603E6F4929000000440044B200B2FF00FFFF00FFFF
          FFFF5E5E5E6E6E6E7B7B7B8A8A8A9494949F9F9FA5A5A5ACACACB2B2B2B7B7B7
          BBBBBBBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBD
          BDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBDBBBBBBB7B7B7B2B2B2ACACACA5A5A59F
          9F9F9494948A8A8A7B7B7B6E6E6E5E5E5EFFFFFFFFFFFF2121212D2D2D383838
          4343434C4C4C5656565E5E5E6565646767676E6E6E6E6E6E7474747474747474
          7474747474747474747474747474747474747474747474747474747474747474
          74747474746E6E6E6E6E6E6767676565645E5E5E5656564C4C4C434343383838
          2D2D2D212121FFFFFFFFFFFF0F0F0F1919192121212626263535353A3A3A4343
          434646464C4C4C51515151515156565656565656565656565656565656565656
          5656565656565656565656565656565656565656565656565656565656565656
          5151515151514C4C4C4646464343433A3A3A353535262626212121FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFF000000000000FFFFFFFFFFFF000000000000FF
          FFFFFFFFFF000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5E5E5EACACACE5E5E5F1F1F1E5E5
          E5ACACAC5E5E5EFFFFFFFFFFFF5E5E5EACACACE5E5E5F1F1F1E5E5E5ACACAC5E
          5E5EFFFFFFFF00FF848484848484848484FF00FFFF00FFFF00FFFF00FFFF00FF
          C600B37600474102004102005726246333266F4929987145B28957B6956DBDA2
          7EC7AE8ACAB290CFB894CFB894CFB894CFB894CFB894CFB894CFB894CFB894CF
          B894CFB894CFB894CFB894CFB894CFB894CFB894CAB290C7AE8ABC9D79B6956D
          B289579871456F4929633326572624410200410200760047C600B3FF00FFFF00
          FFFF00FFFF00FFC600B37600474102004102006F492987603E987145D2B689DB
          C29DE4D3AFE7D7B7EDE3CAEDE3CAECE6D3F3EBD7F3EBD7F3EBD7F3EBD7F3EBD7
          F3EBD7F3EBD7F3EBD7F3EBD7F3EBD7F3EBD7F3EBD7F3EBD7F1EBCDEDE3CAEDE3
          CAE7D7B7E4D3AFDBC29DD2B68998714587603E6F4929410200410200760047C6
          00B3FF00FFFF00FFFF00FFFF00FFFF00FFB200B244004400000087603ECCAE7E
          E4D3AFF3EBD7FDFAF6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFAF6F3EBD7E4D3AFCCAE7E
          87603E000000440044B200B2FF00FFFFFFFFFFFFFF5E5E5E6767677474747B7B
          7B8A8A8A9090909999999F9F9F9F9F9FA5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5
          A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5A5
          A5A5A59F9F9F9F9F9F9999999090908A8A8A7B7B7B7474746767675E5E5EFFFF
          FFFFFFFFFFFFFFFFFFFF2121212929293535353B3B3B4343434C4C4C4C4C4C51
          5151565656565656595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595656565656565151514C4C
          4C4C4C4C4343433B3B3B353535292929212121FFFFFFFFFFFFFFFFFFFFFFFF0F
          0F0F1919191919192323232929292D2D2D3535353535353A3A3A3B3B3B3B3B3B
          3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B
          3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3B3A3A3A3535353535352D2D2D29
          2929232323191919FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000
          000000FFFFFF000000000000000000FFFFFF000000000000000000FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF3838385E5E5E909090ACACAC9090905E5E5E383838FFFFFFFFFFFF383838
          5E5E5E909090ACACAC9090905E5E5E383838FFFFFFFF00FFFFFFFFFFFFFFFFFF
          FFFF00FFFF00FFFF00FFFF00FFC600B376004741020041020063332687603EB6
          956DCFB894DFD4BAE7DBC4E7DBC4EDE3CAECE6D3ECE6D3ECE6D3ECE6D3ECE6D3
          ECE6D3ECE6D3ECE6D3ECE6D3ECE6D3ECE6D3ECE6D3ECE6D3ECE6D3ECE6D3ECE6
          D3ECE6D3ECE6D3ECE6D3EDE3CAE7DBC4E7DBC4DFD4BACFB894B6956D87603E63
          3326410200410200760047C600B3FF00FFFF00FFC600B3760047410200410200
          87603ECCAE7EE4D3AFF3EBD7FDFAF6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFAF6F3EBD7
          E4D3AFCCAE7E87603E410200410200760047C600B3FF00FFFF00FFFF00FFB200
          B2440044000000795A45BDA27EE7D7B7F5F2DFFDFDFDFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFCFBFAF5F2DFE7D7B7BC9D7987603E000000440044B200B2FF
          FFFFFFFFFFFFFFFFFFFFFF6262626E6E6E7474747B7B7B7B7B7B848484848484
          8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A
          8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8A8484848484847B7B7B7B7B7B74
          74746E6E6E626262FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          2626262D2D2D3535353838383B3B3B3E3E3E3E3E3E4343434343434343434343
          4343434343434343434343434343434343434343434343434343434343434343
          43434343434343433E3E3E3E3E3E3B3B3B3838383535352D2D2D262626FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0F0F0F1919191919192121
          2121212123232326262626262629292929292929292929292929292929292929
          2929292929292929292929292929292929292929292929292929292929292929
          262626262626232323212121212121191919FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF000000000000FFFFFFFFFFFF000000000000FFFFFFFF
          FFFF000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4343435151514343
          43FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF434343515151434343FFFFFFFF
          FFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFF00FFFF00FFFF00FFFF00FF760047
          41020041020063332687603EBC9D79D5C2A4DFD4BAEDE3CAECE6D3ECE6D3ECE6
          D3ECE6D3ECE6D3ECE6D3ECE6D3ECE6D3ECE6D3ECE6D3ECE6D3ECE6D3ECE6D3EC
          E6D3ECE6D3ECE6D3ECE6D3ECE6D3ECE6D3ECE6D3ECE6D3ECE6D3ECE6D3ECE6D3
          ECE6D3EDE3CADFD4BAD5C2A4BC9D7987603E633326410200410200760047FF00
          FFFF00FF76004741020041020087603EBDA27EE7D7B7F5F2DFFDFDFDFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFCFBFAF5F2DFE7D7B7BC9D7987603E41020041
          0200760047FF00FFFF00FFFF00FF4C004C0000007A5636B6956DDFCCA6F3EBD7
          FCFBFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFAF6F3EBD7
          DFCCA6C4A3737A56360000004C004CFF00FFFF00FFFF00FFFF00FF7A56367A56
          366F49296F49296F49296F49296F49296F49296F49296F49296F49296F49296F
          49296F49296F49296F49296F49296F49296F49296F49296F49296F49296F4929
          6F49296F49296F49296F49296F49296F49296F49296D411DFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FF6D411D6D411D6D411D6D411D6D411D6D
          411D6D411D6D411D6D411D6D411D6D411D6D411D6D411D6D411D6D411D6D411D
          6D411D6D411D6D411D6D411D6D411D6D411D6D411D6D411D6D411D6D411D6D41
          1D6D411D6D411D6D411D6D411DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF05FF6D411D6D411D6D411D6D411D6D411D6D411D6D411D6D411D6D411D
          6D411D6D411D6D411D6D411D6D411D6D411D6D411D6D411D6D411D6D411D6D41
          1D6D411D6D411D6D411D6D411D6D411D6D411D6D411D6D411D6D411D6D411D6D
          411DFF00FFFF00FFFF00FFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFF00FFFF00FFFF00FF563A25563A25563A25FF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FF563A25563A25563A25FF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFFFFFFFFFFFFFFFFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FF41020041020063332687603EB6956DD1BE9CDF
          D4BAEDE3CAECE6D3ECE6D3ECE6D3ECE6D3ECE6D3ECE6D3ECE6D3ECE6D3ECE6D3
          ECE6D3ECE6D3ECE6D3ECE6D3ECE6D3ECE6D3ECE6D3ECE6D3ECE6D3ECE6D3ECE6
          D3ECE6D3ECE6D3ECE6D3ECE6D3ECE6D3ECE6D3ECE6D3EDE3CADFD4BAD1BE9CB6
          956D87603E633326410200410200FF00FFFF00FF41020041020087603EB6956D
          DFCCA6F3EBD7FCFBFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FDFAF6F3EBD7DFCCA6C4A37387603E410200410200FF00FFFF00FFFF00FF0C00
          0C6F4929B6956DD2B689E7D7B7F3EBD7FBF9F3FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFAF7EFF3EBD7E7D7B7DBC29DB6956D6F49290C000CFF
          00FFFF00FF98714587603EA78066BC9D79BC9D79BC9D79BC9D79BC9D79BC9D79
          BC9D79BDA27EBDA27EBDA27EBDA27EBDA27EBDA27EBDA27EBDA27EBDA27EBDA2
          7EBDA27EBDA27EBDA27EBDA27EBDA27EBDA27EBDA27EBDA27EBDA27EBDA27EBC
          9D79B6956D9871456D411D6D411DFF00FFFF00FFFF00FFFF00FF6D411D6D411D
          987145D0B59BDFD4BAECE6D3EBE2D9F1E8DFF1E8DFF1E8DFF2EDE5F2EDE5F2ED
          E5F2EDE5F2EDE5F2EDE5F2EDE5F2EDE5F2EDE5F2EDE5F2EDE5F2EDE5F2EDE5F2
          EDE5F2EDE5F2EDE5F2EDE5F5F0EAF5F0EAF5F0EAF7F3EEF5F0EAE7DBC46D411D
          6D411DFF00FFFF00FFFF00FFFF00FF6D411D6D411D61442F82675195735C9573
          5C9A7F6A9A7F6A9A7F6A9A7F6A9A7F6A9A7F6A9A7F6A9A7F6A9A7F6A9A7F6A9A
          7F6A9A7F6A9A7F6A9A7F6A9A7F6A9A7F6A9A7F6A9A7F6A9A7F6A9A7F6A9A7F6A
          9A7F6A9A7F6A9A7F6A9A7F6A9A7F6A95735C6D411D6D411DFF00FFFF00FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000FF
          FFFFFFFFFF000000000000FFFFFFFFFFFFFFFFFFFF00FFB39785885B48795A45
          795A45795A45563A25563A25FF00FFFF00FFB39785885B48795A45795A45795A
          45563A25563A25FF00FFFF00FFFFFFFF9A7F6A9A7F6A9A7F6A9A7F6A9A7F6AFF
          FFFFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF410200
          57262487603E987145BC9D79D1BE9CDFD4BAE7DBC4EDE3CAECE6D3ECE6D3ECE6
          D3ECE6D3ECE6D3ECE6D3ECE6D3ECE6D3ECE6D3ECE6D3ECE6D3ECE6D3ECE6D3EC
          E6D3ECE6D3ECE6D3ECE6D3ECE6D3ECE6D3ECE6D3ECE6D3ECE6D3ECE6D3ECE6D3
          ECE6D3EDE3CAE7DBC4DACDAFD1BE9CBC9D79A67E5187603E572624410200FF00
          FFFF00FF4102006F4929B6956DD2B689E7D7B7F3EBD7FBF9F3FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAF7EFF3EBD7E7D7B7DBC29DB6956D6F
          4929410200FF00FFFF00FFFF00FF00000087603EC4A373CFB894E4D3AFEDE3CA
          F5F2DFFAF7EFFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFAF7EFF5F2DFEDE3CA
          E4D3AFDBC29DC4A37387603E000000FF00FFA67E51987145D1BE9CE7DBC4E6DB
          CFE6DBCFE6DBCFE6DBCFE6DBCFE6DBCFE6DBCFE6DBCFE6DBCFE6DBCFE6DBCFE6
          DBCFE6DBCFE6DBCFE6DBCFE6DBCFE6DBCFE6DBCFE6DBCFE6DBCFE6DBCFE6DBCF
          E6DBCFE6DBCFE6DBCFE6DBCFE7DBC4E7DBC4DACDAFCDB99AB6956D87603E6D41
          1DFF00FFFF00FF6D411DBC9D79BC9D79CBAE91D9C6ADEBE2D9FEFEFCFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFEFEFCFCFBFAF9F7F4E6DBCF6D411DFF00FFFF00FF6D411D73
          4C38A987739A7F6AA98773B3907CB6A38FB6A38FB6A38FB6A38FB6A38FB6A38F
          B6A38FB6A38FB6A38FB6A38FB6A38FB6A38FB6A38FB6A38FB6A38FB6A38FB6A3
          8FB6A38FB6A38FB6A38FB6A38FB6A38FB6A38FB6A38FB6A38FB39785A98773A9
          87739A7F6A95735C6D411DFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFF000000000000000000FFFFFF000000000000000000FFFFFFFFFF
          FFFFFFFFFF00FFFCFBFAE6DBCFE6DBCFE6DBCFE6DBCFD5C6B9563A25FF00FFFF
          00FFFCFBFAE6DBCFE6DBCFE6DBCFE6DBCFD5C6B9563A25FF00FFFF00FF9A7F6A
          E6DBCFE6DBCFE6DBCFE6DBCFD5C6B99A7F6AFF00FFFF00FFFFFFFFFFFFFFFFFF
          FFFF00FFFF00FFFF00FFFF00FF41020063332687603EA67E51B6956DCAB290D5
          C2A4DACDAFDFD4BAE7DBC4E7DBC4E7DBC4E7DBC4E7DBC4E7DBC4E7DBC4E7DBC4
          E7DBC4E7DBC4E7DBC4E7DBC4E7DBC4E7DBC4E7DBC4E7DBC4E7DBC4E7DBC4E7DB
          C4E7DBC4E7DBC4E7DBC4E7DBC4E7DBC4E7DBC4DFD4BADACDAFD5C2A4CAB290B6
          956DA67E5187603E633326410200FF00FFFF00FF41020087603EC4A373CFB894
          E4D3AFEDE3CAF5F2DFFAF7EFFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFAF7EF
          F5F2DFEDE3CAE4D3AFDBC29DC4A37387603E410200FF00FFFF00FFFF00FF7A56
          36A67E51C4A373D2B689DFCCA6E7D7B7EDE3CAF3EBD7F7F2E6F9F6EAFAF7EFFB
          F9F3FBF9F3FDFAF6FDFAF6FDFAF6FDFAF6FDFAF6FDFAF6FDFAF6FDFAF6FDFAF6
          FDFAF6FDFAF6FDFAF6FDFAF6FDFAF6FDFAF6FDFAF6FDFAF6FBF9F3FBF9F3FAF7
          EFF9F6EAF7F2E6F3EBD7EDE3CAE7D7B7DFCCA6D2B689C4A373A67E517A5636FF
          00FFA67E51D5C2A4E6DBCFF5F0EAF9F7F4F9F7F4F9F7F4F9F7F4F9F7F4F9F7F4
          F9F7F4F9F7F4F9F7F4F9F7F4F9F7F4F9F7F4F9F7F4F9F7F4F9F7F4F9F7F4F9F7
          F4F9F7F4F9F7F4F9F7F4F9F7F4F9F7F4F9F7F4F9F7F4F9F7F4F9F7F4F9F7F4F7
          F3EEF2EDE5E6DBCFD5C2A4B6956D6D411DFF00FFFF00FF6D411DDFCEB8D0B59B
          CAA98BD5C2A4E6DBCFF8F4F1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFC
          F9F7F46D411DFF00FFFF00FF6D411D9A7F6AB6A38FB39785B39785BFA494CBC2
          B7D5C6B9D5C6B9D5C6B9D5C6B9D5C6B9D5C6B9D5C6B9D5C6B9D5C6B9D5C6B9D5
          C6B9D5C6B9D5C6B9D5C6B9D5C6B9D5C6B9D5C6B9D5C6B9D5C6B9D5C6B9D5C6B9
          D5C6B9D5C6B9CBC2B7CEB9ACC0AD9FB39785A987739A7F6A6D411DFF00FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000FFFFFFFF
          FFFF000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE6DBCFE6DBCF
          E6DBCFE6DBCFE6DBCF795A45563A25FFFFFFFFFFFFE6DBCFE6DBCFE6DBCFE6DB
          CFE6DBCF795A45563A25664833CEB9ACE6DBCFE6DBCFE6DBCFE6DBCFE6DBCF9A
          7F6AFFFFFFFF00FF6A4003FF00FFFFFFFFFF00FFFF00FFFF00FFFF00FF572624
          734C3887603E987145B28957BC9D79CAB290D1BE9CD7C8A7DACDAFDACDAFDFD4
          BADFD4BADFD4BADFD4BADFD4BADFD4BADFD4BADFD4BADFD4BADFD4BADFD4BADF
          D4BADFD4BADFD4BADFD4BADFD4BADFD4BADFD4BADFD4BADFD4BADFD4BADACDAF
          DACDAFD7C8A7D1BE9CCAB290BC9D79B2895798714587603E734C38572624FF00
          FFFF00FF7A5636A67E51C4A373D2B689DFCCA6E7D7B7EDE3CAF3EBD7F7F2E6F9
          F6EAFAF7EFFBF9F3FBF9F3FDFAF6FDFAF6FDFAF6FDFAF6FDFAF6FDFAF6FDFAF6
          FDFAF6FDFAF6FDFAF6FDFAF6FDFAF6FDFAF6FDFAF6FDFAF6FDFAF6FDFAF6FBF9
          F3FBF9F3FAF7EFF9F6EAF7F2E6F3EBD7EDE3CAE7D7B7DFCCA6D2B689C4A373A6
          7E517A5636FF00FFFF00FFFF00FF7A5636B28957C4A373D2B689DBC29DE4D3AF
          E7DBC4F1EBCDF3EBD7F5F2DFF7F2E6F9F6EAF9F6EAFAF7EFFAF7EFFAF7EFFAF7
          EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFA
          F7EFFAF7EFFAF7EFF9F6EAF9F6EAF7F2E6F5F2DFF3EBD7F1EBCDE7DBC4E4D3AF
          DBC29DD2B689C4A373B289577A5636A67E51D7C8A8DFD4BAE7DBC4F2EDE5FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFBFAF7F3EEE6DBCFCDB99A9871
          456D411D6D411DBC9D79E7DBC4D5C2A4C2A081CFB498DFCEB8F2EDE5FFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFBFAE7DBC46D411D6D411D795A45A9
          8773CAB3A3BFA494BFA494CEB9ACE6DBCFF2EDE5F2EDE5F2EDE5F2EDE5F2EDE5
          F2EDE5F2EDE5F2EDE5F2EDE5F2EDE5F2EDE5F2EDE5F2EDE5F2EDE5F2EDE5F2ED
          E5F2EDE5F2EDE5F2EDE5F2EDE5F2EDE5F2EDE5F2EDE5F2EDE5EBE2D9E6DBCFCB
          C2B7B6A38FA9877395735C6D411DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFE6DBCFE6DBCFE6DBCFE6DBCFE6DBCF795A45563A25FF
          FFFFFFFFFFE6DBCFE6DBCFE6DBCFE6DBCFE6DBCF795A45563A25664833CEB9AC
          E6DBCFE6DBCFE6DBCFE6DBCFE6DBCF9A7F6AFFFFFFFF00FF6A4003FF00FFFFFF
          FFFF00FFFF00FFFF00FFFF00FF572624734C3887603E987145A67E51B6956DC3
          AB89CFB894D1BE9CD5C2A4D7C8A7DACDAFDACDAFDACDAFDACDAFDACDAFDACDAF
          DACDAFDACDAFDACDAFDACDAFDACDAFDACDAFDACDAFDACDAFDACDAFDACDAFDACD
          AFDACDAFDACDAFDACDAFDACDAFD7C8A7D5C2A4D1BE9CCFB894C3AB89B6956DA6
          7E5198714587603E734C38572624FF00FFFF00FF7A5636B28957C4A373D2B689
          DBC29DE4D3AFE7DBC4F1EBCDF3EBD7F5F2DFF7F2E6F9F6EAF9F6EAFAF7EFFAF7
          EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFA
          F7EFFAF7EFFAF7EFFAF7EFFAF7EFF9F6EAF9F6EAF7F2E6F5F2DFF3EBD7F1EBCD
          E7DBC4E4D3AFDBC29DD2B689C4A373B289577A5636FF00FFFF00FFFF00FF7A56
          36B28957C4A373D2B689DBC29DE4D3AFE7DBC4EDE3CAF3EBD7F3EBD7F5F2DFF7
          F2E6F9F6EAFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EF
          FAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFF9F6EAF7F2E6F5F2
          DFF3EBD7F3EBD7EDE3CAE7DBC4E4D3AFDBC29DD2B689C4A373B289577A5636A6
          7E51ECE6D3E7DBC4DACDAFE6DBCFF5F0EAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFCFBFAF2EDE5DACDAFB6956D6F49296D411DC7A688E6DBCFD5C2A4
          B6956DC7A688D8C3AAECE6D3FCFBFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FEFEFCF5F0EA6D411D6D411D885B48B3907CCEB9ACC7AA9ABFA494D5C6B9EBE2
          D9FCFBFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFEFCFBFAF8F4F1EBE2D9CBC2B7B6A38FA987736D411DFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFF000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE6DBCFE6DBCF
          E6DBCFE6DBCFE6DBCF795A45563A25FFFFFFFFFFFFE6DBCFE6DBCFE6DBCFE6DB
          CFE6DBCF795A45563A25664833CEB9ACE6DBCFE6DBCFE6DBCFE6DBCFE6DBCF9A
          7F6AFFFFFFFF00FF6A4003FF00FFFFFFFFFF00FFFF00FFFF00FFFF00FF572624
          734C3887603E987145A67E51B6956DC3A983CDB691D1BE9CD1BE9CD5C2A4D7C8
          A8DACDAFDACDAFDACDAFDACDAFDACDAFDACDAFDACDAFDACDAFDACDAFDACDAFDA
          CDAFDACDAFDACDAFDACDAFDACDAFDACDAFDACDAFDACDAFDACDAFD7C8A8D5C2A4
          D1BE9CD1BE9CCDB691C3A983B6956DA67E5198714587603E734C38572624FF00
          FFFF00FF7A5636B28957C4A373D2B689DBC29DE4D3AFE7DBC4EDE3CAF3EBD7F3
          EBD7F5F2DFF7F2E6F9F6EAFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EF
          FAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFF9F6
          EAF7F2E6F5F2DFF3EBD7F3EBD7EDE3CAE7DBC4E4D3AFDBC29DD2B689C4A373B2
          89577A5636FF00FFFF00FFFF00FF87603EB28957C4A373D2B689DBC29DE4D3AF
          E7DBC4EDE3CAF3EBD7F3EBD7F5F2DFF7F2E6F9F6EAFAF7EFFAF7EFFAF7EFFAF7
          EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFA
          F7EFFAF7EFFAF7EFF9F6EAF7F2E6F5F2DFF3EBD7F3EBD7EDE3CAE7DBC4E4D3AF
          DBC29DD2B689C4A373B2895787603EA67E51EBE2D9DFD4BAD5C2A4DFCEB8ECE6
          D3F7F3EEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F3EEE7DBC4BC9D
          796F49296D411DCBAE91EBE2D9D5C2A4B6956DBC9D79D0B59BE7DBC4F5F0EAFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F3EE6D411D6D411D885B48A9
          8773CAB3A3BFA494BEA08BCEB9ACE6DBCFF5F0EAFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFBFAF2
          EDE5DBD4CACAB3A3B397856D411DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000000000FFFFFFFFFF
          FFFFFFFFFF00FFFFFFFFEBE2D9E6DBCFE6DBCFE6DBCFE6DBCF885B48FF00FFFF
          00FFFFFFFFEBE2D9E6DBCFE6DBCFE6DBCFE6DBCF885B48FF00FFFF00FF664833
          E6DBCFE6DBCFE6DBCFE6DBCFE6DBCF9A7F6AFF00FFFF00FF6A40036A4003FFFF
          FFFF00FFFF00FFFF00FFFF00FF572624734C3887603E987145A67E51B6956DC3
          A983CDB691D1BE9CD1BE9CD5C2A4D7C8A8DACDAFDACDAFDACDAFDACDAFDACDAF
          DACDAFDACDAFDACDAFDACDAFDACDAFDACDAFDACDAFDACDAFDACDAFDACDAFDACD
          AFDACDAFDACDAFDACDAFD7C8A8D5C2A4D1BE9CD1BE9CCDB691C3A983B6956DA6
          7E5198714587603E734C38572624FF00FFFF00FF87603EB28957C4A373D2B689
          DBC29DE4D3AFE7DBC4EDE3CAF3EBD7F3EBD7F5F2DFF7F2E6F9F6EAFAF7EFFAF7
          EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFA
          F7EFFAF7EFFAF7EFFAF7EFFAF7EFF9F6EAF7F2E6F5F2DFF3EBD7F3EBD7EDE3CA
          E7DBC4E4D3AFDBC29DD2B689C4A373B2895787603EFF00FFFF00FFFF00FF8760
          3EB28957C4A373D2B689DBC29DE4D3AFE7DBC4EDE3CAF3EBD7F3EBD7F5F2DFF7
          F2E6F9F6EAFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EF
          FAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFF9F6EAF7F2E6F5F2
          DFF3EBD7F3EBD7EDE3CAE7DBC4E4D3AFDBC29DD2B689C4A373B2895787603EA6
          7E51E6DBCFDACDAFCBB696D5C2A4E7DBC4F1E8DFFCFBFAFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFF9F7F4E7DBC4BDA27E6F49296D411DD0B59BF1E8DFD8C3AA
          A78066B6956DCBAE91DFCEB8F1E8DFFCFBFAFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFF5F0EA6D411D6D411D885B48A98773CAB3A3BEA08BB39785C7AA9AD8CB
          C2F1E8DFFCFBFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFEF7F3EEDCD3D0CEB9ACB397856D411DFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF000000000000FFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFCFBFAB39785FF00FFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFCFBFAB39785FF00FFFF00FF734C38664833CEB9ACCEB9ACCEB9ACCEB9ACA9
          8773FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF572624
          734C3887603E987145A67E51B6956DC3A983CDB691D1BE9CD1BE9CD5C2A4D7C8
          A8DACDAFDACDAFDACDAFDACDAFDACDAFDACDAFDACDAFDACDAFDACDAFDACDAFDA
          CDAFDACDAFDACDAFDACDAFDACDAFDACDAFDACDAFDACDAFDACDAFD7C8A8D5C2A4
          D1BE9CD1BE9CCDB691C3A983B6956DA67E5198714587603E734C38572624FF00
          FFFF00FF87603EB28957C4A373D2B689DBC29DE4D3AFE7DBC4EDE3CAF3EBD7F3
          EBD7F5F2DFF7F2E6F9F6EAFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EF
          FAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFF9F6
          EAF7F2E6F5F2DFF3EBD7F3EBD7EDE3CAE7DBC4E4D3AFDBC29DD2B689C4A373B2
          895787603EFF00FFFF00FFFF00FF87603EB28957C4A373D2B689DBC29DE4D3AF
          E7DBC4EDE3CAF3EBD7F3EBD7F5F2DFF7F2E6F9F6EAFAF7EFFAF7EFFAF7EFFAF7
          EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFA
          F7EFFAF7EFFAF7EFF9F6EAF7F2E6F5F2DFF3EBD7F3EBD7EDE3CAE7DBC4E4D3AF
          DBC29DD2B689C4A373B2895787603EA67E51E6DBCFD9C6ADC7AE8ACDB99ADFCE
          B8ECE6D3F7F3EEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F7F4E6DBCFBDA2
          7E6F49296D411DD0B59BF1E8DFD8C3AAA78066B6956DC7A688D8C3AAE6DBCFF5
          F0EAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5F0EA6D411D6D411D885B48A7
          8066C7AA9AB39785B3907CBFA494D5C6B9E6DBCFF7F3EEFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8
          F4F1E6DBCFCBC2B7B6A38F6D411DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFF00FFFF00FFFF00FFFFFFFFFFFFFFFFFFFFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFFFFFFFFFFFFFFFFFFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FF664833664833664833FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FF572624734C3887603E987145A67E51B6956DC3
          A983CDB691D1BE9CD1BE9CD5C2A4D7C8A8DACDAFDACDAFDACDAFDACDAFDACDAF
          DACDAFDACDAFDACDAFDACDAFDACDAFDACDAFDACDAFDACDAFDACDAFDACDAFDACD
          AFDACDAFDACDAFDACDAFD7C8A8D5C2A4D1BE9CD1BE9CCDB691C3A983B6956DA6
          7E5198714587603E734C38572624FF00FFFF00FF87603EB28957C4A373D2B689
          DBC29DE4D3AFE7DBC4EDE3CAF3EBD7F3EBD7F5F2DFF7F2E6F9F6EAFAF7EFFAF7
          EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFA
          F7EFFAF7EFFAF7EFFAF7EFFAF7EFF9F6EAF7F2E6F5F2DFF3EBD7F3EBD7EDE3CA
          E7DBC4E4D3AFDBC29DD2B689C4A373B2895787603EFF00FFFF00FFFF00FF8760
          3EB28957C4A373D2B689DBC29DE4D3AFE7DBC4EDE3CAF3EBD7F3EBD7F5F2DFF7
          F2E6F9F6EAFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EF
          FAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFF9F6EAF7F2E6F5F2
          DFF3EBD7F3EBD7EDE3CAE7DBC4E4D3AFDBC29DD2B689C4A373B2895787603EA6
          7E51E6DBCFD5C2A4BFA784CAB290D9C6ADE7DBC4F2EDE5FCFBFAFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFF9F7F4E6DBCFBDA27E6F49296D411DD0B59BF1E8DFD8C3AA
          A67E51A78066C2A081D5C2A4E7DBC4F1E8DFFDFAF6FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFF5F0EA6D411D6D411D885B48A78066C7AA9AB39785A98773BEA08BCEB9
          ACDBD4CAF1E8DFF9F9F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F4F1E6DBCFD5C6B9B6A38F6D411DFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFF00FFFF00FFFF00FF
          FF00FF6F4929FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FF522602FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFA87636FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF572624
          734C3887603E987145A67E51B6956DC3A983CDB691D1BE9CD1BE9CD5C2A4D7C8
          A8DACDAFDACDAFDACDAFDACDAFDACDAFDACDAFDACDAFDACDAFDACDAFDACDAFDA
          CDAFDACDAFDACDAFDACDAFDACDAFDACDAFDACDAFDACDAFDACDAFD7C8A8D5C2A4
          D1BE9CD1BE9CCDB691C3A983B6956DA67E5198714587603E734C38572624FF00
          FFFF00FF87603EB28957C4A373D2B689DBC29DE4D3AFE7DBC4EDE3CAF3EBD7F3
          EBD7F5F2DFF7F2E6F9F6EAFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EF
          FAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFF9F6
          EAF7F2E6F5F2DFF3EBD7F3EBD7EDE3CAE7DBC4E4D3AFDBC29DD2B689C4A373B2
          895787603EFF00FFFF00FFFF00FF87603EB28957C4A373D2B689DBC29DE4D3AF
          E7DBC4EDE3CAF3EBD7F3EBD7F5F2DFF7F2E6F9F6EAFAF7EFFAF7EFFAF7EFFAF7
          EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFA
          F7EFFAF7EFFAF7EFF9F6EAF7F2E6F5F2DFF3EBD7F3EBD7EDE3CAE7DBC4E4D3AF
          DBC29DD2B689C4A373B2895787603EA67E51E7DBC4D1BE9CBDA27EC7AE8AD5C2
          A4DFD4BAF1E8DFF7F3EEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F7F4E6DBCFBDA2
          7E6F49296D411DD0B59BF1E8DFD5C2A4A67E51A78066BC9D79D0B59BDFCEB8EB
          E2D9F7F3EEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2EDE56D411D6D411D885B48A7
          8066C7AA9AB39785A98773B39785CAB3A3D8CBC2EBE2D9F7F3EEFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8
          F4F1E6DBCFD5C6B9B6A38F6D411DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFF00FFFF00FFFF00FFFF00FF6F492995735C6F4929FF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFA16D2892641D7C4F02FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC49449D9BF86DCB58DFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FF572624734C3887603E987145A67E51B6956DC3
          A983CDB691D1BE9CD1BE9CD5C2A4D7C8A8DACDAFDACDAFDACDAFDACDAFDACDAF
          DACDAFDACDAFDACDAFDACDAFDACDAFDACDAFDACDAFDACDAFDACDAFDACDAFDACD
          AFDACDAFDACDAFDACDAFD7C8A8D5C2A4D1BE9CD1BE9CCDB691C3A983B6956DA6
          7E5198714587603E734C38572624FF00FFFF00FF87603EB28957C4A373D2B689
          DBC29DE4D3AFE7DBC4EDE3CAF3EBD7F3EBD7F5F2DFF7F2E6F9F6EAFAF7EFFAF7
          EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFA
          F7EFFAF7EFFAF7EFFAF7EFFAF7EFF9F6EAF7F2E6F5F2DFF3EBD7F3EBD7EDE3CA
          E7DBC4E4D3AFDBC29DD2B689C4A373B2895787603EFF00FFFF00FFFF00FF8760
          3EB28957C4A373D2B689DBC29DE4D3AFE7DBC4EDE3CAF3EBD7F3EBD7F5F2DFF7
          F2E6F9F6EAFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EF
          FAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFF9F6EAF7F2E6F5F2
          DFF3EBD7F3EBD7EDE3CAE7DBC4E4D3AFDBC29DD2B689C4A373B2895787603EA6
          7E51E7DBC4D1BE9CBC9D79C3AB89D1BE9CDFD4BAEBE2D9F7F3EEFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFF9F7F4E6DBCFBDA27E6F49296D411DD0B59BF1E8DFD5C2A4
          A67E51A78066BC9D79CFB498DFCEB8E6DBCFF2EDE5FDFAF6FFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFF2EDE56D411D6D411D885B48A78066C7AA9AB3907CA78066B39785CAB3
          A3D8CBC2EBE2D9F5F0EAF9F9F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F4F1E6DBCFD5C6B9B6A38F6D411DFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFF00FFFF00FF6F4929
          9A7F6AE6DBCF9A7F6A6F4929FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB685
          38D9BF86F0D69EB685387C4F02FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB6
          8538FDCC8EFFF9C7FFFBD8EFCFAFFF00FFFF00FFFF00FFFF00FFFF00FF572624
          734C3887603E987145A67E51B6956DC3A983CDB691D1BE9CD1BE9CD5C2A4D7C8
          A8DACDAFDACDAFDACDAFDACDAFDACDAFDACDAFDACDAFDACDAFDACDAFDACDAFDA
          CDAFDACDAFDACDAFDACDAFDACDAFDACDAFDACDAFDACDAFDACDAFD7C8A8D5C2A4
          D1BE9CD1BE9CCDB691C3A983B6956DA67E5198714587603E734C38572624FF00
          FFFF00FF87603EB28957C4A373D2B689DBC29DE4D3AFE7DBC4EDE3CAF3EBD7F3
          EBD7F5F2DFF7F2E6F9F6EAFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EF
          FAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFF9F6
          EAF7F2E6F5F2DFF3EBD7F3EBD7EDE3CAE7DBC4E4D3AFDBC29DD2B689C4A373B2
          895787603EFF00FFFF00FFFF00FF87603EB28957C4A373D2B689DBC29DE4D3AF
          E7DBC4EDE3CAF3EBD7F3EBD7F5F2DFF7F2E6F9F6EAFAF7EFFAF7EFFAF7EFFAF7
          EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFA
          F7EFFAF7EFFAF7EFF9F6EAF7F2E6F5F2DFF3EBD7F3EBD7EDE3CAE7DBC4E4D3AF
          DBC29DD2B689C4A373B2895787603EA67E51E7DBC4CDB99ABC9D79C3A983D1BE
          9CDFD4BAECE6D3F5F0EAFEFEFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F7F4E6DBCFBDA2
          7E6F49296D411DD0B59BF1E8DFD5C2A4A67E51A67E51B6956DCBAE91D9C6ADE6
          DBCFF1E8DFF9F7F4FCFBFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2EDE56D411D6D411D885B48A7
          8066C7AA9AB3907CA78066B3907CCAB3A3D5C6B9E6DBCFF2EDE5F8F4F1FEFEFC
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8
          F4F1E6DBCFD5C6B9B6A38F6D411D000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000FF00FFFF00FF6F492995735CE7DBC4F1E8DFF1E8DF9A7F6A6F4929FF
          00FFFF00FFFF00FFFF00FFA16D28FBCA46FFF9C7FFFEE4FEE7BBB685387C4F02
          FF00FFFF00FFFF00FFFF00FFA16D28E8AC56FFFE99FFFEE4FFFFF7FFFEE4EFCF
          AFFF00FFFF00FFFF00FFFF00FF572624734C3887603E987145A67E51B6956DC3
          A983CDB691D1BE9CD1BE9CD5C2A4D7C8A8DACDAFDACDAFDACDAFDACDAFDACDAF
          DACDAFDACDAFDACDAFDACDAFDACDAFDACDAFDACDAFDACDAFDACDAFDACDAFDACD
          AFDACDAFDACDAFDACDAFD7C8A8D5C2A4D1BE9CD1BE9CCDB691C3A983B6956DA6
          7E5198714587603E734C38572624FF00FFFF00FF87603EB28957C4A373D2B689
          DBC29DE4D3AFE7DBC4EDE3CAF3EBD7F3EBD7F5F2DFF7F2E6F9F6EAFAF7EFFAF7
          EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFA
          F7EFFAF7EFFAF7EFFAF7EFFAF7EFF9F6EAF7F2E6F5F2DFF3EBD7F3EBD7EDE3CA
          E7DBC4E4D3AFDBC29DD2B689C4A373B2895787603EFF00FFFF00FFFF00FF8760
          3EB28957C4A373D2B689DBC29DE4D3AFE7DBC4EDE3CAF3EBD7F3EBD7F5F2DFF7
          F2E6F9F6EAFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EF
          FAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFF9F6EAF7F2E6F5F2
          DFF3EBD7F3EBD7EDE3CAE7DBC4E4D3AFDBC29DD2B689C4A373B2895787603EA6
          7E51E7DBC4CDB99ABC9D79C3A983D1BE9CDFD4BAECE6D3F5F0EAFCFBFAFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFF9F7F4E6DBCFBDA27E6F49296D411DD0B59BF1E8DFD5C2A4
          A67E51A67E51B6956DCBAE91D9C6ADE7DBC4F1E8DFF7F3EEFCFBFAFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFF2EDE56D411D6D411D885B48A78066C7AA9AB3907CA78066B3907CC7AA
          9AD5C6B9E6DBCFF1E8DFF8F4F1FCFBFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F4F1E6DBCFD5C6B9B6A38F6D411D0000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000FF00FF6F4929987145E7C59E
          EDE3BFF3EBD7F7F2E6F1E8DF9A7F6A6F4929FF00FFFF00FF936001FBCA46FFF5
          68FFF9C7FFFFEFFFFFF7FEE7BBB685387C4F02FF00FFFF00FF7C4F02B68538FF
          F568FFFE99FFFBD8FFFFF7FFFFFEFFFBD8E7C59EFF00FFFF00FFFF00FF572624
          734C3887603E987145A67E51B6956DC3A983CDB691D1BE9CD1BE9CD5C2A4D7C8
          A8DACDAFDACDAFDACDAFDACDAFDACDAFDACDAFDACDAFDACDAFDACDAFDACDAFDA
          CDAFDACDAFDACDAFDACDAFDACDAFDACDAFDACDAFDACDAFDACDAFD7C8A8D5C2A4
          D1BE9CD1BE9CCDB691C3A983B6956DA67E5198714587603E734C38572624FF00
          FFFF00FF87603EB28957C4A373D2B689DBC29DE4D3AFE7DBC4EDE3CAF3EBD7F3
          EBD7F5F2DFF7F2E6F9F6EAFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EF
          FAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFF9F6
          EAF7F2E6F5F2DFF3EBD7F3EBD7EDE3CAE7DBC4E4D3AFDBC29DD2B689C4A373B2
          895787603EFF00FFFF00FFFF00FF87603EB28957C4A373D2B689DBC29DE4D3AF
          E7DBC4EDE3CAF3EBD7F3EBD7F5F2DFF7F2E6F9F6EAFAF7EFFAF7EFFAF7EFFAF7
          EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFA
          F7EFFAF7EFFAF7EFF9F6EAF7F2E6F5F2DFF3EBD7F3EBD7EDE3CAE7DBC4E4D3AF
          DBC29DD2B689C4A373B2895787603EA67E51E7DBC4CDB99ABC9D79C3A983D1BE
          9CDFD4BAECE6D3F5F0EAFCFBFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F7F4E6DBCFBDA2
          7E6F49296D411DD0B59BF1E8DFD5C2A4A67E51A67E51B6956DCBAE91D9C6ADE7
          DBC4F1E8DFF7F3EEFCFBFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2EDE56D411D6D411D885B48A7
          8066C7AA9AB3907CA78066B3907CC7AA9AD5C6B9E6DBCFF1E8DFF8F4F1FCFBFA
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8
          F4F1E6DBCFD5C6B9B6A38F6D411D000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000006F492987603ECCAE7EE7C59EEFCFAFEDE3CAF3EBD7F1E8DFEBE2D99A
          7F6A6F4929936001B68538FFEE38FFF568FFFE99FFFBD8FFFFEFFFFEE4FEE7BB
          B685386A4003522602936001EBA00AFFEE38FFFE99FFF9C7FFFEE4FFFFF7FFFF
          EFFEE7BBD1AA73FF00FFFF00FF572624734C3887603E987145A67E51B6956DC3
          A983CDB691D1BE9CD1BE9CD5C2A4D7C8A8DACDAFDACDAFDACDAFDACDAFDACDAF
          DACDAFDACDAFDACDAFDACDAFDACDAFDACDAFDACDAFDACDAFDACDAFDACDAFDACD
          AFDACDAFDACDAFDACDAFD7C8A8D5C2A4D1BE9CD1BE9CCDB691C3A983B6956DA6
          7E5198714587603E734C38572624FF00FFFF00FF87603EB28957C4A373D2B689
          DBC29DE4D3AFE7DBC4EDE3CAF3EBD7F3EBD7F5F2DFF7F2E6F9F6EAFAF7EFFAF7
          EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFA
          F7EFFAF7EFFAF7EFFAF7EFFAF7EFF9F6EAF7F2E6F5F2DFF3EBD7F3EBD7EDE3CA
          E7DBC4E4D3AFDBC29DD2B689C4A373B2895787603EFF00FFFF00FFFF00FF8760
          3EB28957C4A373D2B689DBC29DE4D3AFE7DBC4EDE3CAF3EBD7F3EBD7F5F2DFF7
          F2E6F9F6EAFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EF
          FAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFF9F6EAF7F2E6F5F2
          DFF3EBD7F3EBD7EDE3CAE7DBC4E4D3AFDBC29DD2B689C4A373B2895787603EA6
          7E51E7DBC4CDB99AB6956DC3A983D1BE9CDFD4BAECE6D3F5F0EAFCFBFAFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFF9F7F4E6DBCFBDA27E6F49296D411DD0B59BF1E8DFD5C2A4
          A67E51A67E51B6956DCBAE91D9C6ADE7DBC4F1E8DFF7F3EEFCFBFAFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFF2EDE56D411D6D411D885B48A78066C7AA9AB3907CA78066B3907CC7AA
          9AD5C6B9E6DBCFF1E8DFF8F4F1FCFBFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F4F1E6DBCFD5C6B9B6A38F6D411D0000
          00000000000000000000000000FFFFFFFFFFFF000000000000FFFFFFFFFFFF00
          0000000000FFFFFFFFFFFF0000000000000000006F4929A78066C4A373DCB58D
          E7C59EEFCFAFFADBC2EDE3CAEDE3CADFCEB86F4929A16D28E8AC56FFEE38FFF5
          68FFF568FFFE99FFF9C7FFFEE4FFFBD8D9BF86936001522602936001D18804FB
          CA46FFF568FFFE99FFF9C7FFFEE4FFFBD8FFF9C7D5B97BFF00FFFF00FF572624
          734C3887603E987145A67E51B6956DC3A983CDB691D1BE9CD1BE9CD5C2A4D7C8
          A8DACDAFDACDAFDACDAFDACDAFDACDAFDACDAFDACDAFDACDAFDACDAFDACDAFDA
          CDAFDACDAFDACDAFDACDAFDACDAFDACDAFDACDAFDACDAFDACDAFD7C8A8D5C2A4
          D1BE9CD1BE9CCDB691C3A983B6956DA67E5198714587603E734C38572624FF00
          FFFF00FF87603EB28957C4A373D2B689DBC29DE4D3AFE7DBC4EDE3CAF3EBD7F3
          EBD7F5F2DFF7F2E6F9F6EAFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EF
          FAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFF9F6
          EAF7F2E6F5F2DFF3EBD7F3EBD7EDE3CAE7DBC4E4D3AFDBC29DD2B689C4A373B2
          895787603EFF00FFFF00FFFF00FF87603EB28957C4A373D2B689DBC29DE4D3AF
          E7DBC4EDE3CAF3EBD7F3EBD7F5F2DFF7F2E6F9F6EAFAF7EFFAF7EFFAF7EFFAF7
          EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFA
          F7EFFAF7EFFAF7EFF9F6EAF7F2E6F5F2DFF3EBD7F3EBD7EDE3CAE7DBC4E4D3AF
          DBC29DD2B689C4A373B2895787603EA67E51E7DBC4CDB99AB6956DBFA784D1BE
          9CDFD4BAECE6D3F5F0EAFCFBFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F7F4E6DBCFBDA2
          7E6F49296D411DD0B59BF1E8DFD5C2A4A67E51A67E51B6956DCBAE91D9C6ADE7
          DBC4F1E8DFF7F3EEFCFBFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2EDE56D411D6D411D885B48A7
          8066C7AA9AB3907CA78066B3907CC7AA9AD5C6B9E6DBCFF1E8DFF7F3EEFCFBFA
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8
          F4F1E6DBCFD5C6B9B6A38F6D411D000000000000000000000000A87636CAA98B
          FFFFFF000000A87636CAA98BFFFFFF000000A87636CAA98BFFFFFF0000000000
          000000006F4929A67E51B6956DD1AA73DCAC7BE7C59EEFCFAFE7D7B7E7DBC4D9
          C6AD6F4929A16D28C49449FBCA46FFEE38FFEE38FFF568FFFE99FFF9C7FFF9C7
          FDCC8E92641D522602936001D18804EBA00AFFEE38FFF568FFFE99FFF9C7FFF9
          C7FFFE99D5B97BFF00FFFF00FF572624734C3887603E987145A67E51B6956DC3
          A983CDB691D1BE9CD1BE9CD5C2A4D7C8A8DACDAFDACDAFDACDAFDACDAFDACDAF
          DACDAFDACDAFDACDAFDACDAFDACDAFDACDAFDACDAFDACDAFDACDAFDACDAFDACD
          AFDACDAFDACDAFDACDAFD7C8A8D5C2A4D1BE9CD1BE9CCDB691C3A983B6956DA6
          7E5198714587603E734C38572624FF00FFFF00FF87603EB28957C4A373D2B689
          DBC29DE4D3AFE7DBC4EDE3CAF3EBD7F3EBD7F5F2DFF7F2E6F9F6EAFAF7EFFAF7
          EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFA
          F7EFFAF7EFFAF7EFFAF7EFFAF7EFF9F6EAF7F2E6F5F2DFF3EBD7F3EBD7EDE3CA
          E7DBC4E4D3AFDBC29DD2B689C4A373B2895787603EFF00FFFF00FFFF00FF8760
          3EB28957C4A373D2B689DBC29DE4D3AFE7DBC4EDE3CAF3EBD7F3EBD7F5F2DFF7
          F2E6F9F6EAFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EF
          FAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFF9F6EAF7F2E6F5F2
          DFF3EBD7F3EBD7EDE3CAE7DBC4E4D3AFDBC29DD2B689C4A373B2895787603EA6
          7E51E7DBC4CDB99AB6956DBFA784CDB99ADFCEB8ECE6D3F5F0EAFCFBFAFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFF9F7F4E6DBCFBDA27E6F49296D411DCFB498F1E8DFD5C2A4
          A67E51A67E51B6956DCAA98BD8C3AAE7DBC4EBE2D9F5F0EAF9F7F4FCFBFAFCFB
          FAFCFBFAFCFBFAFCFBFAFCFBFAFCFBFAFCFBFAFCFBFAFCFBFAFCFBFAFCFBFAFC
          FBFAFCFBFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFF2EDE56D411D6D411D885B48A78066C7AA9AB3907CA78066B3907CC7AA
          9AD5C6B9DBD4CAF1E8DFF5F0EAFDFAF6FCFBFAFCFBFAFCFBFAFCFBFAFCFBFAFC
          FBFAFCFBFAFCFBFAFCFBFAFCFBFAFCFBFAFCFBFAFCFBFAFEFEFCFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F4F1E6DBCFD5C6B9B6A38F6D411D0000
          00000000000000000000A87636A87636000000000000A87636A8763600000000
          0000A87636A876360000000000000000000000006F492995735CB28957B6956D
          CCA16BDCB58DE7C59EEECDACEECDACD5C2A46F492992641DD18804EBA00AFBCA
          46FFEE38FFF568FFF568FFFE99FFFE99EBB2699360015226027C4F02BA7002EB
          A00AFFC404FFEE38FFF568FFFE99FFFE99FFFE99CDAD66FF00FFFF00FF572624
          734C3887603E987145A67E51B6956DC3A983CAB290CFB894D1BE9CD5C2A4D7C8
          A7DACDAFDACDAFDACDAFDACDAFDACDAFDACDAFDACDAFDACDAFDACDAFDACDAFDA
          CDAFDACDAFDACDAFDACDAFDACDAFDACDAFDACDAFDACDAFDACDAFD7C8A7D5C2A4
          D1BE9CCFB894CAB290C3A983B6956DA67E5198714587603E734C38572624FF00
          FFFF00FF87603EB28957C4A373D2B689DBC29DE4D3AFE7DBC4EDE3CAF3EBD7F3
          EBD7F5F2DFF7F2E6F9F6EAFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EF
          FAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFFAF7EFF9F6
          EAF7F2E6F5F2DFF3EBD7F3EBD7EDE3CAE7DBC4E4D3AFDBC29DD2B689C4A373B2
          895787603EFF00FFFF00FFFF00FF7A5636A67E51C4A373CCAE7ECFB894DFCCA6
          E7D7B7E7DBC4EDE3CAEDE3CAF3EBD7F3EBD7F5F2DFF7F2E6F7F2E6F7F2E6F7F2
          E6F7F2E6F7F2E6F7F2E6F7F2E6F7F2E6F7F2E6F7F2E6F7F2E6F7F2E6F7F2E6F7
          F2E6F7F2E6F7F2E6F5F2DFF3EBD7F3EBD7EDE3CAEDE3CAE7DBC4E7D7B7DFCCA6
          CFB894CCAE7EC4A373A67E517A5636A67E51E7DBC4CBB696B6956DBDA27ECDB9
          9ADACDAFE6DBCFF2EDE5F9F7F4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F7F4E6DBCFBC9D
          796F49296D411DCFB498F1E8DFD5C2A4A67E51A67E51B6956DC7A688D5C2A4DF
          CEB8E6DBCFF1E8DFF5F0EAF7F3EEF7F3EEF7F3EEF7F3EEF7F3EEF7F3EEF7F3EE
          F7F3EEF7F3EEF7F3EEF7F3EEF7F3EEF7F3EEF9F7F4FDFAF6FFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1E8DF6D411D6D411D885B48A7
          8066C7AA9AB3907CA78066A98773BFA494CEB9ACD8CBC2E6DBCFF1E8DFF5F0EA
          F7F3EEF8F4F1F8F4F1F8F4F1F8F4F1F8F4F1F8F4F1F8F4F1F8F4F1F8F4F1F8F4
          F1F8F4F1F8F4F1F8F4F1F9F9F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8
          F4F1E6DBCFD5C6B9B6A38F6D411D000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000006F4929885B48A67E51B28957D59267D1AA73DCB58DDEBB99E7C59ECF
          B4986F492992641DD18804EBA00AFFC404FFDE04FFEE38FFF568FFF568FFFE99
          FBCA469360015226027D3300BA7002D18804FFC404FFEE38FFF568FFF568FFFE
          99FFF568C5A25BFF00FFFF00FF572624734C3887603E87603E987145B28957BC
          9D79C3A983CAB290CDB691CFB894D1BE9CD5C2A4D7C8A7D7C8A8D7C8A8D7C8A8
          D7C8A8D7C8A8D7C8A8D7C8A8D7C8A8D7C8A8D7C8A8D7C8A8D7C8A8D7C8A8D7C8
          A8D7C8A8D7C8A7D5C2A4D1BE9CCFB894CDB691CAB290C3A983BC9D79B2895798
          714598714587603E734C38572624FF00FFFF00FF7A5636A67E51C4A373CCAE7E
          CFB894DFCCA6E7D7B7E7DBC4EDE3CAEDE3CAF3EBD7F3EBD7F5F2DFF7F2E6F7F2
          E6F7F2E6F7F2E6F7F2E6F7F2E6F7F2E6F7F2E6F7F2E6F7F2E6F7F2E6F7F2E6F7
          F2E6F7F2E6F7F2E6F7F2E6F7F2E6F5F2DFF3EBD7F3EBD7EDE3CAEDE3CAE7DBC4
          E7D7B7DFCCA6CFB894CCAE7EC4A373A67E517A5636FF00FFFF00FFFF00FF734C
          38987145B28957C4A373CCAE7ED2B689DBC29DDFCCA6E4D3AFE7D7B7E7D7B7E7
          DBC4EDE3CAEDE3CAEDE3CAF1EBCDECE6D3ECE6D3ECE6D3ECE6D3ECE6D3ECE6D3
          ECE6D3ECE6D3ECE6D3ECE6D3ECE6D3F1EBCDEDE3CAEDE3CAEDE3CAE7DBC4E7D7
          B7E7D7B7E4D3AFDFCCA6DBC29DD2B689CCAE7EC4A373B28957987145734C38A6
          7E51E7DBC4CBB696B6956DBC9D79CAB290D9C6ADE7DBC4F1E8DFF7F3EEFCFBFA
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFF9F7F4E6DBCFBC9D796F49296D411DCFB498F1E8DFD5C2A4
          A67E51A67E51A78066C2A081CFB498D9C6ADDFD4BAE6DBCFEBE2D9F1E8DFF1E8
          DFF1E8DFF1E8DFF1E8DFF1E8DFF1E8DFF1E8DFF1E8DFF1E8DFF1E8DFF1E8DFF1
          E8DFF1E8DFF2EDE5F7F3EEFDFAF6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFF1E8DF6D411D6D411D885B48A78066C7AA9AB3907C95735CA98773BEA0
          8BCAB3A3D5C6B9DBD4CAE6DBCFF1E8DFF1E8DFF1E8DFF1E8DFF1E8DFF1E8DFF1
          E8DFF1E8DFF1E8DFF1E8DFF1E8DFF1E8DFF1E8DFF1E8DFF2EDE5F5F0EAF7F3EE
          F9F9F9FFFFFFFFFFFFFFFFFFFFFFFFF8F4F1E6DBCFD5C6B9B6A38F6D411D0000
          00000000000000000000000000000000000000000000000000FFFFFFFFFFFF00
          0000000000FFFFFFFFFFFF0000000000000000006F4929885B48A67E51B28957
          C5955FD59267DCAC7BDCB58DDEBB99CAA98B6F4929875816BA7002EBA00AEBA0
          0AFFC404FFEE38FFEE38FFF568FFF568FBCA469360014102007D3300A85800D1
          8804FFC404FFDE04FFEE38FFF568FFF568FFF568C49449FF00FFFF00FF572624
          61442F734C3887603E87603E987145A67E51B6956DB6956DBC9D79BDA27EC3A9
          83C7AE8ACAB290CDB691CFB894CFB894CFB894CFB894CFB894CFB894CFB894CF
          B894CFB894CFB894CFB894CFB894CFB894CDB691CAB290C7AE8AC3A983BDA27E
          BC9D79B6956DB6956DA67E5198714587603E87603E734C3861442F572624FF00
          FFFF00FF734C38987145B28957C4A373CCAE7ED2B689DBC29DDFCCA6E4D3AFE7
          D7B7E7D7B7E7DBC4EDE3CAEDE3CAEDE3CAF1EBCDECE6D3ECE6D3ECE6D3ECE6D3
          ECE6D3ECE6D3ECE6D3ECE6D3ECE6D3ECE6D3ECE6D3F1EBCDEDE3CAEDE3CAEDE3
          CAE7DBC4E7D7B7E7D7B7E4D3AFDFCCA6DBC29DD2B689CCAE7EC4A373B2895798
          7145734C38FF00FFFF00FFFF00FF61442F87603E987145B28957B6956DCCAE7E
          D2B689DBC29DDFCCA6DFCCA6E4D3AFE4D3AFE7D7B7E7D7B7E7D7B7E7DBC4E7DB
          C4E7DBC4E7DBC4E7DBC4E7DBC4E7DBC4E7DBC4E7DBC4E7DBC4E7DBC4E7DBC4E7
          DBC4E7D7B7E7D7B7E7D7B7E4D3AFE4D3AFDFCCA6DFCCA6DBC29DD2B689CCAE7E
          B6956DB2895798714587603E61442FA67E51E7DBC4CAB290B6956DB6956DC7AE
          8AD1BE9CDFD4BAE6DBCFF2EDE5F7F3EEF9F7F4FCFBFAFCFBFAFCFBFAFCFBFAFC
          FBFAFCFBFAFCFBFAFCFBFAFCFBFAFCFBFAFCFBFAFCFBFAFCFBFAFCFBFAFEFEFC
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F7F4E6DBCFBC9D
          796F49296D411DCFB498F1E8DFD5C2A4987145987145A78066B6956DC7A688D0
          B59BD9C6ADDFCEB8E7DBC4E7DBC4E7DBC4E7DBC4E7DBC4E7DBC4E7DBC4E7DBC4
          E7DBC4E7DBC4E7DBC4E7DBC4E7DBC4E7DBC4E6DBCFE6DBCFEBE2D9F1E8DFF5F0
          EAFCFBFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1E8DF6D411D6D411D885B48A7
          8066C7AA9AB3907C95735CA78066B39785C7AA9ACEB9ACD5C6B9D8CBC2DBD4CA
          E6DBCFE6DBCFE6DBCFE6DBCFE6DBCFE6DBCFE6DBCFE6DBCFE6DBCFE6DBCFE6DB
          CFE6DBCFE6DBCFE6DBCFEBE2D9EBE2D9F1E8DFF7F3EEFCFBFAFFFFFFFFFFFFF8
          F4F1E6DBCFD5C6B9B6A38F6D411D000000000000000000000000000000000000
          000000000000A87636CAA98BFFFFFF000000A87636CAA98BFFFFFF0000000000
          000000006F4929885B48A67E51B28957C5955FD59267DCAC7BDCB58DDEBB99CA
          A98B6F4929875816BA7002D18804EBA00AFFC404FFDE04FFEE38FFF568FFF568
          FBCA469360014102007D3300A85800D18804FFC404FFDE04FFEE38FFF568FFF5
          68FFF568C49449FF00FFFF00FF57262457262461442F734C3887603E87603E98
          7145A67E51B28957B6956DB6956DB6956DBC9D79BC9D79BDA27EC3A983C3A983
          C3A983C3A983C3A983C3A983C3A983C3A983C3A983C3A983C3A983C3A983C3A9
          83BDA27EBC9D79BC9D79B6956DB6956DB6956DB28957A67E5198714587603E87
          603E734C3861442F572624572624FF00FFFF00FF734C3887603E987145B28957
          B6956DCCAE7ED2B689DBC29DDFCCA6DFCCA6E4D3AFE4D3AFE7D7B7E7D7B7E7D7
          B7E7DBC4E7DBC4E7DBC4E7DBC4E7DBC4E7DBC4E7DBC4E7DBC4E7DBC4E7DBC4E7
          DBC4E7DBC4E7DBC4E7D7B7E7D7B7E7D7B7E4D3AFE4D3AFDFCCA6DFCCA6DBC29D
          D2B689CCAE7EB6956DB2895798714587603E734C38FF00FFFF00FFFF00FF4C00
          4C734C3887603E987145B28957C4A373D2B689DBC29DDFCCA6E4D3AFE7D7B7E7
          D7B7E7D7B7E7DBC4E7DBC4EDE3CAEDE3CAEDE3CAEDE3CAEDE3CAEDE3CAEDE3CA
          EDE3CAEDE3CAEDE3CAEDE3CAEDE3CAEDE3CAEDE3CAE7DBC4E7D7B7E7D7B7E7D7
          B7E4D3AFDFCCA6DBC29DCCAE7EB6956DA67E5198714587603E734C384C004CA6
          7E51DFD4BAC7AE8AA78066B6956DBDA27ECBB696D9C6ADDFD4BAE6DBCFF1E8DF
          F2EDE5F5F0EAF5F0EAF5F0EAF5F0EAF5F0EAF5F0EAF5F0EAF5F0EAF5F0EAF5F0
          EAF5F0EAF5F0EAF5F0EAF5F0EAF5F0EAF7F3EEF7F3EEFCFBFAFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFF9F7F4E6DBCFBC9D796F49296D411DCFB498F1E8DFD5C2A4
          987145987145A67E51B6956DBC9D79C7A688CFB498D5C2A4D8C3AAD9C6ADD9C6
          ADD9C6ADD9C6ADD9C6ADD9C6ADD9C6ADD9C6ADD9C6ADD9C6ADD9C6ADD9C6ADD9
          C6ADD9C6ADDFCEB8DFCEB8E7DBC4E6DBCFF1E8DFF5F0EAFCFBFAFFFFFFFFFFFF
          FFFFFFEBE2D96D411D6D411D885B48A78066C7AA9ABEA08BA78066A78066A987
          73B39785C7AA9ACAB3A3CEB9ACD5C6B9D5C6B9D5C6B9D5C6B9D5C6B9D5C6B9D5
          C6B9D5C6B9D5C6B9D5C6B9D5C6B9D5C6B9D5C6B9D5C6B9D5C6B9D8CBC2D8CBC2
          DBD4CAE6DBCFF1E8DFF5F0EAFCFBFAF8F4F1EBE2D9D5C6B9B6A38F6D411D0000
          00000000000000000000000000000000000000000000A87636A8763600000000
          0000A87636A876360000000000000000000000006F4929885B48A67E51B28957
          C5955FD59267DCAC7BDCB58DDEBB99CAA98B6F4929875816BA7002EBA00AEBA0
          0AFFC404FFDE04FFEE38FFF568FFF568FBCA469360014102007D3300A85800D1
          8804FFC404FFDE04FFEE38FFF568FFF568FFF568C49449FF00FFFF00FFC600B3
          57262457262461442F734C3887603E987145A67E51B6956DB6956DBC9D79BC9D
          79BDA27EC3A983C3AB89CAB290CAB290CAB290CAB290CAB290CAB290CAB290CA
          B290CAB290CAB290CAB290CAB290CAB290C7AE8AC3A983BDA27EBC9D79BC9D79
          B6956DB6956DA67E5198714587603E734C3861442F572624572624C600B3FF00
          FFFF00FFC600B3734C3887603E987145B28957C4A373D2B689DBC29DDFCCA6E4
          D3AFE7D7B7E7D7B7E7D7B7E7DBC4E7DBC4EDE3CAEDE3CAEDE3CAEDE3CAEDE3CA
          EDE3CAEDE3CAEDE3CAEDE3CAEDE3CAEDE3CAEDE3CAEDE3CAEDE3CAE7DBC4E7D7
          B7E7D7B7E7D7B7E4D3AFDFCCA6DBC29DCCAE7EB6956DA67E5198714587603E73
          4C38C600B3FF00FFFF00FFFF00FFB200B27324536D533A7A5636987145B6956D
          D2B689E4D3AFE7DBC4EDE3CAF1EBCDECE6D3F3EBD7F3EBD7F5F2DFF7F2E6F5F2
          DFF5F2DFF5F2DFF5F2DFF5F2DFF5F2DFF5F2DFF5F2DFF5F2DFF5F2DFF5F2DFF7
          F2E6F5F2DFF3EBD7F3EBD7F3EBD7F1EBCDEDE3CAE7DBC4E4D3AFCCAE7EB28957
          9871457A5636664833732453B200B2A67E51DFD4BAC7AE8AA67E51A78066B695
          6DC3A983CDB99AD9C6ADDFD4BAE7DBC4E6DBCFECE6D3ECE6D3ECE6D3ECE6D3EC
          E6D3ECE6D3ECE6D3ECE6D3ECE6D3ECE6D3ECE6D3ECE6D3ECE6D3ECE6D3ECE6D3
          EBE2D9F1E8DFF2EDE5F7F3EEFCFBFAFFFFFFFFFFFFFFFFFFF9F7F4E6DBCFBC9D
          796F49296D411DCFB498F2EDE5E7DBC4B6956D987145987145A67E51B6956DB6
          956DC2A081C7A688CAA98BCBAE91CBAE91CBAE91CBAE91CBAE91CBAE91CBAE91
          CBAE91CBAE91CBAE91CBAE91CBAE91CBAE91CBAE91CFB498D0B59BD5C2A4D8C3
          AADFCEB8E7DBC4ECE6D3F2EDE5F8F4F1FEFEFCECE6D36D411D6D411D885B4895
          735CC7AA9ACAB3A3B39785A78066A78066A98773B39785BEA08BBFA494C7AA9A
          C7AA9AC7AA9AC7AA9AC7AA9AC7AA9AC7AA9AC7AA9AC7AA9AC7AA9AC7AA9AC7AA
          9AC7AA9AC7AA9ACAB3A3CAB3A3CAB3A3CEB9ACD5C6B9D8CBC2E6DBCFEBE2D9EB
          E2D9E6DBCFD5C6B9B6A38F6D411D000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000006F4929885B48A67E51B28957C5955FD59267DCAC7BDCB58DDEBB99CA
          A98B6F4929875816BA7002EBA00AEBA00AFFC404FFDE04FFEE38FFF568FFF568
          FBCA469360014102007D3300A85800D18804EBA00AFFC404FFEE38FFF568FFF5
          68FBCA46C49449FF00FFFF00FFFF00FF73245357262457262461442F7A563698
          7145B6956DC3A983CAB290CFB894CFB894CFB894D1BE9CD5C2A4D7C8A7D5C2A4
          D5C2A4D5C2A4D5C2A4D5C2A4D5C2A4D5C2A4D5C2A4D5C2A4D5C2A4D5C2A4D7C8
          A7D5C2A4D1BE9CD1BE9CCFB894CFB894CAB290C3A983B6956D987145734C3863
          3326572624572624732453FF00FFFF00FFFF00FFFF00FF8C3E626D533A7A5636
          987145B6956DD2B689E4D3AFE7DBC4EDE3CAF1EBCDECE6D3F3EBD7F3EBD7F5F2
          DFF7F2E6F5F2DFF5F2DFF5F2DFF5F2DFF5F2DFF5F2DFF5F2DFF5F2DFF5F2DFF5
          F2DFF5F2DFF7F2E6F5F2DFF3EBD7F3EBD7F3EBD7F1EBCDEDE3CAE7DBC4E4D3AF
          CCAE7EB289579871457A56366648338C3E62FF00FFFF00FFFF00FFFF00FFFF00
          FFB200B2732453443D39734C38A67E51D2B689E7DBC4F5F2DFF5F2DFF7F2E6F9
          F6EAF9F6EAFAF7EFFCFBFAFDFDFDFCFBFAFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFCFBFAFCFBFAFDFAF6FAF7EFFAF7EFF9F6EAF7F2
          E6F5F2DFF3EBD7E7D7B7CCAE7E9871456D533A443D39732453B200B2FF00FFA6
          7E51E6DBCFD5C2A4A78066A67E51A78066BC9D79C3A983CBB696D1BE9CD9C6AD
          DACDAFDFCEB8DFD4BADFD4BADFD4BADFD4BADFD4BADFD4BADFD4BADFD4BADFD4
          BADFD4BADFD4BADFD4BADFD4BADFD4BADFD4BADFD4BAE7DBC4ECE6D3F1E8DFF7
          F3EEFFFFFFFFFFFFF9F7F4E6DBCFBC9D796F49296D411DC7A688F2EDE5F5F0EA
          DFD4BAB6956D987145987145A67E51A78066A78066B6956DB6956DB6956DB695
          6DB6956DB6956DB6956DB6956DB6956DB6956DB6956DB6956DB6956DB6956DB6
          956DB6956DBC9D79BC9D79C2A081C7A688CBAE91D0B59BD8C3AADFCEB8E6DBCF
          EBE2D9DFD4BA6D411D6D411D885B48885B48B3907CCEB9ACCEB9ACBEA08BA780
          66A78066A78066A98773A98773B3907CB3907CB3907CB3907CB3907CB3907CB3
          907CB3907CB3907CB3907CB3907CB3907CB3907CB3907CB3907CB39785B39785
          BEA08BBFA494C7AA9ACEB9ACD5C6B9D5C6B9D5C6B9CEB9ACB397856D411D0000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000FFFFFFFFFFFF0000000000000000006F492995735CA78066B28957
          C5955FD59267DCAC7BDCB58DDCB58DCAA2866F492992641DB68538EBA00AEBA0
          0AFFC404FFDE04FFEE38FFF568FFF568FBCA467C4F025226027D3300A85800BA
          7002EBA00AFFC404FFEE38FFEE38FFF568FBCA46B68538FF00FFFF00FFFF00FF
          FF00FF73245340281E572624734C38987145C3AB89D5C2A4D5C2A4D7C8A8DACD
          AFDACDAFDACDAFDFD4BADFD4BADFD4BADFD4BADFD4BADFD4BADFD4BADFD4BADF
          D4BADFD4BADFD4BADFD4BADFD4BADFD4BADFD4BADACDAFDACDAFDACDAFD7C8A8
          D5C2A4D1BE9CBDA27E98714561442F57262440281E732453FF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FF732453443D39734C38A67E51D2B689E7DBC4F5F2DFF5
          F2DFF7F2E6F9F6EAF9F6EAFAF7EFFCFBFAFDFDFDFCFBFAFDFDFDFDFDFDFDFDFD
          FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFCFBFAFCFBFAFDFAF6FAF7EFFAF7
          EFF9F6EAF7F2E6F5F2DFF3EBD7E7D7B7CCAE7E9871456D533A443D39732453FF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB200B27324533E3B3887603E
          C4A373E4D3AFEDE3CAF3EBD7F5F2DFF5F2DFFAF7EFFAF7EFFAF7EFFAF7EFFBF9
          F3FBF9F3FBF9F3FBF9F3FBF9F3FBF9F3FBF9F3FBF9F3FBF9F3FBF9F3FBF9F3FA
          F7EFF9F6EAF9F6EAF7F2E6F5F2DFF5F2DFECE6D3EDE3CADBC29DB289577A5636
          3A3A3A732453B200B2FF00FFFF00FFA67E51E7DBC4F1E8DFD1BE9CA78066A67E
          51A78066B6956DBDA27EC7AE8ACAB290CDB99ACDB99AD1BE9CD1BE9CD1BE9CD1
          BE9CD1BE9CD1BE9CD1BE9CD1BE9CD1BE9CD1BE9CD1BE9CD1BE9CD1BE9CD1BE9C
          D1BE9CD5C2A4D9C6ADDFCEB8E7DBC4ECE6D3F5F0EAFFFFFFF9F7F4E6DBCFBC9D
          797A56366D411D987145E7DBC4F7F3EEF7F3EEE7DBC4B6956D98714598714598
          7145A67E51A67E51A67E51A67E51A67E51A67E51A67E51A67E51A67E51A67E51
          A67E51A67E51A67E51A67E51A67E51A67E51A67E51A78066A78066A78066B695
          6DB6956DBC9D79C7A688CFB498D5C2A4D9C6ADD0B59B6D411D6D411D885B4873
          4C3895735CCAB3A3D5C6B9CEB9ACB39785A7806695735C95735CA78066A78066
          A78066A78066A78066A78066A78066A78066A78066A78066A78066A78066A780
          66A78066A78066A78066A78066A98773A98773B3907CB39785BEA08BC7AA9ACA
          B3A3CAB3A3C7AA9AB3907C6D411D000000000000000000000000000000000000
          000000000000000000000000000000000000A87636CAA98BFFFFFF0000000000
          000000006F4929A98773B3907CB6956DB6956DC4A373DCAC7BDCB58DDCB58DCA
          A2866F4929987145CDAD66E8AC56E8AC56FBCA46FBCA46FFEE38FFF568FFF568
          FBCA467C4F02522602875816A16D28BA7002D18804EBA00AFBCA46FBCA46FBCA
          46FBCA46B68538FF00FFFF00FFFF00FFFF00FFFF00FF73245340281E57262487
          603EB6956DCDB691CFB894D5C2A4D5C2A4DACDAFDACDAFDACDAFDACDAFDFD4BA
          DFD4BADFD4BADFD4BADFD4BADFD4BADFD4BADFD4BADFD4BADFD4BADFD4BADACD
          AFDACDAFDACDAFD7C8A8D5C2A4D5C2A4CFB894CAB290B289577A563657262440
          281E732453FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF732453
          3E3B3887603EC4A373E4D3AFEDE3CAF3EBD7F5F2DFF5F2DFFAF7EFFAF7EFFAF7
          EFFAF7EFFBF9F3FBF9F3FBF9F3FBF9F3FBF9F3FBF9F3FBF9F3FBF9F3FBF9F3FB
          F9F3FBF9F3FAF7EFF9F6EAF9F6EAF7F2E6F5F2DFF5F2DFECE6D3EDE3CADBC29D
          B289577A56363A3A3A732453FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFB200B2732453594637987145C4A373D2B689DEBB99DFCCA6E4
          D3AFE4D3AFE7D7B7E7DBC4EDE3CAEDE3CAEDE3CAEDE3CAEDE3CAEDE3CAEDE3CA
          EDE3CAEDE3CAEDE3CAEDE3CAEDE3CAEDE3CAE7DBC4E7D7B7E7D7B7E4D3AFDFCC
          A6CFB894CCAE7EB6956D87603E3A3A3A732453B200B2FF00FFFF00FFFF00FFA6
          7E51BFA784F9F7F4F7F3EED1BE9CA78066A67E51A78066B6956DB6956DBC9D79
          BDA27EBFA784BFA784C3A983C3A983C3A983C3A983C3A983C3A983C3A983C3A9
          83C3A983C3A983C3A983C3A983C3A983C3AB89C7AE8ACAB290CDB99AD5C2A4DF
          CEB8E6DBCFF2EDE5F5F0EAE7DBC4A780667A56366D411DC2A081CBAE91F5F0EA
          F8F4F1F7F3EEDFD4BAB6956D987145987145A67E51A67E51A67E51A67E51A67E
          51A67E51A67E51A67E51A67E51A67E51A67E51A67E51A67E51A67E51A67E51A6
          7E51A67E51A67E51A67E51A67E51A78066A78066B6956DB6956DC2A081CAA98B
          CBAE919871456D411D6D411D734C38885B48885B48A98773CAB3A3CEB9ACCAB3
          A3BEA08BB3907CB3907CB3907CB3907CB3907CB3907CB3907CB3907CB3907CB3
          907CB3907CB3907CB3907CB3907CB3907CB3907CB3907CB3907CB3907CB39785
          B39785B39785BEA08BBFA494C7AA9ACAB3A3CEB9ACC7AA9A885B486D411D0000
          0000000000000000000000000000000000000000000000000000000000000000
          0000A87636A876360000000000000000000000006F4929C0AD9FCAB3A3BEA08B
          B3907CC2A081CAA98BDCB58DDCB58DC7A6886F4929B28957EECDACF0D69EEBB2
          69E8AC56FBCA46FFF568FFF568FFF568E8AC567C4F025226029A6038B68538A8
          7636B68538B68538E8AC56FBCA46FBCA46E8AC56A16D28FF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FF73245340281E61442F87603E987145A67E51B6956DB695
          6DB6956DBC9D79C3A983C7AE8ACAB290CAB290CAB290CAB290CAB290CAB290CA
          B290CAB290CAB290CAB290CAB290C7AE8AC3A983BDA27EBC9D79B6956DB6956D
          9871459871457A563657262440281E732453FF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FF732453594637987145C4A373D2B689DE
          BB99DFCCA6E4D3AFE4D3AFE7D7B7E7DBC4EDE3CAEDE3CAEDE3CAEDE3CAEDE3CA
          EDE3CAEDE3CAEDE3CAEDE3CAEDE3CAEDE3CAEDE3CAEDE3CAE7DBC4E7D7B7E7D7
          B7E4D3AFDFCCA6CFB894CCAE7EB6956D87603E3A3A3A732453FF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB200B28C3E62
          8C3E62885B48987145A67E51B28957B28957B6956DB6956DC4A373C4A373CCAE
          7ECCAE7ECCAE7ECCAE7ECCAE7ECCAE7ECCAE7ECCAE7ECCAE7ECCAE7ECCAE7EC4
          A373C4A373B6956DB6956DB28957B28957987145987145885B488C3E62732453
          B200B2FF00FFFF00FFFF00FFFF00FFFF00FFA67E51F1E8DFFFFFFFF7F3EED1BE
          9CA78066A67E51A78066B6956DB6956DB6956DB6956DB6956DB6956DBC9D79BC
          9D79BC9D79BC9D79BC9D79BC9D79BC9D79BC9D79BC9D79BC9D79BC9D79BC9D79
          BC9D79BDA27EBFA784C7AE8ACBB696D5C2A4DACDAFE7DBC4E6DBCFD1BE9C8760
          3EFF00FFFF00FF6D411D987145DFCEB8F5F0EAF7F3EEF5F0EAE7DBC4D5C2A4D5
          C2A4D5C2A4D5C2A4D5C2A4D5C2A4D5C2A4D5C2A4D5C2A4D5C2A4D5C2A4D5C2A4
          D5C2A4D5C2A4D5C2A4D5C2A4D5C2A4D5C2A4D5C2A4D5C2A4D5C2A4D8C3AAD8C3
          AAD9C6ADD9C6ADD5C2A4D5C2A4D0B59BBC9D796D411DFF00FFFF00FF6D411D88
          5B48885B48885B4895735CB3907CC7AA9AC7AA9AC7AA9AC7AA9AC7AA9AC7AA9A
          C7AA9AC7AA9AC7AA9AC7AA9AC7AA9AC7AA9AC7AA9AC7AA9AC7AA9AC7AA9AC7AA
          9AC7AA9AC7AA9AC7AA9AC7AA9AC7AA9AC7AA9AC7AA9ACAB3A3CAB3A3CEB9ACCE
          B9ACD5C6B9CAB3A36D411DFF05FF000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000006F4929CEB9ACD8CBC2CAB3A3B6A38FB39785BEA08BCBAE91D0B59BBF
          A4946F4929B6956DFADBC2FFF9C7F1DAAAD5B97BE8AC56EBB269FFF568FFFE99
          E8AC567C4F026A4003987145B28957A67E51A16D28A16D28B68538C49449C494
          49C4944992641DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF73245373
          245373245361442F664833734C387A56367A563687603E87603E87603E87603E
          87603E87603E87603E87603E87603E87603E87603E87603E87603E87603E8760
          3E87603E87603E7A56367A5636734C3861442F633326732453732453732453FF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FF8C3E628C3E62885B48987145A67E51B28957B28957B6956DB6956DC4A3
          73C4A373CCAE7ECCAE7ECCAE7ECCAE7ECCAE7ECCAE7ECCAE7ECCAE7ECCAE7ECC
          AE7ECCAE7EC4A373C4A373B6956DB6956DB28957B28957987145987145885B48
          8C3E628C3E62FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB200B28C3E628C3E628C3E629D
          50619D50619D50619D50619D50619D50619D50619D50619D50619D50619D5061
          9D50619D50619D50619D50619D50619D50619D50619D50619D50619D50618C3E
          628C3E628C3E62B200B2FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFA67E51B6956DF1E8DFF9F7F4F1E8DFD5C2A4C7AE8AC7AE8ACAB290CBB696
          CBB696CDB99ACDB99ACDB99ACDB99ACDB99ACDB99ACDB99ACDB99ACDB99ACDB9
          9ACDB99ACDB99ACDB99ACDB99ACDB99AD1BE9CD1BE9CD5C2A4D9C6ADDACDAFDF
          D4BAE7DBC4DFD4BAD5C2A4A78066987145FF00FFFF00FF6D411DB6956D987145
          CBAE91E7DBC4F2EDE5F2EDE5F1E8DFF1E8DFF1E8DFF1E8DFF1E8DFF1E8DFF1E8
          DFF1E8DFF1E8DFF1E8DFF1E8DFF1E8DFF1E8DFF1E8DFF1E8DFF1E8DFF1E8DFF1
          E8DFF1E8DFF1E8DFF1E8DFF1E8DFF1E8DFF1E8DFF1E8DFE6DBCFE7DBC4DFCEB8
          A780666D411DFF00FFFF00FF6D411D885B48885B48885B48734C38885B489573
          5CA78066A78066A78066A78066A78066A78066A78066A78066A78066A78066A7
          8066A78066A78066A78066A78066A78066A78066A78066A78066A78066A78066
          A78066A78066A98773A98773B3907CB3907CB3907C95735C6D411DFF00FF0000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000006F4929C0AD9FD8CBC2CBC2B7
          B6A38FB3907CB3907CBEA08BC7AA9AB6A38F6F4929B28957E4D3AFF3EBD7FEE7
          BBD5B97BC5A25BCDAD66EBB269FDCC8ECDAD66814D125226028B6832A67E51A6
          7E51A16D2887581692641DA16D28A87636A16D28814D12FF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7324537324537324537324
          5373245373245373245373245373245373245373245373245373245373245373
          2453732453732453732453732453732453732453732453732453732453732453
          732453732453FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF8C3E628C
          3E628C3E629D50619D50619D50619D50619D50619D50619D50619D50619D5061
          9D50619D50619D50619D50619D50619D50619D50619D50619D50619D50619D50
          619D50618C3E628C3E628C3E62FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA67E51A67E51BFA784E7DB
          C4E6DBCFDFD4BADFD4BAE7DBC4E7DBC4E7DBC4E7DBC4E7DBC4E7DBC4E7DBC4E7
          DBC4E7DBC4E7DBC4E7DBC4E7DBC4E7DBC4E7DBC4E7DBC4E7DBC4E7DBC4E7DBC4
          E7DBC4E7DBC4E6DBCFE6DBCFE6DBCFEBE2D9ECE6D3D8C3AAA67E51A67E51FF00
          FFFF00FFFF00FFFF00FF6D411D6D411DC2A081987145C7A688CFB498CFB498CF
          B498CFB498CFB498CFB498D0B59BD0B59BD0B59BD0B59BD0B59BD0B59BD0B59B
          D0B59BD0B59BD0B59BD0B59BD0B59BD0B59BD0B59BD0B59BD0B59BD0B59BD0B5
          9BD0B59BCFB498CAA98BBC9D796D411D6D411DFF00FFFF00FFFF00FFFF00FF6D
          411D6D411D734C38885B48885B48885B48885B48885B48885B48885B48885B48
          885B48885B48885B48885B48885B48885B48885B48885B48885B48885B48885B
          48885B48885B48885B48885B48885B48885B48885B48885B48885B48885B4888
          5B486D411D6D411DFF00FFFF00FF000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000006F4929795A45B09D91B09D91A9877395735C95735C9A7F6AA9877382
          67516F4929987145C7AE8ADFCCA6DBC29DC4A373B28957B28957C5955FD1AA73
          B6956D8758162900006A4003875816854F2F713F136A40036A40036A4003814D
          12713F13522602FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFA67E51A67E51A67E51A67E51A67E51A67E51A67E51
          A67E51A67E51A67E51A67E51A67E51A67E51A67E51A67E51A67E51A67E51A67E
          51A67E51A67E51A67E51A67E51A67E51A67E51A67E51A67E51A67E51A67E51A6
          7E51A67E51A67E51FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          6D411D6D411D6D411D6D411D6D411D6D411D6D411D6D411D6D411D6D411D6D41
          1D6D411D6D411D6D411D6D411D6D411D6D411D6D411D6D411D6D411D6D411D6D
          411D6D411D6D411D6D411D6D411D6D411D6D411D6D411D6D411D6D411DFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6D411D6D411D6D411D6D41
          1D6D411D6D411D6D411D6D411D6D411D6D411D6D411D6D411D6D411D6D411D6D
          411D6D411D6D411D6D411D6D411D6D411D6D411D6D411D6D411D6D411D6D411D
          6D411D6D411D6D411D6D411D6D411D6D411DFF00FFFF00FFFF00FFFF00FF0000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000FF00FF6F49296F49296F4929
          6F49296F49296F49296F49296F49296F4929FF00FFFF00FFA78066A67E51A67E
          51A67E51A67E51A67E51B28957B28957987145FF00FFFF00FF29000041020041
          0200410200410200410200410200522602410200FF00FFFF00FF}
      end>
    SkinName = 'BlueGlass (internal)'
    OnAfterChange = sSkinManager1AfterChange
    Left = 177
    Top = 38
  end
  object OpenPictureDialog1: TOpenPictureDialog
    Filter = 'All (*.jpg;*.jpeg;*.bmp)|*.jpg;*.jpeg;*.bmp'
    OnSelectionChange = OpenPictureDialog1SelectionChange
    Left = 237
    Top = 197
  end
  object MainMenu1: TMainMenu
    OwnerDraw = True
    Left = 319
    Top = 6
    object MenuItem11: TMenuItem
      Caption = 'MenuItem1'
      object MenuItem111: TMenuItem
        Caption = 'MenuItem11'
      end
      object MenuItem121: TMenuItem
        Caption = 'MenuItem12'
      end
      object MenuItem131: TMenuItem
        Caption = 'MenuItem13'
      end
      object MenuItem141: TMenuItem
        Caption = 'MenuItem14'
      end
      object MenuItem151: TMenuItem
        Caption = 'MenuItem15'
        object MenuItem1511: TMenuItem
          Caption = 'MenuItem151'
        end
        object MenuItem1521: TMenuItem
          Caption = 'MenuItem152'
        end
        object MenuItem1531: TMenuItem
          Caption = 'MenuItem153'
        end
        object MenuItem1541: TMenuItem
          Caption = 'MenuItem154'
        end
        object MenuItem1551: TMenuItem
          Caption = 'MenuItem155'
        end
      end
      object MenuItem161: TMenuItem
        Caption = 'MenuItem16'
      end
    end
    object MenuItem21: TMenuItem
      Caption = 'Go to online-home'
      OnClick = sButton6Click
    end
    object MenuItem31: TMenuItem
      Caption = 'Feedback'
      OnClick = sButton5Click
    end
  end
  object sSkinProvider1: TsSkinProvider
    CaptionAlignment = taCenter
    CommonData.SkinSection = 'FORM'
    ShowAppIcon = False
    TitleButtons = <>
    Left = 178
    Top = 9
  end
end
