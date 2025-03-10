unit GameConfig;

interface

uses
  {svn, }Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Spin, Grids, ExtCtrls;

type
  TLevelExpScheme = (s_OldLevelExp,s_StdLevelExp,s_2Mult,s_5Mult,s_8Mult,s_10Mult,s_20Mult,s_30Mult,s_40Mult,s_50Mult,s_60Mult,s_70Mult,s_80Mult,s_90Mult,s_100Mult,s_150Mult,s_200Mult,s_250Mult,s_300Mult);
  TfrmGameConfig = class(TForm)
    GameConfigControl: TPageControl;
    GameSpeedSheet: TTabSheet;
    ButtonGameSpeedSave: TButton;
    ExpSheet: TTabSheet;
    GeneralSheet: TTabSheet;
    ButtonGeneralSave: TButton;
    GroupBox8: TGroupBox;
    Label23: TLabel;
    EditKillMonExpMultiple: TSpinEdit;
    CheckBoxHighLevelKillMonFixExp: TCheckBox;
    ButtonExpSave: TButton;
    CastleSheet: TTabSheet;
    ButtonCastleSave: TButton;
    TabSheet1: TTabSheet;
    ButtonOptionSave: TButton;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    GroupBox17: TGroupBox;
    CheckBoxDisHumRun: TCheckBox;
    CheckBoxRunHum: TCheckBox;
    CheckBoxRunMon: TCheckBox;
    CheckBoxWarDisHumRun: TCheckBox;
    CheckBoxRunNpc: TCheckBox;
    ButtonOptionSave3: TButton;
    ButtonOptionSave2: TButton;
    TabSheet4: TTabSheet;
    ButtonOptionSave0: TButton;
    TabSheet5: TTabSheet;
    ButtonMsgSave: TButton;
    TabSheet6: TTabSheet;
    ButtonTimeSave: TButton;
    TabSheet7: TTabSheet;
    ButtonPriceSave: TButton;
    TabSheet8: TTabSheet;
    ButtonMsgColorSave: TButton;
    TabSheet9: TTabSheet;
    ButtonHumanDieSave: TButton;
    CheckBoxGMRunAll: TCheckBox;
    TabSheet10: TTabSheet;
    ButtonCharStatusSave: TButton;
    ButtonGameSpeedDefault: TButton;
    CheckBoxRunGuard: TCheckBox;
    GroupBox6: TGroupBox;
    Label18: TLabel;
    Label19: TLabel;
    Label21: TLabel;
    EditShowLineNoticeTime: TSpinEdit;
    ComboBoxLineNoticeColor: TComboBox;
    EditLineNoticePreFix: TEdit;
    GroupBox51: TGroupBox;
    Label98: TLabel;
    Label99: TLabel;
    Label100: TLabel;
    EditSendOnlineCountRate: TSpinEdit;
    EditSendOnlineTime: TSpinEdit;
    CheckBoxSendOnlineCount: TCheckBox;
    GroupBox5: TGroupBox;
    Label17: TLabel;
    EditConsoleShowUserCountTime: TSpinEdit;
    GroupBoxInfo: TGroupBox;
    Label16: TLabel;
    EditSoftVersionDate: TEdit;
    GroupBox52: TGroupBox;
    Label101: TLabel;
    Label102: TLabel;
    Label103: TLabel;
    EditMonsterPowerRate: TSpinEdit;
    EditEditItemsPowerRate: TSpinEdit;
    EditItemsACPowerRate: TSpinEdit;
    GroupBox73: TGroupBox;
    CheckBoxCanOldClientLogon: TCheckBox;
    GroupBox35: TGroupBox;
    CheckBoxShowMakeItemMsg: TCheckBox;
    CbViewHack: TCheckBox;
    CkViewAdmfail: TCheckBox;
    CheckBoxShowExceptionMsg: TCheckBox;
    GroupBox9: TGroupBox;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    EditRepairDoorPrice: TSpinEdit;
    EditRepairWallPrice: TSpinEdit;
    EditHireArcherPrice: TSpinEdit;
    EditHireGuardPrice: TSpinEdit;
    GroupBox10: TGroupBox;
    Label31: TLabel;
    Label32: TLabel;
    EditCastleGoldMax: TSpinEdit;
    EditCastleOneDayGold: TSpinEdit;
    GroupBox13: TGroupBox;
    Label36: TLabel;
    EditTaxRate: TSpinEdit;
    CheckBoxGetAllNpcTax: TCheckBox;
    GroupBox14: TGroupBox;
    Label33: TLabel;
    EditCastleName: TEdit;
    GroupBox54: TGroupBox;
    Label107: TLabel;
    EditCastleMemberPriceRate: TSpinEdit;
    GroupBox11: TGroupBox;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    EditCastleHomeX: TSpinEdit;
    EditCastleHomeY: TSpinEdit;
    EditCastleHomeMap: TEdit;
    GroupBox36: TGroupBox;
    Label71: TLabel;
    Label72: TLabel;
    EditSayMsgMaxLen: TSpinEdit;
    EditSayRedMsgMaxLen: TSpinEdit;
    GroupBox37: TGroupBox;
    Label73: TLabel;
    EditCanShoutMsgLevel: TSpinEdit;
    GroupBox71: TGroupBox;
    CheckBoxShowPreFixMsg: TCheckBox;
    GroupBox68: TGroupBox;
    Label135: TLabel;
    Label138: TLabel;
    Label139: TLabel;
    Label140: TLabel;
    Label141: TLabel;
    EditSayMsgTime: TSpinEdit;
    EditSayMsgCount: TSpinEdit;
    EditDisableSayMsgTime: TSpinEdit;
    GroupBox38: TGroupBox;
    Label75: TLabel;
    CheckBoxShutRedMsgShowGMName: TCheckBox;
    EditGMRedMsgCmd: TEdit;
    GroupBox55: TGroupBox;
    Label108: TLabel;
    Label109: TLabel;
    LabeltHearMsgFColor: TLabel;
    LabelHearMsgBColor: TLabel;
    EditHearMsgFColor: TSpinEdit;
    EdittHearMsgBColor: TSpinEdit;
    GroupBox56: TGroupBox;
    Label110: TLabel;
    Label111: TLabel;
    LabelWhisperMsgFColor: TLabel;
    LabelWhisperMsgBColor: TLabel;
    EditWhisperMsgFColor: TSpinEdit;
    EditWhisperMsgBColor: TSpinEdit;
    GroupBox57: TGroupBox;
    Label112: TLabel;
    Label113: TLabel;
    LabelGMWhisperMsgFColor: TLabel;
    LabelGMWhisperMsgBColor: TLabel;
    EditGMWhisperMsgFColor: TSpinEdit;
    EditGMWhisperMsgBColor: TSpinEdit;
    GroupBox60: TGroupBox;
    Label124: TLabel;
    Label125: TLabel;
    LabelBlueMsgFColor: TLabel;
    LabelBlueMsgBColor: TLabel;
    EditBlueMsgFColor: TSpinEdit;
    EditBlueMsgBColor: TSpinEdit;
    GroupBox59: TGroupBox;
    Label120: TLabel;
    Label121: TLabel;
    LabelGreenMsgFColor: TLabel;
    LabelGreenMsgBColor: TLabel;
    EditGreenMsgFColor: TSpinEdit;
    EditGreenMsgBColor: TSpinEdit;
    GroupBox58: TGroupBox;
    Label116: TLabel;
    Label117: TLabel;
    LabelRedMsgFColor: TLabel;
    LabelRedMsgBColor: TLabel;
    EditRedMsgFColor: TSpinEdit;
    EditRedMsgBColor: TSpinEdit;
    GroupBox61: TGroupBox;
    Label128: TLabel;
    Label129: TLabel;
    LabelCryMsgFColor: TLabel;
    LabelCryMsgBColor: TLabel;
    EditCryMsgFColor: TSpinEdit;
    EditCryMsgBColor: TSpinEdit;
    GroupBox62: TGroupBox;
    Label132: TLabel;
    Label133: TLabel;
    LabelGuildMsgFColor: TLabel;
    LabelGuildMsgBColor: TLabel;
    EditGuildMsgFColor: TSpinEdit;
    EditGuildMsgBColor: TSpinEdit;
    GroupBox63: TGroupBox;
    Label136: TLabel;
    Label137: TLabel;
    LabelGroupMsgFColor: TLabel;
    LabelGroupMsgBColor: TLabel;
    EditGroupMsgFColor: TSpinEdit;
    EditGroupMsgBColor: TSpinEdit;
    GroupBox65: TGroupBox;
    Label122: TLabel;
    Label123: TLabel;
    LabelCustMsgFColor: TLabel;
    LabelCustMsgBColor: TLabel;
    EditCustMsgFColor: TSpinEdit;
    EditCustMsgBColor: TSpinEdit;
    GroupBox45: TGroupBox;
    Label87: TLabel;
    Label88: TLabel;
    EditHumanFreeDelayTime: TSpinEdit;
    GroupBox44: TGroupBox;
    Label85: TLabel;
    Label86: TLabel;
    EditSaveHumanRcdTime: TSpinEdit;
    GroupBox42: TGroupBox;
    Label81: TLabel;
    Label82: TLabel;
    EditCastleWarTime: TSpinEdit;
    GroupBox40: TGroupBox;
    Label76: TLabel;
    Label78: TLabel;
    EditStartCastlewarTime: TSpinEdit;
    GroupBox43: TGroupBox;
    Label83: TLabel;
    Label84: TLabel;
    EditGetCastleTime: TSpinEdit;
    GroupBox41: TGroupBox;
    Label79: TLabel;
    Label80: TLabel;
    EditShowCastleWarEndMsgTime: TSpinEdit;
    GroupBox70: TGroupBox;
    Label143: TLabel;
    Label144: TLabel;
    EditGuildWarTime: TSpinEdit;
    GroupBox46: TGroupBox;
    Label89: TLabel;
    Label90: TLabel;
    Label91: TLabel;
    Label92: TLabel;
    EditMakeGhostTime: TSpinEdit;
    EditClearDropOnFloorItemTime: TSpinEdit;
    GroupBox47: TGroupBox;
    Label93: TLabel;
    Label94: TLabel;
    EditFloorItemCanPickUpTime: TSpinEdit;
    GroupBox48: TGroupBox;
    Label95: TLabel;
    EditBuildGuildPrice: TSpinEdit;
    GroupBox49: TGroupBox;
    Label96: TLabel;
    EditGuildWarPrice: TSpinEdit;
    GroupBox50: TGroupBox;
    Label97: TLabel;
    EditMakeDurgPrice: TSpinEdit;
    GroupBox66: TGroupBox;
    Label126: TLabel;
    Label127: TLabel;
    EditSuperRepairPriceRate: TSpinEdit;
    EditRepairItemDecDura: TSpinEdit;
    GroupBox67: TGroupBox;
    CheckBoxKillByMonstDropUseItem: TCheckBox;
    CheckBoxKillByHumanDropUseItem: TCheckBox;
    CheckBoxDieScatterBag: TCheckBox;
    CheckBoxDieDropGold: TCheckBox;
    CheckBoxDieRedScatterBagAll: TCheckBox;
    GroupBox69: TGroupBox;
    Label130: TLabel;
    Label131: TLabel;
    Label134: TLabel;
    ScrollBarDieDropUseItemRate: TScrollBar;
    EditDieDropUseItemRate: TEdit;
    ScrollBarDieRedDropUseItemRate: TScrollBar;
    EditDieRedDropUseItemRate: TEdit;
    ScrollBarDieScatterBagRate: TScrollBar;
    EditDieScatterBagRate: TEdit;
    GroupBox28: TGroupBox;
    CheckBoxTestServer: TCheckBox;
    CheckBoxServiceMode: TCheckBox;
    CheckBoxVentureMode: TCheckBox;
    CheckBoxNonPKMode: TCheckBox;
    GroupBox29: TGroupBox;
    Label61: TLabel;
    Label62: TLabel;
    Label63: TLabel;
    EditTestLevel: TSpinEdit;
    EditTestGold: TSpinEdit;
    EditTestUserLimit: TSpinEdit;
    GroupBox34: TGroupBox;
    Label70: TLabel;
    EditTryModeLevel: TSpinEdit;
    CheckBoxTryModeUseStorage: TCheckBox;
    GroupBox33: TGroupBox;
    Label68: TLabel;
    Label69: TLabel;
    EditHumanMaxGold: TSpinEdit;
    EditHumanTryModeMaxGold: TSpinEdit;
    GroupBox30: TGroupBox;
    Label60: TLabel;
    EditStartPermission: TSpinEdit;
    GroupBox31: TGroupBox;
    Label64: TLabel;
    EditUserFull: TSpinEdit;
    GroupBox19: TGroupBox;
    Label41: TLabel;
    EditGroupMembersMax: TSpinEdit;
    GroupBox18: TGroupBox;
    Label40: TLabel;
    EditStartPointSize: TSpinEdit;
    GroupBox16: TGroupBox;
    Label39: TLabel;
    EditSafeZoneSize: TSpinEdit;
    GroupBox20: TGroupBox;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    EditRedHomeX: TSpinEdit;
    EditRedHomeY: TSpinEdit;
    EditRedHomeMap: TEdit;
    GroupBox21: TGroupBox;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    EditRedDieHomeX: TSpinEdit;
    EditRedDieHomeY: TSpinEdit;
    EditRedDieHomeMap: TEdit;
    GroupBox22: TGroupBox;
    Label48: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    EditHomeX: TSpinEdit;
    EditHomeY: TSpinEdit;
    EditHomeMap: TEdit;
    GroupBox32: TGroupBox;
    Label58: TLabel;
    Label65: TLabel;
    Label66: TLabel;
    Label56: TLabel;
    Label67: TLabel;
    Label114: TLabel;
    Label115: TLabel;
    CheckBoxKillHumanWinLevel: TCheckBox;
    CheckBoxKilledLostLevel: TCheckBox;
    CheckBoxKilledLostExp: TCheckBox;
    CheckBoxKillHumanWinExp: TCheckBox;
    EditKillHumanWinLevel: TSpinEdit;
    EditKilledLostLevel: TSpinEdit;
    EditKillHumanWinExp: TSpinEdit;
    EditKillHumanLostExp: TSpinEdit;
    EditHumanLevelDiffer: TSpinEdit;
    CheckBoxPKLevelProtect: TCheckBox;
    EditPKProtectLevel: TSpinEdit;
    EditRedPKProtectLevel: TSpinEdit;
    GroupBox23: TGroupBox;
    Label51: TLabel;
    Label52: TLabel;
    Label53: TLabel;
    EditDecPkPointTime: TSpinEdit;
    EditDecPkPointCount: TSpinEdit;
    GroupBox24: TGroupBox;
    Label54: TLabel;
    EditPKFlagTime: TSpinEdit;
    GroupBox25: TGroupBox;
    Label55: TLabel;
    EditKillHumanAddPKPoint: TSpinEdit;
    GroupBox53: TGroupBox;
    Label20: TLabel;
    Label104: TLabel;
    Label105: TLabel;
    Label106: TLabel;
    EditTryDealTime: TSpinEdit;
    EditDealOKTime: TSpinEdit;
    CheckBoxCanNotGetBackDeal: TCheckBox;
    CheckBoxDisableDeal: TCheckBox;
    GroupBox64: TGroupBox;
    Label118: TLabel;
    Label119: TLabel;
    EditCanDropPrice: TSpinEdit;
    CheckBoxControlDropItem: TCheckBox;
    EditCanDropGold: TSpinEdit;
    CheckBoxIsSafeDisableDrop: TCheckBox;
    GroupBox26: TGroupBox;
    Label57: TLabel;
    EditPosionDecHealthTime: TSpinEdit;
    GroupBox27: TGroupBox;
    Label59: TLabel;
    EditPosionDamagarmor: TSpinEdit;
    GroupBox72: TGroupBox;
    CheckBoxParalyCanRun: TCheckBox;
    CheckBoxParalyCanWalk: TCheckBox;
    CheckBoxParalyCanHit: TCheckBox;
    CheckBoxParalyCanSpell: TCheckBox;
    GroupBoxLevelExp: TGroupBox;
    Label37: TLabel;
    ComboBoxLevelExp: TComboBox;
    GridLevelExp: TStringGrid;
    GroupBox15: TGroupBox;
    CheckBoxSpellSendUpdateMsg: TCheckBox;
    CheckBoxActionSendActionMsg: TCheckBox;
    GroupBox7: TGroupBox;
    Label22: TLabel;
    EditStruckTime: TSpinEdit;
    CheckBoxDisableStruck: TCheckBox;
    CheckBoxDisableSelfStruck: TCheckBox;
    GroupBox4: TGroupBox;
    RadioButtonDelyMode: TRadioButton;
    RadioButtonFilterMode: TRadioButton;
    GroupBox3: TGroupBox;
    Label13: TLabel;
    EditItemSpeedTime: TSpinEdit;
    Checkr64dell: TCheckBox;
    GroupBox74: TGroupBox;
    Label15: TLabel;
    Label145: TLabel;
    LabelCustMsg1FColor: TLabel;
    LabelCustMsg1BColor: TLabel;
    EditCustMsg1FColor: TSpinEdit;
    EditCustMsg1BColor: TSpinEdit;
    GroupBox75: TGroupBox;
    CheckPKKDPoint: TCheckBox;
    GroupBox76: TGroupBox;
    EditFishDropRate: TSpinEdit;
    Label146: TLabel;
    GroupBox78: TGroupBox;
    Label149: TLabel;
    Label150: TLabel;
    EditChangeGameGoldRate: TEdit;
    EditChangeGoldRate: TEdit;
    GroupBox79: TGroupBox;
    Label151: TLabel;
    EditAllowGameGoldLevel: TEdit;
    TabSheet11: TTabSheet;
    GroupBox80: TGroupBox;
    Label152: TLabel;
    Label153: TLabel;
    Label154: TLabel;
    Label155: TLabel;
    Label156: TLabel;
    Label157: TLabel;
    EditGroupExpRate1: TEdit;
    EditGroupExpRate2: TEdit;
    EditGroupExpRate3: TEdit;
    EditGroupExpRate4: TEdit;
    EditGroupExpRate5: TEdit;
    EditGroupExpRate6: TEdit;
    Label158: TLabel;
    Label159: TLabel;
    Label160: TLabel;
    Label161: TLabel;
    Label162: TLabel;
    EditGroupExpRate7: TEdit;
    EditGroupExpRate8: TEdit;
    EditGroupExpRate9: TEdit;
    EditGroupExpRate10: TEdit;
    EditGroupExpRate11: TEdit;
    GroupExpRateSave: TButton;
    Label163: TLabel;
    GroupBox81: TGroupBox;
    Label164: TLabel;
    Label165: TLabel;
    SpinHourEvent: TSpinEdit;
    SpinMinEvent: TSpinEdit;
    CheckTimeEventUse: TCheckBox;
    EditStartCastlewarMin: TSpinEdit;
    Label166: TLabel;
    GroupBox12: TGroupBox;
    Label14: TLabel;
    EditNCastleName: TEdit;
    GroupBox39: TGroupBox;
    Label34: TLabel;
    Label35: TLabel;
    Label74: TLabel;
    EditNCastleHomeX: TSpinEdit;
    EditNCastleHomeY: TSpinEdit;
    EditNCastleHomeMap: TEdit;
    CastleWarDayGroup: TRadioGroup;
    EditGroupExpRate12: TEdit;
    EditGroupExpRate13: TEdit;
    lbl3: TLabel;
    lbl4: TLabel;
    grp1: TGroupBox;
    lbl1: TLabel;
    EditEatTick: TSpinEdit;
    grp2: TGroupBox;
    lbl2: TLabel;
    EditAllowPCPointLevel: TEdit;
    GroupBox77: TGroupBox;
    SpinWakeUp: TSpinEdit;
    Label77: TLabel;
    GroupBox82: TGroupBox;
    Label148: TLabel;
    Label167: TLabel;
    EditSuperPosion: TSpinEdit;
    CastleWarDayGroup2: TRadioGroup;
    CastleWarDayGroup3: TRadioGroup;
    GroupBox83: TGroupBox;
    Label168: TLabel;
    Label169: TLabel;
    Label170: TLabel;
    Label171: TLabel;
    SpinGroupHp: TSpinEdit;
    SpinGroupRecHp: TSpinEdit;
    SpinGroupExp: TSpinEdit;
    SpinGroupPo: TSpinEdit;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    EditCastleFlagTime: TSpinEdit;
    Label2: TLabel;
    procedure EditItemSpeedTimeChange(Sender: TObject);
    procedure ButtonGameSpeedSaveClick(Sender: TObject);
    procedure GameConfigControlChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure EditConsoleShowUserCountTimeChange(Sender: TObject);
    procedure EditShowLineNoticeTimeChange(Sender: TObject);
    procedure ComboBoxLineNoticeColorChange(Sender: TObject);
    procedure EditSoftVersionDateChange(Sender: TObject);
    procedure ButtonGeneralSaveClick(Sender: TObject);
    procedure EditLineNoticePreFixChange(Sender: TObject);
    procedure CheckBoxDisableStruckClick(Sender: TObject);
    procedure EditStruckTimeChange(Sender: TObject);
    procedure EditKillMonExpMultipleChange(Sender: TObject);
    procedure CheckBoxHighLevelKillMonFixExpClick(Sender: TObject);
    procedure ButtonExpSaveClick(Sender: TObject);
    procedure EditRepairDoorPriceChange(Sender: TObject);
    procedure EditRepairWallPriceChange(Sender: TObject);
    procedure EditHireArcherPriceChange(Sender: TObject);
    procedure EditHireGuardPriceChange(Sender: TObject);
    procedure EditCastleGoldMaxChange(Sender: TObject);
    procedure EditCastleOneDayGoldChange(Sender: TObject);
    procedure EditCastleHomeMapChange(Sender: TObject);
    procedure EditCastleHomeXChange(Sender: TObject);
    procedure EditCastleHomeYChange(Sender: TObject);
    procedure EditCastleNameChange(Sender: TObject);
    procedure CheckBoxGetAllNpcTaxClick(Sender: TObject);
    procedure EditTaxRateChange(Sender: TObject);
    procedure ButtonCastleSaveClick(Sender: TObject);
    procedure GridLevelExpSetEditText(Sender: TObject; ACol, ARow: Integer;
      const Value: String);
    procedure ComboBoxLevelExpClick(Sender: TObject);
    procedure CheckBoxDisHumRunClick(Sender: TObject);
    procedure ButtonOptionSaveClick(Sender: TObject);
    procedure CheckBoxRunHumClick(Sender: TObject);
    procedure CheckBoxRunMonClick(Sender: TObject);
    procedure CheckBoxWarDisHumRunClick(Sender: TObject);
    procedure CheckBoxRunNpcClick(Sender: TObject);
    procedure EditSafeZoneSizeChange(Sender: TObject);
    procedure EditStartPointSizeChange(Sender: TObject);
    procedure EditGroupMembersMaxChange(Sender: TObject);
    procedure EditRedHomeXChange(Sender: TObject);
    procedure EditRedHomeYChange(Sender: TObject);
    procedure EditRedHomeMapChange(Sender: TObject);
    procedure EditRedDieHomeMapChange(Sender: TObject);
    procedure EditRedDieHomeXChange(Sender: TObject);
    procedure EditRedDieHomeYChange(Sender: TObject);
    procedure ButtonOptionSave3Click(Sender: TObject);
    procedure EditHomeMapChange(Sender: TObject);
    procedure EditHomeXChange(Sender: TObject);
    procedure EditHomeYChange(Sender: TObject);
    procedure EditDecPkPointTimeChange(Sender: TObject);
    procedure EditDecPkPointCountChange(Sender: TObject);
    procedure EditPKFlagTimeChange(Sender: TObject);
    procedure EditKillHumanAddPKPointChange(Sender: TObject);
    procedure ButtonOptionSave2Click(Sender: TObject);
    procedure EditPosionDecHealthTimeChange(Sender: TObject);
    procedure EditPosionDamagarmorChange(Sender: TObject);
    procedure CheckBoxTestServerClick(Sender: TObject);
    procedure CheckBoxServiceModeClick(Sender: TObject);
    procedure CheckBoxVentureModeClick(Sender: TObject);
    procedure CheckBoxNonPKModeClick(Sender: TObject);
    procedure EditTestLevelChange(Sender: TObject);
    procedure EditTestGoldChange(Sender: TObject);
    procedure EditTestUserLimitChange(Sender: TObject);
    procedure EditStartPermissionChange(Sender: TObject);
    procedure EditUserFullChange(Sender: TObject);
    procedure ButtonOptionSave0Click(Sender: TObject);
    procedure CheckBoxKillHumanWinLevelClick(Sender: TObject);
    procedure CheckBoxKilledLostLevelClick(Sender: TObject);
    procedure CheckBoxKillHumanWinExpClick(Sender: TObject);
    procedure CheckBoxKilledLostExpClick(Sender: TObject);
    procedure EditKillHumanWinLevelChange(Sender: TObject);
    procedure EditKilledLostLevelChange(Sender: TObject);
    procedure EditKillHumanWinExpChange(Sender: TObject);
    procedure EditKillHumanLostExpChange(Sender: TObject);
    procedure EditHumanLevelDifferChange(Sender: TObject);
    procedure EditHumanMaxGoldChange(Sender: TObject);
    procedure EditHumanTryModeMaxGoldChange(Sender: TObject);
    procedure EditTryModeLevelChange(Sender: TObject);
    procedure CheckBoxTryModeUseStorageClick(Sender: TObject);
    procedure CheckBoxShowMakeItemMsgClick(Sender: TObject);
    procedure CbViewHackClick(Sender: TObject);
    procedure CkViewAdmfailClick(Sender: TObject);
    procedure EditSayMsgMaxLenChange(Sender: TObject);
    procedure EditSayRedMsgMaxLenChange(Sender: TObject);
    procedure EditCanShoutMsgLevelChange(Sender: TObject);
    procedure CheckBoxShutRedMsgShowGMNameClick(Sender: TObject);
    procedure EditGMRedMsgCmdChange(Sender: TObject);
    procedure ButtonMsgSaveClick(Sender: TObject);
    procedure EditStartCastleWarDaysChange(Sender: TObject);
    procedure EditStartCastlewarTimeChange(Sender: TObject);
    procedure EditShowCastleWarEndMsgTimeChange(Sender: TObject);
    procedure EditCastleWarTimeChange(Sender: TObject);
    procedure EditMakeGhostTimeChange(Sender: TObject);
    procedure EditClearDropOnFloorItemTimeChange(Sender: TObject);
    procedure EditSaveHumanRcdTimeChange(Sender: TObject);
    procedure EditHumanFreeDelayTimeChange(Sender: TObject);
    procedure EditFloorItemCanPickUpTimeChange(Sender: TObject);
    procedure ButtonTimeSaveClick(Sender: TObject);
    procedure EditBuildGuildPriceChange(Sender: TObject);
    procedure EditGuildWarPriceChange(Sender: TObject);
    procedure EditMakeDurgPriceChange(Sender: TObject);
    procedure ButtonPriceSaveClick(Sender: TObject);
    procedure CheckBoxSendOnlineCountClick(Sender: TObject);
    procedure EditSendOnlineCountRateChange(Sender: TObject);
    procedure EditSendOnlineTimeChange(Sender: TObject);
    procedure EditMonsterPowerRateChange(Sender: TObject);
    procedure EditEditItemsPowerRateChange(Sender: TObject);
    procedure EditItemsACPowerRateChange(Sender: TObject);
    procedure EditTryDealTimeChange(Sender: TObject);
    procedure EditDealOKTimeChange(Sender: TObject);
    procedure EditCastleMemberPriceRateChange(Sender: TObject);
    procedure EditHearMsgFColorChange(Sender: TObject);
    procedure EdittHearMsgBColorChange(Sender: TObject);
    procedure EditWhisperMsgFColorChange(Sender: TObject);
    procedure EditWhisperMsgBColorChange(Sender: TObject);
    procedure EditGMWhisperMsgFColorChange(Sender: TObject);
    procedure EditGMWhisperMsgBColorChange(Sender: TObject);
    procedure EditRedMsgFColorChange(Sender: TObject);
    procedure EditRedMsgBColorChange(Sender: TObject);
    procedure EditGreenMsgFColorChange(Sender: TObject);
    procedure EditGreenMsgBColorChange(Sender: TObject);
    procedure EditBlueMsgFColorChange(Sender: TObject);
    procedure EditBlueMsgBColorChange(Sender: TObject);
    procedure EditCryMsgFColorChange(Sender: TObject);
    procedure EditCryMsgBColorChange(Sender: TObject);
    procedure EditGuildMsgFColorChange(Sender: TObject);
    procedure EditGuildMsgBColorChange(Sender: TObject);
    procedure EditGroupMsgFColorChange(Sender: TObject);
    procedure EditGroupMsgBColorChange(Sender: TObject);
    procedure ButtonMsgColorSaveClick(Sender: TObject);
    procedure CheckBoxPKLevelProtectClick(Sender: TObject);
    procedure EditPKProtectLevelChange(Sender: TObject);
    procedure EditRedPKProtectLevelChange(Sender: TObject);
    procedure CheckBoxDisableSelfStruckClick(Sender: TObject);
    procedure CheckBoxCanNotGetBackDealClick(Sender: TObject);
    procedure CheckBoxDisableDealClick(Sender: TObject);
    procedure CheckBoxControlDropItemClick(Sender: TObject);
    procedure EditCanDropPriceChange(Sender: TObject);
    procedure EditCanDropGoldChange(Sender: TObject);
    procedure CheckBoxIsSafeDisableDropClick(Sender: TObject);
    procedure EditCustMsgFColorChange(Sender: TObject);
    procedure EditCustMsgBColorChange(Sender: TObject);
    procedure EditSuperRepairPriceRateChange(Sender: TObject);
    procedure EditRepairItemDecDuraChange(Sender: TObject);
    procedure ButtonHumanDieSaveClick(Sender: TObject);
    procedure ScrollBarDieDropUseItemRateChange(Sender: TObject);
    procedure ScrollBarDieRedDropUseItemRateChange(Sender: TObject);
    procedure ScrollBarDieScatterBagRateChange(Sender: TObject);
    procedure CheckBoxKillByMonstDropUseItemClick(Sender: TObject);
    procedure CheckBoxKillByHumanDropUseItemClick(Sender: TObject);
    procedure CheckBoxDieScatterBagClick(Sender: TObject);
    procedure CheckBoxDieDropGoldClick(Sender: TObject);
    procedure CheckBoxDieRedScatterBagAllClick(Sender: TObject);
    procedure CheckBoxGMRunAllClick(Sender: TObject);
    procedure EditSayMsgTimeChange(Sender: TObject);
    procedure EditSayMsgCountChange(Sender: TObject);
    procedure EditDisableSayMsgTimeChange(Sender: TObject);
    procedure EditGuildWarTimeChange(Sender: TObject);
    procedure CheckBoxShowPreFixMsgClick(Sender: TObject);
    procedure CheckBoxShowExceptionMsgClick(Sender: TObject);
    procedure CheckBoxParalyCanRunClick(Sender: TObject);
    procedure CheckBoxParalyCanWalkClick(Sender: TObject);
    procedure CheckBoxParalyCanHitClick(Sender: TObject);
    procedure CheckBoxParalyCanSpellClick(Sender: TObject);
    procedure ButtonCharStatusSaveClick(Sender: TObject);
    procedure ButtonGameSpeedDefaultClick(Sender: TObject);
    procedure CheckBoxCanOldClientLogonClick(Sender: TObject);
    procedure CheckBoxSpellSendUpdateMsgClick(Sender: TObject);
    procedure CheckBoxActionSendActionMsgClick(Sender: TObject);
    procedure EditTestLevelKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CheckBoxRunGuardClick(Sender: TObject);
    procedure Checkr64dellClick(Sender: TObject);
    procedure EditCustMsg1FColorChange(Sender: TObject);
    procedure EditCustMsg1BColorChange(Sender: TObject);
    procedure CheckPKKDPointClick(Sender: TObject);
    procedure EditFishDropRateChange(Sender: TObject);
    procedure EditChangeGameGoldRateChange(Sender: TObject);
    procedure EditChangeGoldRateChange(Sender: TObject);
    procedure EditAllowGameGoldLevelChange(Sender: TObject);
    procedure EditGroupExpRate1Change(Sender: TObject);
    procedure EditGroupExpRate2Change(Sender: TObject);
    procedure EditGroupExpRate3Change(Sender: TObject);
    procedure EditGroupExpRate4Change(Sender: TObject);
    procedure EditGroupExpRate5Change(Sender: TObject);
    procedure EditGroupExpRate6Change(Sender: TObject);
    procedure EditGroupExpRate7Change(Sender: TObject);
    procedure EditGroupExpRate8Change(Sender: TObject);
    procedure EditGroupExpRate9Change(Sender: TObject);
    procedure EditGroupExpRate10Change(Sender: TObject);
    procedure EditGroupExpRate11Change(Sender: TObject);
    procedure GroupExpRateSaveClick(Sender: TObject);
    procedure CheckTimeEventUseClick(Sender: TObject);
    procedure SpinHourEventChange(Sender: TObject);
    procedure SpinMinEventChange(Sender: TObject);
    procedure EditStartCastlewarMinChange(Sender: TObject);
    procedure EditNCastleNameChange(Sender: TObject);
    procedure EditNCastleHomeMapChange(Sender: TObject);
    procedure EditNCastleHomeXChange(Sender: TObject);
    procedure EditNCastleHomeYChange(Sender: TObject);
    procedure CastleWarDayGroupClick(Sender: TObject);
    procedure EditGroupExpRate12Change(Sender: TObject);
    procedure EditGroupExpRate13Change(Sender: TObject);
    procedure EditEatTickChange(Sender: TObject);
    procedure EditAllowPCPointLevelChange(Sender: TObject);
    procedure SpinWakeUpChange(Sender: TObject);
    procedure EditSuperPosionChange(Sender: TObject);
    procedure CastleWarDayGroup2Click(Sender: TObject);
    procedure CastleWarDayGroup3Click(Sender: TObject);
    procedure SpinGroupHpChange(Sender: TObject);
    procedure SpinGroupRecHpChange(Sender: TObject);
    procedure SpinGroupExpChange(Sender: TObject);
    procedure SpinGroupPoChange(Sender: TObject);
    procedure EditCastleFlagTimeChange(Sender: TObject);
  private
    boOpened:Boolean;
    boModValued:Boolean;
    procedure ModValue();
    procedure uModValue();
    procedure RefGameSpeedConf();
    procedure RefCharStatusConf();
    procedure RefGameVarConf();
    { Private declarations }
  public
    procedure Open();
    { Public declarations }
  end;

