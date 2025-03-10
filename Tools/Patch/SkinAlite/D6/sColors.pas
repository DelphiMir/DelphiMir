unit sColors;
{$I sDefs.inc}

interface

uses
  Classes, Controls, Graphics, Forms, sConst;


function RxIdentToColor(const Ident: string; var Color: Longint): Boolean;
function RxColorToString(Color: TColor): string;
function RxStringToColor(S: string): TColor;
procedure RxGetColorValues(Proc: TGetStrProc);


implementation

uses
  Windows, SysUtils, Dialogs;


type
  TColorEntry = record
    Value: TColor;
    Name: PChar;
  end;

const
  ColorCount = 27;
  Colors: array[0..ColorCount - 1] of TColorEntry = (
    (Value: scDarkRed       ; Name: 'scDarkRed'              ),
    (Value: scDarkOrange    ; Name: 'scDarkOrange'           ),
    (Value: scDarkYellow    ; Name: 'scDarkYellow'           ),
    (Value: scDarkGreen     ; Name: 'scDarkGreen'            ),
    (Value: scDarkSky       ; Name: 'scDarkSky'              ),
    (Value: scDarkBlue      ; Name: 'scDarkBlue'             ),
    (Value: scDarkViolet    ; Name: 'scDarkViolet'           ),
    (Value: scDarkBrown     ; Name: 'scDarkBrown'            ),
    (Value: scDarkKaki      ; Name: 'scDarkKaki'             ),

    (Value: scRed           ; Name: 'scRed'                  ),
    (Value: scOrange        ; Name: 'scOrange'               ),
    (Value: scYellow        ; Name: 'scYellow'               ),
    (Value: scGreen         ; Name: 'scGreen'                ),
    (Value: scSky           ; Name: 'scSky'                  ),
    (Value: scBlue          ; Name: 'scBlue'                 ),
    (Value: scViolet        ; Name: 'scViolet'               ),
    (Value: scBrown         ; Name: 'scBrown'                ),
    (Value: scKaki          ; Name: 'scKaki'                 ),

    (Value: scLightRed      ; Name: 'scLightRed'             ),
    (Value: scLightOrange   ; Name: 'scLightOrange'          ),
    (Value: scLightYellow   ; Name: 'scLightYellow'          ),
    (Value: scLightGreen    ; Name: 'scLightGreen'           ),
    (Value: scLightSky      ; Name: 'scLightSky'             ),
    (Value: scLightBlue     ; Name: 'scLightBlue'            ),
    (Value: scLightViolet   ; Name: 'scLightViolet'          ),
    (Value: scLightBrown    ; Name: 'scLightBrown'           ),
    (Value: scLightKaki     ; Name: 'scLightKaki'            )

  );

function RxColorToString(Color: TColor): string;
var
  I: Integer;
begin
  if not ColorToIdent(Color, Result) then begin
    for I := Low(Colors) to High(Colors) do
      if Colors[I].Value = Color then
      begin
        Result := StrPas(Colors[I].Name);
        Exit;
      end;
    FmtStr(Result, '$%.8x', [Color]);
  end;
end;

function RxIdentToColor(const Ident: string; var Color: Longint): Boolean;
var
  I: Integer;
  Text: array[0..63] of Char;
begin
  StrPLCopy(Text, Ident, SizeOf(Text) - 1);
  for I := Low(Colors) to High(Colors) do
    if StrIComp(Colors[I].Name, Text) = 0 then begin
      Color := Colors[I].Value;
      Result := True;
      Exit;
    end;
  Result := IdentToColor(Ident, Color);
end;

function RxStringToColor(S: string): TColor;
var
  I: Integer;
  Text: array[0..63] of Char;
begin
  StrPLCopy(Text, S, SizeOf(Text) - 1);
  for I := Low(Colors) to High(Colors) do
    if StrIComp(Colors[I].Name, Text) = 0 then
    begin
      Result := Colors[I].Value;
      Exit;
    end;
  Result := StringToColor(S);
end;

procedure RxGetColorValues(Proc: TGetStrProc);
var
  I: Integer;
begin
  GetColorValues(Proc);
  for I := Low(Colors) to High(Colors) do Proc(StrPas(Colors[I].Name));
end;

end.
