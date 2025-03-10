unit ItmUnit;
interface
uses
  Windows,Classes,SysUtils,Grobal2,Mudutil,SDK, Math;
type
  TItemUnit = class
  public
    m_ItemNameList        :TGList;
    constructor Create();
    destructor Destroy; override;

    function LoadCustomItemName():Boolean;
    function SaveCustomItemName():Boolean;
    function AddCustomItemName(nMakeIndex,nItemIndex:Integer;sItemName:String):Boolean;
    function DelCustomItemName(nMakeIndex,nItemIndex:Integer):Boolean;
    function GetCustomItemName(nMakeIndex,nItemIndex:Integer):String;
    procedure Lock();
    procedure UnLock();

    //���� ��ȯ �Լ�
      function RealAttackSpeed( wAtkSpd: WORD ): integer;   //-10~15�� ���� ���� ���� ����
      function NaturalAttackSpeed( iAtkSpd: integer ): WORD;   //0 �̻��� ���� ���� ���Ӱ�
      function GetAttackSpeed( bStdAtkSpd, bUserAtkSpd: BYTE ): BYTE;
      function UpgradeAttackSpeed( bUserAtkSpd: BYTE; iUpValue: integer ): BYTE;
  end;

  TItem = class
  public
    ItemType:Byte;
    Name:String[22];
    Owner:String[20];
    StdMode:Byte;
    Grade: Byte;
    Shape:Byte;
    Weight:Byte;
    AniCount:Byte;
    Source:Shortint;
    Reserved:Byte;
    NeedIdentify:Byte;
    Looks:Word;
    DuraMax:DWord;
    AC,AC2:Word;
    MAC,MAC2:Word;
    DC,DC2:Word;
    MC,MC2:Word;
    SC,SC2:Word;
    Need:DWord;
    NeedLevel:DWord;
    NeedOption:DWord;
    Price:UINT;
    Color              :Integer;
    //New Fields
    Undead:Shortint;
    Light:Byte;
    Tox:Word;
    ToxAvoid:Word;
    SlowDown:Word;
    MagAvoid:Word;
    HpAdd:Word;
    MpAdd:Word;
    RecHp:Word;
    RecMp:Word;
    AtkSpd:Word;     //�ߵ� ����
    Agility:Word;    //�ߵ� ����
    Accurate:Word;   //�ߵ� ����
    WearWeight:Word; //���� ����
    HumUp:Byte; //��Ǵ�
    CheckNoAss:Boolean;
    CheckAss:Boolean;
    CheckBonze:Boolean;
    HumRun:Boolean;//���ֱ��
    DDay:Byte;//��¦ ������
    MaxAmount:integer; //���� ����
    ItemGlow:Byte;
    //New Booleans
    Unique:Boolean;
    ChangeItem:Boolean;
    DisassembleItem:Boolean;
    NonStuff:Boolean;
    DropDell:Boolean;
    boCompound:Boolean;
    boOnlyHero:Boolean;
    boCanTrade:Boolean;
    boCanDrop:Boolean;
    boCanDeathDrop:Boolean;
    boCanRepair:Boolean;
    boCanSpecialRepair:Boolean;
    boCanStore:Boolean;
    boCanSell:Boolean;          //�Ǹű���
    boCanHeroBag:Boolean;

    WEffect :Integer;
    SetItemList: TList;
  private
    function  GetRandomRange(nCount, nRate:Integer):Integer;
    function  GetUpgrade2 (x, a: integer): integer;   //������

  public
    constructor Create();
    destructor Destroy; override;

    procedure GetStandardItem(var StdItem:TStdItem);
    function GetItemAddValue(UserItem:pTUserItem; var StdItem:TStdItem) : integer;
    function GetNewValue(nOldValue, nValue: Integer; btMethod: Byte): Byte;

    procedure RandomUpgradeItem(UserItem: pTUserItem);
    procedure RandomUpgradeUnknownItem(UserItem: pTUserItem);

    procedure ChangeItemUpgrade(UserItem, UserItem1: pTUserItem; btMethod: Byte);

  end;

  function GetItemName(UserItem:pTUserItem):String;
  function GetDecoName(Appr:integer):String;

implementation

uses HUtil32, M2Share;





{ TItem }


constructor TItem.Create;
begin
  inherited;
end;

destructor TItem.Destroy;
begin
  inherited;
end;

function TItem.GetRandomRange(nCount, nRate:Integer):Integer;
var
  I: Integer;
begin
  Result:=0;
  for I := 0 to nCount - 1 do
    if Random(nRate)= 0 then Inc(Result);
end;

function  TItem.GetUpgrade2 (x, a: integer): integer;       //������
var
   i: integer;
   iProb : integer;
begin
   Result := 0;
   for i:=x downto 1 do begin
      if i > x div 2 then begin
         //Ȯ���� ���� �� ����
         iProb := Trunc((Sqrt(Power(a, 2) - Power(i, 2)) / (a * i + Power(i, 2))) * 100);
      end else begin
         //Ȯ���� ���� �� ����
         iProb := Trunc( (Sqrt(1 - (Power(i, 2) / Power(a, 2))) * 100) / sqrt(i) );
      end;
        if Random(100) < iProb then begin
         Result := i{x} div 3;
         break;
      end;
   end;
end;



procedure TItem.GetStandardItem(var StdItem:TStdItem);
begin
  StdItem.Name          := Name;
  StdItem.Owner         := Owner;   //�뿩����

  StdItem.StdMode			  := StdMode;
	StdItem.Shape				  := Shape;
	StdItem.Weight			  := Weight;
	StdItem.AniCount		  := AniCount;
  StdItem.Grade		      := Grade;
  StdItem.Reserved      := Reserved;
	StdItem.Source			  := Source;
  StdItem.NeedIdentify  := NeedIdentify;
  StdItem.Looks				  := Looks;
	StdItem.DuraMax			  := DuraMax;
	StdItem.Need				  := Need;
	StdItem.NeedLevel		  := NeedLevel;
  StdItem.NeedOption		  := NeedOption;

	StdItem.Price				  := Price;
  StdItem.Tox           := Tox;
  StdItem.ToxAvoid      := ToxAvoid;
  StdItem.SlowDown      := SlowDown;
  StdItem.MagAvoid      := MagAvoid;
  StdItem.HpAdd         := HpAdd;
  StdItem.MpAdd         := MpAdd;
  StdItem.RecHp         := RecHp;
  StdItem.RecMp         := RecMp;
  StdItem.DC            := MakeLong(DC,DC2);
  StdItem.MC            := MakeLong(MC,MC2);
  StdItem.SC            := MakeLong(SC,SC2);
  StdItem.AC            := MakeLong(AC,AC2);
  StdItem.MAC           := MakeLong(MAC,MAC2);
  StdItem.AtkSpd        := AtkSpd;  //�ߵ� ����
  StdItem.Agility       := Agility;  //�ߵ� ����
  StdItem.Accurate      := Accurate;  //�ߵ� ����
  StdItem.WearWeight    := WearWeight; //���� ����
  StdItem.HumUp         := HumUp;//��Ǵ�
  StdItem.CheckNoAss    := CheckNoAss;
  StdItem.CheckAss      := CheckAss;
  StdItem.CheckBonze    := CheckBonze;
  StdItem.HumRun        := HumRun;//���ֱ��
  StdItem.DDay          := DDay; //��¦ ������
  StdItem.MaxAmount     := MaxAmount; //���� ����
  StdItem.ItemGlow      := ItemGlow;

  StdItem.DropDell      := DropDell;//������ ���� ����
  StdItem.ChangeItem    := ChangeItem;
  StdItem.DisassembleItem := DisassembleItem;
  StdItem.NonStuff      := NonStuff;
  StdItem.boOnlyHero    := boOnlyHero;
  StdItem.boCompound    := boCompound;
  StdItem.Unique        := Unique;
  StdItem.boCanTrade    := boCanTrade;
  StdItem.boCanDrop     := boCanDrop;
  StdItem.boCanDeathDrop := boCanDeathDrop;
  StdItem.boCanRepair   := boCanRepair;
  StdItem.boCanSpecialRepair := boCanSpecialRepair;
  StdItem.boCanStore      := boCanStore;
  StdItem.boCanSell       := boCanSell;
  StdItem.boCanHeroBag  :=  boCanHeroBag;

  StdItem.WEffect  :=  WEffect;

  StdItem.btValue[0]:= 0;
  StdItem.btValue[1]:= 0;
  StdItem.btValue[2]:= 0;
  StdItem.btValue[3]:= 0;
  StdItem.btValue[4]:= 0;
  StdItem.btValue[5]:= 0;
  StdItem.btValue[6]:= 0;
  StdItem.btValue[7]:= 0;
  StdItem.btValue[8]:= 0;
  StdItem.btValue[9]:= 0;
  StdItem.btValue[10]:= 0;
  StdItem.btValue[11]:= 0;
  StdItem.btValue[12]:= 0;
  StdItem.btValue[13]:= 0;
  StdItem.btValue[14]:= 0;
  StdItem.btValue[15]:= 0;
  StdItem.btValue[16]:= 0;
  StdItem.btValue[17]:= 0;
  StdItem.btValue[18]:= 0;
  StdItem.btValue[19]:= 0;
  StdItem.MaxDate := 0;
