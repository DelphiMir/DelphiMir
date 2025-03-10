unit BasicForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, IdFTP, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, StrUtils, IniFiles, ComCtrls, IdFTPList, ExtCtrls,
  Buttons, IdFTPCommon, IdAntiFreezeBase, IdAntiFreeze, IdIntercept,
  IdLogBase, IdLogEvent, jpeg, shellapi, Animate, GIFCtrl, HTTPApp,
  HTTPProd, CompProd, PagItems, MidProd, XMLBrokr, OleCtrls, SHDocVw,
  XiProgressBar, XiButton;

type
  TBasicFrm = class(TForm)
    WorkLB: TLabel;
    TotalSize: TLabel;
    XiProgressBar1: TXiProgressBar;
    XiProgressBar2: TXiProgressBar;
    FTP: TIdFTP;
    IdAntiFreeze1: TIdAntiFreeze;
    ExitClick: TXiButton;
    StartGame: TXiButton;
    NowWork: TLabel;
    StopPatch: TXiButton;
    procedure FTPWork(Sender: TObject; AWorkMode: TWorkMode;
      const AWorkCount: Integer);
    procedure FormShow(Sender: TObject);
    procedure FTPConnected(Sender: TObject);
    procedure FTPWorkEnd(Sender: TObject; AWorkMode: TWorkMode);
    procedure StartUpClick(Sender: TObject);
    procedure StartGameClick(Sender: TObject);
    procedure ExitClickClick(Sender: TObject);
    procedure StopPatchClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    function ConnectServer: Boolean;
    function SetServerInfo: Boolean;

    procedure ReadFTP(path : String);
    procedure ScanFile;
    procedure DownFile;
    procedure ChangeDir(path : String);
    function Get_FileSize(asFName: string): integer;
  public
    { Public declarations }
  end;

var
  BasicFrm: TBasicFrm;

  DEFAULT_PATH : String;
  bWork : Boolean;
  sPath : String;
  sHost : String;
  sPort : String;
  sName : String;
  sPass : String;
  sExe  : String;
  sURL  : String;
  sStat : String;
  sTime : TDateTime;

  NameList    : TStringList;
  DateList    : TStringList;
  SizeList    : TStringList;
  DownFileN   : TStringList;
  DownFileS   : TStringList;
  DownFileU   : TStringList;
  DownTSize   : Integer;
  FileSize    : String;
  TotalDSize  : Integer;
  TotalFSize  : Integer;

  DownSpeed   : Double = 0;

  currDownCount, DownCount : integer;   //개수

implementation

{$R *.dfm}

function TBasicFrm.ConnectServer: Boolean;
begin
  FTP.Host      := sHost;
  FTP.Port      := StrToInt(sPort);
  FTP.Username  := sName;
  FTP.Password  := sPass;
  try
    FTP.Connect(True);
    Result := True;
  except
    Result := False;
  end;
end;

function TBasicFrm.SetServerInfo: Boolean;
begin
  //WebBrowser1.Navigate('http://jaggoowa.com/');      //↑웹화면 출력 홈페이지
  sHost := '127.0.0.1';           //서버 아이피
  sPort := '21';                        //ftp 포트
  sName := 'look';                           //ftp 설정 아이디
  sPass := '1';                                                    //비번
  sPath := '';
  sExe  := 'mir2.DAT';
  sURL  := 'http://www.emir2.co.kr/'; //홈페이지


  if Trim(sPath) = '' then sPath := '/';
  if LeftStr(sPath, 1) <> '/' then sPath := '/' + sPath;
  if RightStr(sPath, 1) <> '/' then sPath := sPath + '/';

  if Trim(sHost) = '' then Result := False
  else Result := True;
end;

