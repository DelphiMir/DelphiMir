unit EncryptUnit2;

interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls,
  StdCtrls, DCPcrypt {, Blowfish, Haval, Md4, Md5, Rmd160, Sha1},
  {Twofish, Rijndael, RC5, RC6, RC4, RC2, Misty1, } Mars, {IDEA, Ice, Gost,}
  DES, Cast256 {, Cast128, Base64}, Grobal2;

function EncodeMessage(sMsg: TDefaultMessage): string; overload;
procedure EncodeMessage(sMsg: TDefaultMessage; Buffer: PChar); overload;
function DecodeMessage(Str: string): TDefaultMessage; overload;
function DecodeMessage(Buffer: PChar; Len: Integer): TDefaultMessage; overload;
function EncodeString(Str: string): string;
function DeCodeString(Str: string): string;
function EncodeBuffer(Buf: PChar; bufsize: Integer): string;
procedure DecodeBuffer(Src: string; Buf: PChar; bufsize: Integer);
procedure Decode6BitBuf(sSource: PChar; pbuf: PChar; nSrcLen, nBufLen: Integer);
procedure Encode6BitBuf(pSrc, PDest: PChar; nSrcLen, nDestLen: Integer);

procedure Decode6BitBufNew(sSource: PChar; pBuf: PChar; nSrcLen, nBufLen: Integer);
procedure Encode6BitBufNew(pSrc, pDest: PChar; nSrcLen, nDestLen: Integer);

function MakeDefaultMsg(wIdent: Word; nRecog: Integer; wParam, wTag, wSeries: Word): TDefaultMessage;
function CalcFileCRC(sFileName: string): Integer; overload;
function CalcFileCRC(sFileName: string; Offset: LongInt): Integer; overload;
function CalcBufferCRC(Buffer: PChar; nSize: Integer): Integer;

function StringCrc(const Value: string): Cardinal;
function BufferCRC(Buffer: PChar; nSize: Integer): Cardinal;

function EncryptEvenNumberString(const AText: string): string;
function DecryptEvenNumberString(const AText: string): string;
function ReverseString(const AText: string): string;
function HashPJW(const Value: string): Longint;

function EncryStrHex(const Str, Key: string): string;
function DecryStrHex(const StrHex, Key: string): string;
function EncryStrHex3(const Str, Key: string): string;
function DecryStrHex3(const StrHex, Key: string): string;

function DecryptString_Old(const Src: string): string;
function EncryptString_Old(const Src: string): string;
function EncryptBuffer_Old(Buf: PChar; bufsize: Integer): string;
procedure DecryptBuffer_Old(const Src: string; Buf: PChar; bufsize: Integer);


function DecryptString(const Src: string): string;
function EncryptString(const Src: string): string;
function EncryptBuffer(Buf: PChar; bufsize: Integer): string; OVERLOAD;
procedure DecryptBuffer(const Src: string; Buf: PChar; bufsize: Integer); OVERLOAD;



function EncryptBuffer(Buf: PChar; bufsize: Integer; Key: string): string; OVERLOAD;
procedure DecryptBuffer(const Src: string; Buf: PChar; bufsize: Integer; Key: string); OVERLOAD;
function DecryptString256(const Str, Key: string): string;
function EncryptString256(const Str, Key: string): string;
function AddSpace(const AText: string; Len: Integer): string;

function EncryptString_Mars(const Str, Key: string): string;
function DecryptString_Mars(const Str, Key: string): string;
function EncryptString_Des(const Str, Key: string): string;
function DecryptString_Des(const Str, Key: string): string;
function EncryptString_3Des(const Str, Key: string): string;
function DecryptString_3Des(const Str, Key: string): string;
function EncryptString_Cast256(const Str, Key: string): string;
function DecryptString_Cast256(const Str, Key: string): string;

