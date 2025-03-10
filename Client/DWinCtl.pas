unit DWinCtl;

interface

uses
  Windows, Classes, Graphics, SysUtils, Controls, DXDraws, DXClass,  impimepatch,
  Forms, DirectX, DIB, Grids, wmUtil, HUtil32, Wil, cliUtil;


type
   pTDTreeNodes = ^TDTreeNodes;
   TDTreeNodes = packed record
    sName: string;
    Item: Pointer;
    ItemList: TList;
    boOpen: Boolean;
    nNameLen: Integer;
    boMaster: Boolean;
  end;

   TClickSound = (csNone, csStone, csGlass, csNorm);
   TMouseWheel = (mw_Down, mw_Up);

   TDControl = class;
   TOnDirectPaint = procedure(Sender: TObject; dsurface: TDirectDrawSurface) of object;
   TOnKeyPress = procedure(Sender: TObject; var Key: Char) of object;
   TOnKeyDown = procedure(Sender: TObject; var Key: word; Shift: TShiftState) of object;
   TOnMouseMove = procedure(Sender: TObject; Shift: TShiftState; X, Y: integer) of object;
   TOnMouseDown = procedure(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: integer) of object;
   TOnMouseUp = procedure(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer) of object;
   TOnClick = procedure(Sender: TObject) of object;
   TOnVisible = procedure(Sender: TObject; boVisible: Boolean) of object;
   TOnClickEx = procedure(Sender: TObject; X, Y: integer) of object;
   TOnInRealArea = procedure(Sender: TObject; X, Y: integer; var IsRealArea: Boolean) of object;
   TOnGridSelect = procedure(Sender: TObject; X, Y: integer; ACol, ARow: integer; Shift: TShiftState) of object;
   TOnGridPaint = procedure(Sender: TObject; ACol, ARow: integer; Rect: TRect; State: TGridDrawState; dsurface: TDirectDrawSurface) of object;
   TOnClickSound = procedure(Sender: TObject; Clicksound: TClickSound) of object;
   TOnMouseWheel = procedure(Shift: TShiftState; Wheel: TMouseWheel; X, Y: Integer) of object;

   TDControl = class (TCustomControl)
   private
      FCaption: string;      //0x1F0
      FDParent: TDControl;   //0x1F4
      FEnableFocus: Boolean; //0x1F8
      FOnDirectPaint: TOnDirectPaint; //0x1FC
      FOnEndDirectPaint: TOnDirectPaint;
      FOnKeyPress: TOnKeyPress; //0x200
      FOnKeyDown: TOnKeyDown;   //0x204
      FWheelDControl: TDControl;
      FOnMouseWheel: TOnMouseWheel;
      FOnMouseMove: TOnMouseMove; //0x208
      FOnMouseDown: TOnMouseDown; //0x20C
      FOnMouseUp: TOnMouseUp;     //0x210
      FOnDblClick: TNotifyEvent;  //0x214
      FOnClick: TOnClickEx;       //0x218
      FOnInRealArea: TOnInRealArea; //0x21C
      FOnBackgroundClick: TOnClick; //0x220
      FChangeCaption: Boolean;
      FSurface: TDirectDrawSurface;
      FAppendData: Pointer;

      FDFColor: TColor;
      FDFMoveColor: TColor;
      FDFEnabledColor: TColor;
      FDFDownColor: TColor;
      FDFBackColor: TColor;

      procedure SetCaption (str: string);
      function GetMouseMove: Boolean;     //마우스
      procedure SetVisible(Value: Boolean);  //마우스
   protected
      FVisible: Boolean;
      FEnabled: Boolean;
      procedure ReleaseFocus; dynamic;    //마우스
   public
      NoPaint: Boolean;
      Background: Boolean; //0x24D
      DControls: TList;    //0x250
      //FaceSurface: TDirectDrawSurface;
      WLib: TWMImages;     //0x254
      FaceIndex: integer;  //0x258
      WantReturn: Boolean; //Background, Click
      AppendTick: LongWord;
      constructor Create (AOwner: TComponent); override;
      destructor Destroy; override;
      procedure Paint; override;
      procedure Loaded; override;
      function  SurfaceX (x: integer): integer;
      function  SurfaceY (y: integer): integer;
      function  LocalX (x: integer): integer;
      function  LocalY (y: integer): integer;
      procedure AddChild (dcon: TDControl);
      procedure DelChild(dcon: TDControl);
      procedure ChangeChildOrder (dcon: TDControl);
      function  InRange (x, y: integer): Boolean; reintroduce; dynamic;
      function  KeyPress (var Key: Char): Boolean;reintroduce; dynamic;
      function  KeyDown (var Key: Word; Shift: TShiftState): Boolean; reintroduce; dynamic;
      function  MouseMove (Shift: TShiftState; X, Y: Integer): Boolean; reintroduce; dynamic;
      function  MouseDown (Button: TMouseButton; Shift: TShiftState; X, Y: Integer): Boolean;reintroduce; dynamic;
      function  MouseUp (Button: TMouseButton; Shift: TShiftState; X, Y: Integer): Boolean; reintroduce; dynamic;
      function MouseWheel(Shift: TShiftState; Wheel: TMouseWheel; X, Y: Integer): Boolean; reintroduce; dynamic;
      function  DblClick (X, Y: integer): Boolean; reintroduce; dynamic;
      function  Click (X, Y: integer): Boolean; reintroduce; dynamic;

      function  CanFocusMsg: Boolean;

      procedure SetImgIndex (Lib: TWMImages; index: integer);
    //  procedure CreateSurface(Lib: TWMImages; boActive: Boolean = True; index: integer = 0); dynamic;
      procedure SetSurface(DDraw: TDirectDraw; Lib: TWMImages; index: integer = 0); dynamic;
      procedure CloseSurface(); dynamic;
      procedure DirectPaint (dsurface: TDirectDrawSurface); dynamic;

      property ChangeCaption: Boolean read FChangeCaption;
      property MouseMoveing: Boolean read GetMouseMove;      //마우스
      property GSurface: TDirectDrawSurface read FSurface;
      property AppendData: Pointer read FAppendData write FAppendData;
   published
      property DFColor: TColor read FDFColor write FDFColor;
      property DFEnabledColor: TColor read FDFEnabledColor write FDFEnabledColor;
      property DFMoveColor: TColor read FDFMoveColor write FDFMoveColor;
      property DFDownColor: TColor read FDFDownColor write FDFDownColor;
      property DFBackColor: TColor read FDFBackColor write FDFBackColor;

      property OnDirectPaint: TOnDirectPaint read FOnDirectPaint write FOnDirectPaint;
      property OnEndDirectPaint: TOnDirectPaint read FOnEndDirectPaint write FOnEndDirectPaint;
      property OnKeyPress: TOnKeyPress read FOnKeyPress write FOnKeyPress;
      property OnKeyDown: TOnKeyDown read FOnKeyDown write FOnKeyDown;
      property WheelDControl: TDControl read FWheelDControl write FWheelDControl;
      property OnMouseWheel: TOnMouseWheel read FOnMouseWheel write FOnMouseWheel;
      property OnMouseMove: TOnMouseMove read FOnMouseMove write FOnMouseMove;
      property OnMouseDown: TOnMouseDown read FOnMouseDown write FOnMouseDown;
      property OnMouseUp: TOnMouseUp read FOnMouseUp write FOnMouseUp;
      property OnDblClick: TNotifyEvent read FOnDblClick write FOnDblClick;
      property OnClick: TOnClickEx read FOnClick write FOnClick;
      property OnInRealArea: TOnInRealArea read FOnInRealArea write FOnInRealArea;
      property OnBackgroundClick: TOnClick read FOnBackgroundClick write FOnBackgroundClick;
      property Caption: string read FCaption write SetCaption;
      property DParent: TDControl read FDParent write FDParent;
      property Visible: Boolean read FVisible write FVisible;
      property Enabled: Boolean read FEnabled write FEnabled;
      property EnableFocus: Boolean read FEnableFocus write FEnableFocus;
      property Color;
      property Font;
      property Hint;
      property ShowHint;
      property Align;
   end;

   TDButton = class (TDControl)
   private
      FClickSound: TClickSound;
      FOnClick: TOnClickEx;
      FOnClickSound: TOnClickSound;
   public
      Downed: Boolean;
      DontDrawUp: Boolean;
      constructor Create (AOwner: TComponent); override;
      function  MouseMove (Shift: TShiftState; X, Y: Integer): Boolean; override;
      function  MouseDown (Button: TMouseButton; Shift: TShiftState; X, Y: Integer): Boolean; override;
      function  MouseUp (Button: TMouseButton; Shift: TShiftState; X, Y: Integer): Boolean; override;
    //  procedure DirectPaint(dsurface: TDirectDrawSurface); override;
   published
      property ClickCount: TClickSound read FClickSound write FClickSound;
      property OnClick: TOnClickEx read FOnClick write FOnClick;
      property OnClickSound: TOnClickSound read FOnClickSound write FOnClickSound;
   end;

   TDMoveButton = class (TDButton)  //무브 버튼
   private
      FFloating: Boolean;
      SpotX, SpotY: integer;
   protected
      procedure SetVisible (flag: Boolean);
   public
      iMisc:Array[0..1] of Integer;
      sMisc: String;
      sMisc2: String;
      DialogResult: TModalResult;
      FOnClick: TOnClickEx;
      Boxmovetop:Integer;
      ttt:string;
      RLeft:Integer;
      RTop:Integer;
      outidx:Integer;
      inidx:Integer;
      outHeight:Integer;
      listcont:Integer;
      MoveHeight:Integer;
      Reverse:Boolean;
      rotmidx:Integer;
      constructor Create (AOwner: TComponent); override;
      function  MouseMove (Shift: TShiftState; X, Y: Integer): Boolean; override;
      function  MouseDown (Button: TMouseButton; Shift: TShiftState; X, Y: Integer): Boolean; override;
      function  MouseUp (Button: TMouseButton; Shift: TShiftState; X, Y: Integer): Boolean; override;
      procedure Show;
      function  ShowModal: integer;
      procedure exitHeightout;
      procedure UpHeightout;
   published
      property Visible: Boolean read FVisible write SetVisible;
      property Floating: Boolean read FFloating write FFloating;
      property OnClick: TOnClickEx read FOnClick write FOnClick;
      property FBoxmovetop: Integer read Boxmovetop write Boxmovetop;
      property TypeRLeft: Integer read RLeft write RLeft;
      property TypeRTop: Integer read RTop write RTop;
      property TReverse: Boolean read Reverse write Reverse;
   end;

   TDGrid = class (TDControl)
   private
      FColCount, FRowCount: integer;
      FColWidth, FRowHeight: integer;
      FViewTopLine: integer;
      SelectCell: TPoint;
      DownPos: TPoint;
      FOnGridSelect: TOnGridSelect;
      FOnGridMouseMove: TOnGridSelect;
      FOnGridPaint: TOnGridPaint;
      function  GetColRow (x, y: integer; var acol, arow: integer): Boolean;
   public
      CX, CY: integer;
      Col, Row: integer;
      constructor Create (AOwner: TComponent); override;
      function  MouseMove (Shift: TShiftState; X, Y: Integer): Boolean; override;
      function  MouseDown (Button: TMouseButton; Shift: TShiftState; X, Y: Integer): Boolean; override;
      function  MouseUp (Button: TMouseButton; Shift: TShiftState; X, Y: Integer): Boolean; override;
      function  Click (X, Y: integer): Boolean; override;
      procedure DirectPaint (dsurface: TDirectDrawSurface); override;
   published
      property ColCount: integer read FColCount write FColCount;
      property RowCount: integer read FRowCount write FRowCount;
      property ColWidth: integer read FColWidth write FColWidth;
      property RowHeight: integer read FRowHeight write FRowHeight;
      property ViewTopLine: integer read FViewTopLine write FViewTopLine;
      property OnGridSelect: TOnGridSelect read FOnGridSelect write FOnGridSelect;
      property OnGridMouseMove: TOnGridSelect read FOnGridMouseMove write FOnGridMouseMove;
      property OnGridPaint: TOnGridPaint read FOnGridPaint write FOnGridPaint;
   end;

   TDWindow = class (TDButton)
   private
      FFloating: Boolean;
      SpotX, SpotY: integer;
   protected
      procedure SetVisible (flag: Boolean);
   public
      iMisc:Array[0..1] of Integer;
      sMisc: String;
      sMisc2: String;      
      DialogResult: TModalResult;
      constructor Create (AOwner: TComponent); override;
      function  MouseMove (Shift: TShiftState; X, Y: Integer): Boolean; override;
      function  MouseDown (Button: TMouseButton; Shift: TShiftState; X, Y: Integer): Boolean; override;
      function  MouseUp (Button: TMouseButton; Shift: TShiftState; X, Y: Integer): Boolean; override;
      procedure Show;
      function  ShowModal: integer;
   published
      property Visible: Boolean read FVisible write SetVisible;
      property Floating: Boolean read FFloating write FFloating;
   end;

   TDWinManager = class (TComponent)
   private
   public
      DWinList: TList; //list of TDControl;
      constructor Create (AOwner: TComponent); override;
      destructor Destroy; override;
      procedure AddDControl (dcon: TDControl; visible: Boolean);
      procedure DelDControl (dcon: TDControl);
      procedure ClearAll;

      function  KeyPress (var Key: Char): Boolean;
      function  KeyDown (var Key: Word; Shift: TShiftState): Boolean;
      function  MouseWheel(Shift: TShiftState; Wheel: TMouseWheel; X, Y: Integer): Boolean;
      function  MouseMove (Shift: TShiftState; X, Y: Integer): Boolean;
      function  MouseDown (Button: TMouseButton; Shift: TShiftState; X, Y: Integer): Boolean;
      function  MouseUp (Button: TMouseButton; Shift: TShiftState; X, Y: Integer): Boolean;
      function  DblClick (X, Y: integer): Boolean;
      function  Click (X, Y: integer): Boolean;
      procedure DirectPaint (dsurface: TDirectDrawSurface);
   end;

   TDCheckBox = class(TDControl)
  private
    FChecked: Boolean;
    FFontSpace: Integer;
    FOnClick: TOnClickEx;
    FWidth: Integer;
    FHeight: Integer;
    FOffsetLeft: Integer;
    FOffsetTop: Integer;
    FOnCheckedChange: TOnClick;
  public
    constructor Create(AOwner: TComponent); override;
    function MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer):
      Boolean; override;
    function MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer):
      Boolean; override;
    procedure DirectPaint(dsurface: TDirectDrawSurface); override;
    function InRange(x, y: integer): Boolean; override;
  published
    property Checked: Boolean read FChecked write FChecked;
    property FontSpace: Integer read FFontSpace write FFontSpace;
    property OnClick: TOnClickEx read FOnClick write FOnClick;
    property OnChange: TOnClick read FOnCheckedChange write FOnCheckedChange;
    property OffsetLeft: Integer read FOffsetLeft write FOffsetLeft;
    property OffsetTop: Integer read FOffsetTop write FOffsetTop;
  end;

   TDUpDown = class(TDButton)
  private
    FUpButton: TDButton;
    FDownButton: TDButton;
    FMoveButton: TDButton;
    FPosition: Integer;
    FMaxPosition: Integer;
    FOnPositionChange: TOnClick;
    FTop: Integer;
    FAddTop: Integer;
    FMaxLength: Integer;
    FOffset: Integer;                    
    FBoMoveShow: Boolean;
    FboMoveFlicker: Boolean;
    FboNormal: Boolean;
    StopY: Integer;
    FStopY: Integer;
    FClickTime: LongWord;
    FMovePosition: Integer;
    procedure SetButton(Button: TDButton);
    procedure SetPosition(value: Integer);
    procedure SetMaxPosition(const Value: Integer);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function MouseWheel(Shift: TShiftState; Wheel: TMouseWheel; X, Y: Integer): Boolean; override;
    procedure DirectPaint(dsurface: TDirectDrawSurface); override;
    procedure ButtonMouseMove(Sender: TObject; Shift: TShiftState; X, Y: integer);
    procedure ButtonMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure ButtonMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    property UpButton: TDButton read FUpButton;
    property DownButton: TDButton read FDownButton;
    property MoveButton: TDButton read FMoveButton;
  published
    property Position: Integer read FPosition write SetPosition;
    property Offset: Integer read FOffset write FOffset;
    property Normal: Boolean read FboNormal write FboNormal;
    property MovePosition: Integer read FMovePosition write FMovePosition;
    property MoveShow: Boolean read FBoMoveShow write FBoMoveShow;
    property MaxPosition: Integer read FMaxPosition write SetMaxPosition;
    property MoveFlicker: Boolean read FboMoveFlicker write FboMoveFlicker;
    property OnPositionChange: TOnClick read FOnPositionChange write FOnPositionChange;
  end;

