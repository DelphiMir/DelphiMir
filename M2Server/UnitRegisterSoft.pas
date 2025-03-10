unit UnitRegisterSoft;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ShellAPI, Buttons, Grobal2, ComCtrls;

type
  TfrmRegister = class(TForm)
    Panel1: TPanel;
    EditRegHWInfo: TEdit;
    Label4: TLabel;
    EditRegUserIPAddr: TEdit;
    lCode: TLabel;
    lName: TLabel;
    Label5: TLabel;
    EditChiShu: TEdit;
    Label6: TLabel;
    EditTianShu: TEdit;
    Label7: TLabel;
    EditProductName: TLabel;
    EditUpDateTime: TLabel;
    EditVersion: TLabel;
    EditWebSite: TLabel;
    EditBbsSite: TLabel;
    EditCopyright: TLabel;
    Editkeyxxi: TLabel;
    EditRegCodeKey: TEdit;
    DateTimePicker1: TDateTimePicker;
//    procedure CloseButtonClick(Sender: TObject);
//    procedure RegSoftButtonClick(Sender: TObject);
//    procedure btnRegPasteClick(Sender: TObject);
//    procedure DeleteSelf;
//    procedure RegServerButtonClick(Sender: TObject);
  private
    { Private declarations }
    procedure RefRegInfo();
  public
    { Public declarations }
    procedure Open();
  end;
var
  frmRegister               : TfrmRegister;

implementation

uses M2Share, SDK, EDcode, WinlicenseSDK;

{$R *.dfm}

procedure TfrmRegister.Open();
begin
  RefRegInfo();
  ShowModal;
end;

procedure TfrmRegister.RefRegInfo();
var
  nStatus                   : Integer;
  MachineId                 : array[0..100] of char;
  RegName                   : array[0..255] of char;
  CompanyName               : array[0..255] of char;
  CustomData                : array[0..255] of char;
//  TrialDate                 : TSystemTime;
  jiami                     : string;
  TrialDate                 : SYSTEMTIME;
begin
  EditProductName.caption:=DecodeString(DecodeString(g_sProductName));  //游戏伴随我MDB版传奇引擎
  EditVersion.caption:=DecodeString(DecodeString(g_sVersion)); //程序版本: V5.18 Build 20070607(免费版)
  EditUpDateTime.caption:=DecodeString(DecodeString(g_sUpDateTime)); //编译时间: 2007/06/07
  EditWebSite.caption:=DecodeString(DecodeString(g_sWebSite)); //程序网站: http://www.uc845.com
  //EditBbsSite.caption:=DecodeString(DecodeString(g_sbbsSite)); //程序论坛: http://bbs.uc845.com
  EditCopyright.caption:=DecodeString(DecodeString(g_sProgram)); //Copyright (C) 2005-2007 DraGon Corporation
  //Editkeyxxi.caption:=DecodeString(DecodeString(g_sIcqSite)); //注册授权: 请将[硬件信息/注册标识]发送给作者
  //UCEncode(GetLocalIP,jiami);

  //nStatus := 0;
  try
    {$I ..\..\Tools\WinLicenseV2.0.8.0\WinlicenseSDK\Include\Delphi\Macros\EnCode_Start.inc}
    WLHardwareGetID(MachineId);
    EditRegHWInfo.Text := MachineId;
    EditTianShu.Text := IntToStr(WLTrialDaysLeft);
    EditChiShu.Text := IntToStr(WLTrialExecutionsLeft);
    EditRegCodeKey.Text := '';
    nStatus := WLRegGetStatus(nStatus);
    case nStatus of
      0: Caption := WLStringDecrypt('软件注册 [使用方法]');
      1: Caption := WLStringDecrypt('软件注册 [注册]');
      2: Caption := WLStringDecrypt('软件注册 [文件注册]');
      3: Caption := WLStringDecrypt('软件注册 [文件注册]');
      4: Caption := WLStringDecrypt('软件注册 [硬件注册]');
      5: Caption := WLStringDecrypt('软件注册 [文件适用期限)');
    end;
    if nStatus = 1 then begin
      WLRegGetLicenseInfo(RegName, CompanyName, CustomData);
      EditRegCodeKey.Text := RegName;
      EditRegUserIPAddr.Text := CompanyName;{RegName;}
      EditRegCodeKey.Color:= clBtnFace;
      EditRegCodeKey.ReadOnly:= True;
      EditRegCodeKey.ParentCtl3D:= False;
      EditRegCodeKey.ParentFont:= False;
      EditTianShu.Text := '没有设定';
      EditChiShu.Text := '没有设定';
      FillChar(TrialDate, SizeOf(SYSTEMTIME), #0);
      WLRegExpirationDate(Addr(TrialDate));
      DateTimePicker1.DateTime := SystemTimeToDateTime(TrialDate);

    end else begin
    //  EditRegUserIPAddr.Text := jiami;
      FillChar(TrialDate, SizeOf(SYSTEMTIME), #0);
      WLTrialExpirationDate(Addr(TrialDate));
      DateTimePicker1.DateTime := SystemTimeToDateTime(TrialDate);
    end;
    {$I ..\..\Tools\WinLicenseV2.0.8.0\WinlicenseSDK\Include\Delphi\Macros\EnCode_End.inc}
  except
  end;
end;

end.