procedure EncryptBuffer_Mars(const Indata; var Outdata; Size: Longint; const Key: string);
procedure DecryptBuffer_Mars(const Indata; var Outdata; Size: Longint; const Key: string);
procedure EncryptBuffer_Des(const Indata; var Outdata; Size: Longint; const Key: string);
procedure DecryptBuffer_Des(const Indata; var Outdata; Size: Longint; const Key: string);
procedure EncryptBuffer_3Des(const Indata; var Outdata; Size: Longint; const Key: string);
procedure DecryptBuffer_3Des(const Indata; var Outdata; Size: Longint; const Key: string);
procedure EncryptBuffer_Cast256(const Indata; var Outdata; Size: Longint; const Key: string);
procedure DecryptBuffer_Cast256(const Indata; var Outdata; Size: Longint; const Key: string);
implementation
uses Crc;
var
  DCP_Mars: TDCP_mars;
  DCP_Des: TDCP_des;
  DCP_3Des: TDCP_3des;
  DCP_Cast256: TDCP_cast256;

  n4CEEF4: Integer = $408D4D;
  n4CEEF8: Integer = $0C08BA52E;
  w4CEF00: Word = $8D34;

  n4CEEFC: Integer = $408D97;

  DecodeBitMasks: array[0..255] of Byte = (
    $2A, $E7, $18, $6F, $63, $9D, $48, $EA, $39, $CD, $38, $B8, $A0, $AB, $E0, $10,
    $35, $99, $37, $09, $C0, $69, $B2, $A4, $67, $88, $50, $34, $7F, $FC, $0B, $BE,
    $0C, $44, $59, $B6, $5B, $9C, $65, $D6, $94, $EB, $C4, $3B, $03, $3C, $C9, $3E,
    $6B, $9A, $D4, $F6, $C3, $4D, $11, $24, $AA, $FF, $4A, $ED, $95, $93, $D9, $46,
    $5F, $96, $87, $30, $BA, $CA, $CB, $FA, $8A, $1A, $68, $5C, $AC, $07, $40, $60,
    $29, $70, $57, $53, $41, $12, $DE, $1D, $64, $14, $97, $72, $FB, $8D, $2B, $08,
    $CF, $F4, $3A, $00, $C5, $91, $56, $A9, $9E, $71, $BC, $A3, $AF, $A6, $55, $DA,
    $79, $BB, $33, $A5, $25, $15, $7D, $EE, $C1, $2C, $C7, $D0, $19, $D8, $5A, $E8,
    $85, $FD, $2F, $6A, $78, $45, $DB, $B5, $F5, $1E, $04, $75, $B0, $7A, $20, $F2,
    $DF, $D3, $83, $F3, $54, $90, $A2, $C6, $0F, $80, $36, $4E, $C8, $01, $82, $76,
    $A1, $2E, $84, $86, $0E, $47, $8F, $E1, $F9, $7C, $C2, $74, $DC, $26, $22, $CE,
    $2D, $4F, $BF, $0D, $73, $27, $21, $B3, $98, $1F, $89, $EC, $FE, $52, $0A, $8C,
    $9F, $A8, $E5, $E6, $06, $8B, $CC, $F7, $5E, $E3, $7B, $D2, $05, $49, $13, $E9,
    $66, $B7, $AD, $B4, $F8, $A7, $1C, $F1, $02, $7E, $6E, $17, $62, $4C, $77, $8E,
    $DD, $F0, $43, $28, $6D, $61, $B9, $D7, $BD, $3D, $9B, $92, $16, $EF, $51, $23,
    $E2, $B1, $81, $31, $32, $58, $D1, $5D, $D5, $6C, $4B, $E4, $AE, $42, $1B, $3F
    );

  EncodeBitMasks: array[0..255] of Byte = (
    $8C, $87, $0D, $85, $D4, $64, $63, $E5, $BA, $7E, $B8, $68, $9D, $9F, $F5, $BC,
    $A0, $E3, $3A, $22, $19, $21, $39, $78, $EE, $27, $36, $15, $74, $C7, $97, $C9,
    $CE, $E2, $7B, $4C, $98, $A1, $C2, $59, $41, $C0, $1E, $2E, $95, $EB, $DE, $69,
    $1D, $5B, $53, $DA, $F4, $0A, $4F, $BB, $B7, $24, $33, $0F, $C8, $84, $29, $89,
    $3C, $1C, $08, $49, $C6, $FE, $CC, $23, $3E, $E1, $4E, $8B, $13, $E7, $1A, $5D,
    $CF, $B1, $47, $8F, $D8, $72, $4B, $93, $6E, $73, $4D, $94, $DD, $82, $14, $A7,
    $03, $F9, $F1, $C5, $8D, $79, $2A, $C4, $DC, $60, $5F, $D7, $62, $B5, $E9, $B3,
    $B6, $12, $A8, $32, $D9, $C3, $6A, $75, $4A, $A2, $0C, $26, $91, $5A, $AD, $6D,
    $44, $10, $B4, $46, $1B, $66, $81, $20, $FD, $7F, $88, $25, $9C, $71, $D3, $E6,
    $80, $E4, $FA, $42, $9B, $37, $01, $FC, $DB, $45, $6B, $FB, $56, $F0, $AF, $9A,
    $BF, $AB, $D6, $CD, $02, $F2, $7C, $AA, $B2, $92, $FF, $57, $2F, $86, $A6, $7D,
    $35, $17, $34, $D5, $0E, $65, $09, $05, $28, $CA, $48, $31, $8E, $2D, $DF, $52,
    $F6, $1F, $A4, $50, $76, $40, $18, $04, $8A, $16, $2B, $AE, $43, $3F, $D0, $CB,
    $6C, $55, $54, $96, $99, $30, $67, $5E, $2C, $AC, $E0, $7A, $E8, $58, $90, $BE,
    $A5, $6F, $B0, $70, $EC, $61, $5C, $06, $3B, $77, $C1, $07, $EA, $A9, $F8, $11,
    $BD, $F3, $00, $ED, $83, $EF, $3D, $A3, $51, $9E, $38, $F7, $0B, $B9, $D2, $D1
    );

//---------------------------------------------------------------------------


//获得CRC校验值

function BufferCRC(Buffer: PChar; nSize: Integer): Cardinal;
begin
  Result := Crc.Crc32(Windows.PByte(Buffer), nSize);
end;

function StringCrc(const Value: string): Cardinal;
begin
  Result := 0;
  if Value <> '' then
    Result := Crc.Crc32(@Value[1], Length(Value));
end;

function CalcFileCRC(sFileName: string): Integer;
var
  I: Integer;
  nFileHandle: Integer;
  nFileSize, nBuffSize: Integer;
  Buffer: PChar;
  Int: ^Integer;
  nCrc: Integer;
