object FrmNewChr: TFrmNewChr
  Left = 205
  Top = 259
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'New Character'
  ClientHeight = 63
  ClientWidth = 243
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 31
    Height = 13
    Caption = 'Name:'
  end
  object EdName: TEdit
    Left = 8
    Top = 28
    Width = 129
    Height = 21
    ImeName = 'Microsoft Office IME 2007'
    TabOrder = 0
  end
  object Button1: TButton
    Left = 152
    Top = 24
    Width = 75
    Height = 25
    Caption = '&Ok'
    ModalResult = 1
    TabOrder = 1
    OnClick = Button1Click
  end
end
