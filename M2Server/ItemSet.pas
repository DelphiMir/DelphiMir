unit ItemSet;

interface

uses
  {svn, }Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Spin;

type
  TfrmItemSet = class(TForm)
    PageControl: TPageControl;
    TabSheet8: TTabSheet;
    ItemSetPageControl: TPageControl;
    TabSheet1: TTabSheet;
    GroupBox141: TGroupBox;
    Label108: TLabel;
    Label109: TLabel;
    EditItemExpRate: TSpinEdit;
    TabSheet2: TTabSheet;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    TabSheet6: TTabSheet;
    ButtonItemSetSave: TButton;
    TabSheet9: TTabSheet;
    AddValuePageControl: TPageControl;
    TabSheet10: TTabSheet;
    TabSheet11: TTabSheet;
    TabSheet12: TTabSheet;
    TabSheet13: TTabSheet;
    TabSheet14: TTabSheet;
    TabSheet15: TTabSheet;
    TabSheet16: TTabSheet;
    ButtonAddValueSave: TButton;
    TabSheet17: TTabSheet;
    TabSheet18: TTabSheet;
    GroupBox3: TGroupBox;
    Label6: TLabel;
    EditMonRandomAddValue: TSpinEdit;
    Label7: TLabel;
    EditMakeRandomAddValue: TSpinEdit;
    GroupBox4: TGroupBox;
    Label8: TLabel;
    EditWeaponDCAddValueMaxLimit: TSpinEdit;
    EditWeaponDCAddValueRate: TSpinEdit;
    Label9: TLabel;
    GroupBox5: TGroupBox;
    Label10: TLabel;
    Label11: TLabel;
    EditWeaponMCAddValueMaxLimit: TSpinEdit;
    EditWeaponMCAddValueRate: TSpinEdit;
    GroupBox6: TGroupBox;
    Label12: TLabel;
    Label13: TLabel;
    EditWeaponSCAddValueMaxLimit: TSpinEdit;
    EditWeaponSCAddValueRate: TSpinEdit;
    GroupBox7: TGroupBox;
    Label14: TLabel;
    Label15: TLabel;
    EditDressDCAddValueMaxLimit: TSpinEdit;
    EditDressDCAddValueRate: TSpinEdit;
    GroupBox8: TGroupBox;
    Label16: TLabel;
    Label17: TLabel;
    EditDressMCAddValueMaxLimit: TSpinEdit;
    EditDressMCAddValueRate: TSpinEdit;
    GroupBox9: TGroupBox;
    Label18: TLabel;
    Label19: TLabel;
    EditDressSCAddValueMaxLimit: TSpinEdit;
    EditDressSCAddValueRate: TSpinEdit;
    EditDressDCAddRate: TSpinEdit;
    Label20: TLabel;
    EditDressMCAddRate: TSpinEdit;
    Label21: TLabel;
    Label22: TLabel;
    EditDressSCAddRate: TSpinEdit;
    GroupBox10: TGroupBox;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    EditNeckLace19DCAddValueMaxLimit: TSpinEdit;
    EditNeckLace19DCAddValueRate: TSpinEdit;
    EditNeckLace19DCAddRate: TSpinEdit;
    GroupBox11: TGroupBox;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    EditNeckLace19MCAddValueMaxLimit: TSpinEdit;
    EditNeckLace19MCAddValueRate: TSpinEdit;
    EditNeckLace19MCAddRate: TSpinEdit;
    GroupBox12: TGroupBox;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    EditNeckLace19SCAddValueMaxLimit: TSpinEdit;
    EditNeckLace19SCAddValueRate: TSpinEdit;
    EditNeckLace19SCAddRate: TSpinEdit;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    GroupBox13: TGroupBox;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    EditNeckLace202124DCAddValueMaxLimit: TSpinEdit;
    EditNeckLace202124DCAddValueRate: TSpinEdit;
    EditNeckLace202124DCAddRate: TSpinEdit;
    GroupBox14: TGroupBox;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    EditNeckLace202124MCAddValueMaxLimit: TSpinEdit;
    EditNeckLace202124MCAddValueRate: TSpinEdit;
    EditNeckLace202124MCAddRate: TSpinEdit;
    GroupBox15: TGroupBox;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    EditNeckLace202124SCAddValueMaxLimit: TSpinEdit;
    EditNeckLace202124SCAddValueRate: TSpinEdit;
    EditNeckLace202124SCAddRate: TSpinEdit;
    GroupBox16: TGroupBox;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    EditArmRing26MCAddValueMaxLimit: TSpinEdit;
    EditArmRing26MCAddValueRate: TSpinEdit;
    EditArmRing26MCAddRate: TSpinEdit;
    GroupBox17: TGroupBox;
    Label48: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    EditArmRing26DCAddValueMaxLimit: TSpinEdit;
    EditArmRing26DCAddValueRate: TSpinEdit;
    EditArmRing26DCAddRate: TSpinEdit;
    GroupBox18: TGroupBox;
    Label51: TLabel;
    Label52: TLabel;
    Label53: TLabel;
    EditArmRing26SCAddValueMaxLimit: TSpinEdit;
    EditArmRing26SCAddValueRate: TSpinEdit;
    EditArmRing26SCAddRate: TSpinEdit;
    Label54: TLabel;
    GroupBox19: TGroupBox;
    Label55: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    EditRing22DCAddValueMaxLimit: TSpinEdit;
    EditRing22DCAddValueRate: TSpinEdit;
    EditRing22DCAddRate: TSpinEdit;
    GroupBox20: TGroupBox;
    Label58: TLabel;
    Label59: TLabel;
    Label60: TLabel;
    EditRing22SCAddValueMaxLimit: TSpinEdit;
    EditRing22SCAddValueRate: TSpinEdit;
    EditRing22SCAddRate: TSpinEdit;
    GroupBox21: TGroupBox;
    Label61: TLabel;
    Label62: TLabel;
    Label63: TLabel;
    EditRing22MCAddValueMaxLimit: TSpinEdit;
    EditRing22MCAddValueRate: TSpinEdit;
    EditRing22MCAddRate: TSpinEdit;
    Label64: TLabel;
    GroupBox22: TGroupBox;
    Label65: TLabel;
    Label66: TLabel;
    Label67: TLabel;
    EditRing23DCAddValueMaxLimit: TSpinEdit;
    EditRing23DCAddValueRate: TSpinEdit;
    EditRing23DCAddRate: TSpinEdit;
    GroupBox23: TGroupBox;
    Label68: TLabel;
    Label69: TLabel;
    Label70: TLabel;
    EditRing23MCAddValueMaxLimit: TSpinEdit;
    EditRing23MCAddValueRate: TSpinEdit;
    EditRing23MCAddRate: TSpinEdit;
    GroupBox24: TGroupBox;
    Label71: TLabel;
    Label72: TLabel;
    Label73: TLabel;
    EditRing23SCAddValueMaxLimit: TSpinEdit;
    EditRing23SCAddValueRate: TSpinEdit;
    EditRing23SCAddRate: TSpinEdit;
    Label74: TLabel;
    GroupBox25: TGroupBox;
    Label75: TLabel;
    Label76: TLabel;
    Label77: TLabel;
    EditHelMetDCAddValueMaxLimit: TSpinEdit;
    EditHelMetDCAddValueRate: TSpinEdit;
    EditHelMetDCAddRate: TSpinEdit;
    GroupBox26: TGroupBox;
    Label78: TLabel;
    Label79: TLabel;
    Label80: TLabel;
    EditHelMetMCAddValueMaxLimit: TSpinEdit;
    EditHelMetMCAddValueRate: TSpinEdit;
    EditHelMetMCAddRate: TSpinEdit;
    GroupBox27: TGroupBox;
    Label81: TLabel;
    Label82: TLabel;
    Label83: TLabel;
    EditHelMetSCAddValueMaxLimit: TSpinEdit;
    EditHelMetSCAddValueRate: TSpinEdit;
    EditHelMetSCAddRate: TSpinEdit;
    Label84: TLabel;
    TabSheet19: TTabSheet;
    PageControl1: TPageControl;
    TabSheet25: TTabSheet;
    TabSheet27: TTabSheet;
    ButtonUnKnowItemSave: TButton;
    TabSheet20: TTabSheet;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    GroupBox142: TGroupBox;
    Label110: TLabel;
    Label4: TLabel;
    EditItemPowerRate: TSpinEdit;
    GroupBox2: TGroupBox;
    Label5: TLabel;
    Label86: TLabel;
    GroupBox28: TGroupBox;
    Label85: TLabel;
    Label1: TLabel;
    EditGuildRecallTime: TSpinEdit;
    GroupBox29: TGroupBox;
    Label87: TLabel;
    Label88: TLabel;
    GroupBox44: TGroupBox;
    GroupBox45: TGroupBox;
    Label122: TLabel;
    Label123: TLabel;
    GroupBox42: TGroupBox;
    Label120: TLabel;
    Label116: TLabel;
    Label124: TLabel;
    EditAttackPosionRate: TSpinEdit;
    EditAttackPosionTime: TSpinEdit;
    GroupBox43: TGroupBox;
    GroupBox46: TGroupBox;
    Label117: TLabel;
    Label118: TLabel;
    GroupBox47: TGroupBox;
    Label119: TLabel;
    Label121: TLabel;
    CheckBoxUserMoveCanDupObj: TCheckBox;
    CheckBoxUserMoveCanOnItem: TCheckBox;
    EditUserMoveTime: TSpinEdit;
    GroupBox49: TGroupBox;
    Label152: TLabel;
    Label153: TLabel;
    EditUnknowRingDCAddValueMinLimit: TSpinEdit;
    EditUnknowRingDCAddValueMaxLimit: TSpinEdit;
    GroupBox50: TGroupBox;
    Label155: TLabel;
    Label156: TLabel;
    EditUnknowRingMCAddValueMinLimit: TSpinEdit;
    EditUnknowRingMCAddValueMaxLimit: TSpinEdit;
    GroupBox51: TGroupBox;
    Label158: TLabel;
    Label159: TLabel;
    EditUnknowRingSCAddValueMinLimit: TSpinEdit;
    EditUnknowRingSCAddValueMaxLimit: TSpinEdit;
    GroupBox32: TGroupBox;
    Label93: TLabel;
    Label94: TLabel;
    EditUnknowNecklaceSCAddValueMinLimit: TSpinEdit;
    EditUnknowNecklaceSCAddValueMaxLimit: TSpinEdit;
    GroupBox36: TGroupBox;
    Label101: TLabel;
    Label102: TLabel;
    EditUnknowNecklaceMCAddValueMinLimit: TSpinEdit;
    EditUnknowNecklaceMCAddValueMaxLimit: TSpinEdit;
    GroupBox35: TGroupBox;
    Label99: TLabel;
    Label100: TLabel;
    EditUnknowNecklaceDCAddValueMinLimit: TSpinEdit;
    EditUnknowNecklaceDCAddValueMaxLimit: TSpinEdit;
    GroupBox34: TGroupBox;
    Label97: TLabel;
    Label98: TLabel;
    EditUnknowNecklaceACAddValueMinLimit: TSpinEdit;
    EditUnknowNecklaceACAddValueMaxLimit: TSpinEdit;
    GroupBox33: TGroupBox;
    Label95: TLabel;
    Label96: TLabel;
    EditUnknowNecklaceMACAddValueMinLimit: TSpinEdit;
    EditUnknowNecklaceMACAddValueMaxLimit: TSpinEdit;
    GroupBox39: TGroupBox;
    Label107: TLabel;
    Label111: TLabel;
    EditUnknowHelMetDCAddValueMinLimit: TSpinEdit;
    EditUnknowHelMetDCAddValueMaxLimit: TSpinEdit;
    GroupBox38: TGroupBox;
    Label105: TLabel;
    Label106: TLabel;
    EditUnknowHelMetMCAddValueMinLimit: TSpinEdit;
    EditUnknowHelMetMCAddValueMaxLimit: TSpinEdit;
    GroupBox37: TGroupBox;
    Label103: TLabel;
    Label104: TLabel;
    EditUnknowHelMetSCAddValueMinLimit: TSpinEdit;
    EditUnknowHelMetSCAddValueMaxLimit: TSpinEdit;
    GroupBox41: TGroupBox;
    Label114: TLabel;
    Label115: TLabel;
    EditUnknowHelMetMACAddValueMinLimit: TSpinEdit;
    EditUnknowHelMetMACAddValueMaxLimit: TSpinEdit;
    GroupBox40: TGroupBox;
    Label112: TLabel;
    Label113: TLabel;
    EditUnknowHelMetACAddValueMax1Limit: TSpinEdit;
    EditUnknowHelMetACAddValueMin1Limit: TSpinEdit;
    Label89: TLabel;
    Label90: TLabel;
    EditUnknowHelMetACAddValueMin2Limit: TSpinEdit;
    EditUnknowHelMetACAddValueMax2Limit: TSpinEdit;
    procedure EditItemExpRateChange(Sender: TObject);
    procedure EditItemPowerRateChange(Sender: TObject);
    procedure ButtonItemSetSaveClick(Sender: TObject);
    procedure ButtonAddValueSaveClick(Sender: TObject);
    procedure EditMonRandomAddValueChange(Sender: TObject);
    procedure EditMakeRandomAddValueChange(Sender: TObject);
    procedure EditWeaponDCAddValueMaxLimitChange(Sender: TObject);
    procedure EditWeaponDCAddValueRateChange(Sender: TObject);
    procedure EditWeaponMCAddValueMaxLimitChange(Sender: TObject);
    procedure EditWeaponMCAddValueRateChange(Sender: TObject);
    procedure EditWeaponSCAddValueMaxLimitChange(Sender: TObject);
    procedure EditWeaponSCAddValueRateChange(Sender: TObject);
    procedure EditDressDCAddValueMaxLimitChange(Sender: TObject);
    procedure EditDressDCAddValueRateChange(Sender: TObject);
    procedure EditDressMCAddValueMaxLimitChange(Sender: TObject);
    procedure EditDressMCAddValueRateChange(Sender: TObject);
    procedure EditDressSCAddValueMaxLimitChange(Sender: TObject);
    procedure EditDressSCAddValueRateChange(Sender: TObject);
    procedure EditDressDCAddRateChange(Sender: TObject);
    procedure EditDressMCAddRateChange(Sender: TObject);
    procedure EditDressSCAddRateChange(Sender: TObject);
    procedure EditNeckLace19DCAddValueMaxLimitChange(Sender: TObject);
    procedure EditNeckLace19DCAddValueRateChange(Sender: TObject);
    procedure EditNeckLace19DCAddRateChange(Sender: TObject);
    procedure EditNeckLace19SCAddValueMaxLimitChange(Sender: TObject);
    procedure EditNeckLace19SCAddValueRateChange(Sender: TObject);
    procedure EditNeckLace19SCAddRateChange(Sender: TObject);
    procedure EditNeckLace19MCAddValueMaxLimitChange(Sender: TObject);
    procedure EditNeckLace19MCAddValueRateChange(Sender: TObject);
    procedure EditNeckLace19MCAddRateChange(Sender: TObject);
    procedure EditNeckLace202124DCAddValueMaxLimitChange(Sender: TObject);
    procedure EditNeckLace202124DCAddValueRateChange(Sender: TObject);
    procedure EditNeckLace202124DCAddRateChange(Sender: TObject);
    procedure EditNeckLace202124SCAddValueMaxLimitChange(Sender: TObject);
    procedure EditNeckLace202124SCAddValueRateChange(Sender: TObject);
    procedure EditNeckLace202124SCAddRateChange(Sender: TObject);
    procedure EditNeckLace202124MCAddValueMaxLimitChange(Sender: TObject);
    procedure EditNeckLace202124MCAddValueRateChange(Sender: TObject);
    procedure EditNeckLace202124MCAddRateChange(Sender: TObject);
    procedure EditArmRing26DCAddValueMaxLimitChange(Sender: TObject);
    procedure EditArmRing26DCAddValueRateChange(Sender: TObject);
    procedure EditArmRing26DCAddRateChange(Sender: TObject);
    procedure EditArmRing26SCAddValueMaxLimitChange(Sender: TObject);
    procedure EditArmRing26SCAddValueRateChange(Sender: TObject);
    procedure EditArmRing26SCAddRateChange(Sender: TObject);
    procedure EditArmRing26MCAddValueMaxLimitChange(Sender: TObject);
    procedure EditArmRing26MCAddValueRateChange(Sender: TObject);
    procedure EditArmRing26MCAddRateChange(Sender: TObject);
    procedure EditRing22DCAddValueMaxLimitChange(Sender: TObject);
    procedure EditRing22DCAddValueRateChange(Sender: TObject);
    procedure EditRing22DCAddRateChange(Sender: TObject);
    procedure EditRing22SCAddValueMaxLimitChange(Sender: TObject);
    procedure EditRing22SCAddValueRateChange(Sender: TObject);
    procedure EditRing22SCAddRateChange(Sender: TObject);
    procedure EditRing22MCAddValueMaxLimitChange(Sender: TObject);
    procedure EditRing22MCAddValueRateChange(Sender: TObject);
    procedure EditRing22MCAddRateChange(Sender: TObject);
    procedure EditRing23DCAddValueMaxLimitChange(Sender: TObject);
    procedure EditRing23DCAddValueRateChange(Sender: TObject);
    procedure EditRing23DCAddRateChange(Sender: TObject);
    procedure EditRing23SCAddValueMaxLimitChange(Sender: TObject);
    procedure EditRing23SCAddValueRateChange(Sender: TObject);
    procedure EditRing23SCAddRateChange(Sender: TObject);
    procedure EditRing23MCAddValueMaxLimitChange(Sender: TObject);
    procedure EditRing23MCAddValueRateChange(Sender: TObject);
    procedure EditRing23MCAddRateChange(Sender: TObject);
    procedure EditHelMetDCAddValueMaxLimitChange(Sender: TObject);
    procedure EditHelMetDCAddValueRateChange(Sender: TObject);
    procedure EditHelMetDCAddRateChange(Sender: TObject);
    procedure EditHelMetSCAddValueMaxLimitChange(Sender: TObject);
    procedure EditHelMetSCAddValueRateChange(Sender: TObject);
    procedure EditHelMetSCAddRateChange(Sender: TObject);
    procedure EditHelMetMCAddValueMaxLimitChange(Sender: TObject);
    procedure EditHelMetMCAddValueRateChange(Sender: TObject);
    procedure EditHelMetMCAddRateChange(Sender: TObject);
    procedure EditGuildRecallTimeChange(Sender: TObject);
    procedure ButtonUnKnowItemSaveClick(Sender: TObject);
    procedure EditUnknowRingDCAddValueMaxLimitChange(Sender: TObject);
    procedure EditUnknowRingDCAddValueMinLimitChange(Sender: TObject);
    procedure EditUnknowRingMCAddValueMaxLimitChange(Sender: TObject);
    procedure EditUnknowRingMCAddValueMinLimitChange(Sender: TObject);
    procedure EditUnknowRingSCAddValueMaxLimitChange(Sender: TObject);
    procedure EditUnknowRingSCAddValueMinLimitChange(Sender: TObject);

    procedure EditUnknowNecklaceDCAddValueMaxLimitChange(Sender: TObject);
    procedure EditUnknowNecklaceDCAddValueMinLimitChange(Sender: TObject);
    procedure EditUnknowNecklaceMCAddValueMaxLimitChange(Sender: TObject);
    procedure EditUnknowNecklaceMCAddValueMinLimitChange(Sender: TObject);
    procedure EditUnknowNecklaceSCAddValueMaxLimitChange(Sender: TObject);
    procedure EditUnknowNecklaceSCAddValueMinLimitChange(Sender: TObject);
    procedure EditUnknowNecklaceACAddValueMaxLimitChange(Sender: TObject);
    procedure EditUnknowNecklaceACAddValueMinLimitChange(Sender: TObject);
    procedure EditUnknowNecklaceMACAddValueMaxLimitChange(Sender: TObject);
    procedure EditUnknowNecklaceMACAddValueMinLimitChange(Sender: TObject);
    procedure EditUnknowHelMetDCAddValueMaxLimitChange(Sender: TObject);
    procedure EditUnknowHelMetDCAddValueMinLimitChange(Sender: TObject);
    procedure EditUnknowHelMetMCAddValueMaxLimitChange(Sender: TObject);
    procedure EditUnknowHelMetMCAddValueMinLimitChange(Sender: TObject);
    procedure EditUnknowHelMetSCAddValueMaxLimitChange(Sender: TObject);
    procedure EditUnknowHelMetSCAddValueMinLimitChange(Sender: TObject);
    procedure EditUnknowHelMetACAddValueMin1LimitChange(Sender: TObject);
    procedure EditUnknowHelMetACAddValueMax1LimitChange(Sender: TObject);
    procedure EditUnknowHelMetMACAddValueMaxLimitChange(Sender: TObject);
    procedure EditUnknowHelMetMACAddValueMinLimitChange(Sender: TObject);
    procedure EditAttackPosionRateChange(Sender: TObject);
    procedure EditAttackPosionTimeChange(Sender: TObject);
    procedure CheckBoxUserMoveCanDupObjClick(Sender: TObject);
    procedure CheckBoxUserMoveCanOnItemClick(Sender: TObject);
    procedure EditUserMoveTimeChange(Sender: TObject);
    procedure EditUnknowHelMetACAddValueMin2LimitChange(Sender: TObject);
    procedure EditUnknowHelMetACAddValueMax2LimitChange(Sender: TObject);
  private
    boOpened:Boolean;
    boModValued:Boolean;
    procedure ModValue();
    procedure uModValue();
    procedure RefUnknowItem();
    procedure RefShapeItem();
    { Private declarations }
  public
    procedure Open();
    { Public declarations }
  end;