begin
  Result := 0;
  if not FileExists(sFileName) then Exit;
  nFileHandle := FileOpen(sFileName, fmOpenRead or fmShareDenyNone);
  if nFileHandle = 0 then
    Exit;
  nFileSize := FileSeek(nFileHandle, 0, 2);
  nBuffSize := (nFileSize div 4) * 4;
  GetMem(Buffer, nBuffSize);
  FillChar(Buffer^, nBuffSize, 0);
  FileSeek(nFileHandle, 0, 0);
  FileRead(nFileHandle, Buffer^, nBuffSize);
  FileClose(nFileHandle);
  Int := Pointer(Buffer);
  nCrc := 0;
  Exception.Create(IntToStr(SizeOf(Integer)));
  for I := 0 to nBuffSize div 4 - 1 do begin
    nCrc := nCrc xor Int^;
    Int := Pointer(Integer(Int) + 4);
  end;
  FreeMem(Buffer);
  Result := nCrc;
end;

function CalcFileCRC(sFileName: string; Offset: LongInt): Integer;
var
  I: Integer;
  nFileHandle: Integer;
  nFileSize, nBuffSize: Integer;
  Buffer: PChar;
  Int: ^Integer;
  nCrc: Integer;
begin
  Result := 0;
  if not FileExists(sFileName) then Exit;
  nFileHandle := FileOpen(sFileName, fmOpenRead or fmShareDenyNone);
  if nFileHandle = 0 then
    Exit;
  nFileSize := FileSeek(nFileHandle, Offset, 2);
  nBuffSize := (nFileSize div 4) * 4;
  GetMem(Buffer, nBuffSize);
  FillChar(Buffer^, nBuffSize, 0);
  FileSeek(nFileHandle, 0, 0);
  FileRead(nFileHandle, Buffer^, nBuffSize);
  FileClose(nFileHandle);
  Int := Pointer(Buffer);
  nCrc := 0;
  Exception.Create(IntToStr(SizeOf(Integer)));
  for I := 0 to nBuffSize div 4 - 1 do begin
    nCrc := nCrc xor Int^;
    Int := Pointer(Integer(Int) + 4);
  end;
  FreeMem(Buffer);
  Result := nCrc;
end;

function CalcBufferCRC(Buffer: PChar; nSize: Integer): Integer;
var
  I: Integer;
  Int: ^Integer;
  nCrc: Integer;
begin
  Int := Pointer(Buffer);
  nCrc := 0;
  for I := 0 to nSize div 4 - 1 do begin
    nCrc := nCrc xor Int^;
    Int := Pointer(Integer(Int) + 4);
  end;
  Result := nCrc;
end;

function HashPJW(const Value: string): Longint;
var
  I: Integer;
  G: Longint;
begin
  Result := 0;
  for I := 1 to Length(Value) do begin
    Result := (Result shl 4) + Ord(Value[I]);
    G := Result and $F0000000;
    if G <> 0 then
      Result := (Result xor (G shr 24)) xor G;
  end;
end;

function ReverseString(const AText: string): string;
var
  I: Integer;
  P: PChar;
begin
  SetLength(Result, Length(AText));
  P := PChar(Result);
  for I := Length(AText) downto 1 do
  begin
    P^ := AText[I];
    Inc(P);
  end;
end;

function AddSpace(const AText: string; Len: Integer): string;
var
  I: Integer;
  nLen: Integer;
begin
  Result := AText;
  nLen := Len - Length(AText);
  if nLen > 0 then begin
    for I := 1 to nLen do
    begin
      Result := Result + '';
    end;
  end;
end;

function EncryptEvenNumberString(const AText: string): string;
var
  I: Integer;
  P1, P2: PChar;
begin
  SetLength(Result, Length(AText));
  P1 := PChar(Result);
  P2 := @Result[Length(AText) div 2 + 1];
  for I := 1 to Length(AText) do begin //按照奇偶排列
    if (I <> 1) and (I mod 2 = 0) then begin
      P1^ := AText[I];
      Inc(P1);
    end else begin
      P2^ := AText[I];
      Inc(P2);
    end;
  end;
end;

function DecryptEvenNumberString(const AText: string): string;
var
  I: Integer;
  P, P1, P2: PChar;
begin
  SetLength(Result, Length(AText));
  P := PChar(Result);
  P1 := PChar(AText);
  P2 := @AText[Length(AText) div 2 + 1];
  for I := 1 to Length(AText) do begin //按照奇偶排列
    if (I <> 1) and (I mod 2 = 0) then begin
      P^ := P1^;
      Inc(P);
      Inc(P1);
    end else begin
      P^ := P2^;
      Inc(P);
      Inc(P2);
    end;
  end;
end;

{------------------------------------------------------------------------------}

function MakeDefaultMsg(wIdent: Word; nRecog: Integer; wParam, wTag, wSeries: Word): TDefaultMessage;
begin
  Result.Recog := nRecog;
  Result.Ident := wIdent;
  Result.Param := wParam;
  Result.Tag := wTag;
  Result.Series := wSeries;
end;

procedure Encode6BitBufNew(pSrc, pDest: PChar; nSrcLen, nDestLen: Integer);
var
  I: Integer;
  nRestCount: Integer;
  nDestPos: Integer;
  btMade: Byte;
  btCh: Byte;
  btRest: Byte;
begin
  nRestCount := 0;
  btRest := 0;
  nDestPos := 0;
  for i := 0 to nSrcLen - 1 do begin
    if nDestPos >= nDestLen then break;
    btCh := Byte(pSrc[i]);
//{$IF ENDECODEMODE = NEWMODE}
    btCh := (EncodeBitMasks[btCh] xor n4CEEFC) xor n4CEEF4;
    btCh := btCh xor (HiByte(LoWord(n4CEEF8)) + LoByte(LoWord(n4CEEF8)));
