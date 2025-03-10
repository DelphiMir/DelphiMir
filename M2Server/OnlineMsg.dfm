object frmOnlineMsg: TfrmOnlineMsg
  Left = 478
  Top = 247
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #22312#32447#28040#24687
  ClientHeight = 429
  ClientWidth = 429
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 12
  object Label1: TLabel
    Left = 10
    Top = 211
    Width = 54
    Height = 12
    Caption = #28040#24687#20869#23481':'
  end
  object ComboBoxMsg: TComboBox
    Left = 70
    Top = 206
    Width = 347
    Height = 25
    Hint = 'Type message here to be sent then click send or add'
    Style = csSimple
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ImeName = 'Microsoft Office IME 2007'
    ItemHeight = 16
    ParentFont = False
    TabOrder = 0
    OnChange = ComboBoxMsgChange
    OnKeyPress = ComboBoxMsgKeyPress
  end
  object MemoMsg: TMemo
    Left = 0
    Top = 0
    Width = 433
    Height = 193
    Hint = 'Sent messages'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = #23435#20307
    Font.Style = []
    ImeName = 'Microsoft Office IME 2007'
    ParentFont = False
    TabOrder = 1
    OnChange = MemoMsgChange
  end
  object StringGrid: TStringGrid
    Left = 0
    Top = 272
    Width = 433
    Height = 157
    Hint = 'Stored mesage list'
    ColCount = 1
    DefaultColWidth = 430
    DefaultRowHeight = 18
    FixedCols = 0
    RowCount = 1
    FixedRows = 0
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 2
    OnClick = StringGridClick
    OnDblClick = StringGridDblClick
  end
  object ButtonAdd: TButton
    Left = 331
    Top = 239
    Width = 84
    Height = 29
    Hint = 'Adds the typed mesage to the stored message list'
    Caption = #28155#21152'(&A)'
    Enabled = False
    TabOrder = 3
    OnClick = ButtonAddClick
  end
  object ButtonDelete: TButton
    Left = 230
    Top = 239
    Width = 84
    Height = 29
    Hint = 'Deletes the selected message from the stored mesage list'
    Caption = #21024#38500'(&D)'
    Enabled = False
    TabOrder = 4
    OnClick = ButtonDeleteClick
  end
  object ButtonSend: TButton
    Left = 17
    Top = 238
    Width = 84
    Height = 28
    Hint = 'Will send message and display it ingame'
    Caption = #21457#36865'(&S)'
    TabOrder = 5
    OnClick = ButtonSendClick
  end
end