var
  frmGameConfig: TfrmGameConfig;

implementation

uses M2Share, HUtil32, SDK;

{$R *.dfm}

{ TfrmGameConfig }

procedure TfrmGameConfig.FormCreate(Sender: TObject);
var
  I: Integer;
begin
  ComboBoxLineNoticeColor.Items.Add('Custom');
  ComboBoxLineNoticeColor.Items.Add('Clear');
  ComboBoxLineNoticeColor.Items.Add('Blue');
  GridLevelExp.ColWidths[0]:=30;
  GridLevelExp.ColWidths[1]:=100;
  GridLevelExp.Cells[0,0]:='等级';
  GridLevelExp.Cells[1,0]:='需要经验值';
  for I := 1 to GridLevelExp.RowCount - 1 do begin
    GridLevelExp.Cells[0,I]:=IntToStr(I);
  end;

  ComboBoxLevelExp.AddItem('Old',TObject(s_OldLevelExp));
  ComboBoxLevelExp.AddItem('Standard',TObject(s_StdLevelExp));
  ComboBoxLevelExp.AddItem('1/2 Current',TObject(s_2Mult));
  ComboBoxLevelExp.AddItem('1/5 Current',TObject(s_5Mult));
  ComboBoxLevelExp.AddItem('1/8 Current',TObject(s_8Mult));
  ComboBoxLevelExp.AddItem('1/10 Current',TObject(s_10Mult));
  ComboBoxLevelExp.AddItem('1/20 Current',TObject(s_20Mult));
  ComboBoxLevelExp.AddItem('1/30 Current',TObject(s_30Mult));
  ComboBoxLevelExp.AddItem('1/40 Current',TObject(s_40Mult));
  ComboBoxLevelExp.AddItem('1/50 Current',TObject(s_50Mult));
  ComboBoxLevelExp.AddItem('1/60 Current',TObject(s_60Mult));
  ComboBoxLevelExp.AddItem('1/70 Current',TObject(s_70Mult));
  ComboBoxLevelExp.AddItem('1/80 Current',TObject(s_80Mult));
  ComboBoxLevelExp.AddItem('1/90 Current',TObject(s_90Mult));
  ComboBoxLevelExp.AddItem('1/100 Current',TObject(s_100Mult));
  ComboBoxLevelExp.AddItem('1/150 Current',TObject(s_150Mult));
  ComboBoxLevelExp.AddItem('1/200 Current',TObject(s_200Mult));
  ComboBoxLevelExp.AddItem('1/250 Current',TObject(s_250Mult));
  ComboBoxLevelExp.AddItem('1/300 Current',TObject(s_300Mult));

  EditSoftVersionDate.Hint:='访问服务器需要运行的客户端版本号。当前版本: dd/mm/yyyy';
  EditConsoleShowUserCountTime.Hint:='显示用户计数的频率 - 默认为10分钟(600)';
  EditShowLineNoticeTime.Hint:='广播之间的时间 - 默认为300秒(5 分钟)';
  ComboBoxLineNoticeColor.Hint:='在线通知的颜色 - 默认为蓝色';
  EditLineNoticePreFix.Hint:='系统发言的前缀是符号[!]';

  EditStruckTime.Hint:='击中命中时晕眩 - 默认 - 100';
  CheckBoxDisableStruck.Hint:='禁用能够击中自己';

  GridLevelExp.Hint:='升级所需的经验值';
  ComboBoxLevelExp.Hint:='批量修改升级所需的经验值';
  EditKillMonExpMultiple.Hint:='杀怪基本经验值的倍数 - 基本经验值乘以经验的倍数';
  CheckBoxHighLevelKillMonFixExp.Hint:='怪物的等级和自身的等级超过10级无效(检查时不适用)';
  EditRepairDoorPrice.Hint:='维修城堡门的费用(默认: 2M)';
  EditRepairWallPrice.Hint:='维修城堡城墙的费用(默认: 500000)';
  EditHireArcherPrice.Hint:='雇用弓箭手的费用(默认: 300000)';
  EditHireGuardPrice.Hint:='雇用守卫的费用(默认: 300000)';
  EditCastleGoldMax.Hint:='城堡允许储存的最大金币数 (默认: 10M)';
  EditCastleOneDayGold.Hint:='城堡允许储存的最小金币数(默认: 2M)';
  EditCastleHomeMap.Hint:='战争与城堡地图 (默认: 3)';
  EditCastleHomeX.Hint:='城堡战争的回城点X坐标(默认: 644)';
  EditCastleHomeY.Hint:='城堡战争的回城点Y坐标(默认: 290)';
  EditCastleName.Hint:='战争城堡的名字';
  CheckBoxGetAllNpcTax.Hint:='按设定金额向所有NPC征税，以便为城堡增加资金';
  EditTaxRate.Hint:='征收货物的税率 5=0.5% (默认: 5)';