//{$IFEND}
    btMade := Byte((btRest or (btCh shr (2 + nRestCount))) and $3F);
    btRest := Byte(((btCh shl (8 - (2 + nRestCount))) shr 2) and $3F);
    Inc(nRestCount, 2);

    if nRestCount < 6 then begin
      pDest[nDestPos] := Char(btMade + $3C);
      Inc(nDestPos);
    end else begin
      if nDestPos < nDestLen - 1 then begin
        pDest[nDestPos] := Char(btMade + $3C);
        pDest[nDestPos + 1] := Char(btRest + $3C);
        Inc(nDestPos, 2);
      end else begin
        pDest[nDestPos] := Char(btMade + $3C);
        Inc(nDestPos);
      end;
      nRestCount := 0;
      btRest := 0;
    end;
  end;
  if nRestCount > 0 then begin
    pDest[nDestPos] := Char(btRest + $3C);
    Inc(nDestPos);
  end;
  pDest[nDestPos] := #0;
end;


procedure Decode6BitBufNew(sSource: PChar; pBuf: PChar; nSrcLen, nBufLen: Integer);
const
  Masks: array[2..6] of byte = ($FC, $F8, $F0, $E0, $C0);
   //($FE, $FC, $F8, $F0, $E0, $C0, $80, $00);
var
  I, {nLen,} nBitPos, nMadeBit, nBufPos: Integer;
  btCh, btTmp, btByte: Byte;
begin
//  nLen:= Length (sSource);
  nBitPos := 2;
  nMadeBit := 0;
  nBufPos := 0;
  btTmp := 0;
  for I := 0 to nSrcLen - 1 do begin
    if Integer(sSource[I]) - $3C >= 0 then
      btCh := Byte(sSource[I]) - $3C
    else begin
      nBufPos := 0;
      break;
    end;
    if nBufPos >= nBufLen then break;
    if (nMadeBit + 6) >= 8 then begin
      btByte := Byte(btTmp or ((btCh and $3F) shr (6 - nBitPos)));
//{$IF ENDECODEMODE = NEWMODE}
      btByte := btByte xor (HiByte(LoWord(n4CEEF8)) + LoByte(LoWord(n4CEEF8)));
      btByte := btByte xor LoByte(LoWord(n4CEEF4));
      btByte := DecodeBitMasks[btByte] xor LoByte(w4CEF00);
//{$IFEND}
      pBuf[nBufPos] := Char(btByte);
      Inc(nBufPos);
      nMadeBit := 0;
      if nBitPos < 6 then Inc(nBitPos, 2)
      else begin
        nBitPos := 2;
        continue;
      end;
    end;
    btTmp := Byte(Byte(btCh shl nBitPos) and Masks[nBitPos]); // #### ##--
    Inc(nMadeBit, 8 - nBitPos);
  end;
  pBuf[nBufPos] := #0;
end;


procedure Encode6BitBuf(pSrc, PDest: PChar; nSrcLen, nDestLen: Integer);
var
  I: Integer;
  nRestCount: Integer;
  nDestPos: Integer;
  btMade: Byte;
  btCh: Byte;
  btRest: Byte;
begin
  nRestCount := 0;
  btRest := 0;
  nDestPos := 0;
  for I := 0 to nSrcLen - 1 do begin
    if nDestPos >= nDestLen then Break;
    btCh := Byte(pSrc[I]);
    btMade := Byte((btRest or (btCh shr (2 + nRestCount))) and $3F);
    btRest := Byte(((btCh shl (8 - (2 + nRestCount))) shr 2) and $3F);
    Inc(nRestCount, 2);

    if nRestCount < 6 then begin
      PDest[nDestPos] := Char(btMade + $3C);
      Inc(nDestPos);
    end else begin
      if nDestPos < nDestLen - 1 then begin
        PDest[nDestPos] := Char(btMade + $3C);
        PDest[nDestPos + 1] := Char(btRest + $3C);
        Inc(nDestPos, 2);
      end else begin
        PDest[nDestPos] := Char(btMade + $3C);
        Inc(nDestPos);
      end;
      nRestCount := 0;
      btRest := 0;
    end;
  end;
  if nRestCount > 0 then begin
    PDest[nDestPos] := Char(btRest + $3C);
    Inc(nDestPos);
  end;
  PDest[nDestPos] := #0;
end;

{procedure Encode6BitBuf(pSrc, PDest: PChar; nSrcLen, nDestLen: Integer);
var
  I: Integer;
  nRestCount: Integer;
  nDestPos: Integer;
  btMade: Byte;
  btCh: Byte;
  btRest: Byte;
begin
  nRestCount := 0;
  btRest := 0;
  nDestPos := 0;
  for I := 0 to nSrcLen - 1 do begin
    if nDestPos >= nDestLen then Break;
    btCh := Byte(pSrc[I]);
    btMade := Byte((btRest or (btCh shr (2 + nRestCount))) and $3F);
    btRest := Byte(((btCh shl (8 - (2 + nRestCount))) shr 2) and $3F);
    Inc(nRestCount, 2);

    if nRestCount < 6 then begin
      PDest[nDestPos] := Char(btMade + $3C);
      Inc(nDestPos);
    end else begin
      if nDestPos < nDestLen - 1 then begin
        PDest[nDestPos] := Char(btMade + $3C);
        PDest[nDestPos + 1] := Char(btRest + $3C);
        Inc(nDestPos, 2);
      end else begin
        PDest[nDestPos] := Char(btMade + $3C);
        Inc(nDestPos);
      end;
      nRestCount := 0;
      btRest := 0;
    end;
  end;
  if nRestCount > 0 then begin
    PDest[nDestPos] := Char(btRest + $3C);
    Inc(nDestPos);
  end;
  PDest[nDestPos] := #0;
end;       }