end;

function TItem.GetNewValue(nOldValue, nValue: Integer; btMethod: Byte): Byte;
begin
  case btMethod of
    0: Result := _MIN(nOldValue + nValue, 255);
    1: Result := _MAX(nOldValue - nValue, 0);
    2: Result := _MIN(_MAX(nValue, 0), 255);
  end;
end;

procedure TItem.ChangeItemUpgrade(UserItem , UserItem1: pTUserItem; btMethod: Byte);
begin
  UserItem.btValue[0] := GetNewValue(UserItem.btValue[0], UserItem1.btValue[0], btMethod);
  UserItem.btValue[1] := GetNewValue(UserItem.btValue[1], UserItem1.btValue[1], btMethod);
  UserItem.btValue[2] := GetNewValue(UserItem.btValue[2], UserItem1.btValue[2], btMethod);
  UserItem.btValue[3] := GetNewValue(UserItem.btValue[3], UserItem1.btValue[3], btMethod);
  UserItem.btValue[4] := GetNewValue(UserItem.btValue[4], UserItem1.btValue[4], btMethod);
  UserItem.btValue[5] := GetNewValue(UserItem.btValue[5], UserItem1.btValue[5], btMethod);
  UserItem.btValue[6] := GetNewValue(UserItem.btValue[6], UserItem1.btValue[6], btMethod);
  UserItem.btValue[7] := GetNewValue(UserItem.btValue[7], UserItem1.btValue[7], btMethod);
  UserItem.btValue[8] := GetNewValue(UserItem.btValue[8], UserItem1.btValue[8], btMethod);
  UserItem.btValue[9] := GetNewValue(UserItem.btValue[9], UserItem1.btValue[9], btMethod);
  UserItem.btValue[10] := GetNewValue(UserItem.btValue[10], UserItem1.btValue[10], btMethod);
  UserItem.btValue[11] := GetNewValue(UserItem.btValue[11], UserItem1.btValue[11], btMethod);
  UserItem.btValue[12] := GetNewValue(UserItem.btValue[12], UserItem1.btValue[12], btMethod);
  UserItem.btValue[13] := GetNewValue(UserItem.btValue[12], UserItem1.btValue[13], btMethod);
  UserItem.btValue[14] := GetNewValue(UserItem.btValue[14], UserItem1.btValue[14], btMethod);
  UserItem.btValue[15] := GetNewValue(UserItem.btValue[15], UserItem1.btValue[15], btMethod);

  UserItem.btValue[16] := GetNewValue(UserItem.btValue[16], UserItem1.btValue[16], btMethod);
  UserItem.btValue[17] := GetNewValue(UserItem.btValue[17], UserItem1.btValue[17], btMethod);

  UserItem.btValue[18] := GetNewValue(UserItem.btValue[18], UserItem1.btValue[18], btMethod);
  UserItem.btValue[19] := GetNewValue(UserItem.btValue[19], UserItem1.btValue[19], btMethod);
  UserItem.MaxDate    := UserItem1.MaxDate;
  UserItem.DuraMax    := UserItem1.DuraMax;
  UserItem.Amount     := UserItem1.Amount;
  UserItem.Dura       := UserItem1.Dura;
end;

function TItem.GetItemAddValue(UserItem:pTUserItem; var StdItem:TStdItem) : integer;    //GetUpgradeStdItem
var
   UCount  : integer;
