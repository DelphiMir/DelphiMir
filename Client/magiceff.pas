unit magiceff;

interface

uses
  {svn, }Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grobal2, DxDraws, CliUtil, ClFunc, HUtil32, WIl;

const
   MG_READY       = 10;
   MG_FLY         = 6;
   MG_EXPLOSION   = 10;
   READYTIME  = 120;
   EXPLOSIONTIME = 100;
   FLYBASE = 10;
   EXPLOSIONBASE = 170;
   //EFFECTFRAME = 260;
   MAXMAGIC = 10;
   FLYOMAAXEBASE = 447;
   THORNBASE = 2967;
   ARCHERBASE = 2607;
   ARCHERBASE2 = 272; //2609;
   TDBBASE = 210;
   JMBASE = 1940; //����
   FLYFORSEC = 500;
   FIREGUNFRAME = 6;

   MAXEFFECT = 135;

   EffectBase: array[0..MAXEFFECT-1] of integer = (
    0,{1}
    200,{2}
    400,{3}
    600,{4}
    0,{5}
    900,{6}
    920,{7}
    940,{8}   //������
    20,{9}
    940,{10}
    940,{11}
    940,{12}
    0,{13}  //�����
    1380,{14}
    1500,{15}
    1520,{16}
    940,{17}
    1560,{18}
    1590,{19}
    1620,{20}   //������
    1650,{21}   //������
    1680,{22}
    0,{23}
    0,{24}
    0,{25}
    3960,{26}
    1790,{27}
    0,{28}
    3880,{29}     //�ּ��Ǹ�
    3920,{30}
    3840,{31}
    0,{32}
    40,{33}
    130, {34}
    160,{35}    //��������
    190,{36}
    0,{37}
    210,{38}    //�ַ���
    400,{39}    //�����
    600,{40}    //��ȭ��
    1500,{41}   //��ȥ��ȯ��
    650,{42}    //�нż�
    710,{43}    //������
    740,{44}    //���ļ�
    900,{45}
    940,{46}    //���ּ�
    990,{47}
    1040,{48}   //������
    1110, {49}
    1510, {50}   //÷����
    1520, {51}   //ȣ�ű⸷
    1540, {52}   //õ���ȯ
    1590, {53}   //õ�󳫿�
    1680, {54}   //�һ���
    1640, {55}   //����
    1690, {56}   //�ϼ�
    1790, {57}   //������
    1880, {58}   //��õ���
    2140, {59}   //ü��ǳ
    2230, {60}   //õ�̰�
    2320, {61}   //��ǳ��
    2340, {62}   //���ڼ�
    2380, {63}   //������
    2440, {64}   //��ź�
    2470, {65}   //ǳ�ż�
    2490, {66}   //�͵��˱�
    2580, {67}   //��ȭ��
    2620, {68}   //���ϳ���
    130,  {69}   //õ��
    80,   {70}   //�ɿ���
    100,  {71}   //������
    130,  {72}   //����˹�
    130,  {73}   //õ����
    130,  {74}   //�����
    250,  {75}   //������
    20,   {76}   //����õ
    200,  {77}   //�±���
    1820, {78}   //������
    1590, {79}   //����ȯ��
    990,  {80}   //��ħ��
    0,
    0,
    0,
    0,
    0,
    0,
    1650, {87}   //�ݰ�����
    1890, {88}   //������
    1750, {89}   //��õ����
    1550, {90}   //�����
    1510, {91}   //��������
    1490, {92}   //���󰭸�
    2000, {93}   //�����Ǵ�
    610,  {94}   //���������
    1180, {95}   //ûǳ���
    1200, {96}   //��������
    1720, {97}   //������
    2480, {98}   //����
    3280, {99}   //������
    3320, {100}  //��ȣ��Ÿ
    0,
    2840, {102}  //����
    890,  {103}  //�ű⹦��
    3650, {104}  //���߷ڰ�
    3710, {105}  //�ϵ�����
    0,    {106}  //�����
    390,  {107}  //����
    170,  {108}  //��õ���� - �·�
    0,    {109}  //Ÿ������ - �·�
    80,   {110}  //�������� - �·�
    0,    {111}  //������� - �·�
    1210, {112}  //ȣ�Ű��� - �·�
    0,    {113}  //õȭ���� - �·�
    500,  {114}  //���������- �·�
    610,  {115}  //������ - �ڰ�
    190,  {116}  //��ȣ�� - ����
    1150, {117}  //�ݰ��� - ����
    1230, {118}  //ȸǳõ���� - ����
    990,  {119}  //����Ȳ��� - �·�
    1500, {120}  //õ������ǳ - ����
    1570, {121}  //����� - �·�
    1790, {122}  //��Ȳ�� - �·�
    1830, {123} //��ȣ�� - �·�
    80,   {124} //�������� - ����
    260,  {125} //��ȭ��ǳ�� - ����
    630,  {126} //ȸõ�� - ����
    90,   {127}  //ȭ����ǳ - ����
    200,  {128}  //õ������ - ����
    860,  {129}  //��õ�� - ����
    520,  {130}  //�����ȯ�� - ����
    870,  {131}  //��õ - ����
    900,  {132}  //õ�� - ����
    970,  {133}  //����� - �ڰ�
    960,  {134}  //����õ���� - �ڰ�
    1070 {135}  //�������� - �ڰ�
    );

   EffectUpBase: array[0..MAXEFFECT-1] of integer = (
    0,{1}
    200,{2}
    400,{3}
    600,{4}
    0,{5}
    900,{6}
    920,{7}
    940,{8}   //������
    20,{9}
    940,{10}
    940,{11}
    940,{12}
    0,{13}  //�����
    1380,{14}
    1500,{15}
    1520,{16}
    940,{17}
    1560,{18}
    1590,{19}
    390,{20}   //������
    1650,{21}  //������
    1680,{22}
    0,{23}
    0,{24}
    0,{25}
    3960,{26}
    1790,{27}
    0,{28}
    590,{29} //�ּ��Ǹ�
    3920,{30}
    3840,{31}
    0,{32}
    40,{33}
    130, {34}
    160,{35}    //��������
    190,{36}
    0,{37}
    210,{38}    //�ַ���
    400,{39}    //�����
    600,{40}    //��ȭ��
    1500,{41}   //��ȥ��ȯ��
    650,{42}    //�нż�
    710,{43}    //������
    740,{44}    //���ļ�
    900,{45}
    940,{46}    //���ּ�
    990,{47}
    1040,{48}   //������
    1110, {49}
    270, {50}   //÷����
    280, {51}   //ȣ�ű⸷
    680, {52}   //õ���ȯ
    730, {53}   //õ�󳫿�
    1680, {54}   //�һ���
    500, {55}   //����
    1690, {56}   //�ϼ�
    420, {57}   //������
    1880, {58}   //��õ���
    2140, {59}   //ü��ǳ
    2230, {60}   //õ�̰�
    2320, {61}   //��ǳ��
    2340, {62}   //���ڼ�
    2380, {63}   //������
    2440, {64}   //��ź�
    1590, {65}   //ǳ�ż�
    2490, {66}   //�͵��˱�
    2580, {67}   //��ȭ��
    1410, {68}   //���ϳ���
    130,  {69}   //õ��
    80,   {70}   //�ɿ���
    100,  {71}   //������
    130,  {72}   //����˹�
    130,  {73}   //õ����
    130,  {74}   //�����
    250,  {75}   //������
    20,   {76}   //����õ
    200,  {77}   //�±���
    1820, {78}   //������
    1590, {79}   //����ȯ��
    990,  {80}   //��ħ��
    0,
    0,
    0,
    0,
    0,
    0,
    1650, {87}   //�ݰ�����
    1890, {88}   //������
    1750, {89}   //��õ����
    1550, {90}   //�����
    1510, {91}   //��������
    1490, {92}   //���󰭸�
    2000, {93}   //�����Ǵ�
    610,  {94}   //���������
    1180, {95}   //ûǳ���
    1200, {96}   //��������
    1720, {97}   //������
    2480, {98}   //����
    3280, {99}   //������
    3320, {100}  //��ȣ��Ÿ
    0,
    2840, {102}  //����
    890,  {103}  //�ű⹦��
    3650, {104}  //���߷ڰ�
    3710, {105}  //�ϵ�����
    0,    {106}  //�����
    390,  {107}  //����
    170,  {108}  //��õ���� - �·�
    0,    {109}  //Ÿ������ - �·�
    80,   {110}  //�������� - �·�
    0,    {111}  //������� - �·�
    1210, {112}  //ȣ�Ű��� - �·�
    0,    {113}  //õȭ���� - �·�
    500,  {114}  //���������- �·�
    610,  {115}  //������ - �ڰ�
    190,  {116}  //��ȣ�� - ����
    1150, {117}  //�ݰ��� - ����
    1230, {118}  //ȸǳõ���� - ����
    990,  {119}  //����Ȳ��� - �·�
    1500, {120}  //õ������ǳ - ����
    1570, {121}  //����� - �·�
    1790, {122}  //��Ȳ�� - �·�
    1830, {123} //��ȣ�� - �·�
    80,   {124} //�������� - ����
    260,  {125} //��ȭ��ǳ�� - ����
    630,  {126} //ȸõ�� - ����
    90,   {127}  //ȭ����ǳ - ����
    200,  {128}  //õ������ - ����
    860,  {129}  //��õ�� - ����
    520,  {130}  //�����ȯ�� - ����
    870,  {131}  //��õ - ����
    900,  {132}  //õ�� - ����
    970,  {133}  //����� - �ڰ�
    960,  {134}  //����õ���� - �ڰ�
    1070 {135}  //�������� - �ڰ�
    );

   MAXHITEFFECT = 20;
   HitEffectBase: array[0..MAXHITEFFECT-1] of integer = (    //m_nHitEffectNumber
    800,     //�����˹�
    1410,    //��˼�
    1700,    //�ݿ��˹�
    3480,    //��ȭ��
    3390,    //��ȭ�� ��¦��
    40,      //��ǳ��
    220,     //�ַ���
    740,     //���ļ�
    0,       //��˼� ��ȭ
    90,      //��ȭ�� ��ȭ
    180,     //��ǳ�� ��ȭ
    2490,    //����
    0,       //Ÿ������
    230,     //�������
    650,     //õȭ����
    510,     //���������
    870,     //��������� ��ȭ
    1420,    //ȸǳõ���� - ����
    1000,    //����Ȳ���
    260     //��ȭ��ǳ��
    );

    MAXASSEFFPE = 6;
   AssEffectBase: array[0..MAXASSEFFPE-1] of integer = (   //m_nAssEffectimg
    1961,   //ǳ�˼�
    2051,   //ǳ�˼�
    2490,   //�͵��˱�
    1231,   //ǳ�˼� ��ȭ
    1321,   //ǳ�˼� ��ȭ
    3760    //�����
    );
   MAXMAGICTYPE = 19;

