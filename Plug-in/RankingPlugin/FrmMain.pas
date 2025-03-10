unit FrmMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, MudUtil, PsAPI, MyCommon, 
  Dialogs, StdCtrls, ComCtrls, Spin, Buttons, Grids, ExtCtrls, IniFiles, Grobal2;

const
  SG_FORMHANDLE=32001;//Server HANLD
  SG_STARTNOW=32002;  //Starting the server...
  SG_STARTOK=32003;   //Start complete...
  GS_QUIT = 32101;


type
  TDBHeader = record
    sDesc       :String[35]; //0x00
    n24         :Integer;    //0x24
    n28         :Integer;    //0x28
    n2C         :Integer;    //0x2C
    n30         :Integer;    //0x30
    n34         :Integer;    //0x34
    n38         :Integer;    //0x38
    n3C         :Integer;    //0x3C
    n40         :Integer;    //0x40
    n44         :Integer;    //0x44
    n48         :Integer;    //0x48
    n4C         :Integer;    //0x4C
    n50         :Integer;    //0x50
    n54         :Integer;    //0x54
    n58         :Integer;    //0x58
    nLastIndex  :Integer;    //0x5C
    dLastDate   :TDateTime;  //0x60
    nHumCount   :Integer;    //0x68
    n6C         :Integer;    //0x6C
    n70         :Integer;    //0x70
    dUpdateDate :TDateTime;  //0x74
  end;
  pTDBHeader = ^TDBHeader;

  TFormMain = class(TForm)
    TabControl: TTabControl;
    GroupBox1: TGroupBox;
    Radio1: TRadioButton;
    EditHour1: TSpinEdit;
    Label59: TLabel;
    EditMinute1: TSpinEdit;
    Label61: TLabel;
    Radio2: TRadioButton;
    EditHour2: TSpinEdit;
    Label60: TLabel;
    EditMinute2: TSpinEdit;
    Label62: TLabel;
    CheckBoxAuto: TCheckBox;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    EditMaxLevel: TSpinEdit;
    EditMinLevel: TSpinEdit;
    Label2: TLabel;
    GroupBox3: TGroupBox;
    EditMaxCount: TSpinEdit;
    Label3: TLabel;
    ListBoxNames: TListBox;
    Label4: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    PBar: TProgressBar;
    LabelHint: TLabel;
    TopGrid: TStringGrid;
    Timer1: TTimer;
    Label5: TLabel;
    Label6: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure TabControlChange(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure EditMinLevelChange(Sender: TObject);
    procedure Radio1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    m_Config: TINIFile;
    m_boRead: Boolean;
    m_M2Handle: THandle;
    m_boTimeRun: Boolean;
    boClose :Boolean;
    m_boRun: Boolean;
    m_dwRunTick: LongWord;
    m_boSend: Boolean;
    m_TopList: array[0..17] of TQuickPointList;
  public
    procedure RefTopGrid();
    procedure BeginTop();
    procedure MyMessage(var MsgData: TWmCopyData); message WM_COPYDATA;
  end;
  function  GetGoldStr (gold: integer): string;
  procedure SendGameCenterMsg(wIdent: Word; sSendMsg: string);
  procedure gethandle;
var
  FormMain: TFormMain;

  g_dwGameCenterHandle: THandle;

implementation

uses
  HUtil32;
{$R *.dfm}



procedure TFormMain.MyMessage(var MsgData: TWmCopyData);
var
  sData: string;
  wIdent: Word;
begin
  wIdent := HiWord(MsgData.From);
  sData := StrPas(MsgData.CopyDataStruct^.lpData);
  case wIdent of //
    GS_QUIT: begin
        Timer1.Enabled := False;
        boClose := True;
        Close();
      end;
    1: ;
    2: ;
    3: ;
  end; // case
end;

procedure gethandle;
var
  nX, nY: Integer;
begin
  g_dwGameCenterHandle := Str_ToInt(ParamStr(1), 0);
  nX := Str_ToInt(ParamStr(2), -1);
  nY := Str_ToInt(ParamStr(3), -1);
  if (nX >= 0) or (nY >= 0) then begin
    FormMain.Left := nX;
    FormMain.Top := nY;
  end;
end;

function  GetGoldStr (gold: integer): string;   //����
var
   i, n: integer;
   str: string;
begin
   str := IntToStr (gold);
   n := 0;
   Result := '';
   for i:=Length(str) downto 1 do begin
      if n = 3 then begin
         Result := str[i] + ',' + Result;
         n := 1;
      end else begin
         Result := str[i] + Result;
         Inc(n);
      end;
   end;
end;

procedure SendGameCenterMsg(wIdent: Word; sSendMsg: string);
var
  SendData: TCopyDataStruct;
  nParam: Integer;
begin
  nParam := MakeLong(Word(tRanking), wIdent);
  SendData.cbData := Length(sSendMsg) + 1;
  GetMem(SendData.lpData, SendData.cbData);
  StrCopy(SendData.lpData, PChar(sSendMsg));
  SendMessage(g_dwGameCenterHandle, WM_COPYDATA, nParam, Cardinal(@SendData));
  FreeMem(SendData.lpData);
end;

procedure TFormMain.BeginTop;
var
  FileStream: TFileStream;
  DBHeader: TDBHeader;
  nIndex: Integer;
  HumDataInfo: THumDataInfo;
  nMaxCount: Integer;
  Data: pTHumData;
  TopInfo: pTTopInfo;
  I: Integer;
  dwCount: LongWord;
begin
  PBar.Position := 0;
  nMaxCount := EditMaxCount.Value;
  LabelHint.Caption := '���ڲ���...';
  for I := Low(m_TopList) to High(m_TopList) do begin
    for nIndex := 0 to m_TopList[I].Count - 1 do begin
      Dispose(pTTopInfo(m_TopList[I].GetPointer(nIndex)));
    end;
    m_TopList[I].Clear;
  end;

  if FileExists('../DBServer/FDB/Mir.DB') then begin
    FileStream := TFileStream.Create('../DBServer/FDB/Mir.DB', fmOpenRead or fmShareDenyNone);
    try
      if FileStream.Read(DBHeader, SizeOf(DBHeader)) = SizeOf(DBHeader) then begin
        for nIndex := 0 to DBHeader.nHumCount - 1 do begin

          if FileStream.Read(HumDataInfo, SizeOf(HumDataInfo)) <> SizeOf(HumDataInfo) then
            break;
          if (not HumDataInfo.Header.boDeleted) and (HumDataInfo.Header.sChrName <> '') then begin
            Data := @HumDataInfo.Data;
            if (ListBoxNames.Items.IndexOf(Data.sChrName) = -1) and (ListBoxNames.Items.IndexOf(Data.sMasterName) = -1) and (Data.Abil.Level >= EditMinLevel.Value)
               and (Data.Abil.Level <= EditMaxLevel.Value)  then begin
              for I := Low(m_TopList) to High(m_TopList) do begin

                New(TopInfo);
                TopInfo.sChrName := HumDataInfo.Data.sChrName;
                TopInfo.sMasName := '';
                TopInfo.btJob := HumDataInfo.Data.btJob;
                TopInfo.bySex := HumDataInfo.Data.btSex;
                case I of
                  0: begin    //��ü
                      if (not Data.boIsHero) then begin
                        TopInfo.dwCount := Data.Abil.Level;
                        m_TopList[I].AddPointer((Data.Abil.Level * 60000) + (Data.Abil.Exp div 100000), TopInfo, True);
                      end;
                    end;
                  1: begin    //����
                      if (not Data.boIsHero) and (Data.btJob in [0,5]) then begin
                        TopInfo.dwCount := Data.Abil.Level;
                        m_TopList[I].AddPointer((Data.Abil.Level * 60000) + (Data.Abil.Exp div 100000), TopInfo, True);
                      end
                      else
                        Dispose(TopInfo);
                    end;
                  2: begin    //����
                      if (not Data.boIsHero) and (Data.btJob in [1,6]) then begin
                        TopInfo.dwCount := Data.Abil.Level;
                        m_TopList[I].AddPointer((Data.Abil.Level * 60000) + (Data.Abil.Exp div 100000), TopInfo, True);
                      end
                      else
                        Dispose(TopInfo);
                    end;
                  3: begin   //����
                      if (not Data.boIsHero) and (Data.btJob in [2,7]) then begin
                        TopInfo.dwCount := Data.Abil.Level;
                        m_TopList[I].AddPointer((Data.Abil.Level * 60000) + (Data.Abil.Exp div 100000), TopInfo, True);
                      end
                      else
                        Dispose(TopInfo);
                    end;
                  4: begin    //�ڰ�
                      if (not Data.boIsHero) and (Data.btJob in [3,8]) then begin
                        TopInfo.dwCount := Data.Abil.Level;
                        m_TopList[I].AddPointer((Data.Abil.Level * 60000) + (Data.Abil.Exp div 100000), TopInfo, True);
                      end
                      else
                        Dispose(TopInfo);
                    end;
                  5: begin    //�·�
                      if (not Data.boIsHero) and (Data.btJob in [4,9]) then begin
                        TopInfo.dwCount := Data.Abil.Level;
                        m_TopList[I].AddPointer((Data.Abil.Level * 60000) + (Data.Abil.Exp div 100000), TopInfo, True);
                      end
                      else
                        Dispose(TopInfo);
                    end;
                  6: begin  //�ı�
                      TopInfo.dwCount := HiWord(Data.Abil.DC);
                      if (not Data.boIsHero) and (Data.btJob in [0,3,4,5,8,9]) and (TopInfo.dwCount > 0) then begin
                        m_TopList[I].AddPointer((HiWord(Data.Abil.DC) * 100000) + Data.Abil.Level, TopInfo, True);
                      end
                      else
                        Dispose(TopInfo);
                    end;
                  7: begin   //����
                      TopInfo.dwCount := HiWord(Data.Abil.MC);
                      if (not Data.boIsHero) and (Data.btJob in [1,6]) and (TopInfo.dwCount > 0) then begin
                        m_TopList[I].AddPointer((HiWord(Data.Abil.MC) * 100000) + Data.Abil.Level, TopInfo, True);
                      end
                      else
                        Dispose(TopInfo);
                    end;
                  8: begin   //����
                      TopInfo.dwCount := HiWord(Data.Abil.SC);
                      if (not Data.boIsHero) and (Data.btJob in [2,7,4,9]) and (TopInfo.dwCount > 0) then begin
                        m_TopList[I].AddPointer((HiWord(Data.Abil.SC) * 100000) + Data.Abil.Level, TopInfo, True);
                      end
                      else
                        Dispose(TopInfo);
                    end;
                  9: begin    //����
                      TopInfo.dwCount := LongWord(Data.nGold);
                      TopInfo.dwCount := TopInfo.dwCount div 10000 * 10000;
                      if (not Data.boIsHero) and (TopInfo.dwCount > 0) then begin
                        dwCount := TopInfo.dwCount div 10000 * 1000 + Data.Abil.Level;
                        m_TopList[I].AddPointer(dwCount, TopInfo, True);
                      end
                      else
                        Dispose(TopInfo);
                    end;
                  10: begin  //����ġ
                      TopInfo.dwCount := LongWord(Data.Abil.Exp);
                      if (not Data.boIsHero) and (TopInfo.dwCount > 0) then begin
                        m_TopList[I].AddPointer((Data.Abil.Level * 60000) + (Data.Abil.Exp div 100000), TopInfo, True);
                      end
                      else
                        Dispose(TopInfo);
                    end;
                  11: begin    //ų
                      TopInfo.dwCount := Data.Abil.KillPoint;
                      if TopInfo.dwCount > 0 then begin
                        dwCount := TopInfo.dwCount * 10000 + Data.Abil.Level;
                        m_TopList[I].AddPointer(dwCount, TopInfo, True);
                      end
                      else
                        Dispose(TopInfo);
                    end;
                  12: begin    //����
                      TopInfo.dwCount := Data.Abil.DeathPoint;
                      if TopInfo.dwCount > 0 then begin
                        dwCount := TopInfo.dwCount * 10000 + Data.Abil.Level;
                        m_TopList[I].AddPointer(dwCount, TopInfo, True);
                      end
                      else
                        Dispose(TopInfo);
                    end;
                  13: begin    //���� ����
                      if Data.boIsHero and (HumDataInfo.Data.sMasterName <> '') then begin
                        TopInfo.sMasName := HumDataInfo.Data.sMasterName;
                        TopInfo.dwCount := Data.Abil.Level;
                        m_TopList[I].AddPointer((Data.Abil.Level * 60000) + (Data.Abil.Exp div 100000), TopInfo, True);
                      end;
                  end;
                  14: begin    //��ȯ
                      TopInfo.dwCount := LongWord(Data.nGameGold);
                      if (not Data.boIsHero) and (TopInfo.dwCount > 0) then begin
                        dwCount := TopInfo.dwCount * 10000 + Data.Abil.Level;
                        m_TopList[I].AddPointer(dwCount, TopInfo, True);
                      end
                      else
                        Dispose(TopInfo);
                    end;
                  15: begin    //PC����Ʈ
                      TopInfo.dwCount := Data.nPCPoint;
                      if (not Data.boIsHero) and (TopInfo.dwCount > 0) then begin
                        dwCount := TopInfo.dwCount * 10000 + Data.Abil.Level;
                        m_TopList[I].AddPointer(dwCount, TopInfo, True);
                      end
                      else
                        Dispose(TopInfo);
                    end;
                  16: begin  //���
                      TopInfo.dwCount := HiWord(Data.Abil.AC);
                      if (not Data.boIsHero) and (TopInfo.dwCount > 0) then begin
                        m_TopList[I].AddPointer((HiWord(Data.Abil.AC) * 100000) + Data.Abil.Level, TopInfo, True);
                      end
                      else
                        Dispose(TopInfo);
                    end;
                  17: begin   //����
                      TopInfo.dwCount := HiWord(Data.Abil.MAC);
                      if (not Data.boIsHero) and (TopInfo.dwCount > 0) then begin
                        m_TopList[I].AddPointer((HiWord(Data.Abil.MAC) * 100000) + Data.Abil.Level, TopInfo, True);
                      end
                      else
                        Dispose(TopInfo);
                    end;

                end;
                if m_TopList[I].Count > nMaxCount then begin
                  Dispose(pTTopInfo(m_TopList[I].GetPointer(m_TopList[I].Count - 1)));
                  m_TopList[I].DeleteEx(m_TopList[I].Count - 1);
                end;
              end;
            end;
          end;

          PBar.Position := Round(nIndex / DBHeader.nHumCount * 100);
        end;
      end;
    finally
      FileStream.Free;
    end;
  end;
  m_boSend := False;
  LabelHint.Caption := FormatDateTime('������Ϣ : yyyy��mm��dd�� hhʱmm��ss��', Now);
  RefTopGrid;
end;

procedure TFormMain.Button1Click(Sender: TObject);
var
  sName: string[14];
begin
  sName := InputBox('ɸѡ', '������...', '');
  if sName <> '' then begin
    if ListBoxNames.Items.IndexOf(sName) = -1 then begin
      ListBoxNames.Items.Add(sName);
    end;
  end;
  m_Config.WriteString('Names', sName, '');
end;

procedure TFormMain.Button2Click(Sender: TObject);
var
  I: integer;
begin
  if (ListBoxNames.ItemIndex >= 0) and (ListBoxNames.ItemIndex < ListBoxNames.Items.Count) then
    ListBoxNames.Items.Delete(ListBoxNames.ItemIndex);
  m_Config.EraseSection('Names');
  for I := 0 to ListBoxNames.Items.Count - 1 do begin
    m_Config.WriteString('Names', ListBoxNames.Items[I], '');
    if ListBoxNames.Items[I] = '' then Break;
  end;
end;

procedure TFormMain.Button3Click(Sender: TObject);
begin
  Button3.Enabled := False;
  try
    BeginTop;
  finally
    Button3.Enabled := True;
  end;
end;

procedure TFormMain.EditMinLevelChange(Sender: TObject);
begin
  if not m_boRead then begin
    m_Config.WriteInteger('Setup', 'MinLevel', EditMinLevel.Value);
    m_Config.WriteInteger('Setup', 'MaxLevel', EditMaxLevel.Value);
    m_Config.WriteInteger('Setup', 'Hour1', EditHour1.Value);
    m_Config.WriteInteger('Setup', 'Minute1', EditMinute1.Value);
    m_Config.WriteInteger('Setup', 'Hour2', EditHour2.Value);
    m_Config.WriteInteger('Setup', 'Minute2', EditMinute2.Value);
    m_Config.WriteInteger('Setup', 'MaxCount', EditMaxCount.Value);
  end;
  //m_Config.ReadSectionValues('Names', ListBoxNames.Items);
end;

procedure TFormMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if boClose then exit;
  if Application.MessageBox('��ȷ��Ҫ�˳����а�����', '����', MB_OKCANCEL + MB_ICONQUESTION) = IDOK then begin
    Timer1.Enabled := False;
    CanClose := True;
  end else begin
    CanClose := False;
  end; 
end;

procedure TFormMain.FormCreate(Sender: TObject);
var
  I: Integer;
begin
  Randomize;
  gethandle;

  SendGameCenterMsg(SG_FORMHANDLE, IntToStr(Self.Handle));
  SendGameCenterMsg(SG_STARTNOW, '��ʼ����');

  m_boRead := True;
  m_boTimeRun := False;
  boClose:= False;
  m_boRun := False;
  m_dwRunTick := GetTickCount;
  m_M2Handle := 0;
  m_boSend := True;
  m_Config := TINIFile.Create('.\TopSetup.ini');
  EditMinLevel.Value := m_Config.ReadInteger('Setup', 'MinLevel', 1);
  EditMaxLevel.Value := m_Config.ReadInteger('Setup', 'MaxLevel', 150);
  CheckBoxAuto.Checked := m_Config.ReadBool('Setup', 'AutoRun', False);
  EditHour1.Value := m_Config.ReadInteger('Setup', 'Hour1', 6);
  EditMinute1.Value := m_Config.ReadInteger('Setup', 'Minute1', 0);
  EditHour2.Value := m_Config.ReadInteger('Setup', 'Hour2', 1);
  EditMinute2.Value := m_Config.ReadInteger('Setup', 'Minute2', 0);
  EditMaxCount.Value := m_Config.ReadInteger('Setup', 'MaxCount', 1000);
  if m_Config.ReadBool('Setup', 'RunMode', True) then
    Radio1.Checked := True
  else
    Radio2.Checked := True;
  m_Config.ReadSectionValues('Names', ListBoxNames.Items);
  for I := 0 to ListBoxNames.Items.Count - 1 do
    ListBoxNames.Items[I] := Copy(ListBoxNames.Items[I], 1, Length(ListBoxNames.Items[I]) - 1);
  m_boRead := False;
  m_dwRunTick := GetTickCount + LongWord((EditHour2.Value * 60 + EditMinute2.Value) * 60 * 1000);
  for I := Low(m_TopList) to High(m_TopList) do
    m_TopList[I] := TQuickPointList.Create;
  Radio1Click(Radio1);
  RefTopGrid;
  SendGameCenterMsg(SG_STARTOK, '����ˢ�³ɹ�');
end;

procedure TFormMain.FormDestroy(Sender: TObject);
var
  I: Integer;
begin
  m_Config.Free;
  for I := Low(m_TopList) to High(m_TopList) do
    m_TopList[I].Free;
end;

procedure TFormMain.Radio1Click(Sender: TObject);
begin
  if not m_boRead then begin
    m_Config.WriteBool('Setup', 'RunMode', Radio1.Checked);
    m_Config.WriteBool('Setup', 'AutoRun', CheckBoxAuto.Checked);
    Radio1.Enabled := CheckBoxAuto.Checked;
    Radio2.Enabled := CheckBoxAuto.Checked;
    EditHour1.Enabled := Radio1.Checked and CheckBoxAuto.Checked;
    EditHour2.Enabled := Radio2.Checked and CheckBoxAuto.Checked;
    EditMinute1.Enabled := Radio1.Checked and CheckBoxAuto.Checked;
    EditMinute2.Enabled := Radio2.Checked and CheckBoxAuto.Checked;
  end;
end;

procedure TFormMain.RefTopGrid;
const
  SexName: array[0..1] of string[2] = ('��', 'Ů');
var
  List: TQuickPointList;
  I: Integer;
  TopInfo: pTTopInfo;
begin
  TopGrid.Cells[0, 0] := '����';
  if TabControl.TabIndex = 13 then begin
    TopGrid.Cells[1, 0] := 'Ӣ��';
  end else
  TopGrid.Cells[1, 0] := '��ɫ��';
  TopGrid.Cells[2, 0] := 'ְҵ';
  TopGrid.Cells[3, 0] := '�Ա�';
  case TabControl.TabIndex of
    0..5: TopGrid.Cells[4, 0] := '�ȼ�';
    6: TopGrid.Cells[4, 0] := '����';
    7: TopGrid.Cells[4, 0] := 'ħ��';
    8: TopGrid.Cells[4, 0] := '����';
    9: TopGrid.Cells[4, 0] := '���';
    10: TopGrid.Cells[4, 0] := '����ֵ';
    11: TopGrid.Cells[4, 0] := 'ɱ��(Kill)';
    12: TopGrid.Cells[4, 0] := '����(Death)';
    13: TopGrid.Cells[4, 0] := 'Ӣ�۵ȼ�';
    14: TopGrid.Cells[4, 0] := '��ȯ';
    15: TopGrid.Cells[4, 0] := 'PC��';
    16: TopGrid.Cells[4, 0] := '����';
    17: TopGrid.Cells[4, 0] := 'ħ������';
  end;
  if TabControl.TabIndex = 13 then begin
    TopGrid.Cells[5, 0] := '����';
  end else
    TopGrid.Cells[5, 0] := '����';

  List := m_TopList[TabControl.TabIndex];
  if List.Count > 0 then begin
    TopGrid.RowCount := List.Count + 1;
    for I := 0 to List.Count - 1 do begin
      TopInfo := List.GetPointer(I);
      TopGrid.Cells[0, I + 1] := IntToStr(I + 1);
      TopGrid.Cells[1, I + 1] := TopInfo.sChrName;
      TopGrid.Cells[2, I + 1] := IntToJob(TopInfo.btJob);
      TopGrid.Cells[3, I + 1] := SexName[TopInfo.bySex];
      if TabControl.TabIndex in [8,9,10,11,12,13] then
        TopGrid.Cells[4, I + 1] := GetGoldStr(TopInfo.dwCount)
      else
      TopGrid.Cells[4, I + 1] := IntToStr(TopInfo.dwCount);
      if TabControl.TabIndex = 13 then begin
        TopGrid.Cells[5, I + 1] := TopInfo.sMasName;
      end else
        TopGrid.Cells[5, I + 1] := '';
    end;
  end
  else begin
    TopGrid.RowCount := 2;
    TopGrid.Cells[0, 1] := '';
    TopGrid.Cells[1, 1] := '';
    TopGrid.Cells[2, 1] := '';
    TopGrid.Cells[3, 1] := '';
    TopGrid.Cells[4, 1] := '';
    TopGrid.Cells[5, 1] := '';
  end;
end;

procedure TFormMain.TabControlChange(Sender: TObject);
begin
  RefTopGrid;
end;

procedure TFormMain.Timer1Timer(Sender: TObject);
var
  Year, Month, Day, Hour, Min, Sec, MSec: Word;
  boRun: Boolean;
  SendData: TCopyDataStruct;
  TopInfo, TopInfo2: pTTopInfo;
  I, k: Integer;
  TopHeader: TTopHeader;
begin
  if m_boTimeRun then
    Exit;
  m_boTimeRun := True;
  try
    if FileExists('../DBServer/FDB/Mir.DB') then begin
      Label6.Caption := 'DBServer: ����(O)';
      Label6.Font.Color := clBLue;
    end
    else begin
      Label6.Caption := 'DBServer: ����(X)';
      Label6.Font.Color := clRed;
    end;
    if m_M2Handle > 0 then begin
      Label5.Caption := 'M2Server: ����(O)';
      Label5.Font.Color := clBLue;
      SendData.cbData := 0;
      SendData.lpData := nil;
      if SendMessage(m_M2Handle, WM_COPYDATA, MakeLong(0, 1000), Cardinal(@SendData)) = 0 then begin
        m_M2Handle := 0;
        Label5.Caption := 'M2Server: ����(X)';
        Label5.Font.Color := clRed;
      end;
    end
    else begin
      Label5.Caption := 'M2Server: ����(X)';
      Label5.Font.Color := clRed;
      m_M2Handle := GetHandleByFileName(GetCurrentDir + '\M2Server.exe' );
    end;
    if (m_M2Handle > 0) and (not m_boSend) then begin
      m_boSend := True;
      for I := Low(m_TopList) to High(m_TopList) do begin
        if m_TopList[I].Count > 0 then begin
          TopHeader.btType := I;
          TopHeader.wCount := m_TopList[I].Count;
          SendData.cbData := m_TopList[I].Count * SizeOf(TTopInfo) + SizeOf(TopHeader);
          GetMem(SendData.lpData, SendData.cbData);
          Move(TopHeader, SendData.lpData^, SizeOf(TopHeader));
          TopInfo2 := pTTopInfo(@PChar(SendData.lpData)[SizeOf(TopHeader)]);
          for K := 0 to m_TopList[I].Count - 1 do begin
            TopInfo := m_TopList[I].GetPointer(K);
            TopInfo2^ := TopInfo^;
            Inc(TopInfo2);
          end;
          SendMessage(m_M2Handle, WM_COPYDATA, MakeLong(0, 1001), Cardinal(@SendData));
          FreeMem(SendData.lpData);
        end;

      end;    
    end;

    boRun := False;
    if CheckBoxAuto.Checked then begin
      DecodeDate(Date, Year, Month, Day);
      DecodeTime(Time, Hour, Min, Sec, MSec);
      if Radio1.Checked then begin
        if (Hour = EditHour1.Value) and (Min = EditMinute1.Value) then begin
          if not m_boRun then begin
            m_boRun := True;
            boRun := True;
          end;
        end
        else begin
          m_boRun := False;
        end;
      end
      else begin
        if GetTickCount > m_dwRunTick then begin
          m_dwRunTick := GetTickCount + LongWord((EditHour2.Value * 60 + EditMinute2.Value) * 60 * 1000);
          boRun := True;
        end;
      end;
      if boRun then begin
        BeginTop;
      end;
    end;
  finally
    m_boTimeRun := False;
  end;
end;

end.

