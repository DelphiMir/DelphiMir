unit LogDataMain;

interface

uses
  svn, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, LDServer, StdCtrls, IniFiles, ExtCtrls, nixtime, CnClasses, CnTrayIcon;

const
  sININAME: String = 'LogData.ini';
  LDSMAX = 0;
  SG_FORMHANDLE=32001;//Server HANLD
  SG_STARTNOW=32002;  //Starting the server...
  SG_STARTOK=32003;   //Start complete...
  GS_QUIT = 32101;

type
  tFileHeader = packed record
    sFileType: Array[0..2] of Char;
    nVersion: Word;
    nCreate: LongInt;
  end;
  tItemHeader = packed record
    bDetails: Array[0..4] of Byte;
    TotalDataLength: Short;
  end;

  TFrmLogData = class(TForm)
    ProcessList: TTimer;
    Label1: TLabel;
    Label2: TLabel;
    CheckBox1: TRadioButton;
    Button1: TButton;
    CnTrayIcon1: TCnTrayIcon;
    procedure FormCreate(Sender: TObject);
    procedure ProcessListTimer(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CheckBox1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure CnTrayIcon1DblClick(Sender: TObject);
  private
    DontUnCheck: Boolean;
    sCaption: String;
    StoreType: Integer;
    LDS: Array[0..LDSMAX] of tLDServer; // Allows Multiple Servers to use 1 app in future
    ItemList: Array[0..LDSMAX] of TList;
    m_boRemoteClose: Boolean;
    
    procedure GotItem(Sender: TObject; Item: ptLogItem);
    procedure GotError(Sender: TObject; Item: ptLogItem);    
  public
    procedure MyMessage(var MsgData: TWmCopyData); message WM_COPYDATA;
    { Public declarations }
  end;

var
  FrmLogData: TFrmLogData;
  PosFile: String;


implementation

uses LDShare, LogManage{, HUtil32};

{$R *.dfm}

procedure TFrmLogData.FormCreate(Sender: TObject);
var
  ini: TMemIniFile;
  i: Integer;
  nX, nY: Integer;
begin
 // g_dwGameCenterHandle := Str_ToInt(ParamStr(1), 0);
 { nX := Str_ToInt(ParamStr(2), -1);
  nY := Str_ToInt(ParamStr(3), -1);
  if (nX >= 0) or (nY >= 0) then begin
    Left := nX;
    Top := nY;
  end;  }
  gethandle;

  m_boRemoteClose := False;
  SendGameCenterMsg(SG_FORMHANDLE, IntToStr(Self.Handle));
  SendGameCenterMsg(SG_STARTNOW, '로그서버 시작중');
  Label2.Caption := inttostr(SizeOf(tFileHeader))+' / '+inttostr(SizeOf(tLogItemData));
  Label1.Caption := '상태: 로딩중';
  sCaption := Label1.Caption;
  ini := TMemIniFile.Create(sININAME);
  try
    StoreType := strtoint(ini.ReadString('Setup','Format','1'));
  except
    StoreType := 1;
  end;
  PosFile := ini.ReadString('Setup','Positions','.\Positions.ini');
  ini.free;

  ini := TMemIniFile.Create(PosFile);
  FrmLogData.Left := ini.ReadInteger('LogDataServer','Left',(Screen.Width Div 2)-(FrmLogData.Width Div 2));
  FrmLogData.Top := ini.ReadInteger('LogDataServer','Top',(Screen.Height Div 2)-(FrmLogData.Height Div 2)-30);
  ini.Free;                   

  for I := 0 to LDSMAX do begin
    Label1.Caption := '상태: 기록중 (Creating LDS['+inttostr(I)+'])';
    sCaption := Label1.Caption;    
    ItemList[I] := TList.Create;
    ItemList[I].Clear;

    LDS[I] := tLDServer.Create(sININAME,'Setup');
    LDS[I].OnNewItem := GotItem;
    LDS[I].OnItemError := GotError;
    LDS[I].Tag := I;
  end;
  DontUnCheck := False;
  Label1.Caption := '상태: 대기중';
  sCaption := Label1.Caption;
  SendGameCenterMsg(SG_STARTOK, '로그서버 시작완료');
end;

procedure TFrmLogData.GotItem(Sender: TObject; Item: ptLogItem);
begin
  Label1.Caption := '상태: Processing Item';
  Item.CleanUp := False;
  ItemList[tLDServer(Sender).Tag].Add(Item);
  Label1.Caption := '상태: 대기중';
  sCaption := Label1.Caption;
end;

procedure TFrmLogData.GotError(Sender: TObject; Item: ptLogItem);
var
  F: TextFile;
begin
  DontUnCheck := True;
  CheckBox1.Checked := True;
  Label1.Caption := '상태: 로딩 오류';
  Application.ProcessMessages();
  try
    AssignFile(F,'.\Error.log');
    if not FileExists('.\Error.log') then Rewrite(F)
    else Append(F);
    WriteLN(F,'['+inttostr(UnixTime)+'/'+FormatDateTime('yyyy-mm-dd hh:mm:ss',Now)+'] '+tLDServer(Sender).Config.sServerName+' Gave Errornous Line: '+Item.sFullString);
  finally
    CloseFile(F)
  end;
  Label1.Caption := '상태: 대기중';
  sCaption := Label1.Caption;  
end;

procedure TFrmLogData.ProcessListTimer(Sender: TObject);
var
  Year, Month, Day, Hour, Min, Sec, MSec: Word;
  sLogDir,sLogFile,sLastName:String;
  TheTime: TDateTime;
  Item: ptLogItem;
  A,I,S: Integer;
  F: TextFile;
  F3: File;
  sLine: Array of Char;
  Temp: ^TList;
  Header: tFileHeader;
  DataHeader: tItemHeader;
begin
  try
    Label1.Caption := '상태: 기록중';
    sCaption := Label1.Caption;
    for A := 0 to LDSMAX do begin
      sLastName := '';
      if ItemList[A].Count < 1 then continue;
      for I := 0 to ItemList[A].Count-1 do begin
        Label1.Caption := '상태: 기록중 ['+inttostr(A)+'] (Processing item: '+inttostr(I)+')';
        sCaption := Label1.Caption;
        Item := ptLogItem(ItemList[A].Items[I]);
        TheTime := UnixToDateTime(Item.Data.nTime);
        DecodeDate(TheTime, Year, Month, Day);
        DecodeTime(TheTime, Hour, Min, Sec, MSec);

        sLogDir := LDS[A].Config.sOutputDir+IntToStr(Year)+'-'+IntToString(Month)+'-'+IntToString(Day);
        if Not DirectoryExists(sLogDir) then MkDir(sLogDir);
        sLogFile := sLogDir+'\로그-'+IntToString(Hour)+'시'+IntToString((Min div 10)*10)+'분';
        if StoreType = 3 then sLogFile:=sLogFile+'.mlg'
        else sLogFile:=sLogFile+'.txt';
        try
          if (sLastName <> sLogFile) then begin
            if sLastName <> '' then begin
              Label1.Caption := '상태: 기록중 ['+inttostr(A)+'] (Processing item: '+inttostr(I)+') - Changing File';
              sCaption := Label1.Caption;
              if StoreType = 3 then begin
                CloseFile(F3);
              end
              else begin
                Flush(F);
                CloseFile(F);
              end;
            end;
            if StoreType = 3 then begin
              AssignFile(F3,sLogFile);
              if not FileExists(sLogFile) then begin
                Rewrite(F3,1);
                Header.sFileType := 'MLG';
                Header.nVersion := 3;
                Header.nCreate := UnixTime();
                BlockWrite(F3,Header,SizeOf(Header));
              end
              else begin
                Reset(F3,1);
                Seek(F3,FileSize(F3));
              end;
            end
            else begin
              AssignFile(F,sLogFile);
              if not FileExists(sLogFile) then Rewrite(F)
              else Append(F);
            end;
          end;
        except
        end;
        sLastName := sLogFile;
        Label2.Caption := '경로: '+sLogFile;
        try
          Label1.Caption := '상태: 기록중 ['+inttostr(A)+'] (Processing item: '+inttostr(I)+') - Adding to File';
          sCaption := Label1.Caption;
          if StoreType = 3 then begin

            DataHeader.bDetails[0] := Length(Item.Data.sMapName);   {21}
            DataHeader.bDetails[1] := Length(Item.Data.sCharName);  {15}
            DataHeader.bDetails[2] := Length(Item.Data.sItem);      {21}
            DataHeader.bDetails[3] := Length(Item.Data.sData);      {3}
            DataHeader.bDetails[4] := Length(Item.Data.sExtraData); {16}
            DataHeader.TotalDataLength := SizeOf(Item.Data);
            for S := 0 to 4 do DataHeader.TotalDataLength := (DataHeader.TotalDataLength - 4 + DataHeader.bDetails[S]);

            BlockWrite(F3,DataHeader,SizeOf(DataHeader));

            BlockWrite(F3,Item.Data.nNothing,SizeOf(Item.Data.nNothing));
            BlockWrite(F3,Item.Data.nServerNumber,SizeOf(Item.Data.nServerNumber));
            BlockWrite(F3,Item.Data.nServerIndex,SizeOf(Item.Data.nServerIndex));
            BlockWrite(F3,Item.Data.nType,SizeOf(Item.Data.nType));
            BlockWrite(F3,Item.Data.sMapName[1],DataHeader.bDetails[0]);
            BlockWrite(F3,Item.Data.nPositionX,SizeOf(Item.Data.nPositionX));
            BlockWrite(F3,Item.Data.nPositionY,SizeOf(Item.Data.nPositionY));
            BlockWrite(F3,Item.Data.sCharName[1],DataHeader.bDetails[1]);
            BlockWrite(F3,Item.Data.sItem[1],DataHeader.bDetails[2]);
            BlockWrite(F3,Item.Data.nData,SizeOf(Item.Data.nData));
            BlockWrite(F3,Item.Data.sData[1],DataHeader.bDetails[3]);
            BlockWrite(F3,Item.Data.sExtraData[1],DataHeader.bDetails[4]);
            BlockWrite(F3,Item.Data.nTime,SizeOf(Item.Data.nTime));
          end
          else if StoreType = 2 then Writeln(F,Item.sFullString + #9 + inttostr(Item.Data.nTime))
          else Writeln(F,Item.sFullString + #9 + FormatDateTime('yyyy-mm-dd hh:mm:ss',TheTime));
        except
        end;
      end;
      Label1.Caption := '상태: 기록중 ['+inttostr(A)+'] (Clearing List)';
      for I := 0 to ItemList[A].Count-1 do ItemList[A].Remove(ItemList[A].Items[0]);
      sCaption := Label1.Caption;
      if StoreType = 3 then CloseFile(F3)
      else CloseFile(F);
    end;
  finally
  end;

  Label1.Caption := '상태: 대기중';
  sCaption := Label1.Caption;
end;

procedure TFrmLogData.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if m_boRemoteClose then exit;
  if Application.MessageBox('종료 하시겠습니까?', '종료', MB_YESNO + MB_ICONQUESTION) = IDYES then begin
    m_boRemoteClose := True;
  end else CanClose := False;
end;

procedure TFrmLogData.FormClose(Sender: TObject; var Action: TCloseAction);
var
  A: Integer;
  ini: TMemIniFile;
begin
  for A := 0 to LDSMAX do LDS[A].Stop;
  ProcessListTimer(Nil);

  ini := TMemIniFile.Create(PosFile);
  ini.WriteInteger('LogDataServer','Left',FrmLogData.Left);
  ini.WriteInteger('LogDataServer','Top',FrmLogData.Top);
  ini.UpdateFile;
  ini.Free;  
end;

procedure TFrmLogData.CheckBox1Click(Sender: TObject);
begin
  if not DontUnCheck then CheckBox1.Checked := False;
  DontUnCheck := False;
end;

procedure TFrmLogData.Button1Click(Sender: TObject);
begin
  FrmLogManage.Show;
end;

procedure TFrmLogData.MyMessage(var MsgData: TWmCopyData);
var
  sData: string;
  //ProgramType: TProgamType;
  wIdent: Word;
begin
  wIdent := HiWord(MsgData.From);
  //  ProgramType:=TProgamType(LoWord(MsgData.From));
  sData := StrPas(MsgData.CopyDataStruct^.lpData);
  case wIdent of //
    GS_QUIT: begin
        m_boRemoteClose := True;
        Close();
      end;
    1: ;
    2: ;
    3: ;
  end; // case
end;

procedure TFrmLogData.CnTrayIcon1DblClick(Sender: TObject);
begin
  show;
end;

initialization
  SVNRevision('$Id: LogDataMain.pas 258 2006-08-16 14:18:46Z Dataforce $');
end.
