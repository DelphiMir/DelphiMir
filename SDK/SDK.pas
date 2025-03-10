unit SDK;

interface

uses
  {svn,} Windows, SysUtils, Classes, Grobal2, Forms, Graphics;
type

  TOSysMsg = record
    sSysMsg: string;
    Color: TColor;
    DefColor: TColor;
    nX: Integer;
    nY: Integer;
    dwSpellTime: LongWord;
  end;
  pTOSysMsg = ^TOSysMsg;

  TSysMsg = record
    sSysMsg: string;
    Color: TColor;
    nX: Integer;
    nY: Integer;
    AddTime: LongWord;
    EffectTime: LongWord;
    EffectIndex: Integer;
  end;
  pTSysMsg = ^TSysMsg;

  TGList=Class(TList)
  private
    CriticalSection:TRTLCriticalSection;

  public
    Constructor Create;
    Destructor  Destroy;override;

    procedure Lock;
    Procedure UnLock;
  end;

  TGStringList=Class(TStringList)
  private
    CriticalSection:TRTLCriticalSection;

  public
    Constructor Create;
    Destructor  Destroy;override;
    
    procedure Lock;
    Procedure UnLock;
  end;

  {=================================TSortStringList================================}

  TSortStringList = class(TGStringList)     //珐欧
  public
    procedure StringSort(Order: Boolean);
    procedure ObjectSort(Order: Boolean);
  end;

  TSStringList = class(TGStringList)     //珐欧
  public
    procedure QuickSort(Order: Boolean);
  end;

implementation

procedure TSStringList.QuickSort(Order: Boolean); //速度更快的排行
  procedure QuickSortStrListCase(List: TStringList; l, r: Integer);
  var
    I, j: Integer;
    p: string;
  begin
    if List.Count <= 0 then Exit;
    repeat
      I := l;
      j := r;
      p := List[(l + r) shr 1];
      repeat
        if Order then begin //升序
          while CompareStr(List[I], p) < 0 do Inc(I);
          while CompareStr(List[j], p) > 0 do Dec(j);
        end else begin //降序
          while CompareStr(p, List[I]) < 0 do Inc(I);
          while CompareStr(p, List[j]) > 0 do Dec(j);
        end;
        if I <= j then begin
          List.Exchange(I, j);
          Inc(I);
          Dec(j);
        end;
      until I > j;
      if l < j then QuickSortStrListCase(List, l, j);
      l := I;
    until I >= r;
  end;
  procedure AddList(TempList: TStringList; slen: string; s: string; AObject: TObject);
  var
    I: Integer;
    List: TStringList;
    boFound: Boolean;
  begin
    boFound := False;
    for I := 0 to TempList.Count - 1 do begin
      if CompareText(TempList.Strings[I], slen) = 0 then begin
        List := TStringList(TempList.Objects[I]);
        List.AddObject(s, AObject);
        boFound := True;
        Break;
      end;
    end;
    if not boFound then begin
      List := TStringList.Create;
      List.AddObject(s, AObject);
      TempList.AddObject(slen, List);
    end;
  end;
var
  TempList: TStringList;
  List: TStringList;
  I: Integer;
  nLen: Integer;
begin
  TempList := TStringList.Create;
  for I := 0 to Self.Count - 1 do begin
    nLen := Length(Self.Strings[I]);
    AddList(TempList, IntToStr(nLen), Self.Strings[I], Self.Objects[I]);
  end;
  QuickSortStrListCase(TempList, 0, TempList.Count - 1);
  Self.Clear;
  for I := 0 to TempList.Count - 1 do begin
    List := TStringList(TempList.Objects[I]);
    QuickSortStrListCase(List, 0, List.Count - 1);
    Self.AddStrings(List);
    List.Free;
  end;
  TempList.Free;
end;


{ TGList }

constructor TGList.Create;
begin
  inherited;
  InitializeCriticalSection(CriticalSection);
end;

destructor TGList.Destroy;
begin
  DeleteCriticalSection(CriticalSection);
  inherited;
end;

procedure TGList.Lock;
begin
  EnterCriticalSection(CriticalSection);
