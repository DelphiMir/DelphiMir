unit MD5Unit;

Interface

uses
	{svn, }Windows, SysUtils, Classes;

const
  CRCPOLY: DWord = $EDB88320;

type
	MD5Count = array[0..1] of DWORD;
	MD5State = array[0..3] of DWORD;
	MD5Block = array[0..15] of DWORD;
	MD5CBits = array[0..7] of byte;
	MD5Digest = array[0..15] of byte;
	MD5Buffer = array[0..63] of byte;
	MD5Context = record
		State: MD5State;
		Count: MD5Count;
		Buffer: MD5Buffer;
	end;

  Long = record
    LoWord: Word;
    HiWord: Word;
  end;

procedure MD5Init(var Context: MD5Context);
procedure MD5Update(var Context: MD5Context; Input: pChar; Length: longword);
procedure MD5Result(var Context: MD5Context; var Digest: MD5Digest);
function GetMD5Text(Input: string): string;

function GetMD5TextByBuffer(Buffer: PChar; BuffLen: Integer): string;

function GetCRC32(FileName: string): LongInt;
function MD5Print(D: MD5Digest): string;

implementation

var
	PADDING: MD5Buffer = (
		$80, $00, $00, $00, $00, $00, $00, $00,
		$00, $00, $00, $00, $00, $00, $00, $00,
		$00, $00, $00, $00, $00, $00, $00, $00,
		$00, $00, $00, $00, $00, $00, $00, $00,
		$00, $00, $00, $00, $00, $00, $00, $00,
		$00, $00, $00, $00, $00, $00, $00, $00,
		$00, $00, $00, $00, $00, $00, $00, $00,
		$00, $00, $00, $00, $00, $00, $00, $00
	);

  CRCTable: array[0..512] Of Longint;

function F(x, y, z: DWORD): DWORD;
begin
	Result := (x and y) or ((not x) and z);
end;

function G(x, y, z: DWORD): DWORD;
begin
	Result := (x and z) or (y and (not z));
end;

function H(x, y, z: DWORD): DWORD;
begin
	Result := x xor y xor z;
end;

function I(x, y, z: DWORD): DWORD;
begin
	Result := y xor (x or (not z));
end;

procedure rot(var x: DWORD; n: BYTE);
begin
	x := (x shl n) or (x shr (32 - n));
end;

procedure FF(var a: DWORD; b, c, d, x: DWORD; s: BYTE; ac: DWORD);
begin
	inc(a, F(b, c, d) + x + ac);
	rot(a, s);
	inc(a, b);
end;

procedure GG(var a: DWORD; b, c, d, x: DWORD; s: BYTE; ac: DWORD);
begin
	inc(a, G(b, c, d) + x + ac);
	rot(a, s);
	inc(a, b);
end;

procedure HH(var a: DWORD; b, c, d, x: DWORD; s: BYTE; ac: DWORD);
begin
	inc(a, H(b, c, d) + x + ac);
	rot(a, s);
	inc(a, b);
end;

procedure II(var a: DWORD; b, c, d, x: DWORD; s: BYTE; ac: DWORD);
begin
	inc(a, I(b, c, d) + x + ac);
	rot(a, s);
	inc(a, b);
end;

procedure Encode(Source, Target: pointer; Count: longword);
var
	S: PByte;
	T: PDWORD;
	I: longword;
begin
	S := Source;
	T := Target;
	for I := 1 to Count div 4 do begin
		T^ := S^;
		inc(S);
		T^ := T^ or (S^ shl 8);
		inc(S);
		T^ := T^ or (S^ shl 16);
		inc(S);
		T^ := T^ or (S^ shl 24);
		inc(S);
		inc(T);
	end;
end;

procedure Decode(Source, Target: pointer; Count: longword);
var
	S: PDWORD;
	T: PByte;
	I: longword;
begin
	S := Source;
	T := Target;
	for I := 1 to Count do begin
		T^ := S^ and $ff;
		inc(T);
		T^ := (S^ shr 8) and $ff;
		inc(T);
		T^ := (S^ shr 16) and $ff;
		inc(T);
		T^ := (S^ shr 24) and $ff;
		inc(T);
		inc(S);
	end;
end;

procedure Transform(Buffer: pointer; var State: MD5State);
var
	a, b, c, d: DWORD;
	Block: MD5Block;
