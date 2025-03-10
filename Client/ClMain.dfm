object frmMain: TfrmMain
  Left = 540
  Top = 398
  VertScrollBar.ParentColor = False
  BorderStyle = bsNone
  Caption = 'legend of mir2'
  ClientHeight = 239
  ClientWidth = 221
  Color = clBackground
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  Icon.Data = {
    0000010001002020100000000000E80200001600000028000000200000004000
    0000010004000000000080020000000000000000000000000000000000000000
    000000008000008000000080800080000000800080008080000080808000C0C0
    C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF008777
    7777777777777777777777777777F7770077700077000007000700000077F877
    7777777777777700777777777007F8F8F888888777F8887778877777F777F8F8
    8778888777878877707777778777F8F87078F87007888000000000007777F8F8
    7078000007887007777770078777F8F87078FF8700787078888778707777F8F8
    7008FF87007F707777877770F777F8F8707FFFF800788077000000778777F8F8
    7007777700F8707FF88877888707F8F77007777700877078877777888777F8F7
    7078888F00877007000000888777F7888078878F70877007888878887777F7F8
    7000000000778077777887877777F7F77078888800777077000000888777F8F7
    7078F8880087707F888777888777F8F77078887700787077777700888777F7F8
    70007000007870077777007FF777F8F8778FFF8877888877788800788777F787
    7777777777777887778800788777F7877700770077000077777800788770F8F7
    7700787078777007777700078777F8F88700887008887077777700777777F8F8
    7707F87007787078888877888700F8F77707777000777077777777888777FF77
    7777007700077077777700088777F8F88777707777787078888777777777F8FF
    F88870077787700787FF87778707FFFF788877777787777888F878877700F8FF
    FFFFFFFFFFFFFFFFFFFFFFFFF707FFFFF8887788778FF87778FF887787770000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    000000000000000000000000000000000000000000000000000000000000}
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnKeyUp = FormKeyUp
  OnMouseWheelDown = FormMouseWheelDown
  OnMouseWheelUp = FormMouseWheelUp
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object DXDraw: TDXDraw
    Left = 0
    Top = 0
    Width = 221
    Height = 239
    AutoInitialize = True
    AutoSize = False
    Color = clBtnFace
    Display.BitCount = 32
    Display.FixedBitCount = True
    Display.FixedRatio = True
    Display.FixedSize = False
    Display.Height = 600
    Display.Width = 800
    Options = [doAllowReboot, doWaitVBlank, doSystemMemory, doHardware]
    SurfaceHeight = 428
    SurfaceWidth = 663
    OnFinalize = DXDrawFinalize
    OnInitialize = DXDrawInitialize
    Align = alClient
    ParentShowHint = False
    ShowHint = False
    TabOrder = 0
    OnClick = DXDrawClick
    OnDblClick = DXDrawDblClick
    OnMouseDown = DXDrawMouseDown
    OnMouseMove = DXDrawMouseMove
    OnMouseUp = DXDrawMouseUp
  end
  object CSocket: TClientSocket
    Active = False
    ClientType = ctNonBlocking
    Port = 0
    OnConnect = CSocketConnect
    OnDisconnect = CSocketDisconnect
    OnRead = CSocketRead
    OnError = CSocketError
    Left = 8
    Top = 208
  end
  object Timer1: TTimer
    Interval = 10
    OnTimer = Timer1Timer
    Left = 8
    Top = 40
  end
  object MouseTimer: TTimer
    Interval = 50
    OnTimer = MouseTimerTimer
    Left = 8
    Top = 72
  end
  object WaitMsgTimer: TTimer
    Enabled = False
    Interval = 1
    OnTimer = WaitMsgTimerTimer
    Left = 8
    Top = 8
  end
  object SelChrWaitTimer: TTimer
    Enabled = False
    Interval = 2000
    OnTimer = SelChrWaitTimerTimer
    Left = 40
    Top = 8
  end
  object CmdTimer: TTimer
    Enabled = False
    OnTimer = CmdTimerTimer
    Left = 40
    Top = 40
  end
  object SpeedHackTimer: TTimer
    Interval = 6000
    OnTimer = SpeedHackTimerTimer
    Left = 40
    Top = 72
  end
  object Timer2: TTimer
    Enabled = False
    OnTimer = Timer2Timer
    Left = 40
    Top = 104
  end
  object FishingTime: TTimer
    Enabled = False
    Interval = 40
    OnTimer = FishingTimeTimer
    Left = 40
    Top = 136
  end
  object StoreMacro: TTimer
    Enabled = False
    Interval = 10000
    OnTimer = StoreMacroTimer
    Left = 8
    Top = 104
  end
  object LoverMacro: TTimer
    Enabled = False
    Interval = 10000
    OnTimer = LoverMacroTimer
    Left = 8
    Top = 136
  end
  object Timer5Process: TTimer
    Enabled = False
    Interval = 2000
    OnTimer = Timer5ProcessTimer
    Left = 40
    Top = 168
  end
  object Timer4Module: TTimer
    OnTimer = Timer4ModuleTimer
    Left = 8
    Top = 168
  end
  object Timer3: TTimer
    Enabled = False
    OnTimer = Timer3Timer
    Left = 72
    Top = 8
  end
  object TimerStartGame: TTimer
    Enabled = False
    OnTimer = TimerStartGameTimer
    Left = 128
    Top = 8
  end
  object TimerCheckRun: TTimer
    Enabled = False
    Interval = 2000
    OnTimer = TimerCheckRunTimer
    Left = 160
    Top = 8
  end
  object TimerStopGame: TTimer
    Enabled = False
    OnTimer = TimerStopGameTimer
    Left = 96
    Top = 8
  end
end