end;

procedure TfrmGameConfig.GameConfigControlChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  if boModValued then begin
    if Application.MessageBox('保存修改 (关闭将取消修改)?','确认信息',MB_YESNO + MB_ICONQUESTION) = IDYES then begin
      uModValue
    end else AllowChange:=False;
  end;
end;
procedure TfrmGameConfig.ModValue;
begin
  boModValued:=True;
  ButtonGameSpeedSave.Enabled:=True;
  ButtonGeneralSave.Enabled:=True;
  ButtonExpSave.Enabled:=True;
  ButtonCastleSave.Enabled:=True;
  ButtonOptionSave0.Enabled:=True;
  ButtonOptionSave.Enabled:=True;
  ButtonOptionSave2.Enabled:=True;
  ButtonOptionSave3.Enabled:=True;
  ButtonTimeSave.Enabled:=True;
  ButtonPriceSave.Enabled:=True;
  ButtonMsgSave.Enabled:=True;
  ButtonMsgColorSave.Enabled:=True;
  ButtonHumanDieSave.Enabled:=True;
  ButtonCharStatusSave.Enabled:=True;
  GroupExpRateSave.Enabled := True;
end;

procedure TfrmGameConfig.uModValue;
begin
  boModValued:=False;
  ButtonGameSpeedSave.Enabled:=False;
  ButtonGeneralSave.Enabled:=False;
  ButtonExpSave.Enabled:=False;
  ButtonCastleSave.Enabled:=False;
  ButtonOptionSave0.Enabled:=False;
  ButtonOptionSave.Enabled:=False;
  ButtonOptionSave2.Enabled:=False;
  ButtonOptionSave3.Enabled:=False;
  ButtonTimeSave.Enabled:=False;
  ButtonPriceSave.Enabled:=False;
  ButtonMsgSave.Enabled:=False;
  ButtonMsgColorSave.Enabled:=False;
  ButtonHumanDieSave.Enabled:=False;
  ButtonCharStatusSave.Enabled:=False;
  GroupExpRateSave.Enabled := False;
end;

procedure TfrmGameConfig.Open;
var
  I: Integer;
begin
  boOpened:=False;
  uModValue();
  RefGameSpeedConf();


  EditKillMonExpMultiple.Value:=g_Config.dwKillMonExpMultiple;
  CheckBoxHighLevelKillMonFixExp.Checked:=g_Config.boHighLevelKillMonFixExp;

  EditRepairDoorPrice.Value:=g_Config.nRepairDoorPrice;
  EditRepairWallPrice.Value:=g_Config.nRepairWallPrice;
  EditHireArcherPrice.Value:=g_Config.nHireArcherPrice;
  EditHireGuardPrice.Value:=g_Config.nHireGuardPrice;

  EditCastleGoldMax.Value:=g_Config.nCastleGoldMax;
  EditCastleOneDayGold.Value:=g_Config.nCastleOneDayGold;
  EditCastleFlagTime.Value:=g_Config.dwCastleFlagRegenTime div (60 * 1000);

  EditCastleHomeMap.Text:=g_Config.sSabukCastleHomeMap;
  EditCastleHomeX.Value:=g_Config.nSabukCastleHomeX;
  EditCastleHomeY.Value:=g_Config.nSabukCastleHomeY;
  EditCastleName.Text:=g_Config.sSabukCastleName;

  EditNCastleHomeMap.Text:=g_Config.sNammanCastleHomeMap;
  EditNCastleHomeX.Value:=g_Config.nNammanCastleHomeX;
  EditNCastleHomeY.Value:=g_Config.nNammanCastleHomeY;
  EditNCastleName.Text:=g_Config.sNammanCastleName;

  CheckBoxGetAllNpcTax.Checked:=g_Config.boGetAllNpcTax;
  EditTaxRate.Value:=g_Config.nCastleTaxRate;

  for I := 1 to GridLevelExp.RowCount - 1 do begin
    GridLevelExp.Cells[1,I]:=IntToStr(g_Config.dwNeedExps[I]);
  end;
  GroupBoxLevelExp.Caption:=format('经验值设定(最高等级: %d)',[MAXUPLEVEL]);

  CheckBoxDisHumRun.Checked:= not g_Config.boDiableHumanRun;


  CheckBoxRunHum.Checked:=g_Config.boRunHuman;
  CheckBoxRunMon.Checked:=g_Config.boRunMon;
  CheckBoxRunNpc.Checked:=g_Config.boRunNpc;
  CheckBoxRunGuard.Checked:=g_Config.boRunGuard;
  CheckBoxWarDisHumRun.Checked:=g_Config.boWarDisHumRun;
  CheckBoxGMRunAll.Checked:=g_Config.boGMRunAll;
  CheckBoxDisHumRunClick(CheckBoxDisHumRun);

  EditSafeZoneSize.Value:=g_Config.nSafeZoneSize;
  EditStartPointSize.Value:=g_Config.nStartPointSize;
  EditGroupMembersMax.Value:=g_Config.nGroupMembersMax;

  EditRedHomeMap.Text:=g_Config.sRedHomeMap;
  EditRedHomeX.Value:=g_Config.nRedHomeX;
  EditRedHomeY.Value:=g_Config.nRedHomeY;

  EditRedDieHomeMap.Text:=g_Config.sRedDieHomeMap;
  EditRedDieHomeX.Value:=g_Config.nRedDieHomeX;
  EditRedDieHomeY.Value:=g_Config.nRedDieHomeY;

  EditHomeMap.Text:=g_Config.sHomeMap;
  EditHomeX.Value:=g_Config.nHomeX;
  EditHomeY.Value:=g_Config.nHomeY;

  EditDecPkPointTime.Value:=g_Config.dwDecPkPointTime div 1000;
  EditDecPkPointCount.Value:=g_Config.nDecPkPointCount;
  EditPKFlagTime.Value:=g_Config.dwPKFlagTime div 1000;
  EditKillHumanAddPKPoint.Value:=g_Config.nKillHumanAddPKPoint;

  EditPosionDecHealthTime.Value:=g_Config.dwPosionDecHealthTime;
  EditPosionDamagarmor.Value:=g_Config.nPosionDamagarmor;

  CheckBoxTestServer.Checked:=g_Config.boTestServer;
  CheckBoxServiceMode.Checked:=g_Config.boServiceMode;
  CheckBoxVentureMode.Checked:=g_Config.boVentureServer;
  CheckBoxNonPKMode.Checked:=g_Config.boNonPKServer;

  EditStartPermission.Value:=g_Config.nStartPermission;
  EditTestLevel.Value:=g_Config.nTestLevel;
  EditTestGold.Value:=g_Config.nTestGold;
  EditTestUserLimit.Value:=g_Config.nTestUserLimit;
  EditUserFull.Value:=g_Config.nUserFull;

  CheckBoxTestServerClick(CheckBoxTestServer);

  CheckBoxKillHumanWinLevel.Checked:=g_Config.boKillHumanWinLevel;
  CheckBoxKilledLostLevel.Checked:=g_Config.boKilledLostLevel;
  CheckPKKDPoint.Checked:=g_Config.boPKServer;     //懦单胶 葛靛
  CheckBoxKillHumanWinExp.Checked:=g_Config.boKillHumanWinExp;
  CheckBoxKilledLostExp.Checked:=g_Config.boKilledLostExp;
  EditKillHumanWinLevel.Value:=g_Config.nKillHumanWinLevel;
  EditKilledLostLevel.Value:=g_Config.nKilledLostLevel;
  EditKillHumanWinExp.Value:=g_Config.nKillHumanWinExp;
  EditKillHumanLostExp.Value:=g_Config.nKillHumanLostExp;
  EditHumanLevelDiffer.Value:=g_Config.nHumanLevelDiffer;

  CheckBoxKillHumanWinLevelClick(CheckBoxKillHumanWinLevel);
  CheckBoxKilledLostLevelClick(CheckBoxKilledLostLevel);
  CheckBoxKillHumanWinExpClick(CheckBoxKillHumanWinExp);
  CheckBoxKilledLostExpClick(CheckBoxKilledLostExp);

  EditHumanMaxGold.Value:=g_Config.nHumanMaxGold;
  EditHumanTryModeMaxGold.Value:=g_Config.nHumanTryModeMaxGold;
  EditTryModeLevel.Value:=g_Config.nTryModeLevel;
  CheckBoxTryModeUseStorage.Checked:=g_Config.boTryModeUseStorage;

  EditChangeGameGoldRate.Text:=FloatToStr(g_Config.nExChangeGameGoldRate);
  EditChangeGoldRate.Text:=intToStr(g_Config.nExChangeGoldRate);
  EditAllowGameGoldLevel.Text := intToStr(g_Config.nAllowGameGoldLevel);
  EditAllowPCPointLevel.Text := intToStr(g_Config.nAllowPCPointLevel);

  EditSayMsgMaxLen.Value:=g_Config.nSayMsgMaxLen;
  EditSayRedMsgMaxLen.Value:=g_Config.nSayRedMsgMaxLen;
  EditCanShoutMsgLevel.Value:=g_Config.nCanShoutMsgLevel;
  CheckBoxShutRedMsgShowGMName.Checked:=g_Config.boShutRedMsgShowGMName;
  CheckBoxShowPreFixMsg.Checked:=g_Config.boShowPreFixMsg;
  EditGMRedMsgCmd.Text:=g_GMRedMsgCmd;

  CastleWarDayGroup.ItemIndex := g_Config.nStartCastlewarDay[0];
  CastleWarDayGroup2.ItemIndex := g_Config.nStartCastlewarDay[1];
  CastleWarDayGroup3.ItemIndex := g_Config.nStartCastlewarDay[2];
  EditStartCastlewarTime.Value:=g_Config.nStartCastlewarTime;
  EditStartCastlewarMin.Value:=g_Config.nStartCastlewarMin;
  EditShowCastleWarEndMsgTime.Value:=g_Config.dwShowCastleWarEndMsgTime div (60 * 1000);
  EditCastleWarTime.Value:=g_Config.dwCastleWarTime div (60 * 1000);

  EditGuildWarTime.Value:=g_Config.dwGuildWarTime div (60 * 1000);
  EditMakeGhostTime.Value:=g_Config.dwMakeGhostTime div 1000;
  EditClearDropOnFloorItemTime.Value:=g_Config.dwClearDropOnFloorItemTime div 1000;
  EditSaveHumanRcdTime.Value:=g_Config.dwSaveHumanRcdTime div (60 * 1000);
  EditHumanFreeDelayTime.Value:=g_Config.dwHumanFreeDelayTime div (60 * 1000);
  EditFloorItemCanPickUpTime.Value:=g_Config.dwFloorItemCanPickUpTime div 1000;

  EditBuildGuildPrice.Value:=g_Config.nBuildGuildPrice;
  EditGuildWarPrice.Value:=g_Config.nGuildWarPrice;
  EditMakeDurgPrice.Value:=g_Config.nMakeDurgPrice;


  CheckTimeEventUse.Checked := g_Config.boTimeEventUse;
  SpinHourEvent.Value := g_Config.nHourEvent;
  SpinMinEvent.Value := g_Config.nMinEvent;
  SpinWakeUp.Value := g_Config.nWakeUpRate;

  EditTryDealTime.Value:=g_Config.dwTryDealTime div 1000;
  EditDealOKTime.Value:=g_Config.dwDealOKTime div 1000;

  EditCastleMemberPriceRate.Value:=g_Config.nCastleMemberPriceRate;

  EditHearMsgFColor.Value:=g_Config.btHearMsgFColor;
  EdittHearMsgBColor.Value:=g_Config.btHearMsgBColor;
  EditWhisperMsgFColor.Value:=g_Config.btWhisperMsgFColor;
  EditWhisperMsgBColor.Value:=g_Config.btWhisperMsgBColor;
  EditGMWhisperMsgFColor.Value:=g_Config.btGMWhisperMsgFColor;
  EditGMWhisperMsgBColor.Value:=g_Config.btGMWhisperMsgBColor;
  EditRedMsgFColor.Value:=g_Config.btRedMsgFColor;
  EditRedMsgBColor.Value:=g_Config.btRedMsgBColor;
  EditGreenMsgFColor.Value:=g_Config.btGreenMsgFColor;
  EditGreenMsgBColor.Value:=g_Config.btGreenMsgBColor;
  EditBlueMsgFColor.Value:=g_Config.btBlueMsgFColor;
  EditBlueMsgBColor.Value:=g_Config.btBlueMsgBColor;
  EditCryMsgFColor.Value:=g_Config.btCryMsgFColor;
  EditCryMsgBColor.Value:=g_Config.btCryMsgBColor;
  EditGuildMsgFColor.Value:=g_Config.btGuildMsgFColor;
  EditGuildMsgBColor.Value:=g_Config.btGuildMsgBColor;
  EditGroupMsgFColor.Value:=g_Config.btGroupMsgFColor;
  EditGroupMsgBColor.Value:=g_Config.btGroupMsgBColor;
  EditCustMsgFColor.Value:=g_Config.btCustMsgFColor;
  EditCustMsgBColor.Value:=g_Config.btCustMsgBColor;
  EditCustMsg1FColor.Value:=g_Config.btCustMsg1FColor;
  EditCustMsg1BColor.Value:=g_Config.btCustMsg1BColor;

  CheckBoxPKLevelProtect.Checked:=g_Config.boPKLevelProtect;
  EditPKProtectLevel.Value:=g_Config.nPKProtectLevel;
  EditRedPKProtectLevel.Value:=g_Config.nRedPKProtectLevel;
  CheckBoxPKLevelProtectClick(CheckBoxPKLevelProtect);

  CheckBoxCanNotGetBackDeal.Checked:=g_Config.boCanNotGetBackDeal;
  CheckBoxDisableDeal.Checked:=g_Config.boDisableDeal;
  CheckBoxControlDropItem.Checked:=g_Config.boControlDropItem;
  CheckBoxIsSafeDisableDrop.Checked:=g_Config.boInSafeDisableDrop;
  EditCanDropPrice.Value:=g_Config.nCanDropPrice;
  EditCanDropGold.Value:=g_Config.nCanDropGold;
  EditSuperRepairPriceRate.Value:=g_Config.nSuperRepairPriceRate;
  EditRepairItemDecDura.Value:=g_Config.nRepairItemDecDura;

  CheckBoxKillByMonstDropUseItem.Checked:=g_Config.boKillByMonstDropUseItem;
  CheckBoxKillByHumanDropUseItem.Checked:=g_Config.boKillByHumanDropUseItem;
  CheckBoxDieScatterBag.Checked:=g_Config.boDieScatterBag;
  CheckBoxDieDropGold.Checked:=g_Config.boDieDropGold;
  CheckBoxDieRedScatterBagAll.Checked:=g_Config.boDieRedScatterBagAll;
  Checkr64dell.Checked := g_Config.Reserved64dell;

  ScrollBarDieDropUseItemRate.Min:=1;
  ScrollBarDieDropUseItemRate.Max:=200;
  ScrollBarDieDropUseItemRate.Position:=g_Config.nDieDropUseItemRate;
  ScrollBarDieRedDropUseItemRate.Min:=1;
  ScrollBarDieRedDropUseItemRate.Max:=200;
  ScrollBarDieRedDropUseItemRate.Position:=g_Config.nDieRedDropUseItemRate;
  ScrollBarDieScatterBagRate.Min:=1;
  ScrollBarDieScatterBagRate.Max:=200;
  ScrollBarDieScatterBagRate.Position:=g_Config.nDieScatterBagRate;

  EditFishDropRate.Value :=g_Config.nFishSuccess;//超矫犬伏

  EditSayMsgTime.Value:=g_Config.dwSayMsgTime div 1000;
  EditSayMsgCount.Value:=g_Config.nSayMsgCount;
  EditDisableSayMsgTime.Value:=g_Config.dwDisableSayMsgTime div 1000;


  EditGroupExpRate1.Text:=FloatToStr(g_Config.nGroupExpRate[1]);
  EditGroupExpRate2.Text:=FloatToStr(g_Config.nGroupExpRate[2]);
  EditGroupExpRate3.Text:=FloatToStr(g_Config.nGroupExpRate[3]);
  EditGroupExpRate4.Text:=FloatToStr(g_Config.nGroupExpRate[4]);
  EditGroupExpRate5.Text:=FloatToStr(g_Config.nGroupExpRate[5]);
  EditGroupExpRate6.Text:=FloatToStr(g_Config.nGroupExpRate[6]);
  EditGroupExpRate7.Text:=FloatToStr(g_Config.nGroupExpRate[7]);
  EditGroupExpRate8.Text:=FloatToStr(g_Config.nGroupExpRate[8]);
  EditGroupExpRate9.Text:=FloatToStr(g_Config.nGroupExpRate[9]);
  EditGroupExpRate10.Text:=FloatToStr(g_Config.nGroupExpRate[10]);
  EditGroupExpRate11.Text:=FloatToStr(g_Config.nGroupExpRate[11]);
  EditGroupExpRate12.Text:=FloatToStr(g_Config.nGroupExpRate[12]);
  EditGroupExpRate13.Text:=FloatToStr(g_Config.nGroupExpRate[13]);

  SpinGroupHp.Value := g_Config.nGroupBuffHp;
  SpinGroupRecHp.Value := g_Config.nGroupBuffRecHp;
  SpinGroupExp.Value :=  g_Config.nGroupBuffExp;
  SpinGroupPo.Value :=   g_Config.nGroupBuffPo;

  {  EditExpRate.Text:=g_Config.nExpRate;
  EditDropRate.Text:= g_Config.nDropRate;    }

  RefGameVarConf();
  RefCharStatusConf();

  boOpened:=True;
  GameConfigControl.ActivePageIndex:=0;
  ShowModal;