begin
  UCount := 0;

  //all items have dc/mc/sc so 0-1-2 = dc/mc/sc for every item from now on
  StdItem.DC            := MakeLong(DC,DC2 + UserItem.btValue[0]);
  StdItem.MC            := MakeLong(MC,MC2 + UserItem.btValue[1]);
  StdItem.SC            := MakeLong(SC,SC2 + UserItem.btValue[2]);
  StdItem.Reserved      := Reserved;
  StdItem.Tox           := Tox;
  StdItem.ToxAvoid      := ToxAvoid;
  StdItem.SlowDown      := SlowDown;
  StdItem.MagAvoid      := MagAvoid;
  StdItem.HpAdd         := HpAdd;
  StdItem.MpAdd         := MpAdd;
  StdItem.RecHp         := RecHp;
  StdItem.RecMp         := RecMp;
  StdItem.Source        := Source;
  StdItem.AtkSpd        := AtkSpd;  //�ߵ� ����
  StdItem.Agility       := Agility;  //�ߵ� ����
  StdItem.Accurate      := Accurate;  //�ߵ� ����
  StdItem.WearWeight    := WearWeight; //���� ����
  StdItem.HumUp				  := HumUp; //��Ǵ�
  StdItem.CheckNoAss    := CheckNoAss;
  StdItem.CheckAss      := CheckAss;
  StdItem.CheckBonze      := CheckBonze;
  StdItem.HumRun        := HumRun; //���ֱ��
  StdItem.DDay          := DDay; //��¦ ������
  StdItem.MaxAmount     := MaxAmount; //���� ����
  StdItem.ItemGlow		  := ItemGlow;
  StdItem.Owner         := Owner;

  StdItem.DropDell      := DropDell;//������ ���� ����
  StdItem.ChangeItem    := ChangeItem;
  StdItem.DisassembleItem := DisassembleItem;
  StdItem.NonStuff      := NonStuff;
  StdItem.boOnlyHero    := boOnlyHero;
  StdItem.boCompound    := boCompound;
  StdItem.Unique        := Unique;
  StdItem.boCanTrade    := boCanTrade;
  StdItem.boCanDrop     := boCanDrop;
  StdItem.boCanDeathDrop := boCanDeathDrop;
  StdItem.boCanRepair   := boCanRepair;
  StdItem.boCanSpecialRepair := boCanSpecialRepair;
  StdItem.boCanStore      := boCanStore;
  StdItem.boCanSell       := boCanSell;
  StdItem.boCanHeroBag    := boCanHeroBag;

  StdItem.WEffect    := WEffect;

  StdItem.btValue[0]    := UserItem.btValue[0];
  StdItem.btValue[1]    := UserItem.btValue[1];
  StdItem.btValue[2]    := UserItem.btValue[2];
  StdItem.btValue[3]    := UserItem.btValue[3];
  StdItem.btValue[4]    := UserItem.btValue[4];
  StdItem.btValue[5]    := UserItem.btValue[5];
  StdItem.btValue[6]    := UserItem.btValue[6];
  StdItem.btValue[7]    := UserItem.btValue[7];
  StdItem.btValue[8]    := UserItem.btValue[8];
  StdItem.btValue[9]    := UserItem.btValue[9];
  StdItem.btValue[10]   := UserItem.btValue[10];
  StdItem.btValue[11]   := UserItem.btValue[11];
  StdItem.btValue[12]   := UserItem.btValue[12];
  StdItem.btValue[13]   := UserItem.btValue[13];
  StdItem.btValue[14]   := UserItem.btValue[14];
  StdItem.btValue[15]   := UserItem.btValue[15];
  StdItem.btValue[16]   := UserItem.btValue[16];
  StdItem.btValue[17]   := UserItem.btValue[17];
  StdItem.btValue[18]   := UserItem.btValue[18];
  StdItem.btValue[19]   := UserItem.btValue[19];
  StdItem.MaxDate       := UserItem.MaxDate;
  case StdMode of             //0:�ı�, 1:����, 2:����, 3:������, 4:��������, 5:��Ȯ, 6:����, 7:�ż�, 8:��ȭ, 9:����, 10:����,
    5, 6, 99, 90: begin  //ITEM_WEAPON       //11: �̸�, 12: x, 13: x, 14: x, 15: x, 16: x , 17: x , 18: x 19:�Ⱓ
        StdItem.DC:=MakeLong(DC, DC2 + UserItem.btValue[0]);
        StdItem.MC:=MakeLong(MC, MC2 + UserItem.btValue[1]);
        StdItem.SC:=MakeLong(SC, SC2 + UserItem.btValue[2]);
        StdItem.AC:=MakeLong(AC + UserItem.btValue[3], AC2);  //���� ���
        StdItem.MAC:=MakeLong(MAC + UserItem.btValue[4], MAC2);    //���� ���� ����
        if UserItem.btValue[7] in [1..10] then begin
          // �ż��� �پ� ������ ������ �������� �ʴ´�(sonmg 2005/02/16)
          if StdItem.Source >= 0 then
            StdItem.Source := UserItem.btValue[7]; //������ ������ ��Ÿ��
        end;

        if UserItem.btValue[10] <> 0 then
          StdItem.Reserved:=StdItem.Reserved or 1;
        StdItem.Tox:= Tox + UserItem.btValue[9];                 //���� �ߵ�
        StdItem.SlowDown:= SlowDown + UserItem.btValue[8];  //���� ��ȭ
        StdItem.Accurate:= Accurate + UserItem.btValue[5];    //���� ��Ȯ
        StdItem.AtkSpd := ItemUnit.GetAttackSpeed(AtkSpd, UserItem.btValue[6]);
        
        if UserItem.btValue[0] > 0 then inc ( UCount );
        if UserItem.btValue[1] > 0 then inc ( UCount );
        if UserItem.btValue[2] > 0 then inc ( UCount );
        if UserItem.btValue[3] > 0 then inc ( UCount );
        if UserItem.btValue[4] > 0 then inc ( UCount );
        if UserItem.btValue[5] > 0 then inc ( UCount );
        if UserItem.btValue[6] > 0 then inc ( UCount );
        if UserItem.btValue[7] > 0 then inc ( UCount );
        if UserItem.btValue[8] > 0 then inc ( UCount );
        if UserItem.btValue[9] > 0 then inc ( UCount );
        if UserItem.btValue[10] > 0 then inc ( UCount );

        if UserItem.btValue[12] > 0 then inc ( UCount );
        if UserItem.btValue[13] > 0 then inc ( UCount );
        if UserItem.btValue[14] > 0 then inc ( UCount );
        if UserItem.btValue[15] > 0 then inc ( UCount );
        if UserItem.btValue[16] > 0 then inc ( UCount );
        if UserItem.btValue[17] > 0 then inc ( UCount );
        if UserItem.btValue[18] > 0 then inc ( UCount );
    end;                               //0:�ı�, 1:����, 2:����, 3:���, 4:����, 5:x , 6:��ø, 7:����, 8:����, 9:��Ȯ, 10:x,
    10 ,11, 12: begin                  //11:�̸�, 12: x, 13: x, 14: x, 15: x, 16: x , 17: x , 18: x
        StdItem.DC:=MakeLong(DC,DC2 + UserItem.btValue[0]);
        StdItem.MC:=MakeLong(MC,MC2 + UserItem.btValue[1]);
        StdItem.SC:=MakeLong(SC,SC2 + UserItem.btValue[2]);

        StdItem.AC    := MakeLong(AC,AC2 + UserItem.btValue[3]);
        StdItem.MAC   := MakeLong(MAC,MAC2 + UserItem.btValue[4]);

        StdItem.Agility := Agility + UserItem.btValue[6];        //�� ��ø
        StdItem.Accurate := Accurate + UserItem.btValue[9];      //�� ��Ȯ
        StdItem.ToxAvoid := ToxAvoid + UserItem.btValue[7];      //�� �ߵ�����
        StdItem.MagAvoid := MagAvoid + UserItem.btValue[8];      //�� ��������

        if UserItem.btValue[0] > 0 then inc ( UCount );
        if UserItem.btValue[1] > 0 then inc ( UCount );
        if UserItem.btValue[2] > 0 then inc ( UCount );
        if UserItem.btValue[3] > 0 then inc ( UCount );
        if UserItem.btValue[4] > 0 then inc ( UCount );
        if UserItem.btValue[6] > 0 then inc ( UCount );
        if UserItem.btValue[7] > 0 then inc ( UCount );
        if UserItem.btValue[8] > 0 then inc ( UCount );
        if UserItem.btValue[9] > 0 then inc ( UCount );

        if UserItem.btValue[12] > 0 then inc ( UCount );
        if UserItem.btValue[13] > 0 then inc ( UCount );
        if UserItem.btValue[14] > 0 then inc ( UCount );
        if UserItem.btValue[15] > 0 then inc ( UCount );
        if UserItem.btValue[16] > 0 then inc ( UCount );
        if UserItem.btValue[17] > 0 then inc ( UCount );
        if UserItem.btValue[18] > 0 then inc ( UCount );
    end;                                   //0:�ı�, 1:����, 2:����, 3:���, 4:����, 5:���� , 6:����, 7:����, 8: ��Ȯ, 9:����, 10:����,
    15: begin    //����        //11:�̸�, 12: x, 13: x, 14: x, 15: x, 16: x , 17: x , 18: x
        StdItem.DC:=MakeLong(DC,DC2 + UserItem.btValue[0]);
        StdItem.MC:=MakeLong(MC,MC2 + UserItem.btValue[1]);
        StdItem.SC:=MakeLong(SC,SC2 + UserItem.btValue[2]);

        StdItem.AC    := MakeLong(AC,AC2 + UserItem.btValue[3]);
        StdItem.MAC   := MakeLong(MAC,MAC2 + UserItem.btValue[4]);
        if UserItem.btValue[5] > 0 then begin
          StdItem.Need:=UserItem.btValue[5];
        end;
        if UserItem.btValue[6] > 0 then begin
          StdItem.NeedLevel:=UserItem.btValue[6];
        end;
        StdItem.Accurate := Accurate + UserItem.btValue[8];      //���� ��Ȯ
        StdItem.ToxAvoid := ToxAvoid + UserItem.btValue[9];      //���� �ߵ�����
        StdItem.MagAvoid := MagAvoid + UserItem.btValue[10];     //���� ��������

        if UserItem.btValue[0] > 0 then inc ( UCount );
        if UserItem.btValue[1] > 0 then inc ( UCount );
        if UserItem.btValue[2] > 0 then inc ( UCount );
        if UserItem.btValue[3] > 0 then inc ( UCount );
        if UserItem.btValue[4] > 0 then inc ( UCount );
        if UserItem.btValue[5] > 0 then inc ( UCount );
        if UserItem.btValue[6] > 0 then inc ( UCount );
        if UserItem.btValue[8] > 0 then inc ( UCount );
        if UserItem.btValue[9] > 0 then inc ( UCount );
        if UserItem.btValue[10] > 0 then inc ( UCount );

        if UserItem.btValue[12] > 0 then inc ( UCount );
        if UserItem.btValue[13] > 0 then inc ( UCount );
        if UserItem.btValue[14] > 0 then inc ( UCount );
        if UserItem.btValue[15] > 0 then inc ( UCount );
        if UserItem.btValue[16] > 0 then inc ( UCount );
        if UserItem.btValue[17] > 0 then inc ( UCount );
        if UserItem.btValue[18] > 0 then inc ( UCount );
    end;
    19,20,21: //�����             //�����19               //0:�ı�, 1:����, 2:����, 3:���, 4:����, 5:���� , 6:����, 7:x, 8: x, 9:�ߵ�, 10:x,
          begin                                             //11:�̸� 12:�������� 13:x 14:��ȭ 15:��Ȯ 16:��ø 17:���� 18:x 19:�Ⱓ
        StdItem.DC := MakeLong(DC,DC2 + UserItem.btValue[0]);
        StdItem.MC := MakeLong(MC,MC2 + UserItem.btValue[1]);
        StdItem.SC := MakeLong(SC,SC2 + UserItem.btValue[2]);
        StdItem.AC := MakeLong(AC,AC2 + UserItem.btValue[3]);
        StdItem.MAC := MakeLong(MAC,MAC2 + UserItem.btValue[4]);

        StdItem.RecHp := RecHp + UserItem.btValue[7];           //üȸ(21)
        StdItem.RecMp := RecMp + UserItem.btValue[8];           //��ȸ(21)

        StdItem.Source := Source + UserItem.btValue[10];         //����� ���(19)

        StdItem.AtkSpd:= AtkSpd + UserItem.btValue[17];         //����� ����
        StdItem.Tox:= Tox + UserItem.btValue[9];                //����� �ߵ�
        StdItem.SlowDown:= SlowDown + UserItem.btValue[14];     //����� ��ȭ

        StdItem.Accurate:= Accurate + UserItem.btValue[15];     //����� ��Ȯ
        StdItem.MagAvoid:= MagAvoid + UserItem.btValue[12];     //����� �������� (19, 20, 21)
        StdItem.Agility := Agility + UserItem.btValue[16];      //����� ��ø

        if UserItem.btValue[5] > 0 then begin
          StdItem.Need:=UserItem.btValue[5];
        end;
        if UserItem.btValue[6] > 0 then begin
          StdItem.NeedLevel:=UserItem.btValue[6];
        end;

        if UserItem.btValue[0] > 0 then inc ( UCount );
        if UserItem.btValue[1] > 0 then inc ( UCount );
        if UserItem.btValue[2] > 0 then inc ( UCount );
        if UserItem.btValue[3] > 0 then inc ( UCount );
        if UserItem.btValue[4] > 0 then inc ( UCount );
        if UserItem.btValue[5] > 0 then inc ( UCount );
        if UserItem.btValue[6] > 0 then inc ( UCount );
        if UserItem.btValue[9] > 0 then inc ( UCount );
        if UserItem.btValue[10] > 0 then inc ( UCount );
        if UserItem.btValue[12] > 0 then inc ( UCount );
        if UserItem.btValue[14] > 0 then inc ( UCount );
        if UserItem.btValue[15] > 0 then inc ( UCount );
        if UserItem.btValue[16] > 0 then inc ( UCount );
        if UserItem.btValue[17] > 0 then inc ( UCount );
    end;
    22, 23: begin  //����22       //0:�ı� 1:���� 2:���� 3:��� 4:������� 5~7:���� 8:x 9:�ߵ� 10:x 11:�̸� 12:x 13:x 14:��ȭ 16:����
        StdItem.DC := MakeLong(DC,DC2 + UserItem.btValue[0]);
        StdItem.MC := MakeLong(MC,MC2 + UserItem.btValue[1]);
        StdItem.SC := MakeLong(SC,SC2 + UserItem.btValue[2]);
        StdItem.AC := MakeLong(AC,AC2 + UserItem.btValue[3]);
        StdItem.MAC := MakeLong(MAC,MAC2 + UserItem.btValue[4]);

        StdItem.Source := Source + UserItem.btValue[12];       //����23 �ߵ�ȸ��
        StdItem.ToxAvoid := ToxAvoid + UserItem.btValue[13];        //����23 �ߵ�����

        StdItem.AtkSpd:= AtkSpd + UserItem.btValue[16];         //���� ����
        StdItem.Tox:= Tox + UserItem.btValue[9];                //���� �ߵ�
        StdItem.SlowDown:= SlowDown + UserItem.btValue[14];     //���� ��ȭ
        if UserItem.btValue[5] > 0 then begin
          StdItem.Need:=UserItem.btValue[5];
        end;
        if UserItem.btValue[6] > 0 then begin
          StdItem.NeedLevel:=UserItem.btValue[6];
        end;

        if UserItem.btValue[0] > 0 then inc ( UCount );
        if UserItem.btValue[1] > 0 then inc ( UCount );
        if UserItem.btValue[2] > 0 then inc ( UCount );
        if UserItem.btValue[3] > 0 then inc ( UCount );
        if UserItem.btValue[4] > 0 then inc ( UCount );
        if UserItem.btValue[5] > 0 then inc ( UCount );
        if UserItem.btValue[6] > 0 then inc ( UCount );
        if UserItem.btValue[9] > 0 then inc ( UCount );
        if UserItem.btValue[14] > 0 then inc ( UCount );
        if UserItem.btValue[16] > 0 then inc ( UCount );
    end;
    24, 26:  begin      //����26
        StdItem.DC := MakeLong(DC,DC2 + UserItem.btValue[0]);
        StdItem.MC := MakeLong(MC,MC2 + UserItem.btValue[1]);
        StdItem.SC := MakeLong(SC,SC2 + UserItem.btValue[2]);
        StdItem.AC := MakeLong(AC,AC2 + UserItem.btValue[3]);
        StdItem.MAC := MakeLong(MAC,MAC2 + UserItem.btValue[4]);

        StdItem.Agility := Agility + UserItem.btValue[16];        //���� ��ø
        StdItem.Accurate := Accurate + UserItem.btValue[15];      //���� ��Ȯ

        if UserItem.btValue[5] > 0 then begin
          StdItem.Need:=UserItem.btValue[5];
        end;
        if UserItem.btValue[6] > 0 then begin
          StdItem.NeedLevel:=UserItem.btValue[6];
        end;

        if UserItem.btValue[0] > 0 then inc ( UCount );
        if UserItem.btValue[1] > 0 then inc ( UCount );
        if UserItem.btValue[2] > 0 then inc ( UCount );
        if UserItem.btValue[3] > 0 then inc ( UCount );
        if UserItem.btValue[4] > 0 then inc ( UCount );
        if UserItem.btValue[5] > 0 then inc ( UCount );
        if UserItem.btValue[6] > 0 then inc ( UCount );
        if UserItem.btValue[15] > 0 then inc ( UCount );
        if UserItem.btValue[16] > 0 then inc ( UCount );
    end;
    62:  begin     //�Ź�
        StdItem.DC := MakeLong(DC,DC2 + UserItem.btValue[0]);
        StdItem.MC := MakeLong(MC,MC2 + UserItem.btValue[1]);
        StdItem.SC := MakeLong(SC,SC2 + UserItem.btValue[2]);
        StdItem.AC := MakeLong(AC,AC2 + UserItem.btValue[3]);
        StdItem.MAC := MakeLong(MAC,MAC2 + UserItem.btValue[4]);

        StdItem.Agility := Agility + UserItem.btValue[16];        //��ø
        StdItem.Accurate := Accurate + UserItem.btValue[15];      //��Ȯ
        if UserItem.btValue[0] > 0 then inc ( UCount );
        if UserItem.btValue[1] > 0 then inc ( UCount );
        if UserItem.btValue[2] > 0 then inc ( UCount );
        if UserItem.btValue[3] > 0 then inc ( UCount );
        if UserItem.btValue[4] > 0 then inc ( UCount );
        if UserItem.btValue[15] > 0 then inc ( UCount );
        if UserItem.btValue[16] > 0 then inc ( UCount );
    end;
    63, 101, 102:  begin     //��ȣ�� , Ż��
        StdItem.AC  := MakeLong(AC, AC2 + UserItem.btValue[3]);
        StdItem.MAC := MakeLong(MAC, MAC2 + UserItem.btValue[4]);
        StdItem.DC  := MakeLong(DC, DC2 + UserItem.btValue[0]);
        StdItem.MC  := MakeLong(MC, MC2 + UserItem.btValue[1]);
        StdItem.SC  := MakeLong(SC, SC2 + UserItem.btValue[2]);
    end;
    64: begin  //��Ʈ
        StdItem.DC := MakeLong(DC,DC2 + UserItem.btValue[0]);
        StdItem.MC := MakeLong(MC,MC2 + UserItem.btValue[1]);
        StdItem.SC := MakeLong(SC,SC2 + UserItem.btValue[2]);
        StdItem.AC := MakeLong(AC,AC2 + UserItem.btValue[3]);
        StdItem.MAC := MakeLong(MAC,MAC2 + UserItem.btValue[4]);

        StdItem.Agility := Agility + UserItem.btValue[16];        //��ø
        StdItem.Accurate := Accurate + UserItem.btValue[15];      //��Ȯ
        StdItem.ToxAvoid := ToxAvoid + UserItem.btValue[8];       //��Ʈ �ߵ�����

        if UserItem.btValue[0] > 0 then inc ( UCount );
        if UserItem.btValue[1] > 0 then inc ( UCount );
        if UserItem.btValue[2] > 0 then inc ( UCount );
        if UserItem.btValue[3] > 0 then inc ( UCount );
        if UserItem.btValue[4] > 0 then inc ( UCount );
        if UserItem.btValue[8] > 0 then inc ( UCount );
        if UserItem.btValue[15] > 0 then inc ( UCount );
        if UserItem.btValue[16] > 0 then inc ( UCount );
    end;
    else begin
			StdItem.AC            := MakeLong(AC,AC2);
			StdItem.MAC	          := MakeLong(MAC,MAC2);
			StdItem.DC            := MakeLong(DC,DC2);
      StdItem.MC            := MakeLong(MC,MC2);
      StdItem.SC            := MakeLong(SC,SC2);
      StdItem.Reserved      := Reserved;
      StdItem.Tox           := Tox;
      StdItem.ToxAvoid      := ToxAvoid;
      StdItem.SlowDown      := SlowDown;
      StdItem.MagAvoid      := MagAvoid;
      StdItem.HpAdd         := HpAdd;
      StdItem.MpAdd         := MpAdd;
      StdItem.RecHp         := RecHp;
      StdItem.RecMp         := RecMp;
      StdItem.Source        := Source;
      StdItem.AtkSpd        := AtkSpd;  //�ߵ� ����
      StdItem.Agility       := Agility;  //�ߵ� ����
      StdItem.Accurate      := Accurate;
      StdItem.WearWeight    := WearWeight; //���� ����
      StdItem.HumUp				  := HumUp; //��Ǵ�
      StdItem.CheckNoAss    := CheckNoAss;
      StdItem.CheckAss      := CheckAss;
      StdItem.CheckBonze    := CheckBonze;
      StdItem.HumRun        := HumRun; //���ֱ��
      StdItem.DDay          := DDay; //��¦ ������
      StdItem.MaxAmount     := MaxAmount; //���� ����
      StdItem.ItemGlow		  := ItemGlow;
      StdItem.Owner         := Owner;
      StdItem.DropDell      := DropDell;//������ ���� ����
      StdItem.ChangeItem    := ChangeItem;
      StdItem.DisassembleItem := DisassembleItem;
      StdItem.NonStuff      := NonStuff;
      StdItem.boOnlyHero    := boOnlyHero;
      StdItem.boCompound    := boCompound;
      StdItem.Unique        := Unique;
      StdItem.boCanTrade    := boCanTrade;
      StdItem.boCanDrop     := boCanDrop;
      StdItem.boCanDeathDrop := boCanDeathDrop;
      StdItem.boCanRepair   := boCanRepair;
      StdItem.boCanSpecialRepair := boCanSpecialRepair;
      StdItem.boCanStore      := boCanStore;
      StdItem.boCanSell       := boCanSell;
      StdItem.boCanHeroBag    := boCanHeroBag;

      StdItem.WEffect    := WEffect;
		end;
  end;

  Result := UCount;
