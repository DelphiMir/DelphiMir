object frmGlobaSession: TfrmGlobaSession
  Left = 185
  Top = 147
  BorderStyle = bsSingle
  Caption = 'Global Sessions'
  ClientHeight = 207
  ClientWidth = 527
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = '??'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 15
  object StringGrid: TStringGrid
    Left = 10
    Top = 12
    Width = 511
    Height = 189
    DefaultRowHeight = 18
    FixedCols = 0
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
    TabOrder = 0
    ColWidths = (
      98
      103
      91
      121
      88)
  end
  object RefTimer: TTimer
    Enabled = False
    OnTimer = RefTimerTimer
    Left = 353
    Top = 139
  end
end