end;
procedure TfrmGameConfig.RefGameSpeedConf;
begin

  EditItemSpeedTime.Value:=g_Config.ClientConf.btItemSpeed;

  EditEatTick.Value := g_Config.dwEatTick;

  CheckBoxSpellSendUpdateMsg.Checked:=g_Config.boSpellSendUpdateMsg;
  CheckBoxActionSendActionMsg.Checked:=g_Config.boActionSendActionMsg;


  CheckBoxDisableStruck.Checked:=g_Config.boDisableStruck;
  CheckBoxDisableSelfStruck.Checked:=g_Config.boDisableSelfStruck;
  EditStruckTime.Value:=g_Config.dwStruckTime;

end;


procedure TfrmGameConfig.ButtonGameSpeedDefaultClick(Sender: TObject);
begin
  if Application.MessageBox('确实要将此页重置为默认值吗？ ', '确认信息', MB_YESNO + MB_ICONQUESTION) <> IDYES then begin
    exit;
  end;

  g_Config.ClientConf.btItemSpeed:=25;
  g_Config.boDisableStruck:=False;
  g_Config.boDisableSelfStruck:=False;

  g_Config.dwStruckTime:=300;

  g_Config.boSpellSendUpdateMsg:=True;
  g_Config.boActionSendActionMsg:=True;

  RefGameSpeedConf();
  ModValue();
end;

procedure TfrmGameConfig.ButtonGameSpeedSaveClick(Sender: TObject);
begin
  Config.WriteBool('Setup','SpellSendUpdateMsg',  g_Config.boSpellSendUpdateMsg);
  Config.WriteBool('Setup','ActionSendActionMsg',  g_Config.boActionSendActionMsg);
  Config.WriteInteger('Setup','DropOverSpeed',  g_Config.dwDropOverSpeed);
  Config.WriteBool('Setup','DisableStruck',  g_Config.boDisableStruck);
  Config.WriteBool('Setup','DisableSelfStruck',  g_Config.boDisableSelfStruck);
  Config.WriteInteger('Setup','StruckTime',  g_Config.dwStruckTime);
  Config.WriteInteger('Setup','SpeedControlMode',g_Config.btSpeedControlMode);
  Config.WriteInteger('Setup', 'EatTick', g_Config.dwEatTick);
  uModValue();
end;