end;

// ��� ���Ӱ��� ���� ����(-10~15)������ ��ȯ���ִ� �Լ�.
function TItemUnit.RealAttackSpeed( wAtkSpd: WORD ): integer;
begin
   if wAtkSpd <= 10 then
      Result := - wAtkSpd
   else
      Result := wAtkSpd - 10;
end;

// ���� ����(-10~15)���� ��� ���Ӱ����� ��ȯ���ִ� �Լ�.
function TItemUnit.NaturalAttackSpeed( iAtkSpd: integer ): WORD;
begin
   if iAtkSpd <= 0 then
      Result := - iAtkSpd
   else
      Result := iAtkSpd + 10;
end;

// ���ҽ��� ������ ��� ���Ӱ��� �޾Ƽ� �� ������ ���� ��� ���Ӱ����� �����ִ� �Լ�.
function TItemUnit.GetAttackSpeed( bStdAtkSpd, bUserAtkSpd: BYTE ): BYTE;
var
   iTemp: integer;
begin
   iTemp := RealAttackSpeed( bStdAtkSpd ) + RealAttackSpeed( bUserAtkSpd );

   Result := BYTE( NaturalAttackSpeed( iTemp ) );
end;

// ���ҽ��� ������ ��� ���Ӱ��� �޾Ƽ� ���׷��̵� ���� �ݿ��Ͽ� �����ϴ� �Լ�.
// ���ϰ� : ������ ��� ���Ӱ�.
function TItemUnit.UpgradeAttackSpeed( bUserAtkSpd: BYTE; iUpValue: integer ): BYTE;
var
   iTemp: integer;
