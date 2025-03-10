object frmMessageFilterConfig: TfrmMessageFilterConfig
  Left = 208
  Top = 225
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #28040#24687#36807#28388
  ClientHeight = 244
  ClientWidth = 290
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435'?'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 15
  object Label1: TLabel
    Left = 10
    Top = 10
    Width = 51
    Height = 15
    Caption = #36807#28388#25991#26412':'
  end
  object ListBoxFilterText: TListBox
    Left = 10
    Top = 30
    Width = 191
    Height = 201
    ItemHeight = 15
    TabOrder = 0
    OnClick = ListBoxFilterTextClick
    OnDblClick = ListBoxFilterTextDblClick
  end
  object ButtonAdd: TButton
    Left = 213
    Top = 80
    Width = 71
    Height = 31
    Caption = #22686#21152'(&A)'
    TabOrder = 1
    OnClick = ButtonAddClick
  end
  object ButtonDel: TButton
    Left = 213
    Top = 120
    Width = 71
    Height = 31
    Caption = #21024#38500'(&D)'
    TabOrder = 2
    OnClick = ButtonDelClick
  end
  object ButtonOK: TButton
    Left = 213
    Top = 200
    Width = 71
    Height = 31
    Caption = #30830#23450'(&O)'
    TabOrder = 3
    OnClick = ButtonOKClick
  end
  object ButtonMod: TButton
    Left = 213
    Top = 160
    Width = 71
    Height = 31
    Caption = #20462#25913'(&M)'
    TabOrder = 4
    OnClick = ButtonModClick
  end
end