type
   TMagicType = (mtReady,           mtFly,            mtExplosion,
                 mtFlyAxe,          mtFireWind,       mtFireGun,
                 mtLightingThunder, mtThunder,        mtExploBujauk,
                 mtBujaukGroundEffect, mtKyulKai,     mtFlyArrow,
                 mt12,              mt13,             mt14,
                 mt15,              mt16,             mtRedThunder,
                 mtLava,            mtRedFoxThunder,  mtRedFoxFire,
                 mtIceSickle,       mtFoxAnnoy,       mtFoxThunder,
                 mt17,              mt18,             mt19,
                 mtGumizul2,        mtGumizul,        mtIceShower,
                 mtRedThunder2,     mtFireShower,     mtFireBoom,
                 mtHellThunder,     mtHell2Thunder,   mtExploBujauk2,
                 mtFlyStone,        mt20,             mt25,
                 mtUpIceShower,     mtUpFireShower,   mtUpFirerave);

   TUseMagicInfo = record
      ServerMagicCode: integer;
      MagicSerial: integer;
      MimicSerial: integer;
      Target: integer; //recogcode
      EffectType: TMagicType;
      EffectNumber: integer;
      TargX: integer;
      TargY: integer;
      Recusion: Boolean;
      AniTime: integer;
   end;
   PTUseMagicInfo = ^TUseMagicInfo;

   TMagicEff = class//Size 0xC8
      m_boActive: Boolean;           //0x04
      ServerMagicId: integer;    //0x08
      magnumber: integer;
      MagOwner: TObject;         //0x0C
      TargetActor: TObject;      //0x10
      ImgLib: TWMImages;         //0x14
      EffectBase: integer;       //0x18
      MagExplosionBase: integer; //0x1C
      px, py: integer;           //0x20 0x24
      RX, RY: integer;           //0x28 0x2C
      Dir ,Dir16, OldDir16: byte;        //0x30  0x31
      TargetX, TargetY: integer;    //0x34 0x38
      TargetRx, TargetRy: integer;  //0x3C 0x40
      FlyX, FlyY, OldFlyX, OldFlyY: integer; //0x44 0x48 0x4C 0x50
      FlyXf, FlyYf: Real;        //0x54 0x5C
      Repetition: Boolean;       //0x64
      FixedEffect: Boolean;      //0x65
      MagicType: integer;        //0x68
      NextEffect: TMagicEff;     //0x6C
      ExplosionFrame: integer;   //0x70
      NextFrameTime: integer;    //0x74
      Light: integer;            //0x78
      n7C:Integer;
      bt80:Byte;
      bt81:Byte;
      start: integer;        //0x84
      curframe: integer;
      frame: integer;        //0x8C
      //2010/4/25 �ð��� ����Ʈ
      RepeatUntil: longword;
   private

      m_dwFrameTime: longword;   //0x90
      m_dwStartTime:  longword;  //0x94
      repeattime: longword;  //0x98
      steptime: longword;    //0x9C
      fireX, fireY: integer; //0xA0 0xA4
      firedisX, firedisY: integer;   //0xA8 0xAC
      newfiredisX, newfiredisY: integer;//0xB0 0xB4
      FireMyselfX, FireMyselfY: integer;//0xB8 0xBC
      prevdisx, prevdisy: integer; //0xC0 0xC4
   protected
      procedure GetFlyXY (ms: integer; var fx, fy: integer);
   public
      constructor Create (id, effnum, sx, sy, tx, ty: integer; mtype: TMagicType; Recusion: Boolean; anitime: integer);
      destructor Destroy; override;
      function  Run: Boolean; dynamic; //false
      function  Shift: Boolean; dynamic;
      procedure DrawEff (surface: TDirectDrawSurface); dynamic;
   end;

   TDelayMagicEff = class(TMagicEff)
    nDelayTime: LongWord;
    boRun: Boolean;
  public
    constructor Create(id, effnum, sx, sy, tx, ty: integer; mtype: TMagicType; Recusion: Boolean; AniTime: integer);
    function Run: Boolean; override;
    procedure DrawEff(surface: TDirectDrawSurface); override;
  end;

   TFlyingAxe = class (TMagicEff)
      FlyImageBase: integer;
      ReadyFrame: integer;
   public
      constructor Create (id, effnum, sx, sy, tx, ty: integer; mtype: TMagicType; Recusion: Boolean; anitime: integer);
      procedure DrawEff (surface: TDirectDrawSurface); override;
   end;

   TFlyingBug = class (TMagicEff)//Size 0xD0
      FlyImageBase: integer;//0xC8
      ReadyFrame: integer;//0xCC
   public
      constructor Create (id, effnum, sx, sy, tx, ty: integer; mtype: TMagicType; Recusion: Boolean; anitime: integer);
      procedure DrawEff (surface: TDirectDrawSurface); override;
   end;


   TFlyingStone = class (TFlyingAxe)  //�������� ��������
   public
      procedure DrawEff (surface: TDirectDrawSurface); override;
   end;

   TFlyingArrow = class (TFlyingAxe)  //�ü�
   public
      procedure DrawEff (surface: TDirectDrawSurface); override;
   end;

   TFlyingFireBall = class (TFlyingAxe) //0xD0
   public
      procedure DrawEff (surface: TDirectDrawSurface); override;
   end;
   TCharEffect = class (TMagicEff)
   public
      constructor Create (effbase, effframe: integer; target: TObject);
      function  Run: Boolean; override;
      procedure DrawEff (surface: TDirectDrawSurface); override;
   end;

   TMapEffect = class (TMagicEff)
   public
      RepeatCount: integer;
      constructor Create (effbase, effframe: integer; x, y: integer);
      function  Run: Boolean; override;
      procedure DrawEff (surface: TDirectDrawSurface); override;
   end;

   TScrollHideEffect = class (TMapEffect)
   public
      constructor Create (effbase, effframe: integer; x, y: integer; target: TObject);
      function  Run: Boolean; override;
   end;

   TLightingEffect = class (TMagicEff)
   public
      constructor Create (effbase, effframe: integer; x, y: integer);
      function  Run: Boolean; override;
   end;

   TFireNode = record
      x: integer;
      y: integer;
      firenumber: integer;
   end;

   TFireGunEffect = class (TMagicEff)    //������
   public
      OutofOil: Boolean;
      firetime: longword;
      FireNodes: array[0..FIREGUNFRAME-1] of TFireNode;
      constructor Create (effbase, sx, sy, tx, ty: integer);
      function  Run: Boolean; override;
      procedure DrawEff (surface: TDirectDrawSurface); override;
   end;

   TThuderEffect = class (TMagicEff)
   public
      constructor Create (effbase, tx, ty: integer; target: TObject);
      procedure DrawEff (surface: TDirectDrawSurface); override;
   end;

   TThuderEffectEx = class (TMagicEff)
   public
      constructor Create (effbase, tx, ty: integer; target: TObject; magnum:integer);
      procedure DrawEff (surface: TDirectDrawSurface); override;
   end;

   TLightingThunder = class (TMagicEff)
   public
      constructor Create (effbase, sx, sy, tx, ty: integer; target: TObject);
      procedure DrawEff (surface: TDirectDrawSurface); override;
   end;

   TIceSickle = class (TMagicEff)    //������
   public
      constructor Create (effbase, sx, sy, tx, ty: integer; target: TObject);
      procedure DrawEff (surface: TDirectDrawSurface); override;
   end;

   TBowEffect = class (TMagicEff)
   public
      MagicNumber:    integer;
      constructor Create (effbase, sx, sy, tx, ty: integer; target: TObject);
      procedure DrawEff (surface: TDirectDrawSurface); override;
   end;

   TExploBujaukEffect = class (TMagicEff)
   public
      MagicNumber:    integer;
      constructor Create (effbase, sx, sy, tx, ty: integer; target: TObject);
      procedure DrawEff (surface: TDirectDrawSurface); override;
   end;

   TBujaukGroundEffect = class (TMagicEff)//Size  0xD0
   public
      MagicNumber: integer;       //0xC8
      BoGroundEffect: Boolean;    //0xCC
      constructor Create (effbase, magicnumb, sx, sy, tx, ty: integer);
      function  Run: Boolean; override;
      procedure DrawEff (surface: TDirectDrawSurface); override;
   end;
   TNormalDrawEffect = class (TMagicEff)//Size 0xCC
     boC8:Boolean;
   public
      constructor Create(XX,YY:Integer;WmImage:TWMImages;effbase,nX:Integer;frmTime:LongWord;boFlag:Boolean);
      function  Run: Boolean; override;
      procedure DrawEff (surface: TDirectDrawSurface); override;
   end;

   TDelayNormalDrawEffect = class(TNormalDrawEffect)
    dwDelayTick: LongWord;
    boRun: Boolean;
    SoundID: Integer;
  public
    constructor Create(XX, YY: integer; WmImage: TWMImages; effbase, nX:
      integer; frmTime: longword; boFlag: Boolean; nDelayTime: LongWord);
    function Run: Boolean; override;
    procedure DrawEff(surface: TDirectDrawSurface); override;
  end;

   TBlasthitEffect = class(TMagicEff)      //������
   public
      constructor Create(effbase, effframe: Integer; target: TObject);
      function Run: Boolean; override;
      procedure DrawEff(Surface: TDirectDrawSurface); override;
   end;

   THumanEffects = class (TMagicEff)//Size 0xCC
     boC8:Boolean;
   public
      constructor Create(XX,YY:Integer;WmImage:TWMImages;effbase,nX:Integer;frmTime:LongWord;boFlag:Boolean);
      function  Run: Boolean; override;
      procedure DrawEff (surface: TDirectDrawSurface); override;
   end;

   TObjectEffects = class (TMagicEff)
     ObjectID : TObject;
     boC8:Boolean;
   public
     constructor Create(ObjectiD2:TObject;WmImage:TWMImages;effbase,nX:Integer;frmTime:LongWord;boFlag:Boolean);
     function  Run: Boolean; override;
     procedure DrawEff (surface: TDirectDrawSurface); override;
   end;

   TExploHuXiaoJueZhouEffect = class(TMagicEff)//��ȣ��Ÿ
   public
     constructor Create(effbase, sx, sY, tx, ty: Integer; target: TObject);
     procedure DrawEff(Surface: TDirectDrawSurface); override;
   end;

   TRedThunderEffect = class (TMagicEff)
    n0:integer;
   public
      constructor Create (effbase, tx, ty: integer; target: TObject);
      procedure DrawEff (surface: TDirectDrawSurface); override;
   end;
   THellThunderEffect = class (TMagicEff)
    n0:integer;
   public
      constructor Create (effbase, tx, ty: integer; target: TObject);
      procedure DrawEff (surface: TDirectDrawSurface); override;
   end;

   THell2ThunderEffect = class (TMagicEff)
    n0:integer;
   public
      constructor Create (effbase, tx, ty: integer; target: TObject);
      procedure DrawEff (surface: TDirectDrawSurface); override;
   end;

   TRedThunder2Effect = class (TMagicEff)
    n0:integer;
   public
      constructor Create (effbase, tx, ty: integer; target: TObject);
      procedure DrawEff (surface: TDirectDrawSurface); override;
   end;

   TIceShowerEffect = class (TMagicEff)
    n0:integer;
   public
      constructor Create (effbase, tx, ty: integer; target: TObject);
      procedure DrawEff (surface: TDirectDrawSurface); override;
   end;

   TFireShowerEffect = class (TMagicEff)
    n0:integer;
   public
      constructor Create (effbase, tx, ty: integer; target: TObject);
      procedure DrawEff (surface: TDirectDrawSurface); override;
   end;

   TIceShowerUpEffect = class (TMagicEff)
    n0:integer;
   public
      constructor Create (effbase, tx, ty: integer; target: TObject);
      procedure DrawEff (surface: TDirectDrawSurface); override;
   end;

   TFireShowerUpEffect = class (TMagicEff)
    n0:integer;
   public
      constructor Create (effbase, tx, ty: integer; target: TObject);
      procedure DrawEff (surface: TDirectDrawSurface); override;
   end;

   TFireShowerUpRaveEffect = class (TMagicEff)
    n0:integer;
   public
      constructor Create (effbase, tx, ty: integer; target: TObject);
      procedure DrawEff (surface: TDirectDrawSurface); override;
   end;

   TGumizulEffect = class (TMagicEff)
    n0:integer;
   public
      constructor Create (effbase, tx, ty: integer; target: TObject);
      procedure DrawEff (surface: TDirectDrawSurface); override;
   end;

   TFireBoomEffect = class (TMagicEff)
    n0:integer;
   public
      constructor Create (effbase, tx, ty: integer; target: TObject);
      procedure DrawEff (surface: TDirectDrawSurface); override;
   end;
   TGumizul2Effect = class (TMagicEff)
    n0:integer;
   public
      constructor Create (effbase, tx, ty: integer; target: TObject);
      procedure DrawEff (surface: TDirectDrawSurface); override;
   end;
   TFoxAnnoyEffect = class (TMagicEff)
    n0:integer;
   public
      constructor Create (effbase, tx, ty: integer; target: TObject);
      procedure DrawEff (surface: TDirectDrawSurface); override;
   end;
   TFoxThunderEffect = class (TMagicEff)
    n0:integer;
   public
      constructor Create (effbase, tx, ty: integer; target: TObject);
      procedure DrawEff (surface: TDirectDrawSurface); override;
   end;

   TLavaEffect = class (TMagicEff)
   public
      constructor Create (effbase, tx, ty: integer; target: TObject);
      procedure DrawEff (surface: TDirectDrawSurface); override;
   end;

   TsuduguiThunderEffect = class (TMagicEff)
   public
      constructor Create (effbase, tx, ty: integer; target: TObject);
      procedure DrawEff (surface: TDirectDrawSurface); override;
   end;

   TsuduguiredEffect = class (TMagicEff)
   public
      constructor Create (effbase, tx, ty: integer; target: TObject);
      procedure DrawEff (surface: TDirectDrawSurface); override;
   end;

   TRedFoxThunderEffect = class (TMagicEff)
   public
      constructor Create (effbase, tx, ty: integer; target: TObject);
      procedure DrawEff (surface: TDirectDrawSurface); override;
   end;

   TRedFoxFireEffect = class (TMagicEff)
   public
      constructor Create (effbase, tx, ty: integer; target: TObject);
      procedure DrawEff (surface: TDirectDrawSurface); override;
   end;

   procedure GetEffectBase (mag, mtype: integer; var wimg: TWMImages; var idx: integer);
   procedure GetUpEffectBase (mag, mtype: integer; var wimg: TWMImages; var idx: integer);

implementation

uses
   ClMain, Actor, SoundUtil, MShare;