procedure Decode6BitBuf(sSource: PChar; pbuf: PChar; nSrcLen, nBufLen: Integer);
const
  Masks: array[2..6] of Byte = ($FC, $F8, $F0, $E0, $C0);
var
  I,  nBitPos, nMadeBit, nBufPos: Integer;
  btCh, btTmp, btByte: Byte;
begin
  nBitPos := 2;
  nMadeBit := 0;
  nBufPos := 0;
  btTmp := 0;
  for I := 0 to nSrcLen - 1 do begin
     if (Integer(sSource[i]) - $3C >= 0) then
      btCh := Byte(sSource[I]) - $3C
    else begin
      nBufPos := 0;
      Break;
    end;
    if nBufPos >= nBufLen then Break;
    if (nMadeBit + 6) >= 8 then begin
      btByte := Byte(btTmp or ((btCh and $3F) shr (6 - nBitPos)));
      pbuf[nBufPos] := Char(btByte);
      Inc(nBufPos);
      nMadeBit := 0;
      if nBitPos < 6 then Inc(nBitPos, 2)
      else begin
        nBitPos := 2;
        Continue;
      end;
    end;
    btTmp := Byte(Byte(btCh shl nBitPos) and Masks[nBitPos]); // #### ##--
    Inc(nMadeBit, 8 - nBitPos);
  end;
  pbuf[nBufPos] := #0;
end;


{procedure Decode6BitBuf(sSource: PChar; pbuf: PChar; nSrcLen, nBufLen: Integer);
const
  Masks: array[2..6] of Byte = ($FC, $F8, $F0, $E0, $C0);
var
  I,  nBitPos, nMadeBit, nBufPos: Integer;
  btCh, btTmp, btByte: Byte;
begin
  nBitPos := 2;
  nMadeBit := 0;
  nBufPos := 0;
  btTmp := 0;
  for I := 0 to nSrcLen - 1 do begin
    if Integer(sSource[I]) - $3C >= 0 then
      btCh := Byte(sSource[I]) - $3C
    else begin
      nBufPos := 0;
      Break;
    end;
    if nBufPos >= nBufLen then Break;
    if (nMadeBit + 6) >= 8 then begin
      btByte := Byte(btTmp or ((btCh and $3F) shr (6 - nBitPos)));
      pbuf[nBufPos] := Char(btByte);
      Inc(nBufPos);
      nMadeBit := 0;
      if nBitPos < 6 then Inc(nBitPos, 2)
      else begin
        nBitPos := 2;
        Continue;
      end;
    end;
    btTmp := Byte(Byte(btCh shl nBitPos) and Masks[nBitPos]); // #### ##--
    Inc(nMadeBit, 8 - nBitPos);
  end;
  pbuf[nBufPos] := #0;
end;      }

function DecodeMessage(Str: string): TDefaultMessage;
var
  EncBuf: array[0..BUFFERSIZE - 1] of Char;
  Msg: TDefaultMessage;
begin
  Decode6BitBuf(PChar(Str), @EncBuf, Length(Str), 100);
  Move(EncBuf, Msg, SizeOf(TDefaultMessage));
  Result := Msg;
end;

function DecodeMessage(Buffer: PChar; Len: Integer): TDefaultMessage;
var
  EncBuf: array[0..BUFFERSIZE - 1] of Char;
  Msg: TDefaultMessage;
begin
  Decode6BitBuf(Buffer, @EncBuf, Len, 100);
  Move(EncBuf, Msg, SizeOf(TDefaultMessage));
  Result := Msg;
end;

function DeCodeString(Str: string): string;
var
  EncBuf: array[0..BUFFERSIZE - 1] of Char;
begin
  Decode6BitBuf(PChar(Str), @EncBuf, Length(Str), SizeOf(EncBuf));
  Result := StrPas(EncBuf);
end;

procedure DecodeBuffer(Src: string; Buf: PChar; bufsize: Integer);
var
  EncBuf: array[0..BUFFERSIZE - 1] of Char;
begin
  Decode6BitBuf(PChar(Src), @EncBuf, Length(Src), SizeOf(EncBuf));
  Move(EncBuf, Buf^, bufsize);
end;

function EncodeMessage(sMsg: TDefaultMessage): string;
var
  EncBuf, TempBuf: array[0..BUFFERSIZE - 1] of Char;
begin
  Move(sMsg, TempBuf, SizeOf(TDefaultMessage));
  Encode6BitBuf(@TempBuf, @EncBuf, SizeOf(TDefaultMessage), SizeOf(EncBuf));
  Result := StrPas(EncBuf);
end;

procedure EncodeMessage(sMsg: TDefaultMessage; Buffer: PChar);
var
  TempBuf: array[0..BUFFERSIZE - 1] of Char;
begin
  Move(sMsg, TempBuf, SizeOf(TDefaultMessage));
  Encode6BitBuf(@TempBuf, Buffer, SizeOf(TDefaultMessage), 16);
end;

function EncodeString(Str: string): string;
var
  EncBuf: array[0..BUFFERSIZE - 1] of Char;
begin
  Encode6BitBuf(PChar(Str), @EncBuf, Length(Str), SizeOf(EncBuf));
  Result := StrPas(EncBuf);
end;

function EncodeBuffer(Buf: PChar; bufsize: Integer): string;
var
  EncBuf, TempBuf: array[0..BUFFERSIZE - 1] of Char;
