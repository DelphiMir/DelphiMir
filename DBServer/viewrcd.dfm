object FrmFDBViewer: TFrmFDBViewer
  Left = 488
  Top = 319
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Record Viewer'
  ClientHeight = 181
  ClientWidth = 1009
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object TabbedNotebook1: TTabbedNotebook
    Left = 0
    Top = 0
    Width = 1009
    Height = 181
    Align = alClient
    TabFont.Charset = DEFAULT_CHARSET
    TabFont.Color = clBtnText
    TabFont.Height = -11
    TabFont.Name = 'MS Sans Serif'
    TabFont.Style = []
    TabOrder = 0
    object TTabPage
      Left = 4
      Top = 24
      Caption = '????'
      object HumanGrid: TStringGrid
        Left = 0
        Top = 0
        Width = 1001
        Height = 153
        Align = alClient
        ColCount = 12
        DefaultColWidth = 70
        DefaultRowHeight = 20
        FixedCols = 0
        RowCount = 7
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goThumbTracking]
        TabOrder = 0
        ColWidths = (
          59
          98
          62
          62
          60
          82
          59
          78
          59
          150
          144
          70)
      end
    end
    object TTabPage
      Left = 4
      Top = 24
      HelpContext = 1
      Caption = '?????'
      object BagItemGrid: TStringGrid
        Left = 0
        Top = 0
        Width = 1001
        Height = 153
        Align = alClient
        ColCount = 4
        DefaultRowHeight = 20
        FixedCols = 0
        RowCount = 63
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goThumbTracking]
        TabOrder = 0
        ColWidths = (
          48
          88
          63
          125)
      end
    end
    object TTabPage
      Left = 4
      Top = 24
      HelpContext = 2
      Caption = '?????'
      object SaveItemGrid: TStringGrid
        Left = 0
        Top = 0
        Width = 1001
        Height = 153
        Align = alClient
        ColCount = 3
        DefaultRowHeight = 20
        FixedCols = 0
        RowCount = 52
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goThumbTracking]
        TabOrder = 0
        ColWidths = (
          102
          57
          126)
      end
    end
    object TTabPage
      Left = 4
      Top = 24
      HelpContext = 3
      Caption = '??'
      object UseMagicGrid: TStringGrid
        Left = 0
        Top = 0
        Width = 1001
        Height = 153
        Align = alClient
        ColCount = 4
        DefaultRowHeight = 20
        FixedCols = 0
        RowCount = 40
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goThumbTracking]
        TabOrder = 0
        ColWidths = (
          82
          67
          66
          112)
      end
    end
  end
end