procedure Register;
procedure SetDFocus (dcon: TDControl);
procedure ReleaseDFocus;
procedure SetDCapture (dcon: TDControl);
procedure ReleaseDCapture;

var
   MouseCaptureControl: TDControl; //mouse message
   FocusedControl: TDControl; //Key message
   MainWinHandle: integer;
   ModalDWindow: TDControl;
   MouseMoveControl: TDControl;    //마우스

implementation

uses
  Share, ClFunc;

procedure Register;
begin
   RegisterComponents('MirGame', [TDWinManager, TDControl, TDButton, TDGrid, TDWindow, TDmoveButton, TDUpDown, TDCheckBox]);
end;


procedure SetDFocus (dcon: TDControl);
begin
   FocusedControl := dcon;
end;

procedure ReleaseDFocus;
begin
   FocusedControl := nil;
end;

procedure SetDCapture (dcon: TDControl);
begin
   SetCapture (MainWinHandle);
   MouseCaptureControl := dcon;
end;

procedure ReleaseDCapture;
begin
   ReleaseCapture;
   MouseCaptureControl := nil;
end;

{----------------------------- TDControl -------------------------------}

constructor TDControl.Create (AOwner: TComponent);
begin
   inherited Create (AOwner);
   DParent := nil;
   inherited Visible := FALSE;
   FEnableFocus := FALSE;
   FEnabled := True;
   Background := FALSE;

   FAppendData := nil;
   AppendTick := GetTickCount;

   FOnDirectPaint := nil;
   FOnEndDirectPaint := nil;
   FOnKeyPress := nil;
   FOnKeyDown := nil;
   FOnMouseMove := nil;
   FOnMouseDown := nil;
   FOnMouseUp := nil;
   FOnInRealArea := nil;
   DControls := TList.Create;
   FDParent := nil;
   FWheelDControl := nil;
   FOnMouseWheel := nil;

   Width := 80;
   Height:= 24;
   FCaption := '';
   //FaceSurface := nil;
   WLib := nil;
   FaceIndex := 0;

   FDFColor := $C5D2BD;
   FDFMoveColor := $C5D2BD;
   FDFEnabledColor := $C5D2BD;
   FDFDownColor := clWhite;
   FDFBackColor := $8;