var
  frmItemSet: TfrmItemSet;

implementation

uses M2Share;

{$R *.dfm}

{ TfrmItemSet }

procedure TfrmItemSet.ModValue;
begin
  boModValued:=True;
  ButtonItemSetSave.Enabled:=True;
  ButtonAddValueSave.Enabled:=True;
  ButtonUnKnowItemSave.Enabled:=True;
end;

procedure TfrmItemSet.uModValue;
begin
  boModValued:=False;
  ButtonItemSetSave.Enabled:=False;
  ButtonAddValueSave.Enabled:=False;
  ButtonUnKnowItemSave.Enabled:=False;
end;

procedure TfrmItemSet.Open;
begin
  boOpened:=False;
  uModValue();

  EditItemExpRate.Value:=g_Config.nItemExpRate;
  EditItemPowerRate.Value:=g_Config.nItemPowerRate;

  EditMonRandomAddValue.Value:=g_Config.nMonRandomAddValue;
  EditMakeRandomAddValue.Value:=g_Config.nMakeRandomAddValue;

  EditWeaponDCAddValueMaxLimit.Value:=g_Config.nWeaponDCAddValueMaxLimit;
  EditWeaponDCAddValueRate.Value:=g_Config.nWeaponDCAddValueRate;
  EditWeaponMCAddValueMaxLimit.Value:=g_Config.nWeaponMCAddValueMaxLimit;
  EditWeaponMCAddValueRate.Value:=g_Config.nWeaponMCAddValueRate;
  EditWeaponSCAddValueMaxLimit.Value:=g_Config.nWeaponSCAddValueMaxLimit;
  EditWeaponSCAddValueRate.Value:=g_Config.nWeaponSCAddValueRate;

  EditDressDCAddRate.Value:=g_Config.nDressDCAddRate;
  EditDressDCAddValueMaxLimit.Value:=g_Config.nDressDCAddValueMaxLimit;
  EditDressDCAddValueRate.Value:=g_Config.nDressDCAddValueRate;
  EditDressMCAddRate.Value:=g_Config.nDressMCAddRate;
  EditDressMCAddValueMaxLimit.Value:=g_Config.nDressMCAddValueMaxLimit;
  EditDressMCAddValueRate.Value:=g_Config.nDressMCAddValueRate;
  EditDressSCAddRate.Value:=g_Config.nDressSCAddRate;
  EditDressSCAddValueMaxLimit.Value:=g_Config.nDressSCAddValueMaxLimit;
  EditDressSCAddValueRate.Value:=g_Config.nDressSCAddValueRate;

  EditNeckLace19DCAddRate.Value:=g_Config.nNeckLace19DCAddRate;
  EditNeckLace19DCAddValueMaxLimit.Value:=g_Config.nNeckLace19DCAddValueMaxLimit;
  EditNeckLace19DCAddValueRate.Value:=g_Config.nNeckLace19DCAddValueRate;
  EditNeckLace19MCAddRate.Value:=g_Config.nNeckLace19MCAddRate;
  EditNeckLace19MCAddValueMaxLimit.Value:=g_Config.nNeckLace19MCAddValueMaxLimit;
  EditNeckLace19MCAddValueRate.Value:=g_Config.nNeckLace19MCAddValueRate;
  EditNeckLace19SCAddRate.Value:=g_Config.nNeckLace19SCAddRate;
  EditNeckLace19SCAddValueMaxLimit.Value:=g_Config.nNeckLace19SCAddValueMaxLimit;
  EditNeckLace19SCAddValueRate.Value:=g_Config.nNeckLace19SCAddValueRate;

  EditNeckLace202124DCAddRate.Value:=g_Config.nNeckLace202124DCAddRate;
  EditNeckLace202124DCAddValueMaxLimit.Value:=g_Config.nNeckLace202124DCAddValueMaxLimit;
  EditNeckLace202124DCAddValueRate.Value:=g_Config.nNeckLace202124DCAddValueRate;
  EditNeckLace202124MCAddRate.Value:=g_Config.nNeckLace202124MCAddRate;
  EditNeckLace202124MCAddValueMaxLimit.Value:=g_Config.nNeckLace202124MCAddValueMaxLimit;
  EditNeckLace202124MCAddValueRate.Value:=g_Config.nNeckLace202124MCAddValueRate;
  EditNeckLace202124SCAddRate.Value:=g_Config.nNeckLace202124SCAddRate;  
  EditNeckLace202124SCAddValueMaxLimit.Value:=g_Config.nNeckLace202124SCAddValueMaxLimit;
  EditNeckLace202124SCAddValueRate.Value:=g_Config.nNeckLace202124SCAddValueRate;

  EditArmRing26DCAddRate.Value:=g_Config.nArmRing26DCAddRate;
  EditArmRing26DCAddValueMaxLimit.Value:=g_Config.nArmRing26DCAddValueMaxLimit;
  EditArmRing26DCAddValueRate.Value:=g_Config.nArmRing26DCAddValueRate;
  EditArmRing26MCAddRate.Value:=g_Config.nArmRing26MCAddRate;
  EditArmRing26MCAddValueMaxLimit.Value:=g_Config.nArmRing26MCAddValueMaxLimit;
  EditArmRing26MCAddValueRate.Value:=g_Config.nArmRing26MCAddValueRate;
  EditArmRing26SCAddRate.Value:=g_Config.nArmRing26SCAddRate;
  EditArmRing26SCAddValueMaxLimit.Value:=g_Config.nArmRing26SCAddValueMaxLimit;
  EditArmRing26SCAddValueRate.Value:=g_Config.nArmRing26SCAddValueRate;

  EditRing22DCAddRate.Value:=g_Config.nRing22DCAddRate;
  EditRing22DCAddValueMaxLimit.Value:=g_Config.nRing22DCAddValueMaxLimit;
  EditRing22DCAddValueRate.Value:=g_Config.nRing22DCAddValueRate;
  EditRing22MCAddRate.Value:=g_Config.nRing22MCAddRate;
  EditRing22MCAddValueMaxLimit.Value:=g_Config.nRing22MCAddValueMaxLimit;
  EditRing22MCAddValueRate.Value:=g_Config.nRing22MCAddValueRate;
  EditRing22SCAddRate.Value:=g_Config.nRing22SCAddRate;
  EditRing22SCAddValueMaxLimit.Value:=g_Config.nRing22SCAddValueMaxLimit;
  EditRing22SCAddValueRate.Value:=g_Config.nRing22SCAddValueRate;

  EditRing23DCAddRate.Value:=g_Config.nRing23DCAddRate;
  EditRing23DCAddValueMaxLimit.Value:=g_Config.nRing23DCAddValueMaxLimit;
  EditRing23DCAddValueRate.Value:=g_Config.nRing23DCAddValueRate;
  EditRing23MCAddRate.Value:=g_Config.nRing23MCAddRate;
  EditRing23MCAddValueMaxLimit.Value:=g_Config.nRing23MCAddValueMaxLimit;
  EditRing23MCAddValueRate.Value:=g_Config.nRing23MCAddValueRate;
  EditRing23SCAddRate.Value:=g_Config.nRing23SCAddRate;
  EditRing23SCAddValueMaxLimit.Value:=g_Config.nRing23SCAddValueMaxLimit;
  EditRing23SCAddValueRate.Value:=g_Config.nRing23SCAddValueRate;

  EditHelMetDCAddRate.Value:=g_Config.nHelMetDCAddRate;
  EditHelMetDCAddValueMaxLimit.Value:=g_Config.nHelMetDCAddValueMaxLimit;
  EditHelMetDCAddValueRate.Value:=g_Config.nHelMetDCAddValueRate;
  EditHelMetMCAddRate.Value:=g_Config.nHelMetMCAddRate;
  EditHelMetMCAddValueMaxLimit.Value:=g_Config.nHelMetMCAddValueMaxLimit;
  EditHelMetMCAddValueRate.Value:=g_Config.nHelMetMCAddValueRate;
  EditHelMetSCAddRate.Value:=g_Config.nHelMetSCAddRate;
  EditHelMetSCAddValueMaxLimit.Value:=g_Config.nHelMetSCAddValueMaxLimit;
  EditHelMetSCAddValueRate.Value:=g_Config.nHelMetSCAddValueRate;

  EditGuildRecallTime.Value:=g_Config.nGuildRecallTime;

  RefUnknowItem();
  RefShapeItem();    

  boOpened:=True;
  PageControl.ActivePageIndex:=0;
  AddValuePageControl.ActivePageIndex:=0;
  ItemSetPageControl.ActivePageIndex:=0;
  ShowModal;