begin
   iTemp := RealAttackSpeed( bUserAtkSpd ) + iUpValue;

   Result := BYTE( NaturalAttackSpeed( iTemp ) );
end;


procedure TItem.RandomUpgradeItem(UserItem: pTUserItem);         //RandomUpgradeItem
var
  nUpgrade,nIncp,nVal:Integer;
begin
  case StdMode of
    5, 6, 99, 90: begin    //ITEM_WEAPON
      nUpgrade:=GetRandomRange(g_Config.nWeaponDCAddValueMaxLimit{12},g_Config.nWeaponDCAddValueRate{15});
      if Random(15) = 0 then UserItem.btValue[0]:=nUpgrade + 1;    //�ı�

      nUpgrade:=GetRandomRange(12,15);
      if Random(20) = 0 then begin
        nIncp:=(nUpgrade + 1) div 3;
        if nIncp > 0 then begin
          if Random(3) <> 0 then begin
            UserItem.btValue[6]:=nIncp;
          end else begin
            UserItem.btValue[6]:=nIncp + 10;     //����
          end;
        end;
      end;

      nUpgrade:=GetRandomRange(12,15);
      if Random(15) = 0 then UserItem.btValue[1]:=nUpgrade + 1;
      nUpgrade:=GetRandomRange(12,15);
      if Random(15) = 0 then UserItem.btValue[2]:=nUpgrade + 1;
      nUpgrade:=GetRandomRange(12,15);
      if Random(24) = 0 then begin
        UserItem.btValue[5]:=nUpgrade div 2 + 1;   //���� ��Ȯ
      end;
      nUpgrade:=GetRandomRange(12,12);
      if Random(3) < 2 then begin
        nVal:=(nUpgrade + 1) * 2000;
        UserItem.DuraMax:=_MIN(65000,UserItem.DuraMax + nVal);
        UserItem.Dura:=_MIN(65000,UserItem.Dura + nVal);
      end;
      nUpgrade:=GetRandomRange(12,15);
      if Random(10) = 0 then begin
        UserItem.btValue[7]:=nUpgrade div 2 + 1;   //���� �ٴ´� (����)
      end;
    end;
    10, 11, 12: begin
      nUpgrade:=GetRandomRange(6,15);
      if Random(30) = 0 then UserItem.btValue[3]:=nUpgrade + 1;
      nUpgrade:=GetRandomRange(6,15);
      if Random(30) = 0 then UserItem.btValue[4]:=nUpgrade + 1;

      nUpgrade:=GetRandomRange(g_Config.nDressDCAddValueMaxLimit{6},g_Config.nDressDCAddValueRate{20});
      if Random(g_Config.nDressDCAddRate{40}) = 0 then UserItem.btValue[0]:=nUpgrade + 1;
      nUpgrade:=GetRandomRange(g_Config.nDressMCAddValueMaxLimit{6},g_Config.nDressMCAddValueRate{20});
      if Random(g_Config.nDressMCAddRate{40}) = 0 then UserItem.btValue[1]:=nUpgrade + 1;
      nUpgrade:=GetRandomRange(g_Config.nDressSCAddValueMaxLimit{6},g_Config.nDressSCAddValueRate{20});
      if Random(g_Config.nDressSCAddRate{40}) = 0 then UserItem.btValue[2]:=nUpgrade + 1;

      nUpgrade:=GetRandomRange(6,10);
      if Random(8) < 6 then begin
        nVal:=(nUpgrade + 1) * 2000;
        UserItem.DuraMax:=_MIN(65000,UserItem.DuraMax + nVal);
        UserItem.Dura:=_MIN(65000,UserItem.Dura + nVal);
      end;
    end;
    20,24: begin       //�����20  ����24
      nUpgrade:=GetRandomRange(6,30);
      if Random(60) = 0 then UserItem.btValue[15]:=nUpgrade + 1;      //����� ���� ��Ȯ
      nUpgrade:=GetRandomRange(6,30);
      if Random(60) = 0 then UserItem.btValue[16]:=nUpgrade + 1;      //����� ���� ��ø
      nUpgrade:=GetRandomRange(g_Config.nNeckLace202124DCAddValueMaxLimit{6},g_Config.nNeckLace202124DCAddValueRate{20});
      if Random(g_Config.nNeckLace202124DCAddRate{30}) = 0 then UserItem.btValue[0]:=nUpgrade + 1;
      nUpgrade:=GetRandomRange(g_Config.nNeckLace202124MCAddValueMaxLimit{6},g_Config.nNeckLace202124MCAddValueRate{20});
      if Random(g_Config.nNeckLace202124MCAddRate{30}) = 0 then UserItem.btValue[1]:=nUpgrade + 1;
      nUpgrade:=GetRandomRange(g_Config.nNeckLace202124SCAddValueMaxLimit{6},g_Config.nNeckLace202124SCAddValueRate{20});
      if Random(g_Config.nNeckLace202124SCAddRate{30}) = 0 then UserItem.btValue[2]:=nUpgrade + 1;
      nUpgrade:=GetRandomRange(6,12);
      if Random(20) < 15 then begin
        nVal:=(nUpgrade + 1) * 1000;
        UserItem.DuraMax:=_MIN(65000,UserItem.DuraMax + nVal);
        UserItem.Dura:=_MIN(65000,UserItem.Dura + nVal);
      end;
    end;
    21: begin       //�����21
      nUpgrade:=GetRandomRange(6,30);
      if Random(60) = 0 then UserItem.btValue[15]:=nUpgrade + 1;    //����� ��Ȯ
      nUpgrade:=GetRandomRange(6,30);
      if Random(60) = 0 then UserItem.btValue[16]:=nUpgrade + 1;    //����� ��ø
      nUpgrade:=GetRandomRange(6,30);
      if Random(60) = 0 then UserItem.btValue[7]:=nUpgrade + 1;     //ü��ȸ��
      nUpgrade:=GetRandomRange(6,30);
      if Random(60) = 0 then UserItem.btValue[8]:=nUpgrade + 1;     //����ȸ��
      nUpgrade:=GetRandomRange(g_Config.nNeckLace202124DCAddValueMaxLimit{6},g_Config.nNeckLace202124DCAddValueRate{20});
      if Random(g_Config.nNeckLace202124DCAddRate{30}) = 0 then UserItem.btValue[0]:=nUpgrade + 1;
      nUpgrade:=GetRandomRange(g_Config.nNeckLace202124MCAddValueMaxLimit{6},g_Config.nNeckLace202124MCAddValueRate{20});
      if Random(g_Config.nNeckLace202124MCAddRate{30}) = 0 then UserItem.btValue[1]:=nUpgrade + 1;
      nUpgrade:=GetRandomRange(g_Config.nNeckLace202124SCAddValueMaxLimit{6},g_Config.nNeckLace202124SCAddValueRate{20});
      if Random(g_Config.nNeckLace202124SCAddRate{30}) = 0 then UserItem.btValue[2]:=nUpgrade + 1;
      nUpgrade:=GetRandomRange(6,12);
      if Random(20) < 15 then begin
        nVal:=(nUpgrade + 1) * 1000;
        UserItem.DuraMax:=_MIN(65000,UserItem.DuraMax + nVal);
        UserItem.Dura:=_MIN(65000,UserItem.Dura + nVal);
      end;
    end;
    26: begin          //����26
      nUpgrade:=GetRandomRange(6,20);
      if Random(20) = 0 then UserItem.btValue[3]:=nUpgrade + 1; //���
      nUpgrade:=GetRandomRange(6,20);
      if Random(20) = 0 then UserItem.btValue[4]:=nUpgrade + 1; //����
      nUpgrade:=GetRandomRange(g_Config.nArmRing26DCAddValueMaxLimit{6},g_Config.nArmRing26DCAddValueRate{20});
      if Random(g_Config.nArmRing26DCAddRate{30}) = 0 then UserItem.btValue[2]:=nUpgrade + 1;
      nUpgrade:=GetRandomRange(g_Config.nArmRing26MCAddValueMaxLimit{6},g_Config.nArmRing26MCAddValueRate{20});
      if Random(g_Config.nArmRing26MCAddRate{30}) = 0 then UserItem.btValue[3]:=nUpgrade + 1;
      nUpgrade:=GetRandomRange(g_Config.nArmRing26SCAddValueMaxLimit{6},g_Config.nArmRing26SCAddValueRate{20});
      if Random(g_Config.nArmRing26SCAddRate{30}) = 0 then UserItem.btValue[4]:=nUpgrade + 1;
      nUpgrade:=GetRandomRange(6,12);
      if Random(20) < 15 then begin
        nVal:=(nUpgrade + 1) * 1000;
        UserItem.DuraMax:=_MIN(65000,UserItem.DuraMax + nVal);
        UserItem.Dura:=_MIN(65000,UserItem.Dura + nVal);
      end;
    end;
    19: begin      //�����19
      nUpgrade:=GetRandomRange(6,20);
      if Random(40) = 0 then UserItem.btValue[12]:=nUpgrade + 1;    //��������
      nUpgrade:=GetRandomRange(6,20);
      if Random(40) = 0 then UserItem.btValue[10]:=nUpgrade + 1;    //���

      nUpgrade:=GetRandomRange(g_Config.nNeckLace19DCAddValueMaxLimit{6},g_Config.nNeckLace19DCAddValueRate{20});
      if Random(g_Config.nNeckLace19DCAddRate{30}) = 0 then UserItem.btValue[0]:=nUpgrade + 1;
      nUpgrade:=GetRandomRange(g_Config.nNeckLace19MCAddValueMaxLimit{6},g_Config.nNeckLace19MCAddValueRate{20});
      if Random(g_Config.nNeckLace19MCAddRate{30}) = 0 then UserItem.btValue[1]:=nUpgrade + 1;
      nUpgrade:=GetRandomRange(g_Config.nNeckLace19SCAddValueMaxLimit{6},g_Config.nNeckLace19SCAddValueRate{20});
      if Random(g_Config.nNeckLace19SCAddRate{30}) = 0 then UserItem.btValue[2]:=nUpgrade + 1;
      nUpgrade:=GetRandomRange(6,10);
      if Random(4) < 3 then begin
        nVal:=(nUpgrade + 1) * 1000;
        UserItem.DuraMax:=_MIN(65000,UserItem.DuraMax + nVal);
        UserItem.Dura:=_MIN(65000,UserItem.Dura + nVal);
      end;
    end;
    22: begin        //����22
      nUpgrade:=GetRandomRange(g_Config.nRing22DCAddValueMaxLimit{6},g_Config.nRing22DCAddValueRate{20});
      if Random(g_Config.nRing22DCAddRate{30}) = 0 then UserItem.btValue[0]:=nUpgrade + 1;
      nUpgrade:=GetRandomRange(g_Config.nRing22MCAddValueMaxLimit{6},g_Config.nRing22MCAddValueRate{20});
      if Random(g_Config.nRing22MCAddRate{30}) = 0 then UserItem.btValue[1]:=nUpgrade + 1;
      nUpgrade:=GetRandomRange(g_Config.nRing22SCAddValueMaxLimit{6},g_Config.nRing22SCAddValueRate{20});
      if Random(g_Config.nRing22SCAddRate{30}) = 0 then UserItem.btValue[2]:=nUpgrade + 1;
      nUpgrade:=GetRandomRange(6,12);
      if Random(4) < 3 then begin
        nVal:=(nUpgrade + 1) * 1000;
        UserItem.DuraMax:=_MIN(65000,UserItem.DuraMax + nVal);
        UserItem.Dura:=_MIN(65000,UserItem.Dura + nVal);
      end;
    end;
    23: begin  //����23
      nUpgrade:=GetRandomRange(6,20);
      if Random(40) = 0 then UserItem.btValue[12]:=nUpgrade + 1;      //���� �ߵ�����
      nUpgrade:=GetRandomRange(6,20);
      if Random(40) = 0 then UserItem.btValue[13]:=nUpgrade + 1;     //�ߵ�ȸ��
      nUpgrade:=GetRandomRange(g_Config.nRing23DCAddValueMaxLimit{6},g_Config.nRing23DCAddValueRate{20});
      if Random(g_Config.nRing23DCAddRate{30}) = 0 then UserItem.btValue[0]:=nUpgrade + 1;
      nUpgrade:=GetRandomRange(g_Config.nRing23MCAddValueMaxLimit{6},g_Config.nRing23MCAddValueRate{20});
      if Random(g_Config.nRing23MCAddRate{30}) = 0 then UserItem.btValue[1]:=nUpgrade + 1;
      nUpgrade:=GetRandomRange(g_Config.nRing23SCAddValueMaxLimit{6},g_Config.nRing23SCAddValueRate{20});
      if Random(g_Config.nRing23SCAddRate{30}) = 0 then UserItem.btValue[2]:=nUpgrade + 1;
      nUpgrade:=GetRandomRange(6,12);
      if Random(4) < 3 then begin    //����
        nVal:=(nUpgrade + 1) * 1000;
        UserItem.DuraMax:=_MIN(65000,UserItem.DuraMax + nVal);
        UserItem.Dura:=_MIN(65000,UserItem.Dura + nVal);
      end;
    end;
    15: begin   //����
      nUpgrade:=GetRandomRange(6,20);
      if Random(40) = 0 then UserItem.btValue[3]:=nUpgrade + 1; //���
      nUpgrade:=GetRandomRange(6,20);
      if Random(30) = 0 then UserItem.btValue[4]:=nUpgrade + 1;  //����
      nUpgrade:=GetRandomRange(g_Config.nHelMetDCAddValueMaxLimit{6},g_Config.nHelMetDCAddValueRate{20});
      if Random(g_Config.nHelMetDCAddRate{30}) = 0 then UserItem.btValue[0]:=nUpgrade + 1;    //�ı�
      nUpgrade:=GetRandomRange(g_Config.nHelMetMCAddValueMaxLimit{6},g_Config.nHelMetMCAddValueRate{20});
      if Random(g_Config.nHelMetMCAddRate{30}) = 0 then UserItem.btValue[1]:=nUpgrade + 1;    //����
      nUpgrade:=GetRandomRange(g_Config.nHelMetSCAddValueMaxLimit{6},g_Config.nHelMetSCAddValueRate{20});
      if Random(g_Config.nHelMetSCAddRate{30}) = 0 then UserItem.btValue[2]:=nUpgrade + 1;    //����
      nUpgrade:=GetRandomRange(6,12);
      if Random(4) < 3 then begin        //����
        nVal:=(nUpgrade + 1) * 1000;
        UserItem.DuraMax:=_MIN(65000,UserItem.DuraMax + nVal);
        UserItem.Dura:=_MIN(65000,UserItem.Dura + nVal);
      end;
    end;
  end;