end;

destructor TDControl.Destroy;
begin

   if Self = MouseMoveControl then MouseMoveControl := nil;     //마우스

   DControls.Free;
   if FSurface <> nil then
    FSurface.Free;
   FSurface := nil;
   inherited Destroy;
end;

function TDControl.GetMouseMove: Boolean;   //마우스
begin
  Result := MouseMoveControl = Self;
end;

procedure TDControl.SetCaption (str: string);
begin
   FCaption := str;
   FChangeCaption := True;
   if csDesigning in ComponentState then begin
      Refresh;
   end;
end;

procedure TDControl.Paint;
begin
   if csDesigning in ComponentState then begin
      if self is TDWindow then begin
         with Canvas do begin
            Pen.Color := clBlack;
            MoveTo (0, 0);
            LineTo (Width-1, 0);
            LineTo (Width-1, Height-1);
            LineTo (0, Height-1);
            LineTo (0, 0);
            LineTo (Width-1, Height-1);
            MoveTo (Width-1, 0);
            LineTo (0, Height-1);
            TextOut ((Width-TextWidth(Caption)) div 2, (Height-TextHeight(Caption)) div 2, Caption);
         end;
      end else begin
         with Canvas do begin
            Pen.Color := clBlack;
            MoveTo (0, 0);
            LineTo (Width-1, 0);
            LineTo (Width-1, Height-1);
            LineTo (0, Height-1);
            LineTo (0, 0);
            TextOut ((Width-TextWidth(Caption)) div 2, (Height-TextHeight(Caption)) div 2, Caption);
         end;
      end;
   end;
end;

procedure TDControl.Loaded;
var
   i: integer;
   dcon: TDControl;
begin
   if not (csDesigning in ComponentState) then begin
      if Parent <> nil then
         for i:=0 to TControl(Parent).ComponentCount-1 do begin
            if TControl(Parent).Components[i] is TDControl then begin
               dcon := TDControl(TControl(Parent).Components[i]);
               if dcon.DParent = self then begin
                  AddChild (dcon);
               end;
            end;
         end;
   end;
end;

function  TDControl.SurfaceX (x: integer): integer;
var
   d: TDControl;
begin
   d := self;
   while TRUE do begin
      if d.DParent = nil then break;
      x := x + d.DParent.Left;
      d := d.DParent;
   end;
   Result := x;
end;

function  TDControl.SurfaceY (y: integer): integer;
var
   d: TDControl;
begin
   d := self;
   while TRUE do begin
      if d.DParent = nil then break;
      y := y + d.DParent.Top;
      d := d.DParent;
   end;
   Result := y;
end;

function  TDControl.LocalX (x: integer): integer;
var
   d: TDControl;
begin
   d := self;
   while TRUE do begin
      if d.DParent = nil then break;
      x := x - d.DParent.Left;
      d := d.DParent;
   end;
   Result := x;
end;

function  TDControl.LocalY (y: integer): integer;
var
   d: TDControl;
begin
   d := self;
   while TRUE do begin
      if d.DParent = nil then break;
      y := y - d.DParent.Top;
      d := d.DParent;
   end;
   Result := y;
end;

procedure TDControl.SetVisible(Value: Boolean);      //마우스
begin
  if FVisible <> Value then begin
    FVisible := Value;
    if FVisible then begin
      SetFocus;
    end else begin
      ReleaseFocus;
    end;
  end;
end;

procedure TDControl.ReleaseFocus;
var
  I: Integer;
begin
  if Self = MouseMoveControl then MouseMoveControl := nil;   //마우스
  for I := 0 to DControls.Count - 1 do begin
    TDControl(DControls[I]).ReleaseFocus;
  end;
end;

procedure TDControl.AddChild (dcon: TDControl);
begin
   DControls.Add (Pointer (dcon));
end;

procedure TDControl.DelChild(dcon: TDControl);
var
  I: Integer;
begin
  for I := 0 to DControls.Count - 1 do begin
    if DControls[I] = dcon then begin
      DControls.Delete(I);
      Break;
    end;
  end;

end;

procedure TDControl.ChangeChildOrder (dcon: TDControl);
var
   i: integer;
begin
   if not (dcon is TDWindow) then exit;
   if TDWindow(dcon).Floating then begin
      for i:=0 to DControls.Count-1 do begin
         if dcon = DControls[i] then begin
            DControls.Delete (i);
            break;
         end;
      end;
      DControls.Add (dcon);
   end;
end;

function  TDControl.InRange (x, y: integer): Boolean;
var
   inrange: Boolean;
   d: TDirectDrawSurface;
begin
   if (x >= Left) and (x < Left+Width) and (y >= Top) and (y < Top+Height) then begin
      inrange := TRUE;
      if Assigned (FOnInRealArea) then
         FOnInRealArea(self, x-Left, y-Top, inrange)
      else
         if WLib <> nil then begin
            d := WLib.Images[FaceIndex];
            if d <> nil then
               if d.Pixels[x-Left, y-Top] <= 0 then
                  inrange := FALSE;
         end;
      Result := inrange;
   end else
      Result := FALSE;
end;

function  TDControl.KeyPress (var Key: Char): Boolean;
var
   i: integer;
begin
   Result := FALSE;
   if Background then exit;
   for i:=DControls.Count-1 downto 0 do
      if TDControl(DControls[i]).Visible then
         if TDControl(DControls[i]).KeyPress(Key) then begin
            Result := TRUE;
            exit;
         end;
   if (FocusedControl=self) then begin
      if Assigned (FOnKeyPress) then FOnKeyPress (self, Key);
      Result := TRUE;
   end;
end;

function  TDControl.KeyDown (var Key: Word; Shift: TShiftState): Boolean;
var
   i: integer;
begin
   Result := FALSE;
   if Background then exit;
   for i:=DControls.Count-1 downto 0 do
      if TDControl(DControls[i]).Visible then
         if TDControl(DControls[i]).KeyDown(Key, Shift) then begin
            Result := TRUE;
            exit;
         end;
   if (FocusedControl=self) then begin
      if Assigned (FOnKeyDown) then FOnKeyDown (self, Key, Shift);
      Result := TRUE;
   end;
end;