begin
  if bufsize < BUFFERSIZE then begin
    Move(Buf^, TempBuf, bufsize);
    Encode6BitBuf(@TempBuf, @EncBuf, bufsize, SizeOf(EncBuf));
    Result := StrPas(EncBuf);
  end else Result := '';
end;
{------------------------------------------------------------------------------}

function DecryptString256(const Str, Key: string): string;
var
  TempResult: string;
begin
  TempResult := DeCodeString(Str);
  SetLength(Result, Length(TempResult));
  DecryptBuffer_Cast256(TempResult[1], Result[1], Length(TempResult), Key);
end;

function EncryptString256(const Str, Key: string): string;
var
  TempResult: string;
begin
  SetLength(TempResult, Length(Str));
  EncryptBuffer_Cast256(Str[1], TempResult[1], Length(Str), Key);
  Result := EncodeString(TempResult);
end;

function EncryStrHex3(const Str, Key: string): string;
begin
  DCP_3Des.InitStr(Key);
  DCP_3Des.Reset;
  Result := DCP_3Des.EncryStrHex(Str);
end;
{var
  DCP: TDCP_3des;
begin
  DCP := TDCP_3des.Create;
  try
    DCP.InitStr(Key);
    DCP.Reset;
    Result := DCP.EncryStrHex(Str);
  finally
    DCP.Free;
  end;
end;
}

function DecryStrHex3(const StrHex, Key: string): string;
begin
  DCP_3Des.InitStr(Key);
  DCP_3Des.Reset;
  Result := DCP_3Des.DecryStrHex(StrHex);
end;
{var
  DCP: TDCP_3des;
begin
  DCP := TDCP_3des.Create;
  try
    DCP.InitStr(Key);
    DCP.Reset;
    Result := DCP.DecryStrHex(StrHex);
  finally
    DCP.Free;
  end;
end;
 }

function EncryStrHex(const Str, Key: string): string;
begin
  DCP_Des.InitStr(Key);
  DCP_Des.Reset;
  Result := DCP_Des.EncryStrHex(Str);
end;
{var
  DCP: TDCP_des;
begin
  DCP := TDCP_des.Create;
  try
    DCP.InitStr(Key);
    DCP.Reset;
    Result := DCP.EncryStrHex(Str);
  finally
    DCP.Free;
  end;
end;
}

function DecryStrHex(const StrHex, Key: string): string;
begin
  DCP_Des.InitStr(Key);
  DCP_Des.Reset;
  Result := DCP_Des.DecryStrHex(StrHex);
end;
{var
  DCP: TDCP_des;
begin
  DCP := TDCP_des.Create;
  try
    DCP.InitStr(Key);
    DCP.Reset;
    Result := DCP.DecryStrHex(StrHex);
  finally
    DCP.Free;
  end;
end;
 }


{===============================================================================}


{------------------------------------------------------------------------------}

function DecryptString(const Src: string): string;
var
  Key: string;
  TempResult: string;
  TempKey: string;
begin
  Result := '';
  if Src = '' then Exit;

  TempResult := DecryptString_Mars(Src, IntToStr(2009010120090101));

  Key := Copy(TempResult, 1, 4) + Copy(TempResult, Length(TempResult) - 4 + 1, 4);

  SetLength(TempKey, Length(Key));
  DecryptBuffer_3Des(Key[1], TempKey[1], Length(Key), IntToStr(2009010120090101));

  TempResult := Copy(TempResult, 5, Length(TempResult) - 8);

  SetLength(Result, Length(TempResult));
  DecryptBuffer_3Des(TempResult[1], Result[1], Length(TempResult), TempKey);
end;

function EncryptString(const Src: string): string;
const
  B64: array[0..61] of byte = (65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80,
    81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108,
    109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122, 48, 49, 50, 51, 52, 53,
    54, 55, 56, 57 {, 43, 47});
var
  I: Integer;
  Key: string;
  P: PChar;
  TempResult: string;
  TempKey: string;
begin
  Result := '';
  if Src = '' then Exit;
  SetLength(Key, 8);
  P := PChar(Key);
  for I := 1 to 8 do begin
    P^ := Chr(B64[Random(61)]);
    Inc(P);
  end;

  SetLength(TempResult, Length(Src));
  EncryptBuffer_3Des(Src[1], TempResult[1], Length(Src), Key);

  SetLength(TempKey, Length(Key));
  EncryptBuffer_3Des(Key[1], TempKey[1], Length(Key), IntToStr(2009010120090101));

  TempResult := Copy(TempKey, 1, Length(TempKey) div 2) + TempResult + Copy(TempKey, Length(TempKey) div 2 + 1, Length(TempKey) div 2);
  Result := EncryptString_Mars(TempResult, IntToStr(2009010120090101));
end;

function EncryptBuffer(Buf: PChar; bufsize: Integer): string;
var
  Src: string;
begin
  SetLength(Src, bufsize + 1);
  Move(Buf^, Src[1], bufsize + 1);
  Result := EncryptString(Src);
end;

procedure DecryptBuffer(const Src: string; Buf: PChar; bufsize: Integer);
var
  Dest: string;
begin
  Dest := DecryptString(Src);
  if Dest <> '' then begin
    Move(Dest[1], Buf^, bufsize);
  end;
end;


{------------------------------------------------------------------------------}

function DecryptString_Old(const Src: string): string;
var
  Key: string;
  TempResult: string;
  TempKey: string;