procedure GetEffectBase (mag, mtype: integer; var wimg: TWMImages; var idx: integer);
begin
   wimg := nil;
   idx := 0;
                                 //���� ����Ʈ
   case mtype of
      0: begin
            case mag of
               8,27,33..35,37..39,41..42,43,44,45,46,47,48,49,50..67: begin        //���� ����Ʈ
                      wimg := g_WMagic2Images;
                      if mag in [0..MAXEFFECT - 1] then
                      idx := EffectBase[mag];
               end;
               68..74,93:begin //����3 �̹��� ����. ���������
                 wimg := g_WMagic3Images;
                 if mag in [0..MAXEFFECT - 1] then
                   idx := EffectBase[mag];
               end;

               75..77,79,86..92,96..99,101..105: begin  //����õ �±��� ������ ��ħ�� �ݰ����� ������ ��õ���� ����� �������� ���󰭸� �����Ǵ� ������ ���� ������ ��ȣ��Ÿ ���� �ű⹦�� ���߷ڰ� �ϵ����� �����
                 wimg := g_WMagicNewImages;
                 if mag in [0..MAXEFFECT - 1] then
                  idx := EffectBase[mag];
               end;
               94, 95: begin  //ûǳ��� ��������
                 wimg := g_WMagicUpImages;
                 if mag in [0..MAXEFFECT - 1] then
                  idx := EffectBase[mag];
               end;

               107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 118, 119, 120, 121, 122: begin
                //��õ����, Ÿ������, ��������, �������, ȣ�Ű���, ���������, ������, ��ȣ��, �ݰ���, õ������ǳ, �����, ��Ȳ��, ��ȣ�� - �·�����
                 wimg := g_WMagic_BonzeImages;
                 if mag in [0..MAXEFFECT - 1] then
                  idx := EffectBase[mag];
               end;

               123, 125..134: begin  //��������, ȸõ��, ȭ����ǳ õ������ ��õ�� ���� ��õ õ�� ����� ����õ���� ��������
                 wimg := g_WMagic0Images;
                 if mag in [0..MAXEFFECT - 1] then
                  idx := EffectBase[mag];
               end;

               78: begin //����ȯ��
                 wimg := g_WMagicImages;
                 if mag in [0..MAXEFFECT - 1] then
                   idx := EffectBase[mag];
               end;

               31: begin
                 wimg := g_WMonImagesArr[20];
                 if mag in [0..MAXEFFECT-1] then
                   idx := EffectBase[mag];
               end;
               36: begin
                 wimg := g_WMonImagesArr[21];
                 if mag in [0..MAXEFFECT-1] then
                   idx := EffectBase[mag];
               end;
               106: begin   //����
                 wimg := g_WDragonImg;
                 if mag in [0..MAXEFFECT-1] then
                   idx := EffectBase[mag];
               end;
               (SM_81-1), (SM_82-1), (SM_83-1): begin //����
                 wimg := g_WDragonImg;
                 if mag = SM_81-1 then begin
                   if g_Myself.m_nCurrX >= 84 then begin
                     idx:=130;
                   end else begin
                     idx:=140;
                   end;
                 end;
                 if mag = SM_82-1 then begin
                   if (g_Myself.m_nCurrX >= 78) and (g_Myself.m_nCurrY >= 48) then begin
                     idx:=150;
                   end else begin
                     idx:=160;
                   end;
                 end;
                 if mag = SM_83-1 then begin
                   idx:=180;
                 end;
               end;

               (SM_84-1), (SM_85-1), (SM_86-1): begin         //����
                 wimg := g_WMonImagesArr[30];
                 if mag = SM_84-1 then begin
                     idx:=3560;
                 end;
                 if mag = SM_85-1 then begin
                     idx:=3580;
                 end;
                 if mag = SM_86-1 then begin
                   idx:=3600;
                 end;
               end;
               MAGIC_TURTLE_WARTERATT-1{101-1}:
                  begin
                     wimg := g_WMonImagesArr[24];
                     idx := 1470;
                  end;
               else begin
                 wimg := g_WMagicImages;
                 if mag in [0..MAXEFFECT-1] then
                   idx := EffectBase[mag];
               end;
            end;
         end;
      1: begin     //�˹�
        case mag of
          0..4: begin
             wimg := g_WMagicImages;
             if mag in [0..MAXHITEFFECT-1] then begin
               idx := HitEffectBase[mag];
             end;
          end;
          5..7: begin
             wimg := g_WMagic2Images;
             if mag in [0..MAXHITEFFECT-1] then begin
               idx := HitEffectBase[mag];
             end;
          end;
          8..10: begin  //��ȭ
             wimg := g_WMagicUpImages;
             if mag in [0..MAXHITEFFECT-1] then begin
               idx := HitEffectBase[mag];
             end;
          end;
          11: begin  //����
             wimg := g_WMagicNewImages;
             if mag in [0..MAXHITEFFECT-1] then begin
               idx := HitEffectBase[mag];
             end;
          end;
          12, 13, 14, 15, 16, 17, 18: begin   //Ÿ������, �������, õȭ����, ���������, ȸǳõ����, ����Ȳ��� - �·�
             wimg := g_WMagic_BonzeImages;
             if mag in [0..MAXHITEFFECT - 1] then begin
               idx := HitEffectBase[mag];
             end;
          end;
          19: begin   //��ȭ��ǳ��
             wimg := g_WMagic0Images;
             if mag in [0..MAXHITEFFECT - 1] then begin
               idx := HitEffectBase[mag];
             end;
          end;

        end;
      end;
      2:begin
        case mag of
          0..2: begin
             wimg := g_WMagic2Images;
             if mag in [0..MAXHITEFFECT-1] then begin
               idx := HitEffectBase[mag];
             end;
          end;
          3..4: begin
             wimg := g_WMagicUpImages;
             if mag in [0..MAXHITEFFECT-1] then begin
               idx := HitEffectBase[mag];
             end;
          end;
          5: begin
             wimg := g_WMagicNewImages;
             if mag in [0..MAXHITEFFECT-1] then begin
               idx := HitEffectBase[mag];
             end;
          end;
        end;
        if mag in [0..MAXASSEFFPE-1]  then begin
          idx := AssEffectBase[mag];
        end;
      end;
   end;
end;

procedure GetUpEffectBase (mag, mtype: integer; var wimg: TWMImages; var idx: integer);
begin
   wimg := nil;
   idx := 0;
                                 //���� ����Ʈ
   case mtype of
      0: begin
            case mag of
               19,28,49,50,51,52,54,56,64,67: begin        //���� ����Ʈ
                      wimg := g_WMagicUpImages;
                      if mag in [0..MAXEFFECT - 1] then
                      idx := EffectUpBase[mag];
               end;
            end;
         end;
   end;
end;


constructor TMagicEff.Create (id, effnum, sx, sy, tx, ty: integer; mtype: TMagicType; Recusion: Boolean; anitime: integer);
var                          //���� ����Ʈ
   tax, tay: integer;
begin
   bt80 := 0;
   ImgLib := g_WMagicImages;

 {  if (not g_boEffect)  then begin
      Exit;
   end; }

   case mtype of
     mtFly,mtBujaukGroundEffect,mtExploBujauk: begin
       start:=0;
       frame:=6;
       curframe:=start;
       FixedEffect:=False;
       Repetition:=Recusion;
       ExplosionFrame:=10;
       if id = 38 then frame:=10;  //�ַ���
       if id = 39 then begin       //�����
         frame:=4;
         ExplosionFrame:=8;
       end;

       if id = 44 then begin
         ExplosionFrame:=16;//16
       end;

       if id = 75 then begin     //������
         frame:=6;
         ExplosionFrame:=12;
       end;

       if (id = SM_81) or (id = SM_82) or (id = SM_83) then begin    //����
         bt80:=1;
         Repetition:=True;
         if id = SM_81 then begin
         ImgLib:=g_WDragonImg;
           if g_MySelf.m_nCurrX >= 84 then begin
             EffectBase:=130;
           end else begin
             EffectBase:=140;
           end;
           bt81:=1;
         end;
         if id = SM_82 then begin
         ImgLib:=g_WDragonImg;
           if (g_MySelf.m_nCurrX >= 78) and (g_MySelf.m_nCurrY >= 48) then begin
             EffectBase:=150;
           end else begin
             EffectBase:=160;
           end;
           bt81:=2;
         end;
         if id = SM_83 then begin
         ImgLib:=g_WDragonImg;
           EffectBase:=180;
           bt81:=3;
         end;
         start:=0;
         frame:=10;
         MagExplosionBase:=200;
         ExplosionFrame:=10;
       end else
       if (id = SM_84) or (id = SM_85) or (id = SM_86) then begin    //��������
         bt80:=4;
         Repetition:=True;
         if id = SM_84 then begin

           EffectBase:=3560;
           start:=0;
           frame:=9;
           bt81:=3;
           MagExplosionBase:=3570;
           ExplosionFrame:=10;
           ImgLib:=g_WMonImagesArr[30];
         end;
         if id = SM_85 then begin

           EffectBase:=3580;
           start:=0;
           frame:=8;
           bt81:=3;
           MagExplosionBase:=3590;
           ExplosionFrame:=10;
           ImgLib:=g_WMonImagesArr[30];
         end;
         if id = SM_86 then begin
           EffectBase:=3600;
           start:=0;
           frame:=9;
           bt81:=3;
           MagExplosionBase:=3610;
           ExplosionFrame:=10;
           ImgLib:=g_WMonImagesArr[30];
         end;
       end else
       if id = MAGIC_TURTLE_WARTERATT then begin //��ö�ͼ� ������
            frame := 3;
       end;

     end;
     mt12: begin
       start:=0;
       frame:=6;
       curframe:=start;
       FixedEffect:=False;
       Repetition:=Recusion;
       ExplosionFrame:=1;
     end;
     mt20: begin
       start:=0;
       frame:=3;
       curframe:=start;
       FixedEffect:=False;
       Repetition:=Recusion;
       ExplosionFrame:=1;
     end;
     mt13: begin
       start:=0;
       frame:=20;
       curframe:=start;
       FixedEffect:=True;
       Repetition:=False;
       ExplosionFrame:=20;
       ImgLib:=g_WMonImagesArr[20];
     end;
     mtFoxAnnoy: begin
       start:=0;
       frame:=20;
       frame := 10;
       curframe := start;
       FixedEffect := TRUE;
       Repetition  := FALSE;
       ExplosionFrame := 20;
       ImgLib := g_WMonImagesArr[20];  //�⺻
     end;
     mtFoxThunder: begin
       start:=0;
       frame:=20;
       curframe:=start;
       FixedEffect:=True;
       Repetition:=False;
       ExplosionFrame:=20;
       ImgLib:=g_WMonImagesArr[23];
     end;
     mtIceShower,mtFireShower,mtUpIceShower,mtUpFireShower,mtUpFirerave:begin         //õ������
       start := 0;
       frame := -1;
       ExplosionFrame := 30;
       curframe := start;
       FixedEffect := TRUE;
       Repetition := FALSE;
     end;
     mtExplosion,mtThunder,mtHellThunder,mtHell2Thunder,mtLightingThunder,mtRedThunder,mtRedThunder2,mtLava,mtRedFoxThunder,mtRedFoxFire,mtFireBoom,mtGumizul2,mtGumizul,mtIceSickle,mt17,mt18: begin
       start := 0;
       frame := -1;
       ExplosionFrame := 10;
       curframe := start;
       FixedEffect := TRUE;
       Repetition := FALSE;
       if id = 91 then begin
        bt80:=2;
        frame:=20;
        EffectBase:=440;
       end;
       if id = SM_DRAGON_LIGHTING then begin
         bt80:=2;
         Randomize;
         case random(6) of
           0 : EffectBase := 230;
           1 : EffectBase := 240;
           2 : EffectBase := 250;
           3 : EffectBase := 230;
           4 : EffectBase := 240;
           5 : EffectBase := 250;
         end;
         Light:=4;
         ExplosionFrame:=5;
         frame:=5;
       end;
       if id = MAGIC_DUN_THUNDER then begin
         bt80:=3;
         case Random(3) of
           0:begin
             EffectBase:=400;
           end;
           1:begin
             EffectBase:=410;
           end;
           2:begin
             EffectBase:=420;
           end;
         end;
         Light:=4;
         ExplosionFrame:=5;
       end;
       if id = MAGIC_DUN_FIRE1 then begin
         bt80:=3;
         ExplosionFrame:=20;
       end;
       if id = MAGIC_DUN_FIRE2 then begin
         bt80:=3;
         Light:=3;
         ExplosionFrame:=10;
       end;
       if id = MAGIC_DRAGONFIRE then begin
         bt80:=3;
         Light:=5;
         ExplosionFrame:=20;
       end;
       if id = MAGIC_FIREBURN then begin   //�뼮��
         bt80:=3;
         Light:=4;
         ExplosionFrame:=35;
       end
       else if id = MAGIC_SERPENT_1 then begin //####
         bt80 := 3;
         Light := 4;
         ExplosionFrame := 10;
       end;
     end;
     mt14: begin
       start:=0;
       frame:=-1;
       curframe:=start;
       FixedEffect:=True;
       Repetition:=False;
       ImgLib:=g_WMagic2Images;
     end;
     mtFlyAxe: begin
       start := 0;
       frame := 3;
       curframe := start;
       FixedEffect := FALSE;
       Repetition := Recusion;
       ExplosionFrame := 3;
     end;
     mtFlyArrow: begin
       start := 0;
       frame := 1;
       curframe := start;
       FixedEffect := FALSE;
       Repetition := Recusion;
       ExplosionFrame := 1;
     end;
     mtFlyStone : begin //�������� ��������
       start := 0;
       frame := 4;
       curframe := start;
       FixedEffect := FALSE;
       Repetition := Recusion;
       ExplosionFrame := 1;
     end;
     mt15: begin
       start := 0;
       frame := 6;
       curframe := start;
       FixedEffect := FALSE;
       Repetition := Recusion;
       ExplosionFrame := 2;
     end;
     mt25: begin
       start := 0;
       frame := 4;
       curframe := start;
       FixedEffect := FALSE;
       Repetition := Recusion;
       ExplosionFrame := 10;
     end;
     mt16: begin
       start := 0;
       frame := 1;
       curframe := start;
       FixedEffect := FALSE;
       Repetition := Recusion;
       ExplosionFrame := 1;
     end;
   end;
   n7C:=0;


   RepeatUntil := 0;
   ServerMagicId := id; //ID
   EffectBase := effnum; //MagicDB - Effect
   TargetX := tx;   // "   target x
   TargetY := ty;   // "   target y

   if bt80 = 1 then begin
     if id = SM_81 then begin
         sx := sx-14;
         sy := sy+20;
      end else if id = SM_82 then begin
         sx := sx-70;
         sy := sy-10;
      end else if id = SM_83 then begin
         sx := sx-60;
         sy := sy-70;
      end;
     PlaySound(8208);
   end;
   fireX := sx;     //
   fireY := sy;     //
   FlyX := sx;      //
   FlyY := sy;
   OldFlyX := sx;
   OldFlyY := sy;
   FlyXf := sx;
   FlyYf := sy;
   FireMyselfX := g_MySelf.m_nRx * UNITX + g_MySelf.m_nShiftX;
   FireMyselfY := g_MySelf.m_nRy * UNITY + g_MySelf.m_nShiftY;
   if bt80 = 0 then begin
     MagExplosionBase := EffectBase + EXPLOSIONBASE;
   end;

   light := 1;

   if fireX <> TargetX then tax := abs(TargetX-fireX)
   else tax := 1;
   if fireY <> TargetY then tay := abs(TargetY-fireY)
   else tay := 1;
   if abs(fireX-TargetX) > abs(fireY-TargetY) then begin
      firedisX := Round((TargetX-fireX) * (500 / tax));
      firedisY := Round((TargetY-fireY) * (500 / tax));
   end else begin
      firedisX := Round((TargetX-fireX) * (500 / tay));
      firedisY := Round((TargetY-fireY) * (500 / tay));
   end;

   NextFrameTime := 50;
   m_dwFrameTime := GetTickCount;
   m_dwStartTime := GetTickCount;
   steptime := GetTickCount;
   RepeatTime := anitime;
   Dir := GetFlyDirection (sx, sy, tx, ty);
   Dir16 := GetFlyDirection16 (sx, sy, tx, ty);
   OldDir16 := Dir16;
   NextEffect := nil;
   m_boActive := TRUE;
   prevdisx := 99999;
   prevdisy := 99999;