function  TDControl.CanFocusMsg: Boolean;
begin
   if (MouseCaptureControl = nil) or ((MouseCaptureControl <> nil) and ((MouseCaptureControl=self) or (MouseCaptureControl=DParent))) then
      Result := TRUE
   else
      Result := FALSE;
end;

function  TDControl.MouseMove (Shift: TShiftState; X, Y: Integer): Boolean;
var
   i: integer;
begin
   Result := FALSE;
   MouseMoveControl := nil;
   for i:=DControls.Count-1 downto 0 do
      if TDControl(DControls[i]).Visible then
         if TDControl(DControls[i]).MouseMove(Shift, X-Left, Y-Top) then begin
            Result := TRUE;
            exit;
         end;

   if (MouseCaptureControl <> nil) then begin //MouseCapture
      if (MouseCaptureControl = self) then begin
         if Assigned (FOnMouseMove) then
            FOnMouseMove (self, Shift, X, Y);
         Result := TRUE;
      end;
      exit;
   end;

   if Background then exit;
   if InRange (X, Y) then begin
      MouseMoveControl := Self;     //마우스
      if Assigned (FOnMouseMove) then
         FOnMouseMove (self, Shift, X, Y);
      Result := TRUE;
   end;
end;

function  TDControl.MouseDown (Button: TMouseButton; Shift: TShiftState; X, Y: Integer): Boolean;
var
   i: integer;
begin
   Result := FALSE;
   for i:=DControls.Count-1 downto 0 do
      if TDControl(DControls[i]).Visible then
         if TDControl(DControls[i]).MouseDown(Button, Shift, X-Left, Y-Top) then begin
            Result := TRUE;
            exit;
         end;
   if Background then begin
      if Assigned (FOnBackgroundClick) then begin
         WantReturn := FALSE;
         FOnBackgroundClick (self);
         if WantReturn then Result := TRUE;
      end;
      ReleaseDFocus;
      exit;
   end;
   if CanFocusMsg then begin
      if InRange (X, Y) or (MouseCaptureControl = self) then begin
         MouseMoveControl := nil;      //마우스
         if Assigned (FOnMouseDown) then
            FOnMouseDown (self, Button, Shift, X, Y);
         if FEnableFocus then SetDFocus (self);
         //else ReleaseDFocus;
         Result := TRUE;
      end;
   end;
end;

function  TDControl.MouseUp (Button: TMouseButton; Shift: TShiftState; X, Y: Integer): Boolean;
var
   i: integer;
begin
   Result := FALSE;
   for i:=DControls.Count-1 downto 0 do
      if TDControl(DControls[i]).Visible then
         if TDControl(DControls[i]).MouseUp(Button, Shift, X-Left, Y-Top) then begin
            Result := TRUE;
            exit;
         end;

   if (MouseCaptureControl <> nil) then begin //MouseCapture
      if (MouseCaptureControl = self) then begin
         if Assigned (FOnMouseUp) then
            FOnMouseUp (self, Button, Shift, X, Y);
         Result := TRUE;
      end;
      exit;
   end;

   if Background then exit;
   if InRange (X, Y) then begin
      if Assigned (FOnMouseUp) then
         FOnMouseUp (self, Button, Shift, X, Y);
      Result := TRUE;
   end;
end;

function TDControl.MouseWheel(Shift: TShiftState; Wheel: TMouseWheel; X, Y: Integer): Boolean;
var
  i: integer;
begin
  Result := False;
  for i := DControls.Count - 1 downto 0 do
    if TDControl(DControls[i]).Visible then
      if TDControl(DControls[i]).MouseWheel(Shift, Wheel, X - Left, Y - Top) then begin
        Result := TRUE;
        exit;
      end;

  if FWheelDControl <> nil then begin
    FWheelDControl.MouseWheel(Shift, Wheel, X - Left, Y - Top);
    Result := True;
  end;
end;

function  TDControl.DblClick (X, Y: integer): Boolean;
var
   i: integer;
begin
   Result := FALSE;
   if (MouseCaptureControl <> nil) then begin //MouseCapture
      if (MouseCaptureControl = self) then begin
         if Assigned (FOnDblClick) then
            FOnDblClick (self);
         Result := TRUE;
      end;
      exit;
   end;
   for i:=DControls.Count-1 downto 0 do
      if TDControl(DControls[i]).Visible then
         if TDControl(DControls[i]).DblClick(X-Left, Y-Top) then begin
            Result := TRUE;
            exit;
         end;
   if Background then exit;
   if InRange (X, Y) then begin
      if Assigned (FOnDblClick) then
         FOnDblClick (self);
      Result := TRUE;
   end;
end;

function  TDControl.Click (X, Y: integer): Boolean;
var
   i: integer;
begin
   Result := FALSE;
   if (MouseCaptureControl <> nil) then begin //MouseCapture
      if (MouseCaptureControl = self) then begin
         if Assigned (FOnClick) then
            FOnClick (self, X, Y);
         Result := TRUE;
      end;
      exit;
   end;
   for i:=DControls.Count-1 downto 0 do
      if TDControl(DControls[i]).Visible then
         if TDControl(DControls[i]).Click(X-Left, Y-Top) then begin
            Result := TRUE;
            exit;
         end;
   if Background then exit;
   if InRange (X, Y) then begin
      if Assigned (FOnClick) then
         FOnClick (self, X, Y);
      Result := TRUE;
   end;
end;

procedure TDControl.SetImgIndex (Lib: TWMImages; index: integer);
var
   d: TDirectDrawSurface;
begin
   //FaceSurface := dsurface;
   if Lib <> nil then begin
      d := Lib.Images[index];
      WLib := Lib;
      FaceIndex := index;
      if d <> nil then begin
         Width := d.Width;
         Height := d.Height;
      end;
   end;
end;

procedure TDControl.SetSurface(DDraw: TDirectDraw; Lib: TWMImages; index:
  integer);
var
  d: TDirectDrawSurface;
begin
  if FSurface <> nil then
    FSurface.Free;
  FSurface := nil;
  if DDraw <> nil then begin
    if Lib <> nil then begin
      d := Lib.Images[index];
      if d <> nil then begin
        FSurface := TDirectDrawSurface.Create(DDraw);
        FSurface.SystemMemory := True;
        FSurface.Canvas.Font.Name := '력芥';
        FSurface.Canvas.Font.Size := 9;
        FSurface.SetSize(d.Width, d.Height);
        FSurface.Draw(0, 0, d.ClientRect, d, True);
      end;
    end
    else begin
      FSurface := TDirectDrawSurface.Create(DDraw);
      FSurface.SystemMemory := True;
      FSurface.Canvas.Font.Name := '력芥';
      FSurface.Canvas.Font.Size := 9;
      FSurface.SetSize(Width, Height);
      FSurface.Fill(0);
    end;
  end;
end;

procedure TDControl.CloseSurface;
var
  i: integer;
begin
  for i := DControls.Count - 1 downto 0 do
    TDControl(DControls[i]).CloseSurface();

  if FSurface <> nil then begin
    FSurface.Free;
    FSurface := nil;
  end;
end;

procedure TDControl.DirectPaint (dsurface: TDirectDrawSurface);
var
   i: integer;
   d: TDirectDrawSurface;
begin
   NoPaint := False;
   if Assigned (FOnDirectPaint) then begin
      NoPaint := True;
      FOnDirectPaint(self, dsurface);
   end;

   if Not NoPaint then
      if WLib <> nil then begin
         d := WLib.Images[FaceIndex];
         if d <> nil then
            dsurface.Draw (SurfaceX(Left), SurfaceY(Top), d.ClientRect, d, TRUE);
      end;
   for i:=0 to DControls.Count-1 do
      if TDControl(DControls[i]).Visible then
         TDControl(DControls[i]).DirectPaint (dsurface);

   if Assigned (FOnEndDirectPaint) then begin
      FOnEndDirectPaint(self, dsurface);
   end;
end;


{--------------------- TDButton --------------------------}


constructor TDButton.Create (AOwner: TComponent);
begin
   inherited Create (AOwner);
   Downed := FALSE;
   FOnClick := nil;
   FEnableFocus := FALSE;
   FClickSound := csNone;
end;

function  TDButton.MouseMove (Shift: TShiftState; X, Y: Integer): Boolean;
begin
   Result := inherited MouseMove (Shift, X, Y);
   if (not Background) and (not Result) then begin
      Result := inherited MouseMove (Shift, X, Y);
      if MouseCaptureControl = self then
         if InRange (X, Y) then Downed := TRUE
         else Downed := FALSE;
   end;