end;

procedure TfrmItemSet.ButtonItemSetSaveClick(Sender: TObject);
begin
  Config.WriteInteger('Setup','ItemPowerRate',g_Config.nItemPowerRate);
  Config.WriteInteger('Setup','ItemExpRate',g_Config.nItemExpRate);
  Config.WriteInteger('Setup','GuildRecallTime', g_Config.nGuildRecallTime);
  Config.WriteInteger('Setup','GroupRecallTime', g_Config.nGroupRecallTime);
  Config.WriteInteger('Setup','GroupRecallTime', g_Config.nAttackPosionRate);
  Config.WriteInteger('Setup','AttackPosionRate',g_Config.nAttackPosionRate);
  Config.WriteInteger('Setup','AttackPosionTime',g_Config.nAttackPosionTime);
  Config.WriteBool('Setup','UserMoveCanDupObj',g_Config.boUserMoveCanDupObj);
  Config.WriteBool('Setup','UserMoveCanOnItem',g_Config.boUserMoveCanOnItem);
  Config.WriteInteger('Setup','UserMoveTime',g_Config.dwUserMoveTime);

  uModValue();
end;

procedure TfrmItemSet.EditItemExpRateChange(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.nItemExpRate:=EditItemExpRate.Value;
  ModValue();
end;

procedure TfrmItemSet.EditItemPowerRateChange(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.nItemPowerRate:=EditItemPowerRate.Value;
  ModValue();
end;

procedure TfrmItemSet.ButtonAddValueSaveClick(Sender: TObject);
begin
  Config.WriteInteger('Setup','MonRandomAddValue', g_Config.nMonRandomAddValue);
  Config.WriteInteger('Setup','MakeRandomAddValue', g_Config.nMakeRandomAddValue);
  Config.WriteInteger('Setup','WeaponDCAddValueMaxLimit', g_Config.nWeaponDCAddValueMaxLimit);
  Config.WriteInteger('Setup','WeaponDCAddValueRate', g_Config.nWeaponDCAddValueRate);
  Config.WriteInteger('Setup','WeaponMCAddValueMaxLimit', g_Config.nWeaponMCAddValueMaxLimit);
  Config.WriteInteger('Setup','WeaponMCAddValueRate', g_Config.nWeaponMCAddValueRate);
  Config.WriteInteger('Setup','WeaponSCAddValueMaxLimit', g_Config.nWeaponSCAddValueMaxLimit);
  Config.WriteInteger('Setup','WeaponSCAddValueRate', g_Config.nWeaponSCAddValueRate);

  Config.WriteInteger('Setup','DressDCAddRate', g_Config.nDressDCAddRate);
  Config.WriteInteger('Setup','DressDCAddValueMaxLimit', g_Config.nDressDCAddValueMaxLimit);
  Config.WriteInteger('Setup','DressDCAddValueRate', g_Config.nDressDCAddValueRate);
  Config.WriteInteger('Setup','DressMCAddRate', g_Config.nDressMCAddRate);
  Config.WriteInteger('Setup','DressMCAddValueMaxLimit', g_Config.nDressMCAddValueMaxLimit);
  Config.WriteInteger('Setup','DressMCAddValueRate', g_Config.nDressMCAddValueRate);
  Config.WriteInteger('Setup','DressSCAddRate', g_Config.nDressSCAddRate);
  Config.WriteInteger('Setup','DressSCAddValueMaxLimit', g_Config.nDressSCAddValueMaxLimit);
  Config.WriteInteger('Setup','DressSCAddValueRate', g_Config.nDressSCAddValueRate);

  Config.WriteInteger('Setup','NeckLace19DCAddRate', g_Config.nNeckLace19DCAddRate);
  Config.WriteInteger('Setup','NeckLace19DCAddValueMaxLimit', g_Config.nNeckLace19DCAddValueMaxLimit);
  Config.WriteInteger('Setup','NeckLace19DCAddValueRate', g_Config.nNeckLace19DCAddValueRate);
  Config.WriteInteger('Setup','NeckLace19MCAddRate', g_Config.nNeckLace19MCAddRate);
  Config.WriteInteger('Setup','NeckLace19MCAddValueMaxLimit', g_Config.nNeckLace19MCAddValueMaxLimit);
  Config.WriteInteger('Setup','NeckLace19MCAddValueRate', g_Config.nNeckLace19MCAddValueRate);
  Config.WriteInteger('Setup','NeckLace19SCAddRate', g_Config.nNeckLace19SCAddRate);
  Config.WriteInteger('Setup','NeckLace19SCAddValueMaxLimit', g_Config.nNeckLace19SCAddValueMaxLimit);
  Config.WriteInteger('Setup','NeckLace19SCAddValueRate', g_Config.nNeckLace19SCAddValueRate);

  Config.WriteInteger('Setup','NeckLace202124DCAddRate', g_Config.nNeckLace202124DCAddRate);
  Config.WriteInteger('Setup','NeckLace202124DCAddValueMaxLimit', g_Config.nNeckLace202124DCAddValueMaxLimit);
  Config.WriteInteger('Setup','NeckLace202124DCAddValueRate', g_Config.nNeckLace202124DCAddValueRate);
  Config.WriteInteger('Setup','NeckLace202124MCAddRate', g_Config.nNeckLace202124MCAddRate);
  Config.WriteInteger('Setup','NeckLace202124MCAddValueMaxLimit', g_Config.nNeckLace202124MCAddValueMaxLimit);
  Config.WriteInteger('Setup','NeckLace202124MCAddValueRate', g_Config.nNeckLace202124MCAddValueRate);
  Config.WriteInteger('Setup','NeckLace202124SCAddRate', g_Config.nNeckLace202124SCAddRate);
  Config.WriteInteger('Setup','NeckLace202124SCAddValueMaxLimit', g_Config.nNeckLace202124SCAddValueMaxLimit);
  Config.WriteInteger('Setup','NeckLace202124SCAddValueRate', g_Config.nNeckLace202124SCAddValueRate);

  Config.WriteInteger('Setup','Ring22DCAddValueMaxLimit', g_Config.nRing22DCAddValueMaxLimit);
  Config.WriteInteger('Setup','Ring22DCAddValueRate', g_Config.nRing22DCAddValueRate);
  Config.WriteInteger('Setup','Ring22DCAddRate', g_Config.nRing22DCAddRate);
  Config.WriteInteger('Setup','Ring22MCAddValueMaxLimit', g_Config.nRing22MCAddValueMaxLimit);
  Config.WriteInteger('Setup','Ring22MCAddValueRate', g_Config.nRing22MCAddValueRate);
  Config.WriteInteger('Setup','Ring22MCAddRate', g_Config.nRing22MCAddRate);
  Config.WriteInteger('Setup','Ring22SCAddValueMaxLimit', g_Config.nRing22SCAddValueMaxLimit);
  Config.WriteInteger('Setup','Ring22SCAddValueRate', g_Config.nRing22SCAddValueRate);
  Config.WriteInteger('Setup','Ring22SCAddRate', g_Config.nRing22SCAddRate);

  Config.WriteInteger('Setup','ArmRing26DCAddRate', g_Config.nArmRing26DCAddRate);
  Config.WriteInteger('Setup','ArmRing26DCAddValueMaxLimit', g_Config.nArmRing26DCAddValueMaxLimit);
  Config.WriteInteger('Setup','ArmRing26DCAddValueRate', g_Config.nArmRing26DCAddValueRate);
  Config.WriteInteger('Setup','ArmRing26MCAddRate', g_Config.nArmRing26MCAddRate);
  Config.WriteInteger('Setup','ArmRing26MCAddValueMaxLimit', g_Config.nArmRing26MCAddValueMaxLimit);
  Config.WriteInteger('Setup','ArmRing26MCAddValueRate', g_Config.nArmRing26MCAddValueRate);
  Config.WriteInteger('Setup','ArmRing26SCAddRate', g_Config.nArmRing26SCAddRate);
  Config.WriteInteger('Setup','ArmRing26SCAddValueMaxLimit', g_Config.nArmRing26SCAddValueMaxLimit);
  Config.WriteInteger('Setup','ArmRing26SCAddValueRate', g_Config.nArmRing26SCAddValueRate);

  Config.WriteInteger('Setup','Ring23DCAddRate', g_Config.nRing23DCAddRate);
  Config.WriteInteger('Setup','Ring23DCAddValueMaxLimit', g_Config.nRing23DCAddValueMaxLimit);
  Config.WriteInteger('Setup','Ring23DCAddValueRate', g_Config.nRing23DCAddValueRate);
  Config.WriteInteger('Setup','Ring23MCAddRate', g_Config.nRing23MCAddRate);
  Config.WriteInteger('Setup','Ring23MCAddValueMaxLimit', g_Config.nRing23MCAddValueMaxLimit);
  Config.WriteInteger('Setup','Ring23MCAddValueRate', g_Config.nRing23MCAddValueRate);
  Config.WriteInteger('Setup','Ring23SCAddRate', g_Config.nRing23SCAddRate);
  Config.WriteInteger('Setup','Ring23SCAddValueMaxLimit', g_Config.nRing23SCAddValueMaxLimit);
  Config.WriteInteger('Setup','Ring23SCAddValueRate', g_Config.nRing23SCAddValueRate);

  Config.WriteInteger('Setup','HelMetDCAddRate', g_Config.nHelMetDCAddRate);
  Config.WriteInteger('Setup','HelMetDCAddValueMaxLimit', g_Config.nHelMetDCAddValueMaxLimit);
  Config.WriteInteger('Setup','HelMetDCAddValueRate', g_Config.nHelMetDCAddValueRate);
  Config.WriteInteger('Setup','HelMetMCAddRate', g_Config.nHelMetMCAddRate);
  Config.WriteInteger('Setup','HelMetMCAddValueMaxLimit', g_Config.nHelMetMCAddValueMaxLimit);
  Config.WriteInteger('Setup','HelMetMCAddValueRate', g_Config.nHelMetMCAddValueRate);
  Config.WriteInteger('Setup','HelMetSCAddRate', g_Config.nHelMetSCAddRate);
  Config.WriteInteger('Setup','HelMetSCAddValueMaxLimit', g_Config.nHelMetSCAddValueMaxLimit);
  Config.WriteInteger('Setup','HelMetSCAddValueRate', g_Config.nHelMetSCAddValueRate);          
    
  uModValue();
end;

procedure TfrmItemSet.EditMonRandomAddValueChange(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.nMonRandomAddValue:=EditMonRandomAddValue.Value;
  ModValue();
end;

procedure TfrmItemSet.EditMakeRandomAddValueChange(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.nMakeRandomAddValue:=EditMakeRandomAddValue.Value;
  ModValue();
end;

procedure TfrmItemSet.EditWeaponDCAddValueMaxLimitChange(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.nWeaponDCAddValueMaxLimit:=EditWeaponDCAddValueMaxLimit.Value;
  ModValue();
end;

procedure TfrmItemSet.EditWeaponDCAddValueRateChange(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.nWeaponDCAddValueRate:=EditWeaponDCAddValueRate.Value;
  ModValue();
end;

procedure TfrmItemSet.EditWeaponMCAddValueMaxLimitChange(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.nWeaponMCAddValueMaxLimit:=EditWeaponMCAddValueMaxLimit.Value;
  ModValue();
end;

procedure TfrmItemSet.EditWeaponMCAddValueRateChange(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.nWeaponMCAddValueRate:=EditWeaponMCAddValueRate.Value;
  ModValue();
end;

procedure TfrmItemSet.EditWeaponSCAddValueMaxLimitChange(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.nWeaponSCAddValueMaxLimit:=EditWeaponSCAddValueMaxLimit.Value;
  ModValue();
end;

procedure TfrmItemSet.EditWeaponSCAddValueRateChange(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.nWeaponSCAddValueRate:=EditWeaponSCAddValueRate.Value;
  ModValue();
end;

procedure TfrmItemSet.EditDressDCAddValueMaxLimitChange(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.nDressDCAddValueMaxLimit:=EditDressDCAddValueMaxLimit.Value;
  ModValue();
end;

procedure TfrmItemSet.EditDressDCAddValueRateChange(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.nDressDCAddValueRate:=EditDressDCAddValueRate.Value;
  ModValue();
end;

procedure TfrmItemSet.EditDressMCAddValueMaxLimitChange(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.nDressMCAddValueMaxLimit:=EditDressMCAddValueMaxLimit.Value;
  ModValue();
end;

procedure TfrmItemSet.EditDressMCAddValueRateChange(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.nDressMCAddValueRate:=EditDressMCAddValueRate.Value;
  ModValue();
end;

procedure TfrmItemSet.EditDressSCAddValueMaxLimitChange(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.nDressSCAddValueMaxLimit:=EditDressSCAddValueMaxLimit.Value;
  ModValue();
end;

procedure TfrmItemSet.EditDressSCAddValueRateChange(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.nDressSCAddValueRate:=EditDressSCAddValueRate.Value;
  ModValue();
end;
procedure TfrmItemSet.EditDressDCAddRateChange(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.nDressDCAddRate:=EditDressDCAddRate.Value;
  ModValue();
end;

procedure TfrmItemSet.EditDressMCAddRateChange(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.nDressMCAddRate:=EditDressMCAddRate.Value;
  ModValue();
end;

procedure TfrmItemSet.EditDressSCAddRateChange(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.nDressSCAddRate:=EditDressSCAddRate.Value;
  ModValue();
end;

procedure TfrmItemSet.EditNeckLace19DCAddValueMaxLimitChange(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.nNeckLace19DCAddValueMaxLimit:=EditNeckLace19DCAddValueMaxLimit.Value;
  ModValue();
end;

procedure TfrmItemSet.EditNeckLace19DCAddValueRateChange(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.nNeckLace19DCAddValueRate:=EditNeckLace19DCAddValueRate.Value;
  ModValue();
end;

procedure TfrmItemSet.EditNeckLace19MCAddValueMaxLimitChange(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.nNeckLace19MCAddValueMaxLimit:=EditNeckLace19MCAddValueMaxLimit.Value;
  ModValue();
end;

procedure TfrmItemSet.EditNeckLace19MCAddValueRateChange(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.nNeckLace19MCAddValueRate:=EditNeckLace19MCAddValueRate.Value;
  ModValue();
end;

procedure TfrmItemSet.EditNeckLace19SCAddValueMaxLimitChange(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.nNeckLace19SCAddValueMaxLimit:=EditNeckLace19SCAddValueMaxLimit.Value;
  ModValue();
end;

procedure TfrmItemSet.EditNeckLace19SCAddValueRateChange(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.nNeckLace19SCAddValueRate:=EditNeckLace19SCAddValueRate.Value;
  ModValue();
end;
procedure TfrmItemSet.EditNeckLace19DCAddRateChange(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.nNeckLace19DCAddRate:=EditNeckLace19DCAddRate.Value;
  ModValue();
end;

procedure TfrmItemSet.EditNeckLace19MCAddRateChange(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.nNeckLace19MCAddRate:=EditNeckLace19MCAddRate.Value;
  ModValue();
end;

procedure TfrmItemSet.EditNeckLace19SCAddRateChange(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.nNeckLace19SCAddRate:=EditNeckLace19SCAddRate.Value;
  ModValue();
end;

procedure TfrmItemSet.EditNeckLace202124DCAddValueMaxLimitChange(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.nNeckLace202124DCAddValueMaxLimit:=EditNeckLace202124DCAddValueMaxLimit.Value;
  ModValue();
end;

procedure TfrmItemSet.EditNeckLace202124DCAddValueRateChange(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.nNeckLace202124DCAddValueRate:=EditNeckLace202124DCAddValueRate.Value;
  ModValue();
end;

procedure TfrmItemSet.EditNeckLace202124MCAddValueMaxLimitChange(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.nNeckLace202124MCAddValueMaxLimit:=EditNeckLace202124MCAddValueMaxLimit.Value;
  ModValue();
end;

procedure TfrmItemSet.EditNeckLace202124MCAddValueRateChange(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.nNeckLace202124MCAddValueRate:=EditNeckLace202124MCAddValueRate.Value;
  ModValue();
end;

procedure TfrmItemSet.EditNeckLace202124SCAddValueMaxLimitChange(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.nNeckLace202124SCAddValueMaxLimit:=EditNeckLace202124SCAddValueMaxLimit.Value;
  ModValue();
end;

procedure TfrmItemSet.EditNeckLace202124SCAddValueRateChange(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.nNeckLace202124SCAddValueRate:=EditNeckLace202124SCAddValueRate.Value;
  ModValue();
end;
procedure TfrmItemSet.EditNeckLace202124DCAddRateChange(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.nNeckLace202124DCAddRate:=EditNeckLace202124DCAddRate.Value;
  ModValue();
end;

procedure TfrmItemSet.EditNeckLace202124MCAddRateChange(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.nNeckLace202124MCAddRate:=EditNeckLace202124MCAddRate.Value;
  ModValue();
end;

procedure TfrmItemSet.EditNeckLace202124SCAddRateChange(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.nNeckLace202124SCAddRate:=EditNeckLace202124SCAddRate.Value;
  ModValue();
end;

procedure TfrmItemSet.EditArmRing26DCAddValueMaxLimitChange(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.nArmRing26DCAddValueMaxLimit:=EditArmRing26DCAddValueMaxLimit.Value;
  ModValue();
end;

procedure TfrmItemSet.EditArmRing26DCAddValueRateChange(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.nArmRing26DCAddValueRate:=EditArmRing26DCAddValueRate.Value;
  ModValue();
end;

procedure TfrmItemSet.EditArmRing26MCAddValueMaxLimitChange(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.nArmRing26MCAddValueMaxLimit:=EditArmRing26MCAddValueMaxLimit.Value;
  ModValue();
end;

procedure TfrmItemSet.EditArmRing26MCAddValueRateChange(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.nArmRing26MCAddValueRate:=EditArmRing26MCAddValueRate.Value;
  ModValue();
end;

procedure TfrmItemSet.EditArmRing26SCAddValueMaxLimitChange(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.nArmRing26SCAddValueMaxLimit:=EditArmRing26SCAddValueMaxLimit.Value;
  ModValue();
end;

procedure TfrmItemSet.EditArmRing26SCAddValueRateChange(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.nArmRing26SCAddValueRate:=EditArmRing26SCAddValueRate.Value;
  ModValue();
end;
procedure TfrmItemSet.EditArmRing26DCAddRateChange(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.nArmRing26DCAddRate:=EditArmRing26DCAddRate.Value;
  ModValue();
end;

procedure TfrmItemSet.EditArmRing26MCAddRateChange(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.nArmRing26MCAddRate:=EditArmRing26MCAddRate.Value;
  ModValue();
end;

procedure TfrmItemSet.EditArmRing26SCAddRateChange(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.nArmRing26SCAddRate:=EditArmRing26SCAddRate.Value;
  ModValue();
end;


procedure TfrmItemSet.EditRing22DCAddValueMaxLimitChange(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.nRing22DCAddValueMaxLimit:=EditRing22DCAddValueMaxLimit.Value;
  ModValue();
end;

procedure TfrmItemSet.EditRing22DCAddValueRateChange(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.nRing22DCAddValueRate:=EditRing22DCAddValueRate.Value;
  ModValue();
end;

procedure TfrmItemSet.EditRing22MCAddValueMaxLimitChange(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.nRing22MCAddValueMaxLimit:=EditRing22MCAddValueMaxLimit.Value;
  ModValue();
end;

procedure TfrmItemSet.EditRing22MCAddValueRateChange(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.nRing22MCAddValueRate:=EditRing22MCAddValueRate.Value;
  ModValue();
end;

procedure TfrmItemSet.EditRing22SCAddValueMaxLimitChange(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.nRing22SCAddValueMaxLimit:=EditRing22SCAddValueMaxLimit.Value;
  ModValue();
end;

procedure TfrmItemSet.EditRing22SCAddValueRateChange(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.nRing22SCAddValueRate:=EditRing22SCAddValueRate.Value;
  ModValue();
end;
procedure TfrmItemSet.EditRing22DCAddRateChange(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.nRing22DCAddRate:=EditRing22DCAddRate.Value;
  ModValue();
end;

procedure TfrmItemSet.EditRing22MCAddRateChange(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.nRing22MCAddRate:=EditRing22MCAddRate.Value;
  ModValue();
end;

procedure TfrmItemSet.EditRing22SCAddRateChange(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.nRing22SCAddRate:=EditRing22SCAddRate.Value;
  ModValue();
end;

procedure TfrmItemSet.EditRing23DCAddValueMaxLimitChange(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.nRing23DCAddValueMaxLimit:=EditRing23DCAddValueMaxLimit.Value;
  ModValue();
end;

procedure TfrmItemSet.EditRing23DCAddValueRateChange(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.nRing23DCAddValueRate:=EditRing23DCAddValueRate.Value;
  ModValue();
end;

procedure TfrmItemSet.EditRing23MCAddValueMaxLimitChange(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.nRing23MCAddValueMaxLimit:=EditRing23MCAddValueMaxLimit.Value;
  ModValue();
end;

procedure TfrmItemSet.EditRing23MCAddValueRateChange(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.nRing23MCAddValueRate:=EditRing23MCAddValueRate.Value;
  ModValue();
end;

procedure TfrmItemSet.EditRing23SCAddValueMaxLimitChange(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.nRing23SCAddValueMaxLimit:=EditRing23SCAddValueMaxLimit.Value;
  ModValue();
end;

procedure TfrmItemSet.EditRing23SCAddValueRateChange(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.nRing23SCAddValueRate:=EditRing23SCAddValueRate.Value;
  ModValue();
end;
procedure TfrmItemSet.EditRing23DCAddRateChange(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.nRing23DCAddRate:=EditRing23DCAddRate.Value;
  ModValue();
end;

procedure TfrmItemSet.EditRing23MCAddRateChange(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.nRing23MCAddRate:=EditRing23MCAddRate.Value;
  ModValue();
end;

procedure TfrmItemSet.EditRing23SCAddRateChange(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.nRing23SCAddRate:=EditRing23SCAddRate.Value;
  ModValue();
end;

procedure TfrmItemSet.EditHelMetDCAddValueMaxLimitChange(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.nHelMetDCAddValueMaxLimit:=EditHelMetDCAddValueMaxLimit.Value;
  ModValue();
end;

procedure TfrmItemSet.EditHelMetDCAddValueRateChange(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.nHelMetDCAddValueRate:=EditHelMetDCAddValueRate.Value;
  ModValue();
end;

procedure TfrmItemSet.EditHelMetMCAddValueMaxLimitChange(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.nHelMetMCAddValueMaxLimit:=EditHelMetMCAddValueMaxLimit.Value;
  ModValue();
end;

procedure TfrmItemSet.EditHelMetMCAddValueRateChange(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.nHelMetMCAddValueRate:=EditHelMetMCAddValueRate.Value;
  ModValue();
end;

procedure TfrmItemSet.EditHelMetSCAddValueMaxLimitChange(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.nHelMetSCAddValueMaxLimit:=EditHelMetSCAddValueMaxLimit.Value;
  ModValue();
end;

procedure TfrmItemSet.EditHelMetSCAddValueRateChange(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.nHelMetSCAddValueRate:=EditHelMetSCAddValueRate.Value;
  ModValue();
end;
procedure TfrmItemSet.EditHelMetDCAddRateChange(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.nHelMetDCAddRate:=EditHelMetDCAddRate.Value;
  ModValue();
end;

procedure TfrmItemSet.EditHelMetMCAddRateChange(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.nHelMetMCAddRate:=EditHelMetMCAddRate.Value;
  ModValue();
end;

procedure TfrmItemSet.EditHelMetSCAddRateChange(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.nHelMetSCAddRate:=EditHelMetSCAddRate.Value;
  ModValue();
end;

procedure TfrmItemSet.EditGuildRecallTimeChange(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.nGuildRecallTime:=EditGuildRecallTime.Value;
  ModValue();
end;

procedure TfrmItemSet.ButtonUnKnowItemSaveClick(Sender: TObject);
begin
  Config.WriteInteger('Setup','UnknowRingDCAddValueMinLimit', g_Config.nUnknowRingDCAddValueMinLimit);
  Config.WriteInteger('Setup','UnknowRingDCAddValueMaxLimit', g_Config.nUnknowRingDCAddValueMaxLimit);
  Config.WriteInteger('Setup','UnknowRingMCAddValueMinLimit', g_Config.nUnknowRingMCAddValueMinLimit);
  Config.WriteInteger('Setup','UnknowRingMCAddValueMaxLimit', g_Config.nUnknowRingMCAddValueMaxLimit);
  Config.WriteInteger('Setup','UnknowRingSCAddValueMinLimit', g_Config.nUnknowRingSCAddValueMinLimit);
  Config.WriteInteger('Setup','UnknowRingSCAddValueMaxLimit', g_Config.nUnknowRingSCAddValueMaxLimit);

  Config.WriteInteger('Setup','UnknowNecklaceACAddValueMinLimit', g_Config.nUnknowNecklaceACAddValueMinLimit);
  Config.WriteInteger('Setup','UnknowNecklaceACAddValueMaxLimit', g_Config.nUnknowNecklaceACAddValueMaxLimit);
  Config.WriteInteger('Setup','UnknowNecklaceMACAddValueMinLimit', g_Config.nUnknowNecklaceMACAddValueMinLimit);
  Config.WriteInteger('Setup','UnknowNecklaceMACAddValueMaxLimit', g_Config.nUnknowNecklaceMACAddValueMaxLimit);
  Config.WriteInteger('Setup','UnknowNecklaceDCAddValueMinLimit', g_Config.nUnknowNecklaceDCAddValueMinLimit);
  Config.WriteInteger('Setup','UnknowNecklaceDCAddValueMaxLimit', g_Config.nUnknowNecklaceDCAddValueMaxLimit);
  Config.WriteInteger('Setup','UnknowNecklaceMCAddValueMinLimit', g_Config.nUnknowNecklaceMCAddValueMinLimit);
  Config.WriteInteger('Setup','UnknowNecklaceMCAddValueMaxLimit', g_Config.nUnknowNecklaceMCAddValueMaxLimit);
  Config.WriteInteger('Setup','UnknowNecklaceSCAddValueMinLimit', g_Config.nUnknowNecklaceSCAddValueMinLimit);
  Config.WriteInteger('Setup','UnknowNecklaceSCAddValueMaxLimit', g_Config.nUnknowNecklaceSCAddValueMaxLimit);


  Config.WriteInteger('Setup','UnknowHelMetACAddValueMin1Limit', g_Config.nUnknowHelMetACAddValueMin1Limit);
  Config.WriteInteger('Setup','UnknowHelMetACAddValueMax1Limit', g_Config.nUnknowHelMetACAddValueMax1Limit);
  Config.WriteInteger('Setup','UnknowHelMetACAddValueMin2Limit', g_Config.nUnknowHelMetACAddValueMin2Limit);
  Config.WriteInteger('Setup','UnknowHelMetACAddValueMax2Limit', g_Config.nUnknowHelMetACAddValueMax2Limit);

  Config.WriteInteger('Setup','UnknowHelMetMACAddValueMinLimit', g_Config.nUnknowHelMetMACAddValueMinLimit);
  Config.WriteInteger('Setup','UnknowHelMetMACAddValueMaxLimit', g_Config.nUnknowHelMetMACAddValueMaxLimit);

  Config.WriteInteger('Setup','UnknowHelMetDCAddValueMinLimit', g_Config.nUnknowHelMetDCAddValueMinLimit);
  Config.WriteInteger('Setup','UnknowHelMetDCAddValueMaxLimit', g_Config.nUnknowHelMetDCAddValueMaxLimit);
  Config.WriteInteger('Setup','UnknowHelMetMCAddValueMinLimit', g_Config.nUnknowHelMetMCAddValueMinLimit);
  Config.WriteInteger('Setup','UnknowHelMetMCAddValueMaxLimit', g_Config.nUnknowHelMetMCAddValueMaxLimit);
  Config.WriteInteger('Setup','UnknowHelMetSCAddRate', g_Config.nUnknowHelMetSCAddValueMinLimit);
  Config.WriteInteger('Setup','UnknowHelMetSCAddValueMaxLimit', g_Config.nUnknowHelMetSCAddValueMaxLimit);
  uModValue();
end;

procedure TfrmItemSet.RefUnknowItem;
begin
  EditUnknowRingDCAddValueMinLimit.Value:=g_Config.nUnknowRingDCAddValueMinLimit;
  EditUnknowRingDCAddValueMaxLimit.Value:=g_Config.nUnknowRingDCAddValueMaxLimit;

  EditUnknowRingMCAddValueMinLimit.Value:=g_Config.nUnknowRingMCAddValueMinLimit;
  EditUnknowRingMCAddValueMaxLimit.Value:=g_Config.nUnknowRingMCAddValueMaxLimit;

  EditUnknowRingSCAddValueMinLimit.Value:=g_Config.nUnknowRingSCAddValueMinLimit;
  EditUnknowRingSCAddValueMaxLimit.Value:=g_Config.nUnknowRingSCAddValueMaxLimit;


  EditUnknowNecklaceACAddValueMinLimit.Value:=g_Config.nUnknowNecklaceACAddValueMinLimit;
  EditUnknowNecklaceACAddValueMaxLimit.Value:=g_Config.nUnknowNecklaceACAddValueMaxLimit;

  EditUnknowNecklaceMACAddValueMinLimit.Value:=g_Config.nUnknowNecklaceMACAddValueMinLimit;
  EditUnknowNecklaceMACAddValueMaxLimit.Value:=g_Config.nUnknowNecklaceMACAddValueMaxLimit;


  EditUnknowNecklaceDCAddValueMinLimit.Value:=g_Config.nUnknowNecklaceDCAddValueMinLimit;
  EditUnknowNecklaceDCAddValueMaxLimit.Value:=g_Config.nUnknowNecklaceDCAddValueMaxLimit;

  EditUnknowNecklaceMCAddValueMinLimit.Value:=g_Config.nUnknowNecklaceMCAddValueMinLimit;
  EditUnknowNecklaceMCAddValueMaxLimit.Value:=g_Config.nUnknowNecklaceMCAddValueMaxLimit;

  EditUnknowNecklaceSCAddValueMinLimit.Value:=g_Config.nUnknowNecklaceSCAddValueMinLimit;
  EditUnknowNecklaceSCAddValueMaxLimit.Value:=g_Config.nUnknowNecklaceSCAddValueMaxLimit;



  EditUnknowHelMetDCAddValueMaxLimit.Value:=g_Config.nUnknowHelMetDCAddValueMaxLimit;
  EditUnknowHelMetDCAddValueMinLimit.Value:=g_Config.nUnknowHelMetDCAddValueMinLimit;
  EditUnknowHelMetMCAddValueMaxLimit.Value:=g_Config.nUnknowHelMetMCAddValueMaxLimit;
  EditUnknowHelMetMCAddValueMinLimit.Value:=g_Config.nUnknowHelMetMCAddValueMinLimit;
  EditUnknowHelMetSCAddValueMinLimit.Value:=g_Config.nUnknowHelMetSCAddValueMinLimit;
  EditUnknowHelMetSCAddValueMaxLimit.Value:=g_Config.nUnknowHelMetSCAddValueMaxLimit;


  EditUnknowHelMetACAddValueMin1Limit.Value:=g_Config.nUnknowHelMetACAddValueMin1Limit;
  EditUnknowHelMetACAddValueMax1Limit.Value:=g_Config.nUnknowHelMetACAddValueMax1Limit;
  EditUnknowHelMetACAddValueMin2Limit.Value:=g_Config.nUnknowHelMetACAddValueMin2Limit;
  EditUnknowHelMetACAddValueMax2Limit.Value:=g_Config.nUnknowHelMetACAddValueMax2Limit;

  EditUnknowHelMetMACAddValueMinLimit.Value:=g_Config.nUnknowHelMetMACAddValueMinLimit;
  EditUnknowHelMetMACAddValueMaxLimit.Value:=g_Config.nUnknowHelMetMACAddValueMaxLimit;

end;


procedure TfrmItemSet.EditUnknowRingDCAddValueMaxLimitChange(
  Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.nUnknowRingDCAddValueMaxLimit:=EditUnknowRingDCAddValueMaxLimit.Value;
  ModValue();
end;

procedure TfrmItemSet.EditUnknowRingDCAddValueMinLimitChange(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.nUnknowRingDCAddValueMinLimit:=EditUnknowRingDCAddValueMinLimit.Value;
  ModValue();
end;

procedure TfrmItemSet.EditUnknowRingMCAddValueMaxLimitChange(
  Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.nUnknowRingMCAddValueMaxLimit:=EditUnknowRingMCAddValueMaxLimit.Value;
  ModValue();
end;

procedure TfrmItemSet.EditUnknowRingMCAddValueMinLimitChange(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.nUnknowRingMCAddValueMinLimit:=EditUnknowRingMCAddValueMinLimit.Value;
  ModValue();
end;

procedure TfrmItemSet.EditUnknowRingSCAddValueMaxLimitChange(
  Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.nUnknowRingSCAddValueMaxLimit:=EditUnknowRingSCAddValueMaxLimit.Value;
  ModValue();
end;

procedure TfrmItemSet.EditUnknowRingSCAddValueMinLimitChange(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.nUnknowRingSCAddValueMinLimit:=EditUnknowRingSCAddValueMinLimit.Value;
  ModValue();
end;

procedure TfrmItemSet.EditUnknowNecklaceDCAddValueMaxLimitChange(
  Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.nUnknowNecklaceDCAddValueMaxLimit:=EditUnknowNecklaceDCAddValueMaxLimit.Value;
  ModValue();
end;

procedure TfrmItemSet.EditUnknowNecklaceDCAddValueMinLimitChange(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.nUnknowNecklaceDCAddValueMinLimit:=EditUnknowNecklaceDCAddValueMinLimit.Value;
  ModValue();
end;

procedure TfrmItemSet.EditUnknowNecklaceMCAddValueMaxLimitChange(
  Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.nUnknowNecklaceMCAddValueMaxLimit:=EditUnknowNecklaceMCAddValueMaxLimit.Value;
  ModValue();
end;

procedure TfrmItemSet.EditUnknowNecklaceMCAddValueMinLimitChange(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.nUnknowNecklaceMCAddValueMinLimit:=EditUnknowNecklaceMCAddValueMinLimit.Value;
  ModValue();
end;

procedure TfrmItemSet.EditUnknowNecklaceSCAddValueMaxLimitChange(
  Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.nUnknowNecklaceSCAddValueMaxLimit:=EditUnknowNecklaceSCAddValueMaxLimit.Value;
  ModValue();
end;

procedure TfrmItemSet.EditUnknowNecklaceSCAddValueMinLimitChange(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.nUnknowNecklaceSCAddValueMinLimit:=EditUnknowNecklaceSCAddValueMinLimit.Value;
  ModValue();
end;

procedure TfrmItemSet.EditUnknowNecklaceACAddValueMaxLimitChange(
  Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.nUnknowNecklaceACAddValueMaxLimit:=EditUnknowNecklaceACAddValueMaxLimit.Value;
  ModValue();
end;

procedure TfrmItemSet.EditUnknowNecklaceACAddValueMinLimitChange(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.nUnknowNecklaceACAddValueMinLimit:=EditUnknowNecklaceACAddValueMinLimit.Value;
  ModValue();
end;

procedure TfrmItemSet.EditUnknowNecklaceMACAddValueMaxLimitChange(
  Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.nUnknowNecklaceMACAddValueMaxLimit:=EditUnknowNecklaceMACAddValueMaxLimit.Value;
  ModValue();
end;

procedure TfrmItemSet.EditUnknowNecklaceMACAddValueMinLimitChange(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.nUnknowNecklaceMACAddValueMinLimit:=EditUnknowNecklaceMACAddValueMinLimit.Value;
  ModValue();
end;


procedure TfrmItemSet.EditUnknowHelMetDCAddValueMaxLimitChange(
  Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.nUnknowHelMetDCAddValueMaxLimit:=EditUnknowHelMetDCAddValueMaxLimit.Value;
  ModValue();
end;

procedure TfrmItemSet.EditUnknowHelMetDCAddValueMinLimitChange(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.nUnknowHelMetDCAddValueMinLimit:=EditUnknowHelMetDCAddValueMinLimit.Value;
  ModValue();
end;

procedure TfrmItemSet.EditUnknowHelMetMCAddValueMaxLimitChange(
  Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.nUnknowHelMetMCAddValueMaxLimit:=EditUnknowHelMetMCAddValueMaxLimit.Value;
  ModValue();
end;

procedure TfrmItemSet.EditUnknowHelMetMCAddValueMinLimitChange(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.nUnknowHelMetMCAddValueMinLimit:=EditUnknowHelMetMCAddValueMinLimit.Value;
  ModValue();
end;

procedure TfrmItemSet.EditUnknowHelMetSCAddValueMaxLimitChange(
  Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.nUnknowHelMetSCAddValueMaxLimit:=EditUnknowHelMetSCAddValueMaxLimit.Value;
  ModValue();
end;

procedure TfrmItemSet.EditUnknowHelMetSCAddValueMinLimitChange(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.nUnknowHelMetSCAddValueMinLimit:=EditUnknowHelMetSCAddValueMinLimit.Value;
  ModValue();
end;

procedure TfrmItemSet.EditUnknowHelMetACAddValueMin1LimitChange(
  Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.nUnknowHelMetACAddValueMin1Limit:=EditUnknowHelMetACAddValueMin1Limit.Value;
  ModValue();
end;

procedure TfrmItemSet.EditUnknowHelMetACAddValueMax1LimitChange(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.nUnknowHelMetACAddValueMax1Limit:=EditUnknowHelMetACAddValueMax1Limit.Value;
  ModValue();
end;

procedure TfrmItemSet.EditUnknowHelMetACAddValueMin2LimitChange(
  Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.nUnknowHelMetACAddValueMin2Limit:=EditUnknowHelMetACAddValueMin2Limit.Value;
  ModValue();
end;

procedure TfrmItemSet.EditUnknowHelMetACAddValueMax2LimitChange(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.nUnknowHelMetACAddValueMax2Limit:=EditUnknowHelMetACAddValueMax2Limit.Value;
  ModValue();
end;



procedure TfrmItemSet.EditUnknowHelMetMACAddValueMaxLimitChange(
  Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.nUnknowHelMetMACAddValueMaxLimit:=EditUnknowHelMetMACAddValueMaxLimit.Value;
  ModValue();
end;

procedure TfrmItemSet.EditUnknowHelMetMACAddValueMinLimitChange(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.nUnknowHelMetMACAddValueMinLimit:=EditUnknowHelMetMACAddValueMinLimit.Value;
  ModValue();
end;

procedure TfrmItemSet.RefShapeItem;
begin
  EditAttackPosionRate.Value:=g_Config.nAttackPosionRate;
  EditAttackPosionTime.Value:=g_Config.nAttackPosionTime;
  CheckBoxUserMoveCanDupObj.Checked:=g_Config.boUserMoveCanDupObj;
  CheckBoxUserMoveCanOnItem.Checked:=g_Config.boUserMoveCanOnItem;
  EditUserMoveTime.Value:=g_Config.dwUserMoveTime;
end;

procedure TfrmItemSet.EditAttackPosionRateChange(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.nAttackPosionRate:=EditAttackPosionRate.Value;
  ModValue();
end;

procedure TfrmItemSet.EditAttackPosionTimeChange(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.nAttackPosionTime:=EditAttackPosionTime.Value;
  ModValue();
end;

procedure TfrmItemSet.CheckBoxUserMoveCanDupObjClick(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.boUserMoveCanDupObj:=CheckBoxUserMoveCanDupObj.Checked;
  ModValue();
end;

procedure TfrmItemSet.CheckBoxUserMoveCanOnItemClick(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.boUserMoveCanOnItem:=CheckBoxUserMoveCanOnItem.Checked;
  ModValue();
end;

procedure TfrmItemSet.EditUserMoveTimeChange(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.dwUserMoveTime:=EditUserMoveTime.Value;
  ModValue();
end;

{---- Adjust global SVN revision ----}

initialization
  //SVNRevision('$Id: ItemSet.pas 404 2006-09-09 17:59:18Z damian $');
end.