end;

procedure TItem.RandomUpgradeUnknownItem(UserItem: pTUserItem);   //������
var
  nUpgrade,nRandPoint,nVal:Integer;
begin
   case StdMode of
     15: begin    //���� ����
       nRandPoint := GetUpgrade2 (g_Config.nUnknowHelMetACAddValueMin1Limit, g_Config.nUnknowHelMetACAddValueMax1Limit)
           + GetUpgrade2 (g_Config.nUnknowHelMetACAddValueMin2Limit, g_Config.nUnknowHelMetACAddValueMax2Limit);
       if nRandPoint > 0 then  UserItem.btValue[3]:=nRandPoint;        //���
       nUpgrade:=nRandPoint;

       nRandPoint := GetUpgrade2 (g_Config.nUnknowHelMetMACAddValueMinLimit, g_Config.nUnknowHelMetMACAddValueMaxLimit);
       if nRandPoint > 0 then  UserItem.btValue[4]:=nRandPoint;        //����
       Inc(nUpgrade,nRandPoint);

       nRandPoint := GetUpgrade2 (g_Config.nUnknowHelMetDCAddValueMinLimit, g_Config.nUnknowHelMetDCAddValueMaxLimit);
       if nRandPoint > 0 then  UserItem.btValue[0]:=nRandPoint;    //�ı�
       Inc(nUpgrade,nRandPoint);

       nRandPoint := GetUpgrade2 (g_Config.nUnknowHelMetMCAddValueMinLimit, g_Config.nUnknowHelMetMCAddValueMaxLimit);
       if nRandPoint > 0 then  UserItem.btValue[1]:=nRandPoint;    //����
       Inc(nUpgrade,nRandPoint);

       nRandPoint := GetUpgrade2 (g_Config.nUnknowHelMetSCAddValueMinLimit, g_Config.nUnknowHelMetSCAddValueMaxLimit);
       if nRandPoint > 0 then  UserItem.btValue[2]:=nRandPoint;    //����
       Inc(nUpgrade,nRandPoint);

       nRandPoint:=GetRandomRange(6,30);
       if nRandPoint > 0 then begin           //����
         nVal:=(nRandPoint + 1) * 1000;
         UserItem.DuraMax:=_MIN(65000,UserItem.DuraMax + nVal);
         UserItem.Dura:=_MIN(65000,UserItem.Dura + nVal);
       end;
        //�������� �ʴ� ������
       if Random(30) = 0 then UserItem.btValue[7]:=1;    //�������� �ʴ� �Ӽ�

       //���� �ʿ�ġ�� ����
       if nUpgrade >= 3 then begin
         if UserItem.btValue[3] >= 5 then begin     //�� ŭ
           UserItem.btValue[5]:=1;   //����
           UserItem.btValue[6]:=UserItem.btValue[3] * 3 + 25;
           exit;
         end;
         if UserItem.btValue[0] >= 2 then begin       //�ı��� ŭ
           UserItem.btValue[5]:=1;   //����
           UserItem.btValue[6]:=UserItem.btValue[0] * 4 + 35;
           exit;
         end;
         if UserItem.btValue[1] >= 2 then begin    //���� ŭ
           UserItem.btValue[5]:=2;   //�ʸ�
           UserItem.btValue[6]:=UserItem.btValue[1] * 2 + 18;
           exit;
         end;
         if UserItem.btValue[2] >= 2 then begin      //���� ŭ
           UserItem.btValue[5]:=3;    //�ʵ�
           UserItem.btValue[6]:=UserItem.btValue[2] * 2 + 18;
           exit;
         end;
         UserItem.btValue[6]:=nUpgrade * 2 + 18;
       end;
     end;
     22,23: begin      //���� ����
       nRandPoint := GetUpgrade2 (g_Config.nUnknowRingDCAddValueMinLimit, g_Config.nUnknowRingDCAddValueMaxLimit)
          + GetUpgrade2 (g_Config.nUnknowRingDCAddValueMinLimit, g_Config.nUnknowRingDCAddValueMaxLimit);
       if nRandPoint > 0 then  UserItem.btValue[0]:=nRandPoint;      //�ı�
       nUpgrade:=nRandPoint;

       nRandPoint := GetUpgrade2 (g_Config.nUnknowRingMCAddValueMinLimit, g_Config.nUnknowRingMCAddValueMaxLimit)
          + GetUpgrade2 (g_Config.nUnknowRingMCAddValueMinLimit, g_Config.nUnknowRingMCAddValueMaxLimit);
       if nRandPoint > 0 then  UserItem.btValue[1]:=nRandPoint;     //����
       Inc(nUpgrade,nRandPoint);

       nRandPoint := GetUpgrade2 (g_Config.nUnknowRingSCAddValueMinLimit, g_Config.nUnknowRingSCAddValueMaxLimit)
         + GetUpgrade2 (g_Config.nUnknowRingSCAddValueMinLimit, g_Config.nUnknowRingSCAddValueMaxLimit);
       if nRandPoint > 0 then  UserItem.btValue[2]:=nRandPoint;     //����
       Inc(nUpgrade,nRandPoint);


       nRandPoint:=GetRandomRange(6,30);    //����
       if nRandPoint > 0 then begin
         nVal:=(nRandPoint + 1) * 1000;
         UserItem.DuraMax:=_MIN(65000,UserItem.DuraMax + nVal);
         UserItem.Dura:=_MIN(65000,UserItem.Dura + nVal);
       end;
       if Random(30) = 0 then UserItem.btValue[7]:=1;  //�������� �ʴ� �Ӽ�

       if nUpgrade >= 3 then begin
         if UserItem.btValue[0] >= 3 then begin      //�ı��� ŭ
           UserItem.btValue[5]:=1;
           UserItem.btValue[6]:=UserItem.btValue[0] * 3 + 25;
           exit;
         end;
         if UserItem.btValue[1] >= 3 then begin       //���°� ŭ
           UserItem.btValue[5]:=2;
           UserItem.btValue[6]:=UserItem.btValue[1] * 2 + 18;
           exit;
         end;
         if UserItem.btValue[2] >= 3 then begin         //���°� ŭ
           UserItem.btValue[5]:=3;
           UserItem.btValue[6]:=UserItem.btValue[2] * 2 + 18;
           exit;
         end;
         UserItem.btValue[6]:=nUpgrade * 2 + 18;
       end;
     end;
     24,26: begin    //���� ����
      nRandPoint := GetUpgrade2 (g_Config.nUnknowNecklaceACAddValueMinLimit, g_Config.nUnknowNecklaceACAddValueMaxLimit);
      if nRandPoint > 0 then  UserItem.btValue[3]:=nRandPoint;        //���
      nUpgrade:=nRandPoint;

      nRandPoint := GetUpgrade2 (g_Config.nUnknowNecklaceMACAddValueMinLimit, g_Config.nUnknowNecklaceMACAddValueMaxLimit);
      if nRandPoint > 0 then  UserItem.btValue[4]:=nRandPoint;     //����
      Inc(nUpgrade,nRandPoint);

      nRandPoint := GetUpgrade2 (g_Config.nUnknowNecklaceDCAddValueMinLimit, g_Config.nUnknowNecklaceDCAddValueMaxLimit)
        + GetUpgrade2 (g_Config.nUnknowNecklaceDCAddValueMinLimit, g_Config.nUnknowNecklaceDCAddValueMaxLimit);
      if nRandPoint > 0 then  UserItem.btValue[0]:=nRandPoint;      //�ı�
      Inc(nUpgrade,nRandPoint);

      nRandPoint := GetUpgrade2 (g_Config.nUnknowNecklaceMCAddValueMinLimit, g_Config.nUnknowNecklaceMCAddValueMaxLimit)
      + GetUpgrade2 (g_Config.nUnknowNecklaceMCAddValueMinLimit, g_Config.nUnknowNecklaceMCAddValueMaxLimit);
      if nRandPoint > 0 then  UserItem.btValue[1]:=nRandPoint;     //����
      Inc(nUpgrade,nRandPoint);

  //    nRandPoint:=GetRandomRange(g_Config.nUnknowNecklaceSCAddValueMaxLimit{5},g_Config.nUnknowNecklaceSCAddValueMinLimit{30});
      nRandPoint := GetUpgrade2 (6, 7) + GetUpgrade2 (6, 7);
      if nRandPoint > 0 then  UserItem.btValue[2]:=nRandPoint;     //����
      Inc(nUpgrade,nRandPoint);

      nRandPoint:=GetRandomRange(6,30);
      if nRandPoint > 0 then begin
        nVal:=(nRandPoint + 1) * 1000;
        UserItem.DuraMax:=_MIN(65000,UserItem.DuraMax + nVal);
        UserItem.Dura:=_MIN(65000,UserItem.Dura + nVal);
      end;
      if Random(30) = 0 then UserItem.btValue[7]:=1;      //�������� �ʴ� �Ӽ�

      if nUpgrade >= 2 then begin
        if UserItem.btValue[3] >= 3 then begin
          UserItem.btValue[5]:=1;
          UserItem.btValue[6]:=UserItem.btValue[3] * 3 + 25;
          exit;
        end;
        if UserItem.btValue[0] >= 2 then begin
          UserItem.btValue[5]:=1;
          UserItem.btValue[6]:=UserItem.btValue[0] * 3 + 30;
          exit;
        end;
        if UserItem.btValue[1] >= 2 then begin
          UserItem.btValue[5]:=2;
          UserItem.btValue[6]:=UserItem.btValue[1] * 2 + 20;
          exit;
        end;
        if UserItem.btValue[2] >= 2 then begin
          UserItem.btValue[5]:=3;
          UserItem.btValue[6]:=UserItem.btValue[2] * 2 + 20;
          exit;
        end;
        UserItem.btValue[6]:=nUpgrade * 2 + 18;
      end;
    end;
  end;