end;

        {
procedure TDButton.DirectPaint(dsurface: TDirectDrawSurface);
var
  d: TDirectDrawSurface;
  FColor: TColor;
  i: integer;
begin
  if Assigned(FOnDirectPaint) then
    FOnDirectPaint(self, dsurface)
  else if WLib <> nil then begin
    if Downed then begin
      d := WLib.Images[FaceIndex + 2];
      if d <> nil then
        dsurface.Draw(SurfaceX(Left), SurfaceY(Top), d.ClientRect, d, True);
      FColor := FDFDownColor;
    end
    else if MouseMoveing then begin
      d := WLib.Images[FaceIndex + 1];
      if d <> nil then
        dsurface.Draw(SurfaceX(Left), SurfaceY(Top), d.ClientRect, d, True);
      FColor := FDFMoveColor;
    end
    else begin
      d := WLib.Images[FaceIndex];
      if d <> nil then
        dsurface.Draw(SurfaceX(Left), SurfaceY(Top), d.ClientRect, d, True);
      FColor := FDFColor;
    end;
    with dsurface.Canvas do begin
      SetBkMode(Handle, TRANSPARENT);
      TextOutA(dsurface, SurfaceX(Left) + (Width - TextWidth(Caption)) div 2,
        SurfaceY(Top) + (Height - TextHeight(Caption)) div 2, FColor, Caption);
      Release;
    end;
  end;
  for i := 0 to DControls.Count - 1 do
    if TDControl(DControls[i]).Visible then
      TDControl(DControls[i]).DirectPaint(dsurface);
  if Assigned(FOnEndDirectPaint) then
    FOnEndDirectPaint(self, dsurface);
end;  }

function  TDButton.MouseDown (Button: TMouseButton; Shift: TShiftState; X, Y: Integer): Boolean;
begin
   Result := FALSE;
   if inherited MouseDown (Button, Shift, X, Y) then begin
      if (not Background) and (MouseCaptureControl = nil) then begin
         Downed := TRUE;
         SetDCapture (self);
      end;
      Result := TRUE;
   end;
end;

function  TDButton.MouseUp (Button: TMouseButton; Shift: TShiftState; X, Y: Integer): Boolean;
begin
   Result := FALSE;
   if inherited MouseUp (Button, Shift, X, Y) then begin
      ReleaseDCapture;
      if not Background then begin
         if InRange (X, Y) then begin
            if Assigned (FOnClickSound) then FOnClickSound(self, FClickSound);
            if Assigned (FOnClick) then FOnClick(self, X, Y);
         end;
      end;
      Downed := FALSE;
      Result := TRUE;
      exit;
   end else begin
      ReleaseDCapture;
      Downed := FALSE;
   end;
end;

{--------------------- TDmoveButton --------------------------}


constructor TDmoveButton.Create (AOwner: TComponent);
begin
   inherited Create (AOwner);
   FFloating := TRUE;
   FEnableFocus := FALSE;
   Width := 30;
   Height := 30;
   MoveHeight := 0;
   rotmidx := 0;
   inidx := 0;
end;

procedure TDmoveButton.SetVisible (flag: Boolean);
begin
   FVisible := flag;
   if Floating then begin
      if DParent <> nil then
         DParent.ChangeChildOrder (self);
   end;
end;

function  TDmoveButton.MouseMove (Shift: TShiftState; X, Y: Integer): Boolean;
var
   al, at, ot,tt: integer;
begin
  Result := inherited MouseMove (Shift, X, Y);
  if ssLeft in Shift then begin
   if listcont <= 0 then Exit;
    inidx := outidx;
    Result := inherited MouseMove (Shift, X, Y);
    if Result and FFloating and (MouseCaptureControl=self) then begin
      if listcont <= 0 then Exit;
      if (SpotX <> X) or (SpotY <> Y) then begin
        if not Reverse then begin
         ot := Boxmovetop- Height;
         tt := Round(ot / listcont);
         MoveHeight := tt;
         al := RLeft;
         at := Top + (Y - SpotY);
         if at < RTop then at := RTop;
         if at+Height > RTop+Boxmovetop then at := RTop+Boxmovetop-Height;
         outidx:=(at - RTop) div tt;
         Left := al;
         Top := at;
         SpotX := X;
         SpotY := Y;
        end else begin
         //ot := Boxmovetop;
         tt := Round(Boxmovetop / listcont);
         MoveHeight := tt;
         al := RLeft;
         at := Top - (Y - SpotY);
         if at < RTop-Boxmovetop then at := RTop-Boxmovetop;
         if at > RTop then at := RTop;
         outidx:=(at - RTop) div tt;
         Left := al;
         Top := at;
         SpotX := X;
         SpotY := Y;
        end;
      end;
    end;
  end; 
end;


function  TDmoveButton.MouseDown (Button: TMouseButton; Shift: TShiftState; X, Y: Integer): Boolean;
begin
   Result := inherited MouseDown (Button, Shift, X, Y);
   if Result then begin
      if Floating then begin
         if DParent <> nil then
            DParent.ChangeChildOrder (self);
      end;
      SpotX := X;
      SpotY := Y;
   end;
end;

function  TDmoveButton.MouseUp (Button: TMouseButton; Shift: TShiftState; X, Y: Integer): Boolean;
begin
   Result := inherited MouseUp (Button, Shift, X, Y);
end;

procedure TDmoveButton.Show;
begin
   Visible := TRUE;
   if Floating then begin
      if DParent <> nil then
         DParent.ChangeChildOrder (self);
   end;
   if FEnableFocus then SetDFocus (self);
end;

function  TDmoveButton.ShowModal: integer;
begin
   Result:=0;
   Visible := TRUE;
   ModalDWindow := self;
   if FEnableFocus then SetDFocus (self);
end;
procedure TDmoveButton.exitHeightout;
var
  ot,tt:integer;
begin
   if listcont <= 0 then Exit;
   if not Reverse then begin
    ot := Boxmovetop- Height;
    tt := Round(ot / listcont);
    MoveHeight := tt;
    Top := Top+MoveHeight;
    if Top > RTop+Boxmovetop-Height then Top := RTop+Boxmovetop-Height;
    end else begin
    end;

end;

procedure TDmoveButton.UpHeightout;
var
  ot,tt:integer;
begin
    if listcont <= 0 then Exit;
    if not Reverse then begin
    ot := Boxmovetop- Height;
    tt := Round(ot / listcont);
    MoveHeight := tt;
    Top := Top-MoveHeight;
    if Top < RTop then Top := RTop;
    end else begin
    end;
end;

{------------------------- TDGrid --------------------------}

constructor TDGrid.Create (AOwner: TComponent);
begin
   inherited Create (AOwner);
   FColCount := 8;
   FRowCount := 5;
   FColWidth := 45;
   FRowHeight:= 32;
   FOnGridSelect := nil;
   FOnGridMouseMove := nil;
   FOnGridPaint := nil;
end;

function  TDGrid.GetColRow (x, y: integer; var acol, arow: integer): Boolean;
begin
   Result := FALSE;
   if InRange (x, y) then begin
      acol := (x-Left) div FColWidth;
      arow := (y-Top) div FRowHeight;
      Result := TRUE;
   end;
end;

function  TDGrid.MouseDown (Button: TMouseButton; Shift: TShiftState; X, Y: Integer): Boolean;
var
   acol, arow: integer;
begin
   Result := FALSE;
  // if mbLeft = Button then begin
      if GetColRow (X, Y, acol, arow) then begin
         SelectCell.X := acol;
         SelectCell.Y := arow;
         DownPos.X := X;
         DownPos.Y := Y;
         if mbLeft = Button then SetDCapture (self);
         Result := TRUE;
      end;
  // end;
end;

function  TDGrid.MouseMove (Shift: TShiftState; X, Y: Integer): Boolean;
var
   acol, arow: integer;
begin
   Result := FALSE;
   if InRange (X, Y) then begin
      if GetColRow (X, Y, acol, arow) then begin
         if Assigned (FOnGridMouseMove) then
            FOnGridMouseMove (self,  X, Y, acol, arow, Shift);
      end;
      Result := TRUE;
   end;
end;

function  TDGrid.MouseUp (Button: TMouseButton; Shift: TShiftState; X, Y: Integer): Boolean;
var
   acol, arow: integer;
