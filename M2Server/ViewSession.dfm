object frmViewSession: TfrmViewSession
  Left = 606
  Top = 529
  Width = 422
  Height = 194
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = #26597#30475#20840#23616#20250#35805
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 12
  object ButtonRefGrid: TButton
    Left = 328
    Top = 128
    Width = 73
    Height = 25
    Caption = #21047#26032'(&R)'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = ButtonRefGridClick
  end
  object PanelStatus: TPanel
    Left = 8
    Top = 8
    Width = 393
    Height = 113
    TabOrder = 1
    object GridSession: TStringGrid
      Left = 0
      Top = 0
      Width = 393
      Height = 105
      ColCount = 6
      DefaultRowHeight = 18
      FixedCols = 0
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
      ParentFont = False
      TabOrder = 0
      ColWidths = (
        34
        83
        103
        56
        49
        58)
    end
  end
end