end;



{ TItemUnit }
constructor TItemUnit.Create;
begin
  m_ItemNameList:=TGList.Create;
end;

destructor TItemUnit.Destroy;
var
  I: Integer;
begin
  for I := 0 to m_ItemNameList.Count - 1 do begin
    Dispose(pTItemName(m_ItemNameList.Items[I]));
  end;
  m_ItemNameList.Free;
  inherited;
end;

function GetItemName(UserItem:pTUserItem):String;
begin
  Result := '';
  if UserItem.btValue[11] = 1 then
    Result := ItemUnit.GetCustomItemName(UserItem.MakeIndex,UserItem.wIndex);
  if (Result = '') and (UserItem.btValue[11] = 2) then   //�ʴ���
    Result:= UserEngine.GetStdItemName(UserItem.wIndex) + '[' + IntToStr(UserItem.btValue[0]) + ']';
  if Result = '' then
    Result := UserEngine.GetStdItemName(UserItem.wIndex);

end;

function GetDecoName(Appr:Integer):String;         //����������
var
  i:integer;
begin
  result:='';
  for i:=0 to g_DecorationList.count -1 do begin
    if pTDecoItem(g_DecorationList[i]).Appr = Appr then begin
      result:= pTDecoItem(g_DecorationList[i]).Name;
      break;
    end;
  end;