begin
   if mbRight = Button then  Shift := [ssRight];
   Result := FALSE;
  // if mbLeft = Button then begin
      if GetColRow (X, Y, acol, arow) then begin
         if (SelectCell.X = acol) and (SelectCell.Y = arow) then begin
            Col := acol;
            Row := arow;
            if Assigned (FOnGridSelect) then
               FOnGridSelect (self, X, Y, acol, arow, Shift);
         end;
         Result := TRUE;
      end;
      ReleaseDCapture;
 // end;
end;

function  TDGrid.Click (X, Y: integer): Boolean;
begin
   Result := FALSE;
  { if GetColRow (X, Y, acol, arow) then begin
      if Assigned (FOnGridSelect) then
         FOnGridSelect (self, acol, arow, []);
      Result := TRUE;
   end; }
end;

procedure TDGrid.DirectPaint (dsurface: TDirectDrawSurface);
var
   i, j: integer;
   rc: TRect;
begin
   if Assigned (FOnGridPaint) then
      for i:=0 to FRowCount-1 do
         for j:=0 to FColCount-1 do begin
            rc := Rect (Left + j*FColWidth, Top + i*FRowHeight, Left+j*(FColWidth+1)-1, Top+i*(FRowHeight+1)-1);
            if (SelectCell.Y = i) and (SelectCell.X = j) then
               FOnGridPaint (self, j, i, rc, [gdSelected], dsurface)
            else FOnGridPaint (self, j, i, rc, [], dsurface);
         end;
end;


{--------------------- TDWindown --------------------------}


constructor TDWindow.Create (AOwner: TComponent);
begin
   inherited Create (AOwner);
   FFloating := FALSE;
   FEnableFocus := FALSE;
   Width := 120;
   Height := 120;
end;

procedure TDWindow.SetVisible (flag: Boolean);
begin
   FVisible := flag;
   if Floating then begin
      if DParent <> nil then
         DParent.ChangeChildOrder (self);
   end;
end;

function  TDWindow.MouseMove (Shift: TShiftState; X, Y: Integer): Boolean;
var
   al, at: integer;
begin
   Result := inherited MouseMove (Shift, X, Y);
   if Result and FFloating and (MouseCaptureControl=self) then begin
      if (SpotX <> X) or (SpotY <> Y) then begin
         al := Left + (X - SpotX);
         at := Top + (Y - SpotY);
         if al+Width < WINLEFT then al := WINLEFT - Width;
         if al > (g_FScreenWidth - 42){WINRIGHT} then al := (g_FScreenWidth - 42){WINRIGHT};
         if at+Height < WINTOP then at := WINTOP - Height;
         if at+Height > (g_FScreenHeight - 5){BOTTOMEDGE} then at := (g_FScreenHeight - 5){BOTTOMEDGE}-Height;
         Left := al;
         Top := at;
         SpotX := X;
         SpotY := Y;
      end;
   end;
end;

function  TDWindow.MouseDown (Button: TMouseButton; Shift: TShiftState; X, Y: Integer): Boolean;
begin
   Result := inherited MouseDown (Button, Shift, X, Y);
   if Result then begin
      if Floating then begin
         if DParent <> nil then
            DParent.ChangeChildOrder (self);
      end;
      SpotX := X;
      SpotY := Y;
   end;
end;

function  TDWindow.MouseUp (Button: TMouseButton; Shift: TShiftState; X, Y: Integer): Boolean;
begin
   Result := inherited MouseUp (Button, Shift, X, Y);
end;

procedure TDWindow.Show;
begin
   Visible := TRUE;
   if Floating then begin
      if DParent <> nil then
         DParent.ChangeChildOrder (self);
   end;
   if FEnableFocus then SetDFocus (self);
end;

function  TDWindow.ShowModal: integer;
begin
   Result:=0;
   Visible := TRUE;
   ModalDWindow := self;
   if FEnableFocus then SetDFocus (self);
end;


{--------------------- TDWinManager --------------------------}


constructor TDWinManager.Create (AOwner: TComponent);
begin
   inherited Create (AOwner);
   DWinList := TList.Create;
   MouseCaptureControl := nil;
   FocusedControl := nil;
end;


destructor TDWinManager.Destroy;
begin
   FreeAndNil(DWinList);
   inherited Destroy;
end;

procedure TDWinManager.ClearAll;
begin
   DWinList.Clear;
end;

procedure TDWinManager.AddDControl (dcon: TDControl; visible: Boolean);
begin
   dcon.Visible := visible;
   DWinList.Add (dcon);
end;

procedure TDWinManager.DelDControl (dcon: TDControl);
var
   i: integer;
begin
   for i:=0 to DWinList.Count-1 do
      if DWinList[i] = dcon then begin
         DWinList.Delete (i);
         break;
      end;
end;

function  TDWinManager.KeyPress (var Key: Char): Boolean;
begin
   Result := FALSE;
   if ModalDWindow <> nil then begin
      if ModalDWindow.Visible then begin
         with ModalDWindow do
            Result := KeyPress (Key);
         exit;
      end else
         ModalDWindow := nil;
      Key := #0;
   end;

   if FocusedControl <> nil then begin
      if FocusedControl.Visible then begin
         Result := FocusedControl.KeyPress (Key);
      end else
         ReleaseDFocus;
   end;
   {for i:=0 to DWinList.Count-1 do begin
      if TDControl(DWinList[i]).Visible then begin
         if TDControl(DWinList[i]).KeyPress (Key) then begin
            Result := TRUE;
            break;
         end;
      end;
   end; }
end;

function  TDWinManager.KeyDown (var Key: Word; Shift: TShiftState): Boolean;
begin
   Result := FALSE;
   if ModalDWindow <> nil then begin
      if ModalDWindow.Visible then begin
         with ModalDWindow do
            Result := KeyDown (Key, Shift);
         exit;
      end else MOdalDWindow := nil;
   end;
   if FocusedControl <> nil then begin
      if FocusedControl.Visible then
         Result := FocusedControl.KeyDown (Key, Shift)
      else
         ReleaseDFocus;
   end;
   {for i:=0 to DWinList.Count-1 do begin
      if TDControl(DWinList[i]).Visible then begin
         if TDControl(DWinList[i]).KeyDown (Key, Shift) then begin
            Result := TRUE;
            break;
         end;
      end;
   end; }
end;

function TDWinManager.MouseWheel(Shift: TShiftState; Wheel: TMouseWheel; X, Y: Integer): Boolean;
var
  i: integer;
 // MDWindow: TDModalWindow;
begin
  Result := FALSE;

  {if PopUpDWindow <> nil then begin
    if PopUpDWindow.Visible then begin
      with PopUpDWindow do
        Result := MouseWheel(Shift, Wheel, LocalX(X), LocalY(Y));
    end
    else
      PopUpDWindow := nil;
    if Result then
      Exit;
  end;

  if ModalDWindowList.Count > 0 then begin
    for I := ModalDWindowList.Count - 1 downto 0 do begin
      MDWindow := TDModalWindow(ModalDWindowList[i]);
      if MDWindow.Visible then begin
        with MDWindow do
          MouseWheel(Shift, Wheel, LocalX(X), LocalY(Y));
        Result := TRUE;
        exit;
      end else ModalDWindowList.delete(i);
    end;
  end;      }

  if ModalDWindow <> nil then begin
    if ModalDWindow.Visible then begin
      with ModalDWindow do
        MouseWheel(Shift, Wheel, LocalX(X), LocalY(Y));
      Result := TRUE;
      exit;
    end
    else
      MOdalDWindow := nil;
  end;
  if MouseCaptureControl <> nil then begin
    with MouseCaptureControl do
      Result := MouseWheel(Shift, Wheel, LocalX(X), LocalY(Y));
  end
  else
  if FocusedControl <> nil then begin
    with FocusedControl do
      Result := MouseWheel(Shift, Wheel, LocalX(X), LocalY(Y));
  end;

end;

function  TDWinManager.MouseMove (Shift: TShiftState; X, Y: Integer): Boolean;
var
   i: integer;
begin
   Result := FALSE;
   if ModalDWindow <> nil then begin
      if ModalDWindow.Visible then begin
         with ModalDWindow do
            MouseMove (Shift, LocalX(X), LocalY(Y));
         Result := TRUE;
         exit;
      end else MOdalDWindow := nil;
   end;
   if MouseCaptureControl <> nil then begin
      with MouseCaptureControl do
         Result := MouseMove (Shift, LocalX(X), LocalY(Y));
   end else
      for i:=0 to DWinList.Count-1 do begin
         if TDControl(DWinList[i]).Visible then begin
            if TDControl(DWinList[i]).MouseMove (Shift, X, Y) then begin
               Result := TRUE;
               break;
            end;
         end;
      end;
end;

function  TDWinManager.MouseDown (Button: TMouseButton; Shift: TShiftState; X, Y: Integer): Boolean;
var
   i: integer;
begin
   Result := FALSE;
   if ModalDWindow <> nil then begin
      if ModalDWindow.Visible then begin
         with ModalDWindow do
            MouseDown (Button, Shift, LocalX(X), LocalY(Y));
         Result := TRUE;    
         exit;
      end else ModalDWindow := nil;     
   end;
   if MouseCaptureControl <> nil then begin
      with MouseCaptureControl do
         Result := MouseDown (Button, Shift, LocalX(X), LocalY(Y));
   end else
      for i:=0 to DWinList.Count-1 do begin
         if TDControl(DWinList[i]).Visible then begin
            if TDControl(DWinList[i]).MouseDown (Button, Shift, X, Y) then begin
               Result := TRUE;
               break;
            end;
         end;
      end;
end;

function  TDWinManager.MouseUp (Button: TMouseButton; Shift: TShiftState; X, Y: Integer): Boolean;
var
   i: integer;
begin
   Result := TRUE;
   if ModalDWindow <> nil then begin
      if ModalDWindow.Visible then begin
         with ModalDWindow do
            Result := MouseUp (Button, Shift, LocalX(X), LocalY(Y));
         exit;
      end else ModalDWindow := nil;
   end;
   if MouseCaptureControl <> nil then begin
      with MouseCaptureControl do
         Result := MouseUp (Button, Shift, LocalX(X), LocalY(Y));
   end else
      for i:=0 to DWinList.Count-1 do begin
         if TDControl(DWinList[i]).Visible then begin
            if TDControl(DWinList[i]).MouseUp (Button, Shift, X, Y) then begin
               Result := TRUE;
               break;
            end;
         end;
      end;
end;

function  TDWinManager.DblClick (X, Y: integer): Boolean;
var
   i: integer;
begin
   Result := TRUE;
   if ModalDWindow <> nil then begin
      if ModalDWindow.Visible then begin
         with ModalDWindow do
            Result := DblClick (LocalX(X), LocalY(Y));
         exit;
      end else ModalDWindow := nil;
   end;
   if MouseCaptureControl <> nil then begin
      with MouseCaptureControl do
         Result := DblClick (LocalX(X), LocalY(Y));
   end else
      for i:=0 to DWinList.Count-1 do begin
         if TDControl(DWinList[i]).Visible then begin
            if TDControl(DWinList[i]).DblClick (X, Y) then begin
               Result := TRUE;
               break;
            end;
         end;
      end;
end;

function  TDWinManager.Click (X, Y: integer): Boolean;
var
   i: integer;
begin
   Result := TRUE;
   if ModalDWindow <> nil then begin
      if ModalDWindow.Visible then begin
         with ModalDWindow do
            Result := Click (LocalX(X), LocalY(Y));
         exit;
      end else ModalDWindow := nil;
   end;
   if MouseCaptureControl <> nil then begin
      with MouseCaptureControl do
         Result := Click (LocalX(X), LocalY(Y));
   end else
      for i:=0 to DWinList.Count-1 do begin
         if TDControl(DWinList[i]).Visible then begin
            if TDControl(DWinList[i]).Click (X, Y) then begin
               Result := TRUE;
               break;
            end;
         end;
      end;
end;

procedure TDWinManager.DirectPaint (dsurface: TDirectDrawSurface);
var
   i: integer;
begin
   for i:=0 to DWinList.Count-1 do begin
      if TDControl(DWinList[i]).Visible then begin
         TDControl(DWinList[i]).DirectPaint (dsurface);
      end;
   end;
   if ModalDWindow <> nil then begin
      if ModalDWindow.Visible then
         with ModalDWindow do
            DirectPaint (dsurface);
   end;
end;


constructor TDCheckBox.Create(AOwner: TComponent);
begin
  inherited;
  FChecked := False;
  FFontSpace := 3;
  FWidth := 0;
  FHeight := 0;
  FOnClick := nil;
  
  
  FOffsetLeft := 0;
  FOffsetTop := 0;
  FDFColor := $C4C9BA;
  FDFMoveColor := $C5D2BD;
  FDFEnabledColor := $C5D2BD;
  FDFDownColor := clWhite;
  FDFBackColor := $8;
  FOnCheckedChange := nil;
end;

procedure TDCheckBox.DirectPaint(dsurface: TDirectDrawSurface);
var
  d: TDirectDrawSurface;
begin
  if FChangeCaption then begin
    FWidth := dsurface.Canvas.TextWidth(Caption);
    FHeight := dsurface.Canvas.TextHeight(Caption);
    FChangeCaption := False;
  end;
  if Assigned(FOnDirectPaint) then
    FOnDirectPaint(self, dsurface)
  else if WLib <> nil then begin
    if Checked then begin
      d := WLib.Images[FaceIndex + 1];
      if d <> nil then
        dsurface.Draw(SurfaceX(Left), SurfaceY(Top), d.ClientRect, d, TRUE);
    end
    else begin
      d := WLib.Images[FaceIndex];
      if d <> nil then
        dsurface.Draw(SurfaceX(Left), SurfaceY(Top), d.ClientRect, d, TRUE);
    end;
    if d <> nil then begin
      with dsurface do begin
        SetBkMode(Canvas.Handle, TRANSPARENT);
        if not FEnabled then begin
          TextOutA(dsurface, SurfaceX(Left) + d.Width + FFontSpace + FOffsetLeft,
               SurfaceY(Top) + d.Height div 2 - FHeight div 2 + FOffsetTop,
               FDFEnabledColor, Caption)
        end else begin
          if Checked then
            TextOutA(dsurface, SurfaceX(Left) + d.Width + FFontSpace + FOffsetLeft,
                  SurfaceY(Top) + d.Height div 2 - FHeight div 2 + FOffsetTop,
                  FDFDownColor, Caption)
          else
            TextOutA(dsurface, SurfaceX(Left) + d.Width + FFontSpace + FOffsetLeft,
                  SurfaceY(Top) + d.Height div 2 - FHeight div 2 + FOffsetTop,
                  FDFColor, Caption);
         end;
        Canvas.Release;
      end;
    end;
  end;
end;

function TDCheckBox.InRange(x, y: integer): Boolean;
var
  boinrange: Boolean;
  nWidth, nHeight: Integer;
begin
  nWidth := FWidth + FFontSpace + Width;
  nHeight := _MAX(Height, FHeight);
  if (x >= Left) and (x < Left + nWidth + FOffsetLeft) and (y >= Top) and (y < Top + nHeight) then begin
    boinrange := TRUE;
    if Assigned(FOnInRealArea) then
      FOnInRealArea(self, x - Left, y - Top, boinrange);
    Result := boinrange;
  end
  else
    Result := FALSE;
end;

function TDCheckBox.MouseDown(Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer): Boolean;
begin
  Result := FALSE;
  if inherited MouseDown(Button, Shift, X, Y) and FEnabled then begin
    if (not Background) and (MouseCaptureControl = nil) then begin
      SetDCapture(self);
    end;
    Result := TRUE;
  end;
end;

function TDCheckBox.MouseUp(Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer): Boolean;
begin
  Result := FALSE;
  if inherited MouseUp(Button, Shift, X, Y) and FEnabled then begin
    ReleaseDCapture;
    if not Background then begin
      if InRange(X, Y) then begin
        FChecked := not FChecked;
        if Assigned(FOnClick) then
          FOnClick(self, X, Y);
        if Assigned(FOnCheckedChange) then
          FOnCheckedChange(Self);
      end;
    end;
    Result := TRUE;
    exit;
  end
  else begin
    ReleaseDCapture;
  end;
end;

procedure TDUpDown.ButtonMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  FClickTime := GetTickCount;
  if Sender = FUpButton then begin
    if FPosition >= FMovePosition then
      Dec(FPosition, FMovePosition)
    else
      FPosition := 0;
    FAddTop := Round(FMaxLength / FMaxPosition * FPosition);
    if Assigned(FOnPositionChange) then
      FOnPositionChange(Self);
   // SetDCapture(self);
  end
  else if Sender = FDownButton then begin
    if (FPosition + FMovePosition) <= FMaxPosition then
      Inc(FPosition, FMovePosition)
    else
      FPosition := FMaxPosition;
    FAddTop := Round(FMaxLength / FMaxPosition * FPosition);
    if Assigned(FOnPositionChange) then
      FOnPositionChange(Self);
   // SetDCapture(self);
  end
  else if Sender = FMoveButton then begin
    StopY := Y;
    FStopY := FAddTop;
   // SetDCapture(self);
  end;
  if Assigned(FOnMouseDown) then
    FOnMouseDown(self, Button, Shift, X, Y);

end;

procedure TDUpDown.ButtonMouseMove(Sender: TObject; Shift: TShiftState; X, Y:
  Integer);
var
  nIdx: Integer;
  OldPosition: Integer;
  nY: Integer;
  DButton: TDButton;
begin
  if Sender = FUpButton then begin
    DButton := TDButton(Sender);
    if (DButton.Downed) and ((GetTickCount - FClickTime) > 100) then
      ButtonMouseDown(Sender, mbLeft, Shift, X, Y);
  end
  else if Sender = FDownButton then begin
    DButton := TDButton(Sender);
    if (DButton.Downed) and ((GetTickCount - FClickTime) > 100) then
      ButtonMouseDown(Sender, mbLeft, Shift, X, Y);
  end
  else if Sender = FMoveButton then begin
    if (StopY < 0) or (StopY = y) then begin
      if Assigned(FOnMouseMove) then
        FOnMouseMove(self, Shift, X, Y);
      Exit;
    end;

    nY := Y - StopY;
    FAddTop := FStopY + nY;
    if FAddTop < 0 then
      FAddTop := 0;
    if FAddTop > FMaxLength then
      FAddTop := FMaxLength;

    OldPosition := FPosition;
    nIdx := Round(FAddTop / (FMaxLength / FMaxPosition));
    if nIdx <= 0 then
      FPosition := 0
    else if nIdx >= FMaxPosition then
      FPosition := FMaxPosition
    else
      FPosition := nIdx;
    if OldPosition <> FPosition then
      if Assigned(FOnPositionChange) then
        FOnPositionChange(Self);
  end;
  if Assigned(FOnMouseMove) then
    FOnMouseMove(self, Shift, X, Y);
end;

procedure TDUpDown.ButtonMouseUp(Sender: TObject; Button: TMouseButton; Shift:
  TShiftState; X, Y: Integer);
begin
  StopY := -1;
  if Assigned(FOnMouseUp) then
    FOnMouseUp(self, Button, Shift, X, Y);
end;

constructor TDUpDown.Create(AOwner: TComponent);
begin
  inherited;
  FUpButton := TDButton.Create(nil);
  FDownButton := TDButton.Create(nil);
  FMoveButton := TDButton.Create(nil);
  
  
  SetButton(UpButton);
  SetButton(DownButton);
  SetButton(MoveButton);

  FOffset := 1;
  FBoMoveShow := False;
  FboMoveFlicker := False;
  FboNormal := False;

  FMovePosition := 1;
  FPosition := 0;
  FMaxPosition := 0;
  FMaxLength := 0;
  FTop := 0;
  FAddTop := 0;
  StopY := -1;
  FWheelDControl := Self;
end;

destructor TDUpDown.Destroy;
begin
  FUpButton.Free;
  FDownButton.Free;
  FMoveButton.Free;
  inherited;
end;

procedure TDUpDown.DirectPaint(dsurface: TDirectDrawSurface);
var
  d: TDirectDrawSurface;
  dc, rc: TRect;
begin
  if WLib <> nil then begin
    d := WLib.Images[FaceIndex];
    if d <> nil then begin
      dc.Left := SurfaceX(Left);
      dc.Top := SurfaceY(Top);
      dc.Right := SurfaceX(left + Width);
      dc.Bottom := SurfaceY(top + Height);
      rc.Left := 0;
      rc.Top := 0;
      rc.Right := d.ClientRect.Right;
      rc.Bottom := d.ClientRect.Bottom;
      dsurface.StretchDraw(dc, rc, d, True);
    end;
    if FUpButton <> nil then begin
      with FUpButton do begin
        if FboNormal then begin
          Left := FOffset;
          Top := 0;
        end else begin
          Left := FOffset;
          Top := FOffset;
        end;
        if Downed then begin
          d := WLib.Images[FaceIndex + 1 + Integer(FBoMoveShow)];
        end
        else if MouseMoveing then begin
          d := WLib.Images[FaceIndex + Integer(FBoMoveShow)];
        end
        else begin
          d := WLib.Images[FaceIndex];
        end;
        if d <> nil then begin
          FTop := d.Height + Top;
          dsurface.Draw(SurfaceX(Left), SurfaceY(Top), d.ClientRect, d, True);
        end;
      end;
    end;
    if FDownButton <> nil then begin
      with FDownButton do begin
        if FboNormal then begin
          Left := FOffset;
          Top := Self.Height - d.Height;
        end else begin
          Left := FOffset;
          if FBoMoveShow then
            Top := Self.Height - d.Height + 1
          else
            Top := Self.Height - d.Height - 1;
        end;


        if Downed then begin
          d := WLib.Images[FaceIndex + 1 + Integer(FBoMoveShow)];
        end
        else if MouseMoveing then begin
          d := WLib.Images[FaceIndex + Integer(FBoMoveShow)];
        end
        else begin
          d := WLib.Images[FaceIndex];
        end;
        if d <> nil then begin
          FMaxLength := Top - FTop;
          dsurface.Draw(SurfaceX(Left), SurfaceY(Top), d.ClientRect, d, True);
        end;
      end;
    end;
    if FMoveButton <> nil then begin
      with FMoveButton do begin
        Left := FOffset;
        if FBoMoveShow then begin
          if Downed then begin
            d := WLib.Images[FaceIndex + 2];
          end
          else if MouseMoveing then begin
            d := WLib.Images[FaceIndex + 1];
          end
          else begin
            if FboMoveFlicker and ((GetTickCount - AppendTick) mod 400 < 200) then begin
              d := WLib.Images[FaceIndex + 1];
            end else
              d := WLib.Images[FaceIndex];
          end;
          if (d <> nil) then begin
            Dec(FMaxLength, d.Height);
            Top := FTop + FAddTop;
            if FMaxPosition > 0 then
              dsurface.Draw(SurfaceX(Left), SurfaceY(Top), d.ClientRect, d, True);
          end;
        end
        else begin
          d := WLib.Images[FaceIndex];
          if d <> nil then begin
            Dec(FMaxLength, d.Height);
            Top := FTop + FAddTop;
            dsurface.Draw(SurfaceX(Left), SurfaceY(Top), d.ClientRect, d, True);
          end;
        end;
      end;
    end;
  end;
  if Assigned(FOnEndDirectPaint) then
    FOnEndDirectPaint(self, dsurface);
end;

function TDUpDown.MouseWheel(Shift: TShiftState; Wheel: TMouseWheel; X, Y: Integer): Boolean;
begin
  Result := True;
  if Wheel = mw_Up then
    ButtonMouseDown(FUpButton, mbLeft, Shift, X, Y)
  else if Wheel = mw_Down then
    ButtonMouseDown(FDownButton, mbLeft, Shift, X, Y);
end;

procedure TDUpDown.SetButton(Button: TDButton);
begin
  Button.DParent := Self;
  Button.OnMouseMove := ButtonMouseMove;
  Button.FWheelDControl := Self;
  Button.OnMouseDown := ButtonMouseDown;
  Button.OnMouseUp := ButtonMouseUp;
  AddChild(Button);
end;

procedure TDUpDown.SetMaxPosition(const Value: Integer);
var
  OldPosition: integer;
begin
  OldPosition := FMaxPosition;
  FMaxPosition := _Max(Value, 0);
  if OldPosition <> FMaxPosition then begin
    if FPosition > FMaxPosition then
      FPosition := FMaxPosition;
    if FMaxPosition > 0 then
      FAddTop := Round(FMaxLength / FMaxPosition * FPosition);
  end;
end;

procedure TDUpDown.SetPosition(value: Integer);
var
  OldPosition: integer;
begin
  OldPosition := FPosition;
  FPosition := _Max(Value, 0);
  if FPosition > FMaxPosition then
    FPosition := FMaxPosition;
  if OldPosition <> FPosition then begin
    if FMaxPosition > 0 then
      FAddTop := Round(FMaxLength / FMaxPosition * FPosition);
  end;
end;


initialization
  begin

    MouseCaptureControl := nil; //mouse message
    FocusedControl := nil; //Key message
    MainWinHandle := 0;
    ModalDWindow := nil;
    MouseMoveControl := nil;    //마우스

  end;


end.