end;

procedure TGList.UnLock;
begin
  LeaveCriticalSection(CriticalSection);
end;

{ TGStringList }

constructor TGStringList.Create;
begin
  inherited;
  InitializeCriticalSection(CriticalSection);
end;

destructor TGStringList.Destroy;
begin
  DeleteCriticalSection(CriticalSection);
  inherited;
end;

procedure TGStringList.Lock;
begin
  EnterCriticalSection(CriticalSection);
end;

procedure TGStringList.UnLock;
begin
  LeaveCriticalSection(CriticalSection);
end;

{===================================StringList=============================}

procedure TSortStringList.ObjectSort(Order: Boolean);
var
  nIndex, j: Integer;
  TempList: TStringList;
  MinList: TStringList;
  MaxList: TStringList;
  nMax, nMIN, nMaxIndex, nMinIndex: Integer;
begin
  TempList := TStringList.Create;
  MinList := TStringList.Create;
  MaxList := TStringList.Create;
  TempList.AddStrings(Self);
  Clear;
  while True do begin
    if TempList.Count <= 0 then Break;
    nMax := Low(Integer);
    nMIN := High(Integer);
    nMaxIndex := -1;
    nMinIndex := -1;
    nIndex := 0;
    while True do begin
      if TempList.Count <= nIndex then Break;
      j := Integer(TempList.Objects[nIndex]);
      if j > nMax then begin
        nMax := j;
        nMaxIndex := nIndex;
      end;
      if j < nMIN then begin
        nMIN := j;
        nMinIndex := nIndex;
      end;
      Inc(nIndex);
    end;
    if Order then begin
      if nMinIndex = nMaxIndex then begin
        if nMinIndex >= 0 then begin
          MinList.AddObject(TempList.Strings[nMinIndex], TempList.Objects[nMinIndex]);
          TempList.Delete(nMinIndex);
        end;
      end else begin
        if nMinIndex < nMaxIndex then begin
          if nMaxIndex >= 0 then begin
            MaxList.InsertObject(0, TempList.Strings[nMaxIndex], TempList.Objects[nMaxIndex]);
            TempList.Delete(nMaxIndex);
          end;
          if nMinIndex >= 0 then begin
            MinList.AddObject(TempList.Strings[nMinIndex], TempList.Objects[nMinIndex]);
            TempList.Delete(nMinIndex);
          end;
        end else begin
          if nMinIndex >= 0 then begin
            MinList.AddObject(TempList.Strings[nMinIndex], TempList.Objects[nMinIndex]);
            TempList.Delete(nMinIndex);
          end;
          if nMaxIndex >= 0 then begin
            MaxList.InsertObject(0, TempList.Strings[nMaxIndex], TempList.Objects[nMaxIndex]);
            TempList.Delete(nMaxIndex);
          end;
        end;
      end;
    end else begin
      if nMinIndex = nMaxIndex then begin
        if nMinIndex >= 0 then begin
          MaxList.AddObject(TempList.Strings[nMinIndex], TempList.Objects[nMinIndex]);
          TempList.Delete(nMinIndex);
        end;
      end else begin
        if nMinIndex < nMaxIndex then begin
          if nMaxIndex >= 0 then begin
            MaxList.AddObject(TempList.Strings[nMaxIndex], TempList.Objects[nMaxIndex]);
            TempList.Delete(nMaxIndex);
          end;
          if nMinIndex >= 0 then begin
            MinList.InsertObject(0, TempList.Strings[nMinIndex], TempList.Objects[nMinIndex]);
            TempList.Delete(nMinIndex);
          end;
        end else begin
          if nMinIndex >= 0 then begin
            MinList.InsertObject(0, TempList.Strings[nMinIndex], TempList.Objects[nMinIndex]);
            TempList.Delete(nMinIndex);
          end;
          if nMaxIndex >= 0 then begin
            MaxList.AddObject(TempList.Strings[nMaxIndex], TempList.Objects[nMaxIndex]);
            TempList.Delete(nMaxIndex);
          end;
        end;
      end;
    end;
  end;
  if Order then begin
    AddStrings(MinList);
    AddStrings(MaxList);
  end else begin
    AddStrings(MaxList);
    AddStrings(MinList);
  end;
  TempList.Free;
  MinList.Free;
  MaxList.Free;