begin
  Result := '';
  if Src = '' then Exit;
  TempResult := DecryptString_Mars(Src, IntToStr(2008082220080822));

  Key := Copy(TempResult, 1, 8) + Copy(TempResult, Length(TempResult) - 8 + 1, 8);

  SetLength(TempKey, Length(Key));
  DecryptBuffer_3Des(Key[1], TempKey[1], Length(Key), IntToStr(2008082220080822));

  TempResult := Copy(TempResult, 9, Length(TempResult) - 16);

  SetLength(Result, Length(TempResult));
  DecryptBuffer_3Des(TempResult[1], Result[1], Length(TempResult), TempKey);
end;

function EncryptString_Old(const Src: string): string;
const
  B64: array[0..63] of byte = (65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80,
    81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108,
    109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122, 48, 49, 50, 51, 52, 53,
    54, 55, 56, 57, 43, 47);
var
  I: Integer;
  Key: string;
  P: PChar;
  TempResult: string;
  TempKey: string;
begin
  Result := '';
  if Src = '' then Exit;
  SetLength(Key, 16);
  P := PChar(Key);
  for I := 1 to 16 do begin
    P^ := Chr(B64[Random(63)]);
    Inc(P);
  end;

  SetLength(TempResult, Length(Src));
  EncryptBuffer_3Des(Src[1], TempResult[1], Length(Src), Key);

  SetLength(TempKey, Length(Key));
  EncryptBuffer_3Des(Key[1], TempKey[1], Length(Key), IntToStr(2008082220080822));

  TempResult := Copy(TempKey, 1, Length(TempKey) div 2) + TempResult + Copy(TempKey, Length(TempKey) div 2 + 1, Length(TempKey) div 2);

  Result := EncryptString_Mars(TempResult, IntToStr(2008082220080822));
end;

function EncryptBuffer_Old(Buf: PChar; bufsize: Integer): string;
var
  Src: string;
begin
  SetLength(Src, bufsize + 1);
  Move(Buf^, Src[1], bufsize + 1);
  Result := EncryptString(Src);
end;

procedure DecryptBuffer_Old(const Src: string; Buf: PChar; bufsize: Integer);
var
  Dest: string;
begin
  Dest := DecryptString(Src);
  if Dest <> '' then begin
    Move(Dest[1], Buf^, bufsize);
  end;
end;

{------------------------------------------------------------------------------}

function EncryptBuffer(Buf: PChar; bufsize: Integer; Key: string): string;
begin

end;

procedure DecryptBuffer(const Src: string; Buf: PChar; bufsize: Integer; Key: string);
begin

end;

function EncryptString_Mars(const Str, Key: string): string;
begin
  DCP_Mars.InitStr(Key);
  DCP_Mars.Reset;
  Result := DCP_Mars.EncryptString(Str);
end;
{var
  DCP: TDCP_mars;
begin
  DCP := TDCP_mars.Create;
  try
    DCP.InitStr(Key);
    DCP.Reset;
    Result := DCP.EncryptString(Str);
  finally
    DCP.Free;
  end;
end;
  }

function DecryptString_Mars(const Str, Key: string): string;
begin
  DCP_Mars.InitStr(Key);
  DCP_Mars.Reset;
  Result := DCP_Mars.DecryptString(Str);
end;
{var
  DCP: TDCP_mars;
begin
  DCP := TDCP_mars.Create;
  try
    DCP.InitStr(Key);
    DCP.Reset;
    Result := DCP.DecryptString(Str);
  finally
    DCP.Free;
  end;
end;
  }

function EncryptString_Des(const Str, Key: string): string;
begin
  DCP_Des.InitStr(Key);
  DCP_Des.Reset;
  Result := DCP_Des.EncryptString(Str);
end;
{
var
  DCP: TDCP_des;
begin
  DCP := TDCP_des.Create;
  try
    DCP.InitStr(Key);
    DCP.Reset;
    Result := DCP.EncryptString(Str);
  finally
    DCP.Free;
  end;
end;
 }

function DecryptString_Des(const Str, Key: string): string;
begin
  DCP_Des.InitStr(Key);
  DCP_Des.Reset;
  Result := DCP_Des.DecryptString(Str);
end;
{var
  DCP: TDCP_des;
begin
  DCP := TDCP_des.Create;
  try
    DCP.InitStr(Key);
    DCP.Reset;
    Result := DCP.DecryptString(Str);
  finally
    DCP.Free;
  end;
end;
}

function EncryptString_3Des(const Str, Key: string): string;
begin
  DCP_3Des.InitStr(Key);
  DCP_3Des.Reset;
  Result := DCP_3Des.EncryptString(Str);
end;
{var
  DCP: TDCP_3des;
begin
  DCP := TDCP_3des.Create;
  try
    DCP.InitStr(Key);
    DCP.Reset;
    Result := DCP.EncryptString(Str);
  finally
    DCP.Free;
  end;
end;
 }

function DecryptString_3Des(const Str, Key: string): string;
begin
  DCP_3Des.InitStr(Key);
  DCP_3Des.Reset;
  Result := DCP_3Des.DecryptString(Str);
end;
{var
  DCP: TDCP_3des;
begin
  DCP := TDCP_3des.Create;
  try
    DCP.InitStr(Key);
    DCP.Reset;
    Result := DCP.DecryptString(Str);
  finally
    DCP.Free;
  end;
end;
}

function EncryptString_Cast256(const Str, Key: string): string;
begin
  DCP_Cast256.InitStr(Key);
  DCP_Cast256.Reset;
  Result := DCP_Cast256.EncryptString(Str);