procedure TBasicFrm.StartUpClick(Sender: TObject);
begin
  if not bWork then begin
    DEFAULT_PATH := ExtractFilePath(Application.ExeName);
    bWork := True;
    NameList  := TStringList.Create;
    DateList  := TStringList.Create;
    SizeList  := TStringList.Create;
    DownFileN := TStringList.Create;
    DownFileS := TStringList.Create;
    DownFileU := TStringList.Create;
    DownTSize  := 0;
    FileSize := '0';

    try
      STime := Now;

      WorkLB.Caption := '접속중';
      if not ConnectServer then begin
        ShowMessage('UPDATE 서버에 연결할수 없습니다.' + #13#13 +
                    '인터넷이 연결이 되어 있지 않거나' + #13#13 +
                 '서버에 접속할수 없는 계정입니다.' + #13);
        Close;
      end;

      WorkLB.Caption := '수집중';
      ReadFTP(sPath);

      WorkLB.Caption := '작성중';
      ScanFile;

      WorkLB.Caption := '패치중';
      DownFile;

      WorkLB.Caption := '패치완료';
      NowWork.Caption := '';
      TotalSize.Caption := '';


    finally
      NameList.Free;
      DateList.Free;
      SizeList.Free;
      DownFileN.Free;
      DownFileS.Free;
      DownFileU.Free;

    end;
  end;
        if FileExists(sExe) then   
    WinExec(PChar(sExe), SW_SHOW)
  else
    Application.MessageBox('실행 프로그램을 찾을수없습니다.','미르의전설 업데이트');
  close;
end;

function TBasicFrm.Get_FileSize(asFName: string): integer;
var
        hFile: THandle;
begin
        result := -1;

        if not FileExists (asFName) then
                exit;

                hFile := FileOpen (asFName, fmOpenRead);
        try
                result := GetFileSize (hFile, nil);
        finally
                FileClose (hFile);
        end;

        if result = 0 then
                result := -1;
end;



procedure TBasicFrm.ReadFTP(path: String);
var
  iNum : integer;
  sTem : String;
begin
  ChangeDir(path);
  iNum := FTP.DirectoryListing.Count;
  while iNum <> 0 do begin
    iNum := iNum - 1;
    if FTP.DirectoryListing.Items[iNum].ItemType = ditFile then begin
      NowWork.Caption := FTP.DirectoryListing.Items[iNum].FileName;
      NameList.Add(path + FTP.DirectoryListing.Items[iNum].FileName);
      SizeList.Add(IntToStr(FTP.DirectoryListing.Items[iNum].Size));
      DateList.Add(FormatDateTime('YYYYMMDDhhmm', FTP.DirectoryListing.Items[iNum].ModifiedDate));
    end else
    if FTP.DirectoryListing.Items[iNum].ItemType = ditDirectory then begin
      sTem := path + FTP.DirectoryListing.Items[iNum].FileName;
      sTem := Copy(sTem, Length(sPath) + 1, Length(sTem) - Length(sPath) + 1);
      sTem := StringReplace(sTem, '/','\', [rfreplaceAll]);
      if not DirectoryExists(DEFAULT_PATH + sTem) then MkDir(DEFAULT_PATH + sTem);
      ReadFTP(path + FTP.DirectoryListing.Items[iNum].FileName + '/');
      ChangeDir(path);
    end;
  end;
end;

procedure TBasicFrm.ChangeDir(path: String);
var
  LS: TStringList;
begin
  LS := TStringList.Create;
  FTP.ChangeDir(path);
  FTP.List(LS);
  LS.Free;
end;

procedure TBasicFrm.ScanFile;
var
  sFile : String;
  i,DownCount1,DownCount2     : Integer;
  sTime : String;
begin

  DownCount := 0;      //개수

  for i := 0 to NameList.Count - 1 do begin
    sFile := NameList.Strings[i];
    sFile := StringReplace(sFile, '/', '\', [rfreplaceAll]);
    sFile := Copy(sFile, Length(sPath) + 1, Length(sFile) - Length(sPath) + 1);

    NowWork.Caption := sFile;
    if FileExists(DEFAULT_PATH + sFile) then begin
      sTime := FormatDateTime('YYYYMMDDhhmm',FileDateToDateTime(FileAge(DEFAULT_PATH + sFile)));
      if StrToInt64(sTime) < StrToInt64(DateList.Strings[i]) then begin
        DownFileU.Add(NameList.Strings[i]);
        DownFileN.Add(DEFAULT_PATH + sFile);
        DownFileS.Add(SizeList.Strings[i]);
        DownTSize := DownTSize + StrToInt(SizeList.Strings[i]);
        DownCount := DownCount + 1;    //개수
      end;

      if (inttostr(Get_FileSize(DEFAULT_PATH + sFile)) <> SizeList.Strings[i]) then begin
        DownFileU.Add(NameList.Strings[i]);
        DownFileN.Add(DEFAULT_PATH + sFile);
        DownFileS.Add(SizeList.Strings[i]);
        DownTSize := DownTSize + StrToInt(SizeList.Strings[i]);
        DownCount := DownCount + 1;    //개수
      end;



    end else begin
      DownFileU.Add(NameList.Strings[i]);
      DownFileN.Add(DEFAULT_PATH + sFile);
      DownFileS.Add(SizeList.Strings[i]);
      DownTSize := DownTSize + StrToInt(SizeList.Strings[i]);
      DownCount := DownCount + 1;  //개수
    end;
  end;
end;

procedure TBasicFrm.DownFile;
var
  i : Integer;
  sFile :string;
begin
  if DownFileU.Count = 0 then Exit;
  TotalDSize := 0;
  currDownCount := 0;     //개수
  XiProgressBar1.Position := 0;
  XiProgressBar1.Max := DownTSize div 1000000;

  TotalSize.Caption := IntToStr(TotalDSize) + ' / ' + IntToStr(DownTSize);
  for i := 0 to DownFileU.Count - 1 do begin
    FileSize := DownFileS.Strings[i];

    currDownCount := currDownCount + 1;   //개수

    sFile := DownFileU.Strings[i];
    sFile := StringReplace(sFile, '/', '\', [rfreplaceAll]);
    sFile := Copy(sFile, Length(sPath) + 1, Length(sFile) - Length(sPath) + 1);

    NowWork.Caption := '[ ' + IntToStr(currDownCount) + '/ ' + IntToStr(DownCount) + '] "'+  sFile  + '" 파일을 받는 중...';
    XiProgressBar2.Position := 0;
    XiProgressBar2.Max := StrToInt(FileSize) div 1000000;

    FTP.Get(DownFileU.Strings[i], DownFileN.Strings[i],True);
    TotalDSize := TotalDSize + StrToInt(FileSize);
  end;
end;

procedure TBasicFrm.FTPWork(Sender: TObject; AWorkMode: TWorkMode;
  const AWorkCount: Integer);
begin
  TotalFSize := AWorkCount;
  XiProgressBar1.Position := ((TotalFSize + TotalDSize)div 1000000);
  XiProgressBar2.Position := (TotalFSize div 1000000);

  TotalSize.Caption := FormatFloat('0.0MB',(TotalFSize + TotalDSize) / 1000000) + ' / ' + FormatFloat('0.0MB',(DownTSize) / 1000000) ; //IntToStr(TotalFSize + TotalDSize) + ' / ' + IntToStr(DownTSize);
end;

procedure TBasicFrm.FormShow(Sender: TObject);
begin
  bWork := False;
  if not SetServerInfo then begin

  end;
end;

procedure TBasicFrm.FTPConnected(Sender: TObject);
begin
  WorkLB.Caption := '접속완료';
end;

procedure TBasicFrm.FTPWorkEnd(Sender: TObject; AWorkMode: TWorkMode);
begin
  XiProgressBar2.Position :=  XiProgressBar2.Max;
end;


procedure TBasicFrm.StartGameClick(Sender: TObject);
begin
  if not bWork then begin
    DEFAULT_PATH := ExtractFilePath(Application.ExeName);
    bWork := True;
    NameList  := TStringList.Create;
    DateList  := TStringList.Create;
    SizeList  := TStringList.Create;
    DownFileN := TStringList.Create;
    DownFileS := TStringList.Create;
    DownFileU := TStringList.Create;
    DownTSize  := 0;
    FileSize := '0';

    try
      STime := Now;

      WorkLB.Caption := '접속중';
      if not ConnectServer then begin
        Application.MessageBox('UPDATE 서버에 연결할수 없습니다.' + #13#13 +
                    '인터넷이 연결이 되어 있지 않거나' + #13#13 +
                 '서버에 접속할수 없는 계정입니다.' + #13,'미르의전설 업데이트');
       // Close;
      end;

      WorkLB.Caption := '수집중';
      ReadFTP(sPath);

      WorkLB.Caption := '작성중';
      ScanFile;

      StartGame.Enabled := False;
      StartGame.visible := False;

      StopPatch.Enabled := True;
      StopPatch.visible := True;

      WorkLB.Caption := '패치중';
      DownFile;

      WorkLB.Caption := '패치완료';
      NowWork.Caption := '';
      TotalSize.Caption := '';


    finally
      NameList.Free;
      DateList.Free;
      SizeList.Free;
      DownFileN.Free;
      DownFileS.Free;
      DownFileU.Free;
    end;
  end;

  if FileExists(sExe) then
    WinExec(PChar(sExe), SW_SHOW)
  else
    Application.MessageBox('실행 프로그램을 찾을수없습니다.','미르의전설 업데이트');
  close;  
end;


procedure TBasicFrm.ExitClickClick(Sender: TObject);
begin
 if FTP.Connected then FTP.Abort;
  close;
end;

procedure TBasicFrm.StopPatchClick(Sender: TObject);
begin
  FTP.Abort;
  FTP.Disconnect;

  StopPatch.visible := False;
  StopPatch.Enabled := False;
  StartGame.visible := True;
  StartGame.Enabled := True;

  //방화벽
  FTP.passive := True;

  NowWork.Transparent := False;
  WorkLB.Transparent := False;

  NameList.clear;
  DateList.clear;
  SizeList.clear;
  DownFileN.clear;
  DownFileS.clear;
  DownFileU.clear;

  bWork := False;
  if not SetServerInfo then begin

  end;
end;

procedure TBasicFrm.FormCreate(Sender: TObject);
begin
   StopPatch.Enabled := False;
   StopPatch.visible := False;

   DownCount := 0;       //개수
end;

end.