procedure TfrmGameConfig.CheckBoxSpellSendUpdateMsgClick(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.boSpellSendUpdateMsg:=CheckBoxSpellSendUpdateMsg.Checked;
  ModValue();
end;

procedure TfrmGameConfig.CheckBoxActionSendActionMsgClick(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.boActionSendActionMsg:=CheckBoxActionSendActionMsg.Checked;
  ModValue();
end;

procedure TfrmGameConfig.EditItemSpeedTimeChange(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.ClientConf.btItemSpeed:=EditItemSpeedTime.Value;
  ModValue();
end;

procedure TfrmGameConfig.EditConsoleShowUserCountTimeChange(
  Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.dwConsoleShowUserCountTime:=EditConsoleShowUserCountTime.Value * 1000;
  ModValue();
end;

procedure TfrmGameConfig.EditShowLineNoticeTimeChange(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.dwShowLineNoticeTime:=EditShowLineNoticeTime.Value * 1000;
  ModValue();
end;

procedure TfrmGameConfig.ComboBoxLineNoticeColorChange(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.nLineNoticeColor:=ComboBoxLineNoticeColor.ItemIndex;
  ModValue();
end;

procedure TfrmGameConfig.EditSoftVersionDateChange(Sender: TObject);
begin
  if not boOpened then exit;
  ModValue();
end;
procedure TfrmGameConfig.EditLineNoticePreFixChange(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.sLineNoticePreFix:=Trim(EditLineNoticePreFix.Text);
  ModValue();
end;

procedure TfrmGameConfig.CheckBoxShowMakeItemMsgClick(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.boShowMakeItemMsg:=CheckBoxShowMakeItemMsg.Checked;
  ModValue();
end;

procedure TfrmGameConfig.CbViewHackClick(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.boViewHackMessage:=CbViewHack.Checked;
  ModValue();
end;

procedure TfrmGameConfig.CkViewAdmfailClick(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.boViewAdmissionFailure:=CkViewAdmfail.Checked;
  ModValue();
end;


procedure TfrmGameConfig.CheckBoxShowExceptionMsgClick(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.boShowExceptionMsg:=CheckBoxShowExceptionMsg.Checked;
  ModValue();
end;

procedure TfrmGameConfig.CheckBoxCanOldClientLogonClick(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.boCanOldClientLogon:=CheckBoxCanOldClientLogon.Checked;
  ModValue();
end;

procedure TfrmGameConfig.CheckBoxSendOnlineCountClick(Sender: TObject);
var
  boStatus:Boolean;
begin
  boStatus:=CheckBoxSendOnlineCount.Checked;
  EditSendOnlineCountRate.Enabled:=boStatus;
  EditSendOnlineTime.Enabled:=boStatus;
  if not boOpened then exit;
  g_Config.boSendOnlineCount:=boStatus;
  ModValue();
end;

procedure TfrmGameConfig.EditSendOnlineCountRateChange(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.nSendOnlineCountRate:=EditSendOnlineCountRate.Value;
  ModValue();
end;

procedure TfrmGameConfig.EditSendOnlineTimeChange(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.dwSendOnlineTime:=EditSendOnlineTime.Value * 1000;
  ModValue();
end;
procedure TfrmGameConfig.EditMonsterPowerRateChange(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.nMonsterPowerRate:=EditMonsterPowerRate.Value;
  ModValue();
end;

procedure TfrmGameConfig.EditEditItemsPowerRateChange(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.nItemsPowerRate:=EditEditItemsPowerRate.Value;
  ModValue();
end;

procedure TfrmGameConfig.EditItemsACPowerRateChange(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.nItemsACPowerRate:=EditItemsACPowerRate.Value;
  ModValue();
end;
procedure TfrmGameConfig.CheckBoxDisableStruckClick(Sender: TObject);
begin
  EditStruckTime.Enabled:=not CheckBoxDisableStruck.Checked;
  if not boOpened then exit;
  g_Config.boDisableStruck:=CheckBoxDisableStruck.Checked;
  ModValue();
end;
procedure TfrmGameConfig.CheckBoxDisableSelfStruckClick(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.boDisableSelfStruck:=CheckBoxDisableSelfStruck.Checked;
  ModValue();
end;
procedure TfrmGameConfig.EditStruckTimeChange(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.dwStruckTime:=EditStruckTime.Value;
  ModValue();
end;

procedure TfrmGameConfig.RefGameVarConf;
begin
  EditSoftVersionDate.Text:=IntToStr(g_Config.nSoftVersionDate);
  EditConsoleShowUserCountTime.Value:=g_Config.dwConsoleShowUserCountTime div 1000;
  EditShowLineNoticeTime.Value:=g_Config.dwShowLineNoticeTime div 1000;
  ComboBoxLineNoticeColor.ItemIndex:=_MAX(0,_MIN(3,g_Config.nLineNoticeColor));
  EditLineNoticePreFix.Text:=g_Config.sLineNoticePreFix;

  CheckBoxShowMakeItemMsg.Checked:=g_Config.boShowMakeItemMsg;
  CbViewHack.Checked:=g_Config.boViewHackMessage;
  CkViewAdmfail.Checked:=g_Config.boViewAdmissionFailure;
  CheckBoxShowExceptionMsg.Checked:=g_Config.boShowExceptionMsg;  

  CheckBoxSendOnlineCount.Checked:=g_Config.boSendOnlineCount;
  EditSendOnlineCountRate.Value:=g_Config.nSendOnlineCountRate;
  EditSendOnlineTime.Value:=g_Config.dwSendOnlineTime div 1000;
  CheckBoxSendOnlineCountClick(CheckBoxSendOnlineCount);

  EditMonsterPowerRate.Value:=g_Config.nMonsterPowerRate;
  EditEditItemsPowerRate.Value:=g_Config.nItemsPowerRate;
  EditItemsACPowerRate.Value:=g_Config.nItemsACPowerRate;
  CheckBoxCanOldClientLogon.Checked:=g_Config.boCanOldClientLogon;
end;

procedure TfrmGameConfig.ButtonGeneralSaveClick(Sender: TObject);
var
  SoftVersionDate:Integer;
begin
  SoftVersionDate:=Str_ToInt(Trim(EditSoftVersionDate.Text),-1);
  if (SoftVersionDate < 0) or (SoftVersionDate > High(Integer)) then begin
    Application.MessageBox('请输入有效的软件日期！','确认信息',MB_OK + MB_ICONERROR);
    EditSoftVersionDate.SetFocus;
    exit;
  end;
  g_Config.nSoftVersionDate:=SoftVersionDate;

  Config.WriteInteger('Setup','SoftVersionDate',g_Config.nSoftVersionDate);
  Config.WriteInteger('Setup','ConsoleShowUserCountTime',g_Config.dwConsoleShowUserCountTime);
  Config.WriteInteger('Setup','ShowLineNoticeTime',g_Config.dwShowLineNoticeTime);
  Config.WriteInteger('Setup','LineNoticeColor',g_Config.nLineNoticeColor);
  StringConf.WriteString('String','LineNoticePreFix',g_Config.sLineNoticePreFix);
  Config.WriteBool('Setup','ShowMakeItemMsg',g_Config.boShowMakeItemMsg);
  Config.WriteString('Server','ViewHackMessage',BoolToStr2(g_Config.boViewHackMessage));
  Config.WriteString('Server','ViewAdmissionFailure',BoolToStr2(g_Config.boViewAdmissionFailure));
  Config.WriteBool('Setup','ShowExceptionMsg',g_Config.boShowExceptionMsg);

  Config.WriteBool('Setup','SendOnlineCount',g_Config.boSendOnlineCount);
  Config.WriteInteger('Setup','SendOnlineCountRate',g_Config.nSendOnlineCountRate);
  Config.WriteInteger('Setup','SendOnlineTime',g_Config.dwSendOnlineTime);

  Config.WriteInteger('Setup','MonsterPowerRate',g_Config.nMonsterPowerRate);
  Config.WriteInteger('Setup','ItemsPowerRate',g_Config.nItemsPowerRate);
  Config.WriteInteger('Setup','ItemsACPowerRate',g_Config.nItemsACPowerRate);
  Config.WriteBool('Setup','CanOldClientLogon',g_Config.boCanOldClientLogon);

  uModValue();
end;





procedure TfrmGameConfig.EditKillMonExpMultipleChange(Sender: TObject);
begin
  if EditKillMonExpMultiple.Text = '' then begin
    EditKillMonExpMultiple.Text:='0';
    exit;
  end;
  if not boOpened then exit;
  g_Config.dwKillMonExpMultiple:=EditKillMonExpMultiple.Value;
  ModValue();
end;

procedure TfrmGameConfig.CheckBoxHighLevelKillMonFixExpClick(
  Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.boHighLevelKillMonFixExp:=CheckBoxHighLevelKillMonFixExp.Checked;
  ModValue();
end;

procedure TfrmGameConfig.GridLevelExpSetEditText(Sender: TObject; ACol,
  ARow: Integer; const Value: String);
begin
  if not boOpened then exit;
  ModValue();
end;
procedure TfrmGameConfig.ComboBoxLevelExpClick(Sender: TObject);
var
  I: Integer;
  LevelExpScheme:TLevelExpScheme;
  dwOneLevelExp:LongWord;
  dwExp:LongWord;
begin
  if not boOpened then exit;
  if Application.MessageBox('升级经验计划设置的经验将立即生效，是否确认使用此经验计划？','Reset?',MB_YESNO + MB_ICONQUESTION) = IDNO then begin
    exit;
  end;
    
  LevelExpScheme:=TLevelExpScheme(ComboBoxLevelExp.Items.Objects[ComboBoxLevelExp.ItemIndex]);
  case LevelExpScheme of    //
    s_OldLevelExp: g_Config.dwNeedExps:=g_dwOldNeedExps;
    s_StdLevelExp: begin
      g_Config.dwNeedExps:=g_dwOldNeedExps;
      dwOneLevelExp:=4200000000 div High(g_Config.dwNeedExps);
      for I := 1 to High(g_Config.dwNeedExps) do begin
        if (26 + I) > High(g_Config.dwNeedExps) then break;
        dwExp:=dwOneLevelExp * LongWord(I);
        if dwExp = 0 then dwExp:=1;
        g_Config.dwNeedExps[26 + I]:=dwExp;
      end;
    end;
    s_2Mult: begin
      for I := 1 to High(g_Config.dwNeedExps) do begin
        dwExp:=g_Config.dwNeedExps[I] div 2;
        if dwExp = 0 then dwExp:=1;
        g_Config.dwNeedExps[I]:=dwExp;
      end;
    end;
    s_5Mult: begin
      for I := 1 to High(g_Config.dwNeedExps) do begin
        dwExp:=g_Config.dwNeedExps[I] div 5;
        if dwExp = 0 then dwExp:=1;
        g_Config.dwNeedExps[I]:=dwExp;
      end;
    end;
    s_8Mult: begin
      for I := 1 to High(g_Config.dwNeedExps) do begin
        dwExp:=g_Config.dwNeedExps[I] div 8;
        if dwExp = 0 then dwExp:=1;
        g_Config.dwNeedExps[I]:=dwExp;
      end;
    end;
    s_10Mult: begin
      for I := 1 to High(g_Config.dwNeedExps) do begin
        dwExp:=g_Config.dwNeedExps[I] div 10;
        if dwExp = 0 then dwExp:=1;
        g_Config.dwNeedExps[I]:=dwExp;
      end;
    end;
    s_20Mult: begin
      for I := 1 to High(g_Config.dwNeedExps) do begin
        dwExp:=g_Config.dwNeedExps[I] div 20;
        if dwExp = 0 then dwExp:=1;
        g_Config.dwNeedExps[I]:=dwExp;
      end;
    end;
    s_30Mult: begin
      for I := 1 to High(g_Config.dwNeedExps) do begin
        dwExp:=g_Config.dwNeedExps[I] div 30;
        if dwExp = 0 then dwExp:=1;
        g_Config.dwNeedExps[I]:=dwExp;
      end;
    end;
    s_40Mult: begin
      for I := 1 to High(g_Config.dwNeedExps) do begin
        dwExp:=g_Config.dwNeedExps[I] div 40;
        if dwExp = 0 then dwExp:=1;
        g_Config.dwNeedExps[I]:=dwExp;
      end;
    end;
    s_50Mult: begin
      for I := 1 to High(g_Config.dwNeedExps) do begin
        dwExp:=g_Config.dwNeedExps[I] div 50;
        if dwExp = 0 then dwExp:=1;
        g_Config.dwNeedExps[I]:=dwExp;
      end;
    end;
    s_60Mult: begin
      for I := 1 to High(g_Config.dwNeedExps) do begin
        dwExp:=g_Config.dwNeedExps[I] div 60;
        if dwExp = 0 then dwExp:=1;
        g_Config.dwNeedExps[I]:=dwExp;
      end;
    end;
    s_70Mult: begin
      for I := 1 to High(g_Config.dwNeedExps) do begin
        dwExp:=g_Config.dwNeedExps[I] div 70;
        if dwExp = 0 then dwExp:=1;
        g_Config.dwNeedExps[I]:=dwExp;
      end;
    end;
    s_80Mult: begin
      for I := 1 to High(g_Config.dwNeedExps) do begin
        dwExp:=g_Config.dwNeedExps[I] div 80;
        if dwExp = 0 then dwExp:=1;
        g_Config.dwNeedExps[I]:=dwExp;
      end;
    end;
    s_90Mult: begin
      for I := 1 to High(g_Config.dwNeedExps) do begin
        dwExp:=g_Config.dwNeedExps[I] div 90;
        if dwExp = 0 then dwExp:=1;
        g_Config.dwNeedExps[I]:=dwExp;
      end;
    end;
    s_100Mult: begin
      for I := 1 to High(g_Config.dwNeedExps) do begin
        dwExp:=g_Config.dwNeedExps[I] div 100;
        if dwExp = 0 then dwExp:=1;
        g_Config.dwNeedExps[I]:=dwExp;
      end;
    end;
    s_150Mult: begin
      for I := 1 to High(g_Config.dwNeedExps) do begin
        dwExp:=g_Config.dwNeedExps[I] div 150;
        if dwExp = 0 then dwExp:=1;
        g_Config.dwNeedExps[I]:=dwExp;
      end;
    end;
    s_200Mult: begin
      for I := 1 to High(g_Config.dwNeedExps) do begin
        dwExp:=g_Config.dwNeedExps[I] div 200;
        if dwExp = 0 then dwExp:=1;
        g_Config.dwNeedExps[I]:=dwExp;
      end;
    end;
    s_250Mult: begin
      for I := 1 to High(g_Config.dwNeedExps) do begin
        dwExp:=g_Config.dwNeedExps[I] div 250;
        if dwExp = 0 then dwExp:=1;
        g_Config.dwNeedExps[I]:=dwExp;
      end;
    end;
    s_300Mult: begin
      for I := 1 to High(g_Config.dwNeedExps) do begin
        dwExp:=g_Config.dwNeedExps[I] div 300;
        if dwExp = 0 then dwExp:=1;
        g_Config.dwNeedExps[I]:=dwExp;
      end;
    end;
  end;
  for I := 1 to GridLevelExp.RowCount - 1 do begin
    GridLevelExp.Cells[1,I]:=IntToStr(g_Config.dwNeedExps[I]);
  end;
  ModValue();
end;
procedure TfrmGameConfig.ButtonExpSaveClick(Sender: TObject);
var
  I:Integer;
  dwExp:LongWord;
 // NeedExps:TLevelNeedExp;    //nicky
begin
  for I := 1 to GridLevelExp.RowCount - 1 do begin
    dwExp:=Str_ToInt(GridLevelExp.Cells[1,I],0);
    if (dwExp <= 0) or (dwExp > High(LongWord)) then begin
      Application.MessageBox(PChar('等级' + IntToStr(I) + ' 超出限制。'),'确认信息',MB_OK + MB_ICONERROR);
      GridLevelExp.Row:=I;
      GridLevelExp.SetFocus;
      exit;
    end;
   // NeedExps[I]:=dwExp;
  end;
 // g_Config.dwNeedExps:=NeedExps;

  ExpConf.WriteInteger('Exp','KillMonExpMultiple',g_Config.dwKillMonExpMultiple);
  ExpConf.WriteBool('Exp','HighLevelKillMonFixExp',g_Config.boHighLevelKillMonFixExp);
  for I := 1 to high(g_Config.dwNeedExps) do begin
    ExpConf.WriteString('Exp','Level' + IntToStr(I),IntToStr(g_Config.dwNeedExps[I]));
  end;
  uModValue();
end;

procedure TfrmGameConfig.EditRepairDoorPriceChange(Sender: TObject);
begin
  if EditRepairDoorPrice.Text = '' then begin
    EditRepairDoorPrice.Text:='0';
    exit;
  end;
  if not boOpened then exit;
  g_Config.nRepairDoorPrice:=EditRepairDoorPrice.Value;
  ModValue();
end;

procedure TfrmGameConfig.EditRepairWallPriceChange(Sender: TObject);
begin
  if EditRepairWallPrice.Text = '' then begin
    EditRepairWallPrice.Text:='0';
    exit;
  end;
  if not boOpened then exit;
  g_Config.nRepairWallPrice:=EditRepairWallPrice.Value;
  ModValue();
end;

procedure TfrmGameConfig.EditHireArcherPriceChange(Sender: TObject);
begin
  if EditHireArcherPrice.Text = '' then begin
    EditHireArcherPrice.Text:='0';
    exit;
  end;
  if not boOpened then exit;
  g_Config.nHireArcherPrice:=EditHireArcherPrice.Value;
  ModValue();
end;

procedure TfrmGameConfig.EditHireGuardPriceChange(Sender: TObject);
begin
  if EditHireGuardPrice.Text = '' then begin
    EditHireGuardPrice.Text:='0';
    exit;
  end;
  if not boOpened then exit;
  g_Config.nHireGuardPrice:=EditHireGuardPrice.Value;
  ModValue();
end;

procedure TfrmGameConfig.EditCastleGoldMaxChange(Sender: TObject);
begin
  if EditCastleGoldMax.Text = '' then begin
    EditCastleGoldMax.Text:='0';
    exit;
  end;
  if not boOpened then exit;
  g_Config.nCastleGoldMax:=EditCastleGoldMax.Value;
  ModValue();
end;

procedure TfrmGameConfig.EditCastleOneDayGoldChange(Sender: TObject);
begin
  if EditCastleOneDayGold.Text = '' then begin
    EditCastleOneDayGold.Text:='0';
    exit;
  end;
  if not boOpened then exit;
  g_Config.nCastleOneDayGold:=EditCastleOneDayGold.Value;
  ModValue();
end;

procedure TfrmGameConfig.EditCastleHomeMapChange(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.sSabukCastleHomeMap:=Trim(EditCastleHomeMap.Text);
  ModValue();
end;

procedure TfrmGameConfig.EditCastleHomeXChange(Sender: TObject);
begin
  if EditCastleHomeX.Text = '' then begin
    EditCastleHomeX.Text:='0';
    exit;
  end;
  if not boOpened then exit;
  g_Config.nSabukCastleHomeX:=EditCastleHomeX.Value;
  ModValue();
end;

procedure TfrmGameConfig.EditCastleHomeYChange(Sender: TObject);
begin
  if EditCastleHomeY.Text = '' then begin
    EditCastleHomeY.Text:='0';
    exit;
  end;
  if not boOpened then exit;
  g_Config.nSabukCastleHomeY:=EditCastleHomeY.Value;
  ModValue();
end;

procedure TfrmGameConfig.EditCastleNameChange(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.sSabukCastleName:=Trim(EditCastleName.Text);
  ModValue();
end;

procedure TfrmGameConfig.CheckBoxGetAllNpcTaxClick(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.boGetAllNpcTax:=CheckBoxGetAllNpcTax.Checked;
  ModValue();
end;

procedure TfrmGameConfig.EditTaxRateChange(Sender: TObject);
begin
  if EditTaxRate.Text = '' then begin
    EditTaxRate.Text:='0';
    exit;
  end;
  if not boOpened then exit;
  g_Config.nCastleTaxRate:=EditTaxRate.Value;
  ModValue();
end;

procedure TfrmGameConfig.EditCastleMemberPriceRateChange(Sender: TObject);
begin
  if EditCastleMemberPriceRate.Text = '' then begin
    EditCastleMemberPriceRate.Text:='0';
    exit;
  end;
  if not boOpened then exit;
  g_Config.nCastleMemberPriceRate:=EditCastleMemberPriceRate.Value;
  ModValue();
end;

procedure TfrmGameConfig.ButtonCastleSaveClick(Sender: TObject);
begin
  Config.WriteInteger('Setup','RepairDoor',g_Config.nRepairDoorPrice);
  Config.WriteInteger('Setup','RepairWall',g_Config.nRepairWallPrice);
  Config.WriteInteger('Setup','HireArcher',g_Config.nHireArcherPrice);
  Config.WriteInteger('Setup','HireGuard',g_Config.nHireGuardPrice);
  Config.WriteInteger('Setup','CastleGoldMax',g_Config.nCastleGoldMax);
  Config.WriteInteger('Setup','CastleOneDayGold',g_Config.nCastleOneDayGold);

  Config.WriteString('Setup','SabukCastleName',g_Config.sSabukCastleName);
  Config.WriteString('Setup','SabukCastleHomeMap',g_Config.sSabukCastleHomeMap);
  Config.WriteInteger('Setup','SabukCastleHomeX',g_Config.nSabukCastleHomeX);
  Config.WriteInteger('Setup','SabukCastleHomeY',g_Config.nSabukCastleHomeY);

  Config.WriteString('Setup','NammanCastleName',g_Config.sNammanCastleName);
  Config.WriteString('Setup','NammanCastleHomeMap',g_Config.sNammanCastleHomeMap);
  Config.WriteInteger('Setup','NammanCastleHomeX',g_Config.nNammanCastleHomeX);
  Config.WriteInteger('Setup','NammanCastleHomeY',g_Config.nNammanCastleHomeY);

  Config.WriteInteger('Setup','CastleTaxRate',g_Config.nCastleTaxRate);
  Config.WriteBool('Setup','CastleGetAllNpcTax',g_Config.boGetAllNpcTax);
  Config.WriteInteger('Setup','CastleMemberPriceRate',g_Config.nCastleMemberPriceRate);

  Config.WriteInteger('Setup','CastleFlagRegenTime',g_Config.dwCastleFlagRegenTime);
  uModValue();
end;

procedure TfrmGameConfig.CheckBoxDisHumRunClick(Sender: TObject);
var
  boChecked:Boolean;
begin
  boChecked:=not CheckBoxDisHumRun.Checked;
  if boChecked then begin
    CheckBoxRunHum.Checked:=False;
    CheckBoxRunHum.Enabled:=False;
    CheckBoxRunMon.Checked:=False;
    CheckBoxRunMon.Enabled:=False;
    CheckBoxWarDisHumRun.Checked:=False;
    CheckBoxWarDisHumRun.Enabled:=False;
    CheckBoxRunNpc.Checked:=False;
    CheckBoxRunGuard.Checked:=False;
    CheckBoxRunNpc.Enabled:=False;
    CheckBoxRunGuard.Enabled:=False;
    CheckBoxGMRunAll.Checked:=False;
    CheckBoxGMRunAll.Enabled:=False;
  end else begin
    CheckBoxRunHum.Enabled:=True;
    CheckBoxRunMon.Enabled:=True;
    CheckBoxWarDisHumRun.Enabled:=True;
    CheckBoxRunNpc.Enabled:=True;
    CheckBoxRunGuard.Enabled:=True;
    CheckBoxGMRunAll.Enabled:=True;
  end;

  if not boOpened then exit;
  g_Config.boDiableHumanRun:= boChecked;

  ModValue();
end;
procedure TfrmGameConfig.CheckBoxRunHumClick(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.boRunHuman:=CheckBoxRunHum.Checked;
  ModValue();
end;
procedure TfrmGameConfig.CheckBoxRunMonClick(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.boRunMon:=CheckBoxRunMon.Checked;
  ModValue();
end;
procedure TfrmGameConfig.CheckBoxRunNpcClick(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.boRunNpc:=CheckBoxRunNpc.Checked;
  ModValue();
end;

procedure TfrmGameConfig.CheckBoxRunGuardClick(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.boRunGuard:=CheckBoxRunGuard.Checked;
  ModValue();
end;
procedure TfrmGameConfig.CheckBoxWarDisHumRunClick(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.boWarDisHumRun:=CheckBoxWarDisHumRun.Checked;
  ModValue();
end;

procedure TfrmGameConfig.CheckBoxGMRunAllClick(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.boGMRunAll:=CheckBoxGMRunAll.Checked;
  ModValue();
end;

procedure TfrmGameConfig.EditTryDealTimeChange(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.dwTryDealTime:=EditTryDealTime.Value * 1000;
  ModValue();
end;
             
procedure TfrmGameConfig.EditDealOKTimeChange(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.dwDealOKTime:=EditDealOKTime.Value * 1000;
  ModValue();
end;

procedure TfrmGameConfig.CheckBoxCanNotGetBackDealClick(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.boCanNotGetBackDeal:=CheckBoxCanNotGetBackDeal.Checked;
  ModValue();
end;

procedure TfrmGameConfig.CheckBoxDisableDealClick(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.boDisableDeal:=CheckBoxDisableDeal.Checked;
  ModValue();
end;

procedure TfrmGameConfig.CheckBoxControlDropItemClick(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.boControlDropItem:=CheckBoxControlDropItem.Checked;
  ModValue();
end;

procedure TfrmGameConfig.CheckBoxIsSafeDisableDropClick(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.boInSafeDisableDrop:=CheckBoxIsSafeDisableDrop.Checked;
  ModValue();
end;

procedure TfrmGameConfig.EditCanDropPriceChange(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.nCanDropPrice:=EditCanDropPrice.Value;
  ModValue();
end;

procedure TfrmGameConfig.EditCanDropGoldChange(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.nCanDropGold:=EditCanDropGold.Value;
  ModValue();
end;

procedure TfrmGameConfig.EditSafeZoneSizeChange(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.nSafeZoneSize:=EditSafeZoneSize.Value;
  ModValue();
end;
procedure TfrmGameConfig.EditStartPointSizeChange(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.nStartPointSize:=EditStartPointSize.Value;
  ModValue();
end;
procedure TfrmGameConfig.EditGroupMembersMaxChange(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.nGroupMembersMax:=EditGroupMembersMax.Value;
  ModValue();
end;
procedure TfrmGameConfig.EditRedHomeXChange(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.nRedHomeX:=EditRedHomeX.Value;
  ModValue();
end;

procedure TfrmGameConfig.EditRedHomeYChange(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.nRedHomeY:=EditRedHomeY.Value;
  ModValue();
end;

procedure TfrmGameConfig.EditRedHomeMapChange(Sender: TObject);
begin
  if not boOpened then exit;
  ModValue();
end;
procedure TfrmGameConfig.EditRedDieHomeMapChange(Sender: TObject);
begin
  if not boOpened then exit;
  ModValue();
end;

procedure TfrmGameConfig.EditRedDieHomeXChange(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.nRedDieHomeX:=EditRedDieHomeX.Value;
  ModValue();
end;
procedure TfrmGameConfig.EditHomeMapChange(Sender: TObject);
begin
  if not boOpened then exit;
  ModValue();
end;

procedure TfrmGameConfig.EditHomeXChange(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.nHomeX:=EditHomeX.Value;
  ModValue();
end;

procedure TfrmGameConfig.EditHomeYChange(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.nHomeY:=EditHomeY.Value;
  ModValue();
end;

procedure TfrmGameConfig.EditRedDieHomeYChange(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.nRedDieHomeY:=EditRedDieHomeY.Value;
  ModValue();
end;
procedure TfrmGameConfig.ButtonOptionSaveClick(Sender: TObject);
begin
  if EditRedHomeMap.Text = '' then begin
    Application.MessageBox('红名村地图设置错误！！！','确认信息',MB_OK + MB_ICONERROR);
    EditRedHomeMap.SetFocus;
    exit;
  end;
  g_Config.sRedHomeMap:=Trim(EditRedHomeMap.Text);

  if EditRedDieHomeMap.Text = '' then begin
    Application.MessageBox('红名村地图设置错误！！！','确认信息',MB_OK + MB_ICONERROR);
    EditRedDieHomeMap.SetFocus;
    exit;
  end;
  g_Config.sRedDieHomeMap:=Trim(EditRedDieHomeMap.Text);

  if EditHomeMap.Text = '' then begin
    Application.MessageBox('应急回城地图设置错误！！！','确认信息',MB_OK + MB_ICONERROR);
    EditHomeMap.SetFocus;
    exit;
  end;
  g_Config.sHomeMap:=Trim(EditHomeMap.Text);

  Config.WriteInteger('Setup','SafeZoneSize',g_Config.nSafeZoneSize);
  Config.WriteInteger('Setup','StartPointSize',g_Config.nStartPointSize);

  Config.WriteString('Setup','RedHomeMap',g_Config.sRedHomeMap);
  Config.WriteInteger('Setup','RedHomeX',g_Config.nRedHomeX);
  Config.WriteInteger('Setup','RedHomeY',g_Config.nRedHomeY);

  Config.WriteString('Setup','RedDieHomeMap',g_Config.sRedDieHomeMap);
  Config.WriteInteger('Setup','RedDieHomeX',g_Config.nRedDieHomeX);
  Config.WriteInteger('Setup','RedDieHomeY',g_Config.nRedDieHomeY);

  Config.WriteString('Setup','HomeMap',g_Config.sHomeMap);
  Config.WriteInteger('Setup','HomeX',g_Config.nHomeX);
  Config.WriteInteger('Setup','HomeY',g_Config.nHomeY);

  uModValue();
end;



procedure TfrmGameConfig.ButtonOptionSave3Click(Sender: TObject);
var
  tBool:String;
begin
  Config.WriteBool('Setup','DiableHumanRun',g_Config.boDiableHumanRun);
  Config.WriteBool('Setup','RunHuman',g_Config.boRunHuman);
  Config.WriteBool('Setup','RunMon',g_Config.boRunMon);
  Config.WriteBool('Setup','RunNpc',g_Config.boRunNpc);
  Config.WriteBool('Setup','RunGuard', g_Config.boRunGuard);
  Config.WriteBool('Setup','WarDisableHumanRun',g_Config.boWarDisHumRun);
  Config.WriteBool('Setup','GMRunAll',g_Config.boGMRunAll);

  Config.WriteInteger('Setup','TryDealTime',g_Config.dwTryDealTime);
  Config.WriteInteger('Setup','DealOKTime',g_Config.dwDealOKTime);
  Config.WriteBool('Setup','CanNotGetBackDeal',g_Config.boCanNotGetBackDeal);
  Config.WriteBool('Setup','DisableDeal',g_Config.boDisableDeal);
  Config.WriteBool('Setup','ControlDropItem', g_Config.boControlDropItem);
  Config.WriteBool('Setup','InSafeDisableDrop', g_Config.boInSafeDisableDrop);
  Config.WriteInteger('Setup','CanDropGold', g_Config.nCanDropGold);
  Config.WriteInteger('Setup','CanDropPrice', g_Config.nCanDropPrice);

  Config.WriteInteger('Setup','DecLightItemDrugTime',g_Config.dwDecLightItemDrugTime);
  Config.WriteInteger('Setup','PosionDecHealthTime',g_Config.dwPosionDecHealthTime);
  Config.WriteInteger('Setup','PosionDamagarmor',g_Config.nPosionDamagarmor);

  if g_Config.boTimeEventUse then tBool:='TRUE'
  else tBool:='FLASE';
  Config.WriteString('Server','TimeEventUse',tBool);
  Config.WriteInteger('Server','MinEvent', g_Config.nMinEvent);
  Config.WriteInteger('Server','HourEvent', g_Config.nHourEvent);
  Config.WriteInteger('Server','WakeUpRate', g_Config.nWakeUpRate);

  uModValue();
end;



procedure TfrmGameConfig.EditDecPkPointTimeChange(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.dwDecPkPointTime:=EditDecPkPointTime.Value * 1000;
  ModValue();
end;

procedure TfrmGameConfig.EditDecPkPointCountChange(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.nDecPkPointCount:=EditDecPkPointCount.Value;
  ModValue();
end;

procedure TfrmGameConfig.EditPKFlagTimeChange(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.dwPKFlagTime:=EditPKFlagTime.Value * 1000;
  ModValue();
end;

procedure TfrmGameConfig.EditKillHumanAddPKPointChange(Sender: TObject);
begin
  if EditKillHumanAddPKPoint.Text = '' then begin
    EditKillHumanAddPKPoint.Text:='0';
    exit;
  end;
  if not boOpened then exit;
  g_Config.nKillHumanAddPKPoint:=EditKillHumanAddPKPoint.Value;
  ModValue();
end;
procedure TfrmGameConfig.EditPosionDecHealthTimeChange(Sender: TObject);
begin
  if EditPosionDecHealthTime.Text = '' then begin
    EditPosionDecHealthTime.Text:='0';
    exit;
  end;
  if not boOpened then exit;
  g_Config.dwPosionDecHealthTime:=EditPosionDecHealthTime.Value;
  ModValue();
end;
procedure TfrmGameConfig.EditPosionDamagarmorChange(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.nPosionDamagarmor:=EditPosionDamagarmor.Value;
  ModValue();
end;
procedure TfrmGameConfig.CheckBoxKillHumanWinLevelClick(Sender: TObject);
var
  boStatus:Boolean;
begin
  boStatus:=CheckBoxKillHumanWinLevel.Checked;
  CheckBoxKilledLostLevel.Enabled:=boStatus;
  EditKillHumanWinLevel.Enabled:=boStatus;
  EditKilledLostLevel.Enabled:=boStatus;
  if not boStatus then begin
    CheckBoxKilledLostLevel.Checked:=False;
    if not CheckBoxKillHumanWinExp.Checked then
      EditHumanLevelDiffer.Enabled:=False;
  end else begin
    EditHumanLevelDiffer.Enabled:=True;
  end;
  if not boOpened then exit;
  g_Config.boKillHumanWinLevel:=boStatus;
  ModValue();
end;

procedure TfrmGameConfig.CheckBoxKilledLostLevelClick(Sender: TObject);
var
  boStatus:Boolean;
begin
  boStatus:=CheckBoxKilledLostLevel.Checked;
  EditKilledLostLevel.Enabled:=boStatus;
  if not boOpened then exit;
  g_Config.boKilledLostLevel:=boStatus;
  ModValue();
end;

procedure TfrmGameConfig.CheckBoxKillHumanWinExpClick(Sender: TObject);
var
  boStatus:Boolean;
begin
  boStatus:=CheckBoxKillHumanWinExp.Checked;
  CheckBoxKilledLostExp.Enabled:=boStatus;
  EditKillHumanWinExp.Enabled:=boStatus;
  EditKillHumanLostExp.Enabled:=boStatus;
  if not boStatus then begin
    CheckBoxKilledLostExp.Checked:=False;
    if not CheckBoxKillHumanWinLevel.Checked then
      EditHumanLevelDiffer.Enabled:=False;
  end else begin
    EditHumanLevelDiffer.Enabled:=True;
  end;
  if not boOpened then exit;
  g_Config.boKillHumanWinExp:=boStatus;
  ModValue();

end;

procedure TfrmGameConfig.CheckBoxKilledLostExpClick(Sender: TObject);
var
  boStatus:Boolean;
begin
  boStatus:=CheckBoxKilledLostExp.Checked;
  EditKillHumanLostExp.Enabled:=boStatus;
  if not boOpened then exit;
  g_Config.boKilledLostExp:=boStatus;
  ModValue();

end;

procedure TfrmGameConfig.EditKillHumanWinLevelChange(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.nKillHumanWinLevel:=EditKillHumanWinLevel.Value;
  ModValue();
end;

procedure TfrmGameConfig.EditKilledLostLevelChange(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.nKilledLostLevel:=EditKilledLostLevel.Value;
  ModValue();
end;

procedure TfrmGameConfig.EditKillHumanWinExpChange(Sender: TObject);
begin
  if EditKillHumanWinExp.Text = '' then begin
    EditKillHumanWinExp.Text:='0';
    exit;
  end;
  if not boOpened then exit;
  g_Config.nKillHumanWinExp:=EditKillHumanWinExp.Value;
  ModValue();
end;

procedure TfrmGameConfig.EditKillHumanLostExpChange(Sender: TObject);
begin
  if EditKillHumanLostExp.Text = '' then begin
    EditKillHumanLostExp.Text:='0';
    exit;
  end;
  if not boOpened then exit;
  g_Config.nKillHumanLostExp:=EditKillHumanLostExp.Value;
  ModValue();
end;

procedure TfrmGameConfig.EditHumanLevelDifferChange(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.nHumanLevelDiffer:=EditHumanLevelDiffer.Value;
  ModValue();
end;

procedure TfrmGameConfig.CheckBoxPKLevelProtectClick(Sender: TObject);
var
  boStatus:Boolean;
begin
  boStatus:=CheckBoxPKLevelProtect.Checked;
  EditPKProtectLevel.Enabled:=boStatus;
  if not boOpened then exit;
  g_Config.boPKLevelProtect:=boStatus;
  ModValue();
end;

procedure TfrmGameConfig.EditPKProtectLevelChange(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.nPKProtectLevel:=EditPKProtectLevel.Value;
  ModValue();
end;

procedure TfrmGameConfig.EditRedPKProtectLevelChange(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.nRedPKProtectLevel:=EditRedPKProtectLevel.Value;
  ModValue();
end;

procedure TfrmGameConfig.ButtonOptionSave2Click(Sender: TObject);
begin
  Config.WriteInteger('Setup','DecPkPointTime',g_Config.dwDecPkPointTime);
  Config.WriteInteger('Setup','DecPkPointCount',g_Config.nDecPkPointCount);
  Config.WriteInteger('Setup','PKFlagTime',g_Config.dwPKFlagTime);
  Config.WriteInteger('Setup','KillHumanAddPKPoint',g_Config.nKillHumanAddPKPoint);
  Config.WriteInteger('Setup','KillHumanDecLuckPoint',g_Config.nKillHumanDecLuckPoint);


  Config.WriteBool('Setup','KillHumanWinLevel',g_Config.boKillHumanWinLevel);
  Config.WriteBool('Setup','KilledLostLevel',g_Config.boKilledLostLevel);
  Config.WriteBool('Setup','PKServer',g_Config.boPKServer);    //懦单胶 葛靛

  Config.WriteInteger('Setup','KillHumanWinLevelPoint',g_Config.nKillHumanWinLevel);
  Config.WriteInteger('Setup','KilledLostLevelPoint',g_Config.nKilledLostLevel);
  Config.WriteBool('Setup','KillHumanWinExp',g_Config.boKillHumanWinExp);
  Config.WriteBool('Setup','KilledLostExp',g_Config.boKilledLostExp);
  Config.WriteInteger('Setup','KillHumanWinExpPoint',g_Config.nKillHumanWinExp);
  Config.WriteInteger('Setup','KillHumanLostExpPoint',g_Config.nKillHumanLostExp);
  Config.WriteInteger('Setup','HumanLevelDiffer',g_Config.nHumanLevelDiffer);

  Config.WriteBool('Setup','PKProtect',g_Config.boPKLevelProtect);
  Config.WriteInteger('Setup','PKProtectLevel',g_Config.nPKProtectLevel);
  Config.WriteInteger('Setup','RedPKProtectLevel',g_Config.nRedPKProtectLevel);

  uModValue();
end;





procedure TfrmGameConfig.CheckBoxTestServerClick(Sender: TObject);
var
  boStatue:Boolean;
begin
  boStatue:=CheckBoxTestServer.Checked;
  EditTestLevel.Enabled:=boStatue;
  EditTestGold.Enabled:=boStatue;
  EditTestUserLimit.Enabled:=boStatue;
  if not boOpened then exit;
  g_Config.boTestServer:=boStatue;
  ModValue();
end;

procedure TfrmGameConfig.CheckBoxServiceModeClick(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.boServiceMode:=CheckBoxServiceMode.Checked;
  ModValue();
end;

procedure TfrmGameConfig.CheckBoxVentureModeClick(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.boVentureServer:=CheckBoxVentureMode.Checked;
  ModValue();
end;

procedure TfrmGameConfig.CheckBoxNonPKModeClick(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.boNonPKServer:=CheckBoxNonPKMode.Checked;
  ModValue();
end;

procedure TfrmGameConfig.EditTestLevelKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  EditTestLevel.Tag:=EditTestLevel.Value;
end;

procedure TfrmGameConfig.EditTestLevelChange(Sender: TObject);
begin
  
  if EditTestLevel.Text = '' then begin
    EditTestLevel.Tag:=1;
    EditTestLevel.Text:='0';
    exit;
  end;
  if (EditTestLevel.Tag = 1) and (EditTestLevel.Value <> 0) then begin
    EditTestLevel.Tag:=0;
    EditTestLevel.Value:=EditTestLevel.Value div 10;
  end;
    
  if not boOpened then exit;
  g_Config.nTestLevel:=EditTestLevel.Value;
  ModValue();
end;

procedure TfrmGameConfig.EditTestGoldChange(Sender: TObject);
begin
  if EditTestGold.Text = '' then begin
    EditTestGold.Text:='0';
    exit;
  end;
  if not boOpened then exit;
  g_Config.nTestGold:=EditTestGold.Value;
  ModValue();
end;

procedure TfrmGameConfig.EditTestUserLimitChange(Sender: TObject);
begin
  if EditTestUserLimit.Text = '' then begin
    EditTestUserLimit.Text:='0';
    exit;
  end;
  if not boOpened then exit;
  g_Config.nTestUserLimit:=EditTestUserLimit.Value;
  ModValue();
end;

procedure TfrmGameConfig.EditStartPermissionChange(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.nStartPermission:=EditStartPermission.Value;
  ModValue();
end;

procedure TfrmGameConfig.EditUserFullChange(Sender: TObject);
begin
  if EditUserFull.Text = '' then begin
    EditUserFull.Text:='0';
    exit;
  end;
  if not boOpened then exit;
  g_Config.nUserFull:=EditUserFull.Value;
  ModValue();
end;


procedure TfrmGameConfig.EditHumanMaxGoldChange(Sender: TObject);
begin
  if EditHumanMaxGold.Text = '' then begin
    EditHumanMaxGold.Text:='0';
    exit;
  end;
  if not boOpened then exit;
  g_Config.nHumanMaxGold:=EditHumanMaxGold.Value;
  ModValue();
end;

procedure TfrmGameConfig.EditHumanTryModeMaxGoldChange(Sender: TObject);
begin
  if EditHumanTryModeMaxGold.Text = '' then begin
    EditHumanTryModeMaxGold.Text:='0';
    exit;
  end;
  if not boOpened then exit;
  g_Config.nHumanTryModeMaxGold:=EditHumanTryModeMaxGold.Value;
  ModValue();
end;

procedure TfrmGameConfig.EditTryModeLevelChange(Sender: TObject);
begin
  if EditTryModeLevel.Text = '' then begin
    EditTryModeLevel.Text:='0';
    exit;
  end;
  if not boOpened then exit;
  g_Config.nTryModeLevel:=EditTryModeLevel.Value;
  ModValue();
end;

procedure TfrmGameConfig.CheckBoxTryModeUseStorageClick(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.boTryModeUseStorage:=CheckBoxTryModeUseStorage.Checked;
  ModValue();
end;

procedure TfrmGameConfig.ButtonOptionSave0Click(Sender: TObject);
begin
  Config.WriteString('Server','TestServer',BoolToStr2(g_Config.boTestServer));
  Config.WriteInteger('Server','TestLevel',g_Config.nTestLevel);
  Config.WriteInteger('Server','TestGold',g_Config.nTestGold);
  Config.WriteInteger('Server','TestServerUserLimit',g_Config.nTestUserLimit);
  Config.WriteString('Server','ServiceMode',BoolToStr2(g_Config.boServiceMode));
  Config.WriteString('Server','NonPKServer',BoolToStr2(g_Config.boNonPKServer));
  Config.WriteString('Server','VentureServer',BoolToStr2(g_Config.boVentureServer));
  Config.WriteInteger('Setup','StartPermission',g_Config.nStartPermission);
  Config.WriteInteger('Server','UserFull',g_Config.nUserFull);

  Config.WriteInteger('Setup','HumanMaxGold',g_Config.nHumanMaxGold);
  Config.WriteInteger('Setup','HumanTryModeMaxGold',g_Config.nHumanTryModeMaxGold);
  Config.WriteInteger('Setup','TryModeLevel',g_Config.nTryModeLevel);
  Config.WriteBool('Setup','TryModeUseStorage',g_Config.boTryModeUseStorage);
  Config.WriteInteger('Setup','GroupMembersMax',g_Config.nGroupMembersMax);

  Config.WriteFloat('Setup','ExChangeGameGoldRate',g_Config.nExChangeGameGoldRate);
  Config.WriteInteger('Setup','ExChangeGoldRate',g_Config.nExChangeGoldRate);

  Config.WriteInteger('Setup','AllowGameGoldLevel',g_Config.nAllowGameGoldLevel);
  Config.WriteInteger('Setup','AllowPCPointLevel',g_Config.nAllowPCPointLevel);

  uModValue();
end;



procedure TfrmGameConfig.EditSayMsgMaxLenChange(Sender: TObject);
begin
  if EditSayMsgMaxLen.Text = '' then begin
    EditSayMsgMaxLen.Text:='0';
    exit;
  end;
  if not boOpened then exit;
  g_Config.nSayMsgMaxLen:=EditSayMsgMaxLen.Value;
  ModValue();
end;

procedure TfrmGameConfig.EditSayRedMsgMaxLenChange(Sender: TObject);
begin
  if EditSayRedMsgMaxLen.Text = '' then begin
    EditSayRedMsgMaxLen.Text:='0';
    exit;
  end;
  if not boOpened then exit;
  g_Config.nSayRedMsgMaxLen:=EditSayRedMsgMaxLen.Value;
  ModValue();
end;

procedure TfrmGameConfig.EditCanShoutMsgLevelChange(Sender: TObject);
begin
  if EditCanShoutMsgLevel.Text = '' then begin
    EditCanShoutMsgLevel.Text:='0';
    exit;
  end;
  if not boOpened then exit;
  g_Config.nCanShoutMsgLevel:=EditCanShoutMsgLevel.Value;
  ModValue();
end;




procedure TfrmGameConfig.EditSayMsgTimeChange(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.dwSayMsgTime:=EditSayMsgTime.Value * 1000;
  ModValue();
end;

procedure TfrmGameConfig.EditSayMsgCountChange(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.nSayMsgCount:=EditSayMsgCount.Value;
  ModValue();
end;

procedure TfrmGameConfig.EditDisableSayMsgTimeChange(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.dwDisableSayMsgTime:=EditDisableSayMsgTime.Value * 1000;
  ModValue();
end;

procedure TfrmGameConfig.CheckBoxShutRedMsgShowGMNameClick(
  Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.boShutRedMsgShowGMName:=CheckBoxShutRedMsgShowGMName.Checked;
  ModValue();
end;


procedure TfrmGameConfig.CheckBoxShowPreFixMsgClick(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.boShowPreFixMsg:=CheckBoxShowPreFixMsg.Checked;
  ModValue();
end;

procedure TfrmGameConfig.EditGMRedMsgCmdChange(Sender: TObject);
var
  sCmd:String;
begin
  if not boOpened then exit;
  sCmd:=EditGMRedMsgCmd.Text;
  g_GMRedMsgCmd:=sCmd[1];
  ModValue();
end;

procedure TfrmGameConfig.ButtonMsgSaveClick(Sender: TObject);
begin
  Config.WriteInteger('Setup','SayMsgMaxLen',g_Config.nSayMsgMaxLen);
  Config.WriteInteger('Setup','SayMsgTime',g_Config.dwSayMsgTime);
  Config.WriteInteger('Setup','SayMsgCount',g_Config.nSayMsgCount);
  Config.WriteInteger('Setup','SayRedMsgMaxLen',g_Config.nSayRedMsgMaxLen);
  Config.WriteBool('Setup','ShutRedMsgShowGMName',g_Config.boShutRedMsgShowGMName);
  Config.WriteInteger('Setup','CanShoutMsgLevel',g_Config.nCanShoutMsgLevel);
  CommandConf.WriteString('Command','GMRedMsgCmd',g_GMRedMsgCmd);
  Config.WriteBool('Setup','ShowPreFixMsg',g_Config.boShowPreFixMsg);

  uModValue();
end;

procedure TfrmGameConfig.EditStartCastleWarDaysChange(Sender: TObject);
begin
;
end;

procedure TfrmGameConfig.EditStartCastlewarTimeChange(Sender: TObject);
begin
  if EditStartCastlewarTime.Text = '' then begin
    EditStartCastlewarTime.Text:='0';
    exit;
  end;
  if not boOpened then exit;
  g_Config.nStartCastlewarTime:=EditStartCastlewarTime.Value;
  ModValue();
end;

procedure TfrmGameConfig.EditShowCastleWarEndMsgTimeChange(
  Sender: TObject);
begin
  if EditShowCastleWarEndMsgTime.Text = '' then begin
    EditShowCastleWarEndMsgTime.Text:='0';
    exit;
  end;
  if not boOpened then exit;
  g_Config.dwShowCastleWarEndMsgTime:=EditShowCastleWarEndMsgTime.Value * (60 * 1000);
  ModValue();
end;

procedure TfrmGameConfig.EditCastleWarTimeChange(Sender: TObject);
begin
  if EditCastleWarTime.Text = '' then begin
    EditCastleWarTime.Text:='0';
    exit;
  end;
  if not boOpened then exit;
  g_Config.dwCastleWarTime:=EditCastleWarTime.Value * (60 * 1000);
  ModValue();
end;

procedure TfrmGameConfig.EditGuildWarTimeChange(Sender: TObject);
begin
  if EditGuildWarTime.Text = '' then begin
    EditGuildWarTime.Text:='0';
    exit;
  end;
  if not boOpened then exit;
  g_Config.dwGuildWarTime:=EditGuildWarTime.Value * (60 * 1000);
  ModValue();
end;

procedure TfrmGameConfig.EditMakeGhostTimeChange(Sender: TObject);
begin
  if EditMakeGhostTime.Text = '' then begin
    EditMakeGhostTime.Text:='0';
    exit;
  end;
  if not boOpened then exit;
  g_Config.dwMakeGhostTime:=EditMakeGhostTime.Value * 1000;
  ModValue();
end;

procedure TfrmGameConfig.EditClearDropOnFloorItemTimeChange(
  Sender: TObject);
begin
  if EditClearDropOnFloorItemTime.Text = '' then begin
    EditClearDropOnFloorItemTime.Text:='0';
    exit;
  end;
  if not boOpened then exit;
  g_Config.dwClearDropOnFloorItemTime:=EditClearDropOnFloorItemTime.Value * 1000;
  ModValue();
end;

procedure TfrmGameConfig.EditSaveHumanRcdTimeChange(Sender: TObject);
begin
  if EditSaveHumanRcdTime.Text = '' then begin
    EditSaveHumanRcdTime.Text:='0';
    exit;
  end;
  if not boOpened then exit;
  g_Config.dwSaveHumanRcdTime:=EditSaveHumanRcdTime.Value * (60 * 1000);
  ModValue();
end;

procedure TfrmGameConfig.EditHumanFreeDelayTimeChange(Sender: TObject);
begin
  if EditHumanFreeDelayTime.Text = '' then begin
    EditHumanFreeDelayTime.Text:='0';
    exit;
  end;
  if not boOpened then exit;
  g_Config.dwHumanFreeDelayTime:=EditHumanFreeDelayTime.Value * (60 * 1000);
  ModValue();
end;

procedure TfrmGameConfig.EditFloorItemCanPickUpTimeChange(Sender: TObject);
begin
  if EditFloorItemCanPickUpTime.Text = '' then begin
    EditFloorItemCanPickUpTime.Text:='0';
    exit;
  end;
  if not boOpened then exit;
  g_Config.dwFloorItemCanPickUpTime:=EditFloorItemCanPickUpTime.Value * 1000;
  ModValue();
end;

procedure TfrmGameConfig.ButtonTimeSaveClick(Sender: TObject);
var
  I: Integer;
begin
 for I := Low(g_Config.nStartCastlewarDay) to High(g_Config.nStartCastlewarDay) do begin
   Config.WriteInteger('Setup','StartCastlewarDay' + IntToStr(I),g_Config.nStartCastlewarDay[I]);
 end;
 Config.WriteInteger('Setup','StartCastlewarTime',  g_Config.nStartCastlewarTime);
 Config.WriteInteger('Setup','StartCastlewarMin',  g_Config.nStartCastlewarMin);
 Config.WriteInteger('Setup','ShowCastleWarEndMsgTime',  g_Config.dwShowCastleWarEndMsgTime);
 Config.WriteInteger('Setup','CastleWarTime',  g_Config.dwCastleWarTime);
 Config.WriteInteger('Setup','GuildWarTime',  g_Config.dwGuildWarTime);
 Config.WriteInteger('Setup','SaveHumanRcdTime',g_Config.dwSaveHumanRcdTime);
 Config.WriteInteger('Setup','HumanFreeDelayTime',g_Config.dwHumanFreeDelayTime);
 Config.WriteInteger('Setup','MakeGhostTime',g_Config.dwMakeGhostTime);
 Config.WriteInteger('Setup','ClearDropOnFloorItemTime',g_Config.dwClearDropOnFloorItemTime);
 Config.WriteInteger('Setup','FloorItemCanPickUpTime',g_Config.dwFloorItemCanPickUpTime);

 uModValue();
end;

procedure TfrmGameConfig.EditBuildGuildPriceChange(Sender: TObject);
begin
  if EditBuildGuildPrice.Text = '' then begin
    EditBuildGuildPrice.Text:='0';
    exit;
  end;
  if not boOpened then exit;
  g_Config.nBuildGuildPrice:=EditBuildGuildPrice.Value;
  ModValue();
end;

procedure TfrmGameConfig.EditGuildWarPriceChange(Sender: TObject);
begin
  if EditGuildWarPrice.Text = '' then begin
    EditGuildWarPrice.Text:='0';
    exit;
  end;
  if not boOpened then exit;
  g_Config.nGuildWarPrice:=EditGuildWarPrice.Value;
  ModValue();
end;

procedure TfrmGameConfig.EditMakeDurgPriceChange(Sender: TObject);
begin
  if EditMakeDurgPrice.Text = '' then begin
    EditMakeDurgPrice.Text:='0';
    exit;
  end;
  if not boOpened then exit;
  g_Config.nMakeDurgPrice:=EditMakeDurgPrice.Value;
  ModValue();
end;


procedure TfrmGameConfig.EditSuperRepairPriceRateChange(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.nSuperRepairPriceRate:=EditSuperRepairPriceRate.Value;
  ModValue();
end;

procedure TfrmGameConfig.EditRepairItemDecDuraChange(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.nRepairItemDecDura:=EditRepairItemDecDura.Value;
  ModValue();
end;

procedure TfrmGameConfig.ButtonPriceSaveClick(Sender: TObject);
begin
 Config.WriteInteger('Setup','BuildGuild',g_Config.nBuildGuildPrice);
 Config.WriteInteger('Setup','MakeDurg',g_Config.nMakeDurgPrice);
 Config.WriteInteger('Setup','GuildWarFee',g_Config.nGuildWarPrice);
 Config.WriteInteger('Setup','SuperRepairPriceRate',g_Config.nSuperRepairPriceRate);
 Config.WriteInteger('Setup','RepairItemDecDura',g_Config.nRepairItemDecDura);

 uModValue();
end;


procedure TfrmGameConfig.EditHearMsgFColorChange(Sender: TObject);
var
  btColor:Byte;
begin
  btColor:=EditHearMsgFColor.Value;
  LabeltHearMsgFColor.Color:=GetRGB(btColor);
  if not boOpened then exit;
  g_Config.btHearMsgFColor:=btColor;
  ModValue();

end;

procedure TfrmGameConfig.EdittHearMsgBColorChange(Sender: TObject);
var
  btColor:Byte;
begin
  btColor:=EdittHearMsgBColor.Value;
  LabelHearMsgBColor.Color:=GetRGB(btColor);
  if not boOpened then exit;
  g_Config.btHearMsgBColor:=btColor;
  ModValue();
end;

procedure TfrmGameConfig.EditWhisperMsgFColorChange(Sender: TObject);
var
  btColor:Byte;
begin
  btColor:=EditWhisperMsgFColor.Value;
  LabelWhisperMsgFColor.Color:=GetRGB(btColor);
  if not boOpened then exit;
  g_Config.btWhisperMsgFColor:=btColor;
  ModValue();
end;

procedure TfrmGameConfig.EditWhisperMsgBColorChange(Sender: TObject);
var
  btColor:Byte;
begin
  btColor:=EditWhisperMsgBColor.Value;
  LabelWhisperMsgBColor.Color:=GetRGB(btColor);
  if not boOpened then exit;
  g_Config.btWhisperMsgBColor:=btColor;
  ModValue();
end;

procedure TfrmGameConfig.EditGMWhisperMsgFColorChange(Sender: TObject);
var
  btColor:Byte;
begin
  btColor:=EditGMWhisperMsgFColor.Value;
  LabelGMWhisperMsgFColor.Color:=GetRGB(btColor);
  if not boOpened then exit;
  g_Config.btGMWhisperMsgFColor:=btColor;
  ModValue();
end;

procedure TfrmGameConfig.EditGMWhisperMsgBColorChange(Sender: TObject);
var
  btColor:Byte;
begin
  btColor:=EditGMWhisperMsgBColor.Value;
  LabelGMWhisperMsgBColor.Color:=GetRGB(btColor);
  if not boOpened then exit;
  g_Config.btGMWhisperMsgBColor:=btColor;
  ModValue();
end;

procedure TfrmGameConfig.EditRedMsgFColorChange(Sender: TObject);
var
  btColor:Byte;
begin
  btColor:=EditRedMsgFColor.Value;
  LabelRedMsgFColor.Color:=GetRGB(btColor);
  if not boOpened then exit;
  g_Config.btRedMsgFColor:=btColor;
  ModValue();
end;

procedure TfrmGameConfig.EditRedMsgBColorChange(Sender: TObject);
var
  btColor:Byte;
begin
  btColor:=EditRedMsgBColor.Value;
  LabelRedMsgBColor.Color:=GetRGB(btColor);
  if not boOpened then exit;
  g_Config.btRedMsgBColor:=btColor;
  ModValue();
end;

procedure TfrmGameConfig.EditGreenMsgFColorChange(Sender: TObject);
var
  btColor:Byte;
begin
  btColor:=EditGreenMsgFColor.Value;
  LabelGreenMsgFColor.Color:=GetRGB(btColor);
  if not boOpened then exit;
  g_Config.btGreenMsgFColor:=btColor;
  ModValue();
end;

procedure TfrmGameConfig.EditGreenMsgBColorChange(Sender: TObject);
var
  btColor:Byte;
begin
  btColor:=EditGreenMsgBColor.Value;
  LabelGreenMsgBColor.Color:=GetRGB(btColor);
  if not boOpened then exit;
  g_Config.btGreenMsgBColor:=btColor;
  ModValue();
end;

procedure TfrmGameConfig.EditBlueMsgFColorChange(Sender: TObject);
var
  btColor:Byte;
begin
  btColor:=EditBlueMsgFColor.Value;
  LabelBlueMsgFColor.Color:=GetRGB(btColor);
  if not boOpened then exit;
  g_Config.btBlueMsgFColor:=btColor;
  ModValue();
end;

procedure TfrmGameConfig.EditBlueMsgBColorChange(Sender: TObject);
var
  btColor:Byte;
begin
  btColor:=EditBlueMsgBColor.Value;
  LabelBlueMsgBColor.Color:=GetRGB(btColor);
  if not boOpened then exit;
  g_Config.btBlueMsgBColor:=btColor;
  ModValue();
end;

procedure TfrmGameConfig.EditCryMsgFColorChange(Sender: TObject);
var
  btColor:Byte;
begin
  btColor:=EditCryMsgFColor.Value;
  LabelCryMsgFColor.Color:=GetRGB(btColor);
  if not boOpened then exit;
  g_Config.btCryMsgFColor:=btColor;
  ModValue();
end;

procedure TfrmGameConfig.EditCryMsgBColorChange(Sender: TObject);
var
  btColor:Byte;
begin
  btColor:=EditCryMsgBColor.Value;
  LabelCryMsgBColor.Color:=GetRGB(btColor);
  if not boOpened then exit;
  g_Config.btCryMsgBColor:=btColor;
  ModValue();
end;

procedure TfrmGameConfig.EditGuildMsgFColorChange(Sender: TObject);
var
  btColor:Byte;
begin
  btColor:=EditGuildMsgFColor.Value;
  LabelGuildMsgFColor.Color:=GetRGB(btColor);
  if not boOpened then exit;
  g_Config.btGuildMsgFColor:=btColor;
  ModValue();
end;

procedure TfrmGameConfig.EditGuildMsgBColorChange(Sender: TObject);
var
  btColor:Byte;
begin
  btColor:=EditGuildMsgBColor.Value;
  LabelGuildMsgBColor.Color:=GetRGB(btColor);
  if not boOpened then exit;
  g_Config.btGuildMsgBColor:=btColor;
  ModValue();
end;

procedure TfrmGameConfig.EditGroupMsgFColorChange(Sender: TObject);
var
  btColor:Byte;
begin
  btColor:=EditGroupMsgFColor.Value;
  LabelGroupMsgFColor.Color:=GetRGB(btColor);
  if not boOpened then exit;
  g_Config.btGroupMsgFColor:=btColor;
  ModValue();
end;

procedure TfrmGameConfig.EditGroupMsgBColorChange(Sender: TObject);
var
  btColor:Byte;
begin
  btColor:=EditGroupMsgBColor.Value;
  LabelGroupMsgBColor.Color:=GetRGB(btColor);
  if not boOpened then exit;
  g_Config.btGroupMsgBColor:=btColor;
  ModValue();
end;

procedure TfrmGameConfig.EditCustMsgFColorChange(Sender: TObject);
var
  btColor:Byte;
begin
  btColor:=EditCustMsgFColor.Value;
  LabelCustMsgFColor.Color:=GetRGB(btColor);
  if not boOpened then exit;
  g_Config.btCustMsgFColor:=btColor;
  ModValue();
end;

procedure TfrmGameConfig.EditCustMsgBColorChange(Sender: TObject);
var
  btColor:Byte;
begin
  btColor:=EditCustMsgBColor.Value;
  LabelCustMsgBColor.Color:=GetRGB(btColor);
  if not boOpened then exit;
  g_Config.btCustMsgBColor:=btColor;
  ModValue();
end;

procedure TfrmGameConfig.ButtonMsgColorSaveClick(Sender: TObject);
begin
 Config.WriteInteger('Setup','HearMsgFColor',g_Config.btHearMsgFColor);
 Config.WriteInteger('Setup','HearMsgBColor', g_Config.btHearMsgBColor);
 Config.WriteInteger('Setup','WhisperMsgFColor', g_Config.btWhisperMsgFColor);
 Config.WriteInteger('Setup','WhisperMsgBColor', g_Config.btWhisperMsgBColor);
 Config.WriteInteger('Setup','GMWhisperMsgFColor', g_Config.btGMWhisperMsgFColor);
 Config.WriteInteger('Setup','GMWhisperMsgBColor', g_Config.btGMWhisperMsgBColor);
 Config.WriteInteger('Setup','CryMsgFColor', g_Config.btCryMsgFColor);
 Config.WriteInteger('Setup','CryMsgBColor', g_Config.btCryMsgBColor);
 Config.WriteInteger('Setup','GreenMsgFColor', g_Config.btGreenMsgFColor);
 Config.WriteInteger('Setup','GreenMsgBColor', g_Config.btGreenMsgBColor);
 Config.WriteInteger('Setup','BlueMsgFColor', g_Config.btBlueMsgFColor);
 Config.WriteInteger('Setup','BlueMsgBColor', g_Config.btBlueMsgBColor);
 Config.WriteInteger('Setup','RedMsgFColor', g_Config.btRedMsgFColor);
 Config.WriteInteger('Setup','RedMsgBColor', g_Config.btRedMsgBColor);
 Config.WriteInteger('Setup','GuildMsgFColor', g_Config.btGuildMsgFColor);
 Config.WriteInteger('Setup','GuildMsgBColor', g_Config.btGuildMsgBColor);
 Config.WriteInteger('Setup','GroupMsgFColor', g_Config.btGroupMsgFColor);
 Config.WriteInteger('Setup','GroupMsgBColor', g_Config.btGroupMsgBColor);
 Config.WriteInteger('Setup','CustMsgFColor', g_Config.btCustMsgFColor);
 Config.WriteInteger('Setup','CustMsgBColor', g_Config.btCustMsgBColor);

 uModValue();
end;

procedure TfrmGameConfig.ButtonHumanDieSaveClick(Sender: TObject);
begin
 Config.WriteBool('Setup','DieScatterBag', g_Config.boDieScatterBag);
 Config.WriteInteger('Setup','DieScatterBagRate',g_Config.nDieScatterBagRate);
 Config.WriteBool('Setup','DieRedScatterBagAll',g_Config.boDieRedScatterBagAll);
 Config.WriteInteger('Setup','DieDropUseItemRate',g_Config.nDieDropUseItemRate);
 Config.WriteInteger('Setup','DieRedDropUseItemRate',g_Config.nDieRedDropUseItemRate);
 Config.WriteBool('Setup','DieDropGold',g_Config.boDieDropGold);
 Config.WriteBool('Setup','KillByHumanDropUseItem',g_Config.boKillByHumanDropUseItem);
 Config.WriteBool('Setup','KillByMonstDropUseItem',g_Config.boKillByMonstDropUseItem);

 Config.WriteInteger('Setup','nFishSuccess',g_Config.nFishSuccess);    //超矫 犬伏

 uModValue();
end;

procedure TfrmGameConfig.ScrollBarDieDropUseItemRateChange(
  Sender: TObject);
var
  nPostion:Integer;
begin
  nPostion:=ScrollBarDieDropUseItemRate.Position;
  EditDieDropUseItemRate.Text:=IntToStr(nPostion);
  if not boOpened then exit;
  g_Config.nDieDropUseItemRate:=nPostion;
  ModValue();
end;

procedure TfrmGameConfig.ScrollBarDieRedDropUseItemRateChange(
  Sender: TObject);
var
  nPostion:Integer;
begin
  nPostion:=ScrollBarDieRedDropUseItemRate.Position;
  EditDieRedDropUseItemRate.Text:=IntToStr(nPostion);
  if not boOpened then exit;
  g_Config.nDieRedDropUseItemRate:=nPostion;
  ModValue();
end;

procedure TfrmGameConfig.ScrollBarDieScatterBagRateChange(Sender: TObject);
var
  nPostion:Integer;
begin
  nPostion:=ScrollBarDieScatterBagRate.Position;
  EditDieScatterBagRate.Text:=IntToStr(nPostion);
  if not boOpened then exit;
  g_Config.nDieScatterBagRate:=nPostion;
  ModValue();
end;

procedure TfrmGameConfig.CheckBoxKillByMonstDropUseItemClick(
  Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.boKillByMonstDropUseItem:=CheckBoxKillByMonstDropUseItem.Checked;
  ModValue();
end;

procedure TfrmGameConfig.CheckBoxKillByHumanDropUseItemClick(
  Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.boKillByHumanDropUseItem:=CheckBoxKillByHumanDropUseItem.Checked;
  ModValue();
end;

procedure TfrmGameConfig.CheckBoxDieScatterBagClick(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.boDieScatterBag:=CheckBoxDieScatterBag.Checked;
  ModValue();
end;

procedure TfrmGameConfig.CheckBoxDieDropGoldClick(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.boDieDropGold:=CheckBoxDieDropGold.Checked;
  ModValue();
end;

procedure TfrmGameConfig.CheckBoxDieRedScatterBagAllClick(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.boDieRedScatterBagAll:=CheckBoxDieRedScatterBagAll.Checked;
  ModValue();
end;

procedure TfrmGameConfig.RefCharStatusConf;
begin
  CheckBoxParalyCanRun.Checked:=g_Config.ClientConf.boParalyCanRun;
  CheckBoxParalyCanWalk.Checked:=g_Config.ClientConf.boParalyCanWalk;
  CheckBoxParalyCanHit.Checked:=g_Config.ClientConf.boParalyCanHit;
  CheckBoxParalyCanSpell.Checked:=g_Config.ClientConf.boParalyCanSpell;
  EditSuperPosion.Value := g_Config.nAttackSuperPosionRate;
end;

procedure TfrmGameConfig.ButtonCharStatusSaveClick(Sender: TObject);
begin
  Config.WriteBool('Setup','ParalyCanRun',g_Config.ClientConf.boParalyCanRun);
  Config.WriteBool('Setup','ParalyCanWalk',g_Config.ClientConf.boParalyCanWalk);
  Config.WriteBool('Setup','ParalyCanHit',g_Config.ClientConf.boParalyCanHit);
  Config.WriteBool('Setup','ParalyCanSpell',g_Config.ClientConf.boParalyCanSpell);
  Config.WriteInteger('Setup','AttackSuperPosionRate',g_Config.nAttackSuperPosionRate);
  uModValue();
end;

procedure TfrmGameConfig.CheckBoxParalyCanRunClick(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.ClientConf.boParalyCanRun:=CheckBoxParalyCanRun.Checked;
  ModValue();
end;

procedure TfrmGameConfig.CheckBoxParalyCanWalkClick(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.ClientConf.boParalyCanWalk:=CheckBoxParalyCanWalk.Checked;
  ModValue();
end;

procedure TfrmGameConfig.CheckBoxParalyCanHitClick(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.ClientConf.boParalyCanHit:=CheckBoxParalyCanHit.Checked;
  ModValue();
end;

procedure TfrmGameConfig.CheckBoxParalyCanSpellClick(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.ClientConf.boParalyCanSpell:=CheckBoxParalyCanSpell.Checked;
  ModValue();
end;




procedure TfrmGameConfig.Checkr64dellClick(Sender: TObject);
begin
  if not boOpened then Exit;
  g_Config.Reserved64dell := Checkr64dell.Checked;
  ModValue();
end;
procedure TfrmGameConfig.EditCustMsg1FColorChange(Sender: TObject);
var
  btColor:Byte;
begin
  btColor:=EditCustMsg1FColor.Value;
  LabelCustMsg1FColor.Color:=GetRGB(btColor);
  if not boOpened then exit;
  g_Config.btCustMsg1FColor:=btColor;
  ModValue();
end;

procedure TfrmGameConfig.EditCustMsg1BColorChange(Sender: TObject);
var
  btColor:Byte;
begin
  btColor:=EditCustMsg1BColor.Value;
  LabelCustMsg1BColor.Color:=GetRGB(btColor);
  if not boOpened then exit;
  g_Config.btCustMsg1BColor:=btColor;
  ModValue();
end;

procedure TfrmGameConfig.CheckPKKDPointClick(Sender: TObject); //懦单胶 葛靛
begin
  if not boOpened then exit;
  g_Config.boPKServer:=CheckPKKDPoint.Checked;
  ModValue();
end;

procedure TfrmGameConfig.EditFishDropRateChange(Sender: TObject);
begin
 if not boOpened then exit;
  g_Config.nFishSuccess:=EditFishDropRate.Value;
  ModValue();
end;

procedure TfrmGameConfig.EditChangeGameGoldRateChange(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.nExChangeGameGoldRate:=StrToFloat(Trim(EditChangeGameGoldRate.Text));
  ModValue();
end;

procedure TfrmGameConfig.EditChangeGoldRateChange(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.nExChangeGoldRate:=StrToInt(Trim(EditChangeGoldRate.Text));
  ModValue();
end;

procedure TfrmGameConfig.EditAllowGameGoldLevelChange(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.nAllowGameGoldLevel:=StrToInt(Trim(EditAllowGameGoldLevel.Text));
  ModValue();
end;

procedure TfrmGameConfig.EditGroupExpRate1Change(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.nGroupExpRate[1]:=StrToFloat(Trim(EditGroupExpRate1.Text));
  ModValue();
end;

procedure TfrmGameConfig.EditGroupExpRate2Change(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.nGroupExpRate[2]:=StrToFloat(Trim(EditGroupExpRate2.Text));
  ModValue();
end;

procedure TfrmGameConfig.EditGroupExpRate3Change(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.nGroupExpRate[3]:=StrToFloat(Trim(EditGroupExpRate3.Text));
  ModValue();
end;

procedure TfrmGameConfig.EditGroupExpRate4Change(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.nGroupExpRate[4]:=StrToFloat(Trim(EditGroupExpRate4.Text));
  ModValue();
end;

procedure TfrmGameConfig.EditGroupExpRate5Change(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.nGroupExpRate[5]:=StrToFloat(Trim(EditGroupExpRate5.Text));
  ModValue();
end;

procedure TfrmGameConfig.EditGroupExpRate6Change(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.nGroupExpRate[6]:=StrToFloat(Trim(EditGroupExpRate6.Text));
  ModValue();
end;

procedure TfrmGameConfig.EditGroupExpRate7Change(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.nGroupExpRate[7]:=StrToFloat(Trim(EditGroupExpRate7.Text));
  ModValue();
end;

procedure TfrmGameConfig.EditGroupExpRate8Change(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.nGroupExpRate[8]:=StrToFloat(Trim(EditGroupExpRate8.Text));
  ModValue();
end;

procedure TfrmGameConfig.EditGroupExpRate9Change(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.nGroupExpRate[9]:=StrToFloat(Trim(EditGroupExpRate9.Text));
  ModValue();
end;

procedure TfrmGameConfig.EditGroupExpRate10Change(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.nGroupExpRate[10]:=StrToFloat(Trim(EditGroupExpRate10.Text));
  ModValue();
end;

procedure TfrmGameConfig.EditGroupExpRate11Change(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.nGroupExpRate[11]:=StrToFloat(Trim(EditGroupExpRate11.Text));
  ModValue();
end;

procedure TfrmGameConfig.GroupExpRateSaveClick(Sender: TObject);
begin
  Config.WriteFloat('Setup','GroupExpRate1',g_Config.nGroupExpRate[1]);
  Config.WriteFloat('Setup','GroupExpRate2',g_Config.nGroupExpRate[2]);
  Config.WriteFloat('Setup','GroupExpRate3',g_Config.nGroupExpRate[3]);
  Config.WriteFloat('Setup','GroupExpRate4',g_Config.nGroupExpRate[4]);
  Config.WriteFloat('Setup','GroupExpRate5',g_Config.nGroupExpRate[5]);
  Config.WriteFloat('Setup','GroupExpRate6',g_Config.nGroupExpRate[6]);
  Config.WriteFloat('Setup','GroupExpRate7',g_Config.nGroupExpRate[7]);
  Config.WriteFloat('Setup','GroupExpRate8',g_Config.nGroupExpRate[8]);
  Config.WriteFloat('Setup','GroupExpRate9',g_Config.nGroupExpRate[9]);
  Config.WriteFloat('Setup','GroupExpRate10',g_Config.nGroupExpRate[10]);
  Config.WriteFloat('Setup','GroupExpRate11',g_Config.nGroupExpRate[11]);

  Config.WriteFloat('Setup','GroupExpRate12',g_Config.nGroupExpRate[12]);
  Config.WriteFloat('Setup','GroupExpRate13',g_Config.nGroupExpRate[13]);


  Config.WriteInteger('Setup','GroupBuffHp',g_Config.nGroupBuffHp);
  Config.WriteInteger('Setup','GroupBuffRecHp',g_Config.nGroupBuffRecHp);
  Config.WriteInteger('Setup','GroupBuffExp',g_Config.nGroupBuffExp);
  Config.WriteInteger('Setup','GroupBuffPo',g_Config.nGroupBuffPo);

  uModValue();
end;

procedure TfrmGameConfig.CheckTimeEventUseClick(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.boTimeEventUse:=CheckTimeEventUse.Checked;
  ModValue();
end;

procedure TfrmGameConfig.SpinHourEventChange(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.nHourEvent:=SpinHourEvent.Value;
  ModValue();
end;

procedure TfrmGameConfig.SpinMinEventChange(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.nMinEvent:=SpinMinEvent.Value;
  ModValue();
end;

procedure TfrmGameConfig.EditStartCastlewarMinChange(Sender: TObject);
begin
  if EditStartCastlewarMin.Text = '' then begin
    EditStartCastlewarMin.Text:='0';
    exit;
  end;
  if not boOpened then exit;
  g_Config.nStartCastlewarMin:=EditStartCastlewarMin.Value;
  ModValue();
end;

procedure TfrmGameConfig.EditNCastleNameChange(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.sNammanCastleName:=Trim(EditNCastleName.Text);
  ModValue();
end;

procedure TfrmGameConfig.EditNCastleHomeMapChange(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.sNammanCastleHomeMap:=Trim(EditNCastleHomeMap.Text);
  ModValue();
end;

procedure TfrmGameConfig.EditNCastleHomeXChange(Sender: TObject);
begin
  if EditNCastleHomeX.Text = '' then begin
    EditNCastleHomeX.Text:='0';
    exit;
  end;
  if not boOpened then exit;
  g_Config.nNammanCastleHomeX:=EditNCastleHomeX.Value;
  ModValue();
end;

procedure TfrmGameConfig.EditNCastleHomeYChange(Sender: TObject);
begin
  if EditNCastleHomeY.Text = '' then begin
    EditNCastleHomeY.Text:='0';
    exit;
  end;
  if not boOpened then exit;
  g_Config.nNammanCastleHomeY:=EditNCastleHomeY.Value;
  ModValue();
end;

procedure TfrmGameConfig.CastleWarDayGroupClick(Sender: TObject);
var
  boFalg:Integer;
begin
  if not boOpened then exit;
  g_Config.nStartCastlewarDay[0] := CastleWarDayGroup.ItemIndex;
  ModValue();
end;

procedure TfrmGameConfig.EditGroupExpRate12Change(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.nGroupExpRate[12]:=StrToFloat(Trim(EditGroupExpRate12.Text));
  ModValue();
end;

procedure TfrmGameConfig.EditGroupExpRate13Change(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.nGroupExpRate[13]:=StrToFloat(Trim(EditGroupExpRate13.Text));
  ModValue();
end;

procedure TfrmGameConfig.EditEatTickChange(Sender: TObject);
begin
  if EditEatTick.Text = '' then begin
    EditEatTick.Text := '0';
    Exit;
  end;
  if not boOpened then Exit;
  g_Config.dwEatTick := EditEatTick.Value;
  ModValue();
end;

procedure TfrmGameConfig.EditAllowPCPointLevelChange(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.nAllowPCPointLevel:=StrToInt(Trim(EditAllowPCPointLevel.Text));
  ModValue();
end;


procedure TfrmGameConfig.SpinWakeUpChange(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.nWakeUpRate:=SpinWakeUp.Value;
  ModValue();
end;

procedure TfrmGameConfig.EditSuperPosionChange(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.nAttackSuperPosionRate:=EditSuperPosion.Value;
  ModValue();
end;

procedure TfrmGameConfig.CastleWarDayGroup2Click(Sender: TObject);
var
  boFalg:Integer;
begin
  if not boOpened then exit;
  g_Config.nStartCastlewarDay[1] := CastleWarDayGroup2.ItemIndex;
  ModValue();
end;

procedure TfrmGameConfig.CastleWarDayGroup3Click(Sender: TObject);
var
  boFalg:Integer;
begin
  if not boOpened then exit;
  g_Config.nStartCastlewarDay[2] := CastleWarDayGroup3.ItemIndex;
  ModValue();
end;

procedure TfrmGameConfig.SpinGroupHpChange(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.nGroupBuffHp:=SpinGroupHp.Value;
  ModValue();
end;

procedure TfrmGameConfig.SpinGroupRecHpChange(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.nGroupBuffRecHp:=SpinGroupRecHp.Value;
  ModValue();
end;

procedure TfrmGameConfig.SpinGroupExpChange(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.nGroupBuffExp:=SpinGroupExp.Value;
  ModValue();
end;

procedure TfrmGameConfig.SpinGroupPoChange(Sender: TObject);
begin
  if not boOpened then exit;
  g_Config.nGroupBuffPo:=SpinGroupPo.Value;
  ModValue();
end;

procedure TfrmGameConfig.EditCastleFlagTimeChange(Sender: TObject);
begin
  if EditCastleFlagTime.Text = '' then begin
    EditCastleFlagTime.Text:='0';
    exit;
  end;
  if not boOpened then exit;
  g_Config.dwCastleFlagRegenTime:=EditCastleFlagTime.Value * (60 * 1000);
  ModValue();
end;

initialization
  //SVNRevision('$Id: GameConfig.pas 404 2006-09-09 17:59:18Z damian $');
end.