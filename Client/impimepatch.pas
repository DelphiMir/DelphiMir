// ImpImePatch  revision 2010.09.30
//   by Jeehoon Imp Park
//   patches Korean IME problem with TEdit, TComboBox in Delphi/C++Builder 2009, 2010

unit ImpImePatch;

interface

uses
  Windows, Messages, SysUtils, Classes, Controls, StdCtrls;

type
  TComboBox = class(StdCtrls.TComboBox)
  private
    FIgnoreChar: boolean;
  protected
   // procedure EditWndProc(var Message: TMessage); override;
  public
    constructor Create(AOwner: TComponent); override;
  end;

  TEdit = class(StdCtrls.TEdit)
  private
    FIgnoreChar: boolean;
  protected
    procedure WndProc(var Message: TMessage); override;
  public
    constructor Create(AOwner: TComponent); override;
  public
  end;

implementation

{ TComboBox }

constructor TComboBox.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FIgnoreChar := false;
end;
      {
procedure TComboBox.EditWndProc(var Message: TMessage);
var
  OldText: string;
  OldSelStart: integer;
begin
  case Message.Msg of
    WM_IME_ENDCOMPOSITION:
    begin
      OldSelStart := SelStart;
      OldText := self.Text;
      inherited;
      self.Text := OldText;
      SelStart := OldSelStart;
      FIgnoreChar := true;
    end;
    WM_CHAR:
    begin
      FIgnoreChar := false;
      inherited;
    end;
    WM_IME_CHAR:
      if FIgnoreChar then
        FIgnoreChar := false
      else
        inherited;
    else
      inherited;
  end;
end;   }

{ TEdit }

constructor TEdit.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FIgnoreChar := false;
end;

procedure TEdit.WndProc(var Message: TMessage);
var
  OldText: string;
  OldSelStart: integer;
begin
  case Message.Msg of
    WM_IME_ENDCOMPOSITION:
    begin
      OldSelStart := SelStart;
      OldText := self.Text;
      inherited;
      self.Text := OldText;
      SelStart := OldSelStart;
      FIgnoreChar := true;
    end;
    WM_CHAR:
    begin
      FIgnoreChar := false;
      inherited;
    end;
    WM_IME_CHAR:
      if FIgnoreChar then
        FIgnoreChar := false
      else
        inherited;
    else
      inherited;
  end;
end;

end.