begin
	Encode(Buffer, @Block, 64);
	a := State[0];
	b := State[1];
	c := State[2];
	d := State[3];
	FF (a, b, c, d, Block[ 0],  7, $d76aa478);
	FF (d, a, b, c, Block[ 1], 12, $e8c7b756);
	FF (c, d, a, b, Block[ 2], 17, $242070db);
	FF (b, c, d, a, Block[ 3], 22, $c1bdceee);
	FF (a, b, c, d, Block[ 4],  7, $f57c0faf);
	FF (d, a, b, c, Block[ 5], 12, $4787c62a);
	FF (c, d, a, b, Block[ 6], 17, $a8304613);
	FF (b, c, d, a, Block[ 7], 22, $fd469501);
	FF (a, b, c, d, Block[ 8],  7, $698098d8);
	FF (d, a, b, c, Block[ 9], 12, $8b44f7af);
	FF (c, d, a, b, Block[10], 17, $ffff5bb1);
	FF (b, c, d, a, Block[11], 22, $895cd7be);
	FF (a, b, c, d, Block[12],  7, $6b901122);
	FF (d, a, b, c, Block[13], 12, $fd987193);
	FF (c, d, a, b, Block[14], 17, $a679438e);
	FF (b, c, d, a, Block[15], 22, $49b40821);
	GG (a, b, c, d, Block[ 1],  5, $f61e2562);
	GG (d, a, b, c, Block[ 6],  9, $c040b340);
	GG (c, d, a, b, Block[11], 14, $265e5a51);
	GG (b, c, d, a, Block[ 0], 20, $e9b6c7aa);
	GG (a, b, c, d, Block[ 5],  5, $d62f105d);
	GG (d, a, b, c, Block[10],  9,  $2441453);
	GG (c, d, a, b, Block[15], 14, $d8a1e681);
	GG (b, c, d, a, Block[ 4], 20, $e7d3fbc8);
	GG (a, b, c, d, Block[ 9],  5, $21e1cde6);
	GG (d, a, b, c, Block[14],  9, $c33707d6);
	GG (c, d, a, b, Block[ 3], 14, $f4d50d87);
	GG (b, c, d, a, Block[ 8], 20, $455a14ed);
	GG (a, b, c, d, Block[13],  5, $a9e3e905);
	GG (d, a, b, c, Block[ 2],  9, $fcefa3f8);
	GG (c, d, a, b, Block[ 7], 14, $676f02d9);
	GG (b, c, d, a, Block[12], 20, $8d2a4c8a);
	HH (a, b, c, d, Block[ 5],  4, $fffa3942);
	HH (d, a, b, c, Block[ 8], 11, $8771f681);
	HH (c, d, a, b, Block[11], 16, $6d9d6122);
	HH (b, c, d, a, Block[14], 23, $fde5380c);
	HH (a, b, c, d, Block[ 1],  4, $a4beea44);
	HH (d, a, b, c, Block[ 4], 11, $4bdecfa9);
	HH (c, d, a, b, Block[ 7], 16, $f6bb4b60);
	HH (b, c, d, a, Block[10], 23, $bebfbc70);
	HH (a, b, c, d, Block[13],  4, $289b7ec6);
	HH (d, a, b, c, Block[ 0], 11, $eaa127fa);
	HH (c, d, a, b, Block[ 3], 16, $d4ef3085);
	HH (b, c, d, a, Block[ 6], 23,  $4881d05);
	HH (a, b, c, d, Block[ 9],  4, $d9d4d039);
	HH (d, a, b, c, Block[12], 11, $e6db99e5);
	HH (c, d, a, b, Block[15], 16, $1fa27cf8);
	HH (b, c, d, a, Block[ 2], 23, $c4ac5665);
	II (a, b, c, d, Block[ 0],  6, $f4292244);
	II (d, a, b, c, Block[ 7], 10, $432aff97);
	II (c, d, a, b, Block[14], 15, $ab9423a7);
	II (b, c, d, a, Block[ 5], 21, $fc93a039);
	II (a, b, c, d, Block[12],  6, $655b59c3);
	II (d, a, b, c, Block[ 3], 10, $8f0ccc92);
	II (c, d, a, b, Block[10], 15, $ffeff47d);
	II (b, c, d, a, Block[ 1], 21, $85845dd1);
	II (a, b, c, d, Block[ 8],  6, $6fa87e4f);
	II (d, a, b, c, Block[15], 10, $fe2ce6e0);
	II (c, d, a, b, Block[ 6], 15, $a3014314);
	II (b, c, d, a, Block[13], 21, $4e0811a1);
	II (a, b, c, d, Block[ 4],  6, $f7537e82);
	II (d, a, b, c, Block[11], 10, $bd3af235);
	II (c, d, a, b, Block[ 2], 15, $2ad7d2bb);
	II (b, c, d, a, Block[ 9], 21, $eb86d391);
	inc(State[0], a);
	inc(State[1], b);
	inc(State[2], c);
	inc(State[3], d);
end;

procedure MD5Init(var Context: MD5Context);
begin
	with Context do begin
		State[0] := $67452301;
		State[1] := $efcdab89;
		State[2] := $98badcfe;
		State[3] := $10325476;
		Count[0] := 0;
		Count[1] := 0;
		ZeroMemory(@Buffer, SizeOf(MD5Buffer));
	end;