end;


function TItemUnit.GetCustomItemName(nMakeIndex,
  nItemIndex: Integer): String;
var
  I: Integer;
  ItemName:pTItemName;
begin
  Result:='';
  m_ItemNameList.Lock;
  try
    for I := 0 to m_ItemNameList.Count - 1 do begin
      ItemName:=m_ItemNameList.Items[I];
      if (ItemName.nMakeIndex = nMakeIndex) and (ItemName.nItemIndex = nItemIndex) then begin
        Result:=ItemName.sItemName;
        break;
      end;
    end;
  finally
    m_ItemNameList.UnLock;
  end;
end;


function TItemUnit.AddCustomItemName(nMakeIndex, nItemIndex: Integer;
  sItemName: String): Boolean;
var
  I: Integer;
  ItemName:pTItemName;
begin
  Result:=False;
  m_ItemNameList.Lock;
  try
    for I := 0 to m_ItemNameList.Count - 1 do begin
      ItemName:=m_ItemNameList.Items[I];
      if (ItemName.nMakeIndex = nMakeIndex) and (ItemName.nItemIndex = nItemIndex) then begin
        exit;
      end;
    end;
    New(ItemName);
    ItemName.nMakeIndex:=nMakeIndex;
    ItemName.nItemIndex:=nItemIndex;
    ItemName.sItemName:=sItemName;
    m_ItemNameList.Add(ItemName);
    Result:=True;
  finally
    m_ItemNameList.UnLock;
  end;
end;

function TItemUnit.DelCustomItemName(nMakeIndex, nItemIndex: Integer): Boolean;
var
  I: Integer;
  ItemName:pTItemName;
begin
  Result:=False;
  m_ItemNameList.Lock;
  try
    for I := 0 to m_ItemNameList.Count - 1 do begin
      ItemName:=m_ItemNameList.Items[I];
      if (ItemName.nMakeIndex = nMakeIndex) and (ItemName.nItemIndex = nItemIndex) then begin
        Dispose(ItemName);
        m_ItemNameList.Delete(I);
        Result:=True;
        exit;
      end;
    end;
  finally
    m_ItemNameList.UnLock;
  end;
end;

function TItemUnit.LoadCustomItemName: Boolean;
var
  I:integer;
  LoadList:TStringList;
  sFileName:String;
  sLineText:String;
  sMakeIndex:String;
  sItemIndex:String;
  nMakeIndex:Integer;
  nItemIndex:Integer;
  sItemName:String;
  ItemName:pTItemName;
begin
  Result:=False;
  sFileName:=g_Config.sEnvirDir + 'ItemNameList.txt';
  LoadList:=TStringList.Create;
  if FileExists(sFileName) then begin
    m_ItemNameList.Lock;
    try
      m_ItemNameList.Clear;
      LoadList.LoadFromFile(sFileName);
      for I := 0 to LoadList.Count - 1 do begin
        sLineText:=Trim(LoadList.Strings[I]);
        sLineText:=GetValidStr3(sLineText, sMakeIndex, [' ',#9]);
        sLineText:=GetValidStr3(sLineText, sItemIndex, [' ',#9]);
        sLineText:=GetValidStr3(sLineText, sItemName, [' ',#9]);
        nMakeIndex:=Str_ToInt(sMakeIndex,-1);
        nItemIndex:=Str_ToInt(sItemIndex,-1);
        if (nMakeIndex >= 0) and (nItemIndex >= 0) then begin
          New(ItemName);
          ItemName.nMakeIndex:=nMakeIndex;
          ItemName.nItemIndex:=nItemIndex;
          ItemName.sItemName:=sItemName;
          m_ItemNameList.Add(ItemName);
        end;
      end;
      Result:=True;
    finally
      m_ItemNameList.UnLock;
    end;
  end else begin
    LoadList.SaveToFile(sFileName);
  end;
  LoadList.Free;
end;

function TItemUnit.SaveCustomItemName: Boolean;
var
  I:integer;
  SaveList:TStringList;
  sFileName:String;
  ItemName:pTItemName;
begin
  sFileName:=g_Config.sEnvirDir + 'ItemNameList.txt';
  SaveList:=TStringList.Create;
  m_ItemNameList.Lock;
  try
    for I := 0 to m_ItemNameList.Count - 1 do begin
      ItemName:=m_ItemNameList.Items[I];
      SaveList.Add(IntToStr(ItemName.nMakeIndex) + #9 + IntToStr(ItemName.nItemIndex) + #9 + ItemName.sItemName);
    end;
  finally
    m_ItemNameList.UnLock;
  end;
  SaveList.SaveToFile(sFileName);
  SaveList.Free;
  Result:=True;
end;

procedure TItemUnit.Lock;
begin
  m_ItemNameList.Lock;
end;

procedure TItemUnit.UnLock;
begin
  m_ItemNameList.UnLock;
end;


{---- Adjust global SVN revision ----}
initialization
  //SVNRevision('$Id: ItmUnit.pas 471 2006-10-08 11:13:46Z thedeath $');
end.