end;

procedure TSortStringList.StringSort(Order: Boolean);
var
  nIndex, j: Integer;
  TempList: TStringList;
  MinList: TStringList;
  MaxList: TStringList;
  nMax, nMIN, nMaxIndex, nMinIndex: Integer;
begin
  TempList := TStringList.Create;
  MinList := TStringList.Create;
  MaxList := TStringList.Create;
  TempList.AddStrings(Self);
  Clear;
  while True do begin
    if TempList.Count <= 0 then Break;
    nMax := Low(Integer);
    nMIN := High(Integer);
    nMaxIndex := -1;
    nMinIndex := -1;
    nIndex := 0;
    while True do begin
      if TempList.Count <= nIndex then Break;
      j := StrToInt(TempList.Strings[nIndex]);
      if j > nMax then begin
        nMax := j;
        nMaxIndex := nIndex;
      end;
      if j < nMIN then begin
        nMIN := j;
        nMinIndex := nIndex;
      end;
      Inc(nIndex);
    end;
    if Order then begin
      if nMinIndex = nMaxIndex then begin
        if nMinIndex >= 0 then begin
          MinList.AddObject(TempList.Strings[nMinIndex], TempList.Objects[nMinIndex]);
          TempList.Delete(nMinIndex);
        end;
      end else begin
        if nMinIndex < nMaxIndex then begin
          if nMaxIndex >= 0 then begin
            MaxList.InsertObject(0, TempList.Strings[nMaxIndex], TempList.Objects[nMaxIndex]);
            TempList.Delete(nMaxIndex);
          end;
          if nMinIndex >= 0 then begin
            MinList.AddObject(TempList.Strings[nMinIndex], TempList.Objects[nMinIndex]);
            TempList.Delete(nMinIndex);
          end;
        end else begin
          if nMinIndex >= 0 then begin
            MinList.AddObject(TempList.Strings[nMinIndex], TempList.Objects[nMinIndex]);
            TempList.Delete(nMinIndex);
          end;
          if nMaxIndex >= 0 then begin
            MaxList.InsertObject(0, TempList.Strings[nMaxIndex], TempList.Objects[nMaxIndex]);
            TempList.Delete(nMaxIndex);
          end;
        end;
      end;
    end else begin
      if nMinIndex = nMaxIndex then begin
        if nMinIndex >= 0 then begin
          MaxList.AddObject(TempList.Strings[nMinIndex], TempList.Objects[nMinIndex]);
          TempList.Delete(nMinIndex);
        end;
      end else begin
        if nMinIndex < nMaxIndex then begin
          if nMaxIndex >= 0 then begin
            MaxList.AddObject(TempList.Strings[nMaxIndex], TempList.Objects[nMaxIndex]);
            TempList.Delete(nMaxIndex);
          end;
          if nMinIndex >= 0 then begin
            MinList.InsertObject(0, TempList.Strings[nMinIndex], TempList.Objects[nMinIndex]);
            TempList.Delete(nMinIndex);
          end;
        end else begin
          if nMinIndex >= 0 then begin
            MinList.InsertObject(0, TempList.Strings[nMinIndex], TempList.Objects[nMinIndex]);
            TempList.Delete(nMinIndex);
          end;
          if nMaxIndex >= 0 then begin
            MaxList.AddObject(TempList.Strings[nMaxIndex], TempList.Objects[nMaxIndex]);
            TempList.Delete(nMaxIndex);
          end;
        end;
      end;
    end;
  end;
  if Order then begin
    AddStrings(MinList);
    AddStrings(MaxList);
  end else begin
    AddStrings(MaxList);
    AddStrings(MinList);
  end;
  TempList.Free;
  MinList.Free;
  MaxList.Free;
end;
{---- Adjust global SVN revision ----}
initialization
  ////SVNRevision('$Id: SDK.pas 121 2006-08-06 01:10:41Z Dataforce $');
end.