end;

destructor TMagicEff.Destroy;
begin
   inherited Destroy;
end;

function  TMagicEff.Shift: Boolean;
   function OverThrough (olddir, newdir: integer): Boolean;
   begin
      Result := FALSE;
      if abs(olddir-newdir) >= 2 then begin
         Result := TRUE;
         if ((olddir=0) and (newdir=15)) or ((olddir=15) and (newdir=0)) then
            Result := FALSE;
      end;
   end;
var
   i, rrx, rry, ms, stepx, stepy, newstepx, newstepy, nn: integer;
   tax, tay, shx, shy, passdir16: integer;
   crash: Boolean;
   stepxf, stepyf: Real;
   bofly: Boolean;
begin
   Result := TRUE;
   if Repetition then begin
      if GetTickCount - steptime > longword(NextFrameTime) then begin
         steptime := GetTickCount;
         Inc (curframe);
         if curframe > start+frame-1 then
            curframe := start;
      end;
   end else begin
      if (frame > 0) and (GetTickCount - steptime > longword(NextFrameTime)) then begin
         steptime := GetTickCount;
         Inc (curframe);
         if curframe > start+frame-1 then begin
            curframe := start+frame-1;
            Result := FALSE;
         end;
      end;
   end;
   if (not FixedEffect) then begin           //���󰡴°�

      crash := FALSE;
      if TargetActor <> nil then begin
         ms := GetTickCount - m_dwFrameTime;      //���� ȿ���� �׸��� �󸶳� �ð��� �귶����?
         m_dwFrameTime := GetTickCount;
         //TargetX, TargetY �缳��
         PlayScene.ScreenXYfromMCXY (TActor(TargetActor).m_nRx,
                                     TActor(TargetActor).m_nRy,
                                     TargetX,
                                     TargetY);
         shx := (g_MySelf.m_nRx * UNITX + g_MySelf.m_nShiftX) - FireMyselfX;
         shy := (g_MySelf.m_nRy * UNITY + g_MySelf.m_nShiftY) - FireMyselfY;
         TargetX := TargetX + shx;
         TargetY := TargetY + shy;
          //���ο� Ÿ���� ��ǥ�� ���� �����Ѵ�.
         if FlyX <> TargetX then tax := abs(TargetX-FlyX)
         else tax := 1;
         if FlyY <> TargetY then tay := abs(TargetY-FlyY)
         else tay := 1;
         if abs(FlyX-TargetX) > abs(FlyY-TargetY) then begin
            newfiredisX := Round((TargetX-FlyX) * (500 / tax));
            newfiredisY := Round((TargetY-FlyY) * (500 / tax));
         end else begin
            newfiredisX := Round((TargetX-FlyX) * (500 / tay));
            newfiredisY := Round((TargetY-FlyY) * (500 / tay));
         end;
         if firedisX < newfiredisX then firedisX := firedisX + _MAX(1, (newfiredisX - firedisX) div 10);
         if firedisX > newfiredisX then firedisX := firedisX - _MAX(1, (firedisX - newfiredisX) div 10);
         if firedisY < newfiredisY then firedisY := firedisY + _MAX(1, (newfiredisY - firedisY) div 10);
         if firedisY > newfiredisY then firedisY := firedisY - _MAX(1, (firedisY - newfiredisY) div 10);

         stepxf := (firedisX/700) * ms;
         stepyf := (firedisY/700) * ms;
         FlyXf := FlyXf + stepxf;
         FlyYf := FlyYf + stepyf;
         FlyX := Round (FlyXf);
         FlyY := Round (FlyYf);
         //���� �缳��
         OldFlyX := FlyX;
         OldFlyY := FlyY;
         //������θ� Ȯ���ϱ� ���Ͽ�
         passdir16 := GetFlyDirection16 (FlyX, FlyY, TargetX, TargetY);

       {  DebugOutStr (IntToStr(prevdisx) + ' ' + IntToStr(prevdisy) + ' / ' + IntToStr(abs(TargetX-FlyX)) + ' ' + IntToStr(abs(TargetY-FlyY)) + '   ' +
                      IntToStr(firedisX) + '.' + IntToStr(firedisY) + ' ' +
                      IntToStr(FlyX) + '.' + IntToStr(FlyY) + ' ' +
                      IntToStr(TargetX) + '.' + IntToStr(TargetY));    }
         if ((abs(TargetX-FlyX) <= 15) and (abs(TargetY-FlyY) <= 15)) or
            ((abs(TargetX-FlyX) >= prevdisx) and (abs(TargetY-FlyY) >= prevdisy)) or
            OverThrough(OldDir16, passdir16) then begin
            crash := TRUE;
         end else begin
            prevdisx := abs(TargetX-FlyX);
            prevdisy := abs(TargetY-FlyY);
            //if (prevdisx <= 5) and (prevdisy <= 5) then crash := TRUE;
         end;
         OldDir16 := passdir16;

      end else begin
         ms := GetTickCount - m_dwFrameTime;    //ȿ���� ������ �󸶳� �ð��� �귶����?

       //  rrx := TargetX - fireX;
       //  rry := TargetY - fireY;

         stepx := Round ((firedisX/900) * ms);
         stepy := Round ((firedisY/900) * ms);
         FlyX := fireX + stepx;
         FlyY := fireY + stepy;
      end;

      PlayScene.CXYfromMouseXY (FlyX, FlyY, Rx, Ry);

      if crash and (TargetActor <> nil) then begin
         FixedEffect := TRUE;       //����
         Repetition := FALSE;
         if bt80 = 1 then begin     //�������
            PlayScene.NewMagic (nil, MAGIC_DRAGONFIRE, MAGIC_DRAGONFIRE,
                                TActor(TargetActor).m_nRx, TActor(TargetActor).m_nRy, TActor(TargetActor).m_nRx, TActor(TargetActor).m_nRy, 0, mtThunder, FALSE, 30, bofly);
            PlaySound (8207);
         end else begin
          start := 0;
          frame := ExplosionFrame;
          curframe := start;
          //������ ����
          PlaySound (TActor(MagOwner).m_nMagicExplosionSound);
         end;
      end;
      //if not Map.CanFly (Rx, Ry) then
      //   Result := FALSE;
   end;
   if FixedEffect then begin
      if frame = -1 then frame := ExplosionFrame;
      if TargetActor = nil then begin
         FlyX := TargetX - ((g_MySelf.m_nRx * UNITX + g_MySelf.m_nShiftX) - FireMyselfX);
         FlyY := TargetY - ((g_MySelf.m_nRy * UNITY + g_MySelf.m_nShiftY) - FireMyselfY);
         PlayScene.CXYfromMouseXY (FlyX, FlyY, Rx, Ry);
      end else begin
         Rx := TActor(TargetActor).m_nRx;
         Ry := TActor(TargetActor).m_nRy;
         PlayScene.ScreenXYfromMCXY (Rx, Ry, FlyX, FlyY);
         FlyX := FlyX + TActor(TargetActor).m_nShiftX;
         FlyY := FlyY + TActor(TargetActor).m_nShiftY;
      end;
   end;
end;

procedure TMagicEff.GetFlyXY (ms: integer; var fx, fy: integer);
var
   rrx, rry, stepx, stepy: integer;
begin
   rrx := TargetX - fireX;
   rry := TargetY - fireY;

   stepx := Round ((firedisX/900) * ms);
   stepy := Round ((firedisY/900) * ms);
   fx := fireX + stepx;
   fy := fireY + stepy;
end;

function  TMagicEff.Run: Boolean;
begin
   Result := Shift;
   if Result then
      if GetTickCount - m_dwStartTime > 10000 then //2000 then
         Result := FALSE
      else Result := TRUE;
end;

procedure TMagicEff.DrawEff (surface: TDirectDrawSurface);
var
  img: integer;
  d: TDirectDrawSurface;
  shx, shy: integer;
begin

   if m_boActive and ((Abs(FlyX-fireX) > 15) or (Abs(FlyY-fireY) > 15) or FixedEffect) then begin

      shx := (g_MySelf.m_nRx * UNITX + g_MySelf.m_nShiftX) - FireMyselfX;
      shy := (g_MySelf.m_nRy * UNITY + g_MySelf.m_nShiftY) - FireMyselfY;

      if not FixedEffect then begin     //���ư��°�
         if (bt80 in [1,4]) or (ServerMagicid = SM_81) or (ServerMagicid = SM_82) or (ServerMagicid = SM_83) or  //����
            (ServerMagicid = SM_84) or (ServerMagicid = SM_85) or (ServerMagicid = SM_86) then begin    //����
           img := EffectBase;
           d := ImgLib.GetCachedImage (img + curframe, px, py);
         end else begin
           img := EffectBase + FLYBASE + Dir16 * 10;
           d := ImgLib.GetCachedImage (img + curframe, px, py);
         end;

         if d <> nil then begin
           DrawBlend (surface,
                       FlyX + px - UNITX div 2 - shx,
                       FlyY + py - UNITY div 2 - shy,
                       d, 1);
         end;
      end else begin
         //�����°�
         if magnumber = 76 then begin //����õ
           img := MagExplosionBase + curframe + Dir * 10;
         end else
         if magnumber in [77,80] then begin //�±��� ��ħ��
           img := MagExplosionBase + curframe + Dir16 * 10;
         end else

         img := MagExplosionBase + curframe; //EXPLOSIONBASE;
         d := ImgLib.GetCachedImage (img, px, py);
         if d <> nil then begin
            DrawBlend (surface,
                       FlyX + px - UNITX div 2,
                       FlyY + py - UNITY div 2,
                       d, 1);
         end;
      end;
   end;
end;


{ TDelayMagicEff }

constructor TDelayMagicEff.Create(id, effnum, sx, sy, tx, ty: integer; mtype: TMagicType; Recusion: Boolean;
  AniTime: integer);
begin
  inherited;
  boRun := False;
end;

procedure TDelayMagicEff.DrawEff(surface: TDirectDrawSurface);
var
  img: integer;
  d: TDirectDrawSurface;
  shx, shy: integer;
begin
  if not boRun then exit;
  if m_boActive and ((abs(FlyX - fireX) > 15) or (abs(FlyY - fireY) > 15) or FixedEffect) then begin

    shx := (g_Myself.m_nRx * UNITX + g_Myself.m_nShiftX) - FireMyselfX;
    shy := (g_Myself.m_nRy * UNITY + g_Myself.m_nShiftY) - FireMyselfY;

    if not FixedEffect then begin
      img := EffectBase + Dir16 * 10;
      d := ImgLib.GetCachedImage(img + curframe, px, py);
      if d <> nil then begin
        DrawBlend(surface,
          FlyX + px - UNITX div 2 - shx,
          FlyY + py - UNITY div 2 - shy,
          d, 1);
      end;
    end
    else begin
      img := MagExplosionBase + curframe; //EXPLOSIONBASE;
      d := ImgLib.GetCachedImage(img, px, py);
      if d <> nil then begin
        DrawBlend(surface,
          FlyX + px - UNITX div 2,
          FlyY + py - UNITY div 2,
          d, 1);
      end;
    end;
  end;