end;

procedure MD5Update(var Context: MD5Context; Input: pChar; Length: longword);
var
	Index: longword;
	PartLen: longword;
	I: longword;
begin
	with Context do begin
		Index := (Count[0] shr 3) and $3f;
		inc(Count[0], Length shl 3);
		if Count[0] < (Length shl 3) then inc(Count[1]);
		inc(Count[1], Length shr 29);
	end;
	PartLen := 64 - Index;
	if Length >= PartLen then begin
		CopyMemory(@Context.Buffer[Index], Input, PartLen);
		Transform(@Context.Buffer, Context.State);
		I := PartLen;
		while I + 63 < Length do begin
			Transform(@Input[I], Context.State);
			inc(I, 64);
		end;
		Index := 0;
	end else I := 0;
	CopyMemory(@Context.Buffer[Index], @Input[I], Length - I);
end;

procedure MD5Result(var Context: MD5Context; var Digest: MD5Digest);
var
	Bits: MD5CBits;
	Index: longword;
	PadLen: longword;
begin
	Decode(@Context.Count, @Bits, 2);
	Index := (Context.Count[0] shr 3) and $3f;
	if Index < 56 then PadLen := 56 - Index else PadLen := 120 - Index;
	MD5Update(Context, @PADDING, PadLen);
	MD5Update(Context, @Bits, 8);
	Decode(@Context.State, @Digest, 4);
	ZeroMemory(@Context, SizeOf(MD5Context));
end;

function GetMD5Text(Input: string): string;
var
	Context: MD5Context;
  I: Byte;
  DigestResult: MD5Digest;
const
	Digits: array[0..15] of char =
		('0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f');
begin
	Result := '';
	MD5Init(Context);
	MD5Update(Context, pChar(Input), Length(Input));
	MD5Result(Context, DigestResult);
	for I := 0 to 15 do
      Result := Result + Digits[(DigestResult[I] shr 4) and $0f] + Digits[DigestResult[I] and $0f];
end;



function MD5Print(D: MD5Digest): string;
var
  I: byte;
const
  Digits: array[0..15] of char = ('0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f');
begin
  Result := '';
  for I := 0 to 15 do
    Result := Result + Digits[(D[I] shr 4) and $0F] + Digits[D[I] and $0F];
end;

function GetMD5TextByBuffer(Buffer: PChar; BuffLen: Integer): string;
const
  BufSize = 16384;

var
  TotalSize, CurSize: Int64;
  Context: MD5Context;
  Size: DWORD;
  Digest: MD5Digest;
begin
  ZeroMemory(@Digest, Sizeof(MD5Digest));
  TotalSize := BuffLen;
  CurSize := 0;
  MD5Init(Context);
  while CurSize < TotalSize do begin
    if CurSize + BufSize <= TotalSize then Size := BufSize
    else Size := TotalSize - CurSize;
    MD5Update(Context, @Buffer[CurSize], Size);
    Inc(CurSize, Size);
  end;
  MD5Result(Context, Digest);
  Result := MD5Print(Digest);
end;

{
  CRC
}


procedure BuildCRCTable;
var
  i, j: Word;
  r: DWord;
begin
  FillChar(CRCTable, SizeOf(CRCTable), 0);
  for i := 0 to 255 do
  begin
    r := i shl 1;
    for j := 8 downto 0 do
      if (r and 1) <> 0 then
        r := (r Shr 1) xor CRCPOLY
      else
        r := r shr 1;
    CRCTable[i] := r;
   end;
end;


function RecountCRC(b: byte; CrcOld: Longint): Longint;
begin
  RecountCRC := CRCTable[byte(CrcOld xor Longint(b))] xor ((CrcOld shr 8) and $00FFFFFF)
end;

function GetCRC32(FileName: string): LongInt;
var
  Buffer: PChar;
  f: File of Byte;
  b: array[0..255] of Byte;
  CRC: DWord;
  e, i: Integer;
begin
  BuildCRCTable;
  CRC := $FFFFFFFF;
  AssignFile(F, FileName);
  FileMode := 0;
  Reset(F);
  GetMem(Buffer, SizeOf(B));
  repeat
    FillChar(b, SizeOf(b), 0);
    BlockRead(F, b, SizeOf(b), e);
    for i := 0 to (e-1) do
     CRC := RecountCRC(b[i], CRC);
  until (e < 255) or (IOresult <> 0);
  FreeMem(Buffer, SizeOf(B));
  CloseFile(F);
  CRC := Not CRC;
  Result := CRC;
end;



{---- Adjust global SVN revision ----}
initialization
  //SVNRevision('$Id: MD5Unit.pas 517 2006-12-15 14:54:40Z damian $');
end.