end;
{var
  DCP: TDCP_cast256;
begin
  DCP := TDCP_cast256.Create;
  try
    DCP.InitStr(Key);
    DCP.Reset;
    Result := DCP.EncryptString(Str);
  finally
    DCP.Free;
  end;
end;
     }

function DecryptString_Cast256(const Str, Key: string): string;
begin
  DCP_Cast256.InitStr(Key);
  DCP_Cast256.Reset;
  Result := DCP_Cast256.DecryptString(Str);
end;
{var
  DCP: TDCP_cast256;
begin
  DCP := TDCP_cast256.Create;
  try
    DCP.InitStr(Key);
    DCP.Reset;
    Result := DCP.DecryptString(Str);
  finally
    DCP.Free;
  end;
end;
 }

procedure EncryptBuffer_Mars(const Indata; var Outdata; Size: Longint; const Key: string);
begin
  DCP_Mars.InitStr(Key);
  DCP_Mars.Reset;
  DCP_Mars.Encrypt(Indata, Outdata, Size);
end;
{var
  DCP: TDCP_mars;
begin
  DCP := TDCP_mars.Create;
  try
    DCP.InitStr(Key);
    DCP.Reset;
    DCP.Encrypt(Indata, Outdata, Size);
  finally
    DCP.Free;
  end;
end;
  }

procedure DecryptBuffer_Mars(const Indata; var Outdata; Size: Longint; const Key: string);
begin
  DCP_Mars.InitStr(Key);
  DCP_Mars.Reset;
  DCP_Mars.Decrypt(Indata, Outdata, Size);
end;
{var
  DCP: TDCP_mars;
begin
  DCP := TDCP_mars.Create;
  try
    DCP.InitStr(Key);
    DCP.Reset;
    DCP.Decrypt(Indata, Outdata, Size);
  finally
    DCP.Free;
  end;
end;
}

procedure EncryptBuffer_Des(const Indata; var Outdata; Size: Longint; const Key: string);
begin
  DCP_Des.InitStr(Key);
  DCP_Des.Reset;
  DCP_Des.Encrypt(Indata, Outdata, Size);
end;
{var
  DCP: TDCP_Des;
begin
  DCP := TDCP_Des.Create;
  try
    DCP.InitStr(Key);
    DCP.Reset;
    DCP.Encrypt(Indata, Outdata, Size);
  finally
    DCP.Free;
  end;
end;
}

procedure DecryptBuffer_Des(const Indata; var Outdata; Size: Longint; const Key: string);
begin
  DCP_Des.InitStr(Key);
  DCP_Des.Reset;
  DCP_Des.Decrypt(Indata, Outdata, Size);
end;
{var
  DCP: TDCP_Des;
begin
  DCP := TDCP_Des.Create;
  try
    DCP.InitStr(Key);
    DCP.Reset;
    DCP.Decrypt(Indata, Outdata, Size);
  finally
    DCP.Free;
  end;
end;
}

procedure EncryptBuffer_3Des(const Indata; var Outdata; Size: Longint; const Key: string);
begin
  DCP_3Des.InitStr(Key);
  DCP_3Des.Reset;
  DCP_3Des.Encrypt(Indata, Outdata, Size);
end;
{var
  DCP: TDCP_3Des;
begin
  DCP := TDCP_3Des.Create;
  try
    DCP.InitStr(Key);
    DCP.Reset;
    DCP.Encrypt(Indata, Outdata, Size);
  finally
    DCP.Free;
  end;
end;
    }

procedure DecryptBuffer_3Des(const Indata; var Outdata; Size: Longint; const Key: string);
begin
  DCP_3Des.InitStr(Key);
  DCP_3Des.Reset;
  DCP_3Des.Decrypt(Indata, Outdata, Size);
end;
{var
  DCP: TDCP_3Des;
begin
  DCP := TDCP_3Des.Create;
  try
    DCP.InitStr(Key);
    DCP.Reset;
    DCP.Decrypt(Indata, Outdata, Size);
  finally
    DCP.Free;
  end;
end;
}

procedure EncryptBuffer_Cast256(const Indata; var Outdata; Size: Longint; const Key: string);
begin
  DCP_Cast256.InitStr(Key);
  DCP_Cast256.Reset;
  DCP_Cast256.Encrypt(Indata, Outdata, Size);
end;
{var
  DCP: TDCP_Cast256;
begin
  DCP := TDCP_Cast256.Create;
  try
    DCP.InitStr(Key);
    DCP.Reset;
    DCP.Encrypt(Indata, Outdata, Size);
  finally
    DCP.Free;
  end;
end;
}

procedure DecryptBuffer_Cast256(const Indata; var Outdata; Size: Longint; const Key: string);
begin
  DCP_Cast256.InitStr(Key);
  DCP_Cast256.Reset;
  DCP_Cast256.Decrypt(Indata, Outdata, Size);
end;
{var
  DCP: TDCP_Cast256;
begin
  DCP := TDCP_Cast256.Create;
  try
    DCP.InitStr(Key);
    DCP.Reset;
    DCP.Decrypt(Indata, Outdata, Size);
  finally
    DCP.Free;
  end;
end;
}
initialization
  begin
    Randomize;
    DCP_Mars := TDCP_Mars.Create;
    DCP_Des := TDCP_Des.Create;
    DCP_3Des := TDCP_3Des.Create;
    DCP_Cast256 := TDCP_Cast256.Create;
  end;

finalization
  begin
    DCP_Mars.Free;
    DCP_Des.Free;
    DCP_3Des.Free;
    DCP_Cast256.Free;
  end;

end.