end;

function TDelayMagicEff.Run: Boolean;
begin
  Result := True;
  if (not boRun) then begin
    if GetTickCount > nDelayTime then begin
      boRun := True;
      m_dwFrameTime := GetTickCount;
      m_dwStartTime := GetTickCount;
      steptime := GetTickCount;
      PlaySound2(MB_127_2);
      Result := inherited Run;
    end;
  end else
    Result := inherited Run;
end;
{------------------------------------------------------------}

//      TFlyingAxe

{------------------------------------------------------------}


constructor TFlyingAxe.Create (id, effnum, sx, sy, tx, ty: integer; mtype: TMagicType; Recusion: Boolean; anitime: integer);
begin
   inherited Create (id, effnum, sx, sy, tx, ty, mtype, Recusion, anitime);
   FlyImageBase := FLYOMAAXEBASE;
   ReadyFrame := 65;
end;

procedure TFlyingAxe.DrawEff (surface: TDirectDrawSurface);
var
   img: integer;
   d: TDirectDrawSurface;
   shx, shy: integer;
begin
   if m_boActive and ((Abs(FlyX-fireX) > ReadyFrame) or (Abs(FlyY-fireY) > ReadyFrame)) then begin

      shx := (g_MySelf.m_nRx * UNITX + g_MySelf.m_nShiftX) - FireMyselfX;
      shy := (g_MySelf.m_nRy * UNITY + g_MySelf.m_nShiftY) - FireMyselfY;

      if not FixedEffect then begin
         img := FlyImageBase + Dir16 * 10;
         d := ImgLib.GetCachedImage (img + curframe, px, py);
         if d <> nil then begin
           if FlyImageBase = 2410 then begin
             DrawBlend (surface,
                    FlyX + px - UNITX div 2 - shx,
                    FlyY + py - UNITY div 2 - shy,
                    d, 1);
           end else begin
            surface.Draw (FlyX + px - UNITX div 2 - shx,
                          FlyY + py - UNITY div 2 - shy,
                          d.ClientRect, d, TRUE);
           end;
         end;
      end else begin
         {img := FlyImageBase + Dir16 * 10;
         d := ImgLib.GetCachedImage (img, px, py);
         if d <> nil then begin
            surface.Draw (FlyX + px - UNITX div 2,
                          FlyY + py - UNITY div 2,
                          d.ClientRect, d, TRUE);
         end;  }
      end;
   end;
end;


{------------------------------------------------------------}

//      TFlyingArrow :

{------------------------------------------------------------}


procedure TFlyingArrow.DrawEff (surface: TDirectDrawSurface);       //�ü�
var
   img: integer;
   d: TDirectDrawSurface;
   shx, shy: integer;
begin
   if m_boActive and ((Abs(FlyX-fireX) > 40) or (Abs(FlyY-fireY) > 40)) then begin
      shx := (g_MySelf.m_nRx * UNITX + g_MySelf.m_nShiftX) - FireMyselfX;
      shy := (g_MySelf.m_nRy * UNITY + g_MySelf.m_nShiftY) - FireMyselfY;

      if not FixedEffect then begin
         img := FlyImageBase + Dir16; // * 10;
         d := ImgLib.GetCachedImage (img + curframe, px, py);
         if d <> nil then begin
            surface.Draw (FlyX + px - UNITX div 2 - shx,
                          FlyY + py - UNITY div 2 - shy - 46,
                          d.ClientRect, d, TRUE);
         end;
      end;
   end;
end;

{--------------------------------------------------------}

procedure TFlyingStone.DrawEff (surface: TDirectDrawSurface);       //�������� ��������
var
   img: integer;
   d: TDirectDrawSurface;
   shx, shy: integer;
begin
   if m_boActive and ((Abs(FlyX-fireX) > 40) or (Abs(FlyY-fireY) > 40)) then begin
      shx := (g_MySelf.m_nRx * UNITX + g_MySelf.m_nShiftX) - FireMyselfX;
      shy := (g_MySelf.m_nRy * UNITY + g_MySelf.m_nShiftY) - FireMyselfY;

      if not FixedEffect then begin
         img := FlyImageBase ;
         d := ImgLib.GetCachedImage (img + curframe, px, py);
         if d <> nil then begin
            surface.Draw (FlyX + px - UNITX div 2 - shx,
                          FlyY + py - UNITY div 2 - shy,
                          d.ClientRect, d, TRUE);
         end;
      end;
   end;
end;


constructor TCharEffect.Create (effbase, effframe: integer; target: TObject);
begin
   inherited Create (111, effbase,
                     TActor(target).m_nCurrX, TActor(target).m_nCurrY,
                     TActor(target).m_nCurrX, TActor(target).m_nCurrY,
                     mtExplosion,
                     FALSE,
                     0);
   TargetActor := target;
   frame := effframe;
   NextFrameTime := 30;

end;

function  TCharEffect.Run: Boolean;
begin
   Result := TRUE;
   if GetTickCount - steptime > longword(NextFrameTime) then begin
      steptime := GetTickCount;
      Inc (curframe);
      if curframe > start+frame-1 then begin
         {curframe := start+frame-1;
         Result := FALSE;
      end;    }
      if RepeatUntil = 0 then begin
        curframe := start + frame - 1;
        Result   := False;
      end else begin
        curframe := start;
        if GetTickCount > RepeatUntil then
          Result := False;
      end;
      end;
   end;
end;

procedure TCharEffect.DrawEff (surface: TDirectDrawSurface);
var
   d: TDirectDrawSurface;
begin
   if TargetActor <> nil then begin
      Rx := TActor(TargetActor).m_nRx;
      Ry := TActor(TargetActor).m_nRy;
      PlayScene.ScreenXYfromMCXY (Rx, Ry, FlyX, FlyY);
      FlyX := FlyX + TActor(TargetActor).m_nShiftX;
      FlyY := FlyY + TActor(TargetActor).m_nShiftY;
      d := ImgLib.GetCachedImage (EffectBase + curframe, px, py);
      if d <> nil then begin
         DrawBlend (surface,          //DrawBlend3
                    FlyX + px - UNITX div 2,
                    FlyY + py - UNITY div 2,
                    d, 1);
      end;
   end;
end;


{--------------------------------------------------------}

constructor TMapEffect.Create (effbase, effframe: integer; x, y: integer);
begin
   inherited Create (111, effbase,
                     x, y,
                     x, y,
                     mtExplosion,
                     FALSE,
                     0);
   TargetActor := nil;
   frame := effframe;
   NextFrameTime := 30;
   RepeatCount := 0;
end;

function  TMapEffect.Run: Boolean;
begin
   Result := TRUE;
   if GetTickCount - steptime > longword(NextFrameTime) then begin
      steptime := GetTickCount;
      Inc (curframe);
      if curframe > start+frame-1 then begin
         curframe := start+frame-1;
         if RepeatCount > 0 then begin
            Dec (RepeatCount);
            curframe := start;
         end else
            Result := FALSE;
      end;
   end;
end;

procedure TMapEffect.DrawEff (surface: TDirectDrawSurface);
var
   d: TDirectDrawSurface;
begin
   Rx := TargetX;
   Ry := TargetY;
   PlayScene.ScreenXYfromMCXY (Rx, Ry, FlyX, FlyY);
   d := ImgLib.GetCachedImage (EffectBase + curframe, px, py);
   if d <> nil then begin
      DrawBlend (surface,
                 FlyX + px - UNITX div 2,
                 FlyY + py - UNITY div 2,
                 d, 1);
   end;
end;


{--------------------------------------------------------}

constructor TScrollHideEffect.Create (effbase, effframe: integer; x, y: integer; target: TObject);
begin
   inherited Create (effbase, effframe, x, y);
   //TargetCret := TActor(target);//�ڳ������������֮��ʱ��������Ŀ��
end;

function  TScrollHideEffect.Run: Boolean;
begin
   Result := inherited Run;
   if frame = 7 then
      if g_TargetCret <> nil then
         PlayScene.DeleteActor (g_TargetCret.m_nRecogId);
end;


{--------------------------------------------------------}


constructor TLightingEffect.Create (effbase, effframe: integer; x, y: integer);
begin

end;

function  TLightingEffect.Run: Boolean;
begin
  Result:=False;
end;


{--------------------------------------------------------}


constructor TFireGunEffect.Create (effbase, sx, sy, tx, ty: integer);
begin
   inherited Create (111, effbase,
                     sx, sy,
                     tx, ty, //TActor(target).XX, TActor(target).m_nCurrY,
                     mtFireGun,
                     TRUE,
                     0);
   NextFrameTime := 50;
   FillChar (FireNodes, sizeof(TFireNode)*FIREGUNFRAME, #0);
   OutofOil := FALSE;
   firetime := GetTickCount;
end;

function  TFireGunEffect.Run: Boolean;
var
   i, fx, fy: integer;
   allgone: Boolean;
begin
   Result := TRUE;
   if GetTickCount - steptime > longword(NextFrameTime) then begin
      Shift;
      steptime := GetTickCount;
      //if not FixedEffect then begin
      if not OutofOil then begin
         if (abs(RX-TActor(MagOwner).m_nRx) >= 5) or (abs(RY-TActor(MagOwner).m_nRy) >= 5) or (GetTickCount - firetime > 800) then
            OutofOil := TRUE;
         for i:=FIREGUNFRAME-2 downto 0 do begin
            FireNodes[i].FireNumber := FireNodes[i].FireNumber + 1;
            FireNodes[i+1] := FireNodes[i];
         end;
         FireNodes[0].FireNumber := 1;
         FireNodes[0].x := FlyX;
         FireNodes[0].y := FlyY;
      end else begin
         allgone := TRUE;
         for i:=FIREGUNFRAME-2 downto 0 do begin
            if FireNodes[i].FireNumber <= FIREGUNFRAME then begin
               FireNodes[i].FireNumber := FireNodes[i].FireNumber + 1;
               FireNodes[i+1] := FireNodes[i];
               allgone := FALSE;
            end;
         end;
         if allgone then Result := FALSE;
      end;
   end;
end;

procedure TFireGunEffect.DrawEff (surface: TDirectDrawSurface);
var
   i, num, shx, shy, firex, firey, prx, pry, img: integer;
   d: TDirectDrawSurface;
begin
   prx := -1;
   pry := -1;
   for i:=0 to FIREGUNFRAME-1 do begin
      if (FireNodes[i].FireNumber <= FIREGUNFRAME) and (FireNodes[i].FireNumber > 0) then begin
         shx := (g_MySelf.m_nRx * UNITX + g_MySelf.m_nShiftX) - FireMyselfX;
         shy := (g_MySelf.m_nRy * UNITY + g_MySelf.m_nShiftY) - FireMyselfY;

         img := EffectBase + (FireNodes[i].FireNumber - 1);
         d := ImgLib.GetCachedImage (img, px, py);
         if d <> nil then begin
            firex := FireNodes[i].x + px - UNITX div 2 - shx;
            firey := FireNodes[i].y + py - UNITY div 2 - shy;
            if (firex <> prx) or (firey <> pry) then begin
               prx := firex;
               pry := firey;
               DrawBlend (surface, firex, firey, d, 1);
            end;
         end;
      end;
   end;
end;

{--------------------------------------------------------}

constructor TThuderEffect.Create (effbase, tx, ty: integer; target: TObject);
begin
   inherited Create (111, effbase,
                     tx, ty,
                     tx, ty, //TActor(target).XX, TActor(target).m_nCurrY,
                     mtThunder,
                     FALSE,
                     0);
   TargetActor := target;

end;

procedure TThuderEffect.DrawEff (surface: TDirectDrawSurface);
var
   img, px, py: integer;
   d: TDirectDrawSurface;
begin
   img := EffectBase;
   d := ImgLib.GetCachedImage (img + curframe, px, py);
   if d <> nil then begin
      DrawBlend (surface,
                 FlyX + px - UNITX div 2,
                 FlyY + py - UNITY div 2,
                 d, 1);
   end;
end;



{--------------------------------------------------------}

// TThuderEffectEx ---------------

constructor TThuderEffectEx.Create (effbase, tx, ty: integer; target: TObject; magnum:integer);
begin

  inherited Create (magnum, effbase,
                    tx, ty,
                    tx, ty, //TActor(target).XX, TActor(target).YY,
                    mtThunder,
                    FALSE,
                    0);
   TargetActor := target;

end;


procedure TThuderEffectEx.DrawEff (surface: TDirectDrawSurface);
var
   img, px, py: integer;
   d: TDirectDrawSurface;
begin
   if EffectBase = 1930 then
   img := EffectBase + (Dir16 * 10)
   else
   img := EffectBase;
   d := ImgLib.GetCachedImage (img + curframe, px, py);
   if d <> nil then begin
      DrawBlend (surface,
                 FlyX + px - UNITX div 2,
                 FlyY + py - UNITY div 2,
                 d, 1);
   end;
end;


{--------------------------------------------------------}

constructor TLightingThunder.Create (effbase, sx, sy, tx, ty: integer; target: TObject);
begin
   inherited Create (111, effbase,
                     sx, sy,
                     tx, ty, //TActor(target).XX, TActor(target).m_nCurrY,
                     mtLightingThunder,
                     FALSE,
                     0);
   TargetActor := target;
end;

procedure TLightingThunder.DrawEff (surface: TDirectDrawSurface);
var
   img, sx, sy, px, py, shx, shy: integer;
   d: TDirectDrawSurface;
begin
   img := EffectBase + Dir16 * 10;
   if curframe < 6 then begin

      shx := (g_MySelf.m_nRx * UNITX + g_MySelf.m_nShiftX) - FireMyselfX;
      shy := (g_MySelf.m_nRy * UNITY + g_MySelf.m_nShiftY) - FireMyselfY;

      d := ImgLib.GetCachedImage (img + curframe, px, py);
      if d <> nil then begin
         PlayScene.ScreenXYfromMCXY (TActor(MagOwner).m_nRx,
                                     TActor(MagOwner).m_nRy,
                                     sx,
                                     sy);
         DrawBlend (surface,
                    sx + px - UNITX div 2,
                    sy + py - UNITY div 2,
                    d, 1);
      end;
   end;
end;

constructor TIceSickle.Create (effbase, sx, sy, tx, ty: integer; target: TObject);
begin
   inherited Create (111, effbase,
                     sx, sy,
                     tx, ty, //TActor(target).XX, TActor(target).m_nCurrY,
                     mtIceSickle,
                     FALSE,
                     0);
   TargetActor := target;
end;

procedure TIceSickle.DrawEff (surface: TDirectDrawSurface);
var
   img, sx, sy, px, py, shx, shy: integer;
   d: TDirectDrawSurface;
begin
   img := EffectBase + Dir16 * 10;
   if curframe < 6 then begin

      shx := (g_MySelf.m_nRx * UNITX + g_MySelf.m_nShiftX) - FireMyselfX;
      shy := (g_MySelf.m_nRy * UNITY + g_MySelf.m_nShiftY) - FireMyselfY;

      d := ImgLib.GetCachedImage (img + curframe, px, py);
      if d <> nil then begin
         PlayScene.ScreenXYfromMCXY (TActor(MagOwner).m_nRx,
                                     TActor(MagOwner).m_nRy,
                                     sx,
                                     sy);
         DrawBlend (surface,
                    sx + px - UNITX div 2,
                    sy + py - UNITY div 2,
                    d, 1);
      end;
   end;
end;
{--------------------------------------------------------}


constructor TBowEffect.Create (effbase, sx, sy, tx, ty: integer; target: TObject);
begin
   inherited Create (111, effbase,
                     sx, sy,
                     tx, ty,
                     mtExploBujauk,
                     TRUE,
                     0);
   frame := 3;
   TargetActor := target;
   NextFrameTime := 50;
end;

procedure TBowEffect.DrawEff (surface: TDirectDrawSurface);
var
   img: integer;
   d: TDirectDrawSurface;
   shx, shy: integer;
   meff: TMapEffect;
begin

   if m_boActive and ((Abs(FlyX-fireX) > 30) or (Abs(FlyY-fireY) > 30) or FixedEffect) then begin

      shx := (g_MySelf.m_nRx * UNITX + g_MySelf.m_nShiftX) - FireMyselfX;
      shy := (g_MySelf.m_nRy * UNITY + g_MySelf.m_nShiftY) - FireMyselfY;

      if not FixedEffect then begin
         img := EffectBase + Dir16 * 10;
         d := g_WMagic3Images.GetCachedImage (img + curframe, px, py);
         if d <> nil then begin
           DrawBlend (surface,
                       FLyX + px - UNITX div 2 - shx,
                       FlyY + py - UNITY div 2 - shy,
                       d, 1);
         end;
      end;
   end;
end;


{--------------------------------------------------------}

constructor TExploBujaukEffect.Create (effbase, sx, sy, tx, ty: integer; target: TObject);
begin
   inherited Create (111, effbase,
                     sx, sy,
                     tx, ty,
                     mtExploBujauk,
                     TRUE,
                     0);
   frame := 3;
   TargetActor := target;
   NextFrameTime := 50;
end;

procedure TExploBujaukEffect.DrawEff (surface: TDirectDrawSurface);
var
   img: integer;
   d: TDirectDrawSurface;
   shx, shy: integer;
   meff: TMapEffect;
begin

   if m_boActive and ((Abs(FlyX-fireX) > 30) or (Abs(FlyY-fireY) > 30) or FixedEffect) then begin

      shx := (g_MySelf.m_nRx * UNITX + g_MySelf.m_nShiftX) - FireMyselfX;
      shy := (g_MySelf.m_nRy * UNITY + g_MySelf.m_nShiftY) - FireMyselfY;

      if not FixedEffect then begin
         img := EffectBase + Dir16 * 10;
         d := g_WMagicImages.GetCachedImage (img + curframe, px, py);
         if d <> nil then begin
            surface.Draw (FlyX + px - UNITX div 2 - shx,
                          FlyY + py - UNITY div 2 - shy,
                          d.ClientRect, d, TRUE);
         end;
      end else begin
         img := MagExplosionBase + curframe;

         if MagicNumber = 49 then begin //��ȥ��
          NextFrameTime := 100;
          img    := 1110 + curframe;
          ImgLib := g_Wmagic2Images;
         end;


         d := ImgLib.GetCachedImage (img, px, py);
         if d <> nil then begin
            DrawBlend (surface,
                       FLyX + px - UNITX div 2,
                       FlyY + py - UNITY div 2,
                       d, 1);
         end;
      end;
   end;
end;

{--------------------------------------------------------}

constructor TBujaukGroundEffect.Create (effbase, magicnumb, sx, sy, tx, ty: integer);
begin
   inherited Create (111, effbase,
                     sx, sy,
                     tx, ty,
                     mtBujaukGroundEffect,
                     TRUE,
                     0);
   frame := 3;
   MagicNumber := magicnumb;
   BoGroundEffect := FALSE;
   NextFrameTime := 50;
end;

function  TBujaukGroundEffect.Run: Boolean;
begin
   Result := inherited Run;
   if not FixedEffect then begin
      if ((abs(TargetX-FlyX) <= 15) and (abs(TargetY-FlyY) <= 15)) or
         ((abs(TargetX-FlyX) >= prevdisx) and (abs(TargetY-FlyY) >= prevdisy)) then begin
         FixedEffect := TRUE;
         start := 0;
         frame := ExplosionFrame;
         curframe := start;
         Repetition := FALSE;
         PlaySound (TActor(MagOwner).m_nMagicExplosionSound);
         Result := TRUE;
      end else begin
         prevdisx := abs(TargetX-FlyX);
         prevdisy := abs(TargetY-FlyY);
      end;
   end;
end;

procedure TBujaukGroundEffect.DrawEff (surface: TDirectDrawSurface);
var
   img: integer;
   d: TDirectDrawSurface;
   shx, shy: integer;
   meff: TMapEffect;
begin
   img := 0;
   if m_boActive and ((Abs(FlyX-fireX) > 30) or (Abs(FlyY-fireY) > 30) or FixedEffect) then begin

      shx := (g_MySelf.m_nRx * UNITX + g_MySelf.m_nShiftX) - FireMyselfX;
      shy := (g_MySelf.m_nRy * UNITY + g_MySelf.m_nShiftY) - FireMyselfY;

      if not FixedEffect then begin
         img := EffectBase + Dir16 * 10;
         d := ImgLib.GetCachedImage (img + curframe, px, py);
         if d <> nil then begin
            surface.Draw (FlyX + px - UNITX div 2 - shx,
                          FlyY + py - UNITY div 2 - shy,
                          d.ClientRect, d, TRUE);
         end;
      end else begin
         if MagicNumber = 11 then begin //�׸�����
            img := EffectBase + 16 * 10 + curframe;
            ImgLib := g_WmagicImages
         end else
         if MagicNumber = 12 then begin  //������ȣ
            img := EffectBase + 18 * 10 + curframe;
            ImgLib := g_WmagicImages;
         end else

         if MagicNumber = 90 then begin      //�����
           NextFrameTime := 40;
           img := 1560 + curframe;
           ImgLib := g_WMagicNewImages;
         end else

         if MagicNumber = 91 then begin      //��������
           NextFrameTime := 50;
           img := 1520 + curframe;
           ImgLib := g_WMagicNewImages;
         end else

         if MagicNumber = 46 then begin      //���ּ�
           NextFrameTime := 100;
           img := 950 + curframe;
           ImgLib := g_Wmagic2Images;
         end else
         if MagicNumber = 55 then begin //����
           NextFrameTime := 100;
         end else
         if MagicNumber = 49 then begin //��ȥ��
          NextFrameTime := 100;
          img    := 1110 + curframe;
          ImgLib := g_Wmagic2Images;
         end else
         if MagicNumber = MAGIC_FOX_FIRE2 then begin //���������� �����
            NextFrameTime := 100;
            img := 1320 + curframe;
            ImgLib := g_WMonImagesArr[23];
         end else
         if MagicNumber = MAGIC_FOX_CURSE then begin //���������� ���ּ�
            NextFrameTime := 100;
            img := 1330 + curframe;
            ImgLib := g_WMonImagesArr[23];
         end else
          if MagicNumber = 132 then begin //õ��
           NextFrameTime := 100;
           img := 910 + curframe;
           ImgLib := g_WMagic0Images;
         end else
           exit;

         d := ImgLib.GetCachedImage (img, px, py);
         if d <> nil then begin
            DrawBlend (surface,
                       FLyX + px - UNITX div 2, // - shx,
                       FlyY + py - UNITY div 2, // - shy,
                       d, 1);
         end;

      end;
   end;
end;


{ TNormalDrawEffect }

constructor TNormalDrawEffect.Create(XX,YY:Integer;WmImage:TWMImages;effbase,nX:Integer;frmTime:LongWord;boFlag:Boolean);
begin
  inherited Create (111,effbase, XX, YY, XX, YY,mtReady,TRUE,0);
  ImgLib:=WmImage;
  EffectBase:=effbase;
  start:=0;
  curframe:=0;
  frame:=nX;
  NextFrameTime:=frmTime;
  boC8:=boFlag;
end;

procedure TNormalDrawEffect.DrawEff(surface: TDirectDrawSurface);
var
   d: TDirectDrawSurface;
   nRx,nRy,nPx,nPy:integer;
begin
  d := ImgLib.GetCachedImage (EffectBase + curframe, nPx, nPy);
   if d <> nil then begin
     PlayScene.ScreenXYfromMCXY (FlyX, FlyY, nRx, nRy);
     if boC8 then begin
       DrawBlend (surface,nRx + nPx - UNITX div 2,nRy + nPy - UNITY div 2,d, 1);
     end else begin
       surface.Draw (nRx + nPx - UNITX div 2,nRy + nPy - UNITY div 2,d.ClientRect, d, TRUE);
     end;  
   end;  
end;

function TNormalDrawEffect.Run: Boolean;
begin
   Result := TRUE;
   if m_boActive and (GetTickCount - steptime > longword(NextFrameTime)) then begin
      steptime := GetTickCount;
      Inc (curframe);
      if curframe > start+frame-1 then begin
         curframe := start;
         Result := FALSE;
      end;
   end;
end;


{ TDelayNormalDrawEffect }

constructor TDelayNormalDrawEffect.Create(XX, YY: integer; WmImage: TWMImages; effbase, nX: integer; frmTime: longword;
  boFlag: Boolean; nDelayTime: LongWord);
begin
  inherited Create(xx, yy, WmImage, effbase, nx, frmTime, boFlag);
  dwDelayTick := GetTickCount + nDelayTime;
  boRun := False;
  SoundID := -1;
end;

procedure TDelayNormalDrawEffect.DrawEff(surface: TDirectDrawSurface);
begin
  if boRun then
    inherited;
end;

function TDelayNormalDrawEffect.Run: Boolean;
begin
  Result := True;
  if boRun then begin
    Result := inherited Run;
  end else begin
    if GetTickCount > dwDelayTick then begin
      //10522
      if SoundID > 0 then
        PlaySound(SoundID); //Damian
      boRun := True;
    end;
  end;
end;

{--------------------------------------------------------}

constructor TBlasthitEffect.Create(effbase, effframe: Integer; target: TObject); //������
begin
  inherited Create(111, effbase,
    TActor(target).m_nCurrX, TActor(target).m_nCurrY,
    TActor(target).m_nCurrX, TActor(target).m_nCurrY,
    mtExplosion,
    False,
    0);
  TargetActor := target;
  frame := effframe;
  NextFrameTime := 150;
end;

function TBlasthitEffect.Run: Boolean;      //������
begin
  Result := True;
  if GetTickCount - steptime > LongWord(NextFrameTime) then begin
    steptime := GetTickCount;
    Inc(curframe);
    if curframe > start + frame - 1 then begin
      curframe := start + frame - 1;
      Result := False;
    end;
  end;
end;

procedure TBlasthitEffect.DrawEff(Surface: TDirectDrawSurface);       //������
var
  d: TDirectDrawSurface;
begin
  rx := targetx;
  ry := targety;
  PlayScene.ScreenXYfromMCXY(rx, ry, FlyX, FlyY);
  d := g_WMagicNewImages.GetCachedImage(EffectBase + curframe, px, py);
  if d <> nil then begin
    DrawBlend(Surface,
      FlyX + px - UNITX div 2,
      FlyY + py - UNITY div 2,
      d, 1);
  end;
end;
{--------------------------------------------------------}


constructor THumanEffects.Create(XX,YY:Integer;WmImage:TWMImages;effbase,nX:Integer;frmTime:LongWord;boFlag:Boolean);
begin
  inherited Create (111,effbase, XX, YY, XX, YY,mtReady,TRUE,0);
  ImgLib:=WmImage;
  EffectBase:=effbase;
  start:=0;
  curframe:=0;
  frame:=nX;
  NextFrameTime:=frmTime;
  boC8:=boFlag;
end;

procedure THumanEffects.DrawEff(surface: TDirectDrawSurface);
var
   d: TDirectDrawSurface;
   Rx,Ry,nRx,nRy,nPx,nPy,shx,shy:integer;
begin

  d := ImgLib.GetCachedImage (EffectBase + curframe, nPx, nPy);
   if d <> nil then begin
      Rx := TActor(g_Myself).m_nRx;
      Ry := TActor(g_Myself).m_nRy;
     PlayScene.ScreenXYfromMCXY (Rx, Ry, nRx, nRy);
      nRx := nRx + TActor(g_Myself).m_nShiftX;
      nRy := nRy + TActor(g_Myself).m_nShiftY;
     if boC8 then begin
              DrawBlend (surface,
                    nRx + npx - UNITX div 2,
                    nRy + npy - UNITY div 2,
                    d, 1);
     end else begin
       surface.Draw (nRx + nPx - UNITX div 2,nRy + nPy - UNITY div 2,d.ClientRect, d, TRUE);
     end;
   end;
end;



function THumanEffects.Run: Boolean;
begin
   Result := TRUE;
   if m_boActive and (GetTickCount - steptime > longword(NextFrameTime)) then begin
      steptime := GetTickCount;
      Inc (curframe);
      if curframe > start+frame-1 then begin
         curframe := start;
         Result := FALSE;
      end;
   end;
end;

{ TobjectEffect}
constructor TObjectEffects.Create(ObjectID2:TObject;WmImage:TWMImages;effbase,nX:Integer;frmTime:LongWord;boFlag:Boolean);
begin
  inherited Create (111,effbase, 0, 0, 0, 0,mtReady,TRUE,0);
  ImgLib:=WmImage;
  EffectBase:=effbase;
  start:=0;
  curframe:=0;
  frame:=nX;
  NextFrameTime:=frmTime;
  boC8:=boFlag;
  ObjectID:=ObjectID2;
end;

procedure TObjectEffects.DrawEff(surface: TDirectDrawSurface);
var
   d: TDirectDrawSurface;
   Rx,Ry,nRx,nRy,nPx,nPy,shx,shy:integer;
begin
  d := ImgLib.GetCachedImage (EffectBase + curframe, nPx, nPy);
   if (d <> nil) and (ObjectID <> nil) then begin
      Rx := TActor(ObjectID).m_nRx;
      Ry := TActor(ObjectID).m_nRy;
     PlayScene.ScreenXYfromMCXY (Rx, Ry, nRx, nRy);
      nRx := nRx + TActor(ObjectID).m_nShiftX;
      nRy := nRy + TActor(ObjectID).m_nShiftY;
     if boC8 then begin
              DrawBlend (surface,
                    nRx + npx - UNITX div 2,
                    nRy + npy - UNITY div 2,
                    d, 1);
     end else begin
       surface.Draw (nRx + nPx - UNITX div 2,nRy + nPy - UNITY div 2,d.ClientRect, d, TRUE);
     end;
   end;
end;

function TObjectEffects.Run: Boolean;
begin
   Result := TRUE;
   if m_boActive and (GetTickCount - steptime > longword(NextFrameTime)) then begin
      steptime := GetTickCount;
      Inc (curframe);
      if curframe > start+frame-1 then begin
         curframe := start;
         Result := FALSE;
      end;
   end;
end;

{ TFlyingBug }

constructor TFlyingBug.Create(id, effnum, sx, sy, tx, ty: integer;
  mtype: TMagicType; Recusion: Boolean; anitime: integer);
begin
   inherited Create (id, effnum, sx, sy, tx, ty, mtype, Recusion, anitime);
   FlyImageBase := FLYOMAAXEBASE;
   ReadyFrame := 65;
end;

procedure TFlyingBug.DrawEff(surface: TDirectDrawSurface);
var
   img: integer;
   d: TDirectDrawSurface;
   shx, shy: integer;
begin
  if m_boActive and ((Abs(FlyX-fireX) > ReadyFrame) or (Abs(FlyY-fireY) > ReadyFrame)) then begin
      shx := (g_MySelf.m_nRx * UNITX + g_MySelf.m_nShiftX) - FireMyselfX;
      shy := (g_MySelf.m_nRy * UNITY + g_MySelf.m_nShiftY) - FireMyselfY;

      if not FixedEffect then begin
         img := FlyImageBase + (Dir16 div 2) * 10;
         d := ImgLib.GetCachedImage (img + curframe, px, py);
         if d <> nil then begin
            surface.Draw (FlyX + px - UNITX div 2 - shx,
                          FlyY + py - UNITY div 2 - shy,
                          d.ClientRect, d, TRUE);
         end;
      end else begin
         img := curframe + MagExplosionBase;
         d := ImgLib.GetCachedImage (img, px, py);
         if d <> nil then begin
            surface.Draw (FlyX + px - UNITX div 2,
                          FlyY + py - UNITY div 2,
                          d.ClientRect, d, TRUE);
         end;
      end;
   end;
end;


{ TFlyingFireBall }

procedure TFlyingFireBall.DrawEff(surface: TDirectDrawSurface);
var
   d: TDirectDrawSurface;
begin
  if m_boActive and ((Abs(FlyX-fireX) > ReadyFrame) or (Abs(FlyY-fireY) > ReadyFrame)) then begin
    d := ImgLib.GetCachedImage (FlyImageBase + (GetFlyDirection (FlyX, FlyY, TargetX, TargetY) * 10) + curframe, px, py);
    if d <> nil then
      DrawBlend (surface,
                 FLyX + px - UNITX div 2,
                 FlyY + py - UNITY div 2,
                 d, 1);
  end;
end;

{--------------------------------------------------------}

constructor TFoxThunderEffect.Create (effbase, tx, ty: integer; target: TObject);
begin
   inherited Create (111, effbase,
                     tx, ty,
                     tx, ty, //TActor(target).XX, TActor(target).m_nCurrY,
                     mtFoxThunder,
                     FALSE,
                     0);
   TargetActor := target;
   n0:=random(7);
end;

procedure TFoxThunderEffect.DrawEff (surface: TDirectDrawSurface);
var
   img, px, py: integer;
   d: TDirectDrawSurface;
begin
   ImgLib:=g_WMonImagesArr[23];
   img := EffectBase;
   d := ImgLib.GetCachedImage (img + (7 * n0) + curframe, px, py);
   if d <> nil then begin
      DrawBlend (surface,
                 FlyX + px - UNITX div 2,
                 FlyY + py - UNITY div 2,
                 d, 1);
   end;
end;

constructor TFoxAnnoyEffect.Create (effbase, tx, ty: integer; target: TObject);
begin
   inherited Create (111, effbase,
                     tx, ty,
                     tx, ty, //TActor(target).XX, TActor(target).m_nCurrY,
                     mtFoxAnnoy,
                     FALSE,
                     0);
   TargetActor := target;
   n0:=random(7);
end;

procedure TFoxAnnoyEffect.DrawEff (surface: TDirectDrawSurface);
var
   img, px, py: integer;
   d: TDirectDrawSurface;
begin
   ImgLib:=g_WMonImagesArr[23];
   img := EffectBase;
   d := ImgLib.GetCachedImage (img + (7 * n0) + curframe, px, py);
   if d <> nil then begin
      DrawBlend (surface,
                 FlyX + px - UNITX div 2,
                 FlyY + py - UNITY div 2,
                 d, 1);
   end;
end;


constructor THellThunderEffect.Create (effbase, tx, ty: integer; target: TObject);
begin
   inherited Create (161, effbase,
                     tx, ty,
                     tx, ty, //TActor(target).XX, TActor(target).m_nCurrY,
                     mtHellThunder,
                     FALSE,
                     0);
   TargetActor := target;
 //  n0:=random(7);
end;

procedure THellThunderEffect.DrawEff (surface: TDirectDrawSurface);
var
   img, px, py: integer;
   d: TDirectDrawSurface;
begin
   ImgLib:=g_WMonImagesArr[27];
   img := EffectBase;
   d := ImgLib.GetCachedImage (img + (7 * n0) + curframe, px, py);
   if d <> nil then begin
      DrawBlend (surface,
                 FlyX + px - UNITX div 2,
                 FlyY + py - UNITY div 2,
                 d, 1);
   end;
end;

constructor THell2ThunderEffect.Create (effbase, tx, ty: integer; target: TObject);
begin
   inherited Create (162, effbase,
                     tx, ty,
                     tx, ty, //TActor(target).XX, TActor(target).m_nCurrY,
                     mtHell2Thunder,
                     FALSE,
                     0);
   TargetActor := target;
 //  n0:=random(7);
end;

procedure THell2ThunderEffect.DrawEff (surface: TDirectDrawSurface);
var
   img, px, py: integer;
   d: TDirectDrawSurface;
begin
   ImgLib:=g_WMonImagesArr[27];
   img := EffectBase;
   d := ImgLib.GetCachedImage (img + (7 * n0) + curframe, px, py);
   if d <> nil then begin
      DrawBlend (surface,
                 FlyX + px - UNITX div 2,
                 FlyY + py - UNITY div 2,
                 d, 1);
   end;
end;


constructor TExploHuXiaoJueZhouEffect.Create(effbase, sx, sY, tx, ty: Integer; target: TObject);   //��ȣ��Ÿ
begin
  inherited Create(111, effbase,
    sx, sY,
    tx, ty,
    mtExploBujauk,
    True,
    0);
  frame := 5;
  TargetActor := target;
  NextFrameTime := 80;
end;

procedure TExploHuXiaoJueZhouEffect.DrawEff(Surface: TDirectDrawSurface);       //��ȣ��Ÿ
var
  img: Integer;
  d: TDirectDrawSurface;
  shx, shy: Integer;
  meff: TMapEffect;
begin
  if m_boActive and ((abs(FlyX - fireX) > 30) or (abs(FlyY - fireY) > 30) or FixedEffect) then begin
    shx := (g_MySelf.m_nRx * UNITX + g_MySelf.m_nShiftX) - FireMyselfX;
    shy := (g_MySelf.m_nRy * UNITY + g_MySelf.m_nShiftY) - FireMyselfY;
    if not FixedEffect then begin
      img := EffectBase + Dir16 * 5 + curframe;
      d := ImgLib.GetCachedImage(img, px, py);
      if d <> nil then begin
        Surface.Draw(FlyX + px - UNITX div 2 - shx,
          FlyY + py - UNITY div 2 - shy,
          d.ClientRect, d, True);
      end;

      d := ImgLib.GetCachedImage(img + 80, px, py);
      if d <> nil then begin
        DrawBlend(Surface,
          FlyX + px - UNITX div 2 - shx,
          FlyY + py - UNITY div 2 - shy,
          d,1);
      end;
    end else begin
      img := 3030 + Dir16 * 5 + curframe;
      d := ImgLib.GetCachedImage(img, px, py);
      if d <> nil then begin
        Surface.Draw(FlyX + px - UNITX div 2 - shx,
          FlyY + py - UNITY div 2 - shy,
          d.ClientRect, d, True);
      end;

      img := 3110 + Dir16 * 5 + curframe;
      if d <> nil then begin
        DrawBlend(Surface,
          FlyX + px - UNITX div 2,
          FlyY + py - UNITY div 2,
          d,1);
      end;

      img := MagExplosionBase + Dir16 * 5 + curframe;
      d := ImgLib.GetCachedImage(img, px, py);
      if d <> nil then begin
        DrawBlend(Surface,
          FlyX + px - UNITX div 2,
          FlyY + py - UNITY div 2,
          d,1);
      end;

    end;
  end;
end;


constructor TRedThunderEffect.Create (effbase, tx, ty: integer; target: TObject);
begin
   inherited Create (111, effbase,
                     tx, ty,
                     tx, ty, //TActor(target).XX, TActor(target).m_nCurrY,
                     mtRedThunder,
                     FALSE,
                     0);
   TargetActor := target;
   n0:=random(7);
end;

procedure TRedThunderEffect.DrawEff (surface: TDirectDrawSurface);
var
   img, px, py: integer;
   d: TDirectDrawSurface;
begin
   ImgLib:=g_WDragonImg;
   img := EffectBase;
   d := ImgLib.GetCachedImage (img + (7 * n0) + curframe, px, py);
   if d <> nil then begin
      DrawBlend (surface,
                 FlyX + px - UNITX div 2,
                 FlyY + py - UNITY div 2,
                 d, 1);
   end;
end;

 constructor TRedThunder2Effect.Create (effbase, tx, ty: integer; target: TObject);
begin
   inherited Create (155, effbase,
                     tx, ty,
                     tx, ty, //TActor(target).XX, TActor(target).m_nCurrY,
                     mtRedThunder2,
                     FALSE,
                     0);
   TargetActor := target;
   n0:=random(7);
end;

procedure TRedThunder2Effect.DrawEff (surface: TDirectDrawSurface);
var
   img, px, py: integer;
   d: TDirectDrawSurface;
begin
   ImgLib:=g_WDragonImg;
   img := EffectBase;
   d := ImgLib.GetCachedImage (img + (7 * n0) + curframe, px, py);
   if d <> nil then begin
      DrawBlend (surface,
                 FlyX + px - UNITX div 2,
                 FlyY + py - UNITY div 2,
                 d, 1);
   end;
end;

constructor TIceShowerEffect.Create (effbase, tx, ty: integer; target: TObject);       //õ���ȯ
begin
   inherited Create (158, effbase,
                     tx, ty,
                     tx, ty,
                     mtIceShower,
                     FALSE,
                     0);
   TargetActor := target;
   NextFrameTime := 100;
end;

procedure TIceShowerEffect.DrawEff (surface: TDirectDrawSurface);
var
   img, px, py: integer;
   d, e: TDirectDrawSurface;
begin
   ImgLib := g_WMagic2Images;
   img := EffectBase;
   d := ImgLib.GetCachedImage (img + curframe, px, py);
   if d <> nil then begin
      DrawBlend (surface,
                 FlyX + px - UNITX div 2,
                 FlyY + py - UNITY div 2,
                 d, 1);
   end;
end;



constructor TFireShowerEffect.Create (effbase, tx, ty: integer; target: TObject);     //õ�󳫿�
begin
   inherited Create (159, effbase,
                     tx, ty,
                     tx, ty,
                     mtFireShower,
                     FALSE,
                     0);
   TargetActor := target;
   NextFrameTime := 100;    
end;

procedure TFireShowerEffect.DrawEff (surface: TDirectDrawSurface);
var
   img, px, py: integer;
   d: TDirectDrawSurface;
begin
   ImgLib := g_WMagic2Images;
   img := EffectBase;
   d := ImgLib.GetCachedImage (img + curframe, px, py);
   if d <> nil then begin
      DrawBlend (surface,
                 FlyX + px - UNITX div 2,
                 FlyY + py - UNITY div 2,
                 d, 1);
   end;
end;

constructor TIceShowerUpEffect.Create (effbase, tx, ty: integer; target: TObject);       //õ���ȯ
begin
   inherited Create (158, effbase,
                     tx, ty,
                     tx, ty,
                     mtUpIceShower,
                     FALSE,
                     0);
   TargetActor := target;
   NextFrameTime := 100;
end;

procedure TIceShowerUpEffect.DrawEff (surface: TDirectDrawSurface);
var
   img, px, py: integer;
   d, e: TDirectDrawSurface;
begin
   ImgLib := g_WMagicUpImages;
   img := EffectBase;
   d := ImgLib.GetCachedImage (img + curframe, px, py);
   if d <> nil then begin
      DrawBlend (surface,
                 FlyX + px - UNITX div 2,
                 FlyY + py - UNITY div 2,
                 d, 1);
   end;
end;



constructor TFireShowerUpEffect.Create (effbase, tx, ty: integer; target: TObject);     //õ�󳫿�
begin
   inherited Create (159, effbase,
                     tx, ty,
                     tx, ty,
                     mtUpFireShower,
                     FALSE,
                     0);
   TargetActor := target;
   NextFrameTime := 100;    
end;

procedure TFireShowerUpEffect.DrawEff (surface: TDirectDrawSurface);
var
   img, px, py: integer;
   d: TDirectDrawSurface;
begin
   ImgLib := g_WMagicUpImages;
   img := EffectBase;
   d := ImgLib.GetCachedImage (img + curframe, px, py);
   if d <> nil then begin
      DrawBlend (surface,
                 FlyX + px - UNITX div 2,
                 FlyY + py - UNITY div 2,
                 d, 1);
   end;
end;

constructor TFireShowerUpRaveEffect.Create (effbase, tx, ty: integer; target: TObject);     //õ������
begin
   inherited Create (159, effbase,
                     tx, ty,
                     tx, ty,
                     mtUpFirerave,
                     FALSE,
                     0);
   TargetActor := target;
   NextFrameTime := 100;    
end;

procedure TFireShowerUpRaveEffect.DrawEff (surface: TDirectDrawSurface);
var
   img, px, py: integer;
   d: TDirectDrawSurface;
begin
   ImgLib := g_WMagic0Images;
   img := EffectBase;
   d := ImgLib.GetCachedImage (img + curframe, px, py);
   if d <> nil then begin
      DrawBlend (surface,
                 FlyX + px - UNITX div 2,
                 FlyY + py - UNITY div 2,
                 d, 1);
   end;
end;

constructor TGumizulEffect.Create (effbase, tx, ty: integer; target: TObject);
begin
   inherited Create (156, effbase,
                     tx, ty,
                     tx, ty, //TActor(target).XX, TActor(target).m_nCurrY,
                     mtGumizul,
                     FALSE,
                     0);
   TargetActor := target;
   n0:=random(7);
end;

procedure TGumizulEffect.DrawEff (surface: TDirectDrawSurface);
var
   img, px, py: integer;
   d: TDirectDrawSurface;
begin
   ImgLib:=g_WMonImagesArr[25];
   img := EffectBase;
   d := ImgLib.GetCachedImage (img {+ (7 * n0)} + curframe, px, py);
   if d <> nil then begin
      DrawBlend (surface,
                 FlyX + px - UNITX div 2,
                 FlyY + py - UNITY div 2,
                 d, 1);
   end;
end;


constructor TFireBoomEffect.Create (effbase, tx, ty: integer; target: TObject);
begin
   inherited Create (159, effbase,
                     tx, ty,
                     tx, ty, //TActor(target).XX, TActor(target).m_nCurrY,
                     mtFireBoom,
                     FALSE,
                     0);
   TargetActor := target;
   n0:=random(7);
end;

procedure TFireBoomEffect.DrawEff (surface: TDirectDrawSurface);
var
   img, px, py: integer;
   d: TDirectDrawSurface;
begin
   ImgLib:=g_WMonImagesArr[25];
   img := EffectBase;
   d := ImgLib.GetCachedImage (img {+ (7 * n0)} + curframe, px, py);
   if d <> nil then begin
      DrawBlend (surface,
                 FlyX + px - UNITX div 2,
                 FlyY + py - UNITY div 2,
                 d, 1);
   end;
end;


constructor TLavaEffect.Create (effbase, tx, ty: integer; target: TObject);
begin
   inherited Create (111, effbase,
                     tx, ty,
                     tx, ty, //TActor(target).XX, TActor(target).m_nCurrY,
                     mtLava,
                     FALSE,
                     0);
   TargetActor := target;
   frame :=20;
end;

procedure TLavaEffect.DrawEff (surface: TDirectDrawSurface);
var
   img, px, py: integer;
   d: TDirectDrawSurface;
begin
ImgLib:=g_WDragonImg;
//draw explosion
  if curframe < 10 then begin
   img := 470;
   d := ImgLib.GetCachedImage (img + curframe, px, py);
   if d <> nil then begin
      DrawBlend (surface,
                 FlyX + px - UNITX div 2,
                 FlyY + py - UNITY div 2,
                 d, 1);
   end;
  end;
  //draw the rest
   img := EffectBase;
   d := ImgLib.GetCachedImage (img + curframe, px, py);
   if d <> nil then begin
      DrawBlend (surface,
                 FlyX + px - UNITX div 2,
                 FlyY + py - UNITY div 2,
                 d, 1);
   end;
end;

constructor TRedFoxThunderEffect.Create (effbase, tx, ty: integer; target: TObject);
begin
   inherited Create (111, effbase,
                     tx, ty,
                     tx, ty, //TActor(target).XX, TActor(target).m_nCurrY,
                     mtRedFoxThunder,
                     FALSE,
                     0);
   TargetActor := target;
   frame :=10;
end;

procedure TRedFoxThunderEffect.DrawEff (surface: TDirectDrawSurface);
var
   img, px, py: integer;
   d: TDirectDrawSurface;
begin
   ImgLib:=g_WMonImagesArr[23];
   img := EffectBase;
   d := ImgLib.GetCachedImage (img + curframe, px, py);
   if d <> nil then begin
      DrawBlend (surface,
                 FlyX + px - UNITX div 2,
                 FlyY + py - UNITY div 2,
                 d, 1);
   end;
end;

constructor TRedFoxFireEffect.Create (effbase, tx, ty: integer; target: TObject);
begin
   inherited Create (111, effbase,
                     tx, ty,
                     tx, ty, //TActor(target).XX, TActor(target).m_nCurrY,
                     mtRedFoxFire,
                     FALSE,
                     0);
   TargetActor := target;
   frame :=10;
end;

procedure TRedFoxFireEffect.DrawEff (surface: TDirectDrawSurface);
var
   img, px, py: integer;
   d: TDirectDrawSurface;
begin
   ImgLib:=g_WMonImagesArr[23];
   img := EffectBase;
   d := ImgLib.GetCachedImage (img + curframe, px, py);
   if d <> nil then begin
      DrawBlend (surface,
                 FlyX + px - UNITX div 2,
                 FlyY + py - UNITY div 2,
                 d, 1);
   end;
end;

constructor TGumizul2Effect.Create (effbase, tx, ty: integer; target: TObject);
begin
   inherited Create (156, effbase,
                     tx, ty,
                     tx, ty, //TActor(target).XX, TActor(target).m_nCurrY,
                     mtGumizul2,
                     FALSE,
                     0);
   TargetActor := target;
   n0:=random(7);
end;

procedure TGumizul2Effect.DrawEff (surface: TDirectDrawSurface);
var
   img, px, py: integer;
   d: TDirectDrawSurface;
begin
   ImgLib:=g_WMonImagesArr[25];
//draw explosion
  if curframe < 10 then begin
   img := 2980;
   d := ImgLib.GetCachedImage (img + curframe, px, py);
   if d <> nil then begin
      DrawBlend (surface,
                 FlyX + px - UNITX div 2,
                 FlyY + py - UNITY div 2,
                 d, 1);
   end;
  end;
  //draw the rest
   img := EffectBase;
   d := ImgLib.GetCachedImage (img + curframe, px, py);
   if d <> nil then begin
      DrawBlend (surface,
                 FlyX + px - UNITX div 2,
                 FlyY + py - UNITY div 2,
                 d, 1);
   end;
end;

  { ImgLib:=g_WDragonImg;
   img := EffectBase;
   d := ImgLib.GetCachedImage (img + (7 * n0) + curframe, px, py);
   if d <> nil then begin
      DrawBlend (surface,
                 FlyX + px - UNITX div 2,
                 FlyY + py - UNITY div 2,
                 d, 1);
   end;
end;     }


constructor TsuduguiThunderEffect.Create (effbase, tx, ty: integer; target: TObject);
begin
   inherited Create (204, effbase,
                     tx, ty,
                     tx, ty, //TActor(target).XX, TActor(target).m_nCurrY,
                     mt17,
                     FALSE,
                     0);
   TargetActor := target;
   frame :=10;
end;

procedure TsuduguiThunderEffect.DrawEff (surface: TDirectDrawSurface);
var
   img, px, py: integer;
   d: TDirectDrawSurface;
begin
   ImgLib:=g_WMonImagesArr[27];
   img := EffectBase;
   d := ImgLib.GetCachedImage (img + curframe, px, py);
   if d <> nil then begin
      DrawBlend (surface,
                 FlyX + px - UNITX div 2,
                 FlyY + py - UNITY div 2,
                 d, 1);
   end;
end;

constructor TsuduguiredEffect.Create (effbase, tx, ty: integer; target: TObject);
begin
   inherited Create (204, effbase,
                     tx, ty,
                     tx, ty, //TActor(target).XX, TActor(target).m_nCurrY,
                     mt18,
                     FALSE,
                     0);
   TargetActor := target;
   frame :=10;
end;

procedure TsuduguiredEffect.DrawEff (surface: TDirectDrawSurface);
var
   img, px, py: integer;
   d: TDirectDrawSurface;
begin
   ImgLib:=g_WMonImagesArr[27];
   img := EffectBase;
   d := ImgLib.GetCachedImage (img + curframe, px, py);
   if d <> nil then begin
      DrawBlend (surface,
                 FlyX + px - UNITX div 2,
                 FlyY + py - UNITY div 2,
                 d, 1);
   end;
end;

{---- Adjust global SVN revision ----}
initialization
  //SVNRevision('$Id: magiceff.pas 501 2006-11-01 22:15:59Z sean $');
end.

