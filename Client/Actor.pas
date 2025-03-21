unit Actor;

interface

uses
  {svn, }Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,  HUtil32,
  Grobal2, DxDraws, CliUtil, magiceff, Wil, ClFunc, SDK;

const
   MAXACTORSOUND = 3;
   CMMX     = 150;
   CMMY     = 200;
   //Hum 프레임 조정
   TIGERFRAME = 320;     //호랑이 프레임
   HUMANFRAME = 1112;
   HUMBONZE = 728;
   HUWEAPONFRAME = 600;
   HUMKILLFRAME = 728;  //무기읽히는수
   HUMUPWARRFRAME = 784; //벽혈전사 등선 프레임
   HUMUPWIZ_MONKDFRAME = 720; //홍현술사,익선도사 등선 프레임
   HUMUPASSFRAME = 912; //비연자객 등선 프레임

   HUMARCHER = 384; //궁수

   WEAPONHUMFRAME = 1200;


   MONFRAME  = 280;
   EXPMONFRAME = 360;
   SCULMONFRAME = 440;
   ZOMBIFRAME = 430;
   MERCHANTFRAME = 60;
//   MON1_FRAME =
//   MON2_FRAME =

   RUN_MINHEALTH = 10;
   DEFSPELLFRAME = 10;
   FIREHIT_READYFRAME = 6;
   MAGBUBBLEBASE = 3890;    //주술의막
   MAGBUBBLESTRUCKBASE = 3900; //주술의막 공격

   MAGBUBBLEBASEUP = 600;    //주술의막 강화
   MAGBUBBLESTRUCKBASEUP = 610; //주술의막 강화 공격

   CELESTIALBASE = 1890;          //선천기공
   CELESTIALSTRUCKBASE = 1893;    //선천기공 공격
   ABYSSBASE = 90;    //심연술
   BLOODSWORD = 190;   //혈룡검법
   KUMGANG = 570; //금강불괴
   PROTECTSHAILD = 1218; //호신강기
   SKYSWORD = 210; //천상비술
   BLOODWATER = 230; //혈룡수
   MAXWPEFFECTFRAME = 5;
   WPEFFECTBASE = 3750;
   EFFECTBASE = 0;

type
  TNPCMissionStatus = (NPCMS_Accept, NPCMS_Complete, NPCMS_Atelic, NPCMS_None);

  TActionInfo = packed record
    start   :Word;//0x14
    frame   :Word;//0x16
    skip    :Word;//0x18
    ftime   :Word;//0x1A
    usetick :Word;//0x1C
  end;
  pTActionInfo = ^TActionInfo;
  THumanAction = packed record
    ActStand:        TActionInfo;   //1
    ActWalk:         TActionInfo;   //8
    ActRun:          TActionInfo;   //8
    ActRushLeft:     TActionInfo;
    ActRushRight:    TActionInfo;
    ActWarMode:      TActionInfo;   //1
    ActHit:          TActionInfo;   //6
    ActHeavyHit:     TActionInfo;   //6
    ActBigHit:       TActionInfo;   //6
    ActHitLeft:      TActionInfo; //자객 왼쪽   //풍검술
    ActEnergyHit:    TActionInfo;
    ActBonzeHit:     TActionInfo;
    ActSpell:        TActionInfo;   //6
    ActSitdown:      TActionInfo;   //1
    ActStruck:       TActionInfo;   //3
    ActDie:          TActionInfo;   //4
    ActDown:         TActionInfo;
    ActTigerStand:   TActionInfo;   //호랑이
    ActTigerWalk:    TActionInfo;
    ActTiger2Walk:   TActionInfo;
    ActTigerRun:     TActionInfo;
    ActTigerStruck:  TactionInfo;
    ActTigerHit:     TActionInfo;
    ActFishStart:    TActionInfo;
    ActFishing:      TActionInfo;
    ActFishEnd:      TActionInfo;

    ActBow:         TActionInfo; //8
    ActHeavyBow:    TActionInfo; //8
    ActBigBow:      TActionInfo; //8
    ActJump:        TActionInfo; //8

    //비연자객
    ActStand2:        TActionInfo;   //1
    ActWalk2:         TActionInfo;   //8
    ActRun2:          TActionInfo;   //8
    ActRushLeft2:     TActionInfo;
    ActRushRight2:    TActionInfo;
    ActWarMode2:      TActionInfo;   //1
    ActHit2:          TActionInfo;   //6
    ActHeavyHit2:     TActionInfo;   //6
    ActBigHit2:       TActionInfo;   //6
    ActHitLeft2:      TActionInfo; //비연자객 왼쪽
    ActSpell2:        TActionInfo;   //6
    ActHitSpell2:     TActionInfo;   //6
    ActSitdown2:      TActionInfo;   //1
    ActStruck2:       TActionInfo;   //3
    ActDie2:          TActionInfo;   //4
    ActDown2:         TActionInfo;
    //우화등선 직업모션

    ActWarModeJobUp:      TActionInfo;   //1
    ActHitJobUp:          TActionInfo;   //6
    ActHeavyHitJobUp:     TActionInfo;   //6
    ActBigHitJobUp:       TActionInfo;   //6
    ActSpellJobUp:        TActionInfo;   //6
    ActSitdownJobUp:      TActionInfo;   //1
    ActStruckJobUp:       TActionInfo;   //3
    ActDieJobUp:          TActionInfo;   //4

    ActHitSpellJobUp:     TActionInfo;   //6
    ActBigHitJobUp2:      TActionInfo;   //6
    //우화등선 탈것
    ActTigerStandUp:   TActionInfo;   //호랑이
    ActTigerWalkUp:    TActionInfo;
    ActTigerRunUp:     TActionInfo;
    ActTigerStruckUp:  TactionInfo;

    ActFishStartUp:    TActionInfo; //낚시 시작 모션
    ActFishingUp:      TActionInfo; //낚시 중 모션
    ActFishEndUp:      TActionInfo; //낚시 끝 모션
    //우화등선 공용무기 모션
    ActWarModeUp:    TActionInfo;
    ActHitUp:        TActionInfo;   //6
    ActHeavyHitUp:   TActionInfo;   //6
    ActBigHitUp:     TActionInfo;   //6
    ActSpellUp:      TActionInfo;   //6
    ActSitdownUp:    TActionInfo;   //1
    ActStruckUp:     TActionInfo;   //3
    ActFightUp:      TActionInfo;
    ActFightUp2:     TActionInfo;  //비연자객 모션 (권투)
  end;
  pTHumanAction = ^THumanAction;
  TMonsterAction = packed record
    ActStand:      TActionInfo;   //1
    ActWalk:       TActionInfo;   //8
    ActAttack:     TActionInfo;   //6 0x14 - 0x1C
    ActCritical:   TActionInfo;   //6 0x20 -
    ActStruck:     TActionInfo;   //3
    ActDie:        TActionInfo;   //4
    ActDeath:      TActionInfo;
    ActAttack2:    TActionInfo;
    ActCritical2:  TActionInfo;
    ActCritical3:  TActionInfo;

    ActCritical4:  TActionInfo;
    ActCritical5:  TActionInfo;
    ActCritical6:  TActionInfo;
    ActCritical7:  TActionInfo;
    ActCritical8:  TActionInfo;
  end;
  pTMonsterAction = ^TMonsterAction;

const
   HA: THumanAction = (
        ActStand:    (start: 0;      frame: 4;  skip: 4;  ftime: 200;  usetick: 0);
        ActWalk:     (start: 64;     frame: 6;  skip: 2;  ftime: 90;   usetick: 2);
        ActRun:      (start: 128;    frame: 6;  skip: 2;  ftime: 120;  usetick: 3);
        ActRushLeft: (start: 128;    frame: 3;  skip: 5;  ftime: 120;  usetick: 3);
        ActRushRight:(start: 131;    frame: 3;  skip: 5;  ftime: 120;  usetick: 3);
        ActWarMode:  (start: 192;    frame: 1;  skip: 0;  ftime: 200;  usetick: 0);
        ActHit:      (start: 200;    frame: 6;  skip: 2;  ftime: 85;   usetick: 0);    //오른손 공격   //1
        ActHeavyHit: (start: 264;    frame: 6;  skip: 2;  ftime: 90;   usetick: 0);                    //2
        ActBigHit:   (start: 328;    frame: 8;  skip: 0;  ftime: 70;   usetick: 0);   //큰 모션        //3
        ActHitLeft:  (start: 600;    frame: 6;  skip: 2;  ftime: 85;   usetick: 0);    //자객 왼손
        ActEnergyHit:(start: 664;    frame: 6;  skip: 2;  ftime: 85;   usetick: 0);
        ActBonzeHit :(start: 600;    frame: 8;  skip: 0;  ftime: 75;   usetick: 0);
        ActSpell:    (start: 392;    frame: 6;  skip: 2;  ftime: 60;   usetick: 0);
        ActSitdown:  (start: 456;    frame: 2;  skip: 0;  ftime: 200;  usetick: 0);
        ActStruck:   (start: 472;    frame: 3;  skip: 5;  ftime: 70;   usetick: 0);
        ActDie:      (start: 536;    frame: 4;  skip: 4;  ftime: 120;  usetick: 0);
        ActDown:     (start: 664;    frame: 6;  skip: 2;  ftime: 120;   usetick: 3); //자객 월영술
        ActTigerStand: (start: 600;    frame:4;   skip: 4;  ftime: 200; usetick: 0);
        ActTigerWalk:  (start: 664;    frame:8;   skip: 0;  ftime:  90; usetick:2);
        ActTiger2Walk:  (start: 664;    frame:6;   skip: 2;  ftime:  90; usetick:2);
        ActTigerRun:   (start: 728;    frame:6;   skip: 2;  ftime: 120; usetick:3);
        ActTigerStruck:(start: 792;    frame:3;   skip: 5;  ftime: 70;  usetick: 0);
        ActTigerHit:   (start: 856;    frame:6;   skip: 2;  ftime: 85;  usetick:0);

        ActFishStart:  (start: 920;    frame:8;   skip: 0;  ftime: 100;  usetick: 0); //낚시 시작 모션
        ActFishing:    (start: 984;    frame:6;   skip: 2;  ftime: 180;  usetick: 0); //낚시 중 모션
        ActFishEnd:    (start: 1048;   frame:8;   skip: 0;  ftime: 100;  usetick: 0); //낚시 끝 모션

        ActBow:        (start: 192; frame: 8; skip: 0; ftime: 100; usetick: 0);
        ActHeavyBow:   (start: 256; frame: 8; skip: 0; ftime: 100; usetick: 0);
        ActBigBow:     (start: 320; frame: 8; skip: 0; ftime: 100; usetick: 0);
        ActJump:       (start: 384; frame: 8; skip: 0; ftime: 100; usetick: 0);
        //비연자객 모션
        ActStand2:    (start: 0;      frame: 4;  skip: 4;  ftime: 200;  usetick: 0);     //정상
        ActWalk2:     (start: 128;    frame: 6;  skip: 2;  ftime: 90;   usetick: 2);     //정상
        ActRun2:      (start: 192;    frame: 6;  skip: 2;  ftime: 120;  usetick: 3);     //정상
        ActRushLeft2: (start: 192;    frame: 3;  skip: 5;  ftime: 120;  usetick: 3);     //정상
        ActRushRight2:(start: 195;    frame: 3;  skip: 5;  ftime: 120;  usetick: 3);     //정상
        ActWarMode2:  (start: 400;    frame: 1;  skip: 7;  ftime: 200;  usetick: 0);     //정상
        ActHit2:      (start: 528;    frame: 6;  skip: 2;  ftime: 85;   usetick: 0);     //정상
        ActHeavyHit2: (start: 657;    frame: 6;  skip: 2;  ftime: 90;   usetick: 0);     //정상
        ActBigHit2:   (start: 848;    frame: 8;  skip: 0;  ftime: 70;   usetick: 0);     //정상
        ActHitLeft2:  (start: 464;    frame: 6;  skip: 2;  ftime: 85;   usetick: 0);     //정상
        ActSpell2:    (start: 784;    frame: 6;  skip: 2;  ftime: 90;   usetick: 0);     //정상
        ActHitSpell2: (start: 592;    frame: 6;  skip: 2;  ftime: 90;   usetick: 0);     //정상
        ActSitdown2:  (start: 384;    frame: 2;  skip: 0;  ftime: 200;  usetick: 0);     //정상
        ActStruck2:   (start: 256;    frame: 3;  skip: 5;  ftime: 70;   usetick: 0);     //정상
        ActDie2:      (start: 322;    frame: 4;  skip: 4;  ftime: 120;  usetick: 0);     //정상
        ActDown2:     (start: 64;     frame: 6;  skip: 2;  ftime: 120;   usetick: 3);    //정상

        //우화등선 직업무기
        ActWarModeJobUp:  (start: 336;    frame: 1;  skip: 7;  ftime: 200;  usetick: 0);      //정상
        ActHitJobUp:      (start: 400;    frame: 6;  skip: 2;  ftime: 85;   usetick: 0);      //정상
        ActHeavyHitJobUp: (start: 464;    frame: 6;  skip: 2;  ftime: 90;   usetick: 0);      //정상
        ActBigHitJobUp:   (start: 528;    frame: 8;  skip: 0;  ftime: 70;   usetick: 0);      //정상
        ActSpellJobUp:    (start: 656;    frame: 6;  skip: 2;  ftime: 60;   usetick: 0);      //정상
        ActSitdownJobUp:  (start: 320;    frame: 2;  skip: 0;  ftime: 200;  usetick: 0);      //정상
        ActStruckJobUp:   (start: 192;    frame: 3;  skip: 5;  ftime: 70;   usetick: 0);      //정상
        ActDieJobUp:      (start: 258;    frame: 4;  skip: 4;  ftime: 120;  usetick: 0);      //정상

        ActHitSpellJobUp: (start: 720;    frame: 8;  skip: 0;  ftime: 70;   usetick: 0);      //정상
        ActBigHitJobUp2:  (start: 528;    frame: 6;  skip: 2;  ftime: 70;   usetick: 0);      //정상


        //우화등선 탈것
        ActTigerStandUp: (start: 792;    frame:4;   skip: 4;  ftime: 200; usetick: 0);    //정상
        ActTigerWalkUp:  (start: 856;    frame:8;   skip: 0;  ftime: 90;  usetick: 2);    //정상
        ActTigerRunUp:   (start: 920;    frame:6;   skip: 2;  ftime: 120; usetick: 3);    //정상
        ActTigerStruckUp:(start: 984;    frame:3;   skip: 5;  ftime: 70;  usetick: 0);    //정상

        ActFishStartUp:  (start: 600;    frame:8;   skip: 0;  ftime: 100;  usetick: 0); //낚시 시작 모션
        ActFishingUp:    (start: 664;    frame:6;   skip: 2;  ftime: 180;  usetick: 0); //낚시 중 모션
        ActFishEndUp:    (start: 728;    frame:8;   skip: 0;  ftime: 100;  usetick: 0); //낚시 끝 모션

        //우화등선 공용무기
        ActWarModeUp:  (start: 256;    frame: 1;  skip: 0;  ftime: 200;  usetick: 0);
        ActHitUp:      (start: 264;    frame: 6;  skip: 2;  ftime: 85;   usetick: 0);    //오른손 공격   //1
        ActHeavyHitUp: (start: 328;    frame: 6;  skip: 2;  ftime: 90;   usetick: 0);                    //2
        ActBigHitUp:   (start: 392;    frame: 8;  skip: 0;  ftime: 70;   usetick: 0);   //큰 모션        //3
        ActSpellUp:    (start: 456;    frame: 6;  skip: 2;  ftime: 60;   usetick: 0);
        ActSitdownUp:  (start: 520;    frame: 2;  skip: 0;  ftime: 200;  usetick: 0);
        ActStruckUp:   (start: 192;    frame: 3;  skip: 5;  ftime: 70;   usetick: 0);
        ActFightUp:    (start: 592;    frame: 6;  skip: 2;  ftime: 85;   usetick: 0);

        //비연자객 모션
        ActFightUp2:   (start: 720;    frame: 6;  skip: 2;  ftime: 85;   usetick: 0)
      );
   {=======================엔피씨==================================}
   NA35: TMonsterAction = (  //NPC
        ActStand:  (start: 0;    frame: 4;  skip: 6;  ftime: 200;  usetick: 0);
        ActWalk:   (start: 0;    frame: 0;  skip: 0;  ftime: 0;  usetick: 0);
        ActAttack: (start: 30;   frame: 8;  skip: 2;  ftime: 150;  usetick: 0);
        ActCritical:(start: 0;   frame: 0;  skip: 0;  ftime: 0;    usetick: 0);
        ActStruck: (start: 0;    frame: 1;  skip: 9;  ftime: 0;  usetick: 0);
        ActDie:    (start: 0;    frame: 0;  skip: 0;  ftime: 0;  usetick: 0);
        ActDeath:  (start: 0;    frame: 0;  skip: 0;  ftime: 0;  usetick: 0);
      );
   NA36: TMonsterAction = ( //NPC
        ActStand:  (start: 0;    frame: 8; skip: 0;  ftime: 100;  usetick: 0);
        ActWalk:   (start: 0;    frame: 0;  skip: 0;  ftime: 0;    usetick: 0);
        ActAttack: (start: 0;    frame: 0;  skip: 0;  ftime: 0;  usetick: 0);
        ActCritical: (start: 0;   frame: 0; skip: 0;  ftime: 0;  usetick: 0);
        ActStruck: (start: 0;    frame: 0;  skip: 0;  ftime: 0;  usetick: 0);
        ActDie:    (start: 0;    frame: 0;  skip: 0;  ftime: 0;  usetick: 0);
        ActDeath:  (start: 0;    frame: 0;  skip: 0;  ftime: 0;  usetick: 0);
      );
   NA37: TMonsterAction = (  //NPC
        ActStand:  (start: 0;     frame: 6;   skip: 4;  ftime: 150;  usetick: 0);
        ActWalk:   (start: 0;     frame: 6;   skip: 4;  ftime: 150;  usetick: 3);
        ActAttack: (start: 0;     frame: 6;   skip: 4;  ftime: 150;  usetick: 0);
        ActCritical:(start:0;     frame: 6;   skip: 4;  ftime: 150;  usetick: 0);
        ActStruck: (start: 0;     frame: 6;   skip: 4;  ftime: 150;  usetick: 0);
        ActDie:    (start: 0;     frame: 6;   skip: 4;  ftime: 150;  usetick: 0);
        ActDeath:  (start: 0;     frame: 6;   skip: 4;  ftime: 150;  usetick: 0);
      );
   NA38: TMonsterAction = (  //NPC
        ActStand:  (start: 0;     frame: 10;   skip: 0;  ftime: 100;  usetick: 0);
        ActWalk:   (start: 0;     frame: 0;   skip: 0;  ftime: 100;  usetick: 3);
        ActAttack: (start: 0;     frame: 0;   skip: 0;  ftime: 100;  usetick: 0);
        ActCritical:(start:0;     frame: 0;   skip: 0;  ftime: 100;  usetick: 0);
        ActStruck: (start: 0;     frame: 0;   skip: 0;  ftime: 100;  usetick: 0);
        ActDie:    (start: 0;     frame: 0;   skip: 0;  ftime: 100;  usetick: 0);
        ActDeath:  (start: 0;     frame: 0;   skip: 0;  ftime: 100;  usetick: 0);
      );
   NA39: TMonsterAction = (  //NPC
        ActStand:  (start: 0;     frame: 11;   skip: 0;  ftime: 100;  usetick: 0);
        ActWalk:   (start: 0;     frame: 0;   skip: 0;  ftime: 100;  usetick: 3);
        ActAttack: (start: 0;     frame: 0;   skip: 0;  ftime: 100;  usetick: 0);
        ActCritical:(start:0;     frame: 0;   skip: 0;  ftime: 100;  usetick: 0);
        ActStruck: (start: 0;     frame: 0;   skip: 0;  ftime: 100;  usetick: 0);
        ActDie:    (start: 0;     frame: 0;   skip: 0;  ftime: 100;  usetick: 0);
        ActDeath:  (start: 0;     frame: 0;   skip: 0;  ftime: 100;  usetick: 0);
      );
   NA40: TMonsterAction = (  //NPC
        ActStand:  (start: 0;     frame: 9;   skip: 1;  ftime: 120;  usetick: 0);
        ActWalk:   (start: 0;     frame: 9;   skip: 1;  ftime: 120;  usetick: 3);
        ActAttack: (start: 0;     frame: 9;   skip: 1;  ftime: 120;  usetick: 0);
        ActCritical:(start:0;     frame: 9;   skip: 1;  ftime: 120;  usetick: 0);
        ActStruck: (start: 0;     frame: 9;   skip: 1;  ftime: 120;  usetick: 0);
        ActDie:    (start: 0;     frame: 9;   skip: 1;  ftime: 120;  usetick: 0);
        ActDeath:  (start: 0;     frame: 9;   skip: 1;  ftime: 120;  usetick: 0);
      );
   NA41: TMonsterAction = (  //NPC
        ActStand:  (start: 0;    frame: 4;  skip: 6;  ftime: 200;  usetick: 0);
        ActWalk:   (start: 0;    frame: 0;  skip: 0;  ftime: 0;  usetick: 0);
        ActAttack: (start: 30;   frame: 6;  skip: 4;  ftime: 150;  usetick: 0);
        ActCritical:(start: 0;   frame: 0;  skip: 0;  ftime: 0;    usetick: 0);
        ActStruck: (start: 0;    frame: 1;  skip: 9;  ftime: 0;  usetick: 0);
        ActDie:    (start: 0;    frame: 0;  skip: 0;  ftime: 0;  usetick: 0);
        ActDeath:  (start: 0;    frame: 0;  skip: 0;  ftime: 0;  usetick: 0);
      );
   NA50: TMonsterAction = (  //일반 NPC
        ActStand:  (start: 0;    frame: 4;  skip: 6;  ftime: 200;  usetick: 0);
        ActWalk:   (start: 0;    frame: 0;  skip: 0;  ftime: 0;  usetick: 0);
        ActAttack: (start: 30;   frame: 10; skip: 0;  ftime: 150;  usetick: 0);
        ActCritical:(start: 0;     frame: 0;  skip: 0;  ftime: 0;    usetick: 0);
        ActStruck: (start: 0;    frame: 1;  skip: 9;  ftime: 0;  usetick: 0);
        ActDie:    (start: 0;    frame: 0;  skip: 0;  ftime: 0;  usetick: 0);
        ActDeath:  (start: 0;    frame: 0;  skip: 0;  ftime: 0;  usetick: 0);
      );
   NA51: TMonsterAction = (
        ActStand:  (start: 0;    frame: 4;  skip: 6;  ftime: 200;  usetick: 0);
        ActWalk:   (start: 0;    frame: 0;  skip: 0;  ftime: 0;  usetick: 0);
        ActAttack: (start: 30;   frame: 20; skip: 0;  ftime: 150;  usetick: 0);
        ActCritical:(start: 0;     frame: 0;  skip: 0;  ftime: 0;    usetick: 0);
        ActStruck: (start: 0;    frame: 1;  skip: 9;  ftime: 0;  usetick: 0);
        ActDie:    (start: 0;    frame: 0;  skip: 0;  ftime: 0;  usetick: 0);
        ActDeath:  (start: 0;    frame: 0;  skip: 0;  ftime: 0;  usetick: 0);
      );
   NA52: TMonsterAction = (  //
        ActStand:  (start: 30;    frame: 4;  skip: 6;  ftime: 200;  usetick: 0);
        ActWalk:   (start: 0;    frame: 0;  skip: 0;  ftime: 0;  usetick: 0);
        ActAttack: (start: 30;   frame: 4; skip: 6;  ftime: 150;  usetick: 0);
        ActCritical:(start: 0;     frame: 0;  skip: 0;  ftime: 0;    usetick: 0);
        ActStruck: (start: 0;    frame: 1;  skip: 9;  ftime: 0;  usetick: 0);
        ActDie:    (start: 0;    frame: 0;  skip: 0;  ftime: 0;  usetick: 0);
        ActDeath:  (start: 0;    frame: 0;  skip: 0;  ftime: 0;  usetick: 0);
      );
   NA56: TMonsterAction = ( //석상
        ActStand:  (start: 0;    frame: 2;  skip: 8;  ftime: 200;  usetick: 0);
        ActWalk:   (start: 0;    frame: 2;  skip: 8;  ftime: 200;  usetick: 0);
        ActAttack: (start: 0;    frame: 2;  skip: 8;  ftime: 200;  usetick: 0);
        ActCritical:(start: 0;   frame: 2;  skip: 8;  ftime: 200;  usetick: 0);
        ActStruck: (start: 0;    frame: 2;  skip: 8;  ftime: 200;  usetick: 0);
        ActDie:    (start: 0;    frame: 2;  skip: 8;  ftime: 200;  usetick: 0);
        ActDeath:  (start: 0;    frame: 2;  skip: 8;  ftime: 200;  usetick: 0);
      );
   NA57: TMonsterAction = (  // 도깨비불, 꽃눈
        ActStand:  (start: 0;      frame: 4;  skip: 6;  ftime: 200;  usetick: 0);
        ActWalk:   (start: 10;     frame: 8;  skip: 2;  ftime: 160;  usetick: 0); //등장...
        ActAttack: (start:  0;     frame: 0;  skip: 0;  ftime: 0;    usetick: 0);
        ActCritical:(start: 0;     frame: 0;  skip: 0;  ftime: 0;    usetick: 0);
        ActStruck: (start:  0;     frame: 0;  skip: 0;  ftime: 0;    usetick: 0);
        ActDie:    (start: 30;     frame: 10; skip: 0;  ftime: 120;  usetick: 0); //도깨비불
        ActDeath:  (start: 30;     frame: 10; skip: 0; ftime: 150;  usetick: 0); //숨음..
      );
   NA61: TMonsterAction = ( // 마룡의전각 불꽃NPC
        ActStand:  (start: 0;    frame: 20; skip: 0;  ftime: 100;  usetick: 0);
        ActWalk:   (start: 0;    frame: 0;  skip: 0;  ftime: 0;    usetick: 0);
        ActAttack: (start: 0;    frame: 0;  skip: 0;  ftime: 0;  usetick: 0);
        ActCritical: (start: 0;   frame: 0; skip: 0;  ftime: 0;  usetick: 0);
        ActStruck: (start: 0;    frame: 0;  skip: 0;  ftime: 0;  usetick: 0);
        ActDie:    (start: 0;    frame: 0;  skip: 0;  ftime: 0;  usetick: 0);
        ActDeath:  (start: 0;    frame: 0;  skip: 0;  ftime: 0;  usetick: 0);
      );
   NA68: TMonsterAction = (  //NPC 3방향 서있기 모션만
        ActStand:  (start: 0;     frame: 4;   skip: 6;  ftime: 150;  usetick: 0);
        ActWalk:   (start: 0;     frame: 4;   skip: 6;  ftime: 150;  usetick: 3);
        ActAttack: (start: 0;     frame: 4;   skip: 6;  ftime: 150;  usetick: 0);
        ActCritical:(start:0;     frame: 4;   skip: 6;  ftime: 150;  usetick: 0);
        ActStruck: (start: 0;     frame: 4;   skip: 6;  ftime: 150;  usetick: 0);
        ActDie:    (start: 0;     frame: 4;   skip: 6;  ftime: 150;  usetick: 0);
        ActDeath:  (start: 0;     frame: 4;   skip: 6;  ftime: 150;  usetick: 0);
      );
   NA69: TMonsterAction = (  //NPC 1방향 서있기 모션만
        ActStand:  (start: 0;     frame: 1;   skip: 0;  ftime: 100;  usetick: 0);
        ActWalk:   (start: 0;     frame: 1;   skip: 0;  ftime: 100;  usetick: 3);
        ActAttack: (start: 0;     frame: 1;   skip: 0;  ftime: 100;  usetick: 0);
        ActCritical:(start:0;     frame: 1;   skip: 0;  ftime: 100;  usetick: 0);
        ActStruck: (start: 0;     frame: 1;   skip: 0;  ftime: 100;  usetick: 0);
        ActDie:    (start: 0;     frame: 1;   skip: 0;  ftime: 100;  usetick: 0);
        ActDeath:  (start: 0;     frame: 1;   skip: 0;  ftime: 100;  usetick: 0);
      );
   NA70: TMonsterAction = (  //NPC 1방향 서있기 모션만
        ActStand:  (start: 0;     frame: 20;   skip: 0;  ftime: 200;  usetick: 0);
        ActWalk:   (start: 0;     frame: 1;   skip: 0;  ftime: 100;  usetick: 3);
        ActAttack: (start: 0;     frame: 1;   skip: 0;  ftime: 100;  usetick: 0);
        ActCritical:(start:0;     frame: 1;   skip: 0;  ftime: 100;  usetick: 0);
        ActStruck: (start: 0;     frame: 1;   skip: 0;  ftime: 100;  usetick: 0);
        ActDie:    (start: 0;     frame: 1;   skip: 0;  ftime: 100;  usetick: 0);
        ActDeath:  (start: 0;     frame: 1;   skip: 0;  ftime: 100;  usetick: 0);
      );
   {=======================엔피씨 끝==================================}

  MA1: TMonsterAction = ( //검은흑성성
    ActStand:   (start: 0;   frame: 6;  skip: 4;  ftime: 200;  usetick: 0);
    ActWalk:    (start: 80;  frame: 6;  skip: 4;  ftime: 120;  usetick: 3);
    ActAttack:  (start: 160; frame: 7;  skip: 3;  ftime: 120;  usetick: 0);
    ActCritical:(start: 400; frame: 8;  skip: 2;  ftime: 120;  usetick: 0);
    ActStruck:  (start: 240; frame: 3;  skip: 7;  ftime: 100;  usetick: 0);
    ActDie:     (start: 320; frame: 7;  skip: 3;  ftime: 180;  usetick: 0);
    ActDeath:   (start: 320; frame: 7;  skip: 3;  ftime: 180;  usetick: 0);
    );
  MA2: TMonsterAction = ( //이두흑호
    ActStand:   (start: 0;   frame: 9;  skip: 1;  ftime: 100;  usetick: 0);
    ActWalk:    (start: 80;  frame: 6;  skip: 4;  ftime: 120;  usetick: 3);
    ActAttack:  (start: 160; frame: 9;  skip: 1;  ftime: 100;  usetick: 0);
    ActCritical:(start: 400; frame: 7;  skip: 3;  ftime: 120;  usetick: 0);
    ActStruck:  (start: 240; frame: 3;  skip: 7;  ftime: 100;  usetick: 0);
    ActDie:     (start: 320; frame: 10;  skip: 0;  ftime: 150;  usetick: 0);
    ActDeath:   (start: 320; frame: 10;  skip: 0;  ftime: 150;  usetick: 0);
    );
  MA3: TMonsterAction = ( //여귀
    ActStand:   (start: 0;   frame: 4;  skip: 6;  ftime: 100;  usetick: 0);
    ActWalk:    (start: 80;  frame: 6;  skip: 4;  ftime: 120;  usetick: 3);
    ActAttack:  (start: 160; frame: 8;  skip: 2;  ftime: 100;  usetick: 0);
    ActCritical:(start: 240; frame: 9;  skip: 1;  ftime: 120;  usetick: 0);
    ActStruck:  (start: 320; frame: 3;  skip: 7;  ftime: 100;  usetick: 0);
    ActDie:     (start: 400; frame: 13;  skip: 7;  ftime: 100;  usetick: 0);
    ActDeath:   (start: 400; frame: 13;  skip: 7;  ftime: 100;  usetick: 0);
    );
  MA4: TMonsterAction = ( //태골서
    ActStand:   (start: 0;   frame: 4;  skip: 6;  ftime: 100;  usetick: 0);
    ActWalk:    (start: 80;  frame: 6;  skip: 4;  ftime: 120;  usetick: 3);
    ActAttack:  (start: 160; frame: 10;  skip: 0;  ftime: 90;  usetick: 0);
    ActCritical:(start: 240; frame: 10;  skip: 0;  ftime: 90;  usetick: 0);
    ActStruck:  (start: 320; frame: 3;  skip: 7;  ftime: 100;  usetick: 0);
    ActDie:     (start: 400; frame: 10;  skip: 0;  ftime: 100;  usetick: 0);
    ActDeath:   (start: 400; frame: 10;  skip: 0;  ftime: 100;  usetick: 0);
    );
  MA5: TMonsterAction = ( //작은대망
    ActStand:   (start: 0;   frame: 4;  skip: 6;  ftime: 100;  usetick: 0);
    ActWalk:    (start: 80;  frame: 6;  skip: 4;  ftime: 120;  usetick: 3);
    ActAttack:  (start: 160; frame: 8;  skip: 2;  ftime: 90;  usetick: 0);
    ActCritical:(start: 0; frame: 0;  skip: 0;  ftime: 0;  usetick: 0);
    ActStruck:  (start: 240; frame: 3;  skip: 7;  ftime: 100;  usetick: 0);
    ActDie:     (start: 320; frame: 9;  skip: 1;  ftime: 100;  usetick: 0);
    ActDeath:   (start: 320; frame: 9;  skip: 1;  ftime: 100;  usetick: 0);
    );
  MA6: TMonsterAction = ( //대망
    ActStand:   (start: 0;   frame: 4;  skip: 6;  ftime: 100;  usetick: 0);
    ActWalk:    (start: 80;  frame: 6;  skip: 4;  ftime: 120;  usetick: 3);
    ActAttack:  (start: 160; frame: 8;  skip: 2;  ftime: 90;  usetick: 0);
    ActCritical:(start: 240; frame: 7;  skip: 3;  ftime: 100;  usetick: 0);
    ActStruck:  (start: 400; frame: 3;  skip: 7;  ftime: 100;  usetick: 0);
    ActDie:     (start: 480; frame: 10;  skip: 0;  ftime: 100;  usetick: 0);
    ActDeath:   (start: 480; frame: 10;  skip: 0;  ftime: 100;  usetick: 0);
    ActCritical2:(start: 320; frame: 8;  skip: 2;  ftime: 100;  usetick: 0);
    );
  MA7: TMonsterAction = ( //주마술사
    ActStand:   (start: 0;   frame: 4;  skip: 6;  ftime: 100;  usetick: 0);
    ActWalk:    (start: 80;  frame: 6;  skip: 4;  ftime: 120;  usetick: 3);
    ActAttack:  (start: 160; frame: 8;  skip: 2;  ftime: 90;  usetick: 0);
    ActCritical:(start: 240; frame: 9;  skip: 1;  ftime: 100;  usetick: 0);
    ActStruck:  (start: 400; frame: 3;  skip: 7;  ftime: 100;  usetick: 0);
    ActDie:     (start: 480; frame: 10;  skip: 0;  ftime: 100;  usetick: 0);
    ActDeath:   (start: 480; frame: 10;  skip: 0;  ftime: 100;  usetick: 0);
    ActCritical2:(start: 320; frame: 8;  skip: 2;  ftime: 100;  usetick: 0);
    );
  MA8: TMonsterAction = ( //주마화궁사
    ActStand:   (start: 0;   frame: 4;  skip: 6;  ftime: 100;  usetick: 0);
    ActWalk:    (start: 80;  frame: 6;  skip: 4;  ftime: 120;  usetick: 3);
    ActAttack:  (start: 160; frame: 10;  skip: 0;  ftime: 90;  usetick: 0);
    ActCritical:(start: 240; frame: 9;  skip: 1;  ftime: 90;  usetick: 0);
    ActStruck:  (start: 320; frame: 3;  skip: 7;  ftime: 100;  usetick: 0);
    ActDie:     (start: 400; frame: 10;  skip: 0;  ftime: 100;  usetick: 0);
    ActDeath:   (start: 400; frame: 10;  skip: 0;  ftime: 100;  usetick: 0);
    );
  MA9: TMonsterAction = (//4C03D4
    ActStand:(Start:0;  frame:1;  skip:7;  ftime:200;  usetick:0);
    ActWalk:(Start:64;  frame:6;  skip:2;  ftime:120;  usetick:3);
    ActAttack:(Start:64;  frame:6;  skip:2;  ftime:150;  usetick:0);
    ActCritical:(Start:0;  frame:0;  skip:0;  ftime:0;  usetick:0);
    ActStruck:(Start:64;  frame:6;  skip:2;  ftime:100;  usetick:0);
    ActDie:(Start:0;  frame:1;  skip:7;  ftime:140;  usetick:0);
    ActDeath:(Start:0;  frame:1;  skip:7;  ftime:0;  usetick:0);
    );
   MA10: TMonsterAction = (  //몽코(8Frame짜리)
        ActStand:  (start: 0;      frame: 4;  skip: 4;  ftime: 200;  usetick: 0);
        ActWalk:   (start: 64;     frame: 6;  skip: 2;  ftime: 120;  usetick: 3);
        ActAttack: (start: 128;    frame: 4;  skip: 4;  ftime: 150;  usetick: 0);
        ActCritical:(start: 0;     frame: 0;  skip: 0;  ftime: 0;    usetick: 0);
        ActStruck: (start: 192;    frame: 2;  skip: 0;  ftime: 100;  usetick: 0);
        ActDie:    (start: 208;    frame: 4;  skip: 4;  ftime: 140;  usetick: 0);
        ActDeath:  (start: 272;    frame: 1;  skip: 0;  ftime: 0;    usetick: 0);
      );
   MA11: TMonsterAction = (    //사슴 , 닭
        ActStand:  (start: 0;      frame: 4;  skip: 6;  ftime: 200;  usetick: 0);
        ActWalk:   (start: 80;     frame: 6;  skip: 4;  ftime: 120;  usetick: 3);
        ActAttack: (start: 160;    frame: 6;  skip: 4;  ftime: 100;  usetick: 0);
        ActCritical:(start: 0;     frame: 0;  skip: 0;  ftime: 0;    usetick: 0);
        ActStruck: (start: 240;    frame: 2;  skip: 0;  ftime: 100;  usetick: 0);
        ActDie:    (start: 260;    frame: 10; skip: 0;  ftime: 140;  usetick: 0);
        ActDeath:  (start: 340;    frame: 1;  skip: 0;  ftime: 0;  usetick: 0);
      );
   MA12: TMonsterAction = (  //경비병, 때리는 속도 빠르다.
        ActStand:  (start: 0;      frame: 4;  skip: 4;  ftime: 200;  usetick: 0);
        ActWalk:   (start: 64;     frame: 6;  skip: 2;  ftime: 120;  usetick: 3);
        ActAttack: (start: 128;    frame: 6;  skip: 2;  ftime: 150;  usetick: 0);
        ActCritical:(start: 0;     frame: 0;  skip: 0;  ftime: 0;    usetick: 0);
        ActStruck: (start: 192;    frame: 2;  skip: 0;  ftime: 150;  usetick: 0);
        ActDie:    (start: 208;    frame: 4;  skip: 4;  ftime: 160;  usetick: 0);
        ActDeath:  (start: 272;    frame: 1;  skip: 0;  ftime: 0;    usetick: 0);
      );
   MA13: TMonsterAction = (
        ActStand:  (start: 0;      frame: 4;  skip: 6;  ftime: 200;  usetick: 0);
        ActWalk:   (start: 10;     frame: 8;  skip: 2;  ftime: 160;  usetick: 0);
        ActAttack: (start: 30;     frame: 6;  skip: 4;  ftime: 120;  usetick: 0);
        ActCritical:(start: 0;     frame: 0;  skip: 0;  ftime: 0;    usetick: 0);
        ActStruck: (start: 110;    frame: 2;  skip: 0;  ftime: 100;  usetick: 0);
        ActDie:    (start: 130;    frame: 10; skip: 0;  ftime: 120;  usetick: 0);
        ActDeath:  (start: 20;     frame: 9;  skip: 0;  ftime: 150;  usetick: 0);
      );
   MA14: TMonsterAction = (
        ActStand:  (start: 0;      frame: 4;  skip: 6;  ftime: 200;  usetick: 0);
        ActWalk:   (start: 80;     frame: 6;  skip: 4;  ftime: 160;  usetick: 3);
        ActAttack: (start: 160;    frame: 6;  skip: 4;  ftime: 100;  usetick: 0);
        ActCritical:(start: 0;     frame: 0;  skip: 0;  ftime: 0;    usetick: 0);
        ActStruck: (start: 240;    frame: 2;  skip: 0;  ftime: 100;  usetick: 0);
        ActDie:    (start: 260;    frame: 10; skip: 0;  ftime: 120;  usetick: 0);
        ActDeath:  (start: 340;    frame: 10; skip: 0;  ftime: 100;  usetick: 0);
      );
   MA1444: TMonsterAction = (   //진골
        ActStand:  (start: 0;      frame: 4;  skip: 6;  ftime: 200;  usetick: 0);
        ActWalk:   (start: 80;     frame: 6;  skip: 4;  ftime: 160;  usetick: 3);
        ActAttack: (start: 160;    frame: 6;  skip: 4;  ftime: 100;  usetick: 0);
        ActCritical:(start: 0;     frame: 0;  skip: 0;  ftime: 0;    usetick: 0);
        ActStruck: (start: 240;    frame: 2;  skip: 0;  ftime: 100;  usetick: 0);
        ActDie:    (start: 260;    frame: 6;  skip: 4;  ftime: 120;  usetick: 0);
        ActDeath:  (start: 340;    frame: 5;  skip: 0;  ftime: 100;  usetick: 0);
      );
   MA15: TMonsterAction = (
        ActStand:  (start: 0;      frame: 4;  skip: 6;  ftime: 200;  usetick: 0);
        ActWalk:   (start: 80;     frame: 6;  skip: 4;  ftime: 160;  usetick: 3);
        ActAttack: (start: 160;    frame: 6;  skip: 4;  ftime: 100;  usetick: 0);
        ActCritical:(start: 0;     frame: 0;  skip: 0;  ftime: 0;    usetick: 0);
        ActStruck: (start: 240;    frame: 2;  skip: 0;  ftime: 100;  usetick: 0);
        ActDie:    (start: 260;    frame: 10; skip: 0;  ftime: 120;  usetick: 0);
        ActDeath:  (start: 1;      frame: 1;  skip: 0;  ftime: 100;  usetick: 0);
      );
   MA16: TMonsterAction = (
        ActStand:  (start: 0;      frame: 4;  skip: 6;  ftime: 200;  usetick: 0);
        ActWalk:   (start: 80;     frame: 6;  skip: 4;  ftime: 160;  usetick: 3);
        ActAttack: (start: 160;    frame: 6;  skip: 4;  ftime: 160;  usetick: 0);
        ActCritical:(start: 0;     frame: 0;  skip: 0;  ftime: 0;    usetick: 0);
        ActStruck: (start: 240;    frame: 2;  skip: 0;  ftime: 100;  usetick: 0);
        ActDie:    (start: 260;    frame: 4;  skip: 6;  ftime: 160;  usetick: 0);
        ActDeath:  (start: 0;      frame: 1;  skip: 0;  ftime: 160;  usetick: 0);
      );
   MA17: TMonsterAction = (
        ActStand:  (start: 0;      frame: 4;  skip: 6;  ftime: 60;  usetick: 0);
        ActWalk:   (start: 80;     frame: 6;  skip: 4;  ftime: 160;  usetick: 3);
        ActAttack: (start: 160;    frame: 6;  skip: 4;  ftime: 100;  usetick: 0);
        ActCritical:(start: 0;     frame: 0;  skip: 0;  ftime: 0;    usetick: 0);
        ActStruck: (start: 240;    frame: 2;  skip: 0;  ftime: 100;  usetick: 0);
        ActDie:    (start: 260;    frame: 10; skip: 0;  ftime: 100;  usetick: 0);
        ActDeath:  (start: 340;    frame: 1;  skip: 0;  ftime: 140;  usetick: 0);
      );
   MA19: TMonsterAction = (           //양
        ActStand:  (start: 0;      frame: 4;  skip: 6;  ftime: 200;  usetick: 0);
        ActWalk:   (start: 80;     frame: 6;  skip: 4;  ftime: 160;  usetick: 3);
        ActAttack: (start: 160;    frame: 6;  skip: 4;  ftime: 100;  usetick: 0);
        ActCritical:(start: 0;     frame: 0;  skip: 0;  ftime: 0;    usetick: 0);
        ActStruck: (start: 240;    frame: 2;  skip: 0;  ftime: 100;  usetick: 0);
        ActDie:    (start: 260;    frame: 10; skip: 0;  ftime: 140;  usetick: 0);
        ActDeath:  (start: 340;    frame: 1;  skip: 0;  ftime: 140;  usetick: 0);
      );
   MA741: TMonsterAction = (           //초코과자
        ActStand:  (start: 0;      frame: 4;  skip: 6;  ftime: 200;  usetick: 0);
        ActWalk:   (start: 80;     frame: 6;  skip: 4;  ftime: 160;  usetick: 3);
        ActAttack: (start: 160;    frame: 6;  skip: 4;  ftime: 100;  usetick: 0);
        ActCritical:(start: 0;     frame: 0;  skip: 0;  ftime: 0;    usetick: 0);
        ActStruck: (start: 240;    frame: 3;  skip: 7;  ftime: 100;  usetick: 0);
        ActDie:    (start: 320;    frame: 6;  skip: 4;  ftime: 140;  usetick: 0);
        ActDeath:  (start: 320;    frame: 1;  skip: 0;  ftime: 140;  usetick: 0);
      );
   MA20: TMonsterAction = (
        ActStand:  (start: 0;      frame: 4;  skip: 6;  ftime: 200;  usetick: 0);
        ActWalk:   (start: 80;     frame: 6;  skip: 4;  ftime: 160;  usetick: 3);
        ActAttack: (start: 160;    frame: 6;  skip: 4;  ftime: 120;  usetick: 0);
        ActCritical:(start: 0;     frame: 0;  skip: 0;  ftime: 0;    usetick: 0);
        ActStruck: (start: 240;    frame: 2;  skip: 0;  ftime: 100;  usetick: 0);
        ActDie:    (start: 260;    frame: 10; skip: 0;  ftime: 100;  usetick: 0);
        ActDeath:  (start: 340;    frame: 10; skip: 0;  ftime: 170;  usetick: 0);
      );
   MA21: TMonsterAction = (
        ActStand:  (start: 0;      frame: 4;  skip: 6;  ftime: 200;  usetick: 0);
        ActWalk:   (start: 0;      frame: 0;  skip: 0;  ftime: 0;    usetick: 0);
        ActAttack: (start: 10;     frame: 6;  skip: 4;  ftime: 120;  usetick: 0);
        ActCritical:(start: 0;     frame: 0;  skip: 0;  ftime: 0;    usetick: 0);
        ActStruck: (start: 20;     frame: 2;  skip: 0;  ftime: 100;  usetick: 0);
        ActDie:    (start: 30;     frame: 10; skip: 0;  ftime: 160;  usetick: 0);
        ActDeath:  (start: 0;      frame: 0;  skip: 0;  ftime: 0;    usetick: 0);
      );
   MA22: TMonsterAction = (
        ActStand:  (start: 80;     frame: 4;  skip: 6;  ftime: 200;  usetick: 0);
        ActWalk:   (start: 160;    frame: 6;  skip: 4;  ftime: 160;  usetick: 3);
        ActAttack: (start: 240;    frame: 6;  skip: 4;  ftime: 100;  usetick: 0);
        ActCritical:(start: 0;     frame: 0;  skip: 0;  ftime: 0;    usetick: 0);
        ActStruck: (start: 320;    frame: 2;  skip: 0;  ftime: 100;  usetick: 0);
        ActDie:    (start: 340;    frame: 10; skip: 0;  ftime: 160;  usetick: 0);
        ActDeath:  (start: 0;      frame: 6;  skip: 4;  ftime: 170;  usetick: 0);
      );
   MA222: TMonsterAction = (    //무명사령 암흑사령 혼마사령
        ActStand:   (Start:0;   frame:4;  skip:6;  ftime:200;  usetick:0);
        ActWalk:    (Start:80;  frame:6;  skip:4;  ftime:150;  usetick:3);
        ActAttack:  (Start:160; frame:6;  skip:4;  ftime:120;  usetick:0);
        ActCritical:(Start:0;   frame:0;  skip:0;  ftime:0;  usetick:0);
        ActStruck:  (Start:240; frame:2;  skip:0;  ftime:100;  usetick:0);
        ActDie:     (Start:260; frame:8;  skip:2;  ftime:150;  usetick:0);
        ActDeath:   (Start:260; frame:8;  skip:2;  ftime:200;  usetick:3);
      );
   MA23: TMonsterAction = (
        ActStand:  (start: 20;     frame: 4;  skip: 6;  ftime: 200;  usetick: 0);
        ActWalk:   (start: 100;    frame: 6;  skip: 4;  ftime: 160;  usetick: 3);
        ActAttack: (start: 180;    frame: 6;  skip: 4;  ftime: 100;  usetick: 0);
        ActCritical:(start: 0;     frame: 0;  skip: 0;  ftime: 0;    usetick: 0);
        ActStruck: (start: 260;    frame: 2;  skip: 0;  ftime: 100;  usetick: 0);
        ActDie:    (start: 280;    frame: 10; skip: 0;  ftime: 160;  usetick: 0);
        ActDeath:  (start: 0;      frame: 20; skip: 0;  ftime: 100;  usetick: 0);
      );
   MA24: TMonsterAction = (      //전갈, 공격 2가지
        ActStand:  (start: 0;      frame: 4;  skip: 6;  ftime: 200;  usetick: 0);
        ActWalk:   (start: 80;     frame: 6;  skip: 4;  ftime: 160;  usetick: 3);
        ActAttack: (start: 160;    frame: 6;  skip: 4;  ftime: 100;  usetick: 0);
        ActCritical:(start:240;    frame: 6;  skip: 4;  ftime: 100;  usetick: 0);
        ActStruck: (start: 320;    frame: 2;  skip: 0;  ftime: 100;  usetick: 0);
        ActDie:    (start: 340;    frame: 10; skip: 0;  ftime: 140;  usetick: 0);
        ActDeath:  (start: 420;    frame: 1;  skip: 0;  ftime: 140;  usetick: 0);
      );
   MA25: TMonsterAction = (//4C080C
        ActStand:  (Start:0;       frame:4;   skip:6;  ftime:200;  usetick:0);
        ActWalk:   (Start:70;      frame:10;  skip:0;  ftime:200;  usetick:3);
        ActAttack: (Start:20;      frame:6;   skip:4;  ftime:120;  usetick:0);
        ActCritical:(Start:10;     frame:6;   skip:4;  ftime:120;  usetick:0);
        ActStruck: (Start:50;      frame:2;   skip:0;  ftime:100;  usetick:0);
        ActDie:    (Start:60;      frame:10;  skip:0;  ftime:200;  usetick:0);
        ActDeath:  (Start:80;      frame:10;  skip:0;  ftime:200;  usetick:3);
       );

   MA26: TMonsterAction = (  //성문
        ActStand:  (start: 0;      frame: 1;  skip: 7;  ftime: 200;  usetick: 0);
        ActWalk:   (start: 0;      frame: 0;  skip: 0;  ftime: 160;  usetick: 0);   //등장...
        ActAttack: (start: 56;     frame: 6;  skip: 2;  ftime: 500;  usetick: 0);   //열기
        ActCritical:(start: 64;    frame: 6;  skip: 2;  ftime: 500;  usetick: 0);  //닫기
        ActStruck: (start: 0;      frame: 4;  skip: 4;  ftime: 100;  usetick: 0);
        ActDie:    (start: 24;     frame: 10; skip: 0;  ftime: 120;  usetick: 0);
        ActDeath:  (start: 0;      frame: 0;  skip: 0;  ftime: 150;  usetick: 0);    //숨음..
      );
   MA266: TMonsterAction = (  //남만외성문
        ActStand:  (start: 0;      frame: 2;  skip: 8;  ftime: 200;  usetick: 0);
        ActWalk:   (start: 0;      frame: 0;  skip: 0;  ftime: 160;  usetick: 0);   //등장...
        ActAttack: (start: 40;     frame: 10;  skip: 0;  ftime: 500;  usetick: 0);  //열기
        ActCritical:(start: 50;    frame: 10;  skip: 0;  ftime: 500;  usetick: 0);  //닫기
        ActStruck: (start: 0;      frame: 2;  skip: 8;  ftime: 100;  usetick: 0);
        ActDie:    (start: 20;     frame: 7;  skip: 3;  ftime: 300;  usetick: 0);
        ActDeath:  (start: 0;      frame: 0;  skip: 0;  ftime: 300;  usetick: 0);    //숨음..
      );
   MA277: TMonsterAction = (   //점령깃발
        ActStand:  (start: 0;     frame: 8;  skip: 2;  ftime: 200;  usetick: 0);
        ActWalk:   (start: 0;     frame: 0;  skip: 0;  ftime: 160;  usetick: 0);      //등장...
        ActAttack: (start: 0;     frame: 0;  skip: 0;  ftime: 250;  usetick: 0);
        ActCritical:(start: 0;    frame: 0;  skip: 0;  ftime: 250;  usetick: 0);
        ActStruck: (start: 10;     frame: 3;  skip: 7;  ftime: 100;  usetick: 0);
        ActDie:    (start: 20;     frame: 8; skip: 2;  ftime: 120;  usetick: 0);
        ActDeath:  (start: 0;     frame: 0;  skip: 0;  ftime: 150;  usetick: 0);     //숨음.
      );
   MA27: TMonsterAction = (   //성벽
        ActStand:  (start: 0;     frame: 1;  skip: 7;  ftime: 200;  usetick: 0);
        ActWalk:   (start: 0;     frame: 0;  skip: 0;  ftime: 160;  usetick: 0);      //등장...
        ActAttack: (start: 0;     frame: 0;  skip: 0;  ftime: 250;  usetick: 0);
        ActCritical:(start: 0;    frame: 0;  skip: 0;  ftime: 250;  usetick: 0);
        ActStruck: (start: 0;     frame: 0;  skip: 0;  ftime: 100;  usetick: 0);
        ActDie:    (start: 0;     frame: 10; skip: 0;  ftime: 120;  usetick: 0);
        ActDeath:  (start: 0;     frame: 0;  skip: 0;  ftime: 150;  usetick: 0);     //숨음.
      );
   MA278: TMonsterAction = (   //남만 성벽사북성벽
        ActStand:  (start: 0;     frame: 2;  skip: 28; ftime: 200;  usetick: 0);
        ActWalk:   (start: 0;     frame: 0;  skip: 0;  ftime: 160;  usetick: 0);      //등장...
        ActAttack: (start: 20;    frame: 10; skip: 20; ftime: 250;  usetick: 0);
        ActCritical:(start: 0;    frame: 0;  skip: 0;  ftime: 250;  usetick: 0);
        ActStruck: (start: 10;    frame: 2;  skip: 28; ftime: 100;  usetick: 0);
        ActDie:    (start: 80;    frame: 10; skip: 0;  ftime: 250;  usetick: 0);
        ActDeath:  (start: 90;    frame: 2;  skip: 8;  ftime: 150;  usetick: 0);     //숨음.
      );
   MA28: TMonsterAction = (   //신수
        ActStand:  (start: 80;     frame: 4;  skip: 6;  ftime: 200;  usetick: 0);
        ActWalk:   (start: 160;    frame: 6;  skip: 4;  ftime: 160;  usetick: 3);
        ActAttack: (start:  0;     frame: 6;  skip: 4;  ftime: 100;  usetick: 0);
        ActCritical:(start: 0;     frame: 0;  skip: 0;  ftime: 0;    usetick: 0);
        ActStruck: (start: 240;    frame: 2;  skip: 0;  ftime: 100;  usetick: 0);
        ActDie:    (start: 260;    frame: 10; skip: 0;  ftime: 120;  usetick: 0);
        ActDeath:  (start:  0;     frame: 10; skip: 0;  ftime: 100;  usetick: 0);
      );
   MA29: TMonsterAction = (   //신수
        ActStand:  (start: 80;     frame: 4;  skip: 6;  ftime: 200;  usetick: 0);
        ActWalk:   (start: 160;    frame: 6;  skip: 4;  ftime: 160;  usetick: 3);
        ActAttack: (start: 240;    frame: 6;  skip: 4;  ftime: 100;  usetick: 0);
        ActCritical:(start: 0;     frame: 10; skip: 0;  ftime: 100;  usetick: 0);
        ActStruck: (start: 320;    frame: 2;  skip: 0;  ftime: 100;  usetick: 0);
        ActDie:    (start: 340;    frame: 10; skip: 0;  ftime: 120;  usetick: 0);
        ActDeath:  (start: 0;     frame: 10; skip: 0;  ftime: 100;  usetick: 0);
      );
  MA30: TMonsterAction = (//4C0974
    ActStand:    (Start:0;   frame:4;   skip:6;  ftime:200;  usetick:0);
    ActWalk:     (Start:0;   frame:10;  skip:0;  ftime:200;  usetick:3);
    ActAttack:   (Start:10;  frame:6;   skip:4;  ftime:120;  usetick:0);
    ActCritical: (Start:10;  frame:6;   skip:4;  ftime:120;  usetick:0);
    ActStruck:   (Start:20;  frame:2;   skip:0;  ftime:100;  usetick:0);
    ActDie:      (Start:30;  frame:20;  skip:0;  ftime:150;  usetick:0);
    ActDeath:    (Start:0;   frame:10;  skip:0;  ftime:200;  usetick:3);
    );
  MA31: TMonsterAction = (//4C09BC
    ActStand:(Start:0;  frame:4;  skip:6;  ftime:200;  usetick:0);
    ActWalk:(Start:0;  frame:10;  skip:0;  ftime:200;  usetick:3);
    ActAttack:(Start:10;  frame:6;  skip:4;  ftime:120;  usetick:0);
    ActCritical:(Start:0;  frame:6;  skip:4;  ftime:120;  usetick:0);
    ActStruck:(Start:0;  frame:2;  skip:8;  ftime:100;  usetick:0);
    ActDie:(Start:20;  frame:10;  skip:0;  ftime:200;  usetick:0);
    ActDeath:(Start:0;  frame:10;  skip:0;  ftime:200;  usetick:3);
    );

  MA32: TMonsterAction = (//폭주
    ActStand:(Start:0;  frame:1;  skip:9;  ftime:200;  usetick:0);
    ActWalk:(Start:0;  frame:6;  skip:4;  ftime:200;  usetick:3);
    ActAttack:(Start:0;  frame:6;  skip:4;  ftime:120;  usetick:0);
    ActCritical:(Start:0;  frame:6;  skip:4;  ftime:120;  usetick:0);
    ActStruck:(Start:0;  frame:2;  skip:8;  ftime:100;  usetick:0);
    ActDie:(Start:80;  frame:10;  skip:0;  ftime:80;  usetick:0);
    ActDeath:(Start:80;  frame:10;  skip:0;  ftime:200;  usetick:3);
    );

  MA312: TMonsterAction = (//칠흑수
    ActStand: (Start:0;  frame:4;  skip:6;  ftime:200;  usetick:0);
    ActWalk:  (Start:80;  frame:6;  skip:4;  ftime:200;  usetick:3);
    ActAttack:(Start:160;  frame:6;  skip:4;  ftime:120;  usetick:0);
    ActCritical:(Start:340;  frame:6;  skip:4;  ftime:120;  usetick:0);
    ActStruck: (Start:240;  frame:2;  skip:8;  ftime:100;  usetick:0);
    ActDie:   (Start:260;  frame:8;  skip:2;  ftime:80;  usetick:0);
    ActDeath:(Start:260;  frame:8;  skip:2;  ftime:200;  usetick:3);
    );

  MA313: TMonsterAction = (//토끼 타락토끼
    ActStand:    (Start:0;    frame:4;  skip:6;  ftime:200;  usetick:0);
    ActWalk:     (Start:80;   frame:5;  skip:5;  ftime:150;  usetick:0);
    ActAttack:   (Start:160;  frame:7;  skip:3;  ftime:110;  usetick:0);
    ActCritical: (Start:0;  frame:0;  skip:0;  ftime:0;  usetick:0);
    ActStruck:   (Start:240;  frame:2;  skip:8;  ftime:100;  usetick:0);
    ActDie:      (Start:320;  frame:6;  skip:4;  ftime:100;  usetick:0);
    ActDeath:    (Start:320;  frame:6;  skip:4;  ftime:100;  usetick:0);
    );

  MA33: TMonsterAction = (//4C0A4C
    ActStand:   (Start:0;    frame:4;   skip:6;  ftime:200;  usetick:0);
    ActWalk:    (Start:80;   frame:6;   skip:4;  ftime:200;  usetick:3);
    ActAttack:  (Start:160;  frame:6;   skip:4;  ftime:120;  usetick:0);
    ActCritical:(Start:340;  frame:6;   skip:4;  ftime:120;  usetick:0);
    ActStruck:  (Start:240;  frame:2;   skip:0;  ftime:100;  usetick:0);
    ActDie:     (Start:260;  frame:10;   skip:0;  ftime:200;  usetick:0);
    ActDeath:   (Start:260;  frame:10;   skip:0;  ftime:200;  usetick:0);
    );

  MA333: TMonsterAction = (//4C0A4C
    ActStand:(Start:0;  frame:4;  skip:6;  ftime:200;  usetick:0);
    ActWalk:(Start:80;  frame:6;  skip:4;  ftime:200;  usetick:3);
    ActAttack:(Start:160;  frame:4;  skip:6;  ftime:120;  usetick:0);
    ActCritical:(Start:340;  frame:6;  skip:4;  ftime:120;  usetick:0);
    ActStruck:(Start:240;  frame:2;  skip:0;  ftime:100;  usetick:0);
    ActDie:(Start:260;  frame:10;  skip:0;  ftime:200;  usetick:0);
    ActDeath:(Start:260;  frame:10;  skip:0;  ftime:200;  usetick:0);
    );

  MA34: TMonsterAction = (//4C0A94
    ActStand:(Start:0;  frame:4;  skip:6;  ftime:200;  usetick:0);
    ActWalk:(Start:80;  frame:6;  skip:4;  ftime:200;  usetick:3);
    ActAttack:(Start:160;  frame:6;  skip:4;  ftime:120;  usetick:0);
    ActCritical:(Start:320;  frame:6;  skip:4;  ftime:120;  usetick:0);
    ActStruck:(Start:400;  frame:2;  skip:0;  ftime:100;  usetick:0);
    ActDie:(Start:420;  frame:20;  skip:0;  ftime:200;  usetick:0);
    ActDeath:(Start:420;  frame:20;  skip:0;  ftime:200;  usetick:0);
    );

  MA35: TMonsterAction = ( //주마검사
    ActStand:   (start: 0;   frame: 4;  skip: 6;  ftime: 100;  usetick: 0);
    ActWalk:    (start: 80;  frame: 6;  skip: 4;  ftime: 120;  usetick: 3);
    ActAttack:  (start: 160; frame: 8;  skip: 2;  ftime: 90;  usetick: 0);
    ActCritical:(start: 240; frame: 9;  skip: 1;  ftime: 100;  usetick: 0);
    ActStruck:  (start: 400; frame: 3;  skip: 7;  ftime: 100;  usetick: 0);
    ActDie:     (start: 480; frame: 9;  skip: 1;  ftime: 100;  usetick: 0);
    ActDeath:   (start: 480; frame: 9;  skip: 1;  ftime: 100;  usetick: 0);
    ActCritical2:(start: 320; frame: 8;  skip: 2;  ftime: 100;  usetick: 0);
    );

  MA355: TMonsterAction = (//어인의알
    ActStand:   (Start:0;  frame:1;  skip:9;  ftime:200;  usetick:0);
    ActWalk:    (Start:0;  frame:0;  skip:0;  ftime:0;  usetick:0);
    ActAttack:  (Start:0;  frame:0;  skip:0;  ftime:0;  usetick:0);
    ActCritical:(Start:0;  frame:0;  skip:0;  ftime:0;  usetick:0);
    ActStruck:  (Start:0;  frame:0;  skip:0;  ftime:0;  usetick:0);
    ActDie:     (Start:0;  frame:10;  skip:0;  ftime:160;  usetick:0);
    ActDeath:   (Start:0;  frame:10;  skip:0;  ftime:200;  usetick:0);
    );

  MA36: TMonsterAction = ( //여귀석
    ActStand:   (start: 0;   frame: 10;  skip: 0;  ftime: 100;  usetick: 0);
    ActWalk:    (start: 80;  frame: 8;  skip: 2;  ftime: 90;  usetick: 3);
    ActAttack:  (start: 80;  frame: 8;  skip: 2;  ftime: 90;  usetick: 0);
    ActCritical:(start: 0; frame: 0;  skip: 0;  ftime: 0;  usetick: 0);
    ActStruck:  (start: 80;  frame: 8;  skip: 2;  ftime: 60;  usetick: 0);
    ActDie:     (start: 160; frame: 7;  skip: 0;  ftime: 100;  usetick: 0);
    ActDeath:   (start: 160; frame: 7;  skip: 0;  ftime: 100;  usetick: 0);
    );

  MA37: TMonsterAction = ( //마석거인
    ActStand:   (start: 0;   frame: 4;  skip: 6;  ftime: 100;  usetick: 0);
    ActWalk:    (start: 80;  frame: 10;  skip: 0;  ftime: 90;  usetick: 3);
    ActAttack:  (start: 160;  frame: 8;  skip: 2;  ftime: 90;  usetick: 0);
    ActCritical:(start: 240; frame: 10;  skip: 0;  ftime: 90;  usetick: 0);
    ActStruck:  (start: 320;  frame: 2;  skip: 8;  ftime: 100;  usetick: 0);
    ActDie:     (start: 400; frame: 9;  skip: 1;  ftime: 100;  usetick: 0);
    ActDeath:   (start: 400; frame: 9;  skip: 1;  ftime: 100;  usetick: 0);
    ActCritical2:(start: 240; frame: 10;  skip: 0;  ftime: 90;  usetick: 0);
    );

  MA38: TMonsterAction = (//4C0BB4
    ActStand:(Start:0;  frame:4;  skip:6;  ftime:200;  usetick:0);
    ActWalk:(Start:0;  frame:0;  skip:0;  ftime:0;  usetick:0);
    ActAttack:(Start:80;  frame:6;  skip:4;  ftime:150;  usetick:0);
    ActCritical:(Start:0;  frame:0;  skip:0;  ftime:0;  usetick:0);
    ActStruck:(Start:0;  frame:0;  skip:0;  ftime:0;  usetick:0);
    ActDie:(Start:0;  frame:0;  skip:0;  ftime:0;  usetick:0);
    ActDeath:(Start:0;  frame:0;  skip:0;  ftime:0;  usetick:0);
    );

  MA39: TMonsterAction = (//4C0BFC
    ActStand:(Start:0;  frame:4;  skip:6;  ftime:300;  usetick:0);
    ActWalk:(Start:0;  frame:0;  skip:0;  ftime:0;  usetick:0);
    ActAttack:(Start:10;  frame:6;  skip:4;  ftime:150;  usetick:0);
    ActCritical:(Start:0;  frame:0;  skip:0;  ftime:0;  usetick:0);
    ActStruck:(Start:20;  frame:2;  skip:0;  ftime:150;  usetick:0);
    ActDie:(Start:30;  frame:10;  skip:0;  ftime:80;  usetick:0);
    ActDeath:(Start:0;  frame:0;  skip:0;  ftime:0;  usetick:0);
    );


  MA339: TMonsterAction = (//4C0BFC
    ActStand:(Start:0;  frame:2;  skip:8;  ftime:300;  usetick:0);
    ActWalk:(Start:0;  frame:0;  skip:0;  ftime:0;  usetick:0);
    ActAttack:(Start:0;  frame:2;  skip:8;  ftime:300;  usetick:0);
    ActCritical:(Start:0;  frame:0;  skip:0;  ftime:0;  usetick:0);
    ActStruck:(Start:10;  frame:2;  skip:8;  ftime:150;  usetick:0);
    ActDie:(Start:20;  frame:7;  skip:0;  ftime:130;  usetick:0);
    ActDeath:(Start:0;  frame:0;  skip:0;  ftime:0;  usetick:0);
    );

  MA3339: TMonsterAction = (//귀연석
    ActStand:(Start:0;  frame:2;  skip:8;  ftime:300;  usetick:0);
    ActWalk:(Start:0;  frame:0;  skip:0;  ftime:0;  usetick:0);
    ActAttack:(Start:0;  frame:2;  skip:8;  ftime:300;  usetick:0);
    ActCritical:(Start:0;  frame:0;  skip:0;  ftime:0;  usetick:0);
    ActStruck:(Start:10;  frame:2;  skip:8;  ftime:150;  usetick:0);
    ActDie:(Start:20;  frame:8;  skip:0;  ftime:130;  usetick:0);
    ActDeath:(Start:0;  frame:0;  skip:0;  ftime:0;  usetick:0);
    );

  MA40: TMonsterAction = (//4C0C44
    ActStand:(Start:0;  frame:4;  skip:6;  ftime:250;  usetick:0);
    ActWalk:(Start:80;  frame:6;  skip:4;  ftime:210;  usetick:3);
    ActAttack:(Start:160;  frame:6;  skip:4;  ftime:110;  usetick:0);
    ActCritical:(Start:580;  frame:20;  skip:0;  ftime:135;  usetick:0);
    ActStruck:(Start:240;  frame:2;  skip:0;  ftime:120;  usetick:0);
    ActDie:(Start:260;  frame:20;  skip:0;  ftime:130;  usetick:0);
    ActDeath:(Start:260;  frame:20;  skip:0;  ftime:130;  usetick:0);
    );

  MA41: TMonsterAction = (    //칼날바람
        ActStand:   (start: 0;      frame: 7;  skip: 3;  ftime: 200;  usetick: 0);
        ActWalk:    (start: 80;     frame: 7;   skip: 3;  ftime: 100;  usetick: 0);
        ActAttack:  (start: 160;    frame: 8;  skip: 2;  ftime: 90;  usetick: 0);
        ActCritical:(start: 160;    frame: 8;  skip: 2;  ftime: 90;  usetick: 0);
        ActStruck:  (start: 240;    frame: 3;   skip: 7;  ftime: 100;  usetick: 0);
        ActDie:     (start: 320;    frame: 10;  skip: 0;  ftime: 160;  usetick: 0);
        ActDeath:   (start: 320;    frame: 10;  skip: 0;  ftime: 100;  usetick: 0);
    );
  MA42: TMonsterAction = (//4C0CD4
    ActStand:(Start:0;  frame:4;  skip:6;  ftime:200;  usetick:0);
    ActWalk:(Start:10;  frame:8;  skip:2;  ftime:160;  usetick:0);
    ActAttack:(Start:0;  frame:0;  skip:0;  ftime:0;  usetick:0);
    ActCritical:(Start:0;  frame:0;  skip:0;  ftime:0;  usetick:0);
    ActStruck:(Start:0;  frame:0;  skip:0;  ftime:0;  usetick:0);
    ActDie:(Start:30;  frame:10;  skip:0;  ftime:120;  usetick:0);
    ActDeath:(Start:30;  frame:10;  skip:0;  ftime:150;  usetick:0);
    );

  MA43: TMonsterAction = (  // 월령(천녀)
    ActStand:    (Start:0;    frame:4;   skip:6;  ftime:200;  usetick:0);
    ActWalk:     (Start:80;   frame:6;   skip:4;  ftime:160;  usetick:0);
    ActAttack:   (Start:160;  frame:6;   skip:4;  ftime:160;  usetick:0);
    ActCritical: (Start:160;  frame:6;   skip:4;  ftime:160;  usetick:0);  // SM_LIGHTING(마법사용=>강격) 때 쓰임
    ActStruck:   (Start:240;  frame:2;   skip:0;  ftime:150;  usetick:0);
    ActDie:      (Start:260;  frame:10;  skip:0;  ftime:120;  usetick:0);
    ActDeath:    (Start:340;  frame:10;  skip:0;  ftime:100;  usetick:0);
    );

  MA44: TMonsterAction = (//4C0D64       //파천마룡
    ActStand:(Start:0;  frame:10;  skip:0;  ftime:300;  usetick:0);
    ActWalk:(Start:10;  frame:6;  skip:4;  ftime:150;  usetick:0);
    ActAttack:(Start:20;  frame:6;  skip:4;  ftime:150;  usetick:0);
    ActCritical:(Start:40;  frame:10;  skip:0;  ftime:150;  usetick:0);
    ActStruck:(Start:40;  frame:2;  skip:8;  ftime:150;  usetick:0);
    ActDie:(Start:340;  frame:6;  skip:4;  ftime:150;  usetick:0);
    ActDeath:(Start:0;  frame:0;  skip:0;  ftime:0;  usetick:0);
    );

  MA45: TMonsterAction = (//눈사람
    ActStand:   (Start:0;    frame:2;  skip:8;  ftime:200; usetick:0);
    ActWalk:    (Start:0;    frame:0;  skip:0;  ftime:0;   usetick:0);
    ActAttack:  (Start:0;    frame:0;  skip:0;  ftime:0;   usetick:0);
    ActCritical:(Start:0;    frame:0;  skip:0;  ftime:0;   usetick:0);
    ActStruck:  (Start:80;   frame:2;  skip:0;  ftime:85;  usetick:0);
    ActDie:     (Start:100;  frame:8;  skip:2;  ftime:160; usetick:0);
    ActDeath:   (Start:100;  frame:8;  skip:2;  ftime:200; usetick:0);
    );

  MA46: TMonsterAction = ( //바위폭탄
    ActStand:   (start: 0;   frame: 4;  skip: 6;  ftime: 100;  usetick: 0);
    ActWalk:    (start: 80;  frame: 3;  skip: 7;  ftime: 90;  usetick: 3);
    ActAttack:  (start: 80;  frame: 3;  skip: 7;  ftime: 90;  usetick: 0);
    ActCritical:(start: 0; frame: 0;  skip: 0;  ftime: 0;  usetick: 0);
    ActStruck:  (start: 80;  frame: 3;  skip: 7;  ftime: 60;  usetick: 0);
    ActDie:     (start: 170; frame: 8;  skip: 0;  ftime: 100;  usetick: 0);
    ActDeath:   (start: 170; frame: 8;  skip: 0;  ftime: 100;  usetick: 0);
    );

  MA47: TMonsterAction = (  // 용조신상 (용석상)
    ActStand:  (start: 0;     frame: 10; skip: 0;  ftime: 300;  usetick: 0);
    ActWalk:   (start: 0;     frame: 10; skip: 0;  ftime: 300;  usetick: 0);
    ActAttack: (start: 10;    frame: 10; skip: 0;  ftime: 300;  usetick: 0);
    ActCritical:(start: 10;   frame: 10; skip: 0;  ftime: 100;  usetick: 0);
    ActStruck: (start: 0;     frame: 1;  skip: 9;  ftime: 300;  usetick: 0);
    ActDie:    (start: 0;     frame: 1;  skip: 9;  ftime: 300;  usetick: 0);
    ActDeath:  (start: 0;     frame: 1;  skip: 9;  ftime: 300;  usetick: 0);
      );

  MA49: TMonsterAction = (
    ActStand:  (start: 0;      frame: 4;  skip: 6;  ftime: 200;  usetick: 0);
    ActWalk:   (start: 80;     frame: 6;  skip: 4;  ftime: 160;  usetick: 3);
    ActAttack: (start: 160;    frame: 6;  skip: 4;  ftime: 160;  usetick: 0);
    ActCritical:(start: 340;   frame: 6;  skip: 4;  ftime: 160;  usetick: 0);
    ActStruck: (start: 240;    frame: 2;  skip: 0;  ftime: 100;  usetick: 0);
    ActDie:    (start: 260;    frame: 10;  skip: 0;  ftime: 160;  usetick: 0);
    ActDeath:  (start: 420;   frame: 4;  skip: 6;  ftime: 200;  usetick: 0);
    );
  MA499: TMonsterAction = (    //인면귀
    ActStand:  (start: 0;      frame: 4;  skip: 6;  ftime: 200;  usetick: 0);
    ActWalk:   (start: 80;     frame: 6;  skip: 4;  ftime: 160;  usetick: 3);
    ActAttack: (start: 160;    frame: 6;  skip: 4;  ftime: 160;  usetick: 0);
    ActCritical:(start: 340;   frame: 6;  skip: 4;  ftime: 250;  usetick: 0);
    ActStruck: (start: 240;    frame: 2;  skip: 0;  ftime: 100;  usetick: 0);
    ActDie:    (start: 260;    frame: 10;  skip: 0;  ftime: 160;  usetick: 0);
    ActDeath:  (start: 420;   frame: 4;  skip: 6;  ftime: 200;  usetick: 0);
    );
  MA4999: TMonsterAction = (    //식신귀
    ActStand:  (start: 0;      frame: 4;  skip: 6;  ftime: 200;  usetick: 0);
    ActWalk:   (start: 80;     frame: 6;  skip: 4;  ftime: 160;  usetick: 3);
    ActAttack: (start: 160;    frame: 6;  skip: 4;  ftime: 180;  usetick: 0);
    ActCritical:(start: 340;   frame: 6;  skip: 4;  ftime: 200;  usetick: 0);
    ActStruck: (start: 240;    frame: 2;  skip: 0;  ftime: 100;  usetick: 0);
    ActDie:    (start: 260;    frame: 10;  skip: 0;  ftime: 160;  usetick: 0);
    ActDeath:  (start: 420;   frame: 4;  skip: 6;  ftime: 200;  usetick: 0);
    );
  MA50: TMonsterAction = (
    ActStand:  (start: 0;      frame: 4;  skip: 6;  ftime: 250;  usetick: 0);
    ActWalk:   (start: 80;     frame: 6;  skip: 4;  ftime: 100;  usetick: 0);
    ActAttack: (start: 160;    frame: 6;  skip: 4;  ftime: 110;  usetick: 0);
    ActCritical:(start: 340;   frame: 6;  skip: 4;  ftime: 150;  usetick: 0);
    ActStruck: (start: 240;    frame: 2;  skip: 0;  ftime: 120;  usetick: 0);
    ActDie:    (start: 260;    frame: 10;  skip: 0;  ftime: 90;  usetick: 0);
    ActDeath:  (start: 420;   frame: 4;  skip: 6;  ftime: 140;  usetick: 0);
  );
  MA51: TMonsterAction = (    //비월흑호  비월적호 비월소호
    ActStand:   (start: 0;   frame: 4;  skip: 6;  ftime: 200;  usetick: 0);
    ActWalk:    (start: 80;  frame: 6;  skip: 4;  ftime: 200;  usetick: 3);
    ActAttack:  (start: 160; frame: 6;  skip: 4;  ftime: 120;  usetick: 0);
    ActCritical:(start: 160; frame: 6;  skip: 4;  ftime: 120;  usetick: 0);
    ActStruck:  (start: 240; frame: 2;  skip: 0;  ftime: 100;  usetick: 0);
    ActDie:     (start: 260; frame: 10; skip: 0;  ftime: 200;  usetick: 0);
    ActDeath:   (start: 340; frame: 10; skip: 0;  ftime: 200;  usetick: 0);
    );

  MA52: TMonsterAction = ( //격괴장
    ActStand:   (start: 0;    frame: 4;  skip: 6;  ftime: 100;  usetick: 0);
    ActWalk:    (start: 80;   frame: 8;  skip: 2;  ftime: 90;  usetick: 3);
    ActAttack:  (start: 160;  frame: 8;  skip: 2;  ftime: 90;  usetick: 0);  //일반
    ActCritical:(start: 240;  frame: 9;  skip: 1;  ftime: 90;  usetick: 0);  //두칸공격
    ActStruck:  (start: 560;  frame: 3;  skip: 7;  ftime: 100;  usetick: 0);
    ActDie:     (start: 640;  frame: 10;  skip: 0;  ftime: 100;  usetick: 0);
    ActDeath:   (start: 640;  frame: 10;  skip: 0;  ftime: 100;  usetick: 0);
    ActCritical2:(start: 320; frame: 9;  skip: 1;  ftime: 90;  usetick: 0);  //전체공격
    ActCritical3:(start: 400; frame: 8;  skip: 2;  ftime: 90;  usetick: 0);  //모래폭풍
    ActCritical4:(start: 480;  frame: 8;  skip: 2;  ftime: 90;   usetick: 0);  //일섬
    );


  MA54: TMonsterAction = (
    ActStand: (Start: 0; frame: 10; skip: 0; ftime: 160; usetick: 0);
    ActWalk: (Start: 10; frame: 10; skip: 0; ftime: 160; usetick: 0);
    ActAttack: (Start: 20; frame: 10; skip: 0; ftime: 100; usetick: 0);
    ActCritical: (Start: 20; frame: 10; skip: 0; ftime: 100; usetick: 0);
    ActStruck: (Start: 30; frame: 4; skip: 0; ftime: 100; usetick: 0);
    ActDie: (Start: 40; frame: 10; skip: 0; ftime: 140; usetick: 0);
    ActDeath: (Start: 40; frame: 10; skip: 0; ftime: 100; usetick: 0);
    );

  MA57: TMonsterAction = (     //양마지석  , 음마지석
    ActStand: (Start: 0; frame: 4; skip: 6; ftime: 200; usetick: 0);
    ActWalk: (Start: 0; frame: 4; skip: 6; ftime: 200; usetick: 0);
    ActAttack: (Start: 0; frame: 4; skip: 6; ftime: 200; usetick: 0);
    ActCritical: (Start: 0; frame: 4; skip: 6; ftime: 200; usetick: 0);
    ActStruck: (Start: 0; frame: 4; skip: 6; ftime: 200; usetick: 0);
    ActDie: (Start: 0; frame: 4; skip: 6; ftime: 200; usetick: 0);
    ActDeath: (Start: 0; frame: 4; skip: 6; ftime: 200; usetick: 0);
    );

  MA58: TMonsterAction = ( //숲거북이
        ActStand:  (start: 160;     frame: 4;  skip: 6;  ftime: 200;  usetick: 0);
        ActWalk:   (start: 240;    frame: 6;  skip: 4;  ftime: 160;  usetick: 3);
        ActAttack: (start: 320;    frame: 8;  skip: 2;  ftime: 100;  usetick: 0);
        ActCritical:(start: 400;     frame: 9;  skip: 1;  ftime: 100;    usetick: 0);
        ActStruck: (start: 480;    frame: 3;  skip: 7;  ftime: 100;  usetick: 0);
        ActDie:    (start: 560;    frame: 10; skip: 0;  ftime: 160;  usetick: 0);
        ActDeath:  (start: 0;      frame: 1;  skip: 9;  ftime: 170;  usetick: 0);
      );
  MA59: TMonsterAction = ( //삼나무정백
        ActStand:  (start: 160;     frame: 4;  skip: 6;  ftime: 200;  usetick: 0);
        ActWalk:   (start: 240;    frame: 6;  skip: 4;  ftime: 160;  usetick: 3);
        ActAttack: (start: 320;    frame: 8;  skip: 2;  ftime: 100;  usetick: 0);
        ActCritical:(start: 400;     frame: 10;  skip: 0;  ftime: 160;    usetick: 0);
        ActStruck: (start: 560;    frame: 3;  skip: 7;  ftime: 100;  usetick: 0);
        ActDie:    (start: 640;    frame: 10; skip: 0;  ftime: 160;  usetick: 0);
        ActDeath:  (start: 0;      frame: 1;  skip: 9;  ftime: 170;  usetick: 0);
        ActCritical2:(start: 480;     frame: 10;  skip: 0;  ftime: 160;    usetick: 0);
      );

  MA60: TMonsterAction = (//지옥문지기
    ActStand:(Start:0;  frame:4;  skip:6;  ftime:200;  usetick:0);
    ActWalk:(Start:0;  frame:10;  skip:0;  ftime:200;  usetick:3);
    ActAttack:(Start:10;  frame:6;  skip:4;  ftime:120;  usetick:0);
    ActCritical:(Start:40;  frame:10;  skip:0;  ftime:120;  usetick:0);
    ActStruck:(Start:20;  frame:2;  skip:0;  ftime:100;  usetick:0);
    ActDie:(Start:30;  frame:10;  skip:0;  ftime:150;  usetick:0);
    ActDeath:(Start:0;  frame:10;  skip:0;  ftime:200;  usetick:3);
    );

  MA61: TMonsterAction = ( //월지(레드)
        ActStand:   (start: 80;   frame: 4;  skip: 6;  ftime: 200;  usetick: 0);
        ActWalk:    (start: 160;  frame: 6;  skip: 4;  ftime: 200;  usetick: 3);
        ActAttack:  (start: 240; frame: 6;  skip: 4;  ftime: 120;  usetick: 0);
        ActCritical:(start: 0;   frame: 0; skip: 0;   ftime: 0;    usetick: 0);
        ActStruck:  (start: 320; frame: 2;  skip: 0;  ftime: 100;  usetick: 0);
        ActDie:     (start: 340; frame: 10; skip: 0;  ftime: 140;  usetick: 0);
        ActDeath:   (start: 0;   frame: 6;  skip: 4;  ftime: 200;  usetick: 0);
    );

  MA62: TMonsterAction = ( //설인대충,주마격뢰장,환영한호, 거미(신석독마주)
    ActStand:   (start: 0;   frame: 4;  skip: 6;  ftime: 250;  usetick: 0);
    ActWalk:    (start: 80;  frame: 6;  skip: 4;  ftime: 100;  usetick: 3);
    ActAttack:  (start: 160; frame: 6;  skip: 4;  ftime: 110;  usetick: 0);
    ActCritical:(start: 340; frame: 6;  skip: 4;  ftime: 150;  usetick: 0);
    ActStruck:  (start: 240; frame: 2;  skip: 0;  ftime: 120;  usetick: 0);
    ActDie:     (start: 260; frame: 10; skip: 0;  ftime: 90;   usetick: 0);
    ActDeath:   (start: 420; frame: 1;  skip: 0;  ftime: 140;  usetick: 0);
    );

  MA63: TMonsterAction = (//월지(블루)
        ActStand:   (start: 0;   frame: 4;  skip: 6;  ftime: 200;  usetick: 0);
        ActWalk:    (start: 80;  frame: 6;  skip: 4;  ftime: 160;  usetick: 3);
        ActAttack:  (start: 160; frame: 6;  skip: 4;  ftime: 120;  usetick: 0);
        ActCritical:(start: 160; frame: 6;  skip: 0;  ftime: 120;  usetick: 0);
        ActStruck:  (start: 240; frame: 2;  skip: 0;  ftime: 100;  usetick: 0);
        ActDie:     (start: 260; frame: 10; skip: 0;  ftime: 140;  usetick: 0);
        ActDeath:   (start: 0;   frame: 10; skip: 0;  ftime: 200;  usetick: 0);
    );
  MA64: TMonsterAction = (//참원귀
        ActStand:   (start: 0;   frame: 4;  skip: 6;  ftime: 200; usetick: 0);
        ActWalk:    (start: 80;  frame: 6;  skip: 4;  ftime: 150; usetick: 3);
        ActAttack:  (start: 160; frame: 6;  skip: 4;  ftime: 120; usetick: 0);
        ActCritical:(start: 340; frame: 10; skip: 0;  ftime: 100;  usetick: 0);
        ActStruck:  (start: 240; frame: 2;  skip: 0;  ftime: 85; usetick: 0);
        ActDie:     (start: 260; frame: 10; skip: 0;  ftime: 100;  usetick: 0);
        ActDeath:   (start: 260; frame: 10; skip: 0;  ftime: 100;  usetick: 0);
     );
   MA65: TMonsterAction = (
        ActStand:   (start: 0;    frame: 20; skip: 0;  ftime: 150;  usetick: 0);
        ActWalk:    (start: 0;    frame: 0; skip: 0;  ftime: 0;  usetick: 0);
        ActAttack:  (start: 0;    frame: 0; skip: 0;  ftime: 0;  usetick: 0);
        ActCritical:(start: 0;    frame: 0; skip: 0;  ftime: 0;  usetick: 0);
        ActStruck:  (start: 20;   frame: 10; skip: 0;  ftime: 100;  usetick: 0);
        ActDie:     (start: 400;  frame: 18; skip: 2;  ftime: 120;  usetick: 0);
        ActDeath:   (start: 400;  frame: 18; skip: 2;  ftime: 120;  usetick: 0);
      );
   MA67: TMonsterAction = (
        ActStand:   (start: 0;  frame: 4; skip: 6;  ftime: 200;  usetick: 0);
        ActWalk:    (start: 0;  frame: 0; skip: 0;  ftime: 200;  usetick: 0);
        ActAttack:  (start: 10; frame: 4; skip: 1;  ftime: 100;  usetick: 0);
        ActCritical:(start: 0;  frame: 0; skip: 0;  ftime: 150;  usetick: 0);
        ActStruck:  (start: 0;  frame: 4; skip: 6;  ftime: 100;  usetick: 0);
        ActDie:     (start: 0;  frame: 0; skip: 0;  ftime: 120;  usetick: 0);
        ActDeath:   (start: 0;  frame: 0; skip: 0;  ftime: 120;  usetick: 0);
      );
  MA68: TMonsterAction = (//표범
    ActStand:  (start: 0;      frame: 4;  skip: 6;  ftime: 200;  usetick: 0);
    ActWalk:   (start: 80;     frame: 6;  skip: 4;  ftime: 100;  usetick: 0);
    ActAttack: (start: 160;    frame: 10;  skip: 0;  ftime: 100;  usetick: 0);
    ActCritical:(start: 160;   frame: 10;  skip: 0;  ftime: 100;  usetick: 0);
    ActStruck: (start: 240;    frame: 3;  skip: 7;  ftime: 100;  usetick: 0);
    ActDie:    (start: 320;    frame: 8;  skip: 2;  ftime: 160;  usetick: 0);
    ActDeath:  (start: 320;    frame: 8;  skip: 2;  ftime: 160;  usetick: 0);
    );

  MA69: TMonsterAction = (//곰
    ActStand:  (start: 0;      frame: 4;  skip: 6;  ftime: 200;  usetick: 0);
    ActWalk:   (start: 80;     frame: 6;  skip: 4;  ftime: 100;  usetick: 0);
    ActAttack: (start: 240;    frame: 8;  skip: 2;  ftime: 100;  usetick: 0);
    ActCritical:(start: 160;   frame: 9;  skip: 1;  ftime: 160;  usetick: 0);
    ActStruck: (start: 320;    frame: 3;  skip: 7;  ftime: 100;  usetick: 0);
    ActDie:    (start: 400;    frame: 9;  skip: 1;  ftime: 160;  usetick: 0);
    ActDeath:  (start: 400;    frame: 9;  skip: 1;  ftime: 160;  usetick: 0);
    );

   MA770: TMonsterAction = (   //강조귀
    ActStand:   (start: 0;   frame: 4;  skip: 6;  ftime: 200;  usetick: 0);
    ActWalk:    (start: 80;  frame: 6;  skip: 4;  ftime: 160;  usetick: 3);
    ActAttack:  (start: 160; frame: 6;  skip: 4;  ftime: 160;  usetick: 0);
    ActCritical:(start: 340; frame: 7;  skip: 3;  ftime: 100;  usetick: 0);
    ActStruck:  (start: 240; frame: 2;  skip: 0;  ftime: 100;  usetick: 0);
    ActDie:     (start: 260; frame: 10; skip: 0;  ftime: 140;  usetick: 0);
    ActDeath:   (start: 340; frame: 10; skip: 0;  ftime: 100;  usetick: 0);
    );

   MA71: TMonsterAction = (//불괭이
        ActStand:   (start: 0;   frame: 4;  skip: 6;  ftime: 200;  usetick: 0);
        ActWalk:    (start: 80;  frame: 6;  skip: 4;  ftime: 200;  usetick: 0);
        ActAttack:  (start: 160; frame: 5;  skip: 5;  ftime: 120;  usetick: 0);
        ActCritical:(start: 240; frame: 6;  skip: 4;  ftime: 120;  usetick: 0);
        ActStruck:  (start: 320; frame: 2;  skip: 0;  ftime: 100;  usetick: 0);
        ActDie:     (start: 340; frame: 8;  skip: 2;  ftime: 150;  usetick: 0);
        ActDeath:   (start: 340; frame: 8;  skip: 8;  ftime: 150;  usetick: 0);
    );

    MA72: TMonsterAction = (//격투괭이
        ActStand:   (start: 0;   frame: 4;  skip: 6;  ftime: 200;  usetick: 0);
        ActWalk:    (start: 80;  frame: 6;  skip: 4;  ftime: 200;  usetick: 0);
        ActAttack:  (start: 160; frame: 6;  skip: 4;  ftime: 120;  usetick: 0);
        ActCritical:(start: 160; frame: 6;  skip: 4;  ftime: 120;  usetick: 0);
        ActStruck:  (start: 240; frame: 2;  skip: 0;  ftime: 100;  usetick: 0);
        ActDie:     (start: 260; frame: 8;  skip: 2;  ftime: 150;  usetick: 0);
        ActDeath:   (start: 260; frame: 8;  skip: 2;  ftime: 150;  usetick: 0);
    );
    MA73: TMonsterAction = (//창괭이
        ActStand:   (start: 0;   frame: 4;  skip: 6;  ftime: 200;  usetick: 0);
        ActWalk:    (start: 80;  frame: 6;  skip: 4;  ftime: 200;  usetick: 0);
        ActAttack:  (start: 160; frame: 6;  skip: 4;  ftime: 120;  usetick: 0);
        ActCritical:(start: 240; frame: 6;  skip: 4;  ftime: 120;  usetick: 0);
        ActStruck:  (start: 320; frame: 2;  skip: 0;  ftime: 100;  usetick: 0);
        ActDie:     (start: 340; frame: 8;  skip: 2;  ftime: 150;  usetick: 0);
        ActDeath:   (start: 340; frame: 8;  skip: 2;  ftime: 150;  usetick: 0);
    );
    MA74: TMonsterAction = (//얼룩망치괭이
        ActStand:   (start: 0;   frame: 4;  skip: 6;  ftime: 200;  usetick: 0);
        ActWalk:    (start: 80;  frame: 6;  skip: 4;  ftime: 200;  usetick: 0);
        ActAttack:  (start: 160; frame: 7;  skip: 3;  ftime: 120;  usetick: 0);
        ActCritical:(start: 160; frame: 7;  skip: 3;  ftime: 120;  usetick: 0);
        ActStruck:  (start: 240; frame: 3;  skip: 7;  ftime: 100;  usetick: 0);
        ActDie:     (start: 320; frame: 10; skip: 0;  ftime: 150;  usetick: 0);
        ActDeath:   (start: 320; frame: 10; skip: 0;  ftime: 150;  usetick: 0);
    );
    MA75: TMonsterAction = (//검은망치괭이
        ActStand:   (start: 0;   frame: 4;  skip: 6;  ftime: 200;  usetick: 0);
        ActWalk:    (start: 80;  frame: 6;  skip: 4;  ftime: 200;  usetick: 0);
        ActAttack:  (start: 160; frame: 7;  skip: 3;  ftime: 120;  usetick: 0);
        ActCritical:(start: 240; frame: 12; skip: 8;  ftime: 100;  usetick: 0);
        ActStruck:  (start: 400; frame: 3;  skip: 7;  ftime: 100;  usetick: 0);
        ActDie:     (start: 480; frame: 10; skip: 0;  ftime: 150;  usetick: 0);
        ActDeath:   (start: 480; frame: 10; skip: 0;  ftime: 150;  usetick: 0);
    );
    MA76: TMonsterAction = (//갑괭이
        ActStand:   (start: 0;   frame: 4;  skip: 6;  ftime: 200;  usetick: 0);
        ActWalk:    (start: 160; frame: 6;  skip: 4;  ftime: 200;  usetick: 0);
        ActAttack:  (start: 320; frame: 10; skip: 0;  ftime: 95;   usetick: 0);
        ActCritical:(start: 400; frame: 13; skip: 7;  ftime: 90;  usetick: 0);
        ActStruck:  (start: 560; frame: 3;  skip: 7;  ftime: 100;  usetick: 0);
        ActDie:     (start: 640; frame: 10; skip: 0;  ftime: 150;  usetick: 0);
        ActDeath:   (start: 640; frame: 10; skip: 0;  ftime: 150;  usetick: 0);
        ActCritical2:(start: 240; frame: 10; skip: 0; ftime: 95;  usetick: 0);
    );
    MA77: TMonsterAction = (//무당괭이
        ActStand:   (start: 0;   frame: 4;  skip: 6;  ftime: 200;  usetick: 0);
        ActWalk:    (start: 80;  frame: 10; skip: 0;  ftime: 150;  usetick: 0);
        ActAttack:  (start: 160; frame: 6;  skip: 4;  ftime: 120;  usetick: 0);
        ActCritical:(start: 240; frame: 7;  skip: 3;  ftime: 120;  usetick: 0);
        ActStruck:  (start: 400; frame: 2;  skip: 0;  ftime: 100;  usetick: 0);
        ActDie:     (start: 420; frame: 9;  skip: 1;  ftime: 140;  usetick: 0);
        ActDeath:   (start: 420; frame: 9;  skip: 1;  ftime: 140;  usetick: 0);
        ActCritical2:(start: 320; frame: 7; skip: 3; ftime: 120;  usetick: 0);
    );
   MA78: TMonsterAction = (//호중귀2
        ActStand:   (start: 0;   frame: 2;  skip: 8;  ftime: 200;  usetick: 0);
        ActWalk:    (start: 0;   frame: 0;  skip: 0;  ftime: 0;    usetick: 0);
        ActAttack:  (start: 10;  frame: 4;  skip: 6;  ftime: 140;  usetick: 0);
        ActCritical:(start: 0;   frame: 0;  skip: 0;  ftime: 0;    usetick: 0);
        ActStruck:  (start: 90;  frame: 2;  skip: 0;  ftime: 100;  usetick: 0);
        ActDie:     (start: 110; frame: 10; skip: 0;  ftime: 120;  usetick: 0);
        ActDeath:   (start: 110; frame: 10; skip: 0;  ftime: 120;  usetick: 0);
    );
  MA79: TMonsterAction = (//호중귀1
        ActStand:   (Start:0;    frame:10; skip:0;  ftime:150;  usetick:0);
        ActWalk:    (Start:0;    frame:0;  skip:0;  ftime:0;    usetick:0);
        ActAttack:  (Start:80;   frame:6 ; skip:4;  ftime:120;  usetick:0);
        ActCritical:(Start:160;  frame:10; skip:0;  ftime:100;  usetick:0);
        ActStruck:  (Start:240;  frame:3;  skip:7;  ftime:100;  usetick:0);
        ActDie:     (Start:320;  frame:10; skip:0;  ftime:150;  usetick:0);
        ActDeath:   (Start:320;  frame:10; skip:0;  ftime:150;  usetick:0);
    );
   MA80: TMonsterAction = (//야수왕
        ActStand:   (start: 0;   frame: 6;  skip: 4;  ftime: 180;  usetick: 0);
        ActWalk:    (start: 80;  frame: 6;  skip: 4;  ftime: 150;  usetick: 0);
        ActAttack:  (start: 480; frame: 8;  skip: 2;  ftime: 100;  usetick: 0);
        ActCritical:(start: 400; frame: 5;  skip: 5;  ftime: 100;  usetick: 0);
        ActStruck:  (start: 240; frame: 3;  skip: 7;  ftime: 100;  usetick: 0);
        ActDie:     (start: 320; frame: 9;  skip: 1;  ftime: 150;  usetick: 0);
        ActDeath:   (start: 320; frame: 9;  skip: 1;  ftime: 150;  usetick: 0);
        ActCritical2:(start: 720; frame: 5;  skip: 5;  ftime: 100;  usetick: 0);
    );
   MA81: TMonsterAction = (  //단묵
        ActStand:    (start: 0;      frame: 6;   skip: 4;  ftime: 180;  usetick: 0);
        ActWalk:     (start: 80;     frame: 8;   skip: 2;  ftime: 140;  usetick: 0);
        ActAttack:   (start: 160;    frame: 10;  skip: 0;  ftime: 95;   usetick: 0); //일반
        ActCritical: (start: 400;    frame: 10;  skip: 0;  ftime: 95;   usetick: 0); //음파
        ActStruck:   (start: 240;    frame: 4;   skip: 6;  ftime: 90;   usetick: 0);
        ActDie:      (start: 320;    frame: 10;  skip: 0;  ftime: 160;  usetick: 0);
        ActDeath:    (start: 320;    frame: 10;  skip: 6;  ftime: 160;  usetick: 0);
        ActCritical2:(start: 480;    frame: 8;   skip: 2;  ftime: 110;  usetick: 0); //원거리 1인공격
        ActCritical3:(start: 560;    frame: 8;   skip: 2;  ftime: 110;  usetick: 0); //소환공격
    );
   MA82: TMonsterAction = (  //고대수호장
        ActStand:    (start: 0;      frame: 4;   skip: 6;   ftime: 200;  usetick: 0);
        ActWalk:     (start: 80;     frame: 6;   skip: 4;   ftime: 180;  usetick: 0);
        ActAttack:   (start: 160;    frame: 6;   skip: 4;   ftime: 120;  usetick: 0);
        ActCritical: (start: 340;    frame: 6;   skip: 4;   ftime: 120;  usetick: 0);
        ActStruck:   (start: 240;    frame: 2;   skip: 0;   ftime: 100;  usetick: 0);
        ActDie:      (start: 260;    frame: 10;  skip: 0;   ftime: 140;  usetick: 0);
        ActDeath:    (start: 260;    frame: 10;  skip: 0;   ftime: 140;  usetick: 0);
        ActCritical2:(start: 420;    frame: 8;   skip: 2;   ftime: 100;  usetick: 0);
        ActCritical3:(start: 500;    frame: 7;   skip: 3;   ftime: 100;  usetick: 0);
    );
   MA83: TMonsterAction = (    //묘장군
        ActStand:    (start: 0;      frame: 4;  skip: 6;  ftime: 200;  usetick: 0);
        ActWalk:     (start: 160;    frame: 7;  skip: 3;  ftime: 160;  usetick: 0);
        ActAttack:   (start: 400;    frame: 9;  skip: 1;  ftime: 100;  usetick: 0);   //_hit  일반
        ActCritical: (start: 480;    frame: 8;  skip: 2;  ftime: 110;  usetick: 0);   //_Ligh 어검
        ActStruck:   (start: 640;    frame: 3;  skip: 7;  ftime: 100;  usetick: 0);
        ActDie:      (start: 720;    frame: 8;  skip: 2;  ftime: 160;  usetick: 0);
        ActDeath:    (start: 720;    frame: 8;  skip: 2;  ftime: 160;  usetick: 0);
        ActCritical2: (start: 320;    frame: 9;  skip: 1;  ftime: 110;  usetick: 0);   //_Ligh_2 원거리
        ActCritical3: (start: 560;    frame: 9;  skip: 1;  ftime: 110;  usetick: 0);   //_Ligh_3 둔화

    );
   MA84: TMonsterAction = (    //호중천
        ActStand:    (start: 0;      frame: 6;   skip: 4;  ftime: 180;  usetick: 0);
        ActWalk:     (start: 0;      frame: 0;   skip: 0;  ftime: 0;    usetick: 0);
        ActAttack:   (start: 80;     frame: 7;   skip: 3;  ftime: 110;  usetick: 0);    //주변공격
        ActCritical: (start: 160;    frame: 6;   skip: 4;  ftime: 120;  usetick: 0);   //1인공격
        ActStruck:   (start: 400;    frame: 4;   skip: 6;  ftime: 100;  usetick: 0);
        ActDie:      (start: 480;    frame: 10;  skip: 0;  ftime: 160;  usetick: 0);
        ActDeath:    (start: 480;    frame: 10;  skip: 0;  ftime: 160;  usetick: 0);
        ActCritical2:(start: 240;    frame: 7;   skip: 3;  ftime: 110;  usetick: 0);   //원거리 공격
        ActCritical3:(start: 320;    frame: 8;   skip: 2;  ftime: 100;  usetick: 0);   //밀어내기
    );
   MA85: TMonsterAction = (  //진묘장군
        ActStand:    (start: 0;      frame: 6;   skip: 4;  ftime: 180;  usetick: 0);
        ActWalk:     (start: 80;     frame: 10;  skip: 0;  ftime: 100;  usetick: 0);
        ActAttack:   (start: 160;    frame: 10;  skip: 0;  ftime: 100;  usetick: 0);  //일반공격
        ActCritical: (start: 240;    frame: 8;   skip: 2;  ftime: 120;  usetick: 0);  //어검공격
        ActStruck:   (start: 400;    frame: 2;   skip: 8;  ftime: 100;  usetick: 0);
        ActDie:      (start: 480;    frame: 8;   skip: 2;  ftime: 160;  usetick: 0);
        ActDeath:    (start: 480;    frame: 8;   skip: 2;  ftime: 200;  usetick: 0);
        ActCritical2:(start: 320;    frame: 8;   skip: 2;  ftime: 120;  usetick: 0);  //번개 공격
        ActCritical3:(start: 320;    frame: 8;   skip: 2;  ftime: 120;  usetick: 0);  //꼬봉 소환
    );
   MA86: TMonsterAction = (    //염마태자
        ActStand:   (start: 0;      frame: 4;   skip: 6;  ftime: 200;  usetick: 0);
        ActWalk:    (start: 0;      frame: 0;   skip: 0;  ftime: 0;    usetick: 0);
        ActAttack:  (start: 10;     frame: 6;   skip: 4;  ftime: 120;  usetick: 0);
        ActCritical:(start: 10;     frame: 6;   skip: 4;  ftime: 120;  usetick: 0);
        ActStruck:  (start: 14;     frame: 2;   skip: 4;  ftime: 100;  usetick: 0);
        ActDie:     (start: 20;     frame: 6;   skip: 4;  ftime: 160;  usetick: 0);
        ActDeath:   (start: 20;     frame: 6;   skip: 4;  ftime: 160;  usetick: 0);
    );
   MA87: TMonsterAction = (   //어린어인
        ActStand:   (start: 0;      frame: 6;   skip: 4;  ftime: 200;  usetick: 0);
        ActWalk:    (start: 80;     frame: 6;   skip: 4;  ftime: 100;  usetick: 0);
        ActAttack:  (start: 160;    frame: 9;   skip: 1;  ftime: 100;  usetick: 0);
        ActCritical:(start: 0;      frame: 0;   skip: 0;  ftime: 0;    usetick: 0);
        ActStruck:  (start: 240;    frame: 3;   skip: 7;  ftime: 80;   usetick: 0);
        ActDie:     (start: 320;    frame: 9;   skip: 1;  ftime: 160;  usetick: 0);
        ActDeath:   (start: 320;    frame: 9;   skip: 1;  ftime: 200;  usetick: 0);
    );
   MA88: TMonsterAction = (   //어창인
        ActStand:   (start: 0;      frame: 6;  skip: 4;  ftime: 200;  usetick: 0);
        ActWalk:    (start: 80;     frame: 6;  skip: 4;  ftime: 100;  usetick: 0);
        ActAttack:  (start: 160;    frame: 9;  skip: 1;  ftime: 95;  usetick: 0);
        ActCritical:(start: 240;    frame: 8;  skip: 2;  ftime: 90;  usetick: 0);
        ActStruck:  (start: 320;    frame: 3;  skip: 7;  ftime: 80;   usetick: 0);
        ActDie:     (start: 400;    frame: 8;  skip: 2;  ftime: 160;  usetick: 0);
        ActDeath:   (start: 400;    frame: 8;  skip: 2;  ftime: 200;  usetick: 0);
    );
   MA89: TMonsterAction = (   //어법인
        ActStand:   (start: 0;      frame: 7;  skip: 3;  ftime: 200;  usetick: 0);
        ActWalk:    (start: 80;     frame: 6;  skip: 4;  ftime: 100;  usetick: 0);
        ActAttack:  (start: 160;    frame: 6;  skip: 4;  ftime: 95;   usetick: 0);
        ActCritical:(start: 240;    frame: 6;  skip: 4;  ftime: 100;  usetick: 0);
        ActStruck:  (start: 320;    frame: 3;  skip: 7;  ftime: 100;  usetick: 0);
        ActDie:     (start: 400;    frame: 7;  skip: 3;  ftime: 160;  usetick: 0);
        ActDeath:   (start: 400;    frame: 7;  skip: 3;  ftime: 200;  usetick: 0);
    );
   MA90: TMonsterAction = (  //어월인
        ActStand:   (start: 0;      frame: 5;  skip: 5;  ftime: 200;  usetick: 0);
        ActWalk:    (start: 80;     frame: 6;  skip: 4;  ftime: 100;  usetick: 0);
        ActAttack:  (start: 160;    frame: 8;  skip: 2;  ftime: 90;   usetick: 0);
        ActCritical:(start: 240;    frame: 8;  skip: 2;  ftime: 90;   usetick: 0);
        ActStruck:  (start: 320;    frame: 3;  skip: 7;  ftime: 100;  usetick: 0);
        ActDie:     (start: 400;    frame: 7;  skip: 3;  ftime: 160;  usetick: 0);
        ActDeath:   (start: 400;    frame: 7;  skip: 3;  ftime: 200;  usetick: 0);
    );
   MA91: TMonsterAction = (      //토견
        ActStand:   (start: 0;      frame: 6;  skip: 4;  ftime: 200;  usetick: 0);
        ActWalk:    (start: 80;     frame: 6;  skip: 4;  ftime: 100;  usetick: 0);
        ActAttack:  (start: 160;    frame: 8;  skip: 2;  ftime: 90;   usetick: 0);
        ActCritical:(start: 240;    frame: 10; skip: 0;  ftime: 90;   usetick: 0);
        ActStruck:  (start: 400;    frame: 3;  skip: 7;  ftime: 90;   usetick: 0);
        ActDie:     (start: 480;    frame: 10; skip: 0;  ftime: 160;  usetick: 0);
        ActDeath:   (start: 480;    frame: 10; skip: 0;  ftime: 200;  usetick: 0);
    );
   MA92: TMonsterAction = (     //호토견
        ActStand:   (start: 0;      frame: 5;  skip: 5;  ftime: 200;  usetick: 0);
        ActWalk:    (start: 80;     frame: 6;  skip: 4;  ftime: 100;  usetick: 0);
        ActAttack:  (start: 160;    frame: 10; skip: 0;  ftime: 100;  usetick: 0);
        ActCritical:(start: 240;    frame: 10; skip: 0;  ftime: 100;  usetick: 0);
        ActStruck:  (start: 400;    frame: 3;  skip: 7;  ftime: 90;   usetick: 0);
        ActDie:     (start: 480;    frame: 10; skip: 0;  ftime: 160;  usetick: 0);
        ActDeath:   (start: 480;    frame: 10; skip: 0;  ftime: 100;  usetick: 0);
    );

   MA922: TMonsterAction = (     //그을린요리사
        ActStand:   (start: 0;      frame: 6;  skip: 4;  ftime: 200;  usetick: 0);
        ActWalk:    (start: 80;     frame: 6;  skip: 4;  ftime: 100;  usetick: 0);
        ActAttack:  (start: 160;    frame: 6;  skip: 4;  ftime: 100;  usetick: 0);
        ActCritical:(start: 0;      frame: 0;  skip: 0;  ftime: 0;    usetick: 0);
        ActStruck:  (start: 240;    frame: 5;  skip: 5;  ftime: 75;   usetick: 0);
        ActDie:     (start: 320;    frame: 8;  skip: 2;  ftime: 160;  usetick: 0);
        ActDeath:   (start: 320;    frame: 8;  skip: 2;  ftime: 100;  usetick: 0);
    );
   MA93: TMonsterAction = (      //어인
        ActStand:   (start: 0;      frame: 6;  skip: 4;  ftime: 200;  usetick: 0);
        ActWalk:    (start: 80;     frame: 6;  skip: 4;  ftime: 100;  usetick: 0);
        ActAttack:  (start: 160;    frame: 8;  skip: 2;  ftime: 90;   usetick: 0);
        ActCritical:(start: 160;    frame: 8;  skip: 2;  ftime: 90;  usetick: 0);
        ActStruck:  (start: 240;    frame: 3;  skip: 7;  ftime: 90;  usetick: 0);
        ActDie:     (start: 320;    frame: 8;  skip: 2;  ftime: 160;  usetick: 0);
        ActDeath:   (start: 320;    frame: 8;  skip: 2;  ftime: 200;  usetick: 0);
    );
   MA94: TMonsterAction = (      //각섬
        ActStand:   (start: 0;      frame: 9;   skip: 1;  ftime: 150;  usetick: 0);
        ActWalk:    (start: 80;     frame: 6;   skip: 4;  ftime: 100;  usetick: 0);
        ActAttack:  (start: 240;    frame: 10;  skip: 0;  ftime: 90;  usetick: 0);
        ActCritical:(start: 160;    frame: 8;   skip: 2;  ftime: 90;   usetick: 0);
        ActStruck:  (start: 400;    frame: 3;   skip: 7;  ftime: 95;   usetick: 0);
        ActDie:     (start: 480;    frame: 10;  skip: 0;  ftime: 160;  usetick: 0);
        ActDeath:   (start: 480;    frame: 10;  skip: 0;  ftime: 200;  usetick: 0);
    );
   MA95: TMonsterAction = (    //인용
        ActStand:   (start: 0;      frame: 9;  skip: 1;  ftime: 150;  usetick: 0);
        ActWalk:    (start: 80;     frame: 6;  skip: 4;  ftime: 100;  usetick: 0);
        ActAttack:  (start: 160;    frame: 8;  skip: 2;  ftime: 100;  usetick: 0);
        ActCritical:(start: 240;    frame: 8;  skip: 2;  ftime: 100;  usetick: 0);
        ActStruck:  (start: 400;    frame: 3;  skip: 7;  ftime: 95;   usetick: 0);
        ActDie:     (start: 480;    frame: 9;  skip: 1;  ftime: 160;  usetick: 0);
        ActDeath:   (start: 480;    frame: 9;  skip: 1;  ftime: 200;  usetick: 0);
    );
   MA96: TMonsterAction = (  //수어귀
        ActStand:    (start: 0;      frame: 8;   skip: 2;  ftime: 180;  usetick: 0);
        ActWalk:     (start: 80;     frame: 6;   skip: 4;  ftime: 140;  usetick: 0);
        ActAttack:   (start: 160;    frame: 7;   skip: 3;  ftime: 95;   usetick: 0); //일인 공격
        ActCritical: (start: 240;    frame: 7;   skip: 3;  ftime: 95;   usetick: 0); //전체공격  주변
        ActStruck:   (start: 560;    frame: 4;   skip: 6;  ftime: 85;   usetick: 0);
        ActDie:      (start: 640;    frame: 8;   skip: 2;  ftime: 160;  usetick: 0);
        ActDeath:    (start: 640;    frame: 8;   skip: 2;  ftime: 200;  usetick: 0);
        ActCritical2:(start: 320;    frame: 7;   skip: 3;  ftime: 110;  usetick: 0); //원거리 1인공격
        ActCritical3:(start: 400;    frame: 8;   skip: 2;  ftime: 110;  usetick: 0); //원거리 전체공격 2 돌덩이
    );
   MA97: TMonsterAction = (     //땅두꺼비
        ActStand:   (start: 0;      frame: 8;  skip: 2;  ftime: 150;  usetick: 0);
        ActWalk:    (start: 80;     frame: 6;  skip: 4;  ftime: 100;  usetick: 0);
        ActAttack:  (start: 160;    frame: 10; skip: 0;  ftime: 90;   usetick: 0);
        ActCritical:(start: 240;    frame: 8;  skip: 2;  ftime: 100;  usetick: 0);
        ActStruck:  (start: 400;    frame: 3;  skip: 7;  ftime: 85;   usetick: 0);
        ActDie:     (start: 480;    frame: 10; skip: 0;  ftime: 160;  usetick: 0);
        ActDeath:   (start: 480;    frame: 10; skip: 0;  ftime: 160;  usetick: 0);
    );
   MA98: TMonsterAction = (     //의인충
        ActStand:   (start: 0;      frame: 7;  skip: 3;  ftime: 180;  usetick: 0);
        ActWalk:    (start: 80;     frame: 6;  skip: 4;  ftime: 100;  usetick: 0);
        ActAttack:  (start: 160;    frame: 8;  skip: 2;  ftime: 90;   usetick: 0);
        ActCritical:(start: 240;    frame: 7;  skip: 3;  ftime: 95;   usetick: 0);
        ActStruck:  (start: 320;    frame: 3;  skip: 7;  ftime: 85;   usetick: 0);
        ActDie:     (start: 400;    frame: 8;  skip: 2;  ftime: 160;  usetick: 0);
        ActDeath:   (start: 400;    frame: 8;  skip: 2;  ftime: 200;  usetick: 0);
    );
   MA99: TMonsterAction = (   //인면수
        ActStand:  (start: 0;      frame: 4;  skip: 6;  ftime: 100;  usetick: 0);
        ActWalk:   (start: 80;     frame: 6;  skip: 4;  ftime: 100;  usetick: 0);
        ActAttack: (start: 160;    frame: 6;  skip: 4;  ftime: 100;  usetick: 0);
        ActCritical:(start: 340;   frame: 6;  skip: 4;  ftime: 160;  usetick: 0);
        ActStruck: (start: 240;    frame: 2;  skip: 0;  ftime: 100;  usetick: 0);
        ActDie:    (start: 260;    frame: 8;  skip: 2;  ftime: 160;  usetick: 0);
        ActDeath:  (start: 420;    frame: 8;  skip: 2;  ftime: 100;  usetick: 0);
    );
   MA100: TMonsterAction = (    //인간수
        ActStand:   (start: 0;      frame: 10; skip: 0;  ftime: 180;  usetick: 0);
        ActWalk:    (start: 80;     frame: 6;  skip: 4;  ftime: 100;  usetick: 0);
        ActAttack:  (start: 160;    frame: 10; skip: 0;  ftime: 95;   usetick: 0);
        ActCritical:(start: 240;    frame: 10; skip: 0;  ftime: 100;  usetick: 0);
        ActStruck:  (start: 320;    frame: 3;  skip: 7;  ftime: 90;   usetick: 0);
        ActDie:     (start: 400;    frame: 10; skip: 0;  ftime: 160;  usetick: 0);
        ActDeath:   (start: 400;    frame: 10; skip: 0;  ftime: 200;  usetick: 0);
    );
   MA101: TMonsterAction = (    //문조인
        ActStand:    (start: 0;      frame: 7;  skip: 3;  ftime: 150;  usetick: 0);
        ActWalk:     (start: 80;     frame: 6;  skip: 4;  ftime: 100;  usetick: 0);
        ActAttack:   (start: 160;    frame: 7;  skip: 3;  ftime: 90;   usetick: 0);
        ActCritical: (start: 240;    frame: 9;  skip: 1;  ftime: 90;   usetick: 0);
        ActStruck:   (start: 400;    frame: 3;  skip: 7;  ftime: 90;   usetick: 0);
        ActDie:      (start: 480;    frame: 8;  skip: 2;  ftime: 160;  usetick: 0);
        ActDeath:    (start: 480;    frame: 8;  skip: 2;  ftime: 200;  usetick: 0);
        ActCritical2:(start: 320;    frame: 9;  skip: 1;  ftime: 90;   usetick: 0);
    );
   MA102: TMonsterAction = (   //작은뿔서우인
        ActStand:   (start: 0;      frame: 10; skip: 0;  ftime: 150;  usetick: 0);
        ActWalk:    (start: 80;     frame: 6;  skip: 4;  ftime: 100;  usetick: 0);
        ActAttack:  (start: 160;    frame: 7;  skip: 3;  ftime: 90;   usetick: 0);
        ActCritical:(start: 240;    frame: 7;  skip: 3;  ftime: 90;   usetick: 0);
        ActStruck:  (start: 320;    frame: 3;  skip: 7;  ftime: 85;   usetick: 0);
        ActDie:     (start: 400;    frame: 7;  skip: 3;  ftime: 160;  usetick: 0);
        ActDeath:   (start: 400;    frame: 7;  skip: 3;  ftime: 200;  usetick: 0);
    );
   MA103: TMonsterAction = (      //큰뿔서우인
        ActStand:    (start: 0;      frame: 6;  skip: 4;  ftime: 150;  usetick: 0);
        ActWalk:     (start: 80;     frame: 6;  skip: 4;  ftime: 100;  usetick: 0);
        ActAttack:   (start: 160;    frame: 7;  skip: 3;  ftime: 90;   usetick: 0);
        ActCritical: (start: 240;    frame: 7;  skip: 3;  ftime: 90;  usetick: 0);
        ActStruck:   (start: 400;    frame: 3;  skip: 7;  ftime: 85;  usetick: 0);
        ActDie:      (start: 480;    frame: 9;  skip: 1;  ftime: 160;  usetick: 0);
        ActDeath:    (start: 480;    frame: 9;  skip: 1;  ftime: 200;  usetick: 0);
        ActCritical2:(start: 320;    frame: 9;  skip: 1;  ftime: 90;  usetick: 0);
    );
   MA104: TMonsterAction = (     //백상인
        ActStand:   (start: 0;      frame: 10;  skip: 0;  ftime: 150;  usetick: 0);
        ActWalk:    (start: 80;     frame: 6;   skip: 4;  ftime: 100;  usetick: 0);
        ActAttack:  (start: 160;    frame: 10;  skip: 0;  ftime: 85;   usetick: 0);
        ActCritical:(start: 240;    frame: 10;  skip: 0;  ftime: 85;   usetick: 0);
        ActStruck:  (start: 320;    frame: 3;   skip: 7;  ftime: 90;   usetick: 0);
        ActDie:     (start: 400;    frame: 7;   skip: 3;  ftime: 160;  usetick: 0);
        ActDeath:   (start: 400;    frame: 7;   skip: 3;  ftime: 200;  usetick: 0);
    );
   MA105: TMonsterAction = (    //돌거인
        ActStand:   (start: 0;      frame: 9;  skip: 1;  ftime: 140;  usetick: 0);
        ActWalk:    (start: 80;     frame: 6;  skip: 4;  ftime: 100;  usetick: 0);
        ActAttack:  (start: 160;    frame: 10; skip: 0;  ftime: 85;   usetick: 0);
        ActCritical:(start: 240;    frame: 10; skip: 0;  ftime: 85;   usetick: 0);
        ActStruck:  (start: 320;    frame: 3;  skip: 7;  ftime: 85;   usetick: 0);
        ActDie:     (start: 400;    frame: 8;  skip: 2;  ftime: 160;  usetick: 0);
        ActDeath:   (start: 400;    frame: 8;  skip: 2;  ftime: 200;  usetick: 0);
    );
   MA106: TMonsterAction = (    //흙거인
        ActStand:   (start: 0;      frame: 8;  skip: 2;  ftime: 140;  usetick: 0);
        ActWalk:    (start: 80;     frame: 6;  skip: 4;  ftime: 100;  usetick: 0);
        ActAttack:  (start: 160;    frame: 10; skip: 0;  ftime: 85;   usetick: 0);
        ActCritical:(start: 240;    frame: 10; skip: 0;  ftime: 85;   usetick: 0);
        ActStruck:  (start: 320;    frame: 3;  skip: 7;  ftime: 85;   usetick: 0);
        ActDie:     (start: 400;    frame: 8;  skip: 2;  ftime: 160;  usetick: 0);
        ActDeath:   (start: 400;    frame: 8;  skip: 2;  ftime: 200;  usetick: 0);
    );
   MA107: TMonsterAction = (      //가네수
        ActStand:    (start: 0;     frame: 9;   skip: 1;  ftime: 150;  usetick: 0);
        ActWalk:     (start: 80;    frame: 6;   skip: 4;  ftime: 100;  usetick: 0);
        ActAttack:   (start: 160;   frame: 10;  skip: 0;  ftime: 85;   usetick: 0);
        ActCritical: (start: 240;   frame: 10;  skip: 0;  ftime: 85;   usetick: 0);
        ActStruck:   (start: 480;   frame: 3;   skip: 7;  ftime: 85;   usetick: 0);
        ActDie:      (start: 560;   frame: 10;  skip: 0;  ftime: 160;  usetick: 0);
        ActDeath:    (start: 560;   frame: 10;  skip: 0;  ftime: 200;  usetick: 0);
        ActCritical2:(start: 320;   frame: 10;  skip: 0;  ftime: 85;   usetick: 0);
        ActCritical3:(start: 400;   frame: 10;  skip: 0;  ftime: 85;   usetick: 0);
    );
   MA108: TMonsterAction = (      //여하수
        ActStand:    (start: 0;     frame: 10;  skip: 0;  ftime: 150;  usetick: 0);
        ActWalk:     (start: 10;    frame: 1;   skip: 0;  ftime: 100;  usetick: 0);
        ActAttack:   (start: 20;    frame: 10;  skip: 0;  ftime: 90;   usetick: 0);
        ActCritical: (start: 20;    frame: 10;  skip: 0;  ftime: 90;   usetick: 0);
        ActStruck:   (start: 30;    frame: 3;   skip: 0;  ftime: 90;   usetick: 0);
        ActDie:      (start: 40;    frame: 11;  skip: 0;  ftime: 160;  usetick: 0);
        ActDeath:    (start: 40;    frame: 11;  skip: 0;  ftime: 200;  usetick: 0);
    );
   MA109: TMonsterAction = (    //공작주
        ActStand:    (start: 0;      frame: 9;  skip: 1;  ftime: 150;  usetick: 0);
        ActWalk:     (start: 80;     frame: 6;  skip: 4;  ftime: 100;  usetick: 0);
        ActAttack:   (start: 160;    frame: 9;  skip: 1;  ftime: 90;   usetick: 0);
        ActCritical: (start: 240;    frame: 10; skip: 0;  ftime: 90;   usetick: 0);
        ActStruck:   (start: 560;    frame: 3;  skip: 7;  ftime: 90;   usetick: 0);
        ActDie:      (start: 640;    frame: 9;  skip: 1;  ftime: 160;  usetick: 0);
        ActDeath:    (start: 640;    frame: 9;  skip: 1;  ftime: 200;  usetick: 0);
        ActCritical2:(start: 400;    frame: 9;  skip: 1;  ftime: 90;   usetick: 0);
        ActCritical3:(start: 480;    frame: 10; skip: 0;  ftime: 90;   usetick: 0);
    );
   MA110: TMonsterAction = (   //호혼석
        ActStand:   (start: 0;    frame: 4;  skip: 6;  ftime: 200;  usetick: 0);
        ActWalk:    (start: 10;   frame: 4;  skip: 6;  ftime: 200;  usetick: 0);
        ActAttack:  (start: 20;   frame: 6;  skip: 4;  ftime: 120;  usetick: 0);
        ActCritical:(start: 20;   frame: 6;  skip: 4;  ftime: 120;  usetick: 0);
        ActStruck:  (start: 30;   frame: 2;  skip: 8;  ftime: 100;  usetick: 0);
        ActDie:     (start: 40;   frame: 10; skip: 0;  ftime: 120;  usetick: 0);
        ActDeath:   (start: 40;   frame: 10; skip: 0;  ftime: 120;  usetick: 0);
    );
   MA111: TMonsterAction = (   //눈꽃도둑
        ActStand:   (start: 0;      frame: 4;  skip: 6;  ftime: 180;  usetick: 0);
        ActWalk:    (start: 80;     frame: 8;  skip: 2;  ftime: 100;  usetick: 0);
        ActAttack:  (start: 160;    frame: 6;  skip: 4;  ftime: 90;   usetick: 0);
        ActCritical:(start: 0;      frame: 0;  skip: 0;  ftime: 0;    usetick: 0);
        ActStruck:  (start: 240;    frame: 3;  skip: 0;  ftime: 90;   usetick: 0);
        ActDie:     (start: 270;    frame: 5;  skip: 5;  ftime: 160;  usetick: 0);
        ActDeath:   (start: 270;    frame: 5;  skip: 5;  ftime: 200;  usetick: 0);
    );

   MA203: TMonsterAction = (    //태구오마
        ActStand:   (start: 0;      frame: 9;   skip: 1;  ftime: 120;  usetick: 0);
        ActWalk:    (start: 80;     frame: 6;   skip: 4;  ftime: 100;  usetick: 0);
        ActAttack:  (start: 160;    frame: 8;   skip: 2;  ftime: 100;  usetick: 0);
        ActCritical:(start: 240;    frame: 9;   skip: 1;  ftime: 90;  usetick: 0);
        ActStruck:  (start: 320;    frame: 3;   skip: 7;  ftime: 100;  usetick: 0);
        ActDie:     (start: 400;    frame: 10;  skip: 0;  ftime: 160;  usetick: 0);
        ActDeath:   (start: 400;    frame: 10;  skip: 0;  ftime: 100;  usetick: 0);
    );

   MA112: TMonsterAction = (    //거권오마 오마적병
        ActStand:   (start: 0;      frame: 10;  skip: 0;  ftime: 120;  usetick: 0);
        ActWalk:    (start: 80;     frame: 6;   skip: 4;  ftime: 100;  usetick: 0);
        ActAttack:  (start: 160;    frame: 10;  skip: 0;  ftime: 90;  usetick: 0);
        ActCritical:(start: 240;    frame: 10;  skip: 0;  ftime: 90;  usetick: 0);
        ActStruck:  (start: 320;    frame: 3;   skip: 7;  ftime: 100;  usetick: 0);
        ActDie:     (start: 400;    frame: 10;  skip: 0;  ftime: 160;  usetick: 0);
        ActDeath:   (start: 400;    frame: 10;  skip: 0;  ftime: 100;  usetick: 0);
    );

   MA1122: TMonsterAction = (    //다목오마
        ActStand:   (start: 0;      frame: 10;  skip: 0;  ftime: 120;  usetick: 0);
        ActWalk:    (start: 80;     frame: 6;   skip: 4;  ftime: 100;  usetick: 0);
        ActAttack:  (start: 160;    frame: 10;  skip: 0;  ftime: 90;  usetick: 0);
        ActCritical:(start: 160;    frame: 10;  skip: 0;  ftime: 90;  usetick: 0);
        ActStruck:  (start: 240;    frame: 3;   skip: 7;  ftime: 100;  usetick: 0);
        ActDie:     (start: 320;    frame: 9;   skip: 1;  ftime: 160;  usetick: 0);
        ActDeath:   (start: 320;    frame: 9;   skip: 1;  ftime: 100;  usetick: 0);
    );
   MA1123: TMonsterAction = (    //오마흑병
        ActStand:   (start: 0;      frame: 10;  skip: 0;  ftime: 120;  usetick: 0);
        ActWalk:    (start: 80;     frame: 6;   skip: 4;  ftime: 100;  usetick: 0);
        ActAttack:  (start: 160;    frame: 10;  skip: 0;  ftime: 90;  usetick: 0);
        ActCritical:(start: 160;    frame: 10;  skip: 0;  ftime: 90;  usetick: 0);
        ActStruck:  (start: 240;    frame: 3;   skip: 7;  ftime: 100;  usetick: 0);
        ActDie:     (start: 320;    frame: 10;  skip: 0;  ftime: 160;  usetick: 0);
        ActDeath:   (start: 320;    frame: 10;  skip: 0;  ftime: 100;  usetick: 0);
    );
   MA1124: TMonsterAction = (    //떠도는선원
        ActStand:   (start: 0;      frame: 4;  skip: 6;  ftime: 200;  usetick: 0);
        ActWalk:    (start: 80;     frame: 6;   skip: 4;  ftime: 100;  usetick: 0);
        ActAttack:  (start: 160;    frame: 7;  skip: 3;  ftime: 110;  usetick: 0);
        ActCritical:(start: 160;    frame: 7;  skip: 3;  ftime: 110;  usetick: 0);
        ActStruck:  (start: 240;    frame: 3;   skip: 7;  ftime: 100;  usetick: 0);
        ActDie:     (start: 320;    frame: 8;  skip: 2;  ftime: 160;  usetick: 0);
        ActDeath:   (start: 320;    frame: 8;  skip: 2;  ftime: 100;  usetick: 0);
    );
   MA1125: TMonsterAction = (    //익사한노예
        ActStand:   (start: 0;      frame: 4;  skip: 6;  ftime: 200;  usetick: 0);
        ActWalk:    (start: 80;     frame: 6;   skip: 4;  ftime: 100;  usetick: 0);
        ActAttack:  (start: 160;    frame: 6;  skip: 4;  ftime: 110;  usetick: 0);
        ActCritical:(start: 240;    frame: 8;  skip: 2;  ftime: 110;  usetick: 0);
        ActStruck:  (start: 320;    frame: 3;   skip: 7;  ftime: 100;  usetick: 0);
        ActDie:     (start: 400;    frame: 8;  skip: 2;  ftime: 160;  usetick: 0);
        ActDeath:   (start: 400;    frame: 8;  skip: 2;  ftime: 100;  usetick: 0);
    );
   MA1126: TMonsterAction = (    //선박의악령
        ActStand:   (start: 0;      frame: 4;  skip: 6;  ftime: 200;  usetick: 0);
        ActWalk:    (start: 80;     frame: 6;   skip: 4;  ftime: 100;  usetick: 0);
        ActAttack:  (start: 160;    frame: 8;  skip: 2;  ftime: 110;  usetick: 0);
        ActCritical:(start: 240;    frame: 7;  skip: 3;  ftime: 110;  usetick: 0);
        ActStruck:  (start: 320;    frame: 3;   skip: 7;  ftime: 100;  usetick: 0);
        ActDie:     (start: 400;    frame: 7;  skip: 3;  ftime: 160;  usetick: 0);
        ActDeath:   (start: 400;    frame: 7;  skip: 3;  ftime: 100;  usetick: 0);
        ActCritical2:(start: 160;   frame: 8;  skip: 2;  ftime: 110;  usetick: 0);
    );
   MA1127: TMonsterAction = (    //농노군
        ActStand:   (start: 0;      frame: 4;  skip: 6;  ftime: 200;  usetick: 0);
        ActWalk:    (start: 80;     frame: 6;   skip: 4;  ftime: 100;  usetick: 0);
        ActAttack:  (start: 160;    frame: 6;  skip: 4;  ftime: 110;  usetick: 0);
        ActCritical:(start: 240;    frame: 6;  skip: 4;  ftime: 110;  usetick: 0);
        ActStruck:  (start: 320;    frame: 2;   skip: 8;  ftime: 100;  usetick: 0);
        ActDie:     (start: 400;    frame: 10;  skip: 0;  ftime: 160;  usetick: 0);
        ActDeath:   (start: 400;    frame: 10;  skip: 0;  ftime: 100;  usetick: 0);
    );
   MA1128: TMonsterAction = (    //거친선목
        ActStand:   (start: 0;      frame: 4;  skip: 6;  ftime: 200;  usetick: 0);
        ActWalk:    (start: 80;     frame: 6;   skip: 4;  ftime: 100;  usetick: 0);
        ActAttack:  (start: 160;    frame: 10;  skip: 0;  ftime: 90;  usetick: 0);
        ActCritical:(start: 160;    frame: 10;  skip: 0;  ftime: 90;  usetick: 0);
        ActStruck:  (start: 240;    frame: 3;   skip: 7;  ftime: 100;  usetick: 0);
        ActDie:     (start: 320;    frame: 8;  skip: 2;  ftime: 160;  usetick: 0);
        ActDeath:   (start: 320;    frame: 8;  skip: 2;  ftime: 100;  usetick: 0);
    );
   MA1129: TMonsterAction = (    //변이된감시병
        ActStand:   (start: 0;      frame: 4;  skip: 6;  ftime: 200;  usetick: 0);
        ActWalk:    (start: 80;     frame: 6;   skip: 4;  ftime: 100;  usetick: 0);
        ActAttack:  (start: 160;    frame: 10;  skip: 0;  ftime: 90;  usetick: 0);
        ActCritical:(start: 160;    frame: 10;  skip: 0;  ftime: 90;  usetick: 0);
        ActStruck:  (start: 240;    frame: 3;   skip: 7;  ftime: 100;  usetick: 0);
        ActDie:     (start: 320;    frame: 9;  skip: 1;  ftime: 160;  usetick: 0);
        ActDeath:   (start: 320;    frame: 9;  skip: 1;  ftime: 100;  usetick: 0);
    );
   MA1130: TMonsterAction = (    //혼불
        ActStand:   (start: 0;      frame: 4;  skip: 6;  ftime: 200;  usetick: 0);
        ActWalk:    (start: 80;     frame: 6;   skip: 4;  ftime: 100;  usetick: 0);
        ActAttack:  (start: 160;    frame: 7;  skip: 3;  ftime: 90;  usetick: 0);
        ActCritical:(start: 160;    frame: 7;  skip: 3;  ftime: 90;  usetick: 0);
        ActStruck:  (start: 240;    frame: 3;   skip: 7;  ftime: 100;  usetick: 0);
        ActDie:     (start: 320;    frame: 10;  skip: 0;  ftime: 160;  usetick: 0);
        ActDeath:   (start: 320;    frame: 10;  skip: 0;  ftime: 100;  usetick: 0);
    );
   MA1131: TMonsterAction = (    //암흑선장
        ActStand:   (start: 0;      frame: 10;  skip: 0;  ftime: 120;  usetick: 0);
        ActWalk:    (start: 80;     frame: 8;   skip: 2;  ftime: 100;  usetick: 0);
        ActAttack:  (start: 160;    frame: 7;  skip: 3;  ftime: 90;  usetick: 0);
        ActCritical:(start: 240;    frame: 7;  skip: 3;  ftime: 90;  usetick: 0);
        ActStruck:  (start: 640;    frame: 3;   skip: 7;  ftime: 100;  usetick: 0);
        ActDie:     (start: 720;    frame: 10;  skip: 0;  ftime: 160;  usetick: 0);
        ActDeath:   (start: 720;    frame: 10;  skip: 0;  ftime: 100;  usetick: 0);
        ActCritical2:(start: 320;    frame: 7;  skip: 3;  ftime: 90;  usetick: 0);
        ActCritical3:(start: 400;    frame: 7;  skip: 3;  ftime: 90;  usetick: 0);
    );
   MA113: TMonsterAction = (   //오마제사장
        ActStand:   (start: 0;      frame: 9;   skip: 1;  ftime: 120;  usetick: 0);
        ActWalk:    (start: 80;     frame: 6;   skip: 4;  ftime: 100;  usetick: 0);
        ActAttack:  (start: 160;    frame: 7;   skip: 3;  ftime: 90;  usetick: 0);
        ActCritical:(start: 240;    frame: 7;   skip: 3;  ftime: 90;  usetick: 0);
        ActStruck:  (start: 400;    frame: 3;   skip: 7;  ftime: 100;  usetick: 0);
        ActDie:     (start: 480;    frame: 9;   skip: 1;  ftime: 160;  usetick: 0);
        ActDeath:   (start: 480;    frame: 9;   skip: 1;  ftime: 100;  usetick: 0);
        ActCritical2:(start: 320;   frame: 9;   skip: 1;  ftime: 90;  usetick: 0);
    );

  MA116: TMonsterAction = (//설인량
    ActStand:   (start: 0;   frame: 4;  skip: 6;  ftime: 200;  usetick: 0);
    ActWalk:    (start: 80;  frame: 6;  skip: 4;  ftime: 100;  usetick: 3);
    ActAttack:  (start: 160; frame: 6;  skip: 4;  ftime: 100;  usetick: 0);
    ActCritical:(start: 340; frame: 7;  skip: 3;  ftime: 100;  usetick: 0);
    ActStruck:  (start: 240; frame: 2;  skip: 0;  ftime: 100;  usetick: 0);
    ActDie:     (start: 260; frame: 7; skip: 3;  ftime: 100;  usetick: 0);
    ActDeath:   (start: 0; frame: 0; skip: 0;  ftime: 100;  usetick: 0);
    );
  MA117: TMonsterAction = (//격빙야차
    ActStand:   (start: 0;   frame: 4;  skip: 6;  ftime: 200;  usetick: 0);
    ActWalk:    (start: 80;  frame: 6;  skip: 4;  ftime: 100;  usetick: 3);
    ActAttack:  (start: 160; frame: 6;  skip: 4;  ftime: 100;  usetick: 0);
    ActCritical:(start: 340; frame: 10;  skip: 0;  ftime: 100;  usetick: 0);
    ActStruck:  (start: 240; frame: 2;  skip: 0;  ftime: 100;  usetick: 0);
    ActDie:     (start: 260; frame: 10; skip: 0;  ftime: 100;  usetick: 0);
    ActDeath:   (start: 0; frame: 0; skip: 0;  ftime: 100;  usetick: 0);
    );
  MA118: TMonsterAction = (//창한야차
    ActStand:   (start: 0;   frame: 4;  skip: 6;  ftime: 200;  usetick: 0);
    ActWalk:    (start: 80;  frame: 6;  skip: 4;  ftime: 100;  usetick: 3);
    ActAttack:  (start: 160; frame: 10;  skip: 0;  ftime: 100;  usetick: 0);
    ActCritical:(start: 340; frame: 6;  skip: 4;  ftime: 100;  usetick: 0);
    ActStruck:  (start: 240; frame: 2;  skip: 0;  ftime: 100;  usetick: 0);
    ActDie:     (start: 260; frame: 9; skip: 1;  ftime: 100;  usetick: 0);
    ActDeath:   (start: 0; frame: 0; skip: 0;  ftime: 100;  usetick: 0);
    );
  MA119: TMonsterAction = (//야차수호장
    ActStand:   (start: 0;   frame: 4;  skip: 6;  ftime: 200;  usetick: 0);
    ActWalk:    (start: 80;  frame: 6;  skip: 4;  ftime: 100;  usetick: 3);
    ActAttack:  (start: 340; frame: 8;  skip: 2;  ftime: 100;  usetick: 0);
    ActCritical:(start: 420; frame: 7;  skip: 3;  ftime: 100;  usetick: 0);
    ActStruck:  (start: 240; frame: 2;  skip: 0;  ftime: 100;  usetick: 0);
    ActDie:     (start: 260; frame: 8; skip: 2;  ftime: 100;  usetick: 0);
    ActDeath:   (start: 420; frame: 7; skip: 3;  ftime: 120;  usetick: 0);
    );
  MA120: TMonsterAction = (  //호기연 , 호기옥
        ActStand:  (start: 0;      frame: 10; skip: 0;  ftime: 150;  usetick: 0);
        ActWalk:   (start: 10;     frame: 10; skip: 0;  ftime: 150;  usetick: 0);
        ActAttack: (start: 20;     frame: 10; skip: 0;  ftime: 150;  usetick: 0);
        ActCritical:(start:20;     frame: 10; skip: 0;  ftime: 150;  usetick: 0);
        ActStruck: (start: 30;     frame: 4;  skip: 6;  ftime: 100;  usetick: 0);
        ActDie:    (start: 40;     frame: 10; skip: 0;  ftime: 150;  usetick: 0);
        ActDeath:  (start: 40;     frame: 10; skip: 0;  ftime: 150;  usetick: 0);
      );
  MA1200: TMonsterAction = (  //구슬
        ActStand:  (start: 0;      frame: 6; skip: 4;  ftime: 150;  usetick: 0);
        ActWalk:   (start: 10;     frame: 7; skip: 3;  ftime: 150;  usetick: 0);
        ActAttack: (start: 10;     frame: 7; skip: 3;  ftime: 150;  usetick: 0);
        ActCritical:(start:10;     frame: 7; skip: 3;  ftime: 150;  usetick: 0);
        ActStruck: (start: 20;     frame: 3;  skip: 7;  ftime: 100;  usetick: 0);
        ActDie:    (start: 30;     frame: 8; skip: 2;  ftime: 150;  usetick: 0);
        ActDeath:  (start: 40;     frame: 7; skip: 3;  ftime: 150;  usetick: 0);
      );
  MA121: TMonsterAction = (//갑석귀수
    ActStand:   (start: 0;   frame: 4;  skip: 6;  ftime: 200;  usetick: 0);
    ActWalk:    (start: 80;  frame: 6;  skip: 4;  ftime: 100;  usetick: 3);
    ActAttack:  (start: 160; frame: 6;  skip: 4;  ftime: 100;  usetick: 0);
    ActCritical:(start: 0;   frame: 0;  skip: 0;  ftime: 100;  usetick: 0);
    ActStruck:  (start: 240; frame: 2;  skip: 0;  ftime: 100;  usetick: 0);
    ActDie:     (start: 260; frame: 10; skip: 0;  ftime: 100;  usetick: 0);
    ActDeath:   (start: 0; frame: 0; skip: 0;  ftime: 100;  usetick: 0);
    );
  MA122: TMonsterAction = (//갑철귀수
    ActStand:   (start: 0;   frame: 4;  skip: 6;  ftime: 200;  usetick: 0);
    ActWalk:    (start: 80;  frame: 6;  skip: 4;  ftime: 100;  usetick: 3);
    ActAttack:  (start: 160; frame: 6;  skip: 4;  ftime: 100;  usetick: 0);
    ActCritical:(start: 0;   frame: 0;  skip: 0;  ftime: 100;  usetick: 0);
    ActStruck:  (start: 240; frame: 2;  skip: 0;  ftime: 100;  usetick: 0);
    ActDie:     (start: 260; frame: 10; skip: 0;  ftime: 100;  usetick: 0);
    ActDeath:   (start: 0; frame: 0; skip: 0;  ftime: 100;  usetick: 0);
    );
  MA123: TMonsterAction = (//월지겸신장  MA126
    ActStand:   (start: 0;   frame: 4;  skip: 6;  ftime: 200;  usetick: 0);
    ActWalk:    (start: 80;  frame: 6;  skip: 4;  ftime: 160;  usetick: 3);
    ActAttack:  (start: 160; frame: 6;  skip: 4;  ftime: 120;  usetick: 0);
    ActCritical:(start: 340; frame: 10;  skip: 0;  ftime: 120;  usetick: 0);
    ActStruck:  (start: 240; frame: 2;  skip: 0;  ftime: 100;  usetick: 0);
    ActDie:     (start: 260; frame: 10; skip: 0;  ftime: 140;  usetick: 0);
    ActDeath:   (start: 0; frame: 0; skip: 0;  ftime: 200;  usetick: 0);
    );
  MA124: TMonsterAction = (//한빙수호귀
    ActStand:    (start: 0;   frame: 4;  skip: 6;  ftime: 200;  usetick: 0);
    ActWalk:     (start: 80;  frame: 6;  skip: 4;  ftime: 150;  usetick: 0);
    ActAttack:   (start: 160; frame: 6;  skip: 4;  ftime: 120;  usetick: 0);
    ActCritical: (start: 340; frame: 8;  skip: 2;  ftime: 100;  usetick: 0);
    ActStruck:   (start: 240; frame: 2;  skip: 0;  ftime: 100;  usetick: 0);
    ActDie:      (start: 260; frame: 10; skip: 0;  ftime: 200;  usetick: 0);
    ActDeath:    (start: 260; frame: 10; skip: 0;  ftime: 200;  usetick: 0);
    ActCritical2:(start: 420; frame: 9;  skip: 1;  ftime: 100;  usetick: 0);
    );
  MA1244: TMonsterAction = (//오마흑령
    ActStand:    (start: 0;   frame: 10;  skip: 0;  ftime: 120;  usetick: 0);
    ActWalk:     (start: 80;  frame: 6;  skip: 4;  ftime: 120;  usetick: 0);
    ActAttack:   (start: 160; frame: 9;  skip: 1;  ftime: 100;  usetick: 0);
    ActCritical: (start: 260; frame: 14;  skip: 26;  ftime: 100;  usetick: 0);
    ActStruck:   (start: 800; frame: 3;  skip: 7;  ftime: 100;  usetick: 0);
    ActDie:      (start: 880; frame: 10; skip: 0;  ftime: 200;  usetick: 0);
    ActDeath:    (start: 880; frame: 10; skip: 0;  ftime: 200;  usetick: 0);
    ActCritical2:(start: 560; frame: 8;  skip: 2;  ftime: 100;  usetick: 0);
    ActCritical3:(start: 640; frame: 9;  skip: 1;  ftime: 90;  usetick: 0);
    );
  MA125: TMonsterAction = (//석마수
    ActStand:   (start: 0;   frame: 4;  skip: 6;  ftime: 200; usetick: 0);
    ActWalk:    (start: 80;  frame: 6;  skip: 4;  ftime: 150; usetick: 3);
    ActAttack:  (start: 160; frame: 6;  skip: 4;  ftime: 120; usetick: 0);
    ActCritical:(start: 420; frame: 20; skip: 0;  ftime: 80;  usetick: 0);
    ActStruck:  (start: 240; frame: 2;  skip: 0;  ftime: 100; usetick: 0);
    ActDie:     (start: 260; frame: 20; skip: 0;  ftime: 85;  usetick: 0);
    ActDeath:   (start: 260; frame: 20; skip: 0;  ftime: 85;  usetick: 0);
    );
  MA126: TMonsterAction = (// 조인상  MA126
    ActStand:   (start: 0;   frame: 4;  skip: 6;  ftime: 200;  usetick: 0);
    ActWalk:    (start: 80;  frame: 6;  skip: 4;  ftime: 100;  usetick: 3);
    ActAttack:  (start: 160; frame: 6;  skip: 4;  ftime: 100;  usetick: 0);
    ActCritical:(start: 340; frame: 10;  skip: 0;  ftime: 100;  usetick: 0);
    ActStruck:  (start: 240; frame: 2;  skip: 0;  ftime: 100;  usetick: 0);
    ActDie:     (start: 260; frame: 10; skip: 0;  ftime: 100;  usetick: 0);
    ActDeath:   (start: 0; frame: 0; skip: 0;  ftime: 100;  usetick: 0);
    );
  MA127: TMonsterAction = (//현무현신
    ActStand:   (start: 0;   frame: 4;  skip: 6;  ftime: 200;  usetick: 0);
    ActWalk:    (start: 80;  frame: 6;  skip: 4;  ftime: 100;  usetick: 3);
    ActAttack:  (start: 160; frame: 10;  skip: 0;  ftime: 100;  usetick: 0);
    ActCritical:(start: 500; frame: 6;  skip: 4;  ftime: 100;  usetick: 0);
    ActStruck:  (start: 240; frame: 2;  skip: 0;  ftime: 100;  usetick: 0);
    ActDie:     (start: 260; frame: 10; skip: 0;  ftime: 100;  usetick: 0);
    ActDeath:   (start: 0; frame: 0; skip: 0;  ftime: 100;  usetick: 0);
    );
  MA134: TMonsterAction = (//역천귀
    ActStand:   (start: 0;   frame: 4;  skip: 6;  ftime: 200;  usetick: 0);
    ActWalk:    (start: 80;  frame: 8;  skip: 2;  ftime: 120;  usetick: 3);
    ActAttack:  (start: 160; frame: 7;  skip: 3;  ftime: 120;  usetick: 0);
    ActCritical:(start: 270; frame: 9;  skip: 1;  ftime: 120;  usetick: 0);
    ActStruck:  (start: 240; frame: 3;  skip: 0;  ftime: 120;  usetick: 0);
    ActDie:     (start: 520; frame: 12;  skip: 8;  ftime: 150;  usetick: 0);
    ActDeath:   (start: 520; frame: 12;  skip: 8;  ftime: 150;  usetick: 0);
    );
  MA135: TMonsterAction = (//흑천귀
    ActStand:   (start: 0;   frame: 4;  skip: 6;  ftime: 200;  usetick: 0);
    ActWalk:    (start: 80;  frame: 8;  skip: 2;  ftime: 120;  usetick: 3);
    ActAttack:  (start: 160; frame: 7;  skip: 3;  ftime: 120;  usetick: 0);
    ActCritical:(start: 350; frame: 7;  skip: 3;  ftime: 120;  usetick: 0);
    ActStruck:  (start: 240; frame: 3;  skip: 0;  ftime: 120;  usetick: 0);
    ActDie:     (start: 270; frame: 9;  skip: 1;  ftime: 150;  usetick: 0);
    ActDeath:   (start: 270; frame: 9;  skip: 1;  ftime: 150;  usetick: 0);
    );
  MA136: TMonsterAction = ( //멸귀
    ActStand:   (start: 0;   frame: 6;  skip: 4;  ftime: 200;  usetick: 0);
    ActWalk:    (start: 80;  frame: 10; skip: 0;  ftime: 200;  usetick: 3);
    ActAttack:  (start: 160; frame: 6;  skip: 4;  ftime: 120;  usetick: 0);
    ActCritical:(start: 350; frame: 7;  skip: 3;  ftime: 120;  usetick: 0);
    ActStruck:  (start: 240; frame: 3;  skip: 0;  ftime: 100;  usetick: 0);
    ActDie:     (start: 270; frame: 6;  skip: 4;  ftime: 200;  usetick: 0);
    ActDeath:   (start: 270; frame: 6;  skip: 4;  ftime: 200;  usetick: 0);
    );
   MA138: TMonsterAction = ( //한시
    ActStand:   (start: 0;   frame: 4;  skip: 6;  ftime: 200;  usetick: 0);
    ActWalk:    (start: 80;  frame: 6;  skip: 4;  ftime: 180;  usetick: 3);
    ActAttack:  (start: 160; frame: 8;  skip: 2;  ftime: 120;  usetick: 0);
    ActCritical:(start: 160; frame: 8;  skip: 2;  ftime: 120;  usetick: 0);
    ActStruck:  (start: 240; frame: 3;  skip: 0;  ftime: 100;  usetick: 0);
    ActDie:     (start: 270; frame: 10; skip: 0;  ftime: 200;  usetick: 0);
    ActDeath:   (start: 270; frame: 10; skip: 0;  ftime: 200;  usetick: 0);
    );

   MA1388: TMonsterAction = ( //서성이는궁병
    ActStand:   (start: 0;   frame: 3;  skip: 7;  ftime: 200;  usetick: 0);
    ActWalk:    (start: 80;  frame: 5;  skip: 5;  ftime: 90;  usetick: 3);
    ActAttack:  (start: 160; frame: 6;  skip: 4;  ftime: 90;  usetick: 0);
    ActCritical:(start: 160; frame: 8;  skip: 2;  ftime: 120;  usetick: 0);
    ActStruck:  (start: 240; frame: 2;  skip: 8;  ftime: 80;  usetick: 0);
    ActDie:     (start: 320; frame: 10; skip: 0;  ftime: 120;  usetick: 0);
    ActDeath:   (start: 320; frame: 10; skip: 0;  ftime: 120;  usetick: 0);
    );

   MA139: TMonsterAction = ( //광한시
    ActStand:   (start: 0;   frame: 4;  skip: 6;  ftime: 200;  usetick: 0);
    ActWalk:    (start: 80;  frame: 6;  skip: 4;  ftime: 180;  usetick: 3);
    ActAttack:  (start: 160; frame: 8;  skip: 2;  ftime: 120;  usetick: 0);
    ActCritical:(start: 350; frame: 8;  skip: 2;  ftime: 120;  usetick: 0);
    ActStruck:  (start: 240; frame: 3;  skip: 0;  ftime: 100;  usetick: 0);
    ActDie:     (start: 270; frame: 10; skip: 0;  ftime: 200;  usetick: 0);
    ActDeath:   (start: 270; frame: 10; skip: 0;  ftime: 200;  usetick: 0);
    );
   MA140: TMonsterAction = ( //백상
    ActStand:   (start: 0;   frame: 6;  skip: 4;  ftime: 200;  usetick: 0);
    ActWalk:    (start: 80;  frame: 10; skip: 0;  ftime: 150;  usetick: 3);
    ActAttack:  (start: 160; frame: 6;  skip: 4;  ftime: 120;  usetick: 0);
    ActCritical:(start: 430; frame: 6;  skip: 4;  ftime: 120;  usetick: 0);
    ActStruck:  (start: 240; frame: 3;  skip: 0;  ftime: 100;  usetick: 0);
    ActDie:     (start: 270; frame: 10; skip: 0;  ftime: 200;  usetick: 0);
    ActDeath:   (start: 270; frame: 10; skip: 0;  ftime: 200;  usetick: 0);
    ActCritical2:(start: 350; frame: 6;  skip: 4;  ftime: 120;  usetick: 0);     //백상
    );
   MA141: TMonsterAction = ( //남만흑호 백호
    ActStand:   (start: 0;   frame: 6;  skip: 4;  ftime: 200;  usetick: 0);
    ActWalk:    (start: 80;  frame: 6;  skip: 4;  ftime: 200;  usetick: 3);
    ActAttack:  (start: 160; frame: 7;  skip: 3;  ftime: 120;  usetick: 0);
    ActCritical:(start: 350; frame: 6;  skip: 4;  ftime: 120;  usetick: 0);
    ActStruck:  (start: 240; frame: 3;  skip: 0;  ftime: 100;  usetick: 0);
    ActDie:     (start: 270; frame: 9;  skip: 1;  ftime: 200;  usetick: 0);
    ActDeath:   (start: 270; frame: 9;  skip: 1;  ftime: 200;  usetick: 0);
    );
   MA143: TMonsterAction = ( //흑성성
    ActStand:   (start: 0;   frame: 6;  skip: 4;  ftime: 200;  usetick: 0);
    ActWalk:    (start: 80;  frame: 6;  skip: 4;  ftime: 200;  usetick: 3);
    ActAttack:  (start: 160; frame: 7;  skip: 3;  ftime: 120;  usetick: 0);
    ActCritical:(start: 350; frame: 9;  skip: 1;  ftime: 120;  usetick: 0);
    ActStruck:  (start: 240; frame: 3;  skip: 0;  ftime: 100;  usetick: 0);
    ActDie:     (start: 270; frame: 8;  skip: 2;  ftime: 200;  usetick: 0);
    ActDeath:   (start: 270; frame: 8;  skip: 2;  ftime: 200;  usetick: 0);
    );
   MA1433: TMonsterAction = ( //긴코원숭이
    ActStand:   (start: 0;   frame: 4;  skip: 6;  ftime: 200;  usetick: 0);
    ActWalk:    (start: 80;  frame: 6;  skip: 4;  ftime: 200;  usetick: 3);
    ActAttack:  (start: 160; frame: 7;  skip: 3;  ftime: 120;  usetick: 0);
    ActCritical:(start: 160; frame: 7;  skip: 3;  ftime: 120;  usetick: 0);
    ActStruck:  (start: 320; frame: 3;  skip: 7;  ftime: 100;  usetick: 0);
    ActDie:     (start: 400; frame: 10; skip: 0;  ftime: 150;  usetick: 0);
    ActDeath:   (start: 400; frame: 10; skip: 0;  ftime: 150;  usetick: 0);
    );
   MA1434: TMonsterAction = ( //변이갑충
    ActStand:   (start: 0;   frame: 4;  skip: 6;  ftime: 200;  usetick: 0);
    ActWalk:    (start: 80;  frame: 6;  skip: 4;  ftime: 200;  usetick: 3);
    ActAttack:  (start: 160; frame: 8;  skip: 2;  ftime: 120;  usetick: 0);
    ActCritical:(start: 160; frame: 8;  skip: 2;  ftime: 120;  usetick: 0);
    ActStruck:  (start: 240; frame: 3;  skip: 7;  ftime: 100;  usetick: 0);
    ActDie:     (start: 320; frame: 10;  skip: 0;  ftime: 200;  usetick: 0);
    ActDeath:   (start: 320; frame: 10;  skip: 0;  ftime: 200;  usetick: 0);
    );
   MA1435: TMonsterAction = (//거장화
    ActStand:   (start: 0;   frame: 4;  skip: 6;  ftime: 200;  usetick: 0);
    ActWalk:    (start: 0;   frame: 4;  skip: 6;  ftime: 200;  usetick: 3);
    ActAttack:  (start: 80; frame: 7;  skip: 3;  ftime: 120;  usetick: 0);
    ActCritical:(start: 160; frame: 6;  skip: 4;  ftime: 120;  usetick: 0);
    ActStruck:  (start: 240; frame: 3;  skip: 7;  ftime: 100;  usetick: 0);
    ActDie:     (start: 320; frame: 9;  skip: 1;  ftime: 200;  usetick: 0);
    ActDeath:   (start: 400; frame: 9;  skip: 1;  ftime: 120;  usetick: 0);
    ActCritical3:(start: 410; frame: 9;  skip: 1;  ftime: 120;  usetick: 0);
    );
   MA144: TMonsterAction = ( //서우
    ActStand:   (start: 0;   frame: 6;  skip: 4;  ftime: 200;  usetick: 0);
    ActWalk:    (start: 80;  frame: 10; skip: 0;  ftime: 150;  usetick: 3);
    ActAttack:  (start: 160; frame: 6;  skip: 4;  ftime: 120;  usetick: 0);
    ActCritical:(start: 430; frame: 6;  skip: 4;  ftime: 100;  usetick: 0);
    ActStruck:  (start: 240; frame: 3;  skip: 0;  ftime: 100;  usetick: 0);
    ActDie:     (start: 270; frame: 10; skip: 0;  ftime: 200;  usetick: 0);
    ActDeath:   (start: 270; frame: 10; skip: 0;  ftime: 200;  usetick: 0);
    ActCritical2:(start: 350; frame: 6;  skip: 4;  ftime: 120;  usetick: 0);    //서우
    );
   MA145: TMonsterAction = ( //독인적귀
    ActStand:   (start: 0;   frame: 4;  skip: 6;  ftime: 200;  usetick: 0);
    ActWalk:    (start: 80;  frame: 6;  skip: 4;  ftime: 200;  usetick: 3);
    ActAttack:  (start: 420; frame: 8;  skip: 2;  ftime: 120;  usetick: 0);
    ActCritical:(start: 160; frame: 6;  skip: 4;  ftime: 120;  usetick: 0);
    ActStruck:  (start: 240; frame: 2;  skip: 0;  ftime: 100;  usetick: 0);
    ActDie:     (start: 260; frame: 10; skip: 0;  ftime: 200;  usetick: 0);
    ActDeath:   (start: 260; frame: 10; skip: 0;  ftime: 200;  usetick: 0);
    ActCritical2:(start: 340; frame: 9;  skip: 1;  ftime: 120;  usetick: 0);     //독인적귀
    );
   MA146: TMonsterAction = ( //견빙수호장 마염수호장 암혼수호장 열진수호장
    ActStand:   (start: 0;   frame: 4;  skip: 6;  ftime: 200;  usetick: 0);
    ActWalk:    (start: 80;  frame: 6;  skip: 4;  ftime: 200;  usetick: 3);
    ActAttack:  (start: 160; frame: 6;  skip: 4;  ftime: 120;  usetick: 0);
    ActCritical:(start: 340; frame: 6;  skip: 4;  ftime: 120;  usetick: 0);
    ActStruck:  (start: 240; frame: 2;  skip: 0;  ftime: 100;  usetick: 0);
    ActDie:     (start: 260; frame: 10; skip: 0;  ftime: 200;  usetick: 0);
    ActDeath:   (start: 260; frame: 10; skip: 0;  ftime: 200;  usetick: 0);
    );

   MA147: TMonsterAction = ( //원오
    ActStand:   (start: 0;   frame: 4;  skip: 6;  ftime: 200;  usetick: 0);
    ActWalk:    (start: 80;  frame: 6;  skip: 4;  ftime: 200;  usetick: 3);
    ActAttack:  (start: 160; frame: 6;  skip: 4;  ftime: 120;  usetick: 0);  //일반공격
    ActCritical:(start: 500; frame: 7;  skip: 3;  ftime: 110;  usetick: 0);  //전체 폭발
    ActStruck:  (start: 240; frame: 2;  skip: 0;  ftime: 100;  usetick: 0);
    ActDie:     (start: 260; frame: 10; skip: 0;  ftime: 200;  usetick: 0);
    ActDeath:   (start: 260; frame: 10; skip: 0;  ftime: 200;  usetick: 0);
    ActAttack2:  (start: 340; frame: 6;  skip: 4;  ftime: 120;  usetick: 0); //헤비 공격 L_3
    ActCritical2:(start: 420; frame: 10; skip: 0;  ftime: 100;  usetick: 0);  //소환
    ActCritical3:(start: 580; frame: 7;  skip: 3;  ftime: 120;  usetick: 0);  //바닥손
    );

   MA205: TMonsterAction = (//현월단전사,술사,도사, 전승전사
    ActStand:  (start: 0;      frame: 4;  skip: 4;  ftime: 200;  usetick: 0);
    ActWalk:   (start: 64;     frame: 6;  skip: 2;  ftime: 90;  usetick: 0);
    ActAttack: (start: 200;    frame: 6;  skip: 2;  ftime: 85;  usetick: 0);
    ActCritical:(start: 392;   frame: 6;  skip: 2;  ftime: 60;  usetick: 0);
    ActStruck: (start: 472;    frame: 3;  skip: 5;  ftime: 70;  usetick: 0);
    ActDie:    (start: 536;    frame: 4;  skip: 4;  ftime: 120;  usetick: 0);
    ActDeath:  (start: 536;    frame: 4;  skip: 4;  ftime: 120;  usetick: 0);
    ActCritical2:(start: 328;   frame: 8;  skip: 0;  ftime: 70;  usetick: 0);
    );
   MA206: TMonsterAction = (//현월단자객
    ActStand:  (start: 0;      frame: 4;  skip: 4;  ftime: 200;  usetick: 0);
    ActWalk:   (start: 64;     frame: 6;  skip: 2;  ftime: 90;  usetick: 0);
    ActAttack: (start: 200;    frame: 6;  skip: 2;  ftime: 60;  usetick: 0);
    ActCritical:(start: 600;   frame: 6;  skip: 2;  ftime: 60;  usetick: 0);
    ActStruck: (start: 472;    frame: 3;  skip: 5;  ftime: 70;  usetick: 0);
    ActDie:    (start: 536;    frame: 4;  skip: 4;  ftime: 120;  usetick: 0);
    ActDeath:  (start: 536;    frame: 4;  skip: 4;  ftime: 120;  usetick: 0);
    ActCritical2:(start: 328;   frame: 8;  skip: 0;  ftime: 100;  usetick: 0);
    ActCritical3:(start: 264;   frame: 6;  skip: 2;  ftime: 100;  usetick: 0);
    );

   MA207: TMonsterAction = (//유상궁장
    ActStand:  (start: 0;      frame: 4;  skip: 6;  ftime: 200;  usetick: 0);
    ActWalk:   (start: 80;     frame: 6;  skip: 4;  ftime: 90;  usetick: 0);
    ActAttack: (start: 160;    frame: 9;  skip: 1;  ftime: 85;  usetick: 0);
    ActCritical:(start: 240;   frame: 8;  skip: 2;  ftime: 100;  usetick: 0);
    ActStruck: (start: 320;    frame: 3;  skip: 7;  ftime: 70;  usetick: 0);
    ActDie:    (start: 400;    frame: 9;  skip: 1;  ftime: 120;  usetick: 0);
    ActDeath:  (start: 400;    frame: 9;  skip: 1;  ftime: 120;  usetick: 0);
    );

   MA208: TMonsterAction = (//양용왕
    ActStand:  (start: 0;      frame: 4;  skip: 6;  ftime: 200;  usetick: 0);
    ActWalk:   (start: 80;     frame: 8;  skip: 2;  ftime: 100;  usetick: 0);
    ActAttack: (start: 160;    frame: 8;  skip: 2;  ftime: 80;  usetick: 0);
    ActCritical:(start: 240;   frame: 9;  skip: 1;  ftime: 80;  usetick: 0);
    ActStruck: (start: 800;    frame: 2;  skip: 8;  ftime: 100;  usetick: 0);
    ActDie:    (start: 880;    frame: 10;  skip: 0;  ftime: 160;  usetick: 0);
    ActDeath:  (start: 0;    frame: 0;  skip: 0;  ftime: 0;  usetick: 0);
    ActCritical2:(start: 320;   frame: 10;  skip: 0;  ftime: 120;  usetick: 0);
    ActCritical3:(start: 400;   frame: 10;  skip: 0;  ftime: 100;  usetick: 0);
    ActCritical4:(start: 480;   frame: 9;  skip: 1;  ftime: 70;  usetick: 0);
    ActCritical5:(start: 560;   frame: 10;  skip: 0;  ftime: 100;  usetick: 0);
    ActCritical6:(start: 640;   frame: 9;  skip: 1;  ftime: 100;  usetick: 0);
    ActCritical7:(start: 720;   frame: 10;  skip: 0;  ftime: 200;  usetick: 0);
    );



   MA223: TMonsterAction = ( //마풍석괴
    ActStand:   (start: 0;    frame: 4;  skip: 6;  ftime: 200;  usetick: 0);
    ActWalk:    (start: 80;   frame: 8;  skip: 2;  ftime: 160;  usetick: 3);
    ActAttack:  (start: 160;  frame: 10; skip: 0;  ftime: 90;   usetick: 0);   //기본치기       8040
    ActCritical:(start: 240;  frame: 8;  skip: 2;  ftime: 100;  usetick: 0);   //내려치기       8640 치기
    ActStruck:  (start: 800;  frame: 3;  skip: 7;  ftime: 120;  usetick: 0);
    ActDie:     (start: 880;  frame: 13; skip: 7;  ftime: 150;  usetick: 0);
    ActDeath:   (start: 880;  frame: 13; skip: 7;  ftime: 150;  usetick: 0);
    ActCritical2:(start: 320; frame: 10; skip: 0;  ftime: 90;   usetick: 0);     //돌려서 치기      8200
    ActCritical3:(start: 400; frame: 8;  skip: 2;  ftime: 100;  usetick: 0);     //손들어서 마법    8730기모의고/8740 마법쓰기        // 8540 하고 , 8550 날리기
    ActCritical4:(start: 480; frame: 8;  skip: 2;  ftime: 100;  usetick: 0);
    ActCritical5:(start: 560; frame: 8;  skip: 2;  ftime: 100;  usetick: 0);
    );


   MA240: TMonsterAction = ( //영물 돼지
    ActStand:   (start: 0;    frame: 6;  skip: 4;  ftime: 200;  usetick: 0);
    ActWalk:    (start: 80;   frame: 6;  skip: 4;  ftime: 200;  usetick: 3);
    ActAttack:  (start: 160;  frame: 9;  skip: 1;  ftime: 100;  usetick: 0);
    ActCritical:(start: 240;  frame: 5;  skip: 5;  ftime: 120;  usetick: 0);
    ActStruck:  (start: 0;    frame: 0;  skip: 0;  ftime: 0;    usetick: 0);
    ActDie:     (start: 0;    frame: 0;  skip: 0;  ftime: 0;    usetick: 0);
    ActDeath:   (start: 0;    frame: 0;  skip: 0;  ftime: 0;    usetick: 0);
    ActCritical2:(start: 320; frame: 10; skip: 0;  ftime: 100;  usetick: 0);
    ActCritical3:(start: 400; frame: 10; skip: 0;  ftime: 100;  usetick: 0);
    );
   MA241: TMonsterAction = ( //영물 병아리
    ActStand:   (start: 0;    frame: 4;  skip: 6;  ftime: 200;  usetick: 0);
    ActWalk:    (start: 80;   frame: 6;  skip: 4;  ftime: 200;  usetick: 3);
    ActAttack:  (start: 160;  frame: 10; skip: 0;  ftime: 100;  usetick: 0);
    ActCritical:(start: 240;  frame: 8;  skip: 2;  ftime: 100;  usetick: 0);
    ActStruck:  (start: 0;    frame: 0;  skip: 0;  ftime: 0;    usetick: 0);
    ActDie:     (start: 0;    frame: 0;  skip: 0;  ftime: 0;    usetick: 0);
    ActDeath:   (start: 0;    frame: 0;  skip: 0;  ftime: 0;    usetick: 0);
    ActCritical2:(start: 320; frame: 17; skip: 3;  ftime: 100;  usetick: 0);
    ActCritical3:(start: 480; frame: 9;  skip: 1;  ftime: 100;  usetick: 0);
    );
   MA242: TMonsterAction = ( //영물 괭이
    ActStand:   (start: 0;    frame: 6;  skip: 4;  ftime: 200;  usetick: 0);
    ActWalk:    (start: 80;   frame: 6;  skip: 4;  ftime: 200;  usetick: 3);
    ActAttack:  (start: 160;  frame: 6;  skip: 4;  ftime: 120;  usetick: 0);
    ActCritical:(start: 240;  frame: 10; skip: 0;  ftime: 100;  usetick: 0);
    ActStruck:  (start: 0;    frame: 0;  skip: 0;  ftime: 0;    usetick: 0);
    ActDie:     (start: 0;    frame: 0;  skip: 0;  ftime: 0;    usetick: 0);
    ActDeath:   (start: 0;    frame: 0;  skip: 0;  ftime: 0;    usetick: 0);
    ActCritical2:(start: 320; frame: 10; skip: 0;  ftime: 100;  usetick: 0);
    ActCritical3:(start: 400; frame: 7;  skip: 3;  ftime: 100;  usetick: 0);
    );
   MA243: TMonsterAction = ( //영물 해골투사
    ActStand:   (start: 0;    frame: 4;  skip: 6;  ftime: 200;  usetick: 0);
    ActWalk:    (start: 80;   frame: 6;  skip: 4;  ftime: 200;  usetick: 3);
    ActAttack:  (start: 160;  frame: 7;  skip: 3;  ftime: 100;  usetick: 0);
    ActCritical:(start: 240;  frame: 10; skip: 0;  ftime: 100;  usetick: 0);
    ActStruck:  (start: 0;    frame: 0;  skip: 0;  ftime: 0;    usetick: 0);
    ActDie:     (start: 0;    frame: 0;  skip: 0;  ftime: 0;    usetick: 0);
    ActDeath:   (start: 0;    frame: 0;  skip: 0;  ftime: 0;    usetick: 0);
    ActCritical2:(start: 320; frame: 8;  skip: 2;  ftime: 100;  usetick: 0);
    ActCritical3:(start: 400; frame: 20; skip: 0;  ftime: 100;  usetick: 0);
    );
   MA244: TMonsterAction = ( //영물 백돈
    ActStand:   (start: 0;    frame: 6;  skip: 4;  ftime: 200;  usetick: 0);
    ActWalk:    (start: 80;   frame: 6;  skip: 4;  ftime: 200;  usetick: 3);
    ActAttack:  (start: 160;  frame: 6;  skip: 4;  ftime: 100;  usetick: 0);
    ActCritical:(start: 240;  frame: 10; skip: 0;  ftime: 100;  usetick: 0);
    ActStruck:  (start: 0;    frame: 0;  skip: 0;  ftime: 0;    usetick: 0);
    ActDie:     (start: 0;    frame: 0;  skip: 0;  ftime: 0;    usetick: 0);
    ActDeath:   (start: 0;    frame: 0;  skip: 0;  ftime: 0;    usetick: 0);
    ActCritical2:(start: 320; frame: 7;  skip: 3;  ftime: 100;  usetick: 0);
    ActCritical3:(start: 400; frame: 5;  skip: 5;  ftime: 120;  usetick: 0);
    );
   MA245: TMonsterAction = ( //영물 위맨
    ActStand:   (start: 0;    frame: 4;  skip: 6;  ftime: 200;  usetick: 0);
    ActWalk:    (start: 80;   frame: 8;  skip: 2;  ftime: 200;  usetick: 3);
    ActAttack:  (start: 160;  frame: 7;  skip: 3;  ftime: 100;  usetick: 0);
    ActCritical:(start: 240;  frame: 10; skip: 0;  ftime: 100;  usetick: 0);
    ActStruck:  (start: 0;    frame: 0;  skip: 0;  ftime: 0;    usetick: 0);
    ActDie:     (start: 0;    frame: 0;  skip: 0;  ftime: 0;    usetick: 0);
    ActDeath:   (start: 0;    frame: 0;  skip: 0;  ftime: 0;    usetick: 0);
    ActCritical2:(start: 320; frame: 6;  skip: 4;  ftime: 100;  usetick: 0);
    ActCritical3:(start: 400; frame: 4;  skip: 6;  ftime: 120;  usetick: 0);
    );
   MA246: TMonsterAction = ( //영물 고양이
    ActStand:   (start: 0;    frame: 6;  skip: 4;  ftime: 200;  usetick: 0);
    ActWalk:    (start: 80;   frame: 6;  skip: 4;  ftime: 200;  usetick: 3);
    ActAttack:  (start: 160;  frame: 6;  skip: 4;  ftime: 100;  usetick: 0);
    ActCritical:(start: 240;  frame: 10; skip: 0;  ftime: 100;  usetick: 0);
    ActStruck:  (start: 0;    frame: 0;  skip: 0;  ftime: 0;    usetick: 0);
    ActDie:     (start: 0;    frame: 0;  skip: 0;  ftime: 0;    usetick: 0);
    ActDeath:   (start: 0;    frame: 0;  skip: 0;  ftime: 0;    usetick: 0);
    ActCritical2:(start: 320; frame: 10; skip: 0;  ftime: 100;  usetick: 0);
    ActCritical3:(start: 400; frame: 7;  skip: 3;  ftime: 100;  usetick: 0);
    );
   MA247: TMonsterAction = ( //영물 어린흑룡
    ActStand:   (start: 0;    frame: 6;  skip: 4;  ftime: 200;  usetick: 0);
    ActWalk:    (start: 80;   frame: 6;  skip: 4;  ftime: 200;  usetick: 3);
    ActAttack:  (start: 160;  frame: 7;  skip: 3;  ftime: 100;  usetick: 0);
    ActCritical:(start: 240;  frame: 6;  skip: 4;  ftime: 100;  usetick: 0);
    ActStruck:  (start: 0;    frame: 0;  skip: 0;  ftime: 0;    usetick: 0);
    ActDie:     (start: 0;    frame: 0;  skip: 0;  ftime: 0;    usetick: 0);
    ActDeath:   (start: 0;    frame: 0;  skip: 0;  ftime: 0;    usetick: 0);
    ActCritical2:(start: 320; frame: 10; skip: 0;  ftime: 100;  usetick: 0);
    ActCritical3:(start: 240; frame: 6;  skip: 4;  ftime: 100;  usetick: 0);
    );
    MA248: TMonsterAction = ( //영물 오색알
      ActStand:   (start: 0;    frame: 6;  skip: 4;  ftime: 200;  usetick: 0);
      ActWalk:    (start: 80;   frame: 6;  skip: 4;  ftime: 200;  usetick: 3);
      ActAttack:  (start: 160;  frame: 2;  skip: 8;  ftime: 100;  usetick: 0);
      ActCritical:(start: 240;  frame: 8;  skip: 2;  ftime: 100;  usetick: 0);
      ActStruck:  (start: 0;    frame: 0;  skip: 0;  ftime: 0;    usetick: 0);
      ActDie:     (start: 0;    frame: 0;  skip: 0;  ftime: 0;    usetick: 0);
      ActDeath:   (start: 0;    frame: 0;  skip: 0;  ftime: 0;    usetick: 0);
      ActCritical2:(start: 320; frame: 10; skip: 0;  ftime: 100;  usetick: 0);
      ActCritical3:(start: 240; frame: 8;  skip: 2;  ftime: 100;  usetick: 0);
    );
    MA249: TMonsterAction = ( //영물 겨울눈사람
        ActStand:   (start: 0;    frame: 6;  skip: 4;  ftime: 200;  usetick: 0);
        ActWalk:    (start: 80;   frame: 7;  skip: 3;  ftime: 200;  usetick: 3);
        ActAttack:  (start: 160;  frame: 6;  skip: 4;  ftime: 100;  usetick: 0);
        ActCritical:(start: 240;  frame: 7;  skip: 3;  ftime: 100;  usetick: 0);
        ActStruck:  (start: 0;    frame: 0;  skip: 0;  ftime: 0;    usetick: 0);
        ActDie:     (start: 0;    frame: 0;  skip: 0;  ftime: 0;    usetick: 0);
        ActDeath:   (start: 0;    frame: 0;  skip: 0;  ftime: 0;    usetick: 0);
        ActCritical2:(start: 240; frame: 7;  skip: 3;  ftime: 100;  usetick: 0);
        ActCritical3:(start: 240; frame: 7;  skip: 3;  ftime: 100;  usetick: 0);
    );
    MA250: TMonsterAction = ( //영물 개구리
        ActStand:   (start: 0;    frame: 6;  skip: 4;  ftime: 200;  usetick: 0);
        ActWalk:    (start: 80;   frame: 6;  skip: 4;  ftime: 200;  usetick: 3);
        ActAttack:  (start: 160;  frame: 6;  skip: 4;  ftime: 100;  usetick: 0);
        ActCritical:(start: 240;  frame: 8;  skip: 2;  ftime: 100;  usetick: 0);
        ActStruck:  (start: 0;    frame: 0;  skip: 0;  ftime: 0;    usetick: 0);
        ActDie:     (start: 0;    frame: 0;  skip: 0;  ftime: 0;    usetick: 0);
        ActDeath:   (start: 0;    frame: 0;  skip: 0;  ftime: 0;    usetick: 0);
        ActCritical2:(start: 320; frame: 9;  skip: 1;  ftime: 100;  usetick: 0);
        ActCritical3:(start: 400; frame: 7;  skip: 3;  ftime: 100;  usetick: 0);
    );
    MA251: TMonsterAction = ( //영물 원숭이
        ActStand:   (start: 0;    frame: 6;  skip: 4;  ftime: 200;  usetick: 0);
        ActWalk:    (start: 80;   frame: 6;  skip: 4;  ftime: 200;  usetick: 3);
        ActAttack:  (start: 160;  frame: 8;  skip: 2;  ftime: 100;  usetick: 0);
        ActCritical:(start: 240;  frame: 8;  skip: 2;  ftime: 100;  usetick: 0);
        ActStruck:  (start: 0;    frame: 0;  skip: 0;  ftime: 0;    usetick: 0);
        ActDie:     (start: 0;    frame: 0;  skip: 0;  ftime: 0;    usetick: 0);
        ActDeath:   (start: 0;    frame: 0;  skip: 0;  ftime: 0;    usetick: 0);
        ActCritical2:(start: 320; frame: 9;  skip: 1;  ftime: 100;  usetick: 0);
        ActCritical3:(start: 400; frame: 9;  skip: 1;  ftime: 100;  usetick: 0);
    );
   MA280: TMonsterAction = (//빙원귀
      ActStand:  (start: 0;      frame: 4;  skip: 6;  ftime: 200;  usetick: 0);
      ActWalk:   (start: 80;     frame: 6;  skip: 4;  ftime: 90;  usetick: 0);
      ActAttack: (start: 160;    frame: 9;  skip: 1;  ftime: 85;  usetick: 0);
      ActCritical:(start: 0;     frame: 0;  skip: 0;  ftime: 0;  usetick: 0);
      ActStruck: (start: 240;    frame: 3;  skip: 7;  ftime: 70;  usetick: 0);
      ActDie:    (start: 320;    frame: 10;  skip: 0;  ftime: 120;  usetick: 0);
      ActDeath:  (start: 320;    frame: 10;  skip: 0;  ftime: 120;  usetick: 0);
    );
   MA282: TMonsterAction = (//빙원귀궁사
      ActStand:  (start: 0;      frame: 4;  skip: 6;  ftime: 200;  usetick: 0);
      ActWalk:   (start: 80;     frame: 6;  skip: 4;  ftime: 90;  usetick: 0);
      ActAttack: (start: 0;    frame: 0;  skip: 0;  ftime: 0;  usetick: 0);
      ActCritical:(start: 160;   frame: 10;  skip: 0;  ftime: 100;  usetick: 0);
      ActStruck: (start: 240;    frame: 3;  skip: 7;  ftime: 70;  usetick: 0);
      ActDie:    (start: 320;    frame: 10;  skip: 0;  ftime: 120;  usetick: 0);
      ActDeath:  (start: 320;    frame: 10;  skip: 0;  ftime: 120;  usetick: 0);
    );
   MA283: TMonsterAction = (//빙원귀존
      ActStand:  (start: 0;      frame: 4;  skip: 6;  ftime: 200;  usetick: 0);
      ActWalk:   (start: 80;     frame: 8;  skip: 2;  ftime: 90;  usetick: 0);
      ActAttack: (start: 160;    frame: 10;  skip: 0;  ftime: 90;  usetick: 0);
      ActCritical:(start: 240;   frame: 10;  skip: 0;  ftime: 100;  usetick: 0);
      ActStruck: (start: 320;    frame: 3;  skip: 7;  ftime: 70;  usetick: 0);
      ActDie:    (start: 400;    frame: 10;  skip: 0;  ftime: 120;  usetick: 0);
      ActDeath:  (start: 400;    frame: 10;  skip: 0;  ftime: 120;  usetick: 0);
    );
   MA284: TMonsterAction = (//설악귀
      ActStand:  (start: 0;      frame: 4;  skip: 6;  ftime: 200;  usetick: 0);
      ActWalk:   (start: 80;     frame: 6;  skip: 4;  ftime: 90;  usetick: 0);
      ActAttack: (start: 160;    frame: 8;  skip: 2;  ftime: 100;  usetick: 0);
      ActCritical:(start: 0;     frame: 0;  skip: 0;  ftime: 0;  usetick: 0);
      ActStruck: (start: 240;    frame: 3;  skip: 7;  ftime: 70;  usetick: 0);
      ActDie:    (start: 320;    frame: 13;  skip: 7;  ftime: 120;  usetick: 0);
      ActDeath:  (start: 320;    frame: 13;  skip: 7;  ftime: 120;  usetick: 0);
    );
   MA285: TMonsterAction = (//악귀
      ActStand:  (start: 0;      frame: 4;  skip: 6;  ftime: 200;  usetick: 0);
      ActWalk:   (start: 80;     frame: 6;  skip: 4;  ftime: 90;  usetick: 0);
      ActAttack: (start: 160;    frame: 9;  skip: 1;  ftime: 100;  usetick: 0);
      ActCritical:(start: 240;   frame: 8;  skip: 2;  ftime: 100;  usetick: 0);
      ActStruck: (start: 320;    frame: 3;  skip: 7;  ftime: 70;  usetick: 0);
      ActDie:    (start: 400;    frame: 10;  skip: 0;  ftime: 120;  usetick: 0);
      ActDeath:  (start: 400;    frame: 10;  skip: 0;  ftime: 120;  usetick: 0);
    );
   MA286: TMonsterAction = (//설랑
      ActStand:  (start: 0;      frame: 4;  skip: 6;  ftime: 200;  usetick: 0);
      ActWalk:   (start: 80;     frame: 6;  skip: 4;  ftime: 90;  usetick: 0);
      ActAttack: (start: 160;    frame: 10;  skip: 0;  ftime: 80;  usetick: 0);
      ActCritical:(start: 240;   frame: 9;  skip: 1;  ftime: 120;  usetick: 0);
      ActStruck: (start: 320;    frame: 3;  skip: 7;  ftime: 70;  usetick: 0);
      ActDie:    (start: 400;    frame: 9;  skip: 1;  ftime: 120;  usetick: 0);
      ActDeath:  (start: 400;    frame: 9;  skip: 1;  ftime: 120;  usetick: 0);
    );
   MA287: TMonsterAction = (//설태랑
      ActStand:  (start: 0;      frame: 4;  skip: 6;  ftime: 200;  usetick: 0);
      ActWalk:   (start: 80;     frame: 8;  skip: 2;  ftime: 90;  usetick: 0);
      ActAttack: (start: 160;    frame: 8;  skip: 2;  ftime: 90;  usetick: 0);   //hit  //일반 내리치기
      ActCritical:(start: 240;   frame: 9;  skip: 1;  ftime: 120;  usetick: 0);  //lighting  포효하는
      ActStruck: (start: 480;    frame: 3;  skip: 7;  ftime: 70;  usetick: 0);
      ActDie:    (start: 560;    frame: 10;  skip: 0;  ftime: 120;  usetick: 0);
      ActDeath:  (start: 560;    frame: 10;  skip: 0;  ftime: 120;  usetick: 0);
      ActCritical2: (start: 320;    frame: 10;  skip: 0;  ftime: 90;  usetick: 0);  //lighting2 내리치는
      ActCritical3: (start: 400;   frame: 5;  skip: 5;  ftime: 90;  usetick: 0);  //lighting3  짧게
    );

   WORDER: Array[0..1, 0..599] of byte = (    //1: 칼이 앞으로,  0: 칼이 뒤로
      (      //남자
      //정지 ActStand
      0,0,0,0,0,0,0,0,    1,1,1,1,1,1,1,1,    1,1,1,1,1,1,1,1,
      1,1,1,1,1,1,1,1,    0,0,0,0,0,0,0,0,    0,0,0,0,1,1,1,1,
      0,0,0,0,1,1,1,1,    0,0,0,0,1,1,1,1,
      //걷기 ActWalk
      0,0,0,0,0,0,0,0,    1,1,1,1,1,1,1,1,    1,1,1,1,1,1,1,1,
      1,1,1,1,1,1,1,1,    0,0,0,0,0,0,0,0,    0,0,0,0,0,0,0,1,
      0,0,0,0,0,0,0,1,    0,0,0,0,0,0,0,1,
      //뛰기 ActRun
      0,0,0,0,0,0,0,0,    1,1,1,1,1,1,1,1,    1,1,1,1,1,1,1,1,
      1,1,1,1,1,1,1,1,    0,0,1,1,1,1,1,1,    0,0,1,1,1,0,0,1,
      0,0,0,0,0,0,0,1,    0,0,0,0,0,0,0,1,
      //war모드  ActWarMode
      0,1,1,1,0,0,0,0,
      //공격 ActHit
      1,1,1,0,0,0,1,1,    1,1,1,0,0,0,0,0,    1,1,1,0,0,0,0,0,
      1,1,1,1,1,1,1,1,    1,1,1,1,1,1,1,1,    1,1,1,0,0,0,0,0,
      0,0,0,0,0,0,0,0,    1,1,1,1,0,0,1,1,
      //공격 2 ActHeavyHit
      0,1,1,0,0,0,1,1,    0,1,1,0,0,0,1,1,    1,1,1,0,0,0,0,0,
      1,1,1,0,0,1,1,1,    1,1,1,1,1,1,1,1,    0,1,1,1,1,1,1,1,
      0,0,0,1,1,1,0,0,    0,1,1,1,1,0,1,1,
      //공격3  ActBigHit
      1,1,0,1,0,0,0,0,    1,1,0,0,0,0,0,0,    1,1,1,1,1,0,0,0,
      1,1,0,0,1,0,0,0,    1,1,1,0,0,0,0,1,    0,1,1,0,0,0,0,0,
      0,0,0,0,1,1,1,0,    1,1,1,1,1,0,0,0,
       //마법  ActSpell
      0,0,0,0,0,0,1,1,    0,0,0,0,0,0,1,1,    0,0,0,0,0,0,1,1,
      1,0,0,0,0,1,1,1,    1,1,1,1,1,1,1,1,    0,1,1,1,1,1,1,1,
      0,0,1,1,0,0,1,1,    0,0,0,1,0,0,1,1,
      //앚기  ActSitdown
      0,0,1,0,1,1,1,1,    1,1,0,0,0,1,0,0,
      //맞기  ActStruck
      0,0,0,1,1,1,1,1,    1,1,1,1,1,1,1,1,    1,1,1,1,1,1,1,1,
      1,1,1,1,1,1,1,1,    0,0,0,1,1,1,1,1,    0,0,0,1,1,1,1,1,
      0,0,0,1,1,1,1,1,    0,0,0,1,1,1,1,1,
      //쓰러짐 ActDie
      0,0,1,1,1,1,1,1,    0,1,1,1,1,1,1,1,    1,1,1,1,1,1,1,1,
      1,1,1,1,1,1,1,1,    0,0,0,1,1,1,1,1,    0,0,0,1,1,1,1,1,
      0,0,0,1,1,1,1,1,    0,0,0,1,1,1,1,1
      ),

      (
      //정지
      0,0,0,0,0,0,0,0,    1,1,1,1,1,1,1,1,    1,1,1,1,1,1,1,1,
      1,1,1,1,1,1,1,1,    0,0,0,0,0,0,0,0,    0,0,0,0,1,1,1,1,
      0,0,0,0,1,1,1,1,    0,0,0,0,1,1,1,1,
      //걷기
      0,0,0,0,0,0,0,0,    1,1,1,1,1,1,1,1,    1,1,1,1,1,1,1,1,
      1,1,1,1,1,1,1,1,    0,0,0,0,0,0,0,0,    0,0,0,0,0,0,0,1,
      0,0,0,0,0,0,0,1,    0,0,0,0,0,0,0,1,
      //뛰기
      0,0,0,0,0,0,0,0,    1,1,1,1,1,1,1,1,    1,1,1,1,1,1,1,1,
      1,1,1,1,1,1,1,1,    0,0,1,1,1,1,1,1,    0,0,1,1,1,0,0,1,
      0,0,0,0,0,0,0,1,    0,0,0,0,0,0,0,1,
      //war모드
      1,1,1,1,0,0,0,0,
      //공격
      1,1,1,0,0,0,1,1,    1,1,1,0,0,0,0,0,    1,1,1,0,0,0,0,0,
      1,1,1,1,1,1,1,1,    1,1,1,1,1,1,1,1,    1,1,1,0,0,0,0,0,
      0,0,0,0,0,0,0,0,    1,1,1,1,0,0,1,1,
      //공격 2
      0,1,1,0,0,0,1,1,    0,1,1,0,0,0,1,1,    1,1,1,0,0,0,0,0,
      1,1,1,0,0,1,1,1,    1,1,1,1,1,1,1,1,    0,1,1,1,1,1,1,1,
      0,0,0,1,1,1,0,0,    0,1,1,1,1,0,1,1,
      //공격3
      1,1,0,1,0,0,0,0,    1,1,0,0,0,0,0,0,    1,1,1,1,1,0,0,0,
      1,1,0,0,1,0,0,0,    1,1,1,0,0,0,0,1,    0,1,1,0,0,0,0,0,
      0,0,0,0,1,1,1,0,    1,1,1,1,1,0,0,0,
      //마법
      0,0,0,0,0,0,1,1,    0,0,0,0,0,0,1,1,    0,0,0,0,0,0,1,1,
      1,0,0,0,0,1,1,1,    1,1,1,1,1,1,1,1,    0,1,1,1,1,1,1,1,
      0,0,1,1,0,0,1,1,    0,0,0,1,0,0,1,1,
      //앚기
      0,0,1,0,1,1,1,1,    1,1,0,0,0,1,0,0,
      //맞기
      0,0,0,1,1,1,1,1,    1,1,1,1,1,1,1,1,    1,1,1,1,1,1,1,1,
      1,1,1,1,1,1,1,1,    0,0,0,1,1,1,1,1,    0,0,0,1,1,1,1,1,
      0,0,0,1,1,1,1,1,    0,0,0,1,1,1,1,1,
      //쓰러짐
      0,0,1,1,1,1,1,1,    0,1,1,1,1,1,1,1,    1,1,1,1,1,1,1,1,
      1,1,1,1,1,1,1,1,    0,0,0,1,1,1,1,1,    0,0,0,1,1,1,1,1,
      0,0,0,1,1,1,1,1,    0,0,0,1,1,1,1,1
      )
   );

   WORDER2: Array[0..1, 0..599] of byte = (          //1: 칼이 앞으로,  0: 칼이 뒤로   벽혈전사 전용
      (       //남자
      1,1,1,1,1,1,1,1,    1,1,1,1,1,1,1,1,    1,1,1,1,1,1,1,1,
      1,1,1,1,1,1,1,1,    0,0,0,0,0,0,0,0,    0,0,0,0,1,1,1,1,
      0,0,0,0,1,1,1,1,    1,1,1,1,1,1,1,1,

      1,1,1,1,1,1,0,0,    1,1,1,1,1,1,1,1,    1,1,1,1,1,1,1,1,
      1,1,1,1,1,1,1,1,    0,0,0,0,0,0,0,0,    0,0,0,0,0,0,0,1,
      0,0,0,0,0,0,0,1,    0,0,0,0,0,0,0,1,

      1,1,1,1,1,1,0,0,    1,1,1,1,1,1,1,1,    1,1,1,1,1,1,1,1,
      1,1,1,1,1,1,1,1,    0,0,1,1,1,1,1,1,    0,0,1,1,1,0,0,1,
      0,0,0,0,0,0,0,1,    0,0,0,0,0,0,0,1,

      0,1,1,1,0,0,0,0,

      1,1,1,0,0,0,1,1,    1,1,1,0,0,0,0,0,    1,1,1,0,0,0,0,0,
      1,1,1,1,1,1,1,1,    1,1,1,1,1,1,1,1,    1,1,1,0,0,0,0,0,
      0,0,0,0,0,0,0,0,    1,1,1,1,0,0,1,1,

      0,1,1,0,0,0,1,1,    0,1,1,0,0,0,1,1,    1,1,1,0,0,0,0,0,
      1,1,1,0,0,1,1,1,    1,1,1,1,1,1,1,1,    0,1,1,1,1,1,1,1,
      0,0,0,1,1,1,0,0,    0,1,1,1,1,0,1,1,

      1,1,0,1,0,0,0,0,    1,1,0,0,0,0,0,0,    1,1,1,1,1,0,0,0,
      1,1,0,0,1,0,0,0,    1,1,1,0,0,0,0,1,    0,1,1,0,0,0,0,0,
      0,0,0,0,1,1,1,0,    1,1,1,1,1,0,0,0,

      0,0,0,0,0,0,1,1,    0,0,0,0,0,0,1,1,    0,0,0,0,0,0,1,1,
      1,0,0,0,0,1,1,1,    1,1,1,1,1,1,1,1,    0,1,1,1,1,1,1,1,
      0,0,1,1,0,0,1,1,    0,0,0,1,0,0,1,1,

      0,0,1,0,1,1,1,1,    1,1,0,0,0,1,0,0,

      0,0,0,1,1,1,1,1,    1,1,1,1,1,1,1,1,    1,1,1,1,1,1,1,1,
      1,1,1,1,1,1,1,1,    0,0,0,1,1,1,1,1,    0,0,0,1,1,1,1,1,
      0,0,0,1,1,1,1,1,    0,0,0,1,1,1,1,1,

      0,0,1,1,1,1,1,1,    0,1,1,1,1,1,1,1,    1,1,1,1,1,1,1,1,
      1,1,1,1,1,1,1,1,    0,0,0,1,1,1,1,1,    0,0,0,1,1,1,1,1,
      0,0,0,1,1,1,1,1,    0,0,0,1,1,1,1,1
      ),

      (     //여자

      1,1,1,1,1,1,1,1,    1,1,1,1,1,1,1,1,    1,1,1,1,1,1,1,1,
      1,1,1,1,1,1,1,1,    0,0,0,0,0,0,0,0,    0,0,0,0,1,1,1,1,
      0,0,0,0,1,1,1,1,    0,0,0,0,1,1,1,1,

      1,1,1,1,1,1,0,0,    1,1,1,1,1,1,1,1,    1,1,1,1,1,1,1,1,
      1,1,1,1,1,1,1,1,    0,0,0,0,0,0,0,0,    0,0,0,0,0,0,0,1,
      0,0,0,0,0,0,0,1,    0,0,0,0,0,0,0,1,

      1,1,1,1,1,1,0,0,    1,1,1,1,1,1,1,1,    1,1,1,1,1,1,1,1,
      1,1,1,1,1,1,1,1,    0,0,1,1,1,1,1,1,    0,0,1,1,1,0,0,1,
      0,0,0,0,0,0,0,1,    0,0,0,0,0,0,0,1,

      1,1,1,1,0,0,0,0,

      1,1,1,0,0,0,1,1,    1,1,1,0,0,0,0,0,    1,1,1,0,0,0,0,0,
      1,1,1,1,1,1,1,1,    1,1,1,1,1,1,1,1,    1,1,1,0,0,0,0,0,
      0,0,0,0,0,0,0,0,    1,1,1,1,0,0,1,1,

      0,1,1,0,0,0,1,1,    0,1,1,0,0,0,1,1,    1,1,1,0,0,0,0,0,
      1,1,1,0,0,1,1,1,    1,1,1,1,1,1,1,1,    0,1,1,1,1,1,1,1,
      0,0,0,1,1,1,0,0,    0,1,1,1,1,0,1,1,

      1,1,0,1,0,0,0,0,    1,1,0,0,0,0,0,0,    1,1,1,1,1,0,0,0,
      1,1,0,0,1,0,0,0,    1,1,1,0,0,0,0,1,    0,1,1,0,0,0,0,0,
      0,0,0,0,1,1,1,0,    1,1,1,1,1,0,0,0,

      0,0,0,0,0,0,1,1,    0,0,0,0,0,0,1,1,    0,0,0,0,0,0,1,1,
      1,0,0,0,0,1,1,1,    1,1,1,1,1,1,1,1,    0,1,1,1,1,1,1,1,
      0,0,1,1,0,0,1,1,    0,0,0,1,0,0,1,1,

      0,0,1,0,1,1,1,1,    1,1,0,0,0,1,0,0,

      0,0,0,1,1,1,1,1,    1,1,1,1,1,1,1,1,    1,1,1,1,1,1,1,1,
      1,1,1,1,1,1,1,1,    0,0,0,1,1,1,1,1,    0,0,0,1,1,1,1,1,
      0,0,0,1,1,1,1,1,    0,0,0,1,1,1,1,1,

      0,0,1,1,1,1,1,1,    0,1,1,1,1,1,1,1,    1,1,1,1,1,1,1,1,
      1,1,1,1,1,1,1,1,    0,0,0,1,1,1,1,1,    0,0,0,1,1,1,1,1,
      0,0,0,1,1,1,1,1,    0,0,0,1,1,1,1,1
      )
   );


   WORDER3: Array[0..1, 0..599] of byte = (          //1: 칼이 앞으로,  0: 칼이 뒤로   익선도사 전용
      (       //남자
      1,1,1,1,1,1,1,1,    1,1,1,1,1,1,1,1,    1,1,1,1,1,1,1,1,
      1,1,1,1,1,1,1,1,    1,1,1,1,1,1,1,1,    1,1,1,1,1,1,1,1,
      1,1,1,1,1,1,1,1,    1,1,1,1,1,1,1,1,

      1,1,1,1,1,1,0,0,    1,1,1,1,1,1,1,1,    1,1,1,1,1,1,1,1,
      1,1,1,1,1,1,1,1,    0,0,0,0,0,0,0,0,    0,0,0,0,0,0,0,1,
      0,0,0,0,0,0,0,1,    0,0,0,0,0,0,0,1,

      1,1,1,1,1,1,0,0,    1,1,1,1,1,1,1,1,    1,1,1,1,1,1,1,1,
      1,1,1,1,1,1,1,1,    0,0,1,1,1,1,1,1,    0,0,1,1,1,0,0,1,
      0,0,0,0,0,0,0,1,    0,0,0,0,0,0,0,1,

      0,1,1,1,0,0,0,0,

      1,1,1,0,0,0,1,1,    1,1,1,0,0,0,0,0,    1,1,1,0,0,0,0,0,
      1,1,1,1,1,1,1,1,    1,1,1,1,1,1,1,1,    1,1,1,0,0,0,0,0,
      0,0,0,0,0,0,0,0,    1,1,1,1,0,0,1,1,

      0,1,1,0,0,0,1,1,    0,1,1,0,0,0,1,1,    1,1,1,0,0,0,0,0,
      1,1,1,0,0,1,1,1,    1,1,1,1,1,1,1,1,    0,1,1,1,1,1,1,1,
      0,0,0,1,1,1,0,0,    0,1,1,1,1,0,1,1,

      1,1,0,1,0,0,0,0,    1,1,0,0,0,0,0,0,    1,1,1,1,1,0,0,0,
      1,1,0,0,1,0,0,0,    1,1,1,0,0,0,0,1,    0,1,1,0,0,0,0,0,
      0,0,0,0,1,1,1,0,    1,1,1,1,1,0,0,0,

      0,0,0,0,0,0,1,1,    0,0,0,0,0,0,1,1,    0,0,0,0,0,0,1,1,
      1,0,0,0,0,1,1,1,    1,1,1,1,1,1,1,1,    0,1,1,1,1,1,1,1,
      0,0,1,1,0,0,1,1,    0,0,0,1,0,0,1,1,

      0,0,1,0,1,1,1,1,    1,1,0,0,0,1,0,0,

      0,0,0,1,1,1,1,1,    1,1,1,1,1,1,1,1,    1,1,1,1,1,1,1,1,
      1,1,1,1,1,1,1,1,    0,0,0,1,1,1,1,1,    0,0,0,1,1,1,1,1,
      0,0,0,1,1,1,1,1,    0,0,0,1,1,1,1,1,

      0,0,1,1,1,1,1,1,    0,1,1,1,1,1,1,1,    1,1,1,1,1,1,1,1,
      1,1,1,1,1,1,1,1,    0,0,0,1,1,1,1,1,    0,0,0,1,1,1,1,1,
      0,0,0,1,1,1,1,1,    0,0,0,1,1,1,1,1
      ),

      (     //여자

      1,1,1,1,1,1,1,1,    1,1,1,1,1,1,1,1,    1,1,1,1,1,1,1,1,
      1,1,1,1,1,1,1,1,    1,1,1,1,1,1,1,1,    1,1,1,1,1,1,1,1,
      1,1,1,1,1,1,1,1,    1,1,1,1,1,1,1,1,

      1,1,1,1,1,1,0,0,    1,1,1,1,1,1,1,1,    1,1,1,1,1,1,1,1,
      1,1,1,1,1,1,1,1,    0,0,0,0,0,0,0,0,    0,0,0,0,0,0,0,1,
      0,0,0,0,0,0,0,1,    0,0,0,0,0,0,0,1,

      1,1,1,1,1,1,0,0,    1,1,1,1,1,1,1,1,    1,1,1,1,1,1,1,1,
      1,1,1,1,1,1,1,1,    0,0,1,1,1,1,1,1,    0,0,1,1,1,0,0,1,
      0,0,0,0,0,0,0,1,    0,0,0,0,0,0,0,1,

      1,1,1,1,0,0,0,0,

      1,1,1,0,0,0,1,1,    1,1,1,0,0,0,0,0,    1,1,1,0,0,0,0,0,
      1,1,1,1,1,1,1,1,    1,1,1,1,1,1,1,1,    1,1,1,0,0,0,0,0,
      0,0,0,0,0,0,0,0,    1,1,1,1,0,0,1,1,

      0,1,1,0,0,0,1,1,    0,1,1,0,0,0,1,1,    1,1,1,0,0,0,0,0,
      1,1,1,0,0,1,1,1,    1,1,1,1,1,1,1,1,    0,1,1,1,1,1,1,1,
      0,0,0,1,1,1,0,0,    0,1,1,1,1,0,1,1,

      1,1,0,1,0,0,0,0,    1,1,0,0,0,0,0,0,    1,1,1,1,1,0,0,0,
      1,1,0,0,1,0,0,0,    1,1,1,0,0,0,0,1,    0,1,1,0,0,0,0,0,
      0,0,0,0,1,1,1,0,    1,1,1,1,1,0,0,0,

      0,0,0,0,0,0,1,1,    0,0,0,0,0,0,1,1,    0,0,0,0,0,0,1,1,
      1,0,0,0,0,1,1,1,    1,1,1,1,1,1,1,1,    0,1,1,1,1,1,1,1,
      0,0,1,1,0,0,1,1,    0,0,0,1,0,0,1,1,

      0,0,1,0,1,1,1,1,    1,1,0,0,0,1,0,0,

      0,0,0,1,1,1,1,1,    1,1,1,1,1,1,1,1,    1,1,1,1,1,1,1,1,
      1,1,1,1,1,1,1,1,    0,0,0,1,1,1,1,1,    0,0,0,1,1,1,1,1,
      0,0,0,1,1,1,1,1,    0,0,0,1,1,1,1,1,

      0,0,1,1,1,1,1,1,    0,1,1,1,1,1,1,1,    1,1,1,1,1,1,1,1,
      1,1,1,1,1,1,1,1,    0,0,0,1,1,1,1,1,    0,0,0,1,1,1,1,1,
      0,0,0,1,1,1,1,1,    0,0,0,1,1,1,1,1
      )
   );

   WORDER4: Array[0..1, 0..599] of byte = (    //1: 칼이 앞으로,  0: 칼이 뒤로
      (      //남자
      //정지 ActStand
      0,0,0,0,1,1,1,1,    1,1,1,1,1,1,1,1,    1,1,1,1,1,1,1,1,
      0,0,0,0,1,1,1,1,    0,0,0,0,0,0,0,0,    0,0,0,0,1,1,1,1,
      1,1,1,1,1,1,1,1,    1,1,1,1,1,1,1,1,
      //걷기 ActWalk
      0,0,0,0,0,0,0,0,    1,1,1,1,1,1,1,1,    0,0,1,1,1,1,1,1,
      0,0,0,0,0,0,1,1,    0,0,0,0,0,0,0,0,    0,0,0,0,0,0,1,1,
      1,1,1,1,1,1,1,1,    1,1,1,1,1,1,1,1,
      //뛰기
      1,1,1,1,1,1,0,0,    1,1,1,1,1,1,1,1,    1,1,1,1,1,1,1,1,
      1,1,1,1,1,1,1,1,    0,0,1,1,1,1,1,1,    0,0,1,1,1,0,0,1,
      0,0,0,0,0,0,0,1,    0,0,0,0,0,0,0,1,
      //war모드  ActWarMode
      0,1,1,1,0,0,0,0,
      //공격 ActHit
      1,1,1,0,0,0,1,1,    1,1,1,0,0,0,0,0,    1,1,1,0,0,0,0,0,
      1,1,1,1,1,1,1,1,    1,1,1,1,1,1,1,1,    1,1,1,0,0,0,0,0,
      0,0,0,0,0,0,0,0,    1,1,1,1,0,0,1,1,
      //공격 2 ActHeavyHit
      0,1,1,0,0,0,1,1,    0,1,1,0,0,0,1,1,    1,1,1,0,0,0,0,0,
      1,1,1,0,0,1,1,1,    1,1,1,1,1,1,1,1,    0,1,1,1,1,1,1,1,
      0,0,0,1,1,1,0,0,    0,1,1,1,1,0,1,1,
      //공격3  ActBigHit
      1,1,0,1,0,0,0,0,    1,1,0,0,0,0,0,0,    1,1,1,1,1,0,0,0,
      1,1,0,0,1,0,0,0,    1,1,1,0,0,0,0,1,    0,1,1,0,0,0,0,0,
      0,0,0,0,1,1,1,0,    1,1,1,1,1,0,0,0,
       //마법  ActSpell
      0,0,0,0,0,0,1,1,    0,0,0,0,0,0,1,1,    0,0,0,0,0,0,1,1,
      1,0,0,0,0,1,1,1,    1,1,1,1,1,1,1,1,    0,1,1,1,1,1,1,1,
      0,0,1,1,0,0,1,1,    0,0,0,1,0,0,1,1,
      //앚기  ActSitdown
      0,0,1,0,1,1,1,1,    1,1,0,0,0,1,0,0,
      //맞기  ActStruck
      0,0,0,1,1,1,1,1,    1,1,1,1,1,1,1,1,    1,1,1,1,1,1,1,1,
      1,1,1,1,1,1,1,1,    0,0,0,1,1,1,1,1,    0,0,0,1,1,1,1,1,
      0,0,0,1,1,1,1,1,    0,0,0,1,1,1,1,1,
      //쓰러짐 ActDie
      0,0,1,1,1,1,1,1,    0,1,1,1,1,1,1,1,    1,1,1,1,1,1,1,1,
      1,1,1,1,1,1,1,1,    0,0,0,1,1,1,1,1,    0,0,0,1,1,1,1,1,
      0,0,0,1,1,1,1,1,    0,0,0,1,1,1,1,1
      ),

      (   //여자
      //정지 ActStand
      0,0,0,0,1,1,1,1,    1,1,1,1,1,1,1,1,    1,1,1,1,1,1,1,1,
      0,0,0,0,1,1,1,1,    0,0,0,0,0,0,0,0,    0,0,0,0,1,1,1,1,
      1,1,1,1,1,1,1,1,    1,1,1,1,1,1,1,1,
      //걷기 ActWalk
      0,0,0,0,0,0,0,0,    1,1,1,1,1,1,1,1,    0,0,1,1,1,1,1,1,
      0,0,0,0,0,0,1,1,    0,0,0,0,0,0,0,0,    0,0,0,0,0,0,1,1,
      1,1,1,1,1,1,1,1,    1,1,1,1,1,1,1,1,
      //뛰기
      1,1,1,1,1,1,0,0,    1,1,1,1,1,1,1,1,    1,1,1,1,1,1,1,1,
      1,1,1,1,1,1,1,1,    0,0,1,1,1,1,1,1,    0,0,1,1,1,0,0,1,
      0,0,0,0,0,0,0,1,    0,0,0,0,0,0,0,1,
      //war모드
      1,1,1,1,0,0,0,0,
      //공격
      1,1,1,0,0,0,1,1,    1,1,1,0,0,0,0,0,    1,1,1,0,0,0,0,0,
      1,1,1,1,1,1,1,1,    1,1,1,1,1,1,1,1,    1,1,1,0,0,0,0,0,
      0,0,0,0,0,0,0,0,    1,1,1,1,0,0,1,1,
      //공격 2
      0,1,1,0,0,0,1,1,    0,1,1,0,0,0,1,1,    1,1,1,0,0,0,0,0,
      1,1,1,0,0,1,1,1,    1,1,1,1,1,1,1,1,    0,1,1,1,1,1,1,1,
      0,0,0,1,1,1,0,0,    0,1,1,1,1,0,1,1,
      //공격3
      1,1,0,1,0,0,0,0,    1,1,0,0,0,0,0,0,    1,1,1,1,1,0,0,0,
      1,1,0,0,1,0,0,0,    1,1,1,0,0,0,0,1,    0,1,1,0,0,0,0,0,
      0,0,0,0,1,1,1,0,    1,1,1,1,1,0,0,0,
      //마법
      0,0,0,0,0,0,1,1,    0,0,0,0,0,0,1,1,    0,0,0,0,0,0,1,1,
      1,0,0,0,0,1,1,1,    1,1,1,1,1,1,1,1,    0,1,1,1,1,1,1,1,
      0,0,1,1,0,0,1,1,    0,0,0,1,0,0,1,1,
      //앚기
      0,0,1,0,1,1,1,1,    1,1,0,0,0,1,0,0,
      //맞기
      0,0,0,1,1,1,1,1,    1,1,1,1,1,1,1,1,    1,1,1,1,1,1,1,1,
      1,1,1,1,1,1,1,1,    0,0,0,1,1,1,1,1,    0,0,0,1,1,1,1,1,
      0,0,0,1,1,1,1,1,    0,0,0,1,1,1,1,1,
      //쓰러짐
      0,0,1,1,1,1,1,1,    0,1,1,1,1,1,1,1,    1,1,1,1,1,1,1,1,
      1,1,1,1,1,1,1,1,    0,0,0,1,1,1,1,1,    0,0,0,1,1,1,1,1,
      0,0,0,1,1,1,1,1,    0,0,0,1,1,1,1,1
      )
   );

   WORDER5: Array[0..1, 0..599] of byte = (    //1: 칼이 앞으로,  0: 칼이 뒤로
      (      //남자
      //정지 ActStand
      0,0,0,0,1,1,1,1,    1,1,1,1,1,1,1,1,    1,1,1,1,1,1,1,1,
      0,0,0,0,1,1,1,1,    0,0,0,0,0,0,0,0,    0,0,0,0,1,1,1,1,
      1,1,1,1,1,1,1,1,    1,1,1,1,1,1,1,1,
      //월영술 ActDown
      0,0,0,0,0,0,0,0,    1,1,1,1,1,1,1,1,    0,0,1,1,1,1,1,1,
      0,0,0,0,0,0,1,1,    0,0,0,0,0,0,0,0,    0,0,0,0,0,0,1,1,
      1,1,1,1,1,1,1,1,    1,1,1,1,1,1,1,1,
      //걷기
      0,0,0,0,0,0,0,0,    1,1,1,1,1,1,1,1,    0,0,1,1,1,1,1,1,
      0,0,0,0,0,0,1,1,    0,0,0,0,0,0,0,0,    0,0,0,0,0,0,1,1,
      1,1,1,1,1,1,1,1,    1,1,1,1,1,1,1,1,
      //뛰기
      1,1,1,1,1,1,0,0,    1,1,1,1,1,1,1,1,    1,1,1,1,1,1,1,1,
      1,1,1,1,1,1,1,1,    0,0,1,1,1,1,1,1,    0,0,1,1,1,0,0,1,
      0,0,0,0,0,0,0,1,    0,0,0,0,0,0,0,1,
      //war모드  ActWarMode
      0,1,1,1,0,0,0,0,
      //공격 ActHit
      1,1,1,0,0,0,1,1,    1,1,1,0,0,0,0,0,    1,1,1,0,0,0,0,0,
      1,1,1,1,1,1,1,1,    1,1,1,1,1,1,1,1,    1,1,1,0,0,0,0,0,
      0,0,0,0,0,0,0,0,    1,1,1,1,0,0,1,1,
      //공격 2 ActHeavyHit
      0,1,1,0,0,0,1,1,    0,1,1,0,0,0,1,1,    1,1,1,0,0,0,0,0,
      1,1,1,0,0,1,1,1,    1,1,1,1,1,1,1,1,    0,1,1,1,1,1,1,1,
      0,0,0,1,1,1,0,0,    0,1,1,1,1,0,1,1,
      //공격3  ActBigHit
      1,1,0,1,0,0,0,0,    1,1,0,0,0,0,0,0,    1,1,1,1,1,0,0,0,
      1,1,0,0,1,0,0,0,    1,1,1,0,0,0,0,1,    0,1,1,0,0,0,0,0,
      0,0,0,0,1,1,1,0,    1,1,1,1,1,0,0,0,
       //마법  ActSpell
      0,0,0,0,0,0,1,1,    0,0,0,0,0,0,1,1,    0,0,0,0,0,0,1,1,
      1,0,0,0,0,1,1,1,    1,1,1,1,1,1,1,1,    0,1,1,1,1,1,1,1,
      0,0,1,1,0,0,1,1,    0,0,0,1,0,0,1,1,
      //앚기  ActSitdown
      0,0,1,0,1,1,1,1,    1,1,0,0,0,1,0,0,
      //맞기  ActStruck
      0,0,0,1,1,1,1,1,    1,1,1,1,1,1,1,1,    1,1,1,1,1,1,1,1,
      1,1,1,1,1,1,1,1,    0,0,0,1,1,1,1,1,    0,0,0,1,1,1,1,1,
      0,0,0,1,1,1,1,1,    0,0,0,1,1,1,1,1
      ),

      (   //여자
      //정지 ActStand
      0,0,0,0,1,1,1,1,    1,1,1,1,1,1,1,1,    1,1,1,1,1,1,1,1,
      0,0,0,0,1,1,1,1,    0,0,0,0,0,0,0,0,    0,0,0,0,1,1,1,1,
      1,1,1,1,1,1,1,1,    1,1,1,1,1,1,1,1,
      //월영술 ActDown
      0,0,0,0,0,0,0,0,    1,1,1,1,1,1,1,1,    0,0,1,1,1,1,1,1,
      0,0,0,0,0,0,1,1,    0,0,0,0,0,0,0,0,    0,0,0,0,0,0,1,1,
      1,1,1,1,1,1,1,1,    1,1,1,1,1,1,1,1,
      //걷기
      0,0,0,0,0,0,0,0,    1,1,1,1,1,1,1,1,    0,0,1,1,1,1,1,1,
      0,0,0,0,0,0,1,1,    0,0,0,0,0,0,0,0,    0,0,0,0,0,0,1,1,
      1,1,1,1,1,1,1,1,    1,1,1,1,1,1,1,1,
      //뛰기
      1,1,1,1,1,1,0,0,    1,1,1,1,1,1,1,1,    1,1,1,1,1,1,1,1,
      1,1,1,1,1,1,1,1,    0,0,1,1,1,1,1,1,    0,0,1,1,1,0,0,1,
      0,0,0,0,0,0,0,1,    0,0,0,0,0,0,0,1,
      //war모드  ActWarMode
      0,1,1,1,0,0,0,0,
      //공격 ActHit
      1,1,1,0,0,0,1,1,    1,1,1,0,0,0,0,0,    1,1,1,0,0,0,0,0,
      1,1,1,1,1,1,1,1,    1,1,1,1,1,1,1,1,    1,1,1,0,0,0,0,0,
      0,0,0,0,0,0,0,0,    1,1,1,1,0,0,1,1,
      //공격 2 ActHeavyHit
      0,1,1,0,0,0,1,1,    0,1,1,0,0,0,1,1,    1,1,1,0,0,0,0,0,
      1,1,1,0,0,1,1,1,    1,1,1,1,1,1,1,1,    0,1,1,1,1,1,1,1,
      0,0,0,1,1,1,0,0,    0,1,1,1,1,0,1,1,
      //공격3  ActBigHit
      1,1,0,1,0,0,0,0,    1,1,0,0,0,0,0,0,    1,1,1,1,1,0,0,0,
      1,1,0,0,1,0,0,0,    1,1,1,0,0,0,0,1,    0,1,1,0,0,0,0,0,
      0,0,0,0,1,1,1,0,    1,1,1,1,1,0,0,0,
       //마법  ActSpell
      0,0,0,0,0,0,1,1,    0,0,0,0,0,0,1,1,    0,0,0,0,0,0,1,1,
      1,0,0,0,0,1,1,1,    1,1,1,1,1,1,1,1,    0,1,1,1,1,1,1,1,
      0,0,1,1,0,0,1,1,    0,0,0,1,0,0,1,1,
      //앚기  ActSitdown
      0,0,1,0,1,1,1,1,    1,1,0,0,0,1,0,0,
      //맞기  ActStruck
      0,0,0,1,1,1,1,1,    1,1,1,1,1,1,1,1,    1,1,1,1,1,1,1,1,
      1,1,1,1,1,1,1,1,    0,0,0,1,1,1,1,1,    0,0,0,1,1,1,1,1,
      0,0,0,1,1,1,1,1,    0,0,0,1,1,1,1,1
      )
   );

   EffDir : array[0..7] of byte = (0, 0, 1, 1, 1, 1, 1, 0);


type
   TActor = class//Size 0x240
     m_nRecogId                :Integer;    //실�ケ僞� 0x4
     m_nCurrX                  :Integer;    //뎠품杰瞳뒈暠林깃X 0x08
     m_nCurrY                  :Integer;    //뎠품杰瞳뒈暠林깃Y 0x0A
     m_btDir                   :Byte;       //뎠품籃접렘蕨 0x0C
     m_btSex                   :Byte;       //昑깎 0x0D
     m_btRace                  :Word;       //0x0E
     m_btHair                  :Word;       //庫랙잚謹 0x0F
     m_btDress                 :Word;       //擄륩잚謹 0x10
     m_btWeapon                :Word;
     m_btHorse                 :Integer;       //쯩잚謹
     m_btTigerRun              :Boolean; //호랑이
     m_btDressRun              :Boolean; //수영복
     m_btSpeedRun              :Byte;   //경신보
     m_btEffect                :Byte;       //莖賈잚謹
     m_btAttatckMode           :Byte;                           //공격 모드
     m_btJob                   :Byte;       //0:전사 1:술사 2:도사 3:자객 4:승려
     m_wAppearance             :Word;       //0x14
     m_btLimitLevel            :Byte;
     m_btHeroAutoDurg          :Byte;
     m_btDeathState            :Byte;
     m_nFeature                :Integer;    //0x18
     m_nFeatureEx              :Integer;    //0x18
     m_nState                  :Integer;    //0x1C
     m_boDeath                 :Boolean;    //0x20
     m_boSkeleton              :Boolean;    //0x21
     m_boDelActor              :Boolean;    //0x22
     m_boDelActionAfterFinished :Boolean;   //0x23

     m_SayList: TList;
     m_Group                   :pTGroupMember;
     m_sDescUserName           :String;     //훙膠츰냔，빈留
     FameName                  :string;     //명성
     ColumName                 :string;
     m_sUserName               :String;     //0x28
     m_sRankName               :String;
     m_nNameColor              :Integer;    //0x2C
     m_nRankColor              :Integer;
     m_Abil                    :TAbility;   //0x30
     m_nGold                   :Integer;
     m_nGameGold               :Integer;
     m_nGamePoint              :Integer;
     m_nPCPoint                :Integer;
     m_nHitSpeed               :ShortInt;    //공격속도 0: 기본, (-)느림 (+)빠름
     m_boVisible               :Boolean;    //0x5D
     m_boHoldPlace             :Boolean;    //0x5E

     m_boHero: Boolean;
     m_boisHero: Boolean;

     m_SayWidthsArr: Integer;
     m_dwSayTime               :LongWord;
     m_nSayX                   :Integer;
     m_nSayY                   :Integer;
     m_nSayLineCount           :Integer;

     m_nShiftX                 :Integer;    //0x98
     m_nShiftY                 :Integer;    //0x9C

     m_nPx                     :Integer;  //0xA0
     m_nTdx                    :Integer;      //호랑이  X좌표
     m_nHpx                    :Integer;  //0xA4
     m_nHUpx                    :Integer;  //0xA4
     m_nHepx                   :Integer;
     m_nWpx                    :Integer;  //0xA8
     m_nWp2x                    :Integer;  //0xA8
     m_nSpx                    :Integer;  //0xAC
     m_nSpx2                   :Integer;  //0xAC
     m_nSpx3                   :Integer;
     m_nSpx4                   :Integer;
     m_nSpx5                   :Integer;
     m_nSpx6                   :Integer;
     m_nefx                    :Integer;
     m_xxxx                    :Integer;
     m_nWp3x                    :Integer;  //0xA8
     m_nPx2                     :Integer;
     m_nPx3                     :Integer;

     m_fishx                   :Integer;   //낚시
     m_fishy                   :Integer;   //낚시
     m_fishdx                  :Integer;
     m_fishdy                  :Integer;

     m_nPy                     :Integer;
     m_nTdy                    :Integer;       //호랑이 Y좌표
     m_nHpy                    :Integer;
     m_nHUpy                    :Integer;
     m_nHepy                   :Integer;
     m_nWpy                    :Integer;
     m_nWp2y                    :Integer;
     m_nWp3y                    :Integer;
     m_nSpy                    :Integer;  //0xB0 0xB4 0xB8 0xBC
     m_nSpy2                    :Integer;  //0xB0 0xB4 0xB8 0xBC
     m_nSpy3                    :Integer;
     m_nSpy4                    :Integer;
     m_nSpy5                    :Integer;
     m_nSpy6                    :Integer;
     m_nefY                    :Integer;
     m_yyyy                    :Integer;
     m_nPy2                     :Integer;
     m_nPy3                     :Integer;

     m_nRx                     :Integer;
     m_nRy                     :Integer;//0xC0 0xC4
     m_nDownDrawLevel          :Integer;   //몇 셀 이전에 그리게 함...
     m_nTargetX                :Integer;
     m_nTargetY                :Integer; //0xCC 0xD0
     m_nTargetRecog            :Integer;      //0xD4
     m_nHiterCode              :Integer;        //0xD8
     m_nMagicNum               :Integer;         //0xDC
     m_nCurrentEvent           :Integer;
     m_boDigFragment           :Boolean;         //이번 곡괭이 질이 캐졌는지
     m_boThrow                 :Boolean;

     m_nBodyOffset             :Integer;     //0x0E8   //0x0D0
     m_nHairOffset             :Integer;     //0x0EC
     m_nHumWinOffset           :Integer;   //0x0F0
     m_nHumHanOffset           :Integer;
     WeaponEffectOffset        :Integer;   //0x0F4
     m_boUseMagic              :Boolean;    //0x0F8   //0xE0
     m_boHitEffect             :Boolean;   //0x0F9    //0xE1
     m_boBonzeHitEff           :Boolean;
     m_boUseEffect             :Boolean;   //0x0FA    //0xE2
     m_nHitEffectNumber        :Integer;              //0xE4
     m_dwWaitMagicRequest      :LongWord;
     m_nWaitForRecogId         :Integer;         //자신이 사라지면 WaitFor의 actor를 visible 시킨다.
     m_nWaitForFeature         :Integer;
     m_nWaitForStatus          :Integer;
     m_nAssEffectimg           :Integer;    //풍검술

     m_nCurEffFrame            :Integer;       //0x110
     m_nSpellFrame             :Integer;        //0x114
     m_CurMagic                :TUseMagicInfo;    //0x118  //m_CurMagic.EffectNumber 0x110

     GlimmingMode: Boolean;
     CurGlimmer: integer;
     MaxGlimmer: integer;
     GlimmerTime: longword;

     m_nGenAniCount            :Integer;                   //0x124
     m_boOpenHealth            :Boolean;        //0x140
     m_noInstanceOpenHealth    :Boolean;//0x141
     m_dwOpenHealthStart       :LongWord;
     m_dwOpenHealthTime        :LongWord;//Integer;jacky

      //SRc: TRect;  //Screen Rect
     m_BodySurface             :TDirectDrawSurface;    //0x14C   //0x134
     m_TigerSurface            :TDirectDrawSurface;  //호랑이

     m_nCurrentAction          :Integer;    //0x154         //0x13C
     m_boReverseFrame          :Boolean;    //0x158
     m_boWarMode               :Boolean;    //0x159
     m_dwWarModeTime           :LongWord;   //0x15C
     m_dwSpiderMove            :LongWord;
     g_dwMagicMove             :LongWord;   //낙염, 빙환
     m_nChrLight               :Integer;    //0x160
     m_nMagLight               :Integer;    //0x164
     m_nRushDir                :Integer;  //0, 1  //0x168
     m_nXxI                    :Integer; //0x16C
     m_boLockEndFrame          :Boolean;     //0x170
     m_dwHumUpTime             :LongWord;  //등선 이동 금지

     m_dwLastStruckTime        :LongWord;  //0x174
     m_dwSendQueryUserNameTime :LongWord;    //0x178

     m_nMagicStruckSound       :Integer;  //0x180 굳침랬묑샌琨藍랙놔돨�汗�
     m_boRunSound              :Boolean;  //0x184 텝꼍랙놔돨�汗�
     m_nFootStepSound          :Integer;  //CM_WALK, CM_RUN //0x188  浬꼍��
     m_nStruckSound            :Integer;  //SM_STRUCK         //0x18C  琨藍�汗�
     m_nStruckWeaponSound      :Integer;                //0x190  굳寧땍嶠포묑샌琨藍�汗�

     m_nAppearSound            :Integer;  //         0    //0x194
     m_nNormalSound            :Integer;  //         1    //0x198
     m_nAttackSound            :Integer;  //         2    //0x19C
     m_nWeaponSound            :Integer;  //         3    //0x1A0
     m_nArcherSound: String;
     m_nScreamSound            :Integer;  //         4    //0x1A4
     m_nDieSound               :Integer;  //         5 SM_DEATHNOW //0x1A8
     m_nDie2Sound              :Integer;  //         6     //0x1AC

     m_dwMissionIconTick: LongWord;
     m_dwMissionIconIdx: Byte;

     m_nMagicStartSound        :Integer;     //0x1B0
     m_nMagicFireSound         :Integer;      //0x1B4
     m_nMagicExplosionSound    :Integer; //0x1B8
     m_Action                  :pTMonsterAction;
     m_HealthList: TGList;
     m_nMoveHpList: TList;         //타격치
     m_boStartStore: Boolean;   //개인상점
     m_btHumEffect: Byte;   //기퍼짐
     m_WEffect: Byte;
     m_btEventEffect: Byte;   //빼빼로
     m_btColumn :Byte; //홍보단
     TempState:   byte; //비월천주 현제 상태
   private
     function GetMessage(ChrMsg:pTChrMsg):Boolean;
   protected
     m_nStartFrame             :Integer;      //0x1BC        //0x1A8
     m_nEndFrame               :Integer;        //0x1C0      //0x1AC
     m_nCurrentFrame           :Integer;    //0x1C4          //0x1B0
     m_nEffectStart            :Integer;     //0x1C8         //0x1B4
     m_nEffectFrame            :Integer;     //0x1CC         //0x1B8
     m_nEffectEnd              :Integer;       //0x1D0       //0x1BC
     m_dwEffectStartTime       :LongWord;//0x1D4             //0x1C0
     m_dwEffectFrameTime       :LongWord;//0x1D8             //0x1C4
     m_dwFrameTime             :LongWord;      //0x1DC       //0x1C8
     m_dwStartTime             :LongWord;      //0x1E0       //0x1CC
     m_nMoveStep               :Integer;        //0x1EC
     m_boMsgMuch               :Boolean;            //0x1F0
     m_dwStruckFrameTime       :LongWord;   //0x1F4
     m_nCurrentDefFrame        :Integer;    //0x1F8          //0x1E4
     m_dwDefFrameTime          :LongWord;      //0x1FC       //0x1E8
     m_nDefFrameCount          :Integer;      //0x200        //0x1EC
     m_nSkipTick ,m_nSkipTick2     :Integer;           //0x204
     m_dwSmoothMoveTime        :LongWord;    //0x208
     m_dwGenAnicountTime       :LongWord;   //0x20C
     m_dwLoadSurfaceTime       :LongWord;   //0x210  //0x200
     m_dwTDBtimer              :LongWord;

     m_nOldx                   :Integer;
     m_nOldy                   :Integer;
     m_nOldDir                 :Integer; //0x214 0x218 0x21C
     m_nActBeforeX             :Integer;
     m_nActBeforeY             :Integer;  //0x220 0x224
     m_nWpord                  :Integer;                   //0x228

      procedure CalcActorFrame; dynamic;
      procedure DefaultMotion; dynamic;
      function  GetDefaultFrame (wmode: Boolean): integer; dynamic;
      procedure DrawEffSurface (dsurface, source: TDirectDrawSurface; ddx, ddy: integer; blend: Boolean; ceff: TColorEffect; mode: integer = 0);dynamic;
      procedure DrawWeaponGlimmer (dsurface: TDirectDrawSurface; ddx, ddy: integer);
   public
      m_MsgList: TGList;       //list of PTChrMsg 0x22C  //0x21C
      RealActionMsg: TChrMsg; //FrmMain    0x230

      constructor Create; dynamic;
      destructor Destroy; override;
      
      procedure  SendMsg (wIdent:Word; nX,nY, ndir,nFeature,nState:Integer;sStr:String;nSound:Integer);
      procedure  UpdateMsg(wIdent:Word; nX,nY, ndir,nFeature,nState:Integer;sStr:String;nSound:Integer);
      procedure  CleanUserMsgs;
      procedure  ProcMsg;
      procedure  ProcHurryMsg;
      function   IsIdle: Boolean;
      function   ActionFinished: Boolean;
      function   CanWalk: Integer;
      function   CanRun: Integer;
      function   Strucked: Boolean;
      procedure ClearSayList();
      procedure ShowEffect(nID, nX, nY: Integer);
      procedure  Shift (dir, step, cur, max: integer);
      procedure  ReadyAction (msg: TChrMsg);
      function   CharWidth: Integer;
      function   CharHeight: Integer;
      function   CheckSelect (dx, dy: integer): Boolean;
      procedure  CleanCharMapSetting (x, y: integer);
      procedure  Say (str: string; boFirst: Boolean = True);
      procedure  SetSound; dynamic;
      procedure  Run; dynamic;
      procedure  RunSound; dynamic;
      procedure  RunActSound (frame: integer); dynamic;
      procedure  RunFrameAction (frame: integer); dynamic;
      procedure  ActionEnded; dynamic;
      function   Move (step: integer): Boolean;
      procedure  MoveFail;
      function   CanCancelAction: Boolean;
      procedure  CancelAction;
      procedure  FeatureChanged; dynamic;
      function   Light: integer; dynamic;
      procedure  LoadSurface; dynamic;
      function   GetDrawEffectValue: TColorEffect;
      procedure  DrawChr (dsurface: TDirectDrawSurface; dx, dy: integer; blend: Boolean;boFlag:Boolean); dynamic;
      procedure  DrawEff (dsurface: TDirectDrawSurface; dx, dy: integer); dynamic;
      procedure DrawProntEff (dsurface: TDirectDrawSurface; dx, dy: integer);  dynamic;
      procedure DrawBackEff (dsurface: TDirectDrawSurface; dx, dy: integer);  dynamic;
      procedure DrawStruck(dsurface: TDirectDrawSurface); dynamic;
      procedure  ShowSayMsg(MSurface: TDirectDrawSurface);
      procedure  ShowRankName(MSurface: TDirectDrawSurface);
   end;

   TNpcActor = class(TActor)         //엔피씨
     m_MissionStatus: TNPCMissionStatus;
     m_MissionList: TList;
   private
     mx, my: integer;
     PlaySnow: Boolean;
     SnowStartTime: longword;
     EffectSurface: TDirectDrawSurface;
   public
     constructor Create; override;
     destructor Destroy; override;
     procedure Run; override;
     procedure CalcActorFrame; override;
     function GetDefaultFrame(wmode: Boolean): Integer; override;
     procedure LoadSurface; override;
     procedure DrawChr(dsurface: TDirectDrawSurface; dx, dy: Integer; blend: Boolean; boFlag: Boolean); override;
     procedure DrawEff(dsurface: TDirectDrawSurface; dx, dy: Integer); override;
   end;

   THumActor = class (TActor)//Size: 0x27C Address: 0x00475BB8
     m_btGuildMark: Byte;   //문파 마크
     m_btMask: Byte;   //변신연구
   private
     m_HairSurface         :TDirectDrawSurface; //0x250  //0x240
     m_WeaponSurface       :TDirectDrawSurface; //0x254  //0x244
     m_WeaponSurface2      :TDirectDrawSurface;
     m_HumWinSurface       :TDirectDrawSurface; //0x258  //0x248

     m_HumfishSurface      :TDirectDrawSurface;   //낚시 이펙트
     m_HumfishSurface2      :TDirectDrawSurface;  //낚시 이펙트

     m_boWeaponEffect      :Boolean;            //0x25C  //0x24C
     m_nCurWeaponEffect    :Integer;            //0x260  //0x250
     m_nCurBubbleStruck    :Integer;            //0x264  //0x254
     m_nCurBubbleStruck2    :Integer;
     m_dwWeaponpEffectTime :LongWord;           //0x268
     m_boHideWeapon        :Boolean;            //0x26C
     m_nFrame              :Integer;
     m_dwFrameTick         :LongWord;
     m_dwFrameTime         :LongWord;
     m_bo2D0               :Boolean;

     hpx, epx, epx2, epx3, epx4, wpx, wpx2, wpx3:   integer;
     hpy, epy, epy2, epy3, epy4, wpy, wpy2, wpy3:   integer;

     // 빼빼로 Event
     FoodStickDayEffectSurface: TDirectDrawSurface;
     FoodStickDayEffectSurface2: TDirectDrawSurface;
     FoodStickDayEffectOffset: integer;
     FoodStickDayEffectOffset2: integer;
     FoodStickDayEffectCurrentFrame   : integer;
     FoodStickDayEffectStartTime   : longword;
     FoodStickDayEffectFrameTime   : longword;
     BoFoodStickDayEffect: Boolean;


     m_dwFrameTick3         :LongWord;   //낚시
     m_dwFrameTime3         :LongWord;   //낚시
     m_nFrame3              :Integer;    //낚시
     m_fishbor              :Boolean;    //낚시

     // 공파섬
     SKillCurrentFrame   : integer;
     SKillStartTime   : longword;
     SKillFrameTime   : longword;

     // 참격
     CKillCurrentFrame   : integer;
     CKillStartTime   : longword;
     CKillFrameTime   : longword;

     HKillStartTime    : longword;
     HKillCurrentFrame : integer;
     HKillFrametime : longword;

     // 고려무진봉
     BKillCurrentFrame   : integer;
     BKillStartTime   : longword;
     BKillFrameTime   : longword;
     //직도황룡봉
     BCKillCurrentFrame   : integer;
     BCKillStartTime   : longword;
     BCKillFrameTime   : longword;

     TransFormEffectSurface: TDirectDrawSurface;
     TransFormWeaponEffectSurface: TDirectDrawSurface;

     FWeaponEffectSurface: TDirectDrawSurface;
     FWeaponEffectSurface_r: TDirectDrawSurface;
   protected
      procedure CalcActorFrame; override;
      procedure DefaultMotion; override;
      function  GetDefaultFrame (wmode: Boolean): integer; override;
   public
      m_nBagCount: Integer;
      m_H50LevelEffectSurface:TDirectDrawSurface; //레벨50 이팩트
      m_H50LevelEffectOffset:Integer;
      m_H50LevelEffectCurrentFrame:Integer;
      m_H50LevelEffectStartTime:LongWord;
      m_H50LevelEffectFrameTime:LongWord;
      m_n50LevelHEffect:Boolean;

      m_HDressEffectSurface:TDirectDrawSurface; //흑룡신갑
      m_HDressEffectOffset:Integer;
      m_HDressEffectCurrentFrame:Integer;
      m_HDressEffectStartTime:LongWord;
      m_HDressEffectFrameTime:LongWord;

      m_H60LevelEffectSurface:TDirectDrawSurface; //레벨60 이팩트
      m_H60LevelEffectOffset:Integer;
      m_H60LevelEffectCurrentFrame:Integer;
      m_H60LevelEffectMaxCurrentFrame:Integer;
      m_H60LevelEffectStartTime:LongWord;
      m_H60LevelEffectFrameTime:LongWord;
      m_n60LevelHEffect:Boolean;

      m_H60LevelEffectSurface2:TDirectDrawSurface; //레벨60 이팩트 용
      m_H60LevelEffectOffset2:Integer;
      m_H60LevelEffectCurrentFrame2:Integer;
      m_H60LevelEffectMaxCurrentFrame2:Integer;
      m_H60LevelEffectStartTime2:LongWord;
      m_H60LevelEffectFrameTime2:LongWord;
      m_n60LevelHEffect2:Boolean;

      m_HumUpLevelEffectSurface:TDirectDrawSurface; //등선 이팩트
      m_HumUpLevelEffectOffset:Integer;
      m_HumUpLevelEffectCurrentFrame:Integer;
      m_HumUpLevelEffectMaxCurrentFrame:Integer;
      m_HumUpLevelEffectStartTime:LongWord;
      m_HumUpLevelEffectFrameTime:LongWord;
      m_HumUpLevelHEffect:Boolean;

      m_HumUpLevelEffectSurface3:TDirectDrawSurface; //등선 이팩트 용
      m_HumUpLevelEffectOffset3:Integer;
      m_HumUpLevelEffectCurrentFrame3:Integer;
      m_HumUpLevelEffectMaxCurrentFrame3:Integer;
      m_HumUpLevelEffectStartTime3:LongWord;
      m_HumUpLevelEffectFrameTime3:LongWord;
      m_HumUpLevelHEffect3:Boolean;

      m_HumUp70LevelEffectSurface:TDirectDrawSurface; //등선 70이팩트
      m_HumUp70LevelEffectOffset:Integer;
      m_HumUp70LevelEffectCurrentFrame:Integer;
      m_HumUp70LevelEffectMaxCurrentFrame:Integer;
      m_HumUp70LevelEffectStartTime:LongWord;
      m_HumUp70LevelEffectFrameTime:LongWord;
      m_HumUp70LevelHEffect:Boolean;

      m_HumUp70LevelEffectSurface3:TDirectDrawSurface; //등선 70이팩트 용
      m_HumUp70LevelEffectOffset3:Integer;
      m_HumUp70LevelEffectCurrentFrame3:Integer;
      m_HumUp70LevelEffectMaxCurrentFrame3:Integer;
      m_HumUp70LevelEffectStartTime3:LongWord;
      m_HumUp70LevelEffectFrameTime3:LongWord;
      m_HumUp70LevelHEffect3:Boolean;


      m_Hum80LevelEffectSurface:TDirectDrawSurface; //80 이팩트
      m_Hum80LevelEffectOffset:Integer;
      m_Hum80LevelEffectCurrentFrame:Integer;
      m_Hum80LevelEffectMaxCurrentFrame:Integer;
      m_Hum80LevelEffectStartTime:LongWord;
      m_Hum80LevelEffectFrameTime:LongWord;
      m_Hum80LevelHEffect:Boolean;

      constructor Create; override;
      destructor Destroy; override;
      procedure  Run; override;
      procedure  RunFrameAction (frame: integer); override;
      procedure ShowGuildLable(MSurface: TDirectDrawSurface);   //문파 마크
      function   Light: integer; override;
      procedure  LoadSurface; override;
      procedure  DoWeaponBreakEffect;
      procedure  DrawChr (dsurface: TDirectDrawSurface; dx, dy: integer; blend: Boolean;boFlag:Boolean); override;
      procedure  DrawChrBody (dsurface: TDirectDrawSurface; dx, dy: integer; blend: Boolean;boFlag:Boolean);

      procedure Target;
      procedure HeroTurn(X, Y: Integer; tDir: Byte);
   end;

   function GetRaceByPM (race: integer;Appr:word): PTMonsterAction;
   function GetOffset (appr: integer): integer;
   function GetNpcOffset(nAppr:Integer):Integer;


implementation

uses
   ClMain, SoundUtil, clEvent, MShare, FState, FState2, StrUtils;


function GetRaceByPM (race: integer;Appr:word): pTMonsterAction;
begin
   Result := nil;
   case Race of
    1: Result:=@MA1;                  //검은흑성성
    2: Result:=@MA2;                  //이두흑호
    3: Result:=@MA3;                  //여귀
    4: Result:=@MA4;                  //태골서
    5: Result:=@MA5;                  //작은대망
    6: Result:=@MA6;                  //대망
    7: Result:=@MA7;                  //주마술사
    8, 26: Result:=@MA8;                  //주마화궁사 주마풍궁사
    9{01}: Result:=@MA9; //475D70
    10{02}: Result:=@MA10; //475D7C
    11{03}: Result:=@MA11; //475D88       //사슴 , 닭
    12{04}: Result:=@MA12; //475D94
    13{05}: Result:=@MA13; //475DA0      //식인초
    14{06}: Result:=@MA14; //475DAC
    15{07}: Result:=@MA15; //475DB8
    16{08}: Result:=@MA16; //475DC4
    17{06}: Result:=@MA14; //475DAC
    18{06}: Result:=@MA14; //475DAC
    19{0A}: Result:=@MA19; //475DDC
    20{0A}: Result:=@MA19; //475DDC
    21{0A}: Result:=@MA19; //475DDC
    22{07}: Result:=@MA15; //475DB8
    23{06}: Result:=@MA14; //475DAC       //백골
    24{04}: Result:=@MA12; //475D94
    25:  Result:=@MA1388; //서성이는궁병
    27:  Result:=@MA35;  //주마검사
    28:  Result:=@MA36;  //여귀석
    29:  Result:=@MA37;  //마석거인
    30{09}: Result:=@MA17; //475DD0
    31{09}: Result:=@MA17; //475DD0
    32{0F}: Result:=@MA24; //475E18
    33{10}: Result:=@MA25; //475E24
    34{11}: Result:=@MA30; //475E30  적월마 밤나무 사과나무 등등
    35{12}: Result:=@MA31; //475E3C
    36{13}: Result:=@MA32; //475E48   //폭주
    37{0A}: Result:=@MA19; //475DDC
    38{0A}: Result:=@MA312;   //칠흑수
    39    : Result:=@MA313;  //토끼 타락토끼
    40{0A}: Result:=@MA19; //475DDC
    41{0B}: Result:=@MA20; //475DE8
    42{0B}: Result:=@MA20; //475DE8
    43{0C}: Result:=@MA21; //475DF4
    44    : Result:=@MA45; //눈사람
    46    : Result:=@MA51;   //고대비월적호
    45{0A}: Result:=@MA19; //475DDC
    47{0D}: Result:=@MA22; //475E00
    48{0E}: Result:=@MA23; //475E0C
    49{0E}: Result:=@MA23; //475E0C

    50:  //엔피씨
         case appr of
            23:
               begin
                  Result := @NA51;
               end;
            // 2003/07/15 과거비천 NPC
            27, 32,
            24, 25, 82:
               begin
                  Result := @NA52;
               end;
            35..41,48,49,50,52,53,54,55,57,58,60,74,78..80,83,84,86,87,92,93,103..106,
              109..116,120,121,130..146,150..157,162..164,199: // npc추가
               begin
                  Result := @NA56;//석상
               end;
            42,43,44,45,46,47:// NewNpc
               begin
                  Result := @NA61;
               end;
            56,59,68..73,75..77,88..90,97..102,107,108,118,119,122..125,147,148,
              158,159,170,185..188,191,193..198, 240..245,253:
               begin
                  Result := @NA68; //서있기 모션만 있는것들
               end;
            91,127,128:
               begin
                  Result := @NA35; //기본 NPC 프레임8
               end;
            94..96,161:
               begin
                  Result := @NA36;   //8프레임
               end;
            117,126,149,181,192:
               begin
                  Result := @NA37;   //기본 NPC 프레임 6
               end;
            129,160,165,168,169,182,183,200,201,246..250:
               begin
                  Result := @NA38;  //10프레임
               end;
            171..180:
               begin
                  Result := @NA39;  //11프레임
               end;
            184:
               begin
                  Result := @NA40;  //9프레임
               end;
            190:
               begin
                  Result := @NA41;
               end;
            251, 252, 255: Result := @NA69;
            254: Result := @NA70;
            else
               Result := @NA50; //일반 NPC
         end;
    51: Result := @MA52;               //격괴장

    52{0A}: Result:=@MA19; //475DDC
    53{0A}: Result:=@MA19; //475DDC
    54{14}: Result:=@MA28; //475E54
    55{15}: Result:=@MA29; //475E60
    56: Result:=@MA33;     //수호귀사
    59: Result:=@MA333;    //비호귀마
    60{16}: Result:=@MA33; //475E6C
    61{16}: Result:=@MA33; //475E6C
    62{16}: Result:=@MA33; //흑천마왕
    63{17}: Result:=@MA34; //475E78
    64{18}: Result:=@MA19; //475E84
    65{18}: Result:=@MA19; //475E84
    66{18}: Result:=@MA19; //475E84
    67{18}: Result:=@MA19; //475E84
    68{18}: Result:=@MA19; //475E84
    69{18}: Result:=@MA19; //475E84
    70{19}: Result:=@MA33; //475E90
    71{19}: Result:=@MA33; //475E90
    72{19}: Result:=@MA33; //475E90
    73{1A}: Result:=@MA19; //475E9C
    74{1B}: Result:=@MA741; //초코과자
    75{1C}: Result:=@MA39; //475EB4
    76{1D}: Result:=@MA38; //475EC0
    77{1E}: Result:=@MA39; //475ECC
    78{1F}: Result:=@MA40; //475ED8
    79{20}: Result:=@MA19; //오마석궁병
    80{21}: Result:=@MA42; //475EF0
    81{22}: Result:=@MA43; //475EFC   월령
    82: Result:=@MA43; //   혼령
    83{23}: Result:=@MA44; //475F08   파천마룡
    84{24}: Result:=@MA47; //475F14
    85{24}: Result:=@MA47; //475F14
    86{24}: Result:=@MA47; //475F14
    87{24}: Result:=@MA47; //475F14
    88{24}: Result:=@MA47; //475F14
    89{24}: Result:=@MA47; //475F14

    91: Result := @MA41;   //칼날바람
    92: Result := @MA46;   //바위폭탄
    93, 94: Result:=@MA278;       //남만성벽 사북성벽
    95, 96: Result:=@MA266;    //남만외성문
    97: Result:=@MA277;      //점령깃발
    98{25}: Result:=@MA27;  //성벽
    99{26}: Result:=@MA26;  //성문,
    100: Result:=@MA80;    //야수왕
    101: Result:=@MA33; //염화적귀

    102, 155: Result:=@MA62;           //주마격뢰장, 월지격장

    103: Result:=@MA49;
    104,57,58: Result:=@MA49; //환사귀장{58}
    105: Result:=@MA49;
    106: Result:=@MA50;
    107,108: Result:=@MA120; //호기연 호기옥
    109: Result:=@MA51;   //비월흑호
    110: Result:=@MA54;
    111: Result:=@MA51;   //비월적호
    112: Result:=@MA51;   //비월소호
    113: Result:=@MA110;  //호혼석
    114: Result:=@MA33; //열장적귀
    115: Result:=@MA65;
    116: Result:=@MA67;
    117: Result:=@MA81;    //단묵
    //뱀의또아리
    118: Result:=@MA147;   //원오
    119: Result:=@MA33; //서괴
    120: Result:=@MA33; //광서괴
    121: Result:=@MA19; //청신시
    122: Result:=@MA19; //연혼괴수
    123: Result:=@MA19; //연혼흑괴수
    124: Result:=@MA33; //거도적귀
    125: Result:=@MA19; //갑석귀수
    126: Result:=@MA33; //갑철귀수
    127: Result:=@MA33; //현무현신
    128: Result:=@MA33; //패검적귀
    129: Result:=@MA145; //독인적귀
    130: Result:=@MA60;  //지옥문지기
    131: Result:=@MA64;    //참원귀
    132: Result:=@MA770;   //강조귀
    133: Result:=@MA4999;  //식신귀
    134: Result:=@MA134;   //역천귀
    135: Result:=@MA135;   //흑천귀
    136: Result:=@MA136;   //멸귀
    137: Result:=@MA135;   //한천귀
    138: Result:=@MA138;   //한시
    139: Result:=@MA139;   //광한시
    140: Result:=@MA140;   //백상
    141: Result:=@MA141;   //남만흑호
    142: Result:=@MA141;   //남만백호
    143: Result:=@MA143;   //흑성성
    144: Result:=@MA144;   //서우
    145: Result:=@MA19;   //폭마야차
    146: Result:=@MA19;   //석마야차
    147: Result:=@MA33;  //야공수호귀
    148: Result:=@MA146;  //견빙수호장
    149: Result:=@MA146;  //마염수호장

    150: Result:=@MA61;   //월지(레드)
    151: Result:=@MA63;   //월지(블루)
    
    152: Result:=@MA49;
    153: Result:=@MA31; //475E3C
    154: Result:=@MA32; //475E48

    156: Result:=@MA123;
    157: Result:=@MA222;   //무명사령 암흑사령 혼마사령
    158: Result:=@MA123;
    159: Result:=@MA125;
    160: Result:=@MA146;   //암혼수호장
    161: Result:=@MA49;    //수두귀
    162: Result:=@MA499;   //인면귀
    163: Result:=@MA146;   //열진수호장
    164: Result:=@MA72;    //격투괭이
    165: Result:=@MA71;    //불괭이
    166: Result:=@MA73;    //창괭이
    167: Result:=@MA74;    //얼룩망치괭이
    168: Result:=@MA75;    //검은망치괭이
    169: Result:=@MA76;    //갑괭이
    170: Result:=@MA77;    //무당괭이
    171: Result:=@MA78;    //호중귀2
    172: Result:=@MA79;    //호중귀1
    173: Result:=@MA82;    //고대수호장
    174: Result:=@MA99;    //인면수
    175: Result:=@MA83;    //묘장군
    176: Result:=@MA84;    //호중천
    177: Result:=@MA85;    //진묘장군
    178: Result:=@MA86;    //염마태자
    //이비동
    179: Result:=@MA87;   //어린어인
    180: Result:=@MA88;   //어창인
    181: Result:=@MA89;   //어법인
    182: Result:=@MA90;   //어월인
    183: Result:=@MA91;   //토견
    184: Result:=@MA92;   //호토견
    185: Result:=@MA355;  //어인의알
    186: Result:=@MA93;   //어인
    187: Result:=@MA94;   //각섬
    188: Result:=@MA95;   //인용
    189: Result:=@MA96;   //수어귀
    //여하신전
    190: Result:=@MA97;   //땅두꺼비
    191: Result:=@MA98;   //의인충
    192: Result:=@MA100;  //인간수
    193: Result:=@MA101;  //문조인
    194: Result:=@MA102;  //작은뿔서우인
    195: Result:=@MA103;  //큰뿔서우인
    196: Result:=@MA104;  //백상인
    197: Result:=@MA105;  //돌거인
    198: Result:=@MA106;  //흙거인
    199: Result:=@MA107;  //가네수
    200: Result:=@MA108;  //여하수
    201: Result:=@MA109;  //공작주
    202: Result:=@MA111;  //눈꽃도둑
    203: Result:=@MA203;  //태구오마
    204, 206: Result:=@MA112;  //거권오마  오마적병
    205: Result:=@MA1123;  //오마흑병
    207: Result:=@MA113;  //오마제사장
    208: Result:=@MA1122;  //다목오마
    209: Result:=@MA116;   //설인량
    210: Result:=@MA117;   //격빙야차
    211: Result:=@MA118;   //칭한야차
    212: Result:=@MA119;   //야차수호장
    213: Result:=@MA124;   //한빙수호귀
    214: Result:=@MA339;
    215: Result:=@MA3339;  //귀연석
    216,217,218: Result:=@MA1200;  //구슬
    219: Result:=@MA1244;    //오마흑령
    220: Result:=@MA1433; //긴코원숭이
    221: Result:=@MA1434;  //변이갑충
    222: Result:=@MA1435;  //거장화
    223: Result:=@MA223;   //마풍석괴

    225: Result:=@MA922;   //그을린요리사
    226: Result:=@MA1124;  //떠도는선원
    227: Result:=@MA1125;  //익사한노예
    228: Result:=@MA1126;  //선박의악령
    229: Result:=@MA1127;  //농노군
    230: Result:=@MA1128;  //거친선목
    231: Result:=@MA1129;  //변이된감시병
    232: Result:=@MA1130;  //혼불
    233: Result:=@MA1131;  //암흑선장

    234: Result:=@MA1444;  //진골

    240: Result:=@MA240;   //영물 돼지
    241: Result:=@MA241;   //영물 병아리
    242: Result:=@MA242;   //영물 괭이
    243: Result:=@MA243;   //영물 해골투사
    244: Result:=@MA244;   //영물 백돈
    245: Result:=@MA245;   //영물 위맨
    246: Result:=@MA246;   //영물 고양이
    247: Result:=@MA247;   //영물 어린흑룡
    248: Result:=@MA248;   //영물 오색알
    249: Result := @MA249;   //영물 겨울눈사람
    250: Result := @MA250;   //영물 개구리
    251: Result := @MA251;   //영물 원숭이

    261: Result := @MA58;   //숲거북이
    262: Result := @MA59;   //삼나무정백
    263: Result := @MA49;   //현월환호
    264: Result := @MA69;   //곰
    265: Result := @MA68;   //표범
    266..271, 274, 275, 276: Result := @MA205;  //현월단전사, 현월단도사, 현월단술사, 전승전사, 성술사, 정연도사
    272, 273, 277: Result := @MA206;
    278: Result:=@MA207; //유상궁장
    279: Result:=@MA208; //양용왕
    //설백현 필드
    280: Result:=@MA280; //빙원귀
    281: Result:=@MA8;   //빙원귀병
    282: Result:=@MA282; //빙원귀궁사
    283: Result:=@MA283; //빙원귀존
    284: Result:=@MA284; //설악귀
    285: Result:=@MA285; //악귀
    286: Result:=@MA286; //설랑
    287: Result:=@MA287; //설태랑
  end
end;

function GetOffset (appr: integer): integer;
var
   nrace, npos: integer;
begin
   Result := 0;
   if (appr >= 1000) then exit;
   nrace := appr div 10;
   npos := appr mod 10;
   case nrace of
      0:    Result := npos * 280;
      1:    begin
               Result := npos * 350;
               if npos = 3 then Result := 740;
               if npos = 4 then Result := 1100;
               if npos = 5 then Result := 1460;
            end;
      2,3,7..12:    Result := npos * 360;
      4:    begin
               Result := npos * 360;
               if npos = 1 then Result := 600;
            end;
      5:  case npos of
            0: Result := npos * 430;
            1: Result := npos * 430;
            2: Result := npos * 430;
            3: Result := npos * 430;
            4: Result := npos * 430;    //연혼흑괴수
            5: Result := 2740;    //인면수
            6: Result := 3180;    //칠흑수
            7: Result := 3620;   //원오
            8: Result := 4780;   //천랑
            9: Result := 5180;   //협객
              //뱀의또아리
          end;
      6: begin
         Result := npos * 440;
         if npos = 4 then Result := 1890;
         if npos = 5 then Result := 2080;   //초코과자
         if npos = 6 then Result := 2490;
      end;
      13: case npos of       //뱀의또아리
            0: Result:= 0;
            1: Result:= 360;
            2: Result:= 440;
            3: Result:= 550;
            5: Result:= 820;
            6: Result:= 1170;  //청신시
            7: Result:= 1880;
            8: Result:= 2490;
            9: Result:= 3000;
          end;
      14: case npos of
            0: Result:= 0;    //촉룡신
            1: Result:= 120;  //밤나무
            2: Result:= 170;  //성탄나무
            3: Result:= 220;  //아리수나무
            4: Result:= 270;   //버섯
            5: Result:= 320;   //상자
            6: Result:= 360;   //벚꽃
            7: Result:= 410;   //눈사람
            8: Result:= 600;   //사과나무
            9: Result:= 650;   //배추
          end;

      15:   Result := npos * 360;
      16:   Result := npos * 360;
      17:   case npos of
               2: Result := 920;  //혼령
               else Result := npos * 350;
            end;
      18:   case npos of
               0: Result := 0;      //흑사왕
               1: Result := 520;    //귀돈왕
               2: Result := 950;    //흑천마왕
               3: Result := 1570;   //붉은거북
               4: Result := 1910;   //초록거북
               5: Result := 2250;   //파란거북
               6: Result := 2600;   //공성병기1
               7: Result := 2730;   //공성병기2
               8: Result := 2870;   //사북성벽
               9: Result := 2990;   //남만성벽
            end;
      19:   case npos of
               0: Result := 0;
               1: Result := 370;
               2: Result := 810;
               3: Result := 1250;
               4: Result := 1630;
               5: Result := 2010;
               6: Result := 2390;  //해골반왕
               7: Result := 3660;  //눈꽃도둑
               8: Result := 4020;  //점령깃발
            end;
      20:   case npos of
               0: Result := 0;
               1: Result := 360;
               2: Result := 720;
               3: Result := 1080;
               4: Result := 1440;
               5: Result := 1800;
               6: Result := 2350;
               7: Result := 3060;
            end;
      21:   case npos of
               0: Result := 0;
               1: Result := 460;
               2: Result := 820;
               3: Result := 1180;
               4: Result := 1540;
               5: Result := 1900;
               6: Result := 2440;
               7: Result := 2570;
               8: Result := 2700;
            end;
      22:   case npos of
               0: Result := 0;
               1: Result := 430;
               2: Result := 1290;
               3: Result := 1810;
               4: Result := 2320;
               5: Result := 2920;
               6: Result := 3270;
               7: Result := 3620;
               8: Result := 3970;  //붉은환영한호
               9: Result := 4490;  //야수왕
            end;
      23:   case npos of
               0: Result := 0;
               1: Result := 440;
               2: Result := 820;
               3: Result := 1360;
               4: Result := 1420;
               5: Result := 1450;  //호기연
               6: Result := 1560;  //호기옥
               7: Result := 1670;  //비월천주
               8: Result := 2270;
               9: Result := 2700;
            end;
      24:   case npos of
               0: Result := 0;
               1: Result := 350;
               2: Result := 700;  //갑석귀수
               3: Result := 1050;  //갑철귀수
               4: Result := 1650;   //현무현신
               5: Result := 3100;
               6: Result := 3450;
               7: Result := 3880;
               8: Result := 4230;
               9: Result := 4580;
            end;
      25:   case npos of
               0: Result := 0;
               1: Result := 350;
               2: Result := 700;
               3: Result := 1050;
               4: Result := 1400;
               5: Result := 1750;
               6: Result := 2180;
               7: Result := 2530;
               8: Result := 3000;
               9: Result := 3810;
            end;
      26:   case npos of
               0: Result := 0;
               1: Result := 370;
               2: Result := 720;
               3: Result := 1080;
               4: Result := 1430;
               5: Result := 1780;
               6: Result := 2290;
               7: Result := 2720;
               8: Result := 3150;
               9: Result := 4000;
            end;
      27:   case npos of
               0: Result := 0;
               1: Result := 350;
               2: Result := 700;
               3: Result := 1210;
               4: Result := 1720;
               5: Result := 2170;
               6: Result := 2250;
               7: Result := 2720;
               8: Result := 3390;
               9: Result := 3740;
            end;
      28:   case npos of
               0: Result := 0;
               1: Result := 510;
               2: Result := 1020;
               3: Result := 1370;
               4: Result := 1720;
               5: Result := 2070;
               6: Result := 2740;   //한빙수호귀
               7: Result := 3780;
               8: Result := 3820;
            end;
      29:   case npos of
               0: Result := 0;
               1: Result := 350;
               2: Result := 700;
               3: Result := 1070;
               4: Result := 1430;
               5: Result := 1890;  //염화적귀
               6: Result := 2820;  //열장적귀
               7: Result := 3840;  //거도적귀
               8: Result := 4770;  //패검적귀
               9: Result := 5870;  //독인적귀
            end;
      30:   case npos of     //mon31
               0: Result := 0;    //견빙수호장
               1: Result := 880;  //마염수호장
               2: Result := 1740;  //암혼수호장
               3: Result := 2600; //열진수호장
               4: Result := 3460;  //염마태자
               5: Result := 3670;
               6: Result := 4180;
               7: Result := 4640;
               8: Result := 5310;
               9: Result := 5900;   //고대수호장
            end;
      31:   case npos of
               0: Result := 0;
               1: Result := 590;
               2: Result := 1180;
               3: Result := 1770;
               4: Result := 2360;
               5: Result := 2950;
               6: Result := 3540;
               7: Result := 4130;
               8: Result := 4730;   //역천귀
               9: Result := 5420;
            end;
      32:   case npos of
               0: Result := 0;
               1: Result := 460;
               2: Result := 1060;
               3: Result := 1420;
               4: Result := 2020;  //백상
               5: Result := 2550;  //남만흑호
               6: Result := 3070;  //남만백호
               7: Result := 3590;
               8: Result := 4110;
               9: Result := 4720;   //단묵
            end;
      33:   case npos of
               0: Result := 0;
               1: Result := 430;
               2: Result := 940;
               3: Result := 1450;
               4: Result := 2020;  //검은망치괭이
               5: Result := 3390;
               6: Result := 4600;  //무당괭이
               7: Result := 5750;
               8: Result := 6030;    //호중귀1
               9: Result := 6920;    //묘장군
            end;
      34:   case npos of
               0: Result := 0;
               1: Result := 860;     //진묘장군
               2: Result := 1620;    //토끼
               3: Result := 2030;    //타락토끼
               //이비동
               4: Result := 2440;    //어린어인
               5: Result := 2850;    //어창인
               6: Result := 3340;    //어법인
               7: Result := 3910;    //어월인
               8: Result := 4560;    //토견
               9: Result := 5620;    //호토견
            end;
      35:   case npos of
               0: Result := 0;       //어인의알
               1: Result := 40;      //어인
               2: Result := 450;     //각섬
               3: Result := 1100;    //인용
               4: Result := 1910;    //수어귀
               //여하신전
               5: Result := 3060;    //땅두꺼비
               6: Result := 3710;    //의인충
               7: Result := 4200;    //인간수
               8: Result := 4710;    //문조인
               9: Result := 5290;    //작은뿔서우인
            end;
      36:   case npos of
               0: Result := 0;       //큰뿔서우인
               1: Result := 730;     //백상인
               2: Result := 1240;    //돌거인
               3: Result := 1810;    //흙거인
               4: Result := 2410;    //가네수
               5: Result := 3300;    //여하수
               6: Result := 3510;    //공작주
               //잿빛동굴
               7: Result := 4580;    //검은흑성성
               8: Result := 5150;    //이두흑호
               9: Result := 5720;     //태구오마
            end;
      37:   case npos of    //mon38
               0: Result := 0;       //거권오마
               1: Result := 570;     //다목오마
               2: Result := 1060;    //오마흑병
               3: Result := 1550;    //오마적병
               4: Result := 2220;    //오마제사장
               5: Result := 3460;   //번개구슬
               6: Result := 3600;   //회복구슬
               7: Result := 3730;   //공격력상승구슬
               8: Result := 3850;    //오마흑령
            end;
      38:   case npos of    //mon39
               0: Result := 0;       //테스몬1
               1: Result := 40;      //테스몬2
               //편목도
               2: Result := 70;      //긴코원숭이
               3: Result := 660;     //변이갑충
               4: Result := 1550;    //거장화
               5: Result := 2010;    //서성이는궁병
               6: Result := 2580;    //그을린요리사
               7: Result := 3070;    //떠도는선원
               8: Result := 3570;    //익사한노예
               9: Result := 4220;    //선박의악령
            end;

      39:   case npos of  //mon40
               0: Result := 0;     //농노군
               1: Result := 750;   //거친선목
               2: Result := 1240;   //저주받은상자
               3: Result := 1500;   //변이된감시병
               4: Result := 2400;   //혼불
               5: Result := 2820;   //암흑선장
               //모래던전
               6: Result := 4590;   //여귀
               7: Result := 5400;   //태골서
               8: Result := 5970;   //대망
               9: Result := 6970;   //작은대망
            end;

      40:   case npos of   //mon41
               0: Result := 0;       //주마술사
               1: Result := 1160;    //주마화궁사
               2: Result := 2120;    //주마풍궁사
               3: Result := 2960;    //주마검사
               4: Result := 4360;    //여귀석
               5: Result := 4650;    //마석거인
               6: Result := 5300;    //격괴장
               7: Result := 6290;    //칼날바람
               8: Result := 6800;    //바위폭탄
               9: Result := 7000;    //마풍석괴
            end;

      41:   case npos of    //mon42
               0: Result := 0;       //전장비석
               1: Result := 40;      //전장비석
               2: Result := 80;      //전장비석
               //현월림
               3: Result := 130;     //숲거북이
               4: Result := 860;     //삼나무정백
               5: Result := 2350;    //곰
               6: Result := 2940;    //표범
               7: Result := 3350;    //유상궁장
               8: Result := 4370;    //양용왕
            end;

      42:   case npos of    //mon43
               0: Result := 0;       //궁수 마법 몹
               1: Result := 580;     //궁수 마법 몹
               2: Result := 1230;    //궁수 마법 몹
               3: Result := 1260;    //궁수 마법 몹
               //설백현 필드
               4: Result := 1370;    //빙원귀
               5: Result := 1790;    //빙원귀병
               6: Result := 2440;    //빙원귀궁사
               7: Result := 3010;    //빙원귀존
               8: Result := 3670;    //설악귀
               9: Result := 4580;    //악귀
            end;

      43:   case npos of    //mon43
               0: Result := 0;       //설랑
               1: Result := 500;     //설태랑
               //본국통로
               2: Result := 500;     //수룡
            end;


      70:   case npos of      //영물
               0: Result := 0;    //아기돼지
               1: Result := 490;
               2: Result := 1060;
               3: Result := 1550;
               4: Result := 2120;
               5: Result := 2610;
               6: Result := 3100;
               7: Result := 3590; //아기흑룡
               8: Result := 4000; //오색알
               9: Result := 4730; //눈사람
            end;
      71:   case npos of      //영물
               0: Result := 5090; //개구리
               1: Result := 5580; //원숭이
            end;
      80:   case npos of
               0: Result := 0;  //마룡
               1: Result := 80;
               2: Result := 300; //용석상1
               3: Result := 301; //용석상2
               4: Result := 302; //용석상3
               5: Result := 320; //용석상4
               6: Result := 321; //용석상5
               7: Result := 322; //용석상6
               8: Result := 321;
            end;
      81:   case npos of
               0: Result := 0;
               1: Result := 360;
               2: Result := 720;
            end;
      90:   case npos of
               0: Result := 80;        //성문
               1: Result := 168;       //내성벽1
               2: Result := 184;       //내성벽2
               3: Result := 200;       //내성벽3
               4: Result := 1070;      //남만외성문
               5: Result := 1140;      //남만내성문
            end;
      end;
end;

function GetNpcOffset(nAppr: Integer): Integer;   //엔피씨
begin
   case nAppr of
      0..22:
         Result := MERCHANTFRAME * nAppr;
      23:
         Result := 1380;
      // 2003/07/15 과거비천 NPC
      27, 32 :
         Result := 1620 + MERCHANTFRAME * (nAppr - 26) - 30;
      26,28,29,30,31,33,34,35..41: // 41:마계수
         Result := 1620 + MERCHANTFRAME * (nAppr - 26);
      42,43: //화롯불1,2
         Result := 2580;
      44,45,46,47: //탑불1,2,3,4
         Result := 2640;
      48,49,50: //48:계단 49:게시판 50:부서진수레
         Result := 2700 + MERCHANTFRAME * (nAppr - 48);
      51: // 민규NPC(귀신)    //2004/05/27 50LevelQuest
         Result := 2880;
      52: //눈사람  //npc추가
         Result := 2960;
      54: //우물
         Result := 3070;
      55: //시체
         Result := 3130;
      56: //경비병
         Result := 3190;
      57: //차원의문
         Result := 3250;
      58: //사자석상
         Result := 3270;
      59: //호혼기석npc
         Result := 3290;
      60: //해골시체-연인퀘스트
         Result := 3330;
      61,62,63,64: //비월신전 불꽃 1,2,3,4
         Result := 3350;
      65: //모닥불
         Result := 3430;
      66: //크리스마스트리 2005/12/14
         Result := 3450;
      67: //이야기하는선원
         Result := 3500;
      68: //선장
         Result := 3570;
      69: //트리보는선원
         Result := 3610;
      70: //앉아있는선원(정면)
         Result := 3630;
      71: //앉아있는선원(왼쪽뒤)
         Result := 3650;
      72: //앉아있는선원(오른쪽뒤)
         Result := 3670;
      73: //배보는선원
         Result := 3690;
      74: //거북석상
         Result := 3710;
      75: //노인
         Result := 3730;
      76: //호위견공
         Result := 3770;
      77: //호위견방
         Result := 3810;
      78: //작은나무
         Result := 3850;
      79: //돌
         Result := 3870;
      80: //책장
         Result := 3890;
      81: Result := 3910;  //우산쓴 레이싱걸
      82: Result := 4070;  //지팡이 노인
      83..85: Result := (nAppr - 83) * 20 + 4110; //기둥 소호NPC
      86, 87: Result := (nAppr - 86) * 30 + 4220; //고대 사냥터초급
      88, 89: Result := (nAppr - 88) * 70 + 4280; //유령
      90: Result := 4420;  //지팡이 삿갓 노인
      91: Result := 4460;  //이동npc
      92, 93: Result := (nAppr - 92) * 30 + 4530;  //화롯불 1 2
      94..96: Result := (nAppr - 94) * 20 + 4590;  //이팩트 게이트
      97..102: Result := (nAppr - 97) * 40 + 4650;   //경비병 검사 대장1 2  부랑자
      103..106: Result := (nAppr - 103) * 20 + 4890;  //여신상 1 2 3 4
      107, 108, 109: Result := (nAppr - 107) * 40 + 4970; //오마 오마전사 비석
      110, 111: Result := (nAppr - 110) * 40 + 5070; //자객동상남, 여
      112..116: Result := (nAppr - 112) * 20 + 4890; //책상, 책장1 2, 수납1 2
      117..119: Result := (nAppr - 117) * 40 + 5250; //월령NPC 신수NPC 탈것NPC
      120, 121: Result := (nAppr - 120) * 20 + 5370; //나무, 천주NPC
      122..126: Result := (nAppr - 122) * 40 + 5410; //호랑이, 싼타, 거미, 수호장, 대장3
      127, 128: Result := (nAppr - 127) * 70 + 5610; //무사1 무사2
      129..146: Result := (nAppr - 129) * 20 + 5750;  //깃발 보물함 동상
      147..149: Result := (nAppr - 147) * 40 + 6110;  //싼타 루돌프 눈사람
      150..157: Result := (nAppr - 150) * 20 + 6230;  //석초광산고양이
      158, 159: Result := (nAppr - 158) * 40 + 6390;  //중국남 여
      160, 161: Result := (nAppr - 160) * 20 + 6470;  //10주년 깃발 1 2
      162: Result := 6510; //횃불
      163..167: Result := (nAppr - 163) * 20 + 6540; //용1 2  11주년 법사 껄러이
      168..170: Result := (nAppr - 168) * 20 + 6690; //12주년 무사
      171..180: Result := (nAppr - 171) * 30 + 6770; //깃발
      181: Result := 7070; //토끼
      182, 183: Result := (nAppr - 182) * 20 + 7110; //13주년
      184..188: Result := (nAppr - 184) * 40 + 7150;
      189, 190: Result := (nAppr - 189) * 70 + 7350;
      191..198: Result := (nAppr - 191) * 40 + 7490;
      199..201: Result := (nAppr - 199) * 20 + 7830;

      //새로운 NPC작업
      240..245: Result := (nAppr - 240) * 10;
      246..250: Result := (nAppr - 246) * 10 + 70;
      251, 252: Result := (nAppr - 251) * 20 + 120;
      253, 254: Result := (nAppr - 253) * 10 + 180;
      255: Result := (nAppr - 255) * 20 + 230;
      else
         Result := 1470 + MERCHANTFRAME * (nAppr - 24);
   end;
end;


constructor TActor.Create;
begin
  inherited Create;
  FillChar(m_Abil,Sizeof(TAbility), 0);
  FillChar(m_Action,SizeOf(m_Action),0);

  m_SayList           := TList.Create;
  m_MsgList           := TGList.Create;
  m_nRecogId          := 0;
  m_BodySurface       := nil;
  m_TigerSurface      := nil;     //호랑이
  m_nGold             := 0;
  m_boVisible         := TRUE;
  m_boHoldPlace       := TRUE;

  m_boHero := False;
  m_boisHero  := False;
  m_nCurrentAction    := 0;
  m_boReverseFrame    := FALSE;
  m_nShiftX           := 0;
  m_nShiftY           := 0;
  m_nDownDrawLevel    := 0;
  m_nCurrentFrame     := -1;
  m_nEffectFrame      := -1;
  RealActionMsg.Ident := 0;
  m_sUserName         := '';
  m_nNameColor        := clWhite;

  m_sRankName         := ' ';
  m_nRankColor        := 0;

  m_dwSendQueryUserNameTime  := 0; //GetTickCount;
  m_boWarMode                := FALSE;
  m_dwWarModeTime            := 0;    //War mode
  g_dwMagicMove              := 0;
  m_dwSpiderMove             := 0;
  m_boDeath                  := FALSE;
  m_boSkeleton               := FALSE;
  m_boDelActor               := FALSE;
  m_boDelActionAfterFinished := FALSE;

  m_btLimitLevel             := 0;
  m_btHeroAutoDurg           := 0;
  m_Group                    := nil;
  m_btTigerRun               := FALSE; //호랑이

  m_btDressRun               := FALSE; //수영복

  m_nMoveHpList := TList.Create;             //타격치
  m_nChrLight                := 0;
  m_nMagLight                := 0;
  m_boLockEndFrame           := FALSE;
  m_dwSmoothMoveTime         := 0; //GetTickCount;
  m_dwGenAnicountTime        := 0;
  m_dwDefFrameTime           := 0;
  m_dwLoadSurfaceTime        := GetTickCount;
  m_dwTDBtimer               := GetTickCount;
  m_boOpenHealth             := FALSE;
  m_noInstanceOpenHealth     := FALSE; //피통
  m_CurMagic.ServerMagicCode := 0;
  m_HealthList               := TGList.Create;

  m_nSpellFrame              := DEFSPELLFRAME;
  m_nNormalSound             := -1;
  m_nFootStepSound           := -1; //CM_WALK, CM_RUN
  m_nAttackSound             := -1;
  m_nWeaponSound             := -1;
  m_nArcherSound := '';
  m_nStruckSound             := s_struck_body_longstick;  //SM_STRUCK
  m_nStruckWeaponSound       := -1;
  m_nScreamSound             := -1;
  m_nDieSound                := -1;    //SM_DEATHNOW
  m_nDie2Sound               := -1;
  TempState := 1;

  m_dwMissionIconTick := GetTickCount;
  m_dwMissionIconIdx := 0;

  m_boStartStore := False;    //개인상점
  m_btEventEffect := 0; //빼빼로
  m_WEffect   := 0;
  m_btColumn := 0; //홍보단

end;

destructor TActor.Destroy;
var
  i : Integer;
  MoveShow: pTMoveHMShow;
begin
  if m_MsgList.Count > 0 then //20080629
    for I := 0 to m_MsgList.Count - 1 do begin
      if pTChrMsg(m_MsgList.Items[I]) <> nil then Dispose(pTChrMsg(m_MsgList.Items[I]));
    end;
  m_MsgList.Clear;
  FreeAndNil(m_MsgList);

  for I := 0 to m_nMoveHpList.Count - 1 do begin        //타격치
    MoveShow := m_nMoveHpList.Items[I];
    MoveShow.Surface.Free;
    Dispose(MoveShow);
  end;
  FreeAndNil(m_nMoveHpList);

  ClearSayList();
  FreeAndNil(m_SayList);
  inherited Destroy;
end;
procedure  TActor.SendMsg(wIdent:Word; nX,nY, ndir,nFeature,nState:Integer;sStr:String;nSound:Integer);
var
  Msg:pTChrMsg;
begin
  New(Msg);
  Msg.ident   := wIdent;
  Msg.x       := nX;
  Msg.y       := nY;
  Msg.dir     := ndir;
  Msg.feature := nFeature;
  Msg.state   := nState;
  Msg.saying  := sStr;
  Msg.Sound   := nSound;
  m_MsgList.Lock;
  try
    m_MsgList.Add(Msg);
  finally
    m_MsgList.UnLock;
  end;
end;

procedure TActor.ClearSayList;
var
  SayMessage: pTSayMessage;
  i: integer;
begin
  for i := 0 to m_SayList.Count - 1 do begin
    SayMessage := m_SayList[i];
    DScreen.DisposeSayMsg(SayMessage);
    Dispose(SayMessage);
  end;
  m_SayList.Clear;
end;


procedure TActor.ShowEffect(nID, nX, nY: Integer);
var
  Meff: TMagicEff;
begin
  Meff := nil;
  case nID of
   { Effect_DEADLINESS: begin
        Meff := TCharEffect.Create(1416 , 12, Self);
        Meff.ImgLib := g_WMain99Images;
        Meff.NextFrameTime := 60 ;
      end;
    Effect_VAMPIRE: begin
        Meff := TCharEffect.Create(1090, 10, Self);
        Meff.ImgLib := g_WMagic2Images;
        Meff.NextFrameTime := 50;
      end;
    EFFECT_MISSION_ACCEPT: begin
        Meff := TCharEffect.Create(1337, 34, Self, False);
        Meff.ImgLib := g_WMain99Images;
        Meff.NextFrameTime := 80;
      end;
    EFFECT_MISSION_NEXT: begin
        Meff := TCharEffect.Create(1217, 28, Self, False);
        Meff.ImgLib := g_WMain99Images;
        Meff.NextFrameTime := 80;
      end;
    EFFECT_MISSION_COMPLETE: begin
        Meff := TCharEffect.Create(1246, 20, Self, False);
        Meff.ImgLib := g_WMain99Images;
        Meff.NextFrameTime := 80;
      end;
    EFFECT_DARE_WIN: begin
        Meff := TCharEffect.Create(1371, 45, Self, False);
        Meff.ImgLib := g_WMain99Images;
        Meff.NextFrameTime := 65;
        PlaySoundEx('wav\dare-win.wav');
      end;
    EFFECT_DARE_LOSS: begin
        Meff := TCharEffect.Create(1278, 58, Self, False);
        Meff.ImgLib := g_WMain99Images;
        Meff.NextFrameTime := 90;
        PlaySoundEx('wav\dare-death.wav');
      end;
    EFFECT_BEACON_1,
      EFFECT_BEACON_2,
      EFFECT_BEACON_3: begin
        Meff := TCharEffect.Create((nID - EFFECT_BEACON_1) * 20, 20, Self);
        Meff.ImgLib := g_WMagic3Images;
        Meff.NextFrameTime := 100;
      end;
    EFFECT_BEACON_4,
      EFFECT_BEACON_5,
      EFFECT_BEACON_6,
      EFFECT_BEACON_7,
      EFFECT_BEACON_8,
      EFFECT_BEACON_9,
      EFFECT_BEACON_10: begin
        Meff := TNormalDrawEffect.Create(m_nCurrX, m_nCurrY, g_WMagic3Images, (nID - EFFECT_BEACON_1) * 20,
          20, 100, True);
        PlaySoundEx('wav\newysound-mix.wav');
      end;
    EFFECT_LEVELUP: begin
        Meff := TCharEffect.Create(2020, 16, Self);
        Meff.ImgLib := g_WMain99Images;
        Meff.NextFrameTime := 100;
        PlaySoundEx('wav\powerup.wav');
      end;      }
    EFFECT_SHIELD: begin
        Meff := TCharEffect.Create(1190, 10, Self);
        Meff.ImgLib := g_WMagic_BonzeImages;
        Meff.NextFrameTime := 60;
        PlaySound2(MB_116);
      end;
    EFFECT_MEDITATION: begin
        if (m_nState and $00000040 <> 0) then
        Meff := TCharEffect.Create(970, 10, Self)
        else Meff := TCharEffect.Create(170, 10, Self);
        Meff.ImgLib := g_WMagic_BonzeImages;
        Meff.NextFrameTime := 60;
        PlaySound2(MB_113_1);
      end;
    EFFECT_THUNDERWAVE: begin
        Meff := TCharEffect.Create(210, 10, Self);
        Meff.ImgLib := g_WMagic_BonzeImages;
        Meff.NextFrameTime := 60;
        PlaySound2(MB_122_1);
      end;
  end;
  if Meff <> nil then
    PlayScene.m_EffectList.Add(Meff);
end;

procedure TActor.UpdateMsg(wIdent:Word; nX,nY, ndir,nFeature,nState:Integer;sStr:String;nSound:Integer);
var
  I: integer;
  Msg:pTChrMsg;
begin
  m_MsgList.Lock;
  try
    I:= 0;
    while TRUE do begin
      if I >= m_MsgList.Count then break;
      Msg:=m_MsgList.Items[I];
      if ((Self = g_MySelf) and (Msg.Ident >= 3000) and (Msg.Ident <= 3099)) or (Msg.Ident = wIdent) then begin
        Dispose(Msg);
        m_MsgList.Delete(I);
        Continue;
      end;
      Inc(I);
    end;
  finally
    m_MsgList.UnLock;
  end;
  SendMsg (wIdent,nX,nY,nDir,nFeature,nState,sStr,nSound);
end;

procedure TActor.CleanUserMsgs;
var
  I:Integer;
  Msg:pTChrMsg;
begin
  m_MsgList.Lock;
  try
    I:= 0;
    while TRUE do begin
      if I >= m_MsgList.Count then break;
      Msg:=m_MsgList.Items[I];
      if (Msg.Ident >= 3000) and
         (Msg.Ident <= 3099) then begin
        Dispose(Msg);
        m_MsgList.Delete (I);
        Continue;
      end;
      Inc(I);
    end;
  finally
    m_MsgList.UnLock;
  end;
end;

procedure TActor.CalcActorFrame;
var
  haircount: integer;
begin
  m_boUseMagic    := FALSE;
  m_nCurrentFrame := -1;

  m_nBodyOffset   := GetOffset (m_wAppearance);
  m_Action := GetRaceByPM(m_btRace,m_wAppearance);
  if m_Action = nil then exit;

   case m_nCurrentAction of
      SM_TURN:
         begin
            m_nStartFrame := m_Action.ActStand.start + m_btDir * (m_Action.ActStand.frame + m_Action.ActStand.skip);
            m_nEndFrame := m_nStartFrame + m_Action.ActStand.frame - 1;
            m_dwFrameTime := m_Action.ActStand.ftime;
            m_dwStartTime := GetTickCount;
            m_nDefFrameCount := m_Action.ActStand.frame;
            Shift (m_btDir, 0, 0, 1);
         end;
      SM_WALK, SM_RUSH, SM_RUSHKUNG, SM_BACKSTEP:
         begin
            m_nStartFrame := m_Action.ActWalk.start + m_btDir * (m_Action.ActWalk.frame + m_Action.ActWalk.skip);
            m_nEndFrame := m_nStartFrame + m_Action.ActWalk.frame - 1;
            m_dwFrameTime := m_Action.ActWalk.ftime;
            m_dwStartTime := GetTickCount;
            m_nMoveStep := 1;
            if m_nCurrentAction = SM_BACKSTEP then
               Shift (GetBack(m_btDir), m_nMoveStep, 0, m_nEndFrame-m_nStartFrame+1)
            else
               Shift (m_btDir, m_nMoveStep, 0, m_nEndFrame-m_nStartFrame+1);
         end;
      SM_HIT:  //왼쪽
         begin
            m_nStartFrame := m_Action.ActAttack.start + m_btDir * (m_Action.ActAttack.frame + m_Action.ActAttack.skip);
            m_nEndFrame := m_nStartFrame + m_Action.ActAttack.frame - 1;
            m_dwFrameTime := m_Action.ActAttack.ftime;
            m_dwStartTime := GetTickCount;
            //WarMode := TRUE;
            m_dwWarModeTime := GetTickCount;
            Shift (m_btDir, 0, 0, 1);
         end;
      SM_STRUCK:
         begin
            m_nStartFrame := m_Action.ActStruck.start + m_btDir * (m_Action.ActStruck.frame + m_Action.ActStruck.skip);
            m_nEndFrame := m_nStartFrame + m_Action.ActStruck.frame - 1;
            m_dwFrameTime := m_dwStruckFrameTime; //pm.ActStruck.ftime;
            m_dwStartTime := GetTickCount;
            Shift (m_btDir, 0, 0, 1);

            m_dwGenAnicountTime := GetTickCount; //혈룡수
         end;
      SM_DEATH:
         begin
            m_nStartFrame := m_Action.ActDie.start + m_btDir * (m_Action.ActDie.frame + m_Action.ActDie.skip);
            m_nEndFrame := m_nStartFrame + m_Action.ActDie.frame - 1;
            m_nStartFrame := m_nEndFrame; //
            m_dwFrameTime := m_Action.ActDie.ftime;
            m_dwStartTime := GetTickCount;
         end;
      SM_NOWDEATH:
         begin
            m_nStartFrame := m_Action.ActDie.start + m_btDir * (m_Action.ActDie.frame + m_Action.ActDie.skip);
            m_nEndFrame := m_nStartFrame + m_Action.ActDie.frame - 1;
            m_dwFrameTime := m_Action.ActDie.ftime;
            m_dwStartTime := GetTickCount;
         end;
      SM_SKELETON:
         begin
            m_nStartFrame := m_Action.ActDeath.start + m_btDir;
            m_nEndFrame := m_nStartFrame + m_Action.ActDeath.frame - 1;
            m_dwFrameTime := m_Action.ActDeath.ftime;
            m_dwStartTime := GetTickCount;
         end;
   end;
end;

procedure TActor.ReadyAction (msg: TChrMsg);
var
   n: integer;
   UseMagic: PTUseMagicInfo;
   gCheck : Boolean; //연구
   i ,Feature: integer;
   actor: TActor;
begin
   m_nActBeforeX := m_nCurrX;
   m_nActBeforeY := m_nCurrY;

   if msg.Ident = SM_ALIVE then begin
      m_boDeath := FALSE;
      m_boSkeleton := FALSE;
      if Self = g_MySelf then begin
        FrmDlg2.DWndDeath.Visible := False;
      end;
   end;
   if not m_boDeath then begin
      case msg.Ident of
         SM_TURN, SM_WALK, SM_DOWN,SM_BACKSTEP, SM_MAGICMOVE, SM_RUSH, SM_RUSHKUNG, SM_RUN, SM_HORSERUN ,SM_SPEEDRUN,SM_DOWNRUN ,SM_DIGUP, SM_ALIVE:
            begin                                                   //경신보
               m_nFeature := msg.feature;
               m_nState := msg.state;
               //캐릭터의 부가적인 상태 표시
               if m_nState and STATE_OPENHEATH <> 0 then m_boOpenHealth := TRUE;
            end;
      end;
      if msg.Ident in [SM_LIGHTING_1..SM_LIGHTING_3] then
         n := 0;
      if msg.Ident = SM_LIGHTING_4 then
         n := 0;
      if msg.Ident = SM_LIGHTING_5 then
         n := 0;
      if msg.Ident = SM_LIGHTING_6 then
         n := 0;
      if msg.ident = SM_LIGHTING then
         n := 0;
      if g_MySelf = self then begin
         if (msg.Ident = CM_WALK) then
            if not PlayScene.CanWalk (msg.x, msg.y) then
              exit;
         if (msg.Ident = CM_DOWN) then
            if not PlayScene.CanWalk (msg.x, msg.y) then
              exit;
         if (msg.Ident = CM_RUN) then
            if not PlayScene.CanRun (g_MySelf.m_nCurrX, g_MySelf.m_nCurrY, msg.x, msg.y) then
              exit;
         if (msg.Ident = CM_SPEEDRUN) then   //경신보
            if not PlayScene.CanRun (g_MySelf.m_nCurrX, g_MySelf.m_nCurrY, msg.x, msg.y) then
              exit;
         if (msg.Ident = CM_DOWNRUN) then   //월영술 달리기
            if not PlayScene.CanRun (g_MySelf.m_nCurrX, g_MySelf.m_nCurrY, msg.x, msg.y) then
              exit;
         if (msg.Ident = CM_HORSERUN) then
            if not PlayScene.CanRun (g_MySelf.m_nCurrX, g_MySelf.m_nCurrY, msg.x, msg.y) then
              exit;
         //msg
         case msg.Ident of
            CM_TURN,
            CM_WALK,
            CM_DOWN, //월영술
            CM_SITDOWN,
            CM_RUN,
            CM_HIT,
            CM_HEAVYHIT,
            CM_BIGHIT,
            CM_HITLEFT,
            CM_POWERHIT,
            CM_LONGHIT,
            CM_WBHIT,   //풍검술
            CM_WBHIT2, //풍검술
            CM_SPEEDRUN, //경신보
            CM_DOWNRUN, //월영술
            CM_WIDEHIT,
            CM_DEATHHIT, //살생도
            CM_FISHING1,      //낚시
            CM_FISHING2:      //낚시
               begin
                  RealActionMsg := msg;
                  msg.Ident := msg.Ident - 3000;
               end;
            CM_TAGUHIT: //타구봉법 - 승려
               begin
                  RealActionMsg := msg;
                  msg.Ident := SM_TAGUHIT;
               end;
            CM_CPOWERHIT:
               begin
                  RealActionMsg := msg;
                  msg.Ident := SM_CPOWERHIT;
               end;
            CM_CFIREHIT:
               begin
                  RealActionMsg := msg;
                  msg.Ident := SM_CFIREHIT;
               end;
            CM_HORSERUN: begin
              RealActionMsg := msg;
              msg.Ident := SM_HORSERUN;
            end;
            CM_FIREHIT: begin
              RealActionMsg := msg;
              msg.Ident := SM_FIREHIT;
            end;
            CM_CRSHIT: begin
              RealActionMsg := msg;
              msg.Ident := SM_CRSHIT;
            end;
            CM_NANCRSHIT: begin
              RealActionMsg := msg;
              msg.Ident := SM_NANCRSHIT;
            end;
            CM_CRBHIT: begin
              RealActionMsg := msg;
              msg.Ident := SM_CRBHIT;
            end;
            CM_TWINHIT: begin
              RealActionMsg := msg;
              msg.Ident := SM_TWINHIT;
            end;
            CM_THUNDERHIT: begin
              RealActionMsg := msg;
              msg.Ident := SM_THUNDERHIT;
            end;
            CM_FIRESHAOLIN: begin
              RealActionMsg := msg;
              msg.Ident := SM_FIRESHAOLIN;
            end;
            CM_BALDO: begin
              RealActionMsg := msg;
              msg.Ident := SM_BALDO;   //발도술
            end;
            CM_BALDO2: begin
              RealActionMsg := msg;
              msg.Ident := SM_BALDO2;   //발도술
            end;
            CM_SPELL: begin
              RealActionMsg := msg;
              UseMagic := PTUseMagicInfo (msg.feature);
              RealActionMsg.Dir := UseMagic.MagicSerial;
              msg.Ident := msg.Ident - 3000;
            end;
            CM_BOW:      //궁수활
               begin
               {  if msg.State <> 0 then begin
                    m_nTargetX := TActor(msg.State).m_nCurrX;    //x
                    m_nTargetY := TActor(msg.State).m_nCurrY;    //y
                    m_nTargetRecog := TActor(msg.State).m_nRecogId;
                 end;                 }
                  RealActionMsg := msg;
                  msg.Ident := SM_BOW;
               end;
         end;

         m_nOldx := m_nCurrX;
         m_nOldy := m_nCurrY;
         m_nOldDir := m_btDir;
      end;
      case msg.Ident of
         SM_STRUCK:
            begin
               //Abil.HP := msg.x; {HP}
               //Abil.MaxHP := msg.y; {maxHP}
               //msg.dir {damage}
               m_nMagicStruckSound := msg.x;
               n := Round (200 - m_Abil.Level * 5);
               if n > 80 then m_dwStruckFrameTime := n
               else m_dwStruckFrameTime := 80;
              // m_dwLastStruckTime := GetTickCount;  //맞고 바로 뛴다.
               gCheck := FALSE;
               if GroupIdList.Count > 0 then
                  for i := 0 to GroupIdList.Count-1 do begin
                      if integer(GroupIdList[i]) = m_nHiterCode then begin
                         gCheck := True;
                         Break;
                      end;
                  end;

               if ((m_btRace <> 0) and (m_btRace <> 34) and not (m_btRace in [240..251]) and (m_nHiterCode = g_Myself.m_nRecogId) or gCheck) and (m_Abil.MaxHP < 3000) and (m_abil.Level < 80) then begin   //MonOpenHp
                  if not m_noInstanceOpenHealth then begin
                     m_noInstanceOpenHealth := TRUE;
                     m_dwOpenHealthTime := 60 * 1000;
                     m_dwOpenHealthStart := GetTickCount;
                  end;
               end;
               if m_btRace = 0 then m_noInstanceOpenHealth := False;
            end;
         SM_SPELL:
            begin
               m_btDir := msg.dir;
               //msg.x  :targetx
               //msg.y  :targety
               UseMagic := PTUseMagicInfo (msg.feature);
               if UseMagic <> nil then begin
                  m_CurMagic := UseMagic^;
                  m_CurMagic.ServerMagicCode := -1; //FIRE
                  //CurMagic.MagicSerial := 0;
                  m_CurMagic.TargX := msg.x;
                  m_CurMagic.TargY := msg.y;
                  Dispose (UseMagic);
               end;
               //DScreen.AddSysMsg ('SM_SPELL');
            end;
         else begin
               m_nCurrX := msg.x;
               m_nCurrY := msg.y;
               m_btDir := msg.dir;
            end;
      end;

      m_nCurrentAction := msg.Ident;
      CalcActorFrame;
   end else begin
      if msg.Ident = SM_SKELETON then begin
         m_nCurrentAction := msg.Ident;
         CalcActorFrame;
         m_boSkeleton := TRUE;
      end;
   end;
   if (msg.Ident = SM_DEATH) or (msg.Ident = SM_NOWDEATH) then begin
      if GroupIdList.Count > 0 then
         for i := 0 to GroupIdList.Count-1 do begin  // MonOpenHp
             if integer(GroupIdList[i]) = m_nRecogId then begin
                GroupIdList.Delete(i);
                Break;
             end;
         end;
        m_boDeath := TRUE;
        if g_MySelf = self then g_BoPetOn := FALSE;
        PlayScene.ActorDied (self);
   end;

   RunSound;

end;


function TActor.GetMessage(ChrMsg:pTChrMsg): Boolean;
var
  Msg:pTChrMsg;
begin
  Result:=False;
  m_MsgList.Lock;
  try
    if m_MsgList.Count > 0 then begin
      Msg:=m_MsgList.Items[0];
      ChrMsg.Ident:=Msg.Ident;
      ChrMsg.X:=Msg.X;
      ChrMsg.Y:=Msg.Y;
      ChrMsg.Dir:=Msg.Dir;
      ChrMsg.State:=Msg.State;
      ChrMsg.feature:=Msg.feature;
      ChrMsg.saying:=Msg.saying;
      ChrMsg.Sound:=Msg.Sound;
      Dispose(Msg);
      m_MsgList.Delete(0);
      Result:=True;
    end;
  finally
    m_MsgList.UnLock;
  end;
end;

procedure TActor.ProcMsg;
var
  Msg:TChrMsg;
  Meff:TMagicEff;
begin
   while (m_nCurrentAction = 0) and GetMessage(@Msg) do begin
      case Msg.ident of
         SM_STRUCK: begin
           m_nHiterCode := msg.Sound;
           ReadyAction (msg);
         end;
         SM_DEATH,  //27
         SM_NOWDEATH,
         SM_SKELETON,
         SM_ALIVE,
         SM_ACTION_MIN..SM_ACTION_MAX,  //0~26
         SM_DEATHHIT,SM_ACTION2_MIN..SM_ACTION2_MAX,//40~100   2293    293
         SM_ACTION3_MIN..SM_ACTION3_MAX, // 300~310
         3000..3100:
             begin
                  ReadyAction (msg);
             end;
         SM_BLASTHIT: begin //참진격
            meff := TBlasthitEffect.Create(0, 4, Self);
            PlayScene.m_EffectList.Add(meff);
            PlaySound (10735);
         end;
         SM_SPACEMOVE_HIDE: begin
           if self.m_btRace = 106 then begin
             if g_boEffect then begin
               meff := TScrollHideEffect.Create (1300, 10, m_nCurrX, m_nCurrY, self);
               meff.ImgLib := g_WMagic2Images;
               PlayScene.m_EffectList.Add (meff);
             end;
             PlaySound (s_spacemove_out);
           end else if self.m_btRace = 111 then begin
             if g_boEffect then begin
               meff := TScrollHideEffect.Create (800, 10, m_nCurrX, m_nCurrY, self);
               meff.ImgLib := g_WMonImagesArr[23];
               PlayScene.m_EffectList.Add (meff);
             end;
             PlaySound (s_spacemove_out);
           end else begin
             if g_boEffect then begin
               meff := TScrollHideEffect.Create (250, 10, m_nCurrX, m_nCurrY, self);
               PlayScene.m_EffectList.Add (meff);
             end;
             PlaySound (s_spacemove_out);
           end;
         end;
         SM_SPACEMOVE_HIDE2: begin
           if g_boEffect then begin
             meff := TScrollHideEffect.Create (1590, 10, m_nCurrX, m_nCurrY, self);
             PlayScene.m_EffectList.Add (meff);
           end;
           PlaySound (s_spacemove_out);
         end;
         SM_SPACEMOVE_HIDE3: begin
           if g_boEffect then begin
             meff := TScrollHideEffect.Create (1610, 10, m_nCurrX, m_nCurrY, self);
             PlayScene.m_EffectList.Add (meff);
           end;
         end;
         SM_SPACEMOVE_SHOW: begin
           if m_btRace = 106 then begin
             if g_boEffect then begin
               meff := TScrollHideEffect.Create (1310, 10, m_nCurrX, m_nCurrY, self);
               meff.ImgLib := g_WMagic2Images;
               PlayScene.m_EffectList.Add (meff);
             end;
             PlaySound (s_spacemove_in);
           end else if m_btRace = 111 then begin
             if g_boEffect then begin
               meff := TScrollHideEffect.Create (810, 10, m_nCurrX, m_nCurrY, self);
               meff.ImgLib := g_WMonImagesArr[23];
               PlayScene.m_EffectList.Add (meff);
             end;
             PlaySound (s_spacemove_in);
           end else begin
             if g_boEffect then begin
               meff := TCharEffect.Create (260, 10, self);
               PlayScene.m_EffectList.Add (meff);
             end;
             PlaySound (s_spacemove_in);
           end;
           msg.ident := SM_TURN;
           ReadyAction (msg);
         end;
         SM_SPACEMOVE_SHOW2: begin
           if g_boEffect then begin
             meff := TCharEffect.Create (1600, 10, self);
             PlayScene.m_EffectList.Add (meff);
           end;
           msg.ident := SM_TURN;
           ReadyAction (msg);
           PlaySound (s_spacemove_in);
         end;
         SM_SPACEMOVE_SHOW3: begin
           if g_boEffect then begin
             meff := TCharEffect.Create (1610, 10, self);
             PlayScene.m_EffectList.Add (meff);
           end;
           msg.ident := SM_TURN;
           ReadyAction (msg);
         end;
         SM_SPACEMOVE_SHOW4: begin
           if g_boEffect then begin
             meff := TCharEffect.Create (1610, 10, self);
             PlayScene.m_EffectList.Add (meff);
           end;
           msg.ident := SM_TURN;
           ReadyAction (msg);
         end;
         else
            begin

            end;
      end;
   end;
end;

procedure TActor.ProcHurryMsg;          //빨리 처리해야 되는 메세지 처리함..
var
   n: integer;
   msg: TChrMsg;
   fin: Boolean;
begin
  m_MsgList.Lock;
  try
   n := 0;
   while TRUE do begin
      if m_MsgList.Count <= n then break;
      msg := PTChrMsg (m_MsgList[n])^;
      fin := FALSE;
      case msg.Ident of
         SM_MAGICFIRE: begin
            if m_CurMagic.ServerMagicCode <> 0 then begin
               m_CurMagic.ServerMagicCode := 111;
               m_CurMagic.Target := msg.x;
               if msg.y in [0..MAXMAGICTYPE-1] then
                  m_CurMagic.EffectType := TMagicType(msg.y); //EffectType
               m_CurMagic.EffectNumber := msg.dir; //Effect
               m_CurMagic.TargX := msg.feature;
               m_CurMagic.TargY := msg.state;
               m_CurMagic.Recusion := TRUE;
               fin := TRUE;
            end;
         end;
         SM_MAGICFIRE_FAIL: begin
            if m_CurMagic.ServerMagicCode <> 0 then begin
               m_CurMagic.ServerMagicCode := 0;
               fin := TRUE;
            end;
         end;
      end;
      if fin then begin
         Dispose (PTChrMsg (m_MsgList[n]));
         m_MsgList.Delete (n);
      end else
         Inc (n);
   end;
  finally
    m_MsgList.UnLock;
  end;
end;

function  TActor.IsIdle: Boolean;
begin
   if (m_nCurrentAction = 0) and (m_MsgList.Count = 0) then
      Result := TRUE
   else Result := FALSE;
end;

function  TActor.ActionFinished: Boolean;
begin
   if (m_nCurrentAction = 0) or (m_nCurrentFrame >= m_nEndFrame) then
      Result := TRUE
   else Result := FALSE;
end;

function  TActor.CanWalk: Integer;
begin
   if (GetTickCount - m_dwHumUpTime < 10 * 1000) or (GetTickCount - g_dwLatestSpellTick < g_dwMagicPKDelayTime) then
      Result := -1
   else
      Result := 1;
end;

function  TActor.CanRun: Integer;
begin
   //쇱꿴훙膠돨HP令角뤠됴黨寧땍令，됴黨寧땍令쉥꼇豚冀텝
   //얻어 맞은 다음에 바로 뛸 수 없음..
   Result := 1;
   if m_Abil.HP < RUN_MINHEALTH then begin
      Result := -1;
   end else
   if (GetTickCount - m_dwLastStruckTime < 3000) or (GetTickCount - g_dwLatestSpellTick < g_dwMagicPKDelayTime) then
      Result := -2;
end;

function  TActor.Strucked: Boolean;
var
   i: integer;
begin
   Result := FALSE;
   for i:=0 to m_MsgList.Count-1 do begin
      if PTChrMsg (m_MsgList[i]).Ident = SM_STRUCK then begin
         Result := TRUE;
         break;
      end;
   end;
end;

//dir : 방향
//step : 이동 칸
//cur : 현재 스텝
//max : 최대 스텝

procedure TActor.Shift (dir, step, cur, max: integer);
var
   unx, uny, ss, v: integer;
begin
   unx := UNITX * step;
   uny := UNITY * step;
   if cur > max then
   cur := max;
   m_nRx := m_nCurrX;
   m_nRy := m_nCurrY;
   ss := Round((max-cur-1) / max) * step;
   case dir of
      DR_UP: begin
        ss := Round((max-cur) / max) * step;
        m_nShiftX := 0;
        m_nRy := m_nCurrY + ss;
        if ss = step then
        m_nShiftY := -Round(uny / max * cur)
        else
        m_nShiftY := Round(uny / max * (max-cur));
      end;
      DR_UPRIGHT:
         begin                      //경신보 화면 수정
            if max >= 6 then
            v := 1    //2
            else
            v := 0;
            ss := Round((max-cur+v) / max) * step;
            m_nRx := m_nCurrX - ss;
            m_nRy := m_nCurrY + ss;
            if ss = step then begin
               m_nShiftX:=  Round(unx / max * cur);
               m_nShiftY:= -Round(uny / max * cur);
            end else begin
               m_nShiftX:= -Round(unx / max * (max-cur));
               m_nShiftY:=  Round(uny / max * (max-cur));
            end;
         end;
      DR_RIGHT:
         begin
            ss := Round((max-cur) / max) * step;
            m_nRx := m_nCurrX - ss;
            if ss = step then m_nShiftX := Round(unx / max * cur)
            else m_nShiftX := -Round(unx / max * (max-cur));
            m_nShiftY := 0;
         end;
      DR_DOWNRIGHT:
         begin

            if max >= 6 then v := 1    //2
            else v := 0;
            ss := Round((max-cur-v) / max) * step;
            m_nRx := m_nCurrX - ss;
            m_nRy := m_nCurrY - ss;
            if ss = step then begin
               m_nShiftX:= Round(unx / max * cur);
               m_nShiftY:= Round(uny / max * cur);
            end else begin
               m_nShiftX:= -Round(unx / max * (max-cur));
               m_nShiftY:= -Round(uny / max * (max-cur));
            end;
         end;
      DR_DOWN:
         begin
            if max >= 6 then v := 1
            else v := 0;
            ss := Round((max-cur-v) / max) * step;
            m_nShiftX := 0;
            m_nRy := m_nCurrY - ss;
            if ss = step then m_nShiftY := Round(uny / max * cur)
            else m_nShiftY := -Round(uny / max * (max-cur));
         end;
      DR_DOWNLEFT:
         begin
            if max >= 6 then v := 0   //2
            else v := 0;
            ss := Round((max-cur-v) / max) * step;
            m_nRx := m_nCurrX + ss;
            m_nRy := m_nCurrY - ss;
            if ss = step then begin
               m_nShiftX := -Round(unx / max * cur);
               m_nShiftY :=  Round(uny / max * cur);
            end else begin
               m_nShiftX :=  Round(unx / max * (max-cur));
               m_nShiftY := -Round(uny / max * (max-cur));
            end;
         end;
      DR_LEFT:
         begin
            ss := Round((max-cur) / max) * step;
            m_nRx := m_nCurrX + ss;
            if ss = step then m_nShiftX := -Round(unx / max * cur)
            else m_nShiftX := Round(unx / max * (max-cur));
            m_nShiftY := 0;
         end;
      DR_UPLEFT:
         begin
            if max >= 6 then v := 1   //2
            else v := 0;
            ss := Round((max-cur+v) / max) * step;
            m_nRx := m_nCurrX + ss;
            m_nRy := m_nCurrY + ss;
            if ss = step then begin
               m_nShiftX := -Round(unx / max * cur);
               m_nShiftY := -Round(uny / max * cur);
            end else begin
               m_nShiftX := Round(unx / max * (max-cur));
               m_nShiftY := Round(uny / max * (max-cur));
            end;
         end;
   end;
end;

procedure  TActor.FeatureChanged;
var
   haircount: integer;
begin
   case m_btRace of
      //human
      0: begin
         m_btHair   := HAIRfeature (m_nFeature);
         m_btDress  := DRESSfeature (m_nFeature);
         m_btWeapon := WEAPONfeature (m_nFeature);
         m_btHorse  := Horsefeature(m_nFeatureEx);
         m_btEffect := Effectfeature(m_nFeatureEx);
         m_nBodyOffset := HUMANFRAME * m_btDress; //남0, 여1

       //  if m_btHair > haircount-1 then
       //  m_btHair := haircount-1;
         m_btHair := m_btHair * 2;

        if m_btHair > 1 then begin
          if (m_btHorse <> 0)  then begin    //호랑이  시작
            m_nHairOffset := HUMANFRAME * (m_btHair + m_btSex) ;
          end else begin
            if m_btJob in [5..8] then begin    //우화등선 헤어 프레임
              if m_btWeapon in [98,99,146..155] then begin    //우화등선 벽혈 헤어
                m_nHairOffset := HUMUPWARRFRAME * (m_btHair + m_btSex);
              end else
              if m_btWeapon in [100..103,156..171] then begin    //우화등선 홍현 익선 헤어
                m_nHairOffset := HUMUPWIZ_MONKDFRAME * (m_btHair + m_btSex);
              end else
              if m_btWeapon in [172..179,192..197,200..205,208,209] then begin  //우화등선 비연 헤어
                m_nHairOffset := HUMUPASSFRAME * (m_btHair + m_btSex);
              end else
                m_nHairOffset := HUMANFRAME * (m_btHair + m_btSex);  //우화등선 공용 헤어
            end else begin
              if m_btJob in [4, 9] then begin
                m_nHairOffset := -1;
              end else begin
                if m_btJob = 3 then begin        //자객 헤어
                  if (m_btWeapon > 179) and (m_btWeapon < 220) then begin   //자객 무기
                    m_nHairOffset := HUMKILLFRAME * (m_btHair + m_btSex);
                  end else
                    m_nHairOffset := HUMANFRAME * (m_btHair + m_btSex);
                  if (m_btWeapon = 0) or (m_btWeapon = 1) then begin
                    m_nHairOffset := HUMKILLFRAME * (m_btHair + m_btSex);
                  end;
                end else begin
                  m_nHairOffset := HUMANFRAME * (m_btHair + m_btSex);
                end;
              end;
            end;  //호랑이 끝
          end;
        end else
          m_nHairOffset := -1;

        if m_btEffect = 60 then       //FeatureChanged
          m_nHairOffset := -1;

        if m_btEffect <> 0 then begin
          if m_btEffect = 50 then begin
            m_nHumWinOffset:=352             //파황천마
          end else begin
            if m_btEffect = 60 then begin        //흑룡신갑 FeatureChanged
              if m_btJob in [5..8] then begin
                m_nHumWinOffset := 20;
                m_nHumHanOffset := 0;
              end else begin
                m_nHumWinOffset:=0;
                case m_btJob of
                  0..2: m_nHumHanOffset := 6672;
                  3: begin
                   if (m_btWeapon > 179) and (m_btWeapon < 220) then begin
                     m_nHumHanOffset := 4368;
                   end else
                     m_nHumHanOffset := 6672;
                   if (m_btWeapon = 0) or (m_btWeapon = 1) then begin
                     m_nHumHanOffset := 4368;
                   end;
                  end;
                  4: m_nHumHanOffset := 1536;
                end;
              end;
            end else begin
              m_nHumWinOffset:=(m_btEffect - 1) * HUMANFRAME;
              if (m_btHorse <> 0) then begin    //호랑이
                if m_btJob in [5..8] then begin
                  m_nHumWinOffset:=(m_btEffect + 1) * HUMANFRAME;
                end else
                  m_nHumWinOffset:=(m_btEffect - 1) * HUMANFRAME;
              end else begin
                if m_btJob in [5..8] then begin    //우화등선 프레임
                  if m_btWeapon in [98,99,146..155] then begin    //우화등선 벽혈
                    m_nHumWinOffset := HUMUPWARRFRAME * (m_btEffect+ 1);
                  end else
                  if m_btWeapon in [100..103,156..171] then begin    //우화등선 홍현 익선
                    m_nHumWinOffset := HUMUPWIZ_MONKDFRAME * (m_btEffect+ 1);
                  end else
                  if m_btWeapon in [172..179,192..197,200..205,208,209] then begin  //우화등선 비연
                    m_nHumWinOffset := HUMUPASSFRAME * (m_btEffect+ 1);
                  end else
                    m_nHumWinOffset := HUMANFRAME * (m_btEffect+ 1);  //우화등선 공용
                end else begin
                  if (m_btJob in [4, 9]) then begin     //승려 이팩트
                     m_nHumWinOffset:=(m_btEffect - 1) * HUMBONZE;
                  end else begin
                    if m_btJob = 3 then begin
                      if (m_btWeapon > 179) and (m_btWeapon < 220) then begin    //자객 무기 일때
                        m_nHumWinOffset:=(m_btEffect - 1) * HUMKILLFRAME
                      end else
                        m_nHumWinOffset:=(m_btEffect - 1) * HUMANFRAME;
                      if (m_btWeapon = 0) or (m_btWeapon = 1) then begin
                        m_nHumWinOffset:=(m_btEffect - 1) * HUMKILLFRAME;
                      end;
                    end else begin
                      m_nHumWinOffset:=(m_btEffect - 1) * HUMANFRAME;
                    end;
                  end;
                end;
              end;
            end;
          end;
        end;
        if (m_btJob in [4, 9]) then begin
          if m_btWeapon = 30 then WeaponEffectOffset := 0;        //승려무기 이팩트
          if m_btWeapon = 28 then WeaponEffectOffset := 728;       //승려무기 이팩트
        end else begin
          if m_btWeapon in [76, 77] then begin
            if m_btWeapon = 76 then WeaponEffectOffset := 4448        // 파관진검 이펙트(남)
            else if m_btWeapon = 77 then WeaponEffectOffset := 5048;  // 파관진검 이펙트(여)
          end else begin
            if m_WEffect > 0 then begin
              if m_btJob = 5 then begin
                WeaponEffectOffset := HUMUPWARRFRAME * (((m_WEffect * 2) - 146) + m_btSex);
              end else
              if m_btJob = 6 then begin
                WeaponEffectOffset := HUMUPWIZ_MONKDFRAME * (((m_WEffect * 2) - 156) + m_btSex);
              end else
              if m_btJob = 7 then begin
                WeaponEffectOffset := HUMUPWIZ_MONKDFRAME * (((m_WEffect * 2) - 164) + m_btSex);
              end else
              if m_btJob = 8 then begin
                WeaponEffectOffset := HUMUPASSFRAME * (((m_WEffect * 2) - 172) + m_btSex);
              end else begin
                if m_WEffect in [93..98] then begin
                  WeaponEffectOffset := HUMKILLFRAME * (((m_WEffect * 2) - 180) + m_btSex);
                end else begin
                  WeaponEffectOffset := HUWEAPONFRAME * ((m_WEffect * 2) + m_btSex);
                end;
              end;
            end;
          end;
        end;

      end;

      50: ;  //npc
      else begin
         m_wAppearance := APPRfeature (m_nFeature);
         m_nBodyOffset := GetOffset (m_wAppearance);
      end;
   end;
end;

function   TActor.Light: integer;
begin
   Result := m_nChrLight;
end;

procedure  TActor.LoadSurface;
var
   mimg: TWMImages;
begin
   mimg := GetMonImg (m_wAppearance);
   if mimg <> nil then begin
      if (not m_boReverseFrame) then
         m_BodySurface := mimg.GetCachedImage (GetOffset (m_wAppearance) + m_nCurrentFrame, m_nPx, m_nPy)
      else
         m_BodySurface := mimg.GetCachedImage (
                            GetOffset (m_wAppearance) + m_nEndFrame - (m_nCurrentFrame-m_nStartFrame),
                            m_nPx, m_nPy);
   end;
end;

function  TActor.CharWidth: Integer;
begin
   if m_BodySurface <> nil then
      Result := m_BodySurface.Width
   else
   Result := 48;
end;

function  TActor.CharHeight: Integer;
begin
   if m_BodySurface <> nil then
      Result := m_BodySurface.Height
   else
   Result := 70;
end;

function  TActor.CheckSelect (dx, dy: integer): Boolean;
var
  c:Integer;
begin
  Result := FALSE;
  if m_BodySurface <> nil then begin
    c := m_BodySurface.Pixels[dx, dy];
    if (c <> 0) and
       ((m_BodySurface.Pixels[dx-1, dy] <> 0) and
       (m_BodySurface.Pixels[dx+1, dy] <> 0) and
       (m_BodySurface.Pixels[dx, dy-1] <> 0) and
       (m_BodySurface.Pixels[dx, dy+1] <> 0)) then
     Result := TRUE;
  end;
end;

procedure TActor.DrawStruck(dsurface: TDirectDrawSurface);       //타격치
var
  i, ii, ax, ay, nx, ny: integer;
  MoveShow: pTMoveHMShow;
  Index: integer;
  SayMessage: pTSayMessage;
  SayImage: pTSayImage;
  d: TDirectDrawSurface;
  py: smallint;
  dc, rc :TRect;
begin
  if (GetTickCount < m_dwSayTime) then begin
    for I := 0 to m_SayList.Count - 1 do begin
      SayMessage := m_SayList[i];
      ax := m_nSayX - (m_SayWidthsArr div 2);
      ay := m_nSayY - 3 - (m_SayList.Count * 16) + i * 14;
      dsurface.Draw(ax, ay, SayMessage.SaySurface.ClientRect, SayMessage.SaySurface, True);
      if (SayMessage.ImageList <> nil) and (SayMessage.ImageList.Count > 0) then begin
        for ii := 0 to SayMessage.ImageList.Count - 1 do begin
          SayImage := SayMessage.ImageList[ii];
          if (SayImage.nIndex <= High(g_FaceIndexInfo)) then begin
            d := g_WFaceImages.GetCachedImage(g_FaceIndexInfo[SayImage.nIndex].ImageIndex, nx, ny);
            if d <> nil then begin
              dc.Left := ax + SayImage.nLeft;
              dc.Top := ay + (SAYLISTHEIGHT - d.Height) div 2 + 2;
              dc.Right := dc.Left + 15;
              dc.Bottom := dc.Top + 15;
              rc.Left := 0;
              rc.Top := 0;
              rc.Right := d.ClientRect.Right;
              rc.Bottom := d.ClientRect.Bottom;
              dsurface.DrawAlpha (dc, rc, d, True, 255);
              py := ny;
              if (GetTickCount - g_FaceIndexInfo[SayImage.nIndex].dwShowTime) > LongWord(nx) then begin
                g_FaceIndexInfo[SayImage.nIndex].ImageIndex := g_FaceIndexInfo[SayImage.nIndex].ImageIndex + py;
                g_FaceIndexInfo[SayImage.nIndex].dwShowTime := GetTickCount;
              end;
            end;
          end;
        end;
      end;
    end;
  end;
  i := 0;
  while TRUE do begin
    if I >= m_nMoveHpList.Count then         //타격치
      break;
    MoveShow := m_nMoveHpList.Items[I];
    Index := (GetTickCount - MoveShow.dwMoveHpTick) div 40;
    if Index > 40 then begin
      MoveShow.Surface.Free;
      m_nMoveHpList.Delete(I);
      Dispose(MoveShow);
    end
    else if Index > 20 then begin
      DrawBlendalpha(dsurface, m_nSayX - MoveShow.Surface.Width div 2 + Index, m_nSayY - Index - 10,
               MoveShow.Surface, MoveShow.Surface.ClientRect.Left,
               MoveShow.Surface.ClientRect.Top, MoveShow.Surface.ClientRect.Right,
               MoveShow.Surface.ClientRect.Bottom,  (45 - Index) * 10);
      Inc(I);
    end
    else begin
      dsurface.Draw(m_nSayX - MoveShow.Surface.Width div 2 + Index, m_nSayY - Index - 10,
        MoveShow.Surface.ClientRect, MoveShow.Surface, TRUE);
      Inc(I);
    end;
  end;
end;

procedure TActor.DrawEffSurface (dsurface, source: TDirectDrawSurface; ddx, ddy: integer; blend: Boolean; ceff: TColorEffect; mode: integer = 0);
var
  actor:Tactor;
  idx, ax, ay: integer;
  d: TDirectDrawSurface;
  ErrorCode: Integer;
begin
   if m_nState and $00800000 <> 0 then begin
      blend := TRUE;     //투명
   end;
   if m_nState and $00000200 <> 0 then begin   //망자의옷
      blend := TRUE;
   end;
   if m_nState and $00000080 <> 0 then begin   //월영무
      blend := TRUE;
   end;
   if m_nState and $00004000 <> 0 then begin    //월영술 안보이게 투명
      blend := TRUE;
   end;

  if source.Height > 350 then begin
  //  drawex(dsurface, ddx, ddy, source, 0, 0, source.Width, source.Height, 0);
    dsurface.Draw (ddx, ddy, source.ClientRect, source, TRUE);
    exit;
  end;
   if not Blend then begin
      if ceff = ceNone then begin
         if source <> nil then
         try
            if mode = 1 then DrawBlend (dsurface, ddx, ddy, source, mode)
            else dsurface.Draw (ddx, ddy, source.ClientRect, source, TRUE);
         except
           DebugOutStr ('image to big');
         end;
      end else begin
         if source <> nil then begin
            g_ImgMixSurface.Fill(0);
            g_ImgMixSurface.Draw (0, 0, source.ClientRect, source, FALSE);
            DrawEffect (0, 0, source.Width, source.Height, g_ImgMixSurface, ceff);
            if mode = 1 then DrawBlend (dsurface, ddx, ddy, g_ImgMixSurface, mode)
            else dsurface.Draw (ddx, ddy, source.ClientRect, g_ImgMixSurface, TRUE);
         end;
      end;
   end else begin
      if ceff = ceNone then begin
         if source <> nil then
         if (Self <> g_MySelf) and ((m_nState and $00000200 <> 0) or (m_nState and $00000080 <> 0)) and not (frmMain.IsGroupMember(self.m_sUserName)) then begin
         end else
         if ((self <> g_MySelf) and (m_nState and $00004000 <> 0)) and (m_btRace = 157) then begin    //월영술 안보이게 투명
         end else
         if ((self <> g_MySelf) and (m_nState and $00004000 <> 0)) and        //월영술 안보이게 투명
         ((abs(self.m_nCurrX - g_MySelf.m_nCurrX) > 2) OR (abs(self.m_nCurrY - g_MySelf.m_nCurrY) > 2)) and not (frmMain.IsGroupMember(self.m_sUserName)) then begin

         end else
          DrawBlend (dsurface, ddx, ddy, source, mode);
      end else begin
         if source <> nil then begin
            g_ImgMixSurface.Fill(0);
            g_ImgMixSurface.Draw (0, 0, source.ClientRect, source, FALSE);
            DrawEffect (0, 0, source.Width, source.Height, g_ImgMixSurface, ceff);
            DrawBlend (dsurface, ddx, ddy, g_ImgMixSurface, mode);
         end;
      end;
   end;
end;


procedure TActor.DrawWeaponGlimmer (dsurface: TDirectDrawSurface; ddx, ddy: integer);
var
   idx, ax, ay: integer;
   d: TDirectDrawSurface;
begin

end;

//독 POISON
function TActor.GetDrawEffectValue: TColorEffect;
var
   ceff: TColorEffect;
   Actor: TActor;
begin
   ceff := ceNone;

     //선택된 케릭터 밝게
   if (g_FocusCret = self) or (g_MagicTarget = self) then begin
    if (Self <> g_MySelf) and ((m_nState and $00000200 <> 0) or (m_nState and $00000080 <> 0)) and not (frmMain.IsGroupMember(self.m_sUserName)) then begin
    end else
    if ((self <> g_MySelf) and (m_nState and $00004000 <> 0)) and (m_btRace = 157) then begin    //월영술 안보이게 투명
    end else
    if (self <> g_MySelf) and (m_nState and $00004000 <> 0 ) and     //월영술 안보이게 선택된 캐릭터 밝기
    ((abs(self.m_nCurrX - g_MySelf.m_nCurrX) > 2) OR (abs(self.m_nCurrY - g_MySelf.m_nCurrY) > 2)) and not (frmMain.IsGroupMember(self.m_sUserName)) then begin
    end else
      ceff := ceBright;
   end;

   if m_btRace in [240..251] then begin
     ceff := ceNone;
   end;

   if m_nState and $80000000 <> 0 then begin
      ceff := ceGreen;
   end;
   if m_nState and $40000000 <> 0 then begin
      ceff := ceRed;
   end;
   if m_nState and $20000000 <> 0 then begin
      ceff := ceBlue;
   end;
   if m_nState and $10000000 <> 0 then begin   //스턴
      ceff := ceYellow;
   end;
   if m_nState and $08000000 <> 0 then begin   //둔화
      ceff := ceFuchsia;
   end;
   if m_nState and $04000000 <> 0 then begin   //마비
      ceff := ceGrayScale;
   end;
   if m_nState and $00020000 <> 0 then begin   //혈풍격
      ceff := ceRed;
   end;
   if m_nState and $00000010 <> 0 then begin   //복호장
      ceff := ceAqua;
   end;

   Result := ceff;
end;

procedure TActor.DrawChr (dsurface: TDirectDrawSurface; dx, dy: integer; blend: Boolean;boFlag:Boolean);
var
   idx, ax, ay: integer;
   d, e: TDirectDrawSurface;
   ceff: TColorEffect;
   wimg: TWMImages;
begin
   d:=nil;
   if not (m_btDir in [0..7]) then exit;
   if GetTickCount - m_dwLoadSurfaceTime > 60 * 1000 then begin
      m_dwLoadSurfaceTime := GetTickCount;
      LoadSurface;     //bodysurface등이 loadsurface를 다시 부르지 않아 메모리가 프리되는 것을 막음
   end;

   ceff := GetDrawEffectValue;      //밝기

   if m_BodySurface <> nil then begin
     DrawEffSurface (dsurface,m_BodySurface,dx + m_nPx + m_nShiftX,dy + m_nPy + m_nShiftY,blend,ceff);
   end;

   if m_boUseMagic  and (m_CurMagic.EffectNumber > 0) then
      if m_nCurEffFrame in [0..m_nSpellFrame-1] then begin
         GetEffectBase (m_CurMagic.EffectNumber-1, 0, wimg, idx);
         idx := idx + m_nCurEffFrame;
         if wimg <> nil then
            d := wimg.GetCachedImage (idx, ax, ay);
         if d <> nil then
           if (Self <> g_MySelf) and ((m_nState and $00000200 <> 0) or (m_nState and $00000080 <> 0)) and not (frmMain.IsGroupMember(self.m_sUserName)) then begin
           end else
           if (Self <> g_MySelf) and (m_nState and $00004000 <> 0) and     //월영술 안보이게 마법
           ((abs(self.m_nCurrX - g_MySelf.m_nCurrX) > 2) OR (abs(self.m_nCurrY - g_MySelf.m_nCurrY) > 2)) and not (frmMain.IsGroupMember(self.m_sUserName)) then begin

           end else
           if ((self <> g_MySelf) and (m_nState and $00004000 <> 0)) and (m_btRace = 157) then begin    //월영술 안보이게 투명
           end else
            DrawBlend (dsurface,
                             dx + ax + m_nShiftX,
                             dy + ay + m_nShiftY,
                             d, 1);
      end;

end;

procedure  TActor.DrawEff (dsurface: TDirectDrawSurface; dx, dy: integer);
var
   idx, ax, ay: integer;
   d: TDirectDrawSurface;
begin
   //
end;

procedure TActor.DrawProntEff(dsurface: TDirectDrawSurface; dx, dy: Integer);
var
   idx, ax, ay: integer;
   d: TDirectDrawSurface;
begin
 //
end;

procedure TActor.DrawBackEff(dsurface: TDirectDrawSurface; dx, dy: Integer);
var
   idx, ax, ay: integer;
   d: TDirectDrawSurface;
begin
   if m_nState and $00000800 <> 0 then begin   //혈룡수
    idx := BLOODWATER + (m_nGenAniCount mod 2);
    d := g_WMagic3Images.GetCachedImage (idx, ax, ay);
    if d <> nil then
      DrawBlend (dsurface, dx + ax + m_nShiftX, dy + 100 + ay + m_nShiftY, d, 1);
  end;
end;

procedure TActor.ShowSayMsg(MSurface: TDirectDrawSurface);   //개인상점
var
  I: Integer;
  Y: Integer;
  sStoreName :String;
begin
  Y := 0;
  with MSurface.Canvas do begin
    if m_boStartStore then begin      //降훙�絹�
      if m_btHorse = 0 then begin
        Y := 6 + 14 * 3;
      end else begin
        case m_btDir of
          DR_UP,
            DR_UPRIGHT,
            DR_UPLEFT: begin
              Y := 18 + 8 + 14 * 3;
            end;
          DR_DOWN,
            DR_DOWNRIGHT,
            DR_DOWNLEFT: begin
              Y := 18 + 14 * 3;
            end;
          DR_LEFT,
            DR_RIGHT: begin
              Y := 18 + 4 + 14 * 3;
            end;
        end;
      end;
      SetBkMode(MSurface.Canvas.Handle, TRANSPARENT);
      sStoreName := m_sUserName + '돨�絹�';
      BoldTextOut(MSurface,
        m_nSayX - TextWidth(sStoreName) div 2,
        m_nSayY + Y, clFuchsia{clLime}, clBlack,sStoreName);
      MSurface.Canvas.Release;
    end;
  end;
end;


procedure TActor.ShowRankName(MSurface: TDirectDrawSurface);
  function GetColor(btColor: byte): TColor;
  begin
     case btColor of
       0: Result := $FFE098;
       1: Result := $E7F7;
       2: Result := $7179F2;
       3: Result := $5A94D6;
       4: Result := $FF8000;
       5: Result := $80FF;
       6: Result := $B1F0B7;
       7: Result := $FF80FF;
       8: Result := clSilver;
       9: Result := clRed;
      10: Result := clLime;
      11: Result := clYellow;
      12: Result := clBlue;
      13: Result := clFuchsia;
      14: Result := clAqua;
      15: Result := $299410;
      else begin
        Result := clRed;
      end;
    end;
  end;
var
  I: Integer;
  Y: Integer;
begin
  Y := 0;
  with MSurface.Canvas do begin
    if m_sRankName <> '' then begin
      Y := 24;
      SetBkMode(MSurface.Canvas.Handle, TRANSPARENT);
      BoldTextOut(MSurface,
        m_nSayX - TextWidth(m_sRankName) div 2,
        m_nSayY - Y, GetColor(m_nRankColor), clBlack, m_sRankName);
      MSurface.Canvas.Release;
    end;
  end;
end;


function  TActor.GetDefaultFrame (wmode: Boolean): integer;
var
   cf, dr: integer;
   pm: PTMonsterAction;
begin
   Result:=0;
   pm := GetRaceByPM (m_btRace,m_wAppearance);
   if pm = nil then exit;

   if m_boDeath then begin
      if m_boSkeleton then
         Result := pm.ActDeath.start
      else Result := pm.ActDie.start + m_btDir * (pm.ActDie.frame + pm.ActDie.skip) + (pm.ActDie.frame - 1);
   end else begin
      m_nDefFrameCount := pm.ActStand.frame;
      if m_nCurrentDefFrame < 0 then cf := 0
      else if m_nCurrentDefFrame >= pm.ActStand.frame then cf := 0
      else cf := m_nCurrentDefFrame;
      Result := pm.ActStand.start + m_btDir * (pm.ActStand.frame + pm.ActStand.skip) + cf;
   end;
end;

procedure TActor.DefaultMotion;     //동작 없음,  기본 자세..
begin
   m_boReverseFrame := FALSE;
   if m_boWarMode then begin
      if (GetTickCount - m_dwWarModeTime > 4 * 1000) then //and not BoNextTimeFireHit then
         m_boWarMode := FALSE;
   end;
   m_nCurrentFrame := GetDefaultFrame (m_boWarMode);
   Shift (m_btDir, 0, 1, 1);
end;

//사운드 변수를 초기화 한다.
procedure TActor.SetSound;
var
   cx, cy, bidx, wunit, attackweapon: integer;
   hiter: TActor;
begin
   if m_btRace = 0 then begin
      if (self = g_MySelf) and
         ((m_nCurrentAction=SM_WALK) or
          (m_nCurrentAction=SM_DOWN) or       //월영술
          (m_nCurrentAction=SM_BACKSTEP) or
          (m_nCurrentAction=SM_RUN) or
          (m_nCurrentAction=SM_HORSERUN) or
          (m_nCurrentAction=SM_SPEEDRUN) or //경신보
          (m_nCurrentAction=SM_DOWNRUN) or //월영술 달리기
          (m_nCurrentAction=SM_RUSH) or
          (m_nCurrentAction=SM_RUSHKUNG)
         )
      then begin
      if m_btHorse = 0 then begin
         cx := g_MySelf.m_nCurrX - Map.m_nBlockLeft;
         cy := g_MySelf.m_nCurrY - Map.m_nBlockTop;
         cx := cx div 2 * 2;
         cy := cy div 2 * 2;
         if (Map.m_MArr[cx, cy].btBkIndex > 99) and (Map.m_MArr[cx, cy].btBkIndex < 199) then begin   //샨다미르2
           m_nFootStepSound := s_walk_ground_l;
         end else begin
           bidx := Map.m_MArr[cx, cy].wBkImg and $1FFFFFFF;
           wunit := Map.m_MArr[cx, cy].btArea;
           bidx := wunit * 10000 + bidx - 1;
           case bidx of
            //짧은 풀
            330..349, 450..454, 550..554, 750..754,
            950..954, 1250..1254, 1400..1424, 1455..1474,
            1500..1524, 1550..1574:
               m_nFootStepSound := s_walk_lawn_l;
            //중간풀
            //긴 풀
            250..254, 1005..1009, 1050..1054, 1060..1064, 1450..1454,
            1650..1654:
               m_nFootStepSound := s_walk_rough_l;
            //돌 길
           //대리석 바닥
            605..609, 650..654, 660..664, 2000..2049,
            3025..3049, 2400..2424, 4625..4649, 4675..4678:
               m_nFootStepSound := s_walk_stone_l;
            //동굴안
            1825..1924, 2150..2174, 3075..3099, 3325..3349,
            3375..3399:
               m_nFootStepSound := s_walk_cave_l;
            //나무바닥
            3230, 3231, 3246, 3277:
               m_nFootStepSound := s_walk_wood_l;
            //던전..
            3780..3799:
               m_nFootStepSound := s_walk_wood_l;

            3825..4434:
               if (bidx-3825) mod 25 = 0 then m_nFootStepSound := s_walk_wood_l
               else m_nFootStepSound := s_walk_ground_l;
             //집안(소리 별루 안남)
             2075..2099, 2125..2149:
               m_nFootStepSound := s_walk_room_l;
            //개울
            1800..1824:
               m_nFootStepSound := s_walk_water_l;

            else
               m_nFootStepSound := s_walk_ground_l;
           end;
         //궁전내부
           if (bidx >= 825) and (bidx <= 1349) then begin
             if ((bidx-825) div 25) mod 2 = 0 then
               m_nFootStepSound := s_walk_stone_l;
           end;
         //동굴내부
           if (bidx >= 1375) and (bidx <= 1799) then begin
             if ((bidx-1375) div 25) mod 2 = 0 then
               m_nFootStepSound := s_walk_cave_l;
           end;
           case bidx of
            1385, 1386, 1391, 1392:
               m_nFootStepSound := s_walk_wood_l;
           end;

           bidx := Map.m_MArr[cx, cy].wMidImg and $7FFF;
           bidx := bidx - 1;
           case bidx of
            0..115:
               m_nFootStepSound := s_walk_ground_l;
            120..124:
               m_nFootStepSound := s_walk_lawn_l;
           end;

           bidx := Map.m_MArr[cx, cy].wFrImg and $7FFF;
           bidx := bidx - 1;
           case bidx of
            //벽돌길
            221..289, 583..658, 1183..1206, 7163..7295,
            7404..7414:
               m_nFootStepSound := s_walk_stone_l;
            //나무마루
            3125..3267, {3319..3345, 3376..3433,} 3757..3948,
            6030..6999:
               m_nFootStepSound := s_walk_wood_l;
            //방바닥
            3316..3589:
               m_nFootStepSound := s_walk_room_l;
           end;
         end;
      end else
         m_nFootStepSound := s_ride_walk_l;

         if (m_nCurrentAction = SM_RUN) or (m_nCurrentAction = SM_HORSERUN) or (m_nCurrentAction = SM_SPEEDRUN) or (m_nCurrentAction = SM_DOWNRUN)  then //경신보
            m_nFootStepSound := m_nFootStepSound + 2;
      end;

      if m_btSex = 0 then begin          //자객 사운드
         if( m_btJob = 3) or ( m_btJob = 8) then begin
            m_nScreamSound := s_killerman_struck;
            m_nDieSound := s_killerman_die
         end else begin
            m_nScreamSound := s_man_struck;
            m_nDieSound := s_man_die;
         end;
      end else begin
         if ( m_btJob = 3) or ( m_btJob = 8) then begin
            m_nScreamSound := s_killerwom_struck;
            m_nDieSound := s_killerwom_die
         end else begin
            m_nScreamSound := s_wom_struck;
            m_nDieSound := s_wom_die;
         end;
      end;

      case m_nCurrentAction of
         SM_HIT ,SM_HITLEFT, SM_HIT+1, {SM_HIT+2,} SM_POWERHIT, SM_LONGHIT, SM_WIDEHIT, SM_WBHIT,SM_WBHIT2, SM_FIREHIT, SM_THUNDERHIT, SM_CRBHIT,
           SM_CPOWERHIT, SM_CFIREHIT, SM_DEATHHIT, SM_CRSHIT, SM_TWINHIT ,SM_BALDO, SM_BALDO2, SM_TAGUHIT, SM_FIRESHAOLIN, SM_NANCRSHIT:    //발도술
            begin       //자객 사운드             //풍검술
               if (m_btJob in [4,9]) then begin
                 case (m_btWeapon div 2) of
                   1..18,20..30:  m_nWeaponSound := s_hit_long;
                   else m_nWeaponSound := s_hit_fist;
                 end;
               end else begin
                 case (m_btWeapon div 2) of
                    6, 20:  m_nWeaponSound := s_hit_short;
                    82..85,78..81,1,27,28,33:  m_nWeaponSound := s_hit_wooden;
                    2, 13, 9, 5, 14, 22, 25, 30, 35, 36, 37, 38, 40, 50, 51, 53, 57 :  m_nWeaponSound := s_hit_sword;
                    73..77 ,4, 17, 10, 15, 16, 23, 26, 29, 31, 34, 39, 42, 46, 49, 52, 55:  m_nWeaponSound := s_hit_do;
                    3, 7, 11, 43:  m_nWeaponSound := s_hit_axe;
                    24:  m_nWeaponSound := s_hit_club;
                    8, 12, 18, 21,32,41,44,54,56:  m_nWeaponSound := s_hit_long;
                    90, 91, 92, 99:  m_nWeaponSound := s_Killerwepon1;
                    93, 95, 104:  m_nWeaponSound := s_Killerwepon2;
                    86..89, 94, 96, 97, 98, 100, 101, 102, 103:  m_nWeaponSound := s_Killerwepon3;
                    else m_nWeaponSound := s_hit_fist;
                 end;
               end;
            end;
         SM_BOW:
            begin
               if m_btJob in [4, 9] then begin     //궁수
                 case (m_btWeapon div 2) of
                   70..87: m_nArcherSound := s_Archer_Bow;
                 end;
               end;
            end;
         SM_BIGHIT:
            begin
              if (m_btJob = 3) or (m_btJob = 8)then begin
                if m_btSex = 0 then
                  PlaySound2 (s_killerMan_att3)
                else PlaySound2 (s_killerWo_att3);
              end;
              if (m_btJob in [4,9]) then begin
                 case (m_btWeapon div 2) of
                   1..18,20..30:  m_nWeaponSound := s_hit_long;
                   else m_nWeaponSound := s_hit_fist;
                 end;
              end else begin
                case (m_btWeapon div 2) of
                  6, 20:  m_nWeaponSound := s_hit_short;
                  82..85,78..81,1,27,28,33:  m_nWeaponSound := s_hit_wooden;
                  2, 13, 9, 5, 14, 22, 25, 30, 35, 36, 37, 38, 40, 50, 51, 53, 57 :  m_nWeaponSound := s_hit_sword;
                  73..77, 4, 17, 10, 15, 16, 23, 26, 29, 31, 34, 39, 42, 46, 49, 52, 55:  m_nWeaponSound := s_hit_do;
                  3, 7, 11,43:  m_nWeaponSound := s_hit_axe;
                  24:  m_nWeaponSound := s_hit_club;
                  8, 12, 18, 21,32,41,44,54,56:  m_nWeaponSound := s_hit_long;
                  90,91,92,99:  m_nWeaponSound := s_Killerwepon1;
                  93,95, 104:  m_nWeaponSound := s_Killerwepon2;
                  86..89, 94, 96, 97, 98, 100, 101, 102, 103:  m_nWeaponSound := s_Killerwepon3;
                  else m_nWeaponSound := s_hit_fist;
                end;
              end;
            end;
         SM_STRUCK:
            begin

               if m_nMagicStruckSound >= 1 then begin
                  //strucksound := s_struck_magic;
               end else begin
                  hiter := PlayScene.FindActor (m_nHiterCode);
                  attackweapon := 0;
                  if hiter <> nil then begin
                     attackweapon := hiter.m_btWeapon div 2;
                     if hiter.m_btRace = 0 then
                       if (g_MySelf.m_btHorse <> 0) then begin       //호랑이 사운드
                         case g_UseItems[U_TIGER].S.Shape of
                          0,1,2: m_nStruckSound := s_Tiger3;
                          3,4,5: m_nStruckSound := s_Tiger4;
                         end;
                       end else begin
                          case (m_btDress div 2) of
                           3:
                              case attackweapon of
                                 6:  m_nStruckSound := s_struck_armor_sword;
                                 1,2,4,5,9,10,13,14,15,16,17,22..31, 33..37,80..99: m_nStruckSound := s_struck_armor_sword;  //자객 사운드
                                 3,7,11: m_nStruckSound := s_struck_armor_axe;
                                 8,12,18,21,32: m_nStruckSound := s_struck_armor_longstick;
                               //  100..109:  m_nStruckSound := s_struckck_axe;
                                 else m_nStruckSound := s_struck_armor_fist;
                              end;
                          else
                              case attackweapon of
                                 6: m_nStruckSound := s_struck_body_sword;
                                 1,2,4,5,9,10,13,14,15,16,17,22..31, 33..37: m_nStruckSound := s_struck_body_sword; //자객 사운드
                                 3,7,11: m_nStruckSound := s_struck_body_axe;
                                 8,12,18,21,32: m_nStruckSound := s_struck_body_longstick;
                                 80..99:  m_nStruckSound := s_struckck_axe;
                                 else m_nStruckSound := s_struck_body_fist;
                              end;
                          end;
                       end;
                  end;
               end;
            end;
      end;
      if m_boUseMagic and (m_CurMagic.MagicSerial > 0) then begin    //무공 사운드 버그 해결
        if m_CurMagic.MagicSerial = 87 then begin   //태극진
           m_nMagicStartSound := 10160;
           m_nMagicExplosionSound := 2547;
        end else
        if m_CurMagic.MagicSerial = 89 then begin   //진위보
          m_nMagicStartSound := 3278;
        end else
        if m_CurMagic.MagicSerial = 91 then begin   //독침술
           m_nMagicStartSound := 10160;
           m_nMagicExplosionSound := 10192;
        end else
        if m_CurMagic.MagicSerial = 92 then begin   //격공섭물
           m_nMagicStartSound := 10650;
        end else
        if m_CurMagic.MagicSerial = 94 then begin   //만천염옥
           m_nMagicStartSound := 10220;
           m_nMagicFireSound := 10221;
           m_nMagicExplosionSound := 10222;
        end else
        if m_CurMagic.MagicSerial in [95,96] then begin   //흡성대법 강마진법
           m_nMagicStartSound := 2979;
           m_nMagicExplosionSound := 10142;
        end else
        if m_CurMagic.MagicSerial = 101 then begin   //혼령소환술
           m_nMagicStartSound := 10410;
        end else
        if m_CurMagic.MagicSerial = 103 then begin   //참격
          case m_btSex of
            0: PlaySound2(s_cboZs3_start_m);
            1: PlaySound2(s_cboZs3_start_w);
          end;
          m_nMagicStartSound := 10000 + m_CurMagic.MagicSerial * 10;
          m_nMagicFireSound := 10000 + m_CurMagic.MagicSerial * 10 + 1;
          m_nMagicExplosionSound := 10000 + m_CurMagic.MagicSerial * 10 + 2;
        end else begin
          m_nMagicStartSound := 10000 + m_CurMagic.MagicSerial * 10;
          m_nMagicFireSound := 10000 + m_CurMagic.MagicSerial * 10 + 1;
          m_nMagicExplosionSound := 10000 + m_CurMagic.MagicSerial * 10 + 2;
        end;
      end;
   end else begin
      if m_nCurrentAction = SM_STRUCK then begin
         if m_nMagicStruckSound >= 1 then begin
            //strucksound := s_struck_magic;
         end else begin
            hiter := PlayScene.FindActor (m_nHiterCode);
            if hiter <> nil then begin
            if (g_MySelf.m_btHorse <> 0)  then begin   //호랑이 사운드
               case g_UseItems[U_TIGER].S.Shape of
                  0,1,2: m_nStruckSound := s_Tiger3;
                  3,4,5: m_nStruckSound := s_Tiger4;
               end;
            end else begin
               attackweapon := hiter.m_btWeapon div 2;
               case attackweapon of
                  6: m_nStruckSound := s_struck_body_sword;
                  1,2,4,5,9,10,13,14,15,16,17,22,23,25,26,27,28,29,30,31,33..37: m_nStruckSound := s_struck_body_sword;
                  3,11,24: m_nStruckSound := s_struck_body_axe;
                  8,12,18,21,32: m_nStruckSound := s_struck_body_longstick;
                  80..99:  m_nStruckSound := s_struckck_axe;
                  else m_nStruckSound := s_struck_body_fist;
               end;
               end;
            end;
         end;
      end;

      if m_btRace = 50 then begin
      end else begin
         m_nAppearSound := 200 + (m_wAppearance) * 10;
         m_nNormalSound := 200 + (m_wAppearance) * 10 + 1;
         m_nAttackSound := 200 + (m_wAppearance) * 10 + 2;
         m_nWeaponSound := 200 + (m_wAppearance) * 10 + 3;  //우워억
         m_nScreamSound := 200 + (m_wAppearance) * 10 + 4;  //휙(무기휘두룸)
         m_nDieSound := 200 + (m_wAppearance) * 10 + 5;
         m_nDie2Sound := 200 + (m_wAppearance) * 10 + 6;
      end;
   end;

   if m_nCurrentAction = SM_STRUCK then begin
      hiter := PlayScene.FindActor (m_nHiterCode);
      attackweapon := 0;
      if hiter <> nil then begin  //sound the weapons make
         attackweapon := hiter.m_btWeapon div 2;
         if hiter.m_btRace = 0 then
            case (attackweapon div 2) of
               6, 20:  m_nStruckWeaponSound := s_struck_short;
               1,27,28,33:  m_nStruckWeaponSound := s_struck_wooden;
               2, 13, 9, 5, 14, 22,25,30,35,36,37:  m_nStruckWeaponSound := s_struck_sword;
               4, 17, 10, 15, 16, 23,26,29,31,34:  m_nStruckWeaponSound := s_struck_do;
               3, 7, 11:  m_nStruckWeaponSound := s_struck_axe;
               24:  m_nStruckWeaponSound := s_struck_club;
               8, 12, 18, 21,32:  m_nStruckWeaponSound := s_struck_wooden; //long;
               80..99:  m_nStruckWeaponSound := s_struckck_axe;                  //자객 사운드

               //else struckweaponsound := s_struck_fist;
            end;
      end;
   end;

end;

procedure  TActor.RunSound;
begin
   m_boRunSound := TRUE;
   SetSound;
   case m_nCurrentAction of
      SM_STRUCK:
         begin
            if (m_nStruckWeaponSound >= 0) then PlaySound (m_nStruckWeaponSound);
            if (m_nStruckSound >= 0) then PlaySound (m_nStruckSound);
            if (m_nScreamSound >= 0) then PlaySound (m_nScreamSound);
            if m_nState and $01000000 <> 0 then PlaySound(10586);  //선천기공 사운드
         end;
      SM_NOWDEATH:   //죽으면
         begin
            if (m_nDieSound >= 0) then begin
              PlaySound (m_nDieSound);
              if Self = g_MySelf then begin
                g_TargetCret := nil;
                FrmDlg2.DWndDeath.Visible := True;
              end;
            end;
         end;
      SM_HIT, SM_FLYAXE, SM_LIGHTING, SM_DIGDOWN ,SM_HITLEFT:
         begin
            if((m_btRace in [104,155]) and (m_nCurrentAction = SM_LIGHTING)) then PlaySound (2416) // 주마격뢰장 Attact2 사운드
            else if((m_btRace in [105,152]) and (m_nCurrentAction = SM_LIGHTING)) then PlaySound (2436) // 거미 Attact2 사운드
            else if m_nAttackSound >= 0 then PlaySound (m_nAttackSound);
         end;
      SM_ALIVE, SM_DIGUP:
         begin
            PlaySound (m_nAppearSound);
         end;
      SM_SPELL:
         begin
           if (Self <> g_MySelf) and ((m_nState and $00000200 <> 0) or (m_nState and $00000080 <> 0)) and not (frmMain.IsGroupMember(self.m_sUserName)) then begin
           end else
           if (Self <> g_MySelf) and (m_nState and $00004000 <> 0) and    //월영술 안보이게 사운드
             ((abs(self.m_nCurrX - g_MySelf.m_nCurrX) > 2) OR (abs(self.m_nCurrY - g_MySelf.m_nCurrY) > 2)) and not (frmMain.IsGroupMember(self.m_sUserName)) then begin

           end else
            PlaySound (m_nMagicStartSound);
         end;
   end;
end;

procedure  TActor.RunActSound (frame: integer);
Var
pcm: PTClientMagic;
begin
   if m_boRunSound then begin
      if m_btRace = 0 then begin
         case m_nCurrentAction of
            SM_HIT, SM_HIT+1, SM_HIT+2, SM_HITLEFT:
               if frame = 2 then begin
                  PlaySound (m_nWeaponSound);
                  m_boRunSound := FALSE;
               end;
            SM_POWERHIT, SM_CPOWERHIT:
               if frame = 2 then begin
                  PlaySound (m_nWeaponSound);
                  if m_btSex = 0 then PlaySound (s_yedo_man)
                  else PlaySound (s_yedo_woman);
                  m_boRunSound := FALSE;
               end;
            SM_LONGHIT:
               if frame = 2 then begin
                  PlaySound (m_nWeaponSound);
                  PlaySound (s_longhit);
                  m_boRunSound := FALSE;
               end;
            SM_TAGUHIT:      //타구봉법 - 승려
               if frame = 2 then begin
                  PlaySound (m_nWeaponSound);
                  PlaySound2 (MB_114);
                  m_boRunSound := FALSE;
               end;
            SM_BOW:
               if frame = 2 then begin
                  PlaySound2 (m_nArcherSound);
                  m_boRunSound := FALSE;
               end;
            SM_WIDEHIT:
               if frame = 2 then begin
                  PlaySound (m_nWeaponSound);
                  PlaySound (s_widehit);
                  m_boRunSound := FALSE;
               end;
            SM_FIREHIT, SM_CFIREHIT:
               if frame = 2 then begin
                  PlaySound (m_nWeaponSound);
                  PlaySound (s_firehit);
                  m_boRunSound := FALSE;
               end;
            SM_DEATHHIT:    //살생도
               if frame = 2 then begin
                  PlaySound (m_nWeaponSound);
                  PlaySound (s_firehit);
                  m_boRunSound := FALSE;
               end;

            SM_WBHIT:
               if frame = 2 then begin
                  PlaySound (m_nWeaponSound);
                  PlaySound (s_wbhit);      //풍검술
                  m_boRunSound := FALSE;
               end;
            SM_WBHIT2:
               if frame = 2 then begin
                  PlaySound (m_nWeaponSound);
                  PlaySound (s_wbhit2);       //풍검술
                  m_boRunSound := FALSE;
               end;
            SM_CRSHIT:
              if frame = 2 then begin
                  PlaySound (m_nWeaponSound);
                  PlaySound (s_crshit);
                  m_boRunSound := FALSE;
              end;
            SM_NANCRSHIT:
              if frame = 2 then begin
                  PlaySound (m_nWeaponSound);
                  PlaySound (s_crshit);
                  m_boRunSound := FALSE;
              end;
            SM_CRBHIT:
              if frame = 2 then begin
                  PlaySound (m_nWeaponSound);
                  PlaySound2 (MB_124);
                  m_boRunSound := FALSE;
              end;
            SM_TWINHIT:
              if frame = 2 then begin
                  PlaySound (m_nWeaponSound);
                  PlaySound (s_twinhit);
                  m_boRunSound := FALSE;
              end;
            SM_THUNDERHIT:           //뇌룡봉법
              if frame = 2 then begin
                  PlaySound (m_nWeaponSound);
                  PlaySound2 (MB_117);
                  m_boRunSound := FALSE;
              end;
            SM_FIRESHAOLIN:         //천화봉법
              if frame = 2 then begin
                  PlaySound (m_nWeaponSound);
                  PlaySound2 (MB_119);
                  m_boRunSound := FALSE;
              end;
            SM_BALDO:    //발도술
              if frame = 1 then begin
                  PlaySound (m_nWeaponSound);
                  if m_btSex = 0 then
                  PlaySound (s_baldo_man)
                  else
                  PlaySound (s_baldo_wom);
                  m_boRunSound := FALSE;
              end;
            SM_BALDO2:    //발도술
              if frame = 1 then begin
                  PlaySound (m_nWeaponSound);
                  if m_btSex = 0 then PlaySound (s_baldo_man)
                  else PlaySound (s_baldo_wom);
                  m_boRunSound := FALSE;
              end;
         end;
      end else begin
         if m_btRace = 50 then begin
         end else begin
            if (m_nCurrentAction = SM_WALK) or (m_nCurrentAction = SM_TURN) then begin
               if (not (m_btRace in [75,77]) and (frame = 1) and (Random(8) = 1)) or ((m_btRace in [75,77]) and (frame = 1) and (Random(50) = 1))  then begin

                  if m_btRace = 240 then   //영물 돼지
                    PlaySound2 (pet_pig);
                  if m_btRace = 241 then   //영물 병아리
                    PlaySound2 (pet_chick);
                  if m_btRace = 242 then   //영물 괭이
                    PlaySound2 (pet_kitty);
                  if m_btRace = 243 then   //영물 해골투사
                    PlaySound2 (pet_skeleton);
                  if m_btRace = 244 then   //영물 백돈
                    PlaySound2 (pet_pigman);
                  if m_btRace = 245 then   //영물 위맨
                    PlaySound2 (pet_weman);
                  if m_btRace = 246 then   //영물 고양이
                    PlaySound2 (pet_kitty);
                  if m_btRace = 247 then   //영물 어린흑룡
                    PlaySound2 (pet_blackdragon);
                  if m_btRace = 248 then   //영물 오색알
                    PlaySound2 (pet_olympicmascot);
                  if m_btRace = 249 then   //영물 겨울눈사람
                    PlaySound2 (pet_wintersnow);
                  if m_btRace = 250 then   //영물 개구리
                    PlaySound2 (pet_frog);

                  PlaySound (m_nNormalSound);
                  m_boRunSound := FALSE;
               end;
            end;
            if m_nCurrentAction = SM_HIT then begin
               if (frame = 3) and (m_nAttackSound >= 0) then begin
                  PlaySound (m_nWeaponSound);
                  m_boRunSound := FALSE;
               end;
            end;
            case m_wAppearance of
               80:   //관박쥐
                  begin
                     if m_nCurrentAction = SM_NOWDEATH then begin
                        if (frame = 2) then begin
                           PlaySound (m_nDie2Sound);
                           m_boRunSound := FALSE;
                        end;
                     end;
                  end;
            end;
         end; //*)

      end;
   end;
end;

procedure  TActor.RunFrameAction (frame: integer);
begin
end;

procedure  TActor.ActionEnded;
begin
end;

procedure TActor.Run;
   function MagicTimeOut: Boolean;
   begin
      if self = g_MySelf then begin
         Result := GetTickCount - m_dwWaitMagicRequest > 3000;
      end else
         Result := GetTickCount - m_dwWaitMagicRequest > 2000;
      if Result then
         m_CurMagic.ServerMagicCode := 0;
   end;
var
   prv: integer;
   m_dwFrameTimetime: longword;
   bofly: Boolean;
begin
   if GetTickCount - m_dwGenAnicountTime > 120 then begin   //혈룡수
      m_dwGenAnicountTime := GetTickCount;
      Inc (m_nGenAniCount);
      if m_nGenAniCount > 100000 then m_nGenAniCount := 0;
   end;

   if (m_nCurrentAction = SM_WALK) or
      (m_nCurrentAction = SM_DOWN) or   //월영술
      (m_nCurrentAction = SM_BACKSTEP) or
      (m_nCurrentAction = SM_MAGICMOVE) or
      (m_nCurrentAction = SM_RUN) or
      (m_nCurrentAction = SM_HORSERUN) or
      (m_nCurrentAction = SM_SPEEDRUN) or //경신보
      (m_nCurrentAction = SM_DOWNRUN) or //월영술
      (m_nCurrentAction = SM_RUSH) or
      (m_nCurrentAction = SM_RUSHKUNG)
   then exit;

   m_boMsgMuch := FALSE;
   if self <> g_MySelf then begin
      if m_MsgList.Count >= 2 then m_boMsgMuch := TRUE;
   end;

   RunActSound (m_nCurrentFrame - m_nStartFrame);
   RunFrameAction (m_nCurrentFrame - m_nStartFrame);

   prv := m_nCurrentFrame;
   if m_nCurrentAction <> 0 then begin
      if (m_nCurrentFrame < m_nStartFrame) or (m_nCurrentFrame > m_nEndFrame) then
         m_nCurrentFrame := m_nStartFrame;

      if (self <> g_MySelf) and (m_boUseMagic) then begin
        m_dwFrameTimetime := Round(m_dwFrameTime / 1.8);
      end else begin
         if m_boMsgMuch then m_dwFrameTimetime := Round(m_dwFrameTime * 2 / 3)
         else m_dwFrameTimetime := m_dwFrameTime;
      end;

      if GetTickCount - m_dwStartTime > m_dwFrameTimetime then begin
         if m_nCurrentFrame < m_nEndFrame then begin
            if m_boUseMagic then begin
               if (m_nCurEffFrame = m_nSpellFrame-2) or (MagicTimeOut) then begin
                  if (m_CurMagic.ServerMagicCode >= 0) or (MagicTimeOut) then begin
                     Inc (m_nCurrentFrame);
                     Inc(m_nCurEffFrame);
                     m_dwStartTime := GetTickCount;
                  end;
               end else begin
                  if m_nCurrentFrame < m_nEndFrame - 1 then Inc (m_nCurrentFrame);
                  Inc (m_nCurEffFrame);
                  m_dwStartTime := GetTickCount;
               end;
            end else begin
               Inc (m_nCurrentFrame);
               m_dwStartTime := GetTickCount;
            end;

         end else begin
            if m_boDelActionAfterFinished then begin
               m_boDelActor := TRUE;
            end;
            if self = g_MySelf then begin
               if FrmMain.ServerAcceptNextAction then begin
                  ActionEnded;
                  m_nCurrentAction := 0;
                  m_boUseMagic := FALSE;
               end;
            end else begin
               ActionEnded;
               m_nCurrentAction := 0;
               m_boUseMagic := FALSE;
            end;
         end;
         if m_boUseMagic then begin
            if m_nCurEffFrame = m_nSpellFrame-1 then begin
               if m_CurMagic.ServerMagicCode > 0 then begin
                  with m_CurMagic do
                     PlayScene.NewMagic (self,
                                      ServerMagicCode,
                                      EffectNumber, //Effect
                                      m_nCurrX,
                                      m_nCurrY,
                                      TargX,
                                      TargY,
                                      Target,
                                      EffectType, //EffectType
                                      Recusion,
                                      AniTime,
                                      bofly);
                  if bofly then
                     PlaySound (m_nMagicFireSound)
                  else
                     PlaySound (m_nMagicExplosionSound);
               end;
               //LatestSpellTime := GetTickCount;
               m_CurMagic.ServerMagicCode := 0;
            end;
         end;
      end;
      if m_wAppearance in [0, 1, 43] then m_nCurrentDefFrame := -10
      else m_nCurrentDefFrame := 0;
      m_dwDefFrameTime := GetTickCount;
   end else begin
      if GetTickCount - m_dwSmoothMoveTime > 200 then begin
         if GetTickCount - m_dwDefFrameTime > 500 then begin
            m_dwDefFrameTime := GetTickCount;
            Inc (m_nCurrentDefFrame);
            if m_nCurrentDefFrame >= m_nDefFrameCount then
               m_nCurrentDefFrame := 0;
         end;
         DefaultMotion;
      end;
   end;

   if prv <> m_nCurrentFrame then begin
      m_dwLoadSurfaceTime := GetTickCount;
      LoadSurface;
   end;

end;

function  TActor.Move (step: integer): Boolean;
var
   prv, curstep, maxstep: integer;
   fastmove, normmove: Boolean;
begin
   Result := FALSE;
   fastmove := FALSE;
   normmove := FALSE;
   if (m_nCurrentAction = SM_BACKSTEP) then //or (CurrentAction = SM_RUSH) or (CurrentAction = SM_RUSHKUNG) then
      fastmove := TRUE;
   if (m_nCurrentAction = SM_RUSH) or (m_nCurrentAction = SM_RUSHKUNG) or (m_nCurrentAction = SM_MAGICMOVE) then
      normmove := TRUE;
   if (self = g_MySelf) and (not fastmove) and (not normmove) then begin
      g_boMoveSlow := FALSE;
      g_boMoveSlow2 := FALSE;
      g_boAttackSlow := FALSE;
      g_nMoveSlowLevel := 0;
      g_nMoveSlowValue := 0;
      if m_Abil.Weight > m_Abil.MaxWeight then begin
         g_nMoveSlowLevel := m_Abil.Weight div m_Abil.MaxWeight;
         g_boMoveSlow := TRUE;
      end;
      if m_Abil.WearWeight > m_Abil.MaxWearWeight then begin
         g_nMoveSlowLevel := g_nMoveSlowLevel + m_Abil.WearWeight div m_Abil.MaxWearWeight;
         g_boMoveSlow := TRUE;
      end;
      if m_Abil.HandWeight > m_Abil.MaxHandWeight then begin
         g_boAttackSlow := TRUE;
      end;
      if (self = g_MySelf) then begin
         // 2003/07/15 상태이상 추가 둔화 ... 이동 속도, 공격 속도 둔화
        if (g_MySelf.m_nState and $08000000 <> 0) then begin // if the user is purple
          g_nMoveSlowLevel:= g_nMoveSlowLevel + 5;
          g_nMoveSlowValue := 1;
          g_boMoveSlow2 := TRUE;
          g_boAttackSlow := TRUE;
        end;
      end;
      if (g_boMoveSlow) and (m_nSkipTick < g_nMoveSlowLevel) then begin
         Inc (m_nSkipTick);
         exit;
      end else begin
         m_nSkipTick := 0;
      end;

      if g_boMoveSlow2 and (m_nSkipTick2 > g_nMoveSlowValue) then
      begin
         m_nSkipTick2 := 0;
         exit;
      end else begin
         Inc (m_nSkipTick2);
      end;

      if (m_nCurrentAction = SM_WALK) or
         (m_nCurrentAction = SM_DOWN) or //월영술
         (m_nCurrentAction = SM_BACKSTEP) or
         (m_nCurrentAction = SM_RUN) or
         (m_nCurrentAction = SM_HORSERUN) or

         (m_nCurrentAction = SM_DOWNRUN) or  //월영술
         (m_nCurrentAction = SM_RUSH) or
         (m_nCurrentAction = SM_RUSHKUNG)
      then begin
        if (m_btJob in [4, 9]) and (m_btHorse <> 0) and (g_MySelf.m_btMask in [0, 255]) then begin //승려 탈것 소리
          case (m_nCurrentFrame - m_nStartFrame) of
            1: PlaySound2 (horse_l);
            4: PlaySound2 (horse_r);
          end;
        end else begin
          case (m_nCurrentFrame - m_nStartFrame) of
            1: PlaySound (m_nFootStepSound);
            4: PlaySound (m_nFootStepSound + 1);
          end;
        end;
      end;
      if (m_nCurrentAction = SM_SPEEDRUN) then begin
        if g_MySelf.m_btHorse = 0 then begin
          case (m_nCurrentFrame - m_nStartFrame) of
             1: PlaySound (m_nFootStepSound);
             4: PlaySound (m_nFootStepSound + 1);
          end;
        end else begin
          if (m_btJob in [4, 9]) and (m_btHorse <> 0) and (g_MySelf.m_btMask in [0, 255]) then begin //승려 탈것 소리
            case (m_nCurrentFrame - m_nStartFrame) of
              4: PlaySound2 (horse_run);
            end;
          end else begin
            case (m_nCurrentFrame - m_nStartFrame) of
              4: PlaySound (m_nFootStepSound);
            end;
          end;
        end;
      end;
   end;

   Result := FALSE;
   m_boMsgMuch := FALSE;
   if self <> g_MySelf then begin
      if m_MsgList.Count >= 2 then m_boMsgMuch := TRUE;
   end;
   prv := m_nCurrentFrame;

   if (m_nCurrentAction = SM_WALK) or
      (m_nCurrentAction = SM_DOWN) or  //월영술
      (m_nCurrentAction = SM_RUN) or
      (m_nCurrentAction = SM_HORSERUN) or
      (m_nCurrentAction = SM_SPEEDRUN) or    //경신보
      (m_nCurrentAction = SM_DOWNRUN) or    //경신보
      (m_nCurrentAction = SM_MAGICMOVE) or
      (m_nCurrentAction = SM_RUSH) or
      (m_nCurrentAction = SM_RUSHKUNG)
   then begin
      if (m_nCurrentFrame < m_nStartFrame) or (m_nCurrentFrame > m_nEndFrame) then begin
         m_nCurrentFrame := m_nStartFrame - 1;
      end;
      if m_nCurrentFrame < m_nEndFrame then begin
         Inc (m_nCurrentFrame);
         if m_boMsgMuch and not normmove then //or fastmove then
            if m_nCurrentFrame < m_nEndFrame then
               Inc (m_nCurrentFrame);

         curstep := m_nCurrentFrame-m_nStartFrame + 1;
         maxstep := m_nEndFrame-m_nStartFrame + 1;
         Shift (m_btDir, m_nMoveStep, curstep, maxstep);
      end;
      if m_nCurrentFrame >= m_nEndFrame then begin
         if self = g_MySelf then begin
            if FrmMain.ServerAcceptNextAction then begin
               m_nCurrentAction := 0;
               m_boLockEndFrame := TRUE;
               m_dwSmoothMoveTime := GetTickCount;
            end;
         end else begin
            m_nCurrentAction := 0;
            m_boLockEndFrame := TRUE;
            m_dwSmoothMoveTime := GetTickCount;
         end;
         Result := TRUE;
      end;
      if m_nCurrentAction = SM_RUSH then begin
         if self = g_MySelf then begin
            g_dwDizzyDelayStart := GetTickCount;
            g_dwDizzyDelayTime := 300;
         end;
      end;
      if m_nCurrentAction = SM_RUSHKUNG then begin
         if m_nCurrentFrame >= m_nEndFrame - 3 then begin
            m_nCurrX := m_nActBeforeX;
            m_nCurrY := m_nActBeforeY;
            m_nRx := m_nCurrX;
            m_nRy := m_nCurrY;
            m_nCurrentAction := 0;
            m_boLockEndFrame := TRUE;
            //m_dwSmoothMoveTime := GetTickCount;
         end;
      end;
      if m_nCurrentAction = SM_MAGICMOVE then begin
        if m_nCurrentFrame = m_nEndFrame - 3 then begin
          PlayScene.m_EffectList.Add(TNormalDrawEffect.Create(m_nCurrX, m_nCurrY, g_WMagic_BonzeImages, 1170, 10, HA.ActEnergyHit.ftime  - (m_nHitSpeed div 2), True));
        end;
      end;
      Result := TRUE;
   end;
   if (m_nCurrentAction = SM_BACKSTEP) then begin
      if (m_nCurrentFrame > m_nEndFrame) or (m_nCurrentFrame < m_nStartFrame) then begin
         m_nCurrentFrame := m_nEndFrame + 1;
      end;
      if m_nCurrentFrame > m_nStartFrame then begin
         Dec (m_nCurrentFrame);
         if m_boMsgMuch or fastmove then
            if m_nCurrentFrame > m_nStartFrame then Dec (m_nCurrentFrame);

         curstep := m_nEndFrame - m_nCurrentFrame + 1;
         maxstep := m_nEndFrame - m_nStartFrame + 1;
         Shift (GetBack(m_btDir), m_nMoveStep, curstep, maxstep);
      end;
      if m_nCurrentFrame <= m_nStartFrame then begin
         if self = g_MySelf then begin
            //if FrmMain.ServerAcceptNextAction then begin
               m_nCurrentAction := 0;
               m_boLockEndFrame := TRUE;
               m_dwSmoothMoveTime := GetTickCount;


               g_dwDizzyDelayStart := GetTickCount;
               g_dwDizzyDelayTime := 1000;
            //end;
         end else begin
            m_nCurrentAction := 0;
            m_boLockEndFrame := TRUE;
            m_dwSmoothMoveTime := GetTickCount;
         end;
         Result := TRUE;
      end;
      Result := TRUE;
   end;
   if prv <> m_nCurrentFrame then begin
      m_dwLoadSurfaceTime := GetTickCount;
      LoadSurface;
   end;
end;

procedure TActor.MoveFail;
begin
   m_nCurrentAction := 0;
   m_boLockEndFrame := TRUE;
   g_MySelf.m_nCurrX := m_nOldx;
   g_MySelf.m_nCurrY := m_nOldy;
   g_MySelf.m_btDir := m_nOldDir;
   CleanUserMsgs;
end;

function  TActor.CanCancelAction: Boolean;
begin
   Result := FALSE;
   if m_nCurrentAction = SM_HIT then
      if not m_boUseEffect then
         Result := TRUE;
   if m_nCurrentAction = SM_HITLEFT then     //왼쪽
      if not m_boUseEffect then
         Result := TRUE;
end;

procedure TActor.CancelAction;
begin
   m_nCurrentAction := 0;
   m_boLockEndFrame := TRUE;
end;

procedure TActor.CleanCharMapSetting (x, y: integer);
begin
   g_MySelf.m_nCurrX := x;
   g_MySelf.m_nCurrY := y;
   g_MySelf.m_nRx := x;
   g_MySelf.m_nRy := y;
   m_nOldx := x;
   m_nOldy := y;
   m_nCurrentAction := 0;
   m_nCurrentFrame := -1;
   CleanUserMsgs;
end;


procedure TActor.Say(str: string; boFirst: Boolean);
const
  MAXWIDTH = 150;
var
  SayImage: pTSayImage;
  SayMessage: pTSayMessage;
  WideStr, WideStr2: WideString;
  i, ii, nid, nident, nindex: integer;
  nLen, nTextLen: integer;
  tstr, tstr2, AddStr, AddStr2, OldStr, OldStr2, cmdstr, sid, sident, sItemName, sindex: string;
  sfcolor, sbcolor: string;
  boClickName, boClickItem, boBeginColor, boImage: Boolean;
  nFColor: TColor;
begin
  if boFirst then begin
    ClearSayList();
    m_dwSayTime := GetTickCount + 5000;
    m_SayWidthsArr := 1;
  end;
  with DScreen do begin
    if Str = '' then
      Exit;

    str := AnsiReplaceText(str, '#5', #5);
    str := AnsiReplaceText(str, '#6', #6);
    str := AnsiReplaceText(str, '#7', #7);
    WideStr := str;
    SayMessage := NewSayMsgEx(MAXWIDTH, 16, us_None);
    nLen := 1;
    nFColor := clWhite;
    with SayMessage.SaySurface do begin
      SetBkMode(Canvas.Handle, TRANSPARENT);
      Canvas.Font.Name := g_sCurFontName;
      Canvas.Font.Size := 9;
      boClickName := False;
      boClickItem := False;
      boBeginColor := False;
      boImage := False;
      AddStr := '';
      i := 1;
      while True do begin
        if i > Length(WideStr) then
          break;
        tstr := WideStr[i];
        OldStr := Copy(WideStr, I + 1, Length(WideStr));
        if boImage then begin
          if tstr = '|' then begin
            boImage := False;
            nindex := StrToIntDef(cmdstr, -1);
            if nIndex in [Low(g_FaceIndexInfo)..High(g_FaceIndexInfo)] then begin
              if (nLen + SAYFACEWIDTH) > (MAXWIDTH - 1) then begin
                OldStr := '|' + cmdstr + '|' + OldStr;
                cmdstr := '';
                Break;
              end
              else begin
                New(SayImage);
                SayImage.nLeft := nLen;
                SayImage.nRight := nLen + SAYFACEWIDTH;
                SayImage.nIndex := nIndex;
                Inc(nLen, SAYFACEWIDTH);
                if SayMessage.ImageList = nil then
                  SayMessage.ImageList := TList.Create;
                SayMessage.ImageList.Add(SayImage);
              end;
            end;
            cmdstr := '';
          end
          else
            cmdstr := cmdstr + tstr;
        end
        else if boClickName then begin
          if tstr = #7 then begin
            boClickName := False;
            nTextLen := Canvas.TextWidth(cmdstr);
            if (nLen + nTextLen) > (MAXWIDTH - 1) then begin
              WideStr2 := cmdstr;
              cmdstr := '';
              AddStr2 := '';
              for ii := 1 to Length(WideStr2) do begin
                tstr2 := WideStr2[ii];
                OldStr2 := Copy(WideStr2, ii + 1, Length(WideStr2));
                if (nLen + Canvas.TextWidth(AddStr2 + tstr2)) > (MAXWIDTH - 1) then begin
                  nTextLen := Canvas.TextWidth(AddStr2);
                  BoldTextOut(SayMessage.SaySurface, nLen, 2, clYellow, $40404, AddStr2);
                  Inc(nLen, nTextLen);
                  AddStr2 := '';
                  OldStr2 := tstr2 + OldStr2;
                  break;
                end
                else
                  AddStr2 := AddStr2 + tstr2;
              end;
              OldStr := #7 + OldStr2 + #7 + OldStr;
              cmdstr := '';
              Break;
            end
            else begin
              BoldTextOut(SayMessage.SaySurface, nLen, 2, clYellow, $40404, cmdstr);
              Inc(nLen, nTextLen);
              cmdstr := '';
            end;
          end
          else
            cmdstr := cmdstr + tstr;
        end
        else if boClickItem then begin
          if tstr = '}' then begin
            boClickItem := False;
            cmdstr := GetValidStr3(cmdstr, sid, ['/']);
            cmdstr := GetValidStr3(cmdstr, sident, ['/']);
            cmdstr := GetValidStr3(cmdstr, sItemName, ['/']);
            cmdstr := GetValidStr3(cmdstr, sindex, ['/']);
            cmdstr := '';
            nid := StrToIntDef(sid, -1);
            nident := StrToIntDef(sident, -1);
            nindex := StrToIntDef(sindex, 0);
            if (nId >= 0) and (nident > 0) and (nindex <> 0) then begin
              if sItemName <> '' then begin
                cmdstr := '[' + sItemName + ']';
                WideStr := cmdstr + OldStr;
                i := 1;
                cmdstr := '';
                Continue;
              end;
            end;
          end
          else
            cmdstr := cmdstr + tstr;
        end
        else if boBeginColor then begin
          if tstr = #6 then begin
            boBeginColor := False;
            sbcolor := GetValidStr3(cmdstr, sfcolor, ['/']);
            nFColor := StrToIntDef('$' + sfcolor, $FFFF);
            cmdstr := '';
          end
          else
            cmdstr := cmdstr + tstr;
        end
        else begin
          if tstr = #7 then begin
            boClickName := True;
            BoldTextOut(SayMessage.SaySurface, nLen, 2, nFColor, $40404, AddStr);
            Inc(nLen, Canvas.TextWidth(AddStr));
            AddStr := '';
            cmdstr := '';
          end
          else if tstr = '{' then begin
            boClickItem := True;
            BoldTextOut(SayMessage.SaySurface, nLen, 2, nFColor, $40404, AddStr);
            Inc(nLen, Canvas.TextWidth(AddStr));
            AddStr := '';
            cmdstr := '';
          end
          else if tstr = #6 then begin
            boBeginColor := True;
            BoldTextOut(SayMessage.SaySurface, nLen, 2, nFColor, $40404, AddStr);
            Inc(nLen, Canvas.TextWidth(AddStr));
            AddStr := '';
            cmdstr := '';
          end
          else if tstr = #5 then begin
            BoldTextOut(SayMessage.SaySurface, nLen, 2, nFColor, $40404, AddStr);
            Inc(nLen, Canvas.TextWidth(AddStr));
            AddStr := '';
            cmdstr := '';
            nFColor := clWhite;
          end
          else if tstr = '|' then begin
            boImage := True;
            BoldTextOut(SayMessage.SaySurface, nLen, 2, nFColor, $40404, AddStr);
            Inc(nLen, Canvas.TextWidth(AddStr));
            AddStr := '';
            cmdstr := '';
          end
          else if (nLen + Canvas.TextWidth(AddStr + tstr)) > (MAXWIDTH - 1) then begin
            BoldTextOut(SayMessage.SaySurface, nLen, 2, nFColor, $40404, AddStr);
            Inc(nLen, Canvas.TextWidth(AddStr));
            AddStr := '';
            cmdstr := '';
            OldStr := tstr + OldStr;
            Break;
          end
          else
            AddStr := AddStr + tstr;
        end;
        Inc(i);
      end;
      if AddStr <> '' then begin
        BoldTextOut(SayMessage.SaySurface, nLen, 2, nFColor, $40404, AddStr);
        Inc(nLen, Canvas.TextWidth(AddStr));
      end;
      Canvas.Release;
      if nLen > m_SayWidthsArr then
        m_SayWidthsArr := nLen;

      m_SayList.Add(SayMessage);
      if OldStr <> '' then
        Say(OldStr, False);
    end;
  end;
end;

{============================== NPCActor =============================}
procedure TNpcActor.CalcActorFrame;          //엔피씨
var
  pm: pTMonsterAction;
  haircount: Integer;
begin
  m_boUseMagic := False;
  m_nCurrentFrame := -1;
  m_nBodyOffset := GetNpcOffset(m_wAppearance);

  pm := GetRaceByPM(m_btRace, m_wAppearance);
  if pm = nil then Exit;
  m_btDir := m_btDir mod 3;

  case m_nCurrentAction of
    SM_TURN: begin
        if m_wAppearance = 57 then begin
          m_btDir := 0;
          pm.ActStand.frame := 10;
          pm.ActStand.ftime := 120;
        end
        else if m_wAppearance in [58,60,69..74,78..80,83,84,86,87,92,93,103..106,
          109..116,129..146,150..157,160..166,168,169,171..180,182,183,199..201,240..245,246..250,251,252,253,254,255] then m_btDir := 0;

        m_nStartFrame := pm.ActStand.start + m_btDir * (pm.ActStand.frame + pm.ActStand.skip);
        m_nEndFrame := m_nStartFrame + pm.ActStand.frame - 1;
        m_dwFrameTime := pm.ActStand.ftime;
        m_dwStartTime := GetTickCount;
        m_nDefFrameCount := pm.ActStand.frame;
        Shift(m_btDir, 0, 0, 1);

        if ((m_wAppearance = 33) or (m_wAppearance = 34)) and not m_boUseEffect then begin
          m_boUseEffect := True;
          m_nEffectStart   := 30;
          m_nEffectFrame := m_nEffectStart;
          m_nEffectEnd := m_nEffectStart + 9;
          m_dwEffectStartTime := GetTickCount();
          m_dwEffectFrameTime := 300;
        end else
          if m_wAppearance in [42..47] then begin   //FireDragon
          m_nStartFrame := 20;
          m_nEndFrame := 10;
          m_boUseEffect := True;
          m_nEffectStart := 0;
          m_nEffectFrame := 0;
          m_nEffectEnd := 19;
          m_dwEffectStartTime := GetTickCount();
          m_dwEffectFrameTime := 100;
        end else
          if m_wAppearance = 51 then begin
          m_boUseEffect := True;
          m_nEffectStart := 60;
          m_nEffectFrame := m_nEffectStart;
          m_nEffectEnd := m_nEffectStart + 7;
          m_dwEffectStartTime := GetTickCount();
          m_dwEffectFrameTime := 500;
        end else
        if m_wAppearance in [61..64] then begin //비월신전 불꽃
          m_nStartFrame := 6;
          m_nEndFrame := 7;
          m_boUseEffect   := TRUE;
          m_nEffectStart   := 0;
          m_nEffectFrame   := 0;
          m_nEffectEnd     := 4;
          m_dwEffectStartTime := GetTickCount;
          m_dwEffectFrameTime := 100;
        end else
        if m_wAppearance = 65 then begin //모닥불
          m_nStartFrame := 8;
          m_nEndFrame := 9;
          m_boUseEffect   := TRUE;
          m_nEffectStart   := 0;
          m_nEffectFrame   := 0;
          m_nEffectEnd     := 5;
          m_dwEffectStartTime := GetTickCount;
          m_dwEffectFrameTime := 100;
        end else
        if m_wAppearance = 66 then begin
          m_nStartFrame := 0;
          m_nEndFrame := 19;
          m_dwFrameTime := 200;
          m_dwStartTime := GetTickCount;
          m_nDefFrameCount := 19;
          m_boUseEffect   := TRUE;
          m_nEffectStart   := 20;
          m_nEffectFrame   := m_nEffectStart;
          m_nEffectEnd     := m_nEffectStart + 19;
          m_dwEffectStartTime := GetTickCount;
          m_dwEffectFrameTime := 200;
        end else
        if m_wAppearance in [86,87] then begin
          m_boUseEffect := True;
          m_nEffectStart := 10;
          m_nEffectFrame := m_nEffectStart;
          m_nEffectEnd := m_nEffectStart + 9;
          m_dwEffectStartTime := GetTickCount();
          m_dwEffectFrameTime := 300;
        end else
        if m_wAppearance in [88,89] then begin
          m_boUseEffect := True;
          m_nEffectStart := 30;
          m_nEffectFrame := m_nEffectStart + (m_btDir * 10);
          m_nEffectEnd := m_nEffectStart + 3;
          m_dwEffectStartTime := GetTickCount();
          m_dwEffectFrameTime := 300;
        end else
        if m_wAppearance in [92,93] then begin
          m_boUseEffect := True;
          m_nEffectStart := 10;
          m_nEffectFrame := m_nEffectStart;
          m_nEffectEnd := m_nEffectStart + 5;
          m_dwEffectStartTime := GetTickCount();
          m_dwEffectFrameTime := 150;
        end else
        if m_wAppearance in [94..96] then begin
          m_nStartFrame := 9;
          m_nEndFrame := 10;
          m_boUseEffect   := TRUE;
          m_nEffectStart   := 0;
          m_nEffectFrame   := 0;
          m_nEffectEnd     := 7;
          m_dwEffectStartTime := GetTickCount;
          m_dwEffectFrameTime := 200;
        end else
        if m_wAppearance = 162 then begin
          m_boUseEffect := True;
          m_nEffectStart := 10;
          m_nEffectFrame := m_nEffectStart;
          m_nEffectEnd := m_nEffectStart + 7;
          m_dwEffectStartTime := GetTickCount();
          m_dwEffectFrameTime := 150;
        end else
        if m_wAppearance in [240..245] then begin
          m_boUseEffect := True;
          m_nEffectStart := m_nStartFrame + 4;
          m_nEffectFrame := m_nEffectStart;
          m_nEffectEnd := m_nEffectStart + 4;
          m_dwEffectStartTime := GetTickCount();
          m_dwEffectFrameTime := m_dwFrameTime;
        end else
        if m_wAppearance = 252 then begin
          m_boUseEffect := True;
          m_nEffectStart := 10;
          m_nEffectFrame := m_nEffectStart;
          m_nEffectEnd := m_nEffectStart + 12;
          m_dwEffectStartTime := GetTickCount();
          m_dwEffectFrameTime := 200;
        end else
        if m_wAppearance = 255 then begin
          m_boUseEffect := True;
          m_nEffectStart := 10;
          m_nEffectFrame := m_nEffectStart;
          m_nEffectEnd := m_nEffectStart + 9;
          m_dwEffectStartTime := GetTickCount();
          m_dwEffectFrameTime := 120;
        end;
        if m_wAppearance = 254 then m_boUseEffect := True;


      end;
    SM_HIT: begin
        // 2003/07/15 신규 NPC 추가
        if m_wAppearance = 57 then begin
          m_btDir := 0;
          pm.ActStand.frame := 10;
          pm.ActStand.ftime := 120;
        end
        else if m_wAppearance in [58,60,69..74,78..80,83,84,86,87,92,93,103..106,
          109..116,129..146,150..157,160..166,168,169,171..180,182,183,199..201, 240..245,246..250,251,252,253,254,255] then m_btDir := 0;

        if m_wAppearance in [33,34,52,55..60,68..77,83,84,86,87,88..90,92,93,103..106,
          109..116,129..146,150..157,160..166,168,169,171..180,182,183,199..201, 240..245,246..250,251,252,253,254,255] then begin //행동 모션없음, 서있기모션만 있음

          m_nStartFrame := pm.ActStand.start + m_btDir * (pm.ActStand.frame + pm.ActStand.skip);
          m_nEndFrame   := m_nStartFrame + pm.ActStand.frame - 1;
          m_dwFrameTime  := pm.ActStand.ftime;
          m_dwStartTime  := GetTickCount;
          m_nDefFrameCount := pm.ActStand.frame;
        end else begin
          m_nStartFrame := pm.ActAttack.start + m_btDir * (pm.ActAttack.frame + pm.ActAttack.skip);
          m_nEndFrame := m_nStartFrame + pm.ActAttack.frame - 1;
          if m_wAppearance = 67 then m_nEndFrame := m_nStartFrame + 5;
          m_dwFrameTime := pm.ActAttack.ftime;
          m_dwStartTime := GetTickCount;
          if m_wAppearance = 51 then begin
            m_boUseEffect := True;
            m_nEffectStart := 60;
            m_nEffectFrame := m_nEffectStart;
            m_nEffectEnd := m_nEffectStart + 7;
            m_dwEffectStartTime := GetTickCount();
            m_dwEffectFrameTime := 500;
          end;
        end;
        if m_wAppearance in [61..64] then begin //비월신전 불꽃
          m_nStartFrame := 6;
          m_nEndFrame := 7;
          m_boUseEffect   := TRUE;
          m_nEffectStart   := 0;
          m_nEffectFrame   := 0;
          m_nEffectEnd     := 4;
          m_dwEffectStartTime := GetTickCount;
          m_dwEffectFrameTime := 100;
        end else
        if m_wAppearance = 65 then begin //모닥불
          m_nStartFrame := 8;
          m_nEndFrame := 9;
          m_boUseEffect   := TRUE;
          m_nEffectStart   := 0;
          m_nEffectFrame   := 0;
          m_nEffectEnd     := 5;
          m_dwEffectStartTime := GetTickCount;
          m_dwEffectFrameTime := 100;
        end else
        if m_wAppearance = 66 then begin //크리스마스트리
          m_nStartFrame := 0;
          m_nEndFrame := 19;
          m_dwFrameTime := 200;
          m_dwStartTime := GetTickCount;
          m_nDefFrameCount := 19;
          m_boUseEffect   := TRUE;
          m_nEffectStart   := 20;
          m_nEffectFrame   := m_nEffectStart;
          m_nEffectEnd     := m_nEffectStart + 19;
          m_dwEffectStartTime := GetTickCount;
          m_dwEffectFrameTime := 200;
        end else
        if m_wAppearance = 52 then begin   //2004/12/14 눈사람
          PlaySnow := True;
          SnowStartTime := GetTickCount + 23000;
          Randomize;
          SilenceSound;
          PlaySound(Random(7) + 146);
          m_boUseEffect := True;
          m_nEffectStart := 60;
          m_nEffectFrame := m_nEffectStart;
          m_nEffectEnd := m_nEffectStart + 11;
          m_dwEffectStartTime := GetTickCount();
          m_dwEffectFrameTime := 100;
        end else
        if m_wAppearance in [88,89] then begin
          m_boUseEffect := True;
          m_nEffectStart := 30;
          m_nEffectFrame := m_nEffectStart + (m_btDir * 10);
          m_nEffectEnd := m_nEffectStart + 3;
          m_dwEffectStartTime := GetTickCount();
          m_dwEffectFrameTime := 300;
        end else
        if m_wAppearance in [92,93] then begin
          m_boUseEffect := True;
          m_nEffectStart := 10;
          m_nEffectFrame := m_nEffectStart;
          m_nEffectEnd := m_nEffectStart + 5;
          m_dwEffectStartTime := GetTickCount();
          m_dwEffectFrameTime := 150;
        end else
        if m_wAppearance in [94..96] then begin
          m_nStartFrame := 9;
          m_nEndFrame := 10;
          m_boUseEffect   := TRUE;
          m_nEffectStart   := 0;
          m_nEffectFrame   := 0;
          m_nEffectEnd     := 7;
          m_dwEffectStartTime := GetTickCount;
          m_dwEffectFrameTime := 200;
        end else
        if m_wAppearance = 162 then begin
          m_boUseEffect := True;
          m_nEffectStart := 10;
          m_nEffectFrame := m_nEffectStart;
          m_nEffectEnd := m_nEffectStart + 7;
          m_dwEffectStartTime := GetTickCount();
          m_dwEffectFrameTime := 150;
        end;
        if m_wAppearance in [240..245] then begin
          m_boUseEffect := True;
          m_nEffectStart := m_nStartFrame + 4;
          m_nEffectFrame := m_nEffectStart;
          m_nEffectEnd := m_nEffectStart + 4;
          m_dwEffectStartTime := GetTickCount();
          m_dwEffectFrameTime := m_dwFrameTime;
        end else
        if m_wAppearance = 252 then begin
          m_boUseEffect := True;
          m_nEffectStart := 10;
          m_nEffectFrame := m_nEffectStart;
          m_nEffectEnd := m_nEffectStart + 12;
          m_dwEffectStartTime := GetTickCount();
          m_dwEffectFrameTime := 200;
        end else
        if m_wAppearance = 255 then begin
          m_boUseEffect := True;
          m_nEffectStart := 10;
          m_nEffectFrame :=m_nEffectStart;
          m_nEffectEnd := m_nEffectStart + 9;
          m_dwEffectStartTime := GetTickCount();
          m_dwEffectFrameTime := 120;
        end;
        if m_wAppearance = 254 then m_boUseEffect := True;


      end;
    SM_DIGUP: begin
        {if m_wAppearance = 52 then begin   //2004/12/14 눈사람
          PlaySnow := True;
          SnowStartTime := GetTickCount + 23000;
          Randomize;
          SilenceSound;
          PlaySound(Random(7) + 146);
          m_boUseEffect := True;
          m_nEffectStart := 60;
          m_nEffectFrame := m_nEffectStart;
          m_nEffectEnd := m_nEffectStart + 11;
          m_dwEffectStartTime := GetTickCount();
          m_dwEffectFrameTime := 100;
        end;  }
      end;
  end;
  if m_wAppearance in [35..41,48..50,52..55,57..65,69..74,78..80,83,84,86,87,92,93,
    103..106,109..116,129..146,150..157,160..166,168,169,171..180,182,183,199..201,240..245,246..250,251,252,253,254,255] then m_btDir := 0; //한방향 고정 NewNpc
end;

constructor TNpcActor.Create;        //엔피씨
begin
  inherited Create;
  EffectSurface := nil;
  m_boUseEffect   := FALSE;
  m_MissionList := nil;
  m_MissionStatus := NPCMS_None;
  PlaySnow := False;
end;

destructor TNpcActor.Destroy;
begin
  if m_MissionList <> nil then
    m_MissionList.Free;
end;

procedure TNpcActor.DrawChr(dsurface: TDirectDrawSurface; dx, dy: Integer;      //엔피씨
  blend, boFlag: Boolean);
var
  ceff: TColorEffect;
begin
  //0 1 2
  m_btDir := m_btDir mod 3;
  if GetTickCount - m_dwLoadSurfaceTime > 60 * 1000 then begin
    m_dwLoadSurfaceTime := GetTickCount;
    LoadSurface;
  end;

  ceff := GetDrawEffectValue;

  if m_BodySurface <> nil then begin
    if m_wAppearance = 51 then begin //귀신 npc
      DrawEffSurface(dsurface, m_BodySurface, dx + m_nPx + m_nShiftX, dy + m_nPy + m_nShiftY, True, ceff);
      DrawEffSurface(dsurface, m_BodySurface, dx + m_nPx + m_nShiftX, dy + m_nPy + m_nShiftY, True, ceff);
    end else
      if m_wAppearance in [246..250] then begin
        DrawBlend(dsurface, dx + m_nPx + m_nShiftX, dy + m_nPy + m_nShiftY, m_BodySurface, 1);
      end else begin
        DrawEffSurface(dsurface, m_BodySurface, dx + m_nPx + m_nShiftX, dy + m_nPy + m_nShiftY, blend, ceff);
      end;
  end;
end;

procedure TNpcActor.DrawEff(dsurface: TDirectDrawSurface; dx, dy: Integer);    //엔피씨
begin
  if m_boUseEffect and (EffectSurface <> nil) then begin
    DrawBlend(dsurface, dx + mx + m_nShiftX, dy + my + m_nShiftY, EffectSurface, 1);
  end;
end;

function TNpcActor.GetDefaultFrame(wmode: Boolean): Integer;    //엔피씨
var
  cf, dr: Integer;
  pm: pTMonsterAction;
begin
  Result := 0;
  pm := GetRaceByPM(m_btRace, m_wAppearance);
  if pm = nil then Exit;
  m_btDir := m_btDir mod 3;
  if m_nCurrentDefFrame < 0 then cf := 0
  else if m_nCurrentDefFrame >= pm.ActStand.frame then cf := 0
  else cf := m_nCurrentDefFrame;
  Result := pm.ActStand.start + m_btDir * (pm.ActStand.frame + pm.ActStand.skip) + cf;

  if m_wAppearance in [61..64] then begin //비월신전 불꽃
    Result := 6;
    m_boUseEffect   := TRUE;
  end
  else if m_wAppearance = 65 then begin //모닥불
    Result := 8;
    m_boUseEffect   := TRUE;
  end
  else if m_wAppearance = 66 then begin  //크리스마스트리
    Result := cf;
    m_boUseEffect   := TRUE;
  end
  else if m_wAppearance in [94..96] then begin
    Result := 9;
    m_boUseEffect   := TRUE;
  end;
end;

procedure TNpcActor.LoadSurface;   //엔피씨
begin
   case m_btRace of
      //상인 Npc
      50: begin
        if m_wAppearance in [240..255] then begin
          if m_wAppearance in [254] then begin
            m_BodySurface := g_WNewNpcImages.GetCachedImage(m_nBodyOffset, m_nPx, m_nPy);
          end else begin
            m_BodySurface := g_WNewNpcImages.GetCachedImage(m_nBodyOffset + m_nCurrentFrame, m_nPx, m_nPy);
          end;
        end else begin
          m_BodySurface := g_WNpcImgImages.GetCachedImage(m_nBodyOffset + m_nCurrentFrame, m_nPx, m_nPy);
        end;
      end;
   end;

   if m_wAppearance in [42..47,61..65,94..96] then begin // BodySurface 필요없음 불의경우 이펙트만 필요 (탑은 Object)
      m_BodySurface := nil;
   end;

   if m_boUseEffect then begin // 시공석,화롯불,탑불,귀신npc
      if m_wAppearance in [33,34] then begin // 화면에 나타나는 위치 보정
         EffectSurface := g_WNpcImgImages.GetCachedImage (m_nBodyOffset + m_nEffectFrame, mx, my);
      end
      else if m_wAppearance = 42 then begin// 불항아리(우) Object와 위치를 각자 맞춰야함.  FireDragon
         EffectSurface := g_WNpcImgImages.GetCachedImage (m_nBodyOffset + m_nEffectFrame, mx, my);
         mx := mx + 71;
         my := my + 5;
      end
      else if m_wAppearance = 43 then begin// 불항아리(좌)
         EffectSurface := g_WNpcImgImages.GetCachedImage (m_nBodyOffset + m_nEffectFrame, mx, my);
         mx := mx + 71;
         my := my + 37;
      end
      else if m_wAppearance = 44 then begin// 탑불(우하)
         EffectSurface := g_WNpcImgImages.GetCachedImage (m_nBodyOffset + m_nEffectFrame, mx, my);
         mx := mx + 7;
         my := my - 12;
      end
      else if m_wAppearance = 45 then begin// 탑불(우상)
         EffectSurface := g_WNpcImgImages.GetCachedImage (m_nBodyOffset + m_nEffectFrame, mx, my);
         mx := mx + 6;
         my := my - 12;
      end
      else if m_wAppearance = 46 then begin// 탑불(좌하)
         EffectSurface := g_WNpcImgImages.GetCachedImage (m_nBodyOffset + m_nEffectFrame, mx, my);
         mx := mx + 7;
         my := my - 12;
      end
      else if m_wAppearance = 47 then begin// 탑불(좌상)
         EffectSurface := g_WNpcImgImages.GetCachedImage (m_nBodyOffset + m_nEffectFrame, mx, my);
         mx := mx + 8;
         my := my - 12;
      end
      else if m_wAppearance = 51 then begin// 귀신 npc
         EffectSurface := g_WNpcImgImages.GetCachedImage (m_nBodyOffset + m_nEffectFrame, mx, my);
      end
      else if m_wAppearance = 52 then begin// 눈사람
         EffectSurface := g_WNpcImgImages.GetCachedImage (m_nBodyOffset + m_nEffectFrame, mx, my);
      end
      else if m_wAppearance = 61 then begin// 비월신전 불꽃(좌상)
         EffectSurface := g_WNpcImgImages.GetCachedImage (m_nBodyOffset + m_nEffectFrame, mx, my);
         mx := mx + 25;
         my := my - 8;
      end
      else if m_wAppearance = 62 then begin// 비월신전 불꽃(우상)
         EffectSurface := g_WNpcImgImages.GetCachedImage (m_nBodyOffset + m_nEffectFrame, mx, my);
         mx := mx + 7;
         my := my - 7;
      end
      else if m_wAppearance = 63 then begin// 비월신전 불꽃(좌하)
         EffectSurface := g_WNpcImgImages.GetCachedImage (m_nBodyOffset + m_nEffectFrame, mx, my);
         mx := mx - 4;
         my := my + 8;
      end
      else if m_wAppearance = 64 then begin// 비월신전 불꽃(우하)
         EffectSurface := g_WNpcImgImages.GetCachedImage (m_nBodyOffset + m_nEffectFrame, mx, my);
         mx := mx - 11;
         my := my + 8;
      end
      else if m_wAppearance = 65 then begin// 모닥불
         EffectSurface := g_WNpcImgImages.GetCachedImage (m_nBodyOffset + m_nEffectFrame, mx, my);
      end
      else if m_wAppearance = 66 then begin// 크리스마스트리
         EffectSurface := g_WNpcImgImages.GetCachedImage (m_nBodyOffset + m_nEffectFrame, mx, my);
      end
      else if m_wAppearance in [86,87] then begin
         EffectSurface := g_WNpcImgImages.GetCachedImage (m_nBodyOffset + m_nEffectFrame, mx, my);
         mx := mx - 2;
         my := my - 1;
      end
      else if m_wAppearance in [88,89,92,93,94..96,162] then begin
         EffectSurface := g_WNpcImgImages.GetCachedImage (m_nBodyOffset + m_nEffectFrame, mx, my);
      end
      else if m_wAppearance in [240..245,252,255] then begin
         EffectSurface := g_WNewNpcImages.GetCachedImage (m_nBodyOffset + m_nEffectFrame, mx, my);
      end
      else if m_wAppearance in [254] then begin
         EffectSurface := g_WNewNpcImages.GetCachedImage (m_nBodyOffset + m_nCurrentFrame + 1, mx, my);
      end;


   end;

end;


procedure TNpcActor.Run;   //엔피씨
var
  nEffectFrame: Integer;
  dwEffectFrameTime: LongWord;
begin
  inherited Run;
  nEffectFrame := m_nEffectFrame;
  if (m_wAppearance in [240..245]) then begin
    case m_wAppearance of
      240..245: begin
          m_nEffectFrame := m_nCurrentFrame + 4;
        end;
    end;
  end else begin
  if m_boUseEffect then begin
    if m_boMsgMuch then begin
      dwEffectFrameTime := Round(m_dwEffectFrameTime / 3);
    end else dwEffectFrameTime := m_dwEffectFrameTime;
    if GetTickCount - m_dwEffectStartTime > dwEffectFrameTime then begin
      m_dwEffectStartTime := GetTickCount();
      if m_nEffectFrame < m_nEffectEnd then begin
        Inc(m_nEffectFrame);
      end else begin
        if PlaySnow then begin
          if GetTickCount > SnowStartTime then begin
            m_boUseEffect := False;
            PlaySnow := False;
            SnowStartTime := GetTickCount();
          end;
          m_nEffectFrame := m_nEffectStart;
        end else m_nEffectFrame := m_nEffectStart;
        m_dwEffectStartTime := GetTickCount();
      end;
    end;
  end;
  end;
  if nEffectFrame <> m_nEffectFrame then begin
    m_dwLoadSurfaceTime := GetTickCount();
    LoadSurface();
  end;
end;


{============================== HUMActor =============================}
{-------------------------------}


constructor THumActor.Create;
begin
   inherited Create;
   m_HairSurface := nil;
   m_WeaponSurface := nil;
   m_WeaponSurface2:= nil;
   m_HumWinSurface:=nil;
   m_HumfishSurface := nil;       //낚시 이펙트
   m_HumfishSurface2 := nil;      //낚시 이펙트

   m_boWeaponEffect := FALSE;
   m_dwFrameTime:=150;
   m_dwFrameTick:=GetTickCount();
   m_nFrame:=0;
   m_nHumWinOffset:=0;

   WeaponEffectOffset  :=HUMANFRAME*4;

   m_nBagCount := 42;
   m_H50LevelEffectSurface := nil;
   m_H50LevelEffectFrameTime := 150;    //시간
   m_H50LevelEffectStartTime := GetTickCount();
   m_H50LevelEffectCurrentFrame := 0;
   m_H50LevelEffectOffset := 312;   //오프셋이 312라네 ;;

   m_HDressEffectSurface := nil;
   m_HDressEffectCurrentFrame := 0;
   m_HDressEffectStartTime := GetTickCount();
   m_HDressEffectFrameTime := 150;

   m_H60LevelEffectSurface := nil;
   m_H60LevelEffectFrameTime := 200;    //시간
   m_H60LevelEffectStartTime := GetTickCount();
   m_H60LevelEffectCurrentFrame := 0;
   m_H60LevelEffectMaxCurrentFrame := 20;
   m_H60LevelEffectOffset := 680;

   m_H60LevelEffectSurface2 := nil;
   m_H60LevelEffectFrameTime2 := 120;    //시간
   m_H60LevelEffectStartTime2 := GetTickCount();   //60레벨 이팩트 용
   m_H60LevelEffectCurrentFrame2 := 0;
   m_H60LevelEffectMaxCurrentFrame2 := 59;
   m_H60LevelEffectOffset2 := 700;

   m_HumUpLevelEffectSurface := nil;     //등선 이팩트
   m_HumUpLevelEffectFrameTime := 200;    //시간
   m_HumUpLevelEffectStartTime := GetTickCount();
   m_HumUpLevelEffectCurrentFrame := 0;
   m_HumUpLevelEffectMaxCurrentFrame := 20;
   m_HumUpLevelEffectOffset := 990;

   m_HumUpLevelEffectSurface3 := nil;      //등선 이팩트 용
   m_HumUpLevelEffectFrameTime3 := 120;    //시간
   m_HumUpLevelEffectStartTime3 := GetTickCount();
   m_HumUpLevelEffectCurrentFrame3 := 0;
   m_HumUpLevelEffectMaxCurrentFrame3 := 59;
   m_HumUpLevelEffectOffset3 := 1010;

   m_HumUp70LevelEffectSurface := nil;     //등선 70 이팩트
   m_HumUp70LevelEffectFrameTime := 200;    //시간
   m_HumUp70LevelEffectStartTime := GetTickCount();
   m_HumUp70LevelEffectCurrentFrame := 0;
   m_HumUp70LevelEffectMaxCurrentFrame := 20;
   m_HumUp70LevelEffectOffset := 1210;

   m_HumUp70LevelEffectSurface3 := nil;      //등선  70 이팩트 용
   m_HumUp70LevelEffectFrameTime3 := 120;    //시간
   m_HumUp70LevelEffectStartTime3 := GetTickCount();
   m_HumUp70LevelEffectCurrentFrame3 := 0;
   m_HumUp70LevelEffectMaxCurrentFrame3 := 40;
   m_HumUp70LevelEffectOffset3 := 1230;

   m_Hum80LevelEffectSurface := nil;   //80 이팩트
   m_Hum80LevelEffectOffset := 30;
   m_Hum80LevelEffectCurrentFrame := 0;
   m_Hum80LevelEffectMaxCurrentFrame := 50;
   m_Hum80LevelEffectStartTime := GetTickCount();
   m_Hum80LevelEffectFrameTime := 150;


   TransFormEffectSurface := nil;
   TransFormWeaponEffectSurface  := nil;
   FWeaponEffectSurface := nil;
   FWeaponEffectSurface_r := nil;

   FoodStickDayEffectSurface := nil;
   FoodStickDayEffectSurface2 := nil;
   FoodStickDayEffectFrameTime := 120;
   FoodStickDayEffectStartTime := GetTickCount;
   FoodStickDayEffectCurrentFrame := 0;
   FoodStickDayEffectOffset := 440;
   FoodStickDayEffectOffset2 := 420;

   m_dwFrameTick3 :=GetTickCount();        //낚시
   m_dwFrameTime3 :=160;                 //낚시
   m_nFrame3:=0;                         //낚시
   m_fishbor := false;         //낚시

   m_btGuildMark := 0; //문파 마크

   m_btMask := 0;
end;

destructor THumActor.Destroy;
begin
  inherited Destroy;
end;

procedure THumActor.ShowGuildLable(MSurface: TDirectDrawSurface); //문파 마크
var
  d: TDirectDrawSurface;
  nY: Integer;
begin
  nY := 0; 
  if (not m_boStartStore) and (not m_boDeath) and (m_btGuildMark > 0) and (Not g_boPKZONE)
   and (g_boMarkMode > 0) and (Not g_boDeathMatch) then begin
    d := g_WGuildImages.Images[m_btGuildMark];

  if m_btGuildMark > 90 then begin
    if d <> nil then begin
      if m_btHorse = 0 then begin
       if (Self <> g_MySelf) and ((m_nState and $00000200 <> 0) or (m_nState and $00000080 <> 0)) and not (frmMain.IsGroupMember(self.m_sUserName)) then begin
       end else
       if (Self <> g_MySelf) and (m_nState and $00004000 <> 0) and         //월영술 안보이게 문파마크
            ((abs(self.m_nCurrX - g_MySelf.m_nCurrX) > 2) OR (abs(self.m_nCurrY - g_MySelf.m_nCurrY) > 2)) and not (frmMain.IsGroupMember(self.m_sUserName)) then begin

       end else
        DrawBlend (MSurface, m_nSayX - d.Width div 2 + 10,m_nSayY - 34 - 10, d, 1);
      end else begin
        case m_btDir of
          DR_UP,
            DR_UPRIGHT,
            DR_UPLEFT: begin
              nY := 46 + 8 + 10;
            end;
          DR_DOWN,
            DR_DOWNRIGHT,
            DR_DOWNLEFT: begin
              nY := 46 + 10;
            end;
          DR_LEFT,
            DR_RIGHT: begin
              nY := 46 + 4 + 10;
            end;
        end;
        if (Self <> g_MySelf) and ((m_nState and $00000200 <> 0) or (m_nState and $00000080 <> 0)) and not (frmMain.IsGroupMember(self.m_sUserName)) then begin
        end else
        if (Self <> g_MySelf) and (m_nState and $00004000 <> 0) and    //월영술 안보이게 문파마크
            ((abs(self.m_nCurrX - g_MySelf.m_nCurrX) > 2) OR (abs(self.m_nCurrY - g_MySelf.m_nCurrY) > 2)) and not (frmMain.IsGroupMember(self.m_sUserName)) then begin

        end else

          DrawBlend (MSurface, m_nSayX - d.Width div 2 + 10,m_nSayY - nY, d, 1);
      end;
    end;


  end else begin
    if d <> nil then begin
      if m_btHorse = 0 then begin
      if (Self <> g_MySelf) and ((m_nState and $00000200 <> 0) or (m_nState and $00000080 <> 0)) and not (frmMain.IsGroupMember(self.m_sUserName)) then begin
      end else
      if (Self <> g_MySelf) and (m_nState and $00004000 <> 0) and          //월영술 안보이게 문파마크
            ((abs(self.m_nCurrX - g_MySelf.m_nCurrX) > 2) OR (abs(self.m_nCurrY - g_MySelf.m_nCurrY) > 2)) and not (frmMain.IsGroupMember(self.m_sUserName)) then begin

      end else
       if g_boMarkMode = 1 then begin
        MSurface.Draw(m_nSayX - d.Width div 2, m_nSayY - 24 - 2, d.ClientRect, d, TRUE);
       end else
        DrawBlendEx (MSurface, m_nSayX - d.Width div 2,m_nSayY - 24 - 2, d, 0, 0, d.Width , d.Height, 0);
      end else begin
        case m_btDir of
          DR_UP,
            DR_UPRIGHT,
            DR_UPLEFT: begin
              nY := 36 + 8 + 2;
            end;
          DR_DOWN,
            DR_DOWNRIGHT,
            DR_DOWNLEFT: begin
              nY := 36 + 2;
            end;
          DR_LEFT,
            DR_RIGHT: begin
              nY := 36 + 4 + 2;
            end;
        end;
        if (Self <> g_MySelf) and ((m_nState and $00000200 <> 0) or (m_nState and $00000080 <> 0)) and not (frmMain.IsGroupMember(self.m_sUserName)) then begin
        end else
        if (Self <> g_MySelf) and (m_nState and $00004000 <> 0) and             //월영술 안보이게 문파마크
            ((abs(self.m_nCurrX - g_MySelf.m_nCurrX) > 2) OR (abs(self.m_nCurrY - g_MySelf.m_nCurrY) > 2)) and not (frmMain.IsGroupMember(self.m_sUserName)) then begin

        end else

        if g_boMarkMode = 1 then begin
          MSurface.Draw(m_nSayX - d.Width div 2, m_nSayY - nY, d.ClientRect, d, TRUE);
        end else
          DrawBlendEx (MSurface, m_nSayX - d.Width div 2,m_nSayY - nY, d, 0, 0, d.Width , d.Height, 0);
      end;
    end;

  end;

  end;
end;

procedure THumActor.CalcActorFrame;    //무기 옷 헤어 움직이는 곳
var
  haircount: integer;
  ImgLib: TWMImages;
  meff: TMagicEff;
begin
  m_boUseMagic := FALSE;
  m_boHitEffect := FALSE;
  m_boBonzeHitEff := FALSE;
  m_nCurrentFrame := -1;
   //human
  m_btHair   := HAIRfeature (m_nFeature);
  m_btDress  := DRESSfeature (m_nFeature);
  m_btWeapon := WEAPONfeature (m_nFeature);
  m_btHorse  :=Horsefeature(m_nFeatureEx );
  m_btEffect :=Effectfeature(m_nFeatureEx);
  m_nBodyOffset := HUMANFRAME * (m_btDress); //m_btSex;

  //if m_btHair > haircount-1 then
 // m_btHair := haircount-1;
  m_btHair := m_btHair * 2;

  if m_btHair > 1 then begin
    if (m_btHorse <> 0) then begin      //호랑이 시작
      m_nHairOffset := HUMANFRAME * (m_btHair + m_btSex);
    end else begin
      if m_btJob in [5..8] then begin      //우화등선 헤어 프레임
        if m_btWeapon in [98,99,146..155] then begin    //우화등선 벽혈
          m_nHairOffset := HUMUPWARRFRAME * (m_btHair + m_btSex);
        end else
        if m_btWeapon in [100..103,156..171] then begin    //우화등선 홍현 익선
          m_nHairOffset := HUMUPWIZ_MONKDFRAME  * (m_btHair + m_btSex);
        end else
        if m_btWeapon in [172..179,192..197,200..205,208,209] then begin  //우화등선 비연
          m_nHairOffset := HUMUPASSFRAME * (m_btHair + m_btSex);
        end else
          m_nHairOffset := HUMANFRAME * (m_btHair + m_btSex);
      end else begin
        if m_btJob in [4, 9] then begin
          m_nHairOffset := -1;
        end else begin
          if m_btJob = 3 then begin       //자겍 헤어
            if (m_btWeapon > 179) and (m_btWeapon < 220) then begin   //자객 무기
              m_nHairOffset := HUMKILLFRAME * (m_btHair + m_btSex);
            end else
              m_nHairOffset := HUMANFRAME * (m_btHair + m_btSex);
            if (m_btWeapon = 0) or (m_btWeapon = 1) then begin
              m_nHairOffset := HUMKILLFRAME * (m_btHair + m_btSex);
            end;
          end else begin
            m_nHairOffset := HUMANFRAME * (m_btHair + m_btSex) ;
          end;//호랑이 끝
        end;
      end;
    end;
  end else
    m_nHairOffset := -1;

  if m_btEffect = 60 then       //CalcActorFrame
    m_nHairOffset := -1;


  if (m_btEffect <> 0) then begin
    if (m_btEffect = 50) then begin
      m_nHumWinOffset:=352
    end else begin
      if m_btEffect = 60 then begin            //흑룡신갑  CalcActorFrame
        if m_btJob in [5..8] then begin
          m_nHumWinOffset := 20;
          m_nHumHanOffset := 0;
        end else begin
          m_nHumWinOffset:=0;
          case m_btJob of
            0..2: m_nHumHanOffset := 6672;
            3: begin
              if (m_btWeapon > 179) and (m_btWeapon < 220) then begin
                m_nHumHanOffset := 4368;
              end else
                m_nHumHanOffset := 6672;
              if (m_btWeapon = 0) or (m_btWeapon = 1) then begin
                m_nHumHanOffset := 4368;
              end;
            end;
            4: m_nHumHanOffset := 1536;
          end;
        end;
      end else begin
        m_nHumWinOffset:=(m_btEffect - 1) * HUMANFRAME;
        if (m_btHorse <> 0) then  begin    //호랑이  시작
          if m_btJob in [5..8] then begin
            m_nHumWinOffset:=(m_btEffect + 1) * HUMANFRAME;
          end else
            m_nHumWinOffset:=(m_btEffect - 1) * HUMANFRAME
        end else begin
          if m_btJob in [5..8] then begin    //우화등선 프레임
            if m_btWeapon in [98,99,146..155] then begin    //우화등선 벽혈
              m_nHumWinOffset := HUMUPWARRFRAME * (m_btEffect + 1);
            end else
            if m_btWeapon in [100..103,156..171] then begin    //우화등선 홍현 익선
              m_nHumWinOffset := HUMUPWIZ_MONKDFRAME * (m_btEffect + 1);
            end else
            if m_btWeapon in [172..179,192..197,200..205,208,209] then begin  //우화등선 비연
              m_nHumWinOffset := HUMUPASSFRAME * (m_btEffect + 1);
            end else
              m_nHumWinOffset := HUMANFRAME * (m_btEffect + 1);  //우화등선 공용
          end else begin
            if m_btJob in [4, 9] then begin     //승려 파계승 이팩트
              m_nHumWinOffset:=(m_btEffect - 1) * HUMBONZE;
            end else begin
              if m_btJob = 3 then begin
                if (m_btWeapon > 179) and (m_btWeapon < 220) then begin    //자객 무기
                  m_nHumWinOffset:=(m_btEffect -1) * HUMKILLFRAME
                end else
                  m_nHumWinOffset:=(m_btEffect - 1) * HUMANFRAME;
                if (m_btWeapon = 0) or (m_btWeapon = 1) then begin
                  m_nHumWinOffset:=(m_btEffect -1) * HUMKILLFRAME;
                end;
              end else begin
                m_nHumWinOffset:=(m_btEffect - 1) * HUMANFRAME;
              end;
            end;
          end;
        end;
      end;
    end; //호랑이 끝
  end;
  if m_btJob in [4, 9] then begin     //승려 파계승
    if m_btWeapon = 30 then WeaponEffectOffset := 0;     //승려무기 이팩트
    if m_btWeapon = 28 then WeaponEffectOffset := 728;    //승려무기 이팩트
  end else begin
    if m_btWeapon in [76, 77] then begin
      if m_btWeapon = 76 then WeaponEffectOffset := 4448        // 파관진검 이펙트(남)
      else if m_btWeapon = 77 then WeaponEffectOffset := 5048;  // 파관진검 이펙트(여)
    end else begin
      if m_WEffect > 0 then begin
        if m_btJob = 5 then begin
          WeaponEffectOffset := HUMUPWARRFRAME * (((m_WEffect * 2) - 146) + m_btSex);
        end else
        if m_btJob = 6 then begin
          WeaponEffectOffset := HUMUPWIZ_MONKDFRAME * (((m_WEffect * 2) - 156) + m_btSex);
        end else
        if m_btJob = 7 then begin
          WeaponEffectOffset := HUMUPWIZ_MONKDFRAME * (((m_WEffect * 2) - 164) + m_btSex);
        end else
        if m_btJob = 8 then begin
          WeaponEffectOffset := HUMUPASSFRAME * (((m_WEffect * 2) - 172) + m_btSex);
        end else begin
          if m_WEffect in [93..98] then begin
            WeaponEffectOffset := HUMKILLFRAME * (((m_WEffect * 2) - 180) + m_btSex);
          end else begin
            WeaponEffectOffset := HUWEAPONFRAME * ((m_WEffect * 2) + m_btSex);
          end;
        end;
      end;
    end;
  end;

 if m_nHitSpeed > 19 then    //공속 버그 수정 (2010/4/25)
  m_nHitSpeed := 20;

   case m_nCurrentAction of
      SM_TURN:
         begin
         if (m_nState and $00080000 <> 0) then begin   //낚시중
          if (m_btMask > 0) and (m_btMask <> 255) then begin  //변신탈
            m_nStartFrame := HA.ActFishing.start + m_btDir * (HA.ActFishing.frame + HA.ActFishing.skip);
            m_nEndFrame := m_nStartFrame + HA.ActFishing.frame - 1;
            m_dwFrameTime := HA.ActFishing.ftime;
            m_dwStartTime := GetTickCount;
            m_nDefFrameCount := HA.ActFishing.frame;
            Shift (m_btDir, 0, 0, m_nEndFrame-m_nStartFrame+1);
          end else begin
          if (m_btJob in [5..8]) then begin  //우화등선 탈것 서있는 자세  SM_TURN
            m_nStartFrame := HA.ActFishingUp.start + m_btDir * (HA.ActFishingUp.frame + HA.ActFishingUp.skip);
            m_nEndFrame := m_nStartFrame + HA.ActFishing.frame - 1;
            m_dwFrameTime := HA.ActFishingUp.ftime;
            m_dwStartTime := GetTickCount;
            m_nDefFrameCount := HA.ActFishingUp.frame;
            Shift (m_btDir, 0, 0, m_nEndFrame-m_nStartFrame+1);
          end else begin
            m_nStartFrame := HA.ActFishing.start + m_btDir * (HA.ActFishing.frame + HA.ActFishing.skip);
            m_nEndFrame := m_nStartFrame + HA.ActFishing.frame - 1;
            m_dwFrameTime := HA.ActFishing.ftime;
            m_dwStartTime := GetTickCount;
            m_nDefFrameCount := HA.ActFishing.frame;
            Shift (m_btDir, 0, 0, m_nEndFrame-m_nStartFrame+1);
          end;
          end;
         end else begin

         if (m_btHorse <> 0) then begin //호랑이 시작
           if (m_btMask > 0) and (m_btMask <> 255) then begin  //변신탈
             m_nStartFrame := HA.ActTigerStand.start + m_btDir * (HA.ActTigerStand.frame + HA.ActTigerStand.skip);
             m_nEndFrame := m_nStartFrame + HA.ActTigerStand.frame - 1;
             m_dwFrameTime := HA.ActTigerStand.ftime;
             m_dwStartTime := GetTickCount;
             m_nDefFrameCount := HA.ActTigerStand.frame;
             Shift (m_btDir, 0, 0, m_nEndFrame-m_nStartFrame+1);
           end else begin
             if (m_btJob in [5..8]) then begin  //우화등선 탈것 서있는 자세  SM_TURN
               m_nStartFrame := HA.ActTigerStandUp.start + m_btDir * (HA.ActTigerStandUp.frame + HA.ActTigerStandUp.skip);
               m_nEndFrame := m_nStartFrame + HA.ActTigerStandUp.frame - 1;
               m_dwFrameTime := HA.ActTigerStandUp.ftime;
               m_dwStartTime := GetTickCount;
               m_nDefFrameCount := HA.ActTigerStandUp.frame;
               Shift (m_btDir, 0, 0, m_nEndFrame-m_nStartFrame+1)
             end else begin
               m_nStartFrame := HA.ActTigerStand.start + m_btDir * (HA.ActTigerStand.frame + HA.ActTigerStand.skip);
               m_nEndFrame := m_nStartFrame + HA.ActTigerStand.frame - 1;
               m_dwFrameTime := HA.ActTigerStand.ftime;
               m_dwStartTime := GetTickCount;
               m_nDefFrameCount := HA.ActTigerStand.frame;
               Shift (m_btDir, 0, 0, m_nEndFrame-m_nStartFrame+1);
             end;
           end;
         end else begin

          if (m_btMask > 0) and (m_btMask <> 255) then begin  //변신탈
            m_nStartFrame := HA.ActStand.start + m_btDir * (HA.ActStand.frame + HA.ActStand.skip);
            m_nEndFrame := m_nStartFrame + HA.ActStand.frame - 1;
            m_dwFrameTime := HA.ActStand.ftime;
            m_dwStartTime := GetTickCount;
            m_nDefFrameCount := HA.ActStand.frame;
            Shift (m_btDir, 0, 0, m_nEndFrame-m_nStartFrame+1);
          end else begin

           if (m_btJob in [5..8]) then begin  //우화등선 SM_TURN
             if m_btWeapon in [0,1,38,39,68..97,110..115] then begin   //우화등선 공용무기
               m_nStartFrame := HA.ActStand.start + m_btDir * (HA.ActStand.frame + HA.ActStand.skip);
               m_nEndFrame := m_nStartFrame + HA.ActStand.frame - 1;
               m_dwFrameTime := HA.ActStand.ftime;
               m_dwStartTime := GetTickCount;
               m_nDefFrameCount := HA.ActStand.frame;
               Shift (m_btDir, 0, 0, m_nEndFrame-m_nStartFrame+1);
            end else begin
              if m_btWeapon in [172..179,192..197,200..205,208,209] then begin  //우화등선 비연 ActStand
                m_nStartFrame := HA.ActStand2.start + m_btDir * (HA.ActStand2.frame + HA.ActStand2.skip);
                m_nEndFrame := m_nStartFrame + HA.ActStand2.frame - 1;
                m_dwFrameTime := HA.ActStand2.ftime;
                m_dwStartTime := GetTickCount;
                m_nDefFrameCount := HA.ActStand2.frame;
                Shift (m_btDir, 0, 0, m_nEndFrame-m_nStartFrame+1);
              end else begin
                m_nStartFrame := HA.ActStand.start + m_btDir * (HA.ActStand.frame + HA.ActStand.skip);
                m_nEndFrame := m_nStartFrame + HA.ActStand.frame - 1;
                m_dwFrameTime := HA.ActStand.ftime;
                m_dwStartTime := GetTickCount;
                m_nDefFrameCount := HA.ActStand.frame;
                Shift (m_btDir, 0, 0, m_nEndFrame-m_nStartFrame+1);
              end;
            end;
           end else begin
             m_nStartFrame := HA.ActStand.start + m_btDir * (HA.ActStand.frame + HA.ActStand.skip);
             m_nEndFrame := m_nStartFrame + HA.ActStand.frame - 1;
             m_dwFrameTime := HA.ActStand.ftime;
             m_dwStartTime := GetTickCount;
             m_nDefFrameCount := HA.ActStand.frame;
             Shift (m_btDir, 0, 0, m_nEndFrame-m_nStartFrame+1);
           end;//호라이 끝
          end;
         end;
         end;
         end;
      SM_MAGICMOVE: begin   //격공장
         meff := TNormalDrawEffect.Create(m_nCurrX, m_nCurrY, g_WMagic_BonzeImages, m_btDir * 10 + 1240, 10, HA.ActSpell2.ftime  - (m_nHitSpeed div 2), True);
         PlayScene.m_EffectList.Add(meff);
         PlaySound2(MB_121_1);
         if (m_btMask > 0) and (m_btMask <> 255) then begin  //변신탈
           m_nStartFrame := HA.ActHit.start + m_btDir * (HA.ActHit.frame + HA.ActHit.skip);
           m_nEndFrame := m_nStartFrame + HA.ActHit.frame - 1;
           m_dwFrameTime := HA.ActHit.ftime - (m_nHitSpeed div 2);
         end else begin
           if (m_btJob in [5..8]) then begin //우화등선 SM_SPELL
             if m_btWeapon in [0,1,38,39,68..97,110..115] then begin
               m_nStartFrame := HA.ActSpellUp.start + m_btDir * (HA.ActSpellUp.frame + HA.ActSpellUp.skip);
               m_nEndFrame := m_nStartFrame + HA.ActSpellUp.frame - 1;
               m_dwFrameTime := HA.ActSpellUp.ftime - (m_nHitSpeed div 2);
             end else begin
               if m_btWeapon in [172..179,192..197,200..205,208,209] then begin  //우화등선 비연
                 m_nStartFrame := HA.ActSpell2.start + m_btDir * (HA.ActSpell2.frame + HA.ActSpell2.skip);
                 m_nEndFrame := m_nStartFrame + HA.ActSpell2.frame - 1;
                 m_dwFrameTime := HA.ActSpell2.ftime - (m_nHitSpeed div 2);
               end else begin
                 m_nStartFrame := HA.ActSpellJobUp.start + m_btDir * (HA.ActSpellJobUp.frame + HA.ActSpellJobUp.skip);
                 m_nEndFrame := m_nStartFrame + HA.ActSpellJobUp.frame - 1;
                 m_dwFrameTime := HA.ActSpellJobUp.ftime - (m_nHitSpeed div 2);
               end;
             end;
           end else begin
             m_nStartFrame := HA.ActSpell.start + m_btDir * (HA.ActSpell.frame + HA.ActSpell.skip);
             m_nEndFrame := m_nStartFrame + HA.ActSpell.frame - 1;
             m_dwFrameTime := HA.ActSpell.ftime - (m_nHitSpeed div 2);
           end;
         end;
         m_dwStartTime := GetTickCount;
         m_nMoveStep := 0;
         Shift(m_btDir, m_nMoveStep, 0, 1);
      end;

      SM_WALK,
      SM_BACKSTEP:
         begin
         if (m_btHorse <> 0) then begin    //호랑이
           if (m_btMask > 0) and (m_btMask <> 255) then begin  //변신탈
             m_nStartFrame := HA.ActTigerWalk.start + m_btDir * (HA.ActTigerWalk.frame + HA.ActTigerWalk.skip);
             m_nEndFrame := m_nStartFrame + HA.ActTigerWalk.frame - 1;
             m_dwFrameTime := HA.ActTigerWalk.ftime;
           end else begin
             if (m_btJob in [5..8]) then begin  //우화등선 호랑이 SM_WALK
               m_nStartFrame := HA.ActTigerWalkUp.start + m_btDir * (HA.ActTigerWalkUp.frame + HA.ActTigerWalkUp.skip);
               m_nEndFrame := m_nStartFrame + HA.ActTigerWalkUp.frame - 1;
               m_dwFrameTime := HA.ActTigerWalkUp.ftime;
             end else begin
               if (m_btJob in [4, 9]) then begin
                 m_nStartFrame := HA.ActTiger2Walk.start + m_btDir * (HA.ActTiger2Walk.frame + HA.ActTiger2Walk.skip);
                 m_nEndFrame := m_nStartFrame + HA.ActTiger2Walk.frame - 1;
                 m_dwFrameTime := HA.ActTiger2Walk.ftime;
               end else begin
                 m_nStartFrame := HA.ActTigerWalk.start + m_btDir * (HA.ActTigerWalk.frame + HA.ActTigerWalk.skip);
                 m_nEndFrame := m_nStartFrame + HA.ActTigerWalk.frame - 1;
                 m_dwFrameTime := HA.ActTigerWalk.ftime;
               end;
             end;
           end;
           m_dwStartTime := GetTickCount;
           m_nMoveStep := 1;
           if m_nCurrentAction = SM_BACKSTEP then
             Shift (GetBack(m_btDir), m_nMoveStep, 0, m_nEndFrame-m_nStartFrame+1)
           else
             Shift (m_btDir, m_nMoveStep, 0, m_nEndFrame-m_nStartFrame+1);
         end else begin
         if (m_btMask > 0) and (m_btMask <> 255) then begin  //변신탈
            m_nStartFrame := HA.ActWalk.start + m_btDir * (HA.ActWalk.frame + HA.ActWalk.skip);
            m_nEndFrame := m_nStartFrame + HA.ActWalk.frame - 1;
            m_dwFrameTime := HA.ActWalk.ftime;
            m_dwStartTime := GetTickCount;
            m_nMoveStep := 1;
            if m_nCurrentAction = SM_BACKSTEP then
               Shift (GetBack(m_btDir), m_nMoveStep, 0, m_nEndFrame-m_nStartFrame+1)
            else
               Shift (m_btDir, m_nMoveStep, 0, m_nEndFrame-m_nStartFrame+1);
         end else begin
         if (m_btJob in [5..8]) then begin //우화등선 SM_WALK
          if m_btWeapon in [172..179,192..197,200..205,208,209] then begin  //우화등선 비연  ActWalk
            m_nStartFrame := HA.ActWalk2.start + m_btDir * (HA.ActWalk2.frame + HA.ActWalk2.skip);
            m_nEndFrame := m_nStartFrame + HA.ActWalk2.frame - 1;
            m_dwFrameTime := HA.ActWalk2.ftime;
            m_dwStartTime := GetTickCount;
            m_nMoveStep := 1;
            if m_nCurrentAction = SM_BACKSTEP then
               Shift (GetBack(m_btDir), m_nMoveStep, 0, m_nEndFrame-m_nStartFrame+1)
            else
               Shift (m_btDir, m_nMoveStep, 0, m_nEndFrame-m_nStartFrame+1);
          end else
            m_nStartFrame := HA.ActWalk.start + m_btDir * (HA.ActWalk.frame + HA.ActWalk.skip);
            m_nEndFrame := m_nStartFrame + HA.ActWalk.frame - 1;
            m_dwFrameTime := HA.ActWalk.ftime;
            m_dwStartTime := GetTickCount;
            m_nMoveStep := 1;
            if m_nCurrentAction = SM_BACKSTEP then
               Shift (GetBack(m_btDir), m_nMoveStep, 0, m_nEndFrame-m_nStartFrame+1)
            else
               Shift (m_btDir, m_nMoveStep, 0, m_nEndFrame-m_nStartFrame+1);
         end else begin
            m_nStartFrame := HA.ActWalk.start + m_btDir * (HA.ActWalk.frame + HA.ActWalk.skip);
            m_nEndFrame := m_nStartFrame + HA.ActWalk.frame - 1;
            m_dwFrameTime := HA.ActWalk.ftime;
            m_dwStartTime := GetTickCount;
            m_nMoveStep := 1;
            if m_nCurrentAction = SM_BACKSTEP then
               Shift (GetBack(m_btDir), m_nMoveStep, 0, m_nEndFrame-m_nStartFrame+1)
            else
               Shift (m_btDir, m_nMoveStep, 0, m_nEndFrame-m_nStartFrame+1);
         end;
         end;
         end;
         end;
      SM_DOWN:
         begin
          if (m_btMask > 0) and (m_btMask <> 255) then begin  //변신탈
            m_nStartFrame := HA.ActWalk.start + m_btDir * (HA.ActWalk.frame + HA.ActWalk.skip);
            m_nEndFrame := m_nStartFrame + HA.ActWalk.frame - 1;
            m_dwFrameTime := HA.ActWalk.ftime;
            m_dwStartTime := GetTickCount;
            m_nMoveStep := 1;
            Shift (m_btDir, m_nMoveStep, 0, m_nEndFrame-m_nStartFrame+1);
          end else begin
          if (m_btJob in [5..8]) then begin //우화등선 SM_DOWN (비연자객
           if m_btWeapon in [0,1,38,39,68..97,110..115] then begin
             m_nStartFrame := HA.ActWalk.start + m_btDir * (HA.ActWalk.frame + HA.ActWalk.skip);
             m_nEndFrame := m_nStartFrame + HA.ActWalk.frame - 1;
             m_dwFrameTime := HA.ActWalk.ftime;
             m_dwStartTime := GetTickCount;
             m_nMoveStep := 1;
             Shift (m_btDir, m_nMoveStep, 0, m_nEndFrame-m_nStartFrame+1);
           end else begin
             m_nStartFrame := HA.ActDown2.start + m_btDir * (HA.ActDown2.frame + HA.ActDown2.skip);
             m_nEndFrame := m_nStartFrame + HA.ActDown2.frame - 1;
             m_dwFrameTime := HA.ActDown2.ftime;
             m_dwStartTime := GetTickCount;
             m_nMoveStep := 1;
             Shift (m_btDir, m_nMoveStep, 0, m_nEndFrame-m_nStartFrame+1);
           end;
          end else begin
            if m_btWeapon in [0,1,180..218] then begin  //자객 무기
              m_nStartFrame := HA.ActDown.start + m_btDir * (HA.ActDown.frame + HA.ActDown.skip);
              m_nEndFrame := m_nStartFrame + HA.ActDown.frame - 1;
              m_dwFrameTime := HA.ActDown.ftime;
              m_dwStartTime := GetTickCount;
              m_nMoveStep := 1;
              Shift (m_btDir, m_nMoveStep, 0, m_nEndFrame-m_nStartFrame+1);
            end else begin
              m_nStartFrame := HA.ActWalk.start + m_btDir * (HA.ActWalk.frame + HA.ActWalk.skip);
              m_nEndFrame := m_nStartFrame + HA.ActWalk.frame - 1;
              m_dwFrameTime := HA.ActWalk.ftime;
              m_dwStartTime := GetTickCount;
              m_nMoveStep := 1;
              Shift (m_btDir, m_nMoveStep, 0, m_nEndFrame-m_nStartFrame+1);
            end;
          end;
         end;
         end;
      SM_RUSH:
         begin
         if (m_btMask > 0) and (m_btMask <> 255) then begin  //변신탈
            if m_nRushDir = 0 then begin
               m_nRushDir := 1;
               m_nStartFrame := HA.ActRushLeft.start + m_btDir * (HA.ActRushLeft.frame + HA.ActRushLeft.skip);
               m_nEndFrame := m_nStartFrame + HA.ActRushLeft.frame - 1;
               m_dwFrameTime := HA.ActRushLeft.ftime;
               m_dwStartTime := GetTickCount;
               m_nMoveStep := 1;
               Shift (m_btDir, 1, 0, m_nEndFrame-m_nStartFrame+1);
            end else begin
               m_nRushDir := 0;
               m_nStartFrame := HA.ActRushRight.start + m_btDir * (HA.ActRushRight.frame + HA.ActRushRight.skip);
               m_nEndFrame := m_nStartFrame + HA.ActRushRight.frame - 1;
               m_dwFrameTime := HA.ActRushRight.ftime;
               m_dwStartTime := GetTickCount;
               m_nMoveStep := 1;
               Shift (m_btDir, 1, 0, m_nEndFrame-m_nStartFrame+1);
            end;
         end else begin
         if (m_btJob in [5..8]) then begin //우화등선 SM_RUSH
           if m_btWeapon in [172..179,192..197,200..205,208,209] then begin  //우화등선 비연 ActRushLeft
             if m_nRushDir = 0 then begin
               m_nRushDir := 1;
               m_nStartFrame := HA.ActRushLeft2.start + m_btDir * (HA.ActRushLeft2.frame + HA.ActRushLeft2.skip);
               m_nEndFrame := m_nStartFrame + HA.ActRushLeft2.frame - 1;
               m_dwFrameTime := HA.ActRushLeft2.ftime;
               m_dwStartTime := GetTickCount;
               m_nMoveStep := 1;
               Shift (m_btDir, 1, 0, m_nEndFrame-m_nStartFrame+1);
             end else begin
               m_nRushDir := 0;
               m_nStartFrame := HA.ActRushRight2.start + m_btDir * (HA.ActRushRight2.frame + HA.ActRushRight2.skip);
               m_nEndFrame := m_nStartFrame + HA.ActRushRight2.frame - 1;
               m_dwFrameTime := HA.ActRushRight2.ftime;
               m_dwStartTime := GetTickCount;
               m_nMoveStep := 1;
               Shift (m_btDir, 1, 0, m_nEndFrame-m_nStartFrame+1);
             end;
           end else
             if m_nRushDir = 0 then begin
               m_nRushDir := 1;
               m_nStartFrame := HA.ActRushLeft.start + m_btDir * (HA.ActRushLeft.frame + HA.ActRushLeft.skip);
               m_nEndFrame := m_nStartFrame + HA.ActRushLeft.frame - 1;
               m_dwFrameTime := HA.ActRushLeft.ftime;
               m_dwStartTime := GetTickCount;
               m_nMoveStep := 1;
               Shift (m_btDir, 1, 0, m_nEndFrame-m_nStartFrame+1);
             end else begin
               m_nRushDir := 0;
               m_nStartFrame := HA.ActRushRight.start + m_btDir * (HA.ActRushRight.frame + HA.ActRushRight.skip);
               m_nEndFrame := m_nStartFrame + HA.ActRushRight.frame - 1;
               m_dwFrameTime := HA.ActRushRight.ftime;
               m_dwStartTime := GetTickCount;
               m_nMoveStep := 1;
               Shift (m_btDir, 1, 0, m_nEndFrame-m_nStartFrame+1);
             end;
         end else begin
         if m_nRushDir = 0 then begin
               m_nRushDir := 1;
               m_nStartFrame := HA.ActRushLeft.start + m_btDir * (HA.ActRushLeft.frame + HA.ActRushLeft.skip);
               m_nEndFrame := m_nStartFrame + HA.ActRushLeft.frame - 1;
               m_dwFrameTime := HA.ActRushLeft.ftime;
               m_dwStartTime := GetTickCount;
               m_nMoveStep := 1;
               Shift (m_btDir, 1, 0, m_nEndFrame-m_nStartFrame+1);
            end else begin
               m_nRushDir := 0;
               m_nStartFrame := HA.ActRushRight.start + m_btDir * (HA.ActRushRight.frame + HA.ActRushRight.skip);
               m_nEndFrame := m_nStartFrame + HA.ActRushRight.frame - 1;
               m_dwFrameTime := HA.ActRushRight.ftime;
               m_dwStartTime := GetTickCount;
               m_nMoveStep := 1;
               Shift (m_btDir, 1, 0, m_nEndFrame-m_nStartFrame+1);
            end;
         end;
         end;
         end;

      SM_RUSHKUNG:
         begin
         if (m_btMask > 0) and (m_btMask <> 255) then begin  //변신탈
            m_nStartFrame := HA.ActRun.start + m_btDir * (HA.ActRun.frame + HA.ActRun.skip);
            m_nEndFrame := m_nStartFrame + HA.ActRun.frame - 1;
            m_dwFrameTime := HA.ActRun.ftime;
            m_dwStartTime := GetTickCount;
            m_nMoveStep := 1;
            Shift (m_btDir, m_nMoveStep, 0, m_nEndFrame-m_nStartFrame+1);
         end else begin
         if (m_btJob in [5..8]) then begin //우화등선 SM_RUSHKUNG
           if m_btWeapon in [172..179,192..197,200..205,208,209] then begin  //우화등선 비연 ActRun
             m_nStartFrame := HA.ActRun2.start + m_btDir * (HA.ActRun2.frame + HA.ActRun2.skip);
             m_nEndFrame := m_nStartFrame + HA.ActRun2.frame - 1;
             m_dwFrameTime := HA.ActRun2.ftime;
             m_dwStartTime := GetTickCount;
             m_nMoveStep := 1;
             Shift (m_btDir, m_nMoveStep, 0, m_nEndFrame-m_nStartFrame+1);
           end else begin
             m_nStartFrame := HA.ActRun.start + m_btDir * (HA.ActRun.frame + HA.ActRun.skip);
             m_nEndFrame := m_nStartFrame + HA.ActRun.frame - 1;
             m_dwFrameTime := HA.ActRun.ftime;
             m_dwStartTime := GetTickCount;
             m_nMoveStep := 1;
             Shift (m_btDir, m_nMoveStep, 0, m_nEndFrame-m_nStartFrame+1);
           end;
         end else begin
            m_nStartFrame := HA.ActRun.start + m_btDir * (HA.ActRun.frame + HA.ActRun.skip);
            m_nEndFrame := m_nStartFrame + HA.ActRun.frame - 1;
            m_dwFrameTime := HA.ActRun.ftime;
            m_dwStartTime := GetTickCount;
            m_nMoveStep := 1;
            Shift (m_btDir, m_nMoveStep, 0, m_nEndFrame-m_nStartFrame+1);
         end;
         end;
         end;
      SM_SITDOWN:
         begin
         if (m_btMask > 0) and (m_btMask <> 255) then begin  //변신탈
            m_nStartFrame := HA.ActSitdown.start + m_btDir * (HA.ActSitdown.frame + HA.ActSitdown.skip);
            m_nEndFrame := m_nStartFrame + HA.ActSitdown.frame -1;
            m_dwFrameTime := HA.ActSitdown.ftime -1 ;  //고기
            m_dwStartTime := GetTickCount;
         end else begin
         if (m_btJob in [5..8]) then begin //우화등선  SM_SITDOWN
           if m_btWeapon in [0,1,38,39,68..97,110..115] then begin
             m_nStartFrame := HA.ActSitdownUp.start + m_btDir * (HA.ActSitdownUp.frame + HA.ActSitdownUp.skip);
             m_nEndFrame := m_nStartFrame + HA.ActSitdownUp.frame -1;
             m_dwFrameTime := HA.ActSitdownUp.ftime -1 ;  //고기
             m_dwStartTime := GetTickCount;
           end else begin
             if m_btWeapon in [172..179,192..197,200..205,208,209] then begin  //우화등선 비연 ActSitdown2
               m_nStartFrame := HA.ActSitdown2.start + m_btDir * (HA.ActSitdown2.frame + HA.ActSitdown2.skip);
               m_nEndFrame := m_nStartFrame + HA.ActSitdown2.frame -1;
               m_dwFrameTime := HA.ActSitdown2.ftime -1 ;  //고기
               m_dwStartTime := GetTickCount;
             end else begin
               m_nStartFrame := HA.ActSitdownJobUp.start + m_btDir * (HA.ActSitdownJobUp.frame + HA.ActSitdownJobUp.skip);
               m_nEndFrame := m_nStartFrame + HA.ActSitdownJobUp.frame -1;
               m_dwFrameTime := HA.ActSitdownJobUp.ftime -1 ;  //고기
               m_dwStartTime := GetTickCount;
             end;
           end;
         end else begin
            m_nStartFrame := HA.ActSitdown.start + m_btDir * (HA.ActSitdown.frame + HA.ActSitdown.skip);
            m_nEndFrame := m_nStartFrame + HA.ActSitdown.frame -1;
            m_dwFrameTime := HA.ActSitdown.ftime -1 ;  //고기
            m_dwStartTime := GetTickCount;
         end;
         end;
         end;
      SM_RUN:
         begin
         if (m_btHorse <> 0) then begin
          if (m_btMask > 0) and (m_btMask <> 255) then begin  //변신탈
            m_nStartFrame := HA.ActTigerRun.start + m_btDir * (HA.ActTigerRun.frame + HA.ActTigerRun.skip);
            m_nEndFrame := m_nStartFrame + HA.ActTigerRun.frame - 1;
            m_dwFrameTime := HA.ActTigerRun.ftime;
            m_dwStartTime := GetTickCount;
            if m_nCurrentAction = SM_SPEEDRUN then
            m_nMoveStep := 3
            else
            m_nMoveStep := 1;
            Shift (m_btDir, m_nMoveStep, 0, m_nEndFrame-m_nStartFrame+1);
          end else
          if (m_btJob in [5..8]) then begin  //우화등선 호랑이 탔을때 SM_RUN
            m_nStartFrame := HA.ActTigerRunUp.start + m_btDir * (HA.ActTigerRunUp.frame + HA.ActTigerRunUp.skip);
            m_nEndFrame := m_nStartFrame + HA.ActTigerRunUp.frame - 1;
            m_dwFrameTime := HA.ActTigerRunUp.ftime;
            m_dwStartTime := GetTickCount;
            if m_nCurrentAction = SM_SPEEDRUN then
            m_nMoveStep := 3
            else
            m_nMoveStep := 1;
            Shift (m_btDir, m_nMoveStep, 0, m_nEndFrame-m_nStartFrame+1);
          end else
            m_nStartFrame := HA.ActTigerRun.start + m_btDir * (HA.ActTigerRun.frame + HA.ActTigerRun.skip);
            m_nEndFrame := m_nStartFrame + HA.ActTigerRun.frame - 1;
            m_dwFrameTime := HA.ActTigerRun.ftime;
            m_dwStartTime := GetTickCount;
            if m_nCurrentAction = SM_SPEEDRUN then
            m_nMoveStep := 3
            else
            m_nMoveStep := 1;
            Shift (m_btDir, m_nMoveStep, 0, m_nEndFrame-m_nStartFrame+1);
         end else begin
         if (m_btMask > 0) and (m_btMask <> 255) then begin  //변신탈
            m_nStartFrame := HA.ActRun.start + m_btDir * (HA.ActRun.frame + HA.ActRun.skip);
            m_nEndFrame := m_nStartFrame + HA.ActRun.frame - 1;
            m_dwFrameTime := HA.ActRun.ftime;
            m_dwStartTime := GetTickCount;
            if m_nCurrentAction = SM_RUN then
            m_nMoveStep := 2
            else
            m_nMoveStep := 1;
            Shift (m_btDir, m_nMoveStep, 0, m_nEndFrame-m_nStartFrame+1);
         end else begin
         if (m_btJob in [5..8]) then begin //우화등선 SM_RUN
          if m_btWeapon in [172..179,192..197,200..205,208,209] then begin  //우화등선 비연 ActRun
            m_nStartFrame := HA.ActRun2.start + m_btDir * (HA.ActRun2.frame + HA.ActRun2.skip);
            m_nEndFrame := m_nStartFrame + HA.ActRun2.frame - 1;
            m_dwFrameTime := HA.ActRun2.ftime;
            m_dwStartTime := GetTickCount;
            if m_nCurrentAction = SM_RUN then
            m_nMoveStep := 2
            else
            m_nMoveStep := 1;
            Shift (m_btDir, m_nMoveStep, 0, m_nEndFrame-m_nStartFrame+1);
          end else
            m_nStartFrame := HA.ActRun.start + m_btDir * (HA.ActRun.frame + HA.ActRun.skip);
            m_nEndFrame := m_nStartFrame + HA.ActRun.frame - 1;
            m_dwFrameTime := HA.ActRun.ftime;
            m_dwStartTime := GetTickCount;
            if m_nCurrentAction = SM_RUN then
            m_nMoveStep := 2
            else
            m_nMoveStep := 1;
            Shift (m_btDir, m_nMoveStep, 0, m_nEndFrame-m_nStartFrame+1);
         end else begin
            m_nStartFrame := HA.ActRun.start + m_btDir * (HA.ActRun.frame + HA.ActRun.skip);
            m_nEndFrame := m_nStartFrame + HA.ActRun.frame - 1;
            m_dwFrameTime := HA.ActRun.ftime;
            m_dwStartTime := GetTickCount;
            if m_nCurrentAction = SM_RUN then
            m_nMoveStep := 2
            else
            m_nMoveStep := 1;
            Shift (m_btDir, m_nMoveStep, 0, m_nEndFrame-m_nStartFrame+1);
         end;
         end;
         end;
         end;
      SM_HORSERUN: begin
        if (m_btMask > 0) and (m_btMask <> 255) then begin  //변신탈
            m_nStartFrame := HA.ActTigerRun.start + m_btDir * (HA.ActTigerRun.frame + HA.ActTigerRun.skip);
            m_nEndFrame := m_nStartFrame + HA.ActTigerRun.frame - 1;
            m_dwFrameTime := HA.ActTigerRun.ftime;
            m_dwStartTime := GetTickCount;
            if m_nCurrentAction = SM_HORSERUN then
            m_nMoveStep := 3
            else
            m_nMoveStep := 1;
            Shift (m_btDir, m_nMoveStep, 0, m_nEndFrame-m_nStartFrame+1);
        end else begin
          if (m_btJob in [5..8]) then begin   //우화등선 호랑이 SM_HORSERUN
            m_nStartFrame := HA.ActTigerRunUp.start + m_btDir * (HA.ActTigerRunUp.frame + HA.ActTigerRunUp.skip);
            m_nEndFrame := m_nStartFrame + HA.ActTigerRunUp.frame - 1;
            m_dwFrameTime := HA.ActTigerRunUp.ftime;
            m_dwStartTime := GetTickCount;
            if m_nCurrentAction = SM_HORSERUN then
            m_nMoveStep := 3
            else
            m_nMoveStep := 1;
            Shift (m_btDir, m_nMoveStep, 0, m_nEndFrame-m_nStartFrame+1);
          end else begin
            m_nStartFrame := HA.ActTigerRun.start + m_btDir * (HA.ActTigerRun.frame + HA.ActTigerRun.skip);
            m_nEndFrame := m_nStartFrame + HA.ActTigerRun.frame - 1;
            m_dwFrameTime := HA.ActTigerRun.ftime;
            m_dwStartTime := GetTickCount;
            if m_nCurrentAction = SM_HORSERUN then
            m_nMoveStep := 3
            else
            m_nMoveStep := 1;
            Shift (m_btDir, m_nMoveStep, 0, m_nEndFrame-m_nStartFrame+1);
          end;
        end;
      end;
      SM_SPEEDRUN: begin //경신보
      if (m_btHorse <> 0) then begin
        if (m_btMask > 0) and (m_btMask <> 255) then begin  //변신탈
            m_nStartFrame := HA.ActTigerRun.start + m_btDir * (HA.ActTigerRun.frame + HA.ActTigerRun.skip);
            m_nEndFrame := m_nStartFrame + HA.ActTigerRun.frame - 1;
            m_dwFrameTime := HA.ActTigerRun.ftime;
            m_dwStartTime := GetTickCount;
            if m_nCurrentAction = SM_SPEEDRUN then
            m_nMoveStep := 3
            else
            m_nMoveStep := 1;
            Shift (m_btDir, m_nMoveStep, 0, m_nEndFrame-m_nStartFrame+1);
        end else begin
          if (m_btJob in [5..8]) then begin  //우화등선 호랑이 탔을때 SM_SPEEDRUN
            m_nStartFrame := HA.ActTigerRunUp.start + m_btDir * (HA.ActTigerRunUp.frame + HA.ActTigerRunUp.skip);
            m_nEndFrame := m_nStartFrame + HA.ActTigerRunUp.frame - 1;
            m_dwFrameTime := HA.ActTigerRunUp.ftime;
            m_dwStartTime := GetTickCount;
            if m_nCurrentAction = SM_SPEEDRUN then
            m_nMoveStep := 3
            else
            m_nMoveStep := 1;
            Shift (m_btDir, m_nMoveStep, 0, m_nEndFrame-m_nStartFrame+1);
          end else begin
            m_nStartFrame := HA.ActTigerRun.start + m_btDir * (HA.ActTigerRun.frame + HA.ActTigerRun.skip);
            m_nEndFrame := m_nStartFrame + HA.ActTigerRun.frame - 1;
            m_dwFrameTime := HA.ActTigerRun.ftime;
            m_dwStartTime := GetTickCount;
            if m_nCurrentAction = SM_SPEEDRUN then
            m_nMoveStep := 3
            else
            m_nMoveStep := 1;
            Shift (m_btDir, m_nMoveStep, 0, m_nEndFrame-m_nStartFrame+1);
          end;
        end;
      end else begin
        if (m_btMask > 0) and (m_btMask <> 255) then begin  //변신탈
            m_nStartFrame := HA.ActRun.start + m_btDir * (HA.ActRun.frame + HA.ActRun.skip);
            m_nEndFrame := m_nStartFrame + HA.ActRun.frame - 1;
            m_dwFrameTime := HA.ActRun.ftime;
            m_dwStartTime := GetTickCount;
            if m_nCurrentAction = SM_SPEEDRUN then
            m_nMoveStep := 3
            else
            m_nMoveStep := 1;
            Shift (m_btDir, m_nMoveStep, 0, m_nEndFrame-m_nStartFrame+1);
        end else begin
          if (m_btJob in [5..8]) then begin //우화등선 경신보 SM_SPEEDRUN
           if m_btWeapon in [172..179,192..197,200..205,208,209] then begin  //우화등선 비연 ActRun
             m_nStartFrame := HA.ActRun2.start + m_btDir * (HA.ActRun2.frame + HA.ActRun2.skip);
             m_nEndFrame := m_nStartFrame + HA.ActRun2.frame - 1;
             m_dwFrameTime := HA.ActRun2.ftime;
             m_dwStartTime := GetTickCount;
             if m_nCurrentAction = SM_SPEEDRUN then
             m_nMoveStep := 3
             else
             m_nMoveStep := 1;
             Shift (m_btDir, m_nMoveStep, 0, m_nEndFrame-m_nStartFrame+1);
           end else begin
             m_nStartFrame := HA.ActRun.start + m_btDir * (HA.ActRun.frame + HA.ActRun.skip);
             m_nEndFrame := m_nStartFrame + HA.ActRun.frame - 1;
             m_dwFrameTime := HA.ActRun.ftime;
             m_dwStartTime := GetTickCount;
             if m_nCurrentAction = SM_SPEEDRUN then
             m_nMoveStep := 3
             else
             m_nMoveStep := 1;
             Shift (m_btDir, m_nMoveStep, 0, m_nEndFrame-m_nStartFrame+1);
           end;
          end else begin
            m_nStartFrame := HA.ActRun.start + m_btDir * (HA.ActRun.frame + HA.ActRun.skip);
            m_nEndFrame := m_nStartFrame + HA.ActRun.frame - 1;
            m_dwFrameTime := HA.ActRun.ftime;
            m_dwStartTime := GetTickCount;
            if m_nCurrentAction = SM_SPEEDRUN then
            m_nMoveStep := 3
            else
            m_nMoveStep := 1;
            Shift (m_btDir, m_nMoveStep, 0, m_nEndFrame-m_nStartFrame+1);
          end;
        end;
      end;
      end;
      SM_DOWNRUN: begin //경신보 + 월영술
      if (m_btMask > 0) and (m_btMask <> 255) then begin  //변신탈
          m_nStartFrame := HA.ActRun.start + m_btDir * (HA.ActRun.frame + HA.ActRun.skip);
          m_nEndFrame := m_nStartFrame + HA.ActRun.frame - 1;
          m_dwFrameTime := HA.ActRun.ftime;
          m_dwStartTime := GetTickCount;
          if m_nCurrentAction = SM_DOWNRUN then
          m_nMoveStep := 2
          else
          m_nMoveStep := 1;
          Shift (m_btDir, m_nMoveStep, 0, m_nEndFrame-m_nStartFrame+1);
      end else begin
      if (m_btJob in [5..8]) then begin //우화등선 비연자객 SM_DOWNRUN
         if m_btWeapon in [172..179,192..197,200..205,208,209] then begin  //우화등선 비연   ActDown2
            m_nStartFrame := HA.ActDown2.start + m_btDir * (HA.ActDown2.frame + HA.ActDown2.skip);
            m_nEndFrame := m_nStartFrame + HA.ActDown2.frame - 1;
            m_dwFrameTime := HA.ActDown2.ftime;
            m_dwStartTime := GetTickCount;
            if m_nCurrentAction = SM_DOWNRUN then
            m_nMoveStep := 2
            else
            m_nMoveStep := 1;
            Shift (m_btDir, m_nMoveStep, 0, m_nEndFrame-m_nStartFrame+1);
         end else begin
            m_nStartFrame := HA.ActRun.start + m_btDir * (HA.ActRun.frame + HA.ActRun.skip);
            m_nEndFrame := m_nStartFrame + HA.ActRun.frame - 1;
            m_dwFrameTime := HA.ActRun.ftime;
            m_dwStartTime := GetTickCount;
            if m_nCurrentAction = SM_DOWNRUN then
            m_nMoveStep := 2
            else
            m_nMoveStep := 1;
            Shift (m_btDir, m_nMoveStep, 0, m_nEndFrame-m_nStartFrame+1);
         end;
      end else begin
        if m_btWeapon in [0,1,180..218] then begin  //자객 무기 검
            m_nStartFrame := HA.ActDown.start + m_btDir * (HA.ActDown.frame + HA.ActDown.skip);
            m_nEndFrame := m_nStartFrame + HA.ActDown.frame - 1;
            m_dwFrameTime := HA.ActDown.ftime;
            m_dwStartTime := GetTickCount;
            if m_nCurrentAction = SM_DOWNRUN then
            m_nMoveStep := 2
            else
            m_nMoveStep := 1;
            Shift (m_btDir, m_nMoveStep, 0, m_nEndFrame-m_nStartFrame+1);
        end else begin
            m_nStartFrame := HA.ActRun.start + m_btDir * (HA.ActRun.frame + HA.ActRun.skip);
            m_nEndFrame := m_nStartFrame + HA.ActRun.frame - 1;
            m_dwFrameTime := HA.ActRun.ftime;
            m_dwStartTime := GetTickCount;
            if m_nCurrentAction = SM_DOWNRUN then
            m_nMoveStep := 2
            else
            m_nMoveStep := 1;
            Shift (m_btDir, m_nMoveStep, 0, m_nEndFrame-m_nStartFrame+1);
        end;
      end;
      end;
      end;

       SM_BOW: begin
          m_boThrow := TRUE;
          if (m_btMask > 0) and (m_btMask <> 255) then begin  //변신탈
            m_nStartFrame := HA.ActHit.start + m_btDir * (HA.ActHit.frame + HA.ActHit.skip);
            m_nEndFrame := m_nStartFrame + HA.ActHit.frame - 1;
            m_dwFrameTime := HA.ActHit.ftime - (m_nHitSpeed) * 2;
          end else begin
            m_nStartFrame := HA.ActBow.start + m_btDir * (HA.ActBow.frame + HA.ActBow.skip);
            m_nEndFrame := m_nStartFrame + HA.ActBow.frame - 1;
            m_dwFrameTime := HA.ActBow.ftime - (m_nHitSpeed) * 2;
          end;
          m_dwStartTime := GetTickCount;
          m_boWarMode := True;
          m_dwWarModeTime := GetTickCount;
          Shift(m_btDir, 0, 0, 1);
        end;


      SM_HITLEFT:     //왼손
         begin
          if (m_btJob in [5..8]) then begin //우화등선 비연자객
            m_nStartFrame := HA.ActHitLeft2.start + m_btDir * (HA.ActHitLeft2.frame + HA.ActHitLeft2.skip);
            m_nEndFrame := m_nStartFrame + HA.ActHitLeft2.frame - 1;
            m_dwFrameTime := HA.ActHitLeft2.ftime - (m_nHitSpeed) * 2;
            m_dwStartTime := GetTickCount;
            m_boWarMode := TRUE;
            m_dwWarModeTime := GetTickCount;
            Shift (m_btDir, 0, 0, 1);
          end else begin
            m_nStartFrame := HA.ActHitLeft.start + m_btDir * (HA.ActHitLeft.frame + HA.ActHitLeft.skip);
            m_nEndFrame := m_nStartFrame + HA.ActHitLeft.frame - 1;
            m_dwFrameTime := HA.ActHitLeft.ftime - (m_nHitSpeed) * 2;
            m_dwStartTime := GetTickCount;
            m_boWarMode := TRUE;
            m_dwWarModeTime := GetTickCount;
            Shift (m_btDir, 0, 0, 1);
          end;
         end;

      SM_BALDO:   //오른손
          begin
          if (m_btMask > 0) and (m_btMask <> 255) then begin  //변신탈
            m_nStartFrame := HA.ActHit.start + m_btDir * (HA.ActHit.frame + HA.ActHit.skip);
            m_nEndFrame := m_nStartFrame + HA.ActHit.frame - 1;
            m_dwFrameTime := HA.ActHit.ftime - (m_nHitSpeed) * 2;
            m_dwStartTime := GetTickCount;
            m_boWarMode := TRUE;
            m_dwWarModeTime := GetTickCount;
          end else begin
          if (m_btJob in [5..8]) then begin //우화등선 비연자객 발도 SM_BALDO
            m_nStartFrame := HA.ActHit2.start + m_btDir * (HA.ActHit2.frame + HA.ActHit2.skip);
            m_nEndFrame := m_nStartFrame + HA.ActHitLeft2.frame - 1;
            m_dwFrameTime := HA.ActHitLeft2.ftime - (m_nHitSpeed) * 2;
            m_dwStartTime := GetTickCount;
            Shift (m_btDir, 0, 0, 1);
          end else begin
            m_nStartFrame := HA.ActHit.start + m_btDir * (HA.ActHit.frame + HA.ActHit.skip);
            m_nEndFrame := m_nStartFrame + HA.ActHitLeft.frame - 1;
            m_dwFrameTime := HA.ActHitLeft.ftime - (m_nHitSpeed) * 2;
            m_dwStartTime := GetTickCount;
            Shift (m_btDir, 0, 0, 1);
          end;
          end;
         end;

      SM_BALDO2:     //왼손
         begin
          if (m_btMask > 0) and (m_btMask <> 255) then begin  //변신탈
            m_nStartFrame := HA.ActHit.start + m_btDir * (HA.ActHit.frame + HA.ActHit.skip);
            m_nEndFrame := m_nStartFrame + HA.ActHit.frame - 1;
            m_dwFrameTime := HA.ActHit.ftime - (m_nHitSpeed) * 2;
            m_dwStartTime := GetTickCount;
            m_boWarMode := TRUE;
            m_dwWarModeTime := GetTickCount;
          end else begin
          if (m_btJob in [5..8]) then begin //우화등선 비연자객 발도 SM_BALDO2
            m_nStartFrame := HA.ActHitLeft2.start + m_btDir * (HA.ActHitLeft2.frame + HA.ActHitLeft2.skip);
            m_nEndFrame := m_nStartFrame + HA.ActHitLeft2.frame - 1;
            m_dwFrameTime := HA.ActHitLeft2.ftime - (m_nHitSpeed) * 2;
            m_dwStartTime := GetTickCount;
            Shift (m_btDir, 0, 0, 1);
          end else begin
            m_nStartFrame := HA.ActHitLeft.start + m_btDir * (HA.ActHitLeft.frame + HA.ActHitLeft.skip);
            m_nEndFrame := m_nStartFrame + HA.ActHitLeft.frame - 1;
            m_dwFrameTime := HA.ActHitLeft.ftime - (m_nHitSpeed) * 2;
            m_dwStartTime := GetTickCount;
            Shift (m_btDir, 0, 0, 1);
          end;
          end;
         end;

      SM_HIT, SM_POWERHIT, SM_LONGHIT, SM_WIDEHIT, SM_FIREHIT , SM_CRSHIT, SM_TWINHIT,  SM_CRBHIT, SM_NANCRSHIT,
       SM_CPOWERHIT, SM_CFIREHIT, SM_TAGUHIT, SM_THUNDERHIT, SM_FIRESHAOLIN:
         begin
          if (m_btMask > 0) and (m_btMask <> 255) then begin  //변신탈
            m_nStartFrame := HA.ActHit.start + m_btDir * (HA.ActHit.frame + HA.ActHit.skip);
            m_nEndFrame := m_nStartFrame + HA.ActHit.frame - 1;
            m_dwFrameTime := HA.ActHit.ftime - (m_nHitSpeed) * 2;
          end else begin
            if (m_btJob in [5..8]) then begin //우화등선 SM_HIT
              if m_btWeapon in [0,1,38,39,68..97,110..115] then begin
                m_nStartFrame := HA.ActHitUp.start + m_btDir * (HA.ActHitUp.frame + HA.ActHitUp.skip);
                m_nEndFrame := m_nStartFrame + HA.ActHitUp.frame - 1;
                m_dwFrameTime := HA.ActHitUp.ftime - (m_nHitSpeed) * 2;
              end else begin
                 if m_btWeapon in [172..179,192..197,200..205,208,209] then begin  //우화등선 비연  ActHit2
                   m_nStartFrame := HA.ActHit2.start + m_btDir * (HA.ActHit2.frame + HA.ActHit2.skip);
                   m_nEndFrame := m_nStartFrame + HA.ActHit2.frame - 1;
                   m_dwFrameTime := HA.ActHit2.ftime - (m_nHitSpeed) * 2;
                 end else begin
                   m_nStartFrame := HA.ActHitJobUp.start + m_btDir * (HA.ActHitJobUp.frame + HA.ActHitJobUp.skip);
                   m_nEndFrame := m_nStartFrame + HA.ActHitJobUp.frame - 1;
                   m_dwFrameTime := HA.ActHitJobUp.ftime - (m_nHitSpeed) * 2;
                 end;
              end;
            end else begin
               m_nStartFrame := HA.ActHit.start + m_btDir * (HA.ActHit.frame + HA.ActHit.skip);
               m_nEndFrame := m_nStartFrame + HA.ActHit.frame - 1;
               m_dwFrameTime := HA.ActHit.ftime - (m_nHitSpeed) * 2;
            end;
          end;
            m_dwStartTime := GetTickCount;
            m_boWarMode := TRUE;
            m_dwWarModeTime := GetTickCount;
            if (m_nCurrentAction = SM_POWERHIT) OR (m_nCurrentAction = SM_CPOWERHIT)  then begin
               m_boHitEffect := TRUE;
               m_nMagLight := 2;
               m_nHitEffectNumber := 1;
            end;
            if (m_nCurrentAction = SM_LONGHIT) then begin
               m_boHitEffect := TRUE;
               m_nMagLight := 2;
               if (m_nState and $00000040 <> 0) then m_nHitEffectNumber := 9 else //어검술 강화
               m_nHitEffectNumber := 2;
            end;
            if (m_nCurrentAction = SM_TAGUHIT) then begin  //타구봉법 - 승려
               m_boHitEffect := TRUE;
               m_nMagLight := 2;
               m_nHitEffectNumber := 13;
            end;
            if (m_nCurrentAction = SM_WIDEHIT) then begin
               m_boHitEffect := TRUE;
               m_nMagLight := 2;
               m_nHitEffectNumber := 3;
            end;
            if (m_nCurrentAction = SM_FIREHIT) OR (m_nCurrentAction = SM_CFIREHIT)  then begin
               m_boHitEffect := TRUE;
               m_nMagLight := 2;
               if (m_nState and $00000040 <> 0) then m_nHitEffectNumber := 10 else //염화결 강화
               m_nHitEffectNumber := 4;
            end;
            if (m_nCurrentAction = SM_CRSHIT) then begin
               m_boHitEffect := TRUE;
               m_nMagLight := 2;
               if (m_nState and $00000040 <> 0) then m_nHitEffectNumber := 11 else //광풍참 강화
               m_nHitEffectNumber := 6;
            end;
            if (m_nCurrentAction = SM_NANCRSHIT) then begin   //난화혈풍참
               m_boHitEffect := TRUE;
               m_nMagLight := 2;
               m_nHitEffectNumber := 20;
            end;
            if (m_nCurrentAction = SM_TWINHIT) then begin
               m_boHitEffect := TRUE;
               m_nMagLight := 2;
               m_nHitEffectNumber := 7;
            end;
            if (m_nCurrentAction = SM_THUNDERHIT) then begin  //뇌룡봉법
               m_boHitEffect := TRUE;
               m_nMagLight := 2;
               m_nHitEffectNumber := 14;
            end;
            if (m_nCurrentAction = SM_FIRESHAOLIN) then begin  //천화봉법
               m_boHitEffect := TRUE;
               m_nMagLight := 2;
               m_nHitEffectNumber := 15;
            end;
            if (m_nCurrentAction = SM_CRBHIT) then begin  //회풍천봉법 - 도사
               m_boHitEffect := TRUE;
               m_nMagLight := 2;
               m_nHitEffectNumber := 18;
            end;
            Shift (m_btDir, 0, 0, 1);
         end;

      SM_HEAVYHIT:
         begin
         if (m_btMask > 0) and (m_btMask <> 255) then begin  //변신탈
            m_nStartFrame := HA.ActHeavyHit.start + m_btDir * (HA.ActHeavyHit.frame + HA.ActHeavyHit.skip);
            m_nEndFrame := m_nStartFrame + HA.ActHeavyHit.frame - 1;
            m_dwFrameTime := HA.ActHeavyHit.ftime - (m_nHitSpeed) * 2;
            m_dwStartTime := GetTickCount;
            m_boWarMode := TRUE;
            m_dwWarModeTime := GetTickCount;
            Shift (m_btDir, 0, 0, 1);
         end else begin
         if (m_btJob in [5..8]) then begin //우화등선 SM_HEAVYHIT
           if m_btWeapon in [0,1,38,39,68..97,110..115] then begin
            m_nStartFrame := HA.ActHeavyHitUp.start + m_btDir * (HA.ActHeavyHitUp.frame + HA.ActHeavyHitUp.skip);
            m_nEndFrame := m_nStartFrame + HA.ActHeavyHitUp.frame - 1;
            m_dwFrameTime := HA.ActHeavyHitUp.ftime - (m_nHitSpeed) * 2;
            m_dwStartTime := GetTickCount;
            m_boWarMode := TRUE;
            m_dwWarModeTime := GetTickCount;
            Shift (m_btDir, 0, 0, 1);
           end else
           if m_btWeapon in [172..179,192..197,200..205,208,209] then begin  //우화등선 비연  ActHeavyHit2
            m_nStartFrame := HA.ActHeavyHit2.start + m_btDir * (HA.ActHeavyHit2.frame + HA.ActHeavyHit2.skip);
            m_nEndFrame := m_nStartFrame + HA.ActHeavyHit2.frame - 1;
            m_dwFrameTime := HA.ActHeavyHit2.ftime - (m_nHitSpeed) * 2;
            m_dwStartTime := GetTickCount;
            m_boWarMode := TRUE;
            m_dwWarModeTime := GetTickCount;
            Shift (m_btDir, 0, 0, 1);
           end else
            m_nStartFrame := HA.ActHeavyHitJobUp.start + m_btDir * (HA.ActHeavyHitJobUp.frame + HA.ActHeavyHitJobUp.skip);
            m_nEndFrame := m_nStartFrame + HA.ActHeavyHitJobUp.frame - 1;
            m_dwFrameTime := HA.ActHeavyHitJobUp.ftime - (m_nHitSpeed) * 2;
            m_dwStartTime := GetTickCount;
            m_boWarMode := TRUE;
            m_dwWarModeTime := GetTickCount;
            Shift (m_btDir, 0, 0, 1);
         end else begin
            m_nStartFrame := HA.ActHeavyHit.start + m_btDir * (HA.ActHeavyHit.frame + HA.ActHeavyHit.skip);
            m_nEndFrame := m_nStartFrame + HA.ActHeavyHit.frame - 1;
            m_dwFrameTime := HA.ActHeavyHit.ftime - (m_nHitSpeed) * 2;
            m_dwStartTime := GetTickCount;
            m_boWarMode := TRUE;
            m_dwWarModeTime := GetTickCount;
            Shift (m_btDir, 0, 0, 1);
         end;
         end;
         end;


      SM_FISHING1:  //낚시 시작
         begin
           if (m_btMask > 0) and (m_btMask <> 255) then begin  //변신탈
              m_nStartFrame := HA.ActFishStart.start + m_btDir * (HA.ActFishStart.frame + HA.ActFishStart.skip);
              m_nEndFrame := m_nStartFrame + HA.ActFishStart.frame - 1;
              m_dwFrameTime := HA.ActFishStart.ftime;
              m_dwStartTime := GetTickCount;
              m_boWarMode := FALSE;
              m_dwWarModeTime := GetTickCount;
              Shift (m_btDir, 0, 0, 1);
              PlaySound2(s_fishingStart);
           end else begin
           if (m_btJob in [5..8]) then begin //우화등선 이면
              m_nStartFrame := HA.ActFishStartUp.start + m_btDir * (HA.ActFishStartUp.frame + HA.ActFishStartUp.skip);
              m_nEndFrame := m_nStartFrame + HA.ActFishStartUp.frame - 1;
              m_dwFrameTime := HA.ActFishStartUp.ftime;
              m_dwStartTime := GetTickCount;
              m_boWarMode := FALSE;
              m_dwWarModeTime := GetTickCount;
              Shift (m_btDir, 0, 0, 1);
              PlaySound2(s_fishingStart);
           end else begin
              m_nStartFrame := HA.ActFishStart.start + m_btDir * (HA.ActFishStart.frame + HA.ActFishStart.skip);
              m_nEndFrame := m_nStartFrame + HA.ActFishStart.frame - 1;
              m_dwFrameTime := HA.ActFishStart.ftime;
              m_dwStartTime := GetTickCount;
              m_boWarMode := FALSE;
              m_dwWarModeTime := GetTickCount;
              Shift (m_btDir, 0, 0, 1);
              PlaySound2(s_fishingStart);
           end;
           end;
         end;
      SM_FISHING2:  //낚시 끝
         begin
           if (m_btMask > 0) and (m_btMask <> 255) then begin  //변신탈
              m_fishbor := true;
              m_nFrame3:=0;
              m_nStartFrame := HA.ActFishEnd.start + m_btDir * (HA.ActFishEnd.frame + HA.ActFishEnd.skip);
              m_nEndFrame := m_nStartFrame + HA.ActFishEnd.frame - 1;
              m_dwFrameTime := HA.ActFishEnd.ftime;
              m_dwStartTime := GetTickCount;
              m_boWarMode := FALSE;
              m_dwWarModeTime := GetTickCount;
              Shift (m_btDir, 0, 0, 1);
              PlaySound2(s_fishingEnd);
           end else begin
           if (m_btJob in [5..8]) then begin //우화등선 이면
              m_fishbor := true;
              m_nFrame3:=0;
              m_nStartFrame := HA.ActFishEndUp.start + m_btDir * (HA.ActFishEndUp.frame + HA.ActFishEndUp.skip);
              m_nEndFrame := m_nStartFrame + HA.ActFishEndUp.frame - 1;
              m_dwFrameTime := HA.ActFishEndUp.ftime;
              m_dwStartTime := GetTickCount;
              m_boWarMode := FALSE;
              m_dwWarModeTime := GetTickCount;
              Shift (m_btDir, 0, 0, 1);
              PlaySound2(s_fishingEnd);
           end else begin
              m_fishbor := true;
              m_nFrame3:=0;
              m_nStartFrame := HA.ActFishEnd.start + m_btDir * (HA.ActFishEnd.frame + HA.ActFishEnd.skip);
              m_nEndFrame := m_nStartFrame + HA.ActFishEnd.frame - 1;
              m_dwFrameTime := HA.ActFishEnd.ftime;
              m_dwStartTime := GetTickCount;
              m_boWarMode := FALSE;
              m_dwWarModeTime := GetTickCount;
              Shift (m_btDir, 0, 0, 1);
              PlaySound2(s_fishingEnd);
           end;
           end;
         end;


      SM_DEATHHIT:           //살생도
         begin
         if (m_btMask > 0) and (m_btMask <> 255) then begin  //변신탈
           if (m_btJob in [5..8]) then begin //우화등선 비연자객 SM_WBHIT ActHit
             m_nStartFrame := HA.ActBigHit.start + m_btDir * (HA.ActBigHit.frame + HA.ActBigHit.skip);
             m_nEndFrame := m_nStartFrame + HA.ActBigHit.frame - 1;
             m_dwFrameTime := HA.ActBigHit.ftime;
             m_dwStartTime := GetTickCount;
             m_boWarMode := TRUE;
             m_dwWarModeTime := GetTickCount;
             m_boHitEffect := TRUE;
             m_nAssEffectimg := 6;
             HKillStartTime    := GetTickCount;
             HKillCurrentFrame := 0;
             HKillFrametime    := m_dwFrameTime;
           end else begin
             m_nStartFrame := HA.ActBigHit2.start + m_btDir * (HA.ActBigHit2.frame + HA.ActBigHit2.skip);
             m_nEndFrame := m_nStartFrame + HA.ActBigHit2.frame - 1;
             m_dwFrameTime := HA.ActBigHit2.ftime;
             m_dwStartTime := GetTickCount;
             m_boWarMode := TRUE;
             m_dwWarModeTime := GetTickCount;
             m_boHitEffect := TRUE;
             m_nAssEffectimg := 6 ;
             HKillStartTime    := GetTickCount;
             HKillCurrentFrame := 0;
             HKillFrametime    := m_dwFrameTime;
           end;
         end else begin
         if (m_btJob in [5..8]) then begin //우화등선 비연자객 SM_WBHIT  ActHit2
            m_nStartFrame := HA.ActBigHit2.start + m_btDir * (HA.ActBigHit2.frame + HA.ActBigHit2.skip);
            m_nEndFrame := m_nStartFrame + HA.ActBigHit2.frame - 1;
            m_dwFrameTime := HA.ActBigHit2.ftime;
            m_dwStartTime := GetTickCount;
            m_boWarMode := TRUE;
            m_dwWarModeTime := GetTickCount;
            m_boHitEffect := TRUE;
            m_nAssEffectimg := 6;
            HKillStartTime    := GetTickCount;
            HKillCurrentFrame := 0;
            HKillFrametime    := m_dwFrameTime;
         end else begin
            m_nStartFrame := HA.ActBigHit.start + m_btDir * (HA.ActBigHit.frame + HA.ActBigHit.skip);
            m_nEndFrame := m_nStartFrame + HA.ActBigHit.frame - 1;
            m_dwFrameTime := HA.ActBigHit.ftime;
            m_dwStartTime := GetTickCount;
            m_boWarMode := TRUE;
            m_dwWarModeTime := GetTickCount;
            m_boHitEffect := TRUE;
            m_nAssEffectimg := 6;
            HKillStartTime    := GetTickCount;
            HKillCurrentFrame := 0;
            HKillFrametime    := m_dwFrameTime;
         end;
         end;
         end;


      SM_WBHIT:           //풍검술
         begin
         if (m_btMask > 0) and (m_btMask <> 255) then begin  //변신탈
           if (m_btJob in [5..8]) then begin //우화등선 비연자객 SM_WBHIT ActHit
             m_nStartFrame := HA.ActHit.start + m_btDir * (HA.ActHit.frame + HA.ActHit.skip);
             m_nEndFrame := m_nStartFrame + HA.ActHit.frame - 1;
             m_dwFrameTime := 65  - (m_nHitSpeed) * 2  ;{HA.ActHit.ftime div 2;}
             m_dwStartTime := GetTickCount;
             m_boWarMode := TRUE;
             m_dwWarModeTime := GetTickCount;
             m_boHitEffect := TRUE;
             if (m_nState and $00000040 <> 0) then m_nAssEffectimg := 4
              else m_nAssEffectimg := 1;
           end else begin
             m_nStartFrame := HA.ActHit.start + m_btDir * (HA.ActHit.frame + HA.ActHit.skip);
             m_nEndFrame := m_nStartFrame + HA.ActHit.frame - 1;
             m_dwFrameTime := 65  - (m_nHitSpeed) * 2   ;{HA.ActHit.ftime div 2;}
             m_dwStartTime := GetTickCount;
             m_boWarMode := TRUE;
             m_dwWarModeTime := GetTickCount;
             m_boHitEffect := TRUE;
             if (m_nState and $00000040 <> 0) then m_nAssEffectimg := 4
              else m_nAssEffectimg := 1;
           end;
         end else begin
         if (m_btJob in [5..8]) then begin //우화등선 비연자객 SM_WBHIT  ActHit2
            m_nStartFrame := HA.ActHit2.start + m_btDir * (HA.ActHit2.frame + HA.ActHit2.skip);
            m_nEndFrame := m_nStartFrame + HA.ActHit2.frame - 1;
            m_dwFrameTime := 65  - (m_nHitSpeed) * 2 ;{HA.ActHit.ftime div 2;}
            m_dwStartTime := GetTickCount;
            m_boWarMode := TRUE;
            m_dwWarModeTime := GetTickCount;
            m_boHitEffect := TRUE;
            if (m_nState and $00000040 <> 0) then m_nAssEffectimg := 4
             else m_nAssEffectimg := 1;
         end else begin
            m_nStartFrame := HA.ActHit.start + m_btDir * (HA.ActHit.frame + HA.ActHit.skip);
            m_nEndFrame := m_nStartFrame + HA.ActHit.frame - 1;
            m_dwFrameTime := 65  - (m_nHitSpeed) * 2 ;{HA.ActHit.ftime div 2;}
            m_dwStartTime := GetTickCount;
            m_boWarMode := TRUE;
            m_dwWarModeTime := GetTickCount;
            m_boHitEffect := TRUE;
            if (m_nState and $00000040 <> 0) then m_nAssEffectimg := 4
             else m_nAssEffectimg := 1;
         end;
         end;
         end;
      SM_WBHIT2:     //풍검술
         begin
         if (m_btMask > 0) and (m_btMask <> 255) then begin  //변신탈
           if (m_btJob in [5..8]) then begin //우화등선 비연자객 SM_WBHIT2
             m_nStartFrame := HA.ActHit.start + m_btDir * (HA.ActHit.frame + HA.ActHit.skip);
             m_nEndFrame := m_nStartFrame + HA.ActHit.frame - 1;
             m_dwFrameTime := 65  - (m_nHitSpeed) * 2 ;{HA.ActHit.ftime div 2;}
             m_dwStartTime := GetTickCount;
             m_boWarMode := TRUE;
             m_dwWarModeTime := GetTickCount;
             m_boHitEffect := TRUE;
             if (m_nState and $00000040 <> 0) then m_nAssEffectimg := 4
              else m_nAssEffectimg := 1;
           end else begin
             m_nStartFrame := HA.ActHit.start + m_btDir * (HA.ActHit.frame + HA.ActHit.skip);
             m_nEndFrame := m_nStartFrame + HA.ActHit.frame - 1;
             m_dwFrameTime := 65  - (m_nHitSpeed) * 2 ;{HA.ActHit.ftime div 2;}
             m_dwStartTime := GetTickCount;
             m_boWarMode := TRUE;
             m_dwWarModeTime := GetTickCount;
             m_boHitEffect := TRUE;
             if (m_nState and $00000040 <> 0) then m_nAssEffectimg := 4
              else m_nAssEffectimg := 1;
           end;
         end else begin
         if (m_btJob in [5..8]) then begin //우화등선 비연자객 SM_WBHIT2  ActHitLeft2
            m_nStartFrame := HA.ActHitLeft2.start + m_btDir * (HA.ActHitLeft2.frame + HA.ActHitLeft2.skip);
            m_nEndFrame := m_nStartFrame + HA.ActHitLeft2.frame - 1;
            m_dwFrameTime := 70  - (m_nHitSpeed) * 2 ;{HA.ActHitLeft.ftime div 2;}
            m_dwStartTime := GetTickCount;
            m_boWarMode := TRUE;
            m_dwWarModeTime := GetTickCount;
            m_boHitEffect := TRUE;
            if (m_nState and $00000040 <> 0) then m_nAssEffectimg := 5
             else m_nAssEffectimg := 2;
         end else begin
            m_nStartFrame := HA.ActHitLeft.start + m_btDir * (HA.ActHitLeft.frame + HA.ActHitLeft.skip);
            m_nEndFrame := m_nStartFrame + HA.ActHitLeft.frame - 1;
            m_dwFrameTime := 70  - (m_nHitSpeed) * 2 ;{HA.ActHitLeft.ftime div 2;}
            m_dwStartTime := GetTickCount;
            m_boWarMode := TRUE;
            m_dwWarModeTime := GetTickCount;
            m_boHitEffect := TRUE;
            if (m_nState and $00000040 <> 0) then m_nAssEffectimg := 5
             else m_nAssEffectimg := 2;
         end;
         end;
         end;
      SM_BIGHIT:
         begin
         if (m_btMask > 0) and (m_btMask <> 255) then begin  //변신탈
            m_nStartFrame := HA.ActBigHit.start + m_btDir * (HA.ActBigHit.frame + HA.ActBigHit.skip);
            if m_btMask in [22..26] then
              m_nEndFrame := m_nStartFrame + HA.ActBigHit.frame - 3
            else
            m_nEndFrame := m_nStartFrame + HA.ActBigHit.frame - 1;
            m_dwFrameTime := HA.ActBigHit.ftime - (m_nHitSpeed) * 2;
            m_dwStartTime := GetTickCount;
            m_boWarMode := TRUE;
            m_dwWarModeTime := GetTickCount;
            Shift (m_btDir, 0, 0, 1);
         end else begin
         if (m_btJob in [5..8]) then begin //우화등선 SM_BIGHIT
          if m_btWeapon in [0,1,38,39,68..97,110..115] then begin
            m_nStartFrame := HA.ActBigHitUp.start + m_btDir * (HA.ActBigHitUp.frame + HA.ActBigHitUp.skip);
            m_nEndFrame := m_nStartFrame + HA.ActBigHitUp.frame - 1;
            m_dwFrameTime := HA.ActBigHitUp.ftime - (m_nHitSpeed) * 2;
            m_dwStartTime := GetTickCount;
            m_boWarMode := TRUE;
            m_dwWarModeTime := GetTickCount;
            Shift (m_btDir, 0, 0, 1);
          end else begin
          if m_btWeapon in [172..179,192..197,200..205,208,209] then begin  //우화등선 비연
            m_nStartFrame := HA.ActBigHit2.start + m_btDir * (HA.ActBigHit2.frame + HA.ActBigHit2.skip);
            m_nEndFrame := m_nStartFrame + HA.ActBigHit2.frame - 1;
            m_dwFrameTime := HA.ActBigHit2.ftime - (m_nHitSpeed) * 2;
            m_dwStartTime := GetTickCount;
            m_boWarMode := TRUE;
            m_dwWarModeTime := GetTickCount;
            Shift (m_btDir, 0, 0, 1);
          end else begin
          if m_btWeapon in [100,101,156..163] then begin    //우화등선 홍현
            m_nStartFrame := HA.ActBigHitJobUp2.start + m_btDir * (HA.ActBigHitJobUp2.frame + HA.ActBigHitJobUp2.skip);
            m_nEndFrame := m_nStartFrame + HA.ActBigHitJobUp2.frame - 1;
            m_dwFrameTime := HA.ActBigHitJobUp2.ftime - (m_nHitSpeed) * 2;
            m_dwStartTime := GetTickCount;
            m_boWarMode := TRUE;
            m_dwWarModeTime := GetTickCount;
            Shift (m_btDir, 0, 0, 1);
          end else begin
            m_nStartFrame := HA.ActBigHitJobUp.start + m_btDir * (HA.ActBigHitJobUp.frame + HA.ActBigHitJobUp.skip);
            m_nEndFrame := m_nStartFrame + HA.ActBigHitJobUp.frame - 1;
            m_dwFrameTime := HA.ActBigHitJobUp.ftime - (m_nHitSpeed) * 2;
            m_dwStartTime := GetTickCount;
            m_boWarMode := TRUE;
            m_dwWarModeTime := GetTickCount;
            Shift (m_btDir, 0, 0, 1);
          end;
          end;
          end;
         end else begin
            m_nStartFrame := HA.ActBigHit.start + m_btDir * (HA.ActBigHit.frame + HA.ActBigHit.skip);
            m_nEndFrame := m_nStartFrame + HA.ActBigHit.frame - 1;
            m_dwFrameTime := HA.ActBigHit.ftime - (m_nHitSpeed) * 2;
            m_dwStartTime := GetTickCount;
            m_boWarMode := TRUE;
            m_dwWarModeTime := GetTickCount;
            Shift (m_btDir, 0, 0, 1);
         end;
         end;
         end;
      SM_SPELL:
         begin
           if (m_btMask > 0) and (m_btMask <> 255) then begin  //변신탈
            m_nStartFrame := HA.ActSpell.start + m_btDir * (HA.ActSpell.frame + HA.ActSpell.skip);
            m_nEndFrame := m_nStartFrame + HA.ActSpell.frame - 1;
            m_dwFrameTime := HA.ActSpell.ftime;
            m_dwStartTime := GetTickCount;
            m_nCurEffFrame := 0;
            m_boUseMagic := TRUE;
           end else begin
             if (m_btJob in [5..8]) then begin //우화등선 SM_SPELL
               if m_btWeapon in [0,1,38,39,68..97,110..115] then begin
                 m_nStartFrame := HA.ActSpellUp.start + m_btDir * (HA.ActSpellUp.frame + HA.ActSpellUp.skip);
                 m_nEndFrame := m_nStartFrame + HA.ActSpellUp.frame - 1;
                 m_dwFrameTime := HA.ActSpellUp.ftime;
                 m_dwStartTime := GetTickCount;
                 m_nCurEffFrame := 0;
                 m_boUseMagic := TRUE;
               end else begin
                 if m_btWeapon in [172..179,192..197,200..205,208,209] then begin  //우화등선 비연
                   m_nStartFrame := HA.ActSpell2.start + m_btDir * (HA.ActSpell2.frame + HA.ActSpell2.skip);
                   m_nEndFrame := m_nStartFrame + HA.ActSpell2.frame - 1;
                   m_dwFrameTime := HA.ActSpell2.ftime;
                   m_dwStartTime := GetTickCount;
                   m_nCurEffFrame := 0;
                   m_boUseMagic := TRUE;
                 end else begin
                   m_nStartFrame := HA.ActSpellJobUp.start + m_btDir * (HA.ActSpellJobUp.frame + HA.ActSpellJobUp.skip);
                   m_nEndFrame := m_nStartFrame + HA.ActSpellJobUp.frame - 1;
                   m_dwFrameTime := HA.ActSpellJobUp.ftime;
                   m_dwStartTime := GetTickCount;
                   m_nCurEffFrame := 0;
                   m_boUseMagic := TRUE;
                 end;
               end;
             end else begin
               m_nStartFrame := HA.ActSpell.start + m_btDir * (HA.ActSpell.frame + HA.ActSpell.skip);
               m_nEndFrame := m_nStartFrame + HA.ActSpell.frame - 1;
               m_dwFrameTime := HA.ActSpell.ftime;
               m_dwStartTime := GetTickCount;
               m_nCurEffFrame := 0;
               m_boUseMagic := TRUE;
             end;
           end;;
           case m_CurMagic.EffectNumber of       //마법 시전 모션
               22: begin //뢰설화
                  m_nMagLight := 4;
                  m_nSpellFrame := 10;
               end;
               26: begin //탐기파연
                  m_nMagLight := 2;
                  m_nSpellFrame := 20;
                  m_dwFrameTime := m_dwFrameTime div 2;
               end;
               35: begin  //무극진기
                  m_nMagLight := 2;
                  m_nSpellFrame := 15;
               end;
               95, 96: begin  //청풍명월, 적혈무영
                  m_nMagLight := 2;
                  m_nSpellFrame := 16;
                  PlaySound2(MWindMoon);
               end;
               43: begin //사자후
                  m_nMagLight := 2;
                  m_nSpellFrame := 20;
                  m_dwFrameTime := 70;
               end;
               44: Begin       //공파섬
                  if (m_btMask > 0) and (m_btMask <> 255) then begin  //변신탈
                    m_nStartFrame := HA.ActBigHit.start + m_btDir * (HA.ActBigHit.frame + HA.ActBigHit.skip);
                    m_nEndFrame := m_nStartFrame + HA.ActBigHit.frame - 1;
                  end else begin
                    if (m_btJob in [5..8]) then begin //우화등선 벽혈전사 공파섬
                      if m_btWeapon in [0,1,38,39,68..97,110..115] then begin
                        m_nStartFrame := HA.ActBigHitUp.start + m_btDir * (HA.ActBigHitUp.frame + HA.ActBigHitUp.skip);
                        m_nEndFrame := m_nStartFrame + HA.ActBigHitUp.frame - 1;
                      end else begin
                        if m_btWeapon in [98,99,146..155] then begin    //우화등선 벽혈
                          m_nStartFrame := HA.ActHitSpellJobUp.start + m_btDir * (HA.ActHitSpellJobUp.frame + HA.ActHitSpellJobUp.skip);
                          m_nEndFrame := m_nStartFrame + HA.ActHitSpellJobUp.frame - 1;
                        end else begin
                          if m_btWeapon in [100,101,156..163] then begin    //우화등선 홍현
                            m_nStartFrame := HA.ActBigHitJobUp2.start + m_btDir * (HA.ActBigHitJobUp2.frame + HA.ActBigHitJobUp2.skip);
                            m_nEndFrame := m_nStartFrame + HA.ActBigHitJobUp2.frame - 1;
                          end else begin
                            m_nStartFrame := HA.ActBigHitJobUp.start + m_btDir * (HA.ActBigHitJobUp.frame + HA.ActBigHitJobUp.skip);
                            m_nEndFrame := m_nStartFrame + HA.ActBigHitJobUp.frame - 1;
                          end;
                        end;
                      end;
                    end else begin
                      m_nStartFrame := HA.ActBigHit.start + m_btDir * (HA.ActBigHit.frame + HA.ActBigHit.skip);
                      m_nEndFrame := m_nStartFrame + HA.ActBigHit.frame - 1;
                    end;
                  end;
                  m_dwFrameTime := 50;
                  m_dwStartTime := GetTickCount;
                  m_nMagLight := 2;
                  m_nSpellFrame := 20;
                  SKillStartTime    := GetTickCount;
                  SKillCurrentFrame := 0;
                  SKillFrametime    := m_dwFrameTime;
                  m_BoHitEffect := TRUE;
                  m_nHitEffectNumber := 8;
                  PlaySound (m_nWeaponSound);
                  PlaySound (10440);
               end;
               45 : begin //화룡기염
                  m_nMagLight := 2;
                  m_nSpellFrame := 10;
                  m_dwFrameTime := 100;
                  if (m_nState and $00000040 <> 0) then FrmMain.UseNormalEffect (NE_FIRECIRCLEUP, self.m_nCurrX, self.m_nCurrY)   //화룡기염 강화
                  else FrmMain.UseNormalEffect (NE_FIRECIRCLE, self.m_nCurrX, self.m_nCurrY); //마법 시젼중 움직일수 있게 하려고
               end;
               47: begin // 포승검
                  m_nMagLight := 2;
                  m_nSpellFrame := 10;
                  m_dwFrameTime := 80;
               end;
               50,51: begin
                  m_dwFrameTime := HA.ActSpell.ftime;
                  m_nMagLight := 3;
                  m_nSpellFrame := 10;
               end;
               52, 53: Begin  //천상빙환 //천상낙염
                  m_boWarMode := TRUE;
                  m_dwWarModeTime := GetTickCount;
                  m_nMagLight := 3;
                  m_nSpellFrame := 10;
                  if not (m_nState and $00040000 <> 0) then
                  g_dwMagicMove  := GetTickCount;   //빙환 낙염 시전 후 못움직임
               end;
               54:begin
                  m_nMagLight := 2;
                  m_nSpellFrame := 10;
                  m_dwFrameTime := 100;
                  PlaySound (10544);
               end;
               55: Begin            //독무
                  m_boWarMode := TRUE;
                  m_dwWarModeTime := GetTickCount;
                  m_nMagLight := 3;
                  m_nSpellFrame := 10;
               end;   
               56: Begin          //일섬
                  m_nStartFrame := m_btDir * (HA.ActStand.frame + HA.ActStand.skip);
                  m_nEndFrame := m_nStartFrame + HA.ActStand.frame - 4;
                  m_dwFrameTime := 20;
                  m_dwStartTime := GetTickCount;
                  m_nMagLight := 2;
                  m_nSpellFrame := 10;
                  m_dwWarModeTime := GetTickCount;
                  PlaySound (10562);
                  m_boWarMode := False;
               end;
               57: Begin          //빙염술
                  m_nStartFrame := m_btDir * (HA.ActStand.frame + HA.ActStand.skip);
                  m_nEndFrame := m_nStartFrame + HA.ActStand.frame - 1;
                  m_dwFrameTime := 40;
                  m_dwStartTime := GetTickCount;
                  m_nMagLight := 2;
                  m_nSpellFrame := 10;
                  PlaySound (10572);
                  m_dwWarModeTime := GetTickCount;
                  m_boWarMode := False;
               end;
               58: Begin            //선천기공
                  m_nStartFrame := m_btDir * (HA.ActStand.frame + HA.ActStand.skip);
                  m_nEndFrame := m_nStartFrame + HA.ActStand.frame - 1;
                  m_dwFrameTime := 85; //40
                  m_dwStartTime := GetTickCount;
                  m_nMagLight := 2;
                  m_nSpellFrame := 10;
                  m_boWarMode := FALSE;
                  m_dwWarModeTime := GetTickCount;
                  PlaySound (10582);
               end;
               59{61}: begin   //체신풍
                 m_dwFrameTime := HA.ActSpell.ftime;
                 m_nSpellFrame := 6;
               end;
               60{63}: Begin            //천이검
                 if (m_btJob in [5..8]) then begin  //우화등선 비연
                   if (m_btMask > 0) and (m_btMask <> 255) then begin  //변신탈
                     m_nStartFrame := HA.ActHeavyHit.start + m_btDir * (HA.ActHeavyHit.frame + HA.ActHeavyHit.skip);
                     m_nEndFrame := m_nStartFrame + HA.ActHeavyHit.frame - 1;
                   end else
                   if m_btWeapon in [172..179,192..197,200..205,208,209] then begin  //우화등선 비연
                    m_nStartFrame := HA.ActHitSpell2.start + m_btDir * (HA.ActHitSpell2.frame + HA.ActHitSpell2.skip);
                     m_nEndFrame := m_nStartFrame + HA.ActHitSpell2.frame - 1;
                   end else
                     m_nStartFrame := HA.ActHeavyHitUp.start + m_btDir * (HA.ActHeavyHitUp.frame + HA.ActHeavyHitUp.skip);
                     m_nEndFrame := m_nStartFrame + HA.ActHeavyHitUp.frame - 1;
                 end else begin
                   m_nStartFrame := HA.ActHeavyHit.start + m_btDir * (HA.ActHeavyHit.frame + HA.ActHeavyHit.skip);
                   m_nEndFrame := m_nStartFrame + HA.ActHeavyHit.frame - 1;
                 end;
                 m_dwFrameTime := 60;
                 m_dwStartTime := GetTickCount;
                 m_boWarMode := TRUE;
                 m_dwWarModeTime := GetTickCount;
                 m_nMagLight := 2;
                 m_nSpellFrame := 10;
                 PlaySound (10635);
               end;
               61{64}:begin     //열풍격
                 m_dwFrameTime := HA.ActSpell.ftime;
                 m_nMagLight := 2;
                 m_nSpellFrame := 10;
               end;
               62{65}:begin   //포박술
                 m_dwFrameTime := HA.ActSpell.ftime;
                 m_nMagLight := 4;
                 m_nSpellFrame := 10;
                 PlaySound (10650);
               end;
               63{66}:begin   //월영술
                 m_dwFrameTime := HA.ActSpell.ftime;
                 m_nMagLight := 2;
                 m_nSpellFrame := 10;
               end;
               64{68}: begin   //경신보
                 m_dwFrameTime := HA.ActSpell.ftime;
                 m_nMagLight := 2;
                 m_nSpellFrame := 16;
               end;
               65{69}: begin   //풍신술
                 m_dwFrameTime := HA.ActSpell.ftime;
                 m_nMagLight := 2;
                 m_nSpellFrame := 10;
               end;
               66{70}: Begin               //맹독검기
                 if (m_btJob in [5..8]) then begin   //우화등선 비연 맹독검기
                   if (m_btMask > 0) and (m_btMask <> 255) then begin  //변신탈
                     m_nStartFrame := HA.ActHit.start + m_btDir * (HA.ActHit.frame + HA.ActHit.skip);
                     m_nEndFrame := m_nStartFrame + HA.ActHit.frame - 1;
                     m_dwFrameTime := HA.ActHit.ftime;
                   end else
                   if m_btWeapon in [0,1,38,39,68..97,110..115] then begin
                     m_nStartFrame := HA.ActHitUp.start + m_btDir * (HA.ActHitUp.frame + HA.ActHitUp.skip);
                     m_nEndFrame := m_nStartFrame + HA.ActHitUp.frame - 1;
                     m_dwFrameTime := HA.ActHitUp.ftime;
                   end else
                   if m_btWeapon in [172..179,192..197,200..205,208,209] then begin  //우화등선 비연
                     m_nStartFrame := HA.ActHit2.start + m_btDir * (HA.ActHit2.frame + HA.ActHit2.skip);
                     m_nEndFrame := m_nStartFrame + HA.ActHit2.frame - 1;
                     m_dwFrameTime := HA.ActHit2.ftime;
                   end else
                     m_nStartFrame := HA.ActHitJobUp.start + m_btDir * (HA.ActHitJobUp.frame + HA.ActHitJobUp.skip);
                     m_nEndFrame := m_nStartFrame + HA.ActHitJobUp.frame - 1;
                     m_dwFrameTime := HA.ActHitJobUp.ftime;
                 end else begin
                   m_nStartFrame := HA.ActHit.start + m_btDir * (HA.ActHit.frame + HA.ActHit.skip);
                   m_nEndFrame := m_nStartFrame + HA.ActHit.frame - 1;
                   m_dwFrameTime := HA.ActHit.ftime;
                 end;
                 m_nSpellFrame := 9;
                 m_boHitEffect := TRUE;
                 m_nMagLight := 2;
                 m_nAssEffectimg := 3;
                 PlaySound (s_pwidehit);
               end;
               67{71}:begin   //열화신
                 m_dwFrameTime := HA.ActSpell.ftime;
                 m_nMagLight := 2;
                 m_nSpellFrame := 10;
               end;
               68{72}: Begin      //월하난무
                 if (m_btJob in [5..8]) then begin //우화등선 비연
                   if (m_btMask > 0) and (m_btMask <> 255) then begin  //변신탈
                     m_nStartFrame := HA.ActBigHit.start + m_btDir * (HA.ActBigHit.frame + HA.ActBigHit.skip);
                     m_nEndFrame := m_nStartFrame + HA.ActBigHit.frame - 1;
                     m_dwFrameTime := HA.ActBigHit.ftime;
                    end else
                     m_nStartFrame := HA.ActBigHit2.start + m_btDir * (HA.ActBigHit2.frame + HA.ActBigHit2.skip);
                     m_nEndFrame := m_nStartFrame + HA.ActBigHit2.frame - 1;
                     m_dwFrameTime := HA.ActBigHit2.ftime;
                 end else begin
                   m_nStartFrame := HA.ActBigHit.start + m_btDir * (HA.ActBigHit.frame + HA.ActBigHit.skip);
                   m_nEndFrame := m_nStartFrame + HA.ActBigHit.frame - 1;
                   m_dwFrameTime := HA.ActBigHit.ftime;
                 end;
                 m_nMagLight := 2;
                 m_nSpellFrame := 14;
                 if m_btSex = 0 then PlaySound (10725)
                 else PlaySound (10726);
               end;

               {69: Begin          //천무
               if (m_btMask > 0) and (m_btMask <> 255) then begin  //변신탈
                  m_nStartFrame :=  m_btDir * (HA.ActStand.frame + HA.ActStand.skip);
                  m_nEndFrame := m_nStartFrame + HA.ActStand.frame -4;
                  m_dwFrameTime := 0;
                  m_dwStartTime := GetTickCount;
                  m_nMagLight := 2;
                  m_nSpellFrame := 0;
                  m_dwWarModeTime := GetTickCount;
                  m_boWarMode := False;
               end else begin
               if (m_btJob in [5..8]) then begin  //우화등선 천무
                  m_nStartFrame :=  m_btDir * (HA.ActStand.frame + HA.ActStand.skip);
                  m_nEndFrame := m_nStartFrame + HA.ActStand.frame -4;
                  m_dwFrameTime := 0;
                  m_dwStartTime := GetTickCount;
                  m_nMagLight := 2;
                  m_nSpellFrame := 0;
                  m_dwWarModeTime := GetTickCount;
                  m_boWarMode := False;
               end else begin
                  m_nStartFrame := m_btDir * (HA.ActStand.frame + HA.ActStand.skip);
                  m_nEndFrame := m_nStartFrame + HA.ActStand.frame - 4;
                  m_dwFrameTime := 0;
                  m_dwStartTime := GetTickCount;
                  m_nMagLight := 2;
                  m_nSpellFrame := 0;
                  m_dwWarModeTime := GetTickCount;
                  m_boWarMode := False;
               end;
               end;
              end;    }
               71{75}: Begin            //번뇌의
                  m_boWarMode := TRUE;
                  m_dwWarModeTime := GetTickCount;
                  m_nMagLight := 3;
                  m_nSpellFrame := 10;
                  PlaySound (10753);
               end;
               72,73,74{77}{73}{74}: begin //혈룡검법 천상비술 혈룡수
                  m_nMagLight := 3;
                  m_nSpellFrame := 10;
                  PlaySound (10730);
               end;

               76{86}: begin //빙뇌천
                 if (m_btMask > 0) and (m_btMask <> 255) then begin  //변신탈
                    m_nStartFrame := HA.ActSitdown.start + m_btDir * (HA.ActSitdown.frame + HA.ActSitdown.skip);
                    m_nEndFrame := m_nStartFrame + HA.ActSitdown.frame -1;
                 end else begin
                   if (m_btJob in [5..8]) then begin //우화등선
                     if m_btWeapon in [0,1,38,39,68..97,110..115] then begin
                       m_nStartFrame := HA.ActSitdownUp.start + m_btDir * (HA.ActSitdownUp.frame + HA.ActSitdownUp.skip);
                       m_nEndFrame := m_nStartFrame + HA.ActSitdownUp.frame -1;
                     end else
                     if m_btWeapon in [172..179,192..197,200..205,208,209] then begin  //우화등선 비연
                       m_nStartFrame := HA.ActSitdown2.start + m_btDir * (HA.ActSitdown2.frame + HA.ActSitdown2.skip);
                       m_nEndFrame := m_nStartFrame + HA.ActSitdown2.frame -1;
                     end else
                       m_nStartFrame := HA.ActSitdownJobUp.start + m_btDir * (HA.ActSitdownJobUp.frame + HA.ActSitdownJobUp.skip);
                       m_nEndFrame := m_nStartFrame + HA.ActSitdownJobUp.frame -1;
                   end else begin
                     m_nStartFrame := HA.ActSitdown.start + m_btDir * (HA.ActSitdown.frame + HA.ActSitdown.skip);
                     m_nEndFrame := m_nStartFrame + HA.ActSitdown.frame - 1;
                   end;
                 end;
                 m_dwFrameTime := 50;
                 m_nMagLight := 4;
                 m_nSpellFrame := 10;
                 PlaySound(10393);
               end;

               77{87}: begin  //태극진
                  m_nMagLight := 4;
                  m_nSpellFrame := 12;
               end;

               79{90}: begin //이형
                  m_nMagLight := 4;
                  m_nSpellFrame := 10;
                  PlaySound (10210);
               end;
               80{91}: begin  //독침술
                  m_nMagLight := 4;
                  m_nSpellFrame := 14;
               end;

               88{93}: begin //빙월격
                 if (m_btMask > 0) and (m_btMask <> 255) then begin  //변신탈
                    m_nStartFrame := HA.ActSitdown.start + m_btDir * (HA.ActSitdown.frame + HA.ActSitdown.skip);
                    m_nEndFrame := m_nStartFrame + HA.ActSitdown.frame -1;
                 end else begin
                   if (m_btJob in [5..8]) then begin //우화등선
                     if m_btWeapon in [0,1,38,39,68..97,110..115] then begin
                       m_nStartFrame := HA.ActSitdownUp.start + m_btDir * (HA.ActSitdownUp.frame + HA.ActSitdownUp.skip);
                       m_nEndFrame := m_nStartFrame + HA.ActSitdownUp.frame -1;
                     end else
                     if m_btWeapon in [172..179,192..197,200..205,208,209] then begin  //우화등선 비연
                       m_nStartFrame := HA.ActSitdown2.start + m_btDir * (HA.ActSitdown2.frame + HA.ActSitdown2.skip);
                       m_nEndFrame := m_nStartFrame + HA.ActSitdown2.frame -1;
                     end else
                       m_nStartFrame := HA.ActSitdownJobUp.start + m_btDir * (HA.ActSitdownJobUp.frame + HA.ActSitdownJobUp.skip);
                       m_nEndFrame := m_nStartFrame + HA.ActSitdownJobUp.frame -1;
                   end else begin
                     m_nStartFrame := HA.ActSitdown.start + m_btDir * (HA.ActSitdown.frame + HA.ActSitdown.skip);
                     m_nEndFrame := m_nStartFrame + HA.ActSitdown.frame - 1;
                   end;
                 end;
                 FrmMain.UseNormalEffect (NE_ICECIRCLE, self.m_nCurrX, self.m_nCurrY); //마법 시젼중 움직일수 있게 하려고
                 m_nMagLight := 4;
                 m_nSpellFrame := 10;
                 PlaySound2(s_StarSuper);
               end;

               89{94}: begin  //만천염옥
                  m_nMagLight := 4;
                  m_dwFrameTime := HA.ActSpell.ftime;
                  m_nSpellFrame := 10;
               end;

               90{95}: begin  //흡성대법
                  m_nMagLight := 4;
                  m_nSpellFrame := 10;
               end;
               91{96}: begin  //강마진법
                  m_nMagLight := 4;
                  m_nSpellFrame := 10;
               end;

               92{97}: begin   //수라강림
                 m_dwFrameTime := HA.ActSpell.ftime;
                 m_nMagLight := 2;
                 m_nSpellFrame := 10;
                 PlaySound(10690);
               end;

               93{98}: begin   //망자의눈
                  m_dwFrameTime := HA.ActSpell.ftime;
                  m_nMagLight := 2;
                  m_nSpellFrame := 10;
                  PlaySound2(Penetrate);
               end;

               97{102}: begin //영적추
                 if (m_btMask > 0) and (m_btMask <> 255) then begin  //변신탈
                    m_nStartFrame := HA.ActSitdown.start + m_btDir * (HA.ActSitdown.frame + HA.ActSitdown.skip);
                    m_nEndFrame := m_nStartFrame + HA.ActSitdown.frame -1;
                 end else begin
                   if (m_btJob in [5..8]) then begin //우화등선
                     if m_btWeapon in [0,1,38,39,68..97,110..115] then begin
                       m_nStartFrame := HA.ActSitdownUp.start + m_btDir * (HA.ActSitdownUp.frame + HA.ActSitdownUp.skip);
                       m_nEndFrame := m_nStartFrame + HA.ActWarModeUp.frame -1;
                     end else
                     if m_btWeapon in [172..179,192..197,200..205,208,209] then begin  //우화등선 비연
                       m_nStartFrame := HA.ActSitdown2.start + m_btDir * (HA.ActSitdown2.frame + HA.ActSitdown2.skip);
                       m_nEndFrame := m_nStartFrame + HA.ActSitdown2.frame -1;
                     end else
                       m_nStartFrame := HA.ActSitdownJobUp.start + m_btDir * (HA.ActSitdownJobUp.frame + HA.ActSitdownJobUp.skip);
                       m_nEndFrame := m_nStartFrame + HA.ActSitdownJobUp.frame -1;
                   end else begin
                     m_nStartFrame := HA.ActSitdown.start + m_btDir * (HA.ActSitdown.frame + HA.ActSitdown.skip);
                     m_nEndFrame := m_nStartFrame + HA.ActSitdown.frame - 1;
                   end;
                 end;
                 m_dwFrameTime := 100;
                 m_nMagLight := 4;
                 m_nSpellFrame := 10;
                 PlaySound(2547);
               end;
               98{103} : begin //참격
                 if (m_btMask > 0) and (m_btMask <> 255) then begin  //변신탈
                    m_nStartFrame := HA.ActHit.start + m_btDir * (HA.ActHit.frame + HA.ActHit.skip);
                    m_nEndFrame := m_nStartFrame + HA.ActHit.frame - 1;
                 end else begin
                   if (m_btJob in [5..8]) then begin //우화등선 벽혈전사 참격
                     if m_btWeapon in [0,1,38,39,68..97,110..115] then begin
                       m_nStartFrame := HA.ActHitUp.start + m_btDir * (HA.ActHitUp.frame + HA.ActHitUp.skip);
                       m_nEndFrame := m_nStartFrame + HA.ActHitUp.frame - 1;
                     end else begin
                       if m_btWeapon in [98,99,146..155] then begin    //우화등선 벽혈
                         m_nStartFrame := HA.ActHitJobUp.start + m_btDir * (HA.ActHitJobUp.frame + HA.ActHitJobUp.skip);
                         m_nEndFrame := m_nStartFrame + HA.ActHitJobUp.frame - 1;
                       end else begin
                         m_nStartFrame := HA.ActHitJobUp.start + m_btDir * (HA.ActHitJobUp.frame + HA.ActHitJobUp.skip);
                         m_nEndFrame := m_nStartFrame + HA.ActHitJobUp.frame - 1;
                        end;
                     end;
                   end else begin
                     m_nStartFrame := HA.ActHit.start + m_btDir * (HA.ActHit.frame + HA.ActHit.skip);
                     m_nEndFrame := m_nStartFrame + HA.ActHit.frame - 1;
                   end;
                 end;
                 m_dwFrameTime := 100;
                 m_dwStartTime := GetTickCount;
                 m_nMagLight := 4;
                 m_nSpellFrame := 10;
                 m_BoHitEffect := TRUE;
                 CKillStartTime    := GetTickCount;
                 CKillCurrentFrame := 0;
                 CKillFrametime    := m_dwFrameTime;
                 m_nHitEffectNumber := 12;
               end;
               99{104} : begin //뇌신혈
                 m_nMagLight := 2;
                 m_nSpellFrame := 10;
                 m_dwFrameTime := 100;
                 FrmMain.UseNormalEffect (NE_THUNDERCIRCLE, self.m_nCurrX, self.m_nCurrY); //마법 시젼중 움직일수 있게 하려고
                 FrmMain.UseNormalEffect (NE_THUNDERCIRCLE2, self.m_nCurrX, self.m_nCurrY); //마법 시젼중 움직일수 있게 하려고
                 g_dwMagicMove  := GetTickCount;   //빙환 낙염 시전 후 못움직임
               end;

               100{105}: Begin //백호강타
                 if (m_btMask > 0) and (m_btMask <> 255) then begin  //변신탈
                    m_nStartFrame := HA.ActHit.start + m_btDir * (HA.ActHit.frame + HA.ActHit.skip);
                    m_nEndFrame := m_nStartFrame + HA.ActHit.frame - 1;
                    m_dwFrameTime := HA.ActHit.ftime;
                 end else begin
                   if (m_btJob in [5..8]) then begin //우화등선 익선 백호강타
                     if m_btWeapon in [0,1,38,39,68..97,110..115] then begin
                       m_nStartFrame := HA.ActHitUp.start + m_btDir * (HA.ActHitUp.frame + HA.ActHitUp.skip);
                       m_nEndFrame := m_nStartFrame + HA.ActHitUp.frame - 1;
                       m_dwFrameTime := HA.ActHitUp.ftime;
                     end else begin
                       if m_btWeapon in [102,103,164..171] then begin    //우화등선 익선
                         m_nStartFrame := HA.ActHitJobUp.start + m_btDir * (HA.ActHitJobUp.frame + HA.ActHitJobUp.skip);
                         m_nEndFrame := m_nStartFrame + HA.ActHitJobUp.frame - 1;
                         m_dwFrameTime := HA.ActHitJobUp.ftime;
                       end else begin
                         m_nStartFrame := HA.ActHitJobUp.start + m_btDir * (HA.ActHitJobUp.frame + HA.ActHitJobUp.skip);
                         m_nEndFrame := m_nStartFrame + HA.ActHitJobUp.frame - 1;
                         m_dwFrameTime := HA.ActHitJobUp.ftime;
                       end;
                     end;
                   end else begin
                     m_nStartFrame := HA.ActHit.start + m_btDir * (HA.ActHit.frame + HA.ActHit.skip);
                     m_nEndFrame := m_nStartFrame + HA.ActHit.frame - 1;
                     m_dwFrameTime := HA.ActHit.ftime;
                   end;
                 end;
                 m_nMagLight := 4;
                 m_nSpellFrame := 10;
                 PlaySound2(s_cboDs1_start);
               end;

               102{106} : begin //교악
                 m_nMagLight := 2;
                 m_nSpellFrame := 10;
                 m_dwFrameTime := 100;
                 FrmMain.UseNormalEffect (NE_KYO, self.m_nCurrX, self.m_nCurrY); //마법 시젼중 움직일수 있게 하려고
               end;

               103{107} : begin //신기묘산
                 m_nMagLight := 2;
                 m_nSpellFrame := 10;
                 m_dwFrameTime := 100;
                 FrmMain.UseNormalEffect (NE_SINGI, self.m_nCurrX, self.m_nCurrY); //마법 시젼중 움직일수 있게 하려고
               end;

               104{108}: begin //운중뢰격
                 m_nMagLight := 4;
                 m_nSpellFrame := 13;
                 Playsound2 (m_108_1);
               end;

               105{109}: begin //암독만계
                 Playsound2 (m_109_1);
               end;

               108{113}: begin   //선천진기
                  m_dwFrameTime := HA.ActSpell.ftime;
                  m_nSpellFrame := 10;
                  Playsound2 (MB_113);
               end;
               110{115}: Begin            //법륜연공
                 if (m_btMask > 0) and (m_btMask <> 255) then begin  //변신탈
                   m_nStartFrame := HA.ActHit.start + m_btDir * (HA.ActHit.frame + HA.ActHit.skip);
                   m_nEndFrame := m_nStartFrame + HA.ActHit.frame - 1;
                 end else begin
                   m_nStartFrame := HA.ActEnergyHit.start + m_btDir * (HA.ActEnergyHit.frame + HA.ActEnergyHit.skip);
                   m_nEndFrame := m_nStartFrame + HA.ActEnergyHit.frame - 1;
                 end;
                 m_dwFrameTime := 60 - (m_nHitSpeed) div 2;
                 m_dwStartTime := GetTickCount;
                 m_boWarMode := TRUE;
                 m_dwWarModeTime := GetTickCount;
                 m_nMagLight := 2;
                 m_nSpellFrame := 10;
                 PlaySound2 (MB_115);
               end;
               112{118}: begin   //호신강기
                 m_nSpellFrame := 16;
                 PlaySound2(MB_118);
               end;

               114{120} : begin //고려무진봉
                 if (m_btMask > 0) and (m_btMask <> 255) then begin  //변신탈
                   m_nStartFrame := HA.ActHit.start + m_btDir * (HA.ActHit.frame + HA.ActHit.skip);
                   m_nEndFrame := m_nStartFrame + HA.ActHit.frame - 1;
                 end else begin
                   m_nStartFrame := HA.ActBonzeHit.start + m_btDir * (HA.ActBonzeHit.frame + HA.ActBonzeHit.skip);
                   m_nEndFrame := m_nStartFrame + HA.ActBonzeHit.frame - 1;
                 end;
                 m_dwFrameTime := 100 - (m_nHitSpeed) * 2;
                 m_dwStartTime := GetTickCount;
                 m_nMagLight := 4;
                 m_nSpellFrame := 10;
             //    m_BoHitEffect := TRUE;
                 m_boBonzeHitEff := TRUE;
                 BKillStartTime    := GetTickCount;
                 BKillCurrentFrame := 0;
                 BKillFrametime    := m_dwFrameTime;
                 if (m_nState and $00000040 <> 0) then m_nHitEffectNumber := 17
                 else
                 m_nHitEffectNumber := 16;
                 PlaySound2(MB_120);
               end;

               115{121}:begin   //은형술
                 m_dwFrameTime := HA.ActSpell.ftime;
                 m_nMagLight := 2;
                 m_nSpellFrame := 10;
                 PlaySound2(MB_121);
               end;

               116{122}:begin   //복호장 - 전사
                 m_dwFrameTime := HA.ActSpell.ftime;
                 m_nMagLight := 2;
                 m_nSpellFrame := 10;
                 PlaySound2(MB_122);
               end;
               117{123}:begin   //격공장 - 술사
                 m_dwFrameTime := HA.ActSpell.ftime;
                 m_nMagLight := 2;
                 m_nSpellFrame := 10;
                 PlaySound2(MB_123);
               end;

               119{125} : begin //직도황룡봉
                 if (m_btMask > 0) and (m_btMask <> 255) then begin  //변신탈
                   m_nStartFrame := HA.ActHit.start + m_btDir * (HA.ActHit.frame + HA.ActHit.skip);
                   m_nEndFrame := m_nStartFrame + HA.ActHit.frame - 1;
                 end else begin
                   m_nStartFrame := HA.ActBonzeHit.start + m_btDir * (HA.ActBonzeHit.frame + HA.ActBonzeHit.skip);
                   m_nEndFrame := m_nStartFrame + HA.ActBonzeHit.frame - 1;
                 end;
                 m_dwFrameTime := 85{ - (m_nHitSpeed) * 2};
                 m_dwStartTime := GetTickCount;
                 m_nMagLight := 4;
                 m_nSpellFrame := 10;
                 m_boBonzeHitEff := TRUE;
                 BCKillStartTime    := GetTickCount;
                 BCKillCurrentFrame := 0;
                 BCKillFrametime    := m_dwFrameTime;
                 m_nHitEffectNumber := 19;
                 PlaySound2(MB_125);
               end;
               120{126}: begin //천인적살풍 - 도사
                 m_dwFrameTime := 100;
                 m_nMagLight := 4;
                 m_nSpellFrame := 10;
                 PlaySound2(MB_126_1);
               end;
               121{127}: begin //비격장
                 if (m_btMask > 0) and (m_btMask <> 255) then begin  //변신탈
                    m_nStartFrame := HA.ActSpell.start + m_btDir * (HA.ActSpell.frame + HA.ActSpell.skip);
                    m_nEndFrame := m_nStartFrame + HA.ActSpell.frame -1;
                 end else begin
                   m_nStartFrame := HA.ActEnergyHit.start + m_btDir * (HA.ActEnergyHit.frame + HA.ActEnergyHit.skip);
                   m_nEndFrame := m_nStartFrame + HA.ActEnergyHit.frame - 1;
                 end;
                 m_dwFrameTime := 50;
                 m_nSpellFrame := 14;
                 PlaySound2(MB_127_1);
               end;

               122{128}: begin //파황보
                 if (m_btMask > 0) and (m_btMask <> 255) then begin  //변신탈
                    m_nStartFrame := HA.ActSpell.start + m_btDir * (HA.ActSpell.frame + HA.ActSpell.skip);
                    m_nEndFrame := m_nStartFrame + HA.ActSpell.frame -1;
                 end else begin
                   m_nStartFrame := HA.ActEnergyHit.start + m_btDir * (HA.ActEnergyHit.frame + HA.ActEnergyHit.skip);
                   m_nEndFrame := m_nStartFrame + HA.ActEnergyHit.frame - 1;
                 end;
                 m_dwFrameTime := 40;
                 m_nSpellFrame := 10;
                 PlaySound2(MB_128_1);
               end;

               123{129}: begin //강호술
                 if (m_btMask > 0) and (m_btMask <> 255) then begin  //변신탈
                    m_nStartFrame := HA.ActSpell.start + m_btDir * (HA.ActSpell.frame + HA.ActSpell.skip);
                    m_nEndFrame := m_nStartFrame + HA.ActSpell.frame -1;
                 end else begin
                   m_nStartFrame := HA.ActEnergyHit.start + m_btDir * (HA.ActEnergyHit.frame + HA.ActEnergyHit.skip);
                   m_nEndFrame := m_nStartFrame + HA.ActEnergyHit.frame - 1;
                 end;
                 m_dwFrameTime := 40;
                 m_nSpellFrame := 10;
                 PlaySound2(MB_129);
               end;

               124{130}: Begin          //마혈광섬
                  m_nStartFrame := m_btDir * (HA.ActStand.frame + HA.ActStand.skip);
                  m_nEndFrame := m_nStartFrame + HA.ActStand.frame - 4;
                  m_dwFrameTime := 20;
                  m_dwStartTime := GetTickCount;
                  m_nMagLight := 2;
                  m_nSpellFrame := 10;
                  m_dwWarModeTime := GetTickCount;
                 // PlaySound2 (as_130);
                  m_boWarMode := False;
               end;

               126{132}: Begin            //회천격
                 if (m_btJob in [5..8]) then begin  //우화등선 비연
                   if (m_btMask > 0) and (m_btMask <> 255) then begin  //변신탈
                     m_nStartFrame := HA.ActHeavyHit.start + m_btDir * (HA.ActHeavyHit.frame + HA.ActHeavyHit.skip);
                     m_nEndFrame := m_nStartFrame + HA.ActHeavyHit.frame - 1;
                   end else
                     m_nStartFrame := HA.ActHeavyHitUp.start + m_btDir * (HA.ActHeavyHitUp.frame + HA.ActHeavyHitUp.skip);
                     m_nEndFrame := m_nStartFrame + HA.ActHeavyHitUp.frame - 1;
                 end else begin
                   m_nStartFrame := HA.ActHeavyHit.start + m_btDir * (HA.ActHeavyHit.frame + HA.ActHeavyHit.skip);
                   m_nEndFrame := m_nStartFrame + HA.ActHeavyHit.frame - 1;
                 end;
                 m_dwFrameTime := 60;
                 m_dwStartTime := GetTickCount;
                 m_boWarMode := TRUE;
                 m_dwWarModeTime := GetTickCount;
                 m_nMagLight := 2;
                 m_nSpellFrame := 10;
                 PlaySound2 (as_132_1);
               end;

               128{134}: Begin  //천상폭염
                  m_boWarMode := TRUE;
                  m_dwWarModeTime := GetTickCount;
                  m_nMagLight := 3;
                  m_nSpellFrame := 10;
                  PlaySound2 (as_134_1);
               end;

               130{136}: Begin            //진골
                  m_nMagLight := 2;
                  m_nSpellFrame := 10;
                  m_boWarMode := FALSE;
                  m_dwWarModeTime := GetTickCount;
                  PlaySound2 (as_136);
               end;

               131{137}: Begin            //선천
                  m_nMagLight := 2;
                  m_nSpellFrame := 10;
                  m_boWarMode := FALSE;
                  m_dwWarModeTime := GetTickCount;
                  PlaySound2 (as_137_1);
               end;

               132{138}: Begin            //천공
                  m_boWarMode := TRUE;
                  m_dwWarModeTime := GetTickCount;
                  m_nMagLight := 3;
                  m_nSpellFrame := 10;
                  PlaySound2 (as_138_1);
                  PlaySound2 (as_138_2);
               end;
               133{139}: Begin            //용솟음
                  m_boWarMode := TRUE;
                  m_dwWarModeTime := GetTickCount;
                  m_nMagLight := 3;
                  m_nSpellFrame := 10;
                  PlaySound2 (as_139_2);
               end;

               134{140}: Begin            //수라천멸진
                  m_boWarMode := TRUE;
                  m_dwWarModeTime := GetTickCount;
                  m_nMagLight := 3;
                  m_nSpellFrame := 10;
                  PlaySound2 (as_140_1);
                  FrmMain.UseNormalEffect (NE_SURA, self.m_nCurrX, self.m_nCurrY); //마법 시젼중 움직일수 있게 하려고
               end;

               135{141}: Begin            //마혈난무
                  m_boWarMode := TRUE;
                  m_dwWarModeTime := GetTickCount;
                  m_nMagLight := 3;
                  m_nSpellFrame := 10;
                  PlaySound2 (as_141);
               end;

               else begin
                 m_nMagLight := 2;
                 m_nSpellFrame := 10;
               end;
              end;
            m_dwWaitMagicRequest := GetTickCount;
            m_boWarMode := TRUE;
            m_dwWarModeTime := GetTickCount;
            Shift (m_btDir, 0, 0, 1);
         end;
      SM_STRUCK:          //주술의막 프래임 ?
         begin
         if (m_btHorse <> 0) then begin  //호랑이
           if (m_btMask > 0) and (m_btMask <> 255) then begin  //변신탈
             m_nStartFrame := HA.ActTigerStruck.start + m_btDir * (HA.ActTigerStruck.frame + HA.ActTigerStruck.skip);
             m_nEndFrame := m_nStartFrame + HA.ActTigerStruck.frame - 1;
             m_dwFrameTime := m_dwStruckFrameTime; //HA.ActStruck.ftime;
             m_dwStartTime := GetTickCount;
             Shift (m_btDir, 0, 0, 1);

             m_dwGenAnicountTime := GetTickCount;
             m_nCurBubbleStruck := 0;
             m_nCurBubbleStruck2 := 0;
           end else begin
             if (m_btJob in [5..8]) then begin  //우화등선 호랑이 SM_STRUCK
               m_nStartFrame := HA.ActTigerStruckUp.start + m_btDir * (HA.ActTigerStruckUp.frame + HA.ActTigerStruckUp.skip);
               m_nEndFrame := m_nStartFrame + HA.ActTigerStruckUp.frame - 1;
               m_dwFrameTime := m_dwStruckFrameTime; //HA.ActStruck.ftime;
               m_dwStartTime := GetTickCount;
               Shift (m_btDir, 0, 0, 1);

               m_dwGenAnicountTime := GetTickCount;
               m_nCurBubbleStruck := 0;
               m_nCurBubbleStruck2 := 0;
             end else begin
               m_nStartFrame := HA.ActTigerStruck.start + m_btDir * (HA.ActTigerStruck.frame + HA.ActTigerStruck.skip);
               m_nEndFrame := m_nStartFrame + HA.ActTigerStruck.frame - 1;
               m_dwFrameTime := m_dwStruckFrameTime; //HA.ActStruck.ftime;
               m_dwStartTime := GetTickCount;
               Shift (m_btDir, 0, 0, 1);

               m_dwGenAnicountTime := GetTickCount;
               m_nCurBubbleStruck := 0;
               m_nCurBubbleStruck2 := 0;
             end;
           end;
         end else begin
           if (m_btMask > 0) and (m_btMask <> 255) then begin  //변신탈
              m_nStartFrame := HA.ActStruck.start + m_btDir * (HA.ActStruck.frame + HA.ActStruck.skip);
              m_nEndFrame := m_nStartFrame + HA.ActStruck.frame - 1;
              m_dwFrameTime := m_dwStruckFrameTime; //HA.ActStruck.ftime;
              m_dwStartTime := GetTickCount;
              Shift (m_btDir, 0, 0, 1);

              m_dwGenAnicountTime := GetTickCount;
              m_nCurBubbleStruck := 0;
              m_nCurBubbleStruck2 := 0;
           end else begin
            if (m_btJob in [5..8]) then begin  //우화등선  SM_STRUCK
              if m_btWeapon in [0,1,38,39,68..97,110..115] then begin
                 m_nStartFrame := HA.ActStruckUp.start + m_btDir * (HA.ActStruckUp.frame + HA.ActStruckUp.skip);
                 m_nEndFrame := m_nStartFrame + HA.ActStruckUp.frame - 1;
                 m_dwFrameTime := HA.ActStruckUp.ftime; //HA.ActStruck.ftime;
                 m_dwStartTime := GetTickCount;
                 Shift (m_btDir, 0, 0, 1);

                 m_dwGenAnicountTime := GetTickCount;
                 m_nCurBubbleStruck := 0;
                 m_nCurBubbleStruck2 := 0;
              end else begin
                if m_btWeapon in [172..179,192..197,200..205,208,209] then begin  //우화등선 비연
                  m_nStartFrame := HA.ActStruck2.start + m_btDir * (HA.ActStruck2.frame + HA.ActStruck2.skip);
                  m_nEndFrame := m_nStartFrame + HA.ActStruck2.frame - 1;
                  m_dwFrameTime := HA.ActStruck2.ftime; //HA.ActStruck.ftime;
                  m_dwStartTime := GetTickCount;
                  Shift (m_btDir, 0, 0, 1);

                  m_dwGenAnicountTime := GetTickCount;
                  m_nCurBubbleStruck := 0;
                  m_nCurBubbleStruck2 := 0;
                end else begin
                  m_nStartFrame := HA.ActStruckJobUp.start + m_btDir * (HA.ActStruckJobUp.frame + HA.ActStruckJobUp.skip);
                  m_nEndFrame := m_nStartFrame + HA.ActStruckJobUp.frame - 1;
                  m_dwFrameTime := HA.ActStruckJobUp.ftime; //HA.ActStruck.ftime;
                  m_dwStartTime := GetTickCount;
                  Shift (m_btDir, 0, 0, 1);

                  m_dwGenAnicountTime := GetTickCount;
                  m_nCurBubbleStruck := 0;
                  m_nCurBubbleStruck2 := 0;
                end;
              end;
            end else begin
               m_nStartFrame := HA.ActStruck.start + m_btDir * (HA.ActStruck.frame + HA.ActStruck.skip);
               m_nEndFrame := m_nStartFrame + HA.ActStruck.frame - 1;
               m_dwFrameTime := m_dwStruckFrameTime; //HA.ActStruck.ftime;
               m_dwStartTime := GetTickCount;
               Shift (m_btDir, 0, 0, 1);

               m_dwGenAnicountTime := GetTickCount;
               m_nCurBubbleStruck := 0;
               m_nCurBubbleStruck2 := 0;
            end;
           end;
         end;
         end;

      SM_NOWDEATH:
         begin
         if (m_btMask > 0) and (m_btMask <> 255) then begin  //변신탈
            m_nStartFrame := HA.ActDie.start + m_btDir * (HA.ActDie.frame + HA.ActDie.skip);
            m_nEndFrame := m_nStartFrame + HA.ActDie.frame - 1;
            m_dwFrameTime := HA.ActDie.ftime;
            m_dwStartTime := GetTickCount;
         end else begin
         if (m_btJob in [5..8]) then begin //우화등선 SM_NOWDEATH
          if m_btWeapon in [0,1,38,39,68..97,110..115] then begin
            m_nStartFrame := HA.ActDie.start + m_btDir * (HA.ActDie.frame + HA.ActDie.skip);
            m_nEndFrame := m_nStartFrame + HA.ActDie.frame - 1;
            m_dwFrameTime := HA.ActDie.ftime;
            m_dwStartTime := GetTickCount;
          end else
          if m_btWeapon in [172..179,192..197,200..205,208,209] then begin  //우화등선 비연
            m_nStartFrame := HA.ActDie2.start + m_btDir * (HA.ActDie2.frame + HA.ActDie2.skip);
            m_nEndFrame := m_nStartFrame + HA.ActDie2.frame - 1;
            m_dwFrameTime := HA.ActDie2.ftime;
            m_dwStartTime := GetTickCount;
          end else
            m_nStartFrame := HA.ActDieJobUp.start + m_btDir * (HA.ActDieJobUp.frame + HA.ActDieJobUp.skip);
            m_nEndFrame := m_nStartFrame + HA.ActDieJobUp.frame - 1;
            m_dwFrameTime := HA.ActDieJobUp.ftime;
            m_dwStartTime := GetTickCount;
         end else begin
            m_nStartFrame := HA.ActDie.start + m_btDir * (HA.ActDie.frame + HA.ActDie.skip);
            m_nEndFrame := m_nStartFrame + HA.ActDie.frame - 1;
            m_dwFrameTime := HA.ActDie.ftime;
            m_dwStartTime := GetTickCount;
         end;
         end;
         end;
   end;
end;

procedure THumActor.DefaultMotion;
begin
  inherited DefaultMotion;

  if (m_btEffect = 60) then begin    //흑룡신갑    DefaultMotion
    if (m_btJob in [5..8]) then begin        //우화등선
      if m_btWeapon in [98,99,146..155] then begin    //우화등선 벽혈
        m_HumWinSurface:=g_WUpWarr_EfImages.GetCachedImage (m_nHumHanOffset+ m_nCurrentFrame, m_nSpx, m_nSpy)
      end else
      if m_btWeapon in [100,101,156..163] then begin    //우화등선 홍현
        m_HumWinSurface:=g_WUpWiz_EfImages.GetCachedImage (m_nHumHanOffset+ m_nCurrentFrame, m_nSpx, m_nSpy)
      end else
      if m_btWeapon in [102,103,164..171] then begin    //우화등선 익선
        m_HumWinSurface:=g_WUpMonk_EfImages.GetCachedImage (m_nHumHanOffset+ m_nCurrentFrame, m_nSpx, m_nSpy)
      end else
      if m_btWeapon in [172..179,192..197,200..205,208,209] then begin  //우화등선 비연
        m_HumWinSurface:=g_WUpAssa_EfImages.GetCachedImage (m_nHumHanOffset+ m_nCurrentFrame, m_nSpx, m_nSpy)
      end else
        m_HumWinSurface:=g_WUpCom_EfImages.GetCachedImage (m_nHumHanOffset+ m_nCurrentFrame, m_nSpx, m_nSpy);
    end else begin
      if m_btJob = 3 then begin
        if (m_btWeapon > 179) and (m_btWeapon < 220) then begin         //자객 무기
          m_HumWinSurface:=g_WHumWing_KillerImages.GetCachedImage(m_nHumHanOffset + m_nCurrentFrame, m_nSpx, m_nSpy);
        end else
          m_HumWinSurface:=g_WHumWingImages.GetCachedImage (m_nHumHanOffset+ m_nCurrentFrame, m_nSpx, m_nSpy);
        if (m_btWeapon = 0) or (m_btWeapon = 1) then begin
          m_HumWinSurface:=g_WHumWing_KillerImages.GetCachedImage(m_nHumHanOffset + m_nCurrentFrame, m_nSpx, m_nSpy);
        end;
      end else begin
        m_HumWinSurface:=g_WHumWingImages.GetCachedImage (m_nHumHanOffset + m_nCurrentFrame, m_nSpx, m_nSpy);
      end;
    end;

    if (GetTickCount - m_HDressEffectStartTime) > m_HDressEffectFrameTime then begin
      if m_HDressEffectCurrentFrame < 9 then
         Inc(m_HDressEffectCurrentFrame)
      else begin
         m_HDressEffectCurrentFrame:=0;
      end;
      m_HDressEffectStartTime:=GetTickCount();
    end;
    m_HDressEffectSurface:=g_WHumEffectImages.GetCachedImage (m_nHumWinOffset + m_HDressEffectCurrentFrame, m_nSpx6, m_nSpy6);
  end else
  if (m_btEffect in [50]) then begin         //파황옷
    if not ((535 < m_nCurrentFrame) and (m_nCurrentFrame < 600)) then begin
      if (GetTickCount - m_dwFrameTick) > 100 then begin
        if ((m_btEffect = 50) and (m_nFrame < 38)) then
          Inc(m_nFrame)
        else begin
          if not m_bo2D0 then m_bo2D0:=True
          else m_bo2D0:=False;
          if m_bo2D0 then
            m_nFrame:=0;
        end;
        m_dwFrameTick:=GetTickCount();
      end;
      m_HumWinSurface:=g_WEffectImg.GetCachedImage (m_nHumWinOffset + m_nFrame, m_nSpx, m_nSpy);
    end else
      m_bo2D0:=False;

  end else

  if (m_btEffect <> 0) and (m_btEffect <> 60) then begin
    if m_nCurrentFrame < 64 then begin
      if (GetTickCount - m_dwFrameTick) > m_dwFrameTime then begin
        if (m_btJob in [5..8]) then begin        //우화등선
          if m_btWeapon in [0,1,38,39,68..97,110..115] then begin
            if m_nFrame < 7 then Inc(m_nFrame)
             else m_nFrame:=0;
          end else begin
            if m_nFrame < 5 then Inc(m_nFrame)
             else m_nFrame:=0;
          end;
        end else begin
          if (m_btJob in [4, 9]) then begin
            if m_nFrame < 3 then Inc(m_nFrame)
              else m_nFrame:=0;
          end else begin
            if m_nFrame < 7 then Inc(m_nFrame)
              else m_nFrame:=0;
          end;
        end;
        m_dwFrameTick:=GetTickCount();
      end;
      if (m_btHorse <> 0) then begin //호랑이 시작
        if (m_btMask > 0) and (m_btMask <> 255) then begin  //변신탈
          m_HumWinSurface:= nil;
        end else
          if (m_btJob in [4, 9]) then begin
            m_HumWinSurface:= nil;
          end else begin
            if (m_btJob in [5..8]) then begin        //우화등선
              m_HumWinSurface:=g_WUpCom_EfImages.GetCachedImage (m_nHumWinOffset+ (m_btDir * 8) + m_nFrame, m_nSpx, m_nSpy);
            end else begin
              m_HumWinSurface:=g_WHumWingImages.GetCachedImage (m_nHumWinOffset+ (m_btDir * 8) + m_nFrame, m_nSpx, m_nSpy)
            end;
          end;
      end else begin
      if (m_btMask > 0) and (m_btMask <> 255) then begin  //변신탈
         m_HumWinSurface:= nil;
      end else begin
        if (m_btJob in [5..8]) then begin        //우화등선
          if m_btWeapon in [98,99,146..155] then begin    //우화등선 벽혈
            m_HumWinSurface:=g_WUpWarr_EfImages.GetCachedImage (m_nHumWinOffset+ (m_btDir * 8) + m_nFrame, m_nSpx, m_nSpy)
          end else
          if m_btWeapon in [100,101,156..163] then begin    //우화등선 홍현
            m_HumWinSurface:=g_WUpWiz_EfImages.GetCachedImage (m_nHumWinOffset+ (m_btDir * 8) + m_nFrame, m_nSpx, m_nSpy)
          end else
          if m_btWeapon in [102,103,164..171] then begin    //우화등선 익선
            m_HumWinSurface:=g_WUpMonk_EfImages.GetCachedImage (m_nHumWinOffset+ (m_btDir * 8) + m_nFrame, m_nSpx, m_nSpy)
          end else
          if m_btWeapon in [172..179,192..197,200..205,208,209] then begin  //우화등선 비연
            m_HumWinSurface:=g_WUpAssa_EfImages.GetCachedImage (m_nHumWinOffset+ (m_btDir * 8) + m_nFrame, m_nSpx, m_nSpy)
          end else
            m_HumWinSurface:=g_WUpCom_EfImages.GetCachedImage (m_nHumWinOffset+ (m_btDir * 8) + m_nFrame, m_nSpx, m_nSpy);
        end else begin
          if (m_btJob in [4, 9]) then begin
            m_HumWinSurface:=g_WHumWing_BonzeImages.GetCachedImage (m_nHumWinOffset+ (m_btDir * 8) + m_nFrame, m_nSpx, m_nSpy);
          end else begin
            if m_btJob = 3 then begin
              if (m_btWeapon > 179) and (m_btWeapon < 220) then begin         //자객 무기
                 m_HumWinSurface:=g_WHumWing_KillerImages.GetCachedImage(m_nHumWinOffset + (m_btDir * 8) + m_nFrame, m_nSpx, m_nSpy)
              end else
                 m_HumWinSurface:=g_WHumWingImages.GetCachedImage (m_nHumWinOffset+ (m_btDir * 8) + m_nFrame, m_nSpx, m_nSpy);
              if (m_btWeapon = 0) or (m_btWeapon = 1) then begin
                 m_HumWinSurface:=g_WHumWing_KillerImages.GetCachedImage(m_nHumWinOffset + (m_btDir * 8) + m_nFrame, m_nSpx, m_nSpy)
              end;
            end else begin
               m_HumWinSurface:=g_WHumWingImages.GetCachedImage (m_nHumWinOffset+ (m_btDir * 8) + m_nFrame, m_nSpx, m_nSpy);
            end;
          end;
        end;

      end;
      end;
    end else begin

      if (m_btHorse <> 0) then begin      //호랑이
        if (m_btMask > 0) and (m_btMask <> 255) then begin  //변신탈
          m_HumWinSurface:= nil;
        end else
          if (m_btJob in [4, 9]) then begin
            m_HumWinSurface:= nil;
          end else begin
            if (m_btJob in [5..8]) then begin        //우화등선 헤어
              m_HumWinSurface:=g_WUpCom_EfImages.GetCachedImage (m_nHumWinOffset+ m_nCurrentFrame, m_nSpx, m_nSpy);
            end else begin
              m_HumWinSurface:=g_WHumWingImages.GetCachedImage (m_nHumWinOffset + m_nCurrentFrame, m_nSpx, m_nSpy)
            end;
          end;
      end else begin
      if (m_btMask > 0) and (m_btMask <> 255) then begin  //변신탈
         m_HumWinSurface:= nil;
      end else begin
        if (m_btJob in [5..8]) then begin        //우화등선 헤어
          if m_btWeapon in [98,99,146..155] then begin    //우화등선 벽혈
            m_HumWinSurface:=g_WUpWarr_EfImages.GetCachedImage (m_nHumWinOffset+ m_nCurrentFrame, m_nSpx, m_nSpy)
          end else
          if m_btWeapon in [100,101,156..163] then begin    //우화등선 홍현
            m_HumWinSurface:=g_WUpWiz_EfImages.GetCachedImage (m_nHumWinOffset+ m_nCurrentFrame, m_nSpx, m_nSpy)
          end else
          if m_btWeapon in [102,103,164..171] then begin    //우화등선 익선
            m_HumWinSurface:=g_WUpMonk_EfImages.GetCachedImage (m_nHumWinOffset+ m_nCurrentFrame, m_nSpx, m_nSpy)
          end else
          if m_btWeapon in [172..179,192..197,200..205,208,209] then begin  //우화등선 비연
            m_HumWinSurface:=g_WUpAssa_EfImages.GetCachedImage (m_nHumWinOffset+ m_nCurrentFrame, m_nSpx, m_nSpy)
          end else
            m_HumWinSurface:=g_WUpCom_EfImages.GetCachedImage (m_nHumWinOffset+ m_nCurrentFrame, m_nSpx, m_nSpy);
        end else begin
          if (m_btJob in [4, 9]) then begin
            m_HumWinSurface:=g_WHumWing_BonzeImages.GetCachedImage (m_nHumWinOffset + m_nCurrentFrame, m_nSpx, m_nSpy);
          end else begin
            if m_btJob = 3 then begin
              if (m_btWeapon > 179) and (m_btWeapon < 220) then begin    //자객 무기
                m_HumWinSurface:=g_WHumWing_KillerImages.GetCachedImage (m_nHumWinOffset + m_nCurrentFrame, m_nSpx, m_nSpy)
              end else
                m_HumWinSurface:=g_WHumWingImages.GetCachedImage (m_nHumWinOffset + m_nCurrentFrame, m_nSpx, m_nSpy);
              if (m_btWeapon = 0) or (m_btWeapon = 1) then begin
                m_HumWinSurface:=g_WHumWing_KillerImages.GetCachedImage (m_nHumWinOffset + m_nCurrentFrame, m_nSpx, m_nSpy)
              end;
            end else begin
              m_HumWinSurface:=g_WHumWingImages.GetCachedImage (m_nHumWinOffset + m_nCurrentFrame, m_nSpx, m_nSpy);
            end;
          end;
        end;
      end;
      end;
    end;
  end;




    if (m_nState and $00080000 <> 0) then begin    //낚시 중
       if (g_FishTime > g_FishTiming) then begin       //낚을 타이밍 온상타
        if (g_FishTime < 180) then begin
          if (GetTickCount - m_dwFrameTick3) > m_dwFrameTime3 then begin
            if m_nFrame3 < 5 then begin
              Inc(m_nFrame3);
            end else begin
              m_nFrame3:=0;
            end;
            m_dwFrameTick3:=GetTickCount();
            m_HumfishSurface:=g_WEffectImg.GetCachedImage (640 + m_nFrame3, m_fishx, m_fishy);     //낚시 이펙트
            m_HumfishSurface2:=g_WEffectImg.GetCachedImage (671 + m_nFrame3, m_fishdx, m_fishdy);   //낚시 이펙트
          end;
        end;
       end;
       if (GetTickCount - m_dwFrameTick3) > m_dwFrameTime3 then begin
         if m_nFrame3 < 5 then begin
          Inc(m_nFrame3);
         end else begin
          m_nFrame3:=0;
         end;
         m_dwFrameTick3:=GetTickCount();
         m_HumfishSurface:=g_WEffectImg.GetCachedImage (640 + m_nFrame3, m_fishx, m_fishy);     //낚시 이펙트
         m_HumfishSurface2:=g_WEffectImg.GetCachedImage (650 + m_nFrame3, m_fishdx, m_fishdy);  //낚시 이펙트
       end;
    end else begin
       m_HumfishSurface:= nil;
       m_HumfishSurface2:= nil;
       if m_fishbor then begin
        if (GetTickCount - m_dwFrameTick3) > m_dwFrameTime3 then begin
         if m_nFrame3 < 5 then begin
          Inc(m_nFrame3);
         end else begin
          m_nFrame3:=0;
          m_fishbor := False;
         end;
         m_dwFrameTick3:=GetTickCount();
         m_HumfishSurface2:=g_WEffectImg.GetCachedImage (671 + m_nFrame3, m_fishdx, m_fishdy);       //낚시 이펙트
        end;
       end;
    end;


  if (m_btHumEffect = 1) then begin             //레벨50 이팩트
      if (GetTickCount - m_H50LevelEffectStartTime) > m_H50LevelEffectFrameTime then begin
        if m_H50LevelEffectCurrentFrame < 11 then
           Inc(m_H50LevelEffectCurrentFrame)
        else begin
           m_H50LevelEffectCurrentFrame:=0;
           m_n50LevelHEffect := Not m_n50LevelHEffect;
        end;
        m_H50LevelEffectStartTime:=GetTickCount();
      end;
      m_H50LevelEffectSurface:=g_WEffectImg.GetCachedImage (m_H50LevelEffectOffset + m_H50LevelEffectCurrentFrame, m_nSpx2, m_nSpy2);
   end;


   if (m_btHumEffect = 2) then begin            //60레벨 이팩트 바닥
     if (GetTickCount - m_H60LevelEffectStartTime) >= m_H60LevelEffectFrameTime then begin
        m_H60LevelEffectStartTime:=GetTickCount();
        Inc(m_H60LevelEffectCurrentFrame)
      end;

      if m_H60LevelEffectCurrentFrame >= m_H60LevelEffectMaxCurrentFrame  then begin
         m_H60LevelEffectCurrentFrame := m_H60LevelEffectMaxCurrentFrame;
         m_H60LevelEffectCurrentFrame := 0;
      end;
      m_H60LevelEffectSurface:=g_WEffectImg.GetCachedImage (m_H60LevelEffectOffset + m_H60LevelEffectCurrentFrame, m_nSpx3, m_nSpy3);
   end;

   if (m_btHumEffect = 2) then begin             //60레벨 이팩트 용
      if (GetTickCount - m_H60LevelEffectStartTime2) > m_H60LevelEffectFrameTime2 then begin
        if m_H60LevelEffectCurrentFrame2 < m_H60LevelEffectMaxCurrentFrame2 then
           Inc(m_H60LevelEffectCurrentFrame2)
        else begin
           m_H60LevelEffectCurrentFrame2:=0;
           m_n60LevelHEffect2 := Not m_n60LevelHEffect2;
        end;
        m_H60LevelEffectStartTime2:=GetTickCount();
      end;
      m_H60LevelEffectSurface2:=g_WEffectImg.GetCachedImage (m_H60LevelEffectOffset2 + m_H60LevelEffectCurrentFrame2, m_nSpx4, m_nSpy4);
   end;




   if (m_btHumEffect = 3) then begin             //등선 이팩트
      if (GetTickCount - m_HumUpLevelEffectStartTime) >= m_HumUpLevelEffectFrameTime then begin
        m_HumUpLevelEffectStartTime:=GetTickCount();
        Inc(m_HumUpLevelEffectCurrentFrame)
      end;

      if m_HumUpLevelEffectCurrentFrame >= m_HumUpLevelEffectMaxCurrentFrame  then begin
         m_HumUpLevelEffectCurrentFrame := m_HumUpLevelEffectMaxCurrentFrame;
         m_HumUpLevelEffectCurrentFrame := 0;
      end;
      m_HumUpLevelEffectSurface:=g_WEffectImg.GetCachedImage (m_HumUpLevelEffectOffset + m_HumUpLevelEffectCurrentFrame, m_nSpx4, m_nSpy4);
   end;


   if (m_btHumEffect = 3) then begin             //등선 이팩트 용
      if (GetTickCount - m_HumUpLevelEffectStartTime3) > m_HumUpLevelEffectFrameTime3 then begin
        if m_HumUpLevelEffectCurrentFrame3 < m_HumUpLevelEffectMaxCurrentFrame3 then
           Inc(m_HumUpLevelEffectCurrentFrame3)
        else begin
           m_HumUpLevelEffectCurrentFrame3:=0;
           m_HumUpLevelHEffect3 := Not m_HumUpLevelHEffect3;
        end;
        m_HumUpLevelEffectStartTime3:=GetTickCount();
      end;
      m_HumUpLevelEffectSurface3:=g_WEffectImg.GetCachedImage (m_HumUpLevelEffectOffset3 + m_HumUpLevelEffectCurrentFrame3, m_nSpx5, m_nSpy5);
   end;

   if (m_btHumEffect = 4) then begin             //등선 70이팩트
      if (GetTickCount - m_HumUp70LevelEffectStartTime) >= m_HumUp70LevelEffectFrameTime then begin
        m_HumUp70LevelEffectStartTime:=GetTickCount();
        Inc(m_HumUp70LevelEffectCurrentFrame)
      end;

      if m_HumUp70LevelEffectCurrentFrame >= m_HumUp70LevelEffectMaxCurrentFrame  then begin
         m_HumUp70LevelEffectCurrentFrame := m_HumUp70LevelEffectMaxCurrentFrame;
         m_HumUp70LevelEffectCurrentFrame := 0;
      end;
      m_HumUp70LevelEffectSurface:=g_WEffectImg.GetCachedImage (m_HumUp70LevelEffectOffset + m_HumUp70LevelEffectCurrentFrame, m_nSpx4, m_nSpy4);
   end;

   if (m_btHumEffect = 4) then begin             //등선 70이팩트 용
      if (GetTickCount - m_HumUp70LevelEffectStartTime3) > m_HumUp70LevelEffectFrameTime3 then begin
        if m_HumUp70LevelEffectCurrentFrame3 < m_HumUp70LevelEffectMaxCurrentFrame3 then
           Inc(m_HumUp70LevelEffectCurrentFrame3)
        else begin
           m_HumUp70LevelEffectCurrentFrame3:=0;
           m_HumUp70LevelHEffect3 := Not m_HumUp70LevelHEffect3;
        end;
        m_HumUp70LevelEffectStartTime3:=GetTickCount();
      end;
      m_HumUp70LevelEffectSurface3:=g_WEffectImg.GetCachedImage (m_HumUp70LevelEffectOffset3 + m_HumUp70LevelEffectCurrentFrame3, m_nSpx5, m_nSpy5);
   end;


   if (m_btHumEffect = 5) then begin             //80 이팩트
      if (GetTickCount - m_Hum80LevelEffectStartTime) >= m_Hum80LevelEffectFrameTime then begin
        m_Hum80LevelEffectStartTime:=GetTickCount();
        Inc(m_Hum80LevelEffectCurrentFrame)
      end;

      if m_Hum80LevelEffectCurrentFrame >= m_Hum80LevelEffectMaxCurrentFrame  then begin
         m_Hum80LevelEffectCurrentFrame := m_Hum80LevelEffectMaxCurrentFrame;
         m_Hum80LevelEffectCurrentFrame := 0;
      end;
      m_Hum80LevelEffectSurface:= g_WAresImages.GetCachedImage (m_Hum80LevelEffectOffset + m_Hum80LevelEffectCurrentFrame, m_nSpx4, m_nSpy4);
   end;


   if (m_btEventEffect in [1..4]) then begin      //빼빼로
      if GetTickCount - FoodStickDayEffectStartTime > FoodStickDayEffectFrameTime then begin
         if FoodStickDayEffectCurrentFrame < 14 then
            Inc (FoodStickDayEffectCurrentFrame)
         else begin
            FoodStickDayEffectCurrentFrame := 0;
         end;
         FoodStickDayEffectStartTime := GetTickCount;
      end;
      FoodStickDayEffectSurface := g_WEffectImg.GetCachedImage (FoodStickDayEffectOffset + FoodStickDayEffectCurrentFrame, epx3, epy3);
      FoodStickDayEffectSurface2 := g_WEffectImg.GetCachedImage (FoodStickDayEffectOffset2 + FoodStickDayEffectCurrentFrame, epx4, epy4);
   end;

end;

function  THumActor.GetDefaultFrame (wmode: Boolean): integer;
var
   cf, dr: integer;
   pm: PTMonsterAction;
begin
   if m_boDeath then
      if (m_btMask > 0) and (m_btMask <> 255) then begin  //변신탈
          Result := HA.ActDie.start + m_btDir * (HA.ActDie.frame + HA.ActDie.skip) + (HA.ActDie.frame - 1)
      end else
      if (m_btJob in [5..8]) then begin  //우화등선 죽음
        if m_btWeapon in [0,1,38,39,68..97,110..115] then
          Result := HA.ActDie.start + m_btDir * (HA.ActDie.frame + HA.ActDie.skip) + (HA.ActDie.frame - 1)
        else
        if m_btWeapon in [172..179,192..197,200..205,208,209] then //우화등선 비연
          Result := HA.ActDie2.start + m_btDir * (HA.ActDie2.frame + HA.ActDie2.skip) + (HA.ActDie2.frame - 1)
        else
          Result := HA.ActDieJobUp.start + m_btDir * (HA.ActDieJobUp.frame + HA.ActDieJobUp.skip) + (HA.ActDieJobUp.frame - 1);
      end else
       Result := HA.ActDie.start + m_btDir * (HA.ActDie.frame + HA.ActDie.skip) + (HA.ActDie.frame - 1)
   else
   if wmode then begin
      if (m_btMask > 0) and (m_btMask <> 255) then begin  //변신탈
        Result := HA.ActWarMode.start + m_btDir * (HA.ActWarMode.frame + HA.ActWarMode.skip);
      end else
      if (m_btJob in [5..8]) then begin //우화등선
        if m_btWeapon in [0,1,38,39,68..97,110..115] then
         Result := HA.ActWarModeUp.start + m_btDir * (HA.ActWarModeUp.frame + HA.ActWarModeUp.skip)
        else
        if m_btWeapon in [172..179,192..197,200..205,208,209] then  //우화등선 비연
         Result := HA.ActWarMode2.start + m_btDir * (HA.ActWarMode2.frame + HA.ActWarMode2.skip)
        else
         Result := HA.ActWarModeJobUp.start + m_btDir * (HA.ActWarModeJobUp.frame + HA.ActWarModeJobUp.skip);
      end else
        Result := HA.ActWarMode.start + m_btDir * (HA.ActWarMode.frame + HA.ActWarMode.skip);
   end else begin
      m_nDefFrameCount := HA.ActStand.frame;
      if m_nCurrentDefFrame < 0 then cf := 0
      else if m_nCurrentDefFrame >= HA.ActStand.frame then cf := 0
      else cf := m_nCurrentDefFrame;

      if (m_nState and $00080000) <> 0 then begin //낚시 중
        if (m_btMask > 0) and (m_btMask <> 255) then begin  //변신탈
          Result := HA.ActFishing.start + m_btDir * (HA.ActFishing.frame + HA.ActFishing.skip) + cf;
        end else
        if (m_btJob in [5..8]) then begin //우화등선
          Result := HA.ActFishingUp.start + m_btDir * (HA.ActFishingUp.frame + HA.ActFishingUp.skip) + cf;
        end else
          Result := HA.ActFishing.start + m_btDir * (HA.ActFishing.frame + HA.ActFishing.skip) + cf;
      end else

      if (m_btHorse <> 0) then begin    //호랑이
        if (m_btMask > 0) and (m_btMask <> 255) then begin  //변신탈
          Result := HA.ActTigerStand.start + m_btDir * (HA.ActTigerStand.frame + HA.ActTigerStand.skip) + cf
        end else
        if (m_btJob in [5..8]) then begin  //우화등선
          Result := HA.ActTigerStandUp.start + m_btDir * (HA.ActTigerStandUp.frame + HA.ActTigerStandUp.skip) + cf
        end else
        Result := HA.ActTigerStand.start + m_btDir * (HA.ActTigerStand.frame + HA.ActTigerStand.skip) + cf
      end else

      if (m_btMask > 0) and (m_btMask <> 255) then begin  //변신탈
         Result := HA.ActStand.start + m_btDir * (HA.ActStand.frame + HA.ActStand.skip) + cf;
      end else
      if (m_btJob in [5..8]) then begin //우화등선
        if m_btWeapon in [172..179,192..197,200..205,208,209] then   //우화등선 비연
         Result := HA.ActStand2.start + m_btDir * (HA.ActStand2.frame + HA.ActStand2.skip) + cf
        else
        Result := HA.ActStand.start + m_btDir * (HA.ActStand.frame + HA.ActStand.skip) + cf ;
      end else
        Result := HA.ActStand.start + m_btDir * (HA.ActStand.frame + HA.ActStand.skip) + cf;
   end;
end;


procedure  THumActor.RunFrameAction (frame: integer);  //공격 모션
var
   meff: TMapEffect;
   event: TClEvent;
   mfly: TFlyingAxe;
   bofly: Boolean;
begin
   m_boHideWeapon := FALSE;
   if m_nCurrentAction = SM_HEAVYHIT then begin
      if (frame = 5) and (m_boDigFragment) then begin
         m_boDigFragment := FALSE;
         meff := TMapEffect.Create (8 * m_btDir, 3, m_nCurrX, m_nCurrY);
         meff.ImgLib := g_WEffectImg;
         meff.NextFrameTime := 80;
         PlaySound (s_strike_stone);
         //PlaySound (s_drop_stonepiece);
         PlayScene.m_EffectList.Add (meff);
         event := EventMan.GetEvent (m_nCurrX, m_nCurrY, ET_PILESTONES);
         if event <> nil then
            event.m_nEventParam := event.m_nEventParam + 1;
      end;
   end;
   {if m_nCurrentAction = SM_BOW then begin
      if (frame = 3) and (m_boThrow) then begin
        PlayScene.NewMagic (self, 108, 108, m_nCurrX, m_nCurrY, m_nTargetX, m_nTargetY, m_nTargetRecog, mtFly, TRUE, 30, bofly);
        m_boThrow := FALSE;
      end;
   end;     }
end;

procedure THumActor.Target;
begin
  if (g_FocusCret = nil) or g_FocusCret.m_boDeath then begin
    SendClientMessage(CM_HEROPROTECT, 0, g_nMouseCurrX, g_nMouseCurrY, 0);
  end else begin
    SendClientMessage(CM_HEROTARGET, g_FocusCret.m_nRecogId, g_FocusCret.m_nCurrX, g_FocusCret.m_nCurrY, 0);
  end;
end;

procedure THumActor.HeroTurn(X, Y: Integer; tDir: Byte);
begin
  SendClientMessage(CM_HEROTURN, tDir, X, Y, 0);
end;


procedure  THumActor.DoWeaponBreakEffect;
begin
   m_boWeaponEffect := TRUE;
   m_nCurWeaponEffect := 0;
end;

procedure  THumActor.Run;
   function MagicTimeOut: Boolean;
   begin
     if self = g_MySelf then begin
       Result := GetTickCount - m_dwWaitMagicRequest > 3000;
     end else
       Result := GetTickCount - m_dwWaitMagicRequest > 2000;
     if Result then
       m_CurMagic.ServerMagicCode := 0;
   end;
var
   prv: integer;
   m_dwFrameTimetime: longword;
   bofly: Boolean;
begin
   if GetTickCount - m_dwGenAnicountTime > 120 then begin
      m_dwGenAnicountTime := GetTickCount;
      Inc (m_nGenAniCount);
      if m_nGenAniCount > 100000 then m_nGenAniCount := 0;
      Inc (m_nCurBubbleStruck);
      Inc (m_nCurBubbleStruck2);   //선천기공
   end;
   if m_boWeaponEffect then begin
      if GetTickCount - m_dwWeaponpEffectTime > 120 then begin
         m_dwWeaponpEffectTime := GetTickCount;
         Inc (m_nCurWeaponEffect);
         if m_nCurWeaponEffect >= MAXWPEFFECTFRAME then
            m_boWeaponEffect := FALSE;
      end;
   end;

   if (m_nCurrentAction = SM_WALK) or
      (m_nCurrentAction = SM_DOWN) or
      (m_nCurrentAction = SM_BACKSTEP) or
      (m_nCurrentAction = SM_RUN) or
      (m_nCurrentAction = SM_HORSERUN) or
      (m_nCurrentAction = SM_MAGICMOVE) or
      (m_nCurrentAction = SM_SPEEDRUN) or //경신보
      (m_nCurrentAction = SM_DOWNRUN) or //경신보
      (m_nCurrentAction = SM_RUSH) or
      (m_nCurrentAction = SM_RUSHKUNG)
   then exit;

   m_boMsgMuch := FALSE;
   if self <> g_MySelf then begin
      if m_MsgList.Count >= 2 then m_boMsgMuch := TRUE;
   end;

   RunActSound (m_nCurrentFrame - m_nStartFrame);
   RunFrameAction (m_nCurrentFrame - m_nStartFrame);

   prv := m_nCurrentFrame;
   if m_nCurrentAction <> 0 then begin
      if (m_nCurrentFrame < m_nStartFrame) or (m_nCurrentFrame > m_nEndFrame) then
         m_nCurrentFrame := m_nStartFrame;

      if (self <> g_MySelf) and (m_boUseMagic) then begin
         m_dwFrameTimetime := Round(m_dwFrameTime / 1.8);
      end else begin
         if m_boMsgMuch then m_dwFrameTimetime := Round(m_dwFrameTime * 2 / 3)
         else m_dwFrameTimetime := m_dwFrameTime;
      end;

      if GetTickCount - m_dwStartTime > m_dwFrameTimetime then begin
         if m_nCurrentFrame < m_nEndFrame then begin

            if m_boUseMagic then begin
               if (m_nCurEffFrame = m_nSpellFrame-2) or (MagicTimeOut) then begin
                  if (m_CurMagic.ServerMagicCode >= 0) or (MagicTimeOut) then begin
                     Inc (m_nCurrentFrame);
                     Inc(m_nCurEffFrame);
                     m_dwStartTime := GetTickCount;
                  end;
               end else begin
                  if m_nCurrentFrame < m_nEndFrame - 1 then Inc (m_nCurrentFrame);
                  Inc (m_nCurEffFrame);
                  m_dwStartTime := GetTickCount;
               end;
            end else begin
               Inc (m_nCurrentFrame);
               m_dwStartTime := GetTickCount;
            end;

         end else begin
            if self = g_MySelf then begin
               if FrmMain.ServerAcceptNextAction then begin
                  m_nCurrentAction := 0;
                  m_boUseMagic := FALSE;
               end;
            end else begin
               m_nCurrentAction := 0;
               m_boUseMagic := FALSE;
            end;
            m_boHitEffect := FALSE;
         end;
         if m_boUseMagic then begin
            if m_nCurEffFrame = m_nSpellFrame - 1 then begin

               if m_CurMagic.ServerMagicCode > 0 then begin
                  with m_CurMagic do
                     PlayScene.NewMagic (self,
                                      ServerMagicCode,
                                      EffectNumber,
                                      m_nCurrX,
                                      m_nCurrY,
                                      TargX,
                                      TargY,
                                      Target,
                                      EffectType,
                                      Recusion,
                                      AniTime,
                                      bofly);
                  if bofly then
                     PlaySound (m_nMagicFireSound)
                  else
                     PlaySound (m_nMagicExplosionSound);
               end;
               if self = g_MySelf then
                  g_dwLatestSpellTick := GetTickCount;
               m_CurMagic.ServerMagicCode := 0;
            end;
         end;

      end;
      if m_btRace = 0 then m_nCurrentDefFrame := 0
      else m_nCurrentDefFrame := -10;
      m_dwDefFrameTime := GetTickCount;
   end else begin
      if GetTickCount - m_dwSmoothMoveTime > 200 then begin
         if GetTickCount - m_dwDefFrameTime > 500 then begin
            m_dwDefFrameTime := GetTickCount;
            Inc (m_nCurrentDefFrame);
            if m_nCurrentDefFrame >= m_nDefFrameCount then
               m_nCurrentDefFrame := 0;
         end;
         DefaultMotion;
      end;
   end;

   if prv <> m_nCurrentFrame then begin
      m_dwLoadSurfaceTime := GetTickCount;
      LoadSurface;
   end;

end;

function THumActor.Light:integer;
var
   l: integer;
begin
   l := m_nChrLight;
   if l < m_nMagLight then begin
      if m_boUseMagic or m_boHitEffect then
         l := m_nMagLight;
   end;
   Result := l;
end;

procedure  THumActor.LoadSurface;
begin
//=================바디===========================
  if (m_btHorse <> 0) then begin     //호랑이 탔을때.
    if (m_btMask > 0) and (m_btMask <> 255) then begin  //변신탈 메인
      if (m_btJob in [5..8]) then begin  //우화등선 호랑이 탔을때
        m_TigerSurface := g_WTigerUpImgImages.GetCachedImage(TIGERFRAME * (m_btHorse - 1) +  m_nCurrentFrame-600, m_nTdx, m_nTdy)
      end else begin
        m_TigerSurface:=g_WTigerImgImages.GetCachedImage(TIGERFRAME * (m_btHorse - 1) + m_nCurrentFrame-600, m_nTdx, m_nTdy);
      end;
      m_BodySurface:= g_WTransFormImages.GetCachedImage(HUMANFRAME * (m_btMask - 1) + m_nCurrentFrame, m_nPx, m_nPy);
      if m_btMask in [20, 21] then begin  //군룡포
        TransFormEffectSurface:= g_WTransFormEffectImages.GetCachedImage(HUMANFRAME * (m_btMask - 20) + m_nCurrentFrame, m_nPx2, m_nPy2);
        TransFormWeaponEffectSurface := nil;
      end else begin
        TransFormEffectSurface := nil;  TransFormWeaponEffectSurface := nil;
      end;
      if m_btMask in [7,10] then begin //신장,투신
        m_TigerSurface := nil;
      end;
    end else begin     //변신 안했고 호랑이 타있을때
      TransFormEffectSurface := nil;
      TransFormWeaponEffectSurface := nil;
      if (m_btJob in [5..8]) then begin  //우화등선 이며 호랑이 탔을때
        if m_btDress in [18,19,20,21,22,23] then
          m_BodySurface := FrmMain.GetWHum_CommonImg(m_btDress + 24,m_btSex,m_btJob,m_nCurrentFrame,m_nPx,m_nPy)
        else
          m_BodySurface := FrmMain.GetWHum_CommonImg(m_btDress,m_btSex ,m_btJob,m_nCurrentFrame, m_nPx, m_nPy);

        m_TigerSurface := g_WTigerUpImgImages.GetCachedImage(TIGERFRAME * (m_btHorse - 1) +  m_nCurrentFrame-792, m_nTdx, m_nTdy);
      end else begin   //등선 아니고 호랑이 타있을떄
        if m_btJob in [4, 9] then begin //승려 파계승   //승려 탈것
          m_BodySurface := FrmMain.GetWHumImg(m_btDress,m_btSex ,m_btJob,m_nCurrentFrame, m_nPx, m_nPy);
          m_TigerSurface := g_WHorseImgImages.GetCachedImage(TIGERFRAME * (m_btHorse - 1) + m_nCurrentFrame-600, m_nTdx, m_nTdy);
        end else begin
          if m_btDress > 31 then begin
            if m_btDress > 193 then  //자객 옷 탈것
              m_BodySurface := FrmMain.GetWHum2Img(m_btDress - 194,m_btSex ,m_btJob,m_nCurrentFrame, m_nPx, m_nPy)
            else
              m_BodySurface := FrmMain.GetWHum2Img(m_btDress - 32,m_btSex , m_btJob, m_nCurrentFrame, m_nPx, m_nPy);
          end else
            m_BodySurface := FrmMain.GetWHumImg(m_btDress,m_btSex ,m_btJob,m_nCurrentFrame, m_nPx, m_nPy);
          m_TigerSurface := g_WTigerImgImages.GetCachedImage(TIGERFRAME * (m_btHorse - 1) + m_nCurrentFrame-600, m_nTdx, m_nTdy);
        end;
      end;
    end;
  end else begin    //호랑이 안탔다면.
    if (m_btMask > 0) and (m_btMask <> 255) then begin  //변신탈 메인
      m_BodySurface:= g_WTransFormImages.GetCachedImage(HUMANFRAME * (m_btMask - 1) + m_nCurrentFrame, m_nPx, m_nPy);
      if m_btMask in [20, 21] then begin   //군룡포
        TransFormEffectSurface:= g_WTransFormEffectImages.GetCachedImage(HUMANFRAME * (m_btMask - 20) + m_nCurrentFrame, m_nPx2, m_nPy2);
        TransFormWeaponEffectSurface := nil;
        if m_btMask = 20 then
          TransFormWeaponEffectSurface :=g_WTransFormWeaponEffectImages.GetCachedImage(HUMANFRAME * (m_btMask - 20) + m_nCurrentFrame, m_nPx3, m_nPy3);
      end else begin
        TransFormEffectSurface := nil;   TransFormWeaponEffectSurface := nil;
      end;
      m_TigerSurface := nil;
    end else begin   //변신 안했다
      TransFormEffectSurface := nil;
      TransFormWeaponEffectSurface := nil;
      if (m_btJob in [5..8]) then begin        //우화등선 옷
       if m_btWeapon in [98,99,146..155] then begin    //우화등선 벽혈 옷
         if m_btDress in [18,19,20,21,22,23] then
           m_BodySurface := FrmMain.GetWHumUp_WarrImg(m_btDress - 6,m_btSex,m_btJob,m_nCurrentFrame,m_nPx,m_nPy)
         else
         if m_btDress in [8,9] then
           m_BodySurface := FrmMain.GetWHumUp_WarrImg(m_btDress - 6,m_btSex,m_btJob,m_nCurrentFrame,m_nPx,m_nPy)
         else
         if m_btDress in [16,17] then
           m_BodySurface := FrmMain.GetWHumUp_WarrImg(m_btDress - 12,m_btSex,m_btJob,m_nCurrentFrame,m_nPx,m_nPy)
         else
         if m_btDress in [24,25] then
           m_BodySurface := FrmMain.GetWHumUp_WarrImg(m_btDress - 18,m_btSex,m_btJob,m_nCurrentFrame,m_nPx,m_nPy)
         else
         if m_btDress in [32,33] then
           m_BodySurface := FrmMain.GetWHumUp_WarrImg(m_btDress - 24,m_btSex,m_btJob,m_nCurrentFrame,m_nPx,m_nPy)
         else
         if m_btDress in [40,41] then
           m_BodySurface := FrmMain.GetWHumUp_WarrImg(m_btDress - 30,m_btSex,m_btJob,m_nCurrentFrame,m_nPx,m_nPy)
         else
         {if m_btDress in [58,59] then
           m_BodySurface := FrmMain.GetWHumUp_WarrImg(m_btDress - 54,m_btSex,m_btJob,m_nCurrentFrame,m_nPx,m_nPy)
         else     }
         if m_btDress in [60,61] then
           m_BodySurface := FrmMain.GetWHumUp_WarrImg(m_btDress - 50,m_btSex,m_btJob,m_nCurrentFrame,m_nPx,m_nPy)
         else
         m_BodySurface := FrmMain.GetWHumUp_WarrImg(m_btDress,m_btSex,m_btJob,m_nCurrentFrame,m_nPx,m_nPy);
         m_TigerSurface := nil;
       end else
       if m_btWeapon in [100,101,156..163] then begin    //우화등선 홍현 옷
         if m_btDress in [18,19,20,21,22,23] then
           m_BodySurface := FrmMain.GetWHumUp_WizImg(m_btDress - 6,m_btSex,m_btJob,m_nCurrentFrame,m_nPx,m_nPy)
         else
         if m_btDress in [10,11] then
           m_BodySurface := FrmMain.GetWHumUp_WizImg(m_btDress - 8,m_btSex,m_btJob,m_nCurrentFrame,m_nPx,m_nPy)
         else
         if m_btDress in [16,17] then
           m_BodySurface := FrmMain.GetWHumUp_WizImg(m_btDress - 12,m_btSex,m_btJob,m_nCurrentFrame,m_nPx,m_nPy)
         else
         if m_btDress in [26,27] then
           m_BodySurface := FrmMain.GetWHumUp_WizImg(m_btDress - 20,m_btSex,m_btJob,m_nCurrentFrame,m_nPx,m_nPy)
         else
         if m_btDress in [34,35] then
           m_BodySurface := FrmMain.GetWHumUp_WizImg(m_btDress - 26,m_btSex,m_btJob,m_nCurrentFrame,m_nPx,m_nPy)
         else
         if m_btDress in [40,41] then
           m_BodySurface := FrmMain.GetWHumUp_WizImg(m_btDress - 30,m_btSex,m_btJob,m_nCurrentFrame,m_nPx,m_nPy)
         else
        { if m_btDress in [58,59] then
           m_BodySurface := FrmMain.GetWHumUp_WizImg(m_btDress - 54,m_btSex,m_btJob,m_nCurrentFrame,m_nPx,m_nPy)
         else  }
         if m_btDress in [60,61] then
           m_BodySurface := FrmMain.GetWHumUp_WizImg(m_btDress - 50,m_btSex,m_btJob,m_nCurrentFrame,m_nPx,m_nPy)
         else
         m_BodySurface := FrmMain.GetWHumUp_WizImg(m_btDress,m_btSex,m_btJob,m_nCurrentFrame,m_nPx,m_nPy);
         m_TigerSurface := nil;
       end else
       if m_btWeapon in [102,103,164..171] then begin    //우화등선 익선 옷
         if m_btDress in [18,19,20,21,22,23] then
           m_BodySurface := FrmMain.GetWHumUp_MonkImg(m_btDress - 6,m_btSex,m_btJob,m_nCurrentFrame,m_nPx,m_nPy)
         else
         if m_btDress in [12,13] then
           m_BodySurface := FrmMain.GetWHumUp_MonkImg(m_btDress - 10,m_btSex,m_btJob,m_nCurrentFrame,m_nPx,m_nPy)
         else
         if m_btDress in [16,17] then
           m_BodySurface := FrmMain.GetWHumUp_MonkImg(m_btDress - 12,m_btSex,m_btJob,m_nCurrentFrame,m_nPx,m_nPy)
         else
         if m_btDress in [28,29] then
           m_BodySurface := FrmMain.GetWHumUp_MonkImg(m_btDress - 22,m_btSex,m_btJob,m_nCurrentFrame,m_nPx,m_nPy)
         else
         if m_btDress in [36,37] then
           m_BodySurface := FrmMain.GetWHumUp_MonkImg(m_btDress - 28,m_btSex,m_btJob,m_nCurrentFrame,m_nPx,m_nPy)
         else
         if m_btDress in [40,41] then
           m_BodySurface := FrmMain.GetWHumUp_MonkImg(m_btDress - 30,m_btSex,m_btJob,m_nCurrentFrame,m_nPx,m_nPy)
         else
         {if m_btDress in [58,59] then
           m_BodySurface := FrmMain.GetWHumUp_MonkImg(m_btDress - 54,m_btSex,m_btJob,m_nCurrentFrame,m_nPx,m_nPy)
         else     }
         if m_btDress in [60,61] then
           m_BodySurface := FrmMain.GetWHumUp_MonkImg(m_btDress - 50,m_btSex,m_btJob,m_nCurrentFrame,m_nPx,m_nPy)
         else
         m_BodySurface := FrmMain.GetWHumUp_MonkImg(m_btDress,m_btSex,m_btJob,m_nCurrentFrame,m_nPx,m_nPy);
         m_TigerSurface := nil;
       end else
       if m_btWeapon in [172..179,192..197,200..205,208,209] then begin  //우화등선 비연 옷
         if m_btDress in [18,19,20,21,22,23] then
           m_BodySurface := FrmMain.GetWHumUp_AssassinImg(m_btDress - 6,m_btSex,m_btJob,m_nCurrentFrame,m_nPx,m_nPy)
         else
         if m_btDress in [14,15,16,17] then
           m_BodySurface := FrmMain.GetWHumUp_AssassinImg(m_btDress - 12,m_btSex,m_btJob,m_nCurrentFrame,m_nPx,m_nPy)
         else
         if m_btDress in [30,31] then
           m_BodySurface := FrmMain.GetWHumUp_AssassinImg(m_btDress - 24,m_btSex,m_btJob,m_nCurrentFrame,m_nPx,m_nPy)
         else
         if m_btDress in [38,39,40,41] then
           m_BodySurface := FrmMain.GetWHumUp_AssassinImg(m_btDress - 30,m_btSex,m_btJob,m_nCurrentFrame,m_nPx,m_nPy)
         else
         if m_btDress in [60,61] then
           m_BodySurface := FrmMain.GetWHumUp_AssassinImg(m_btDress - 50,m_btSex,m_btJob,m_nCurrentFrame,m_nPx,m_nPy)
         else
         m_BodySurface := FrmMain.GetWHumUp_AssassinImg(m_btDress,m_btSex,m_btJob,m_nCurrentFrame,m_nPx,m_nPy);
         m_TigerSurface := nil;
       end else begin //우화등선 공용옷
         if m_btDress in [18,19,20,21,22,23] then
           m_BodySurface := FrmMain.GetWHum_CommonImg(m_btDress + 24,m_btSex,m_btJob,m_nCurrentFrame,m_nPx,m_nPy)
         else
         if m_btDress in [60,61] then
           m_BodySurface := FrmMain.GetWHum_CommonImg(m_btDress - 20,m_btSex,m_btJob,m_nCurrentFrame,m_nPx,m_nPy)
         else
         m_BodySurface := FrmMain.GetWHum_CommonImg(m_btDress,m_btSex,m_btJob,m_nCurrentFrame,m_nPx,m_nPy);
         m_TigerSurface := nil;
       end;
       if m_BodySurface = nil then   //만약 등선맨몸 일때.
         m_BodySurface := FrmMain.GetWHum_CommonImg(0,m_btSex,m_btJob,m_nCurrentFrame,m_nPx,m_nPy);
      end else begin      //우화 등선이 아니면
       if m_btJob in [4, 9] then begin //승려 파계승 //승려
          m_BodySurface := FrmMain.GetWHum_BonzeImg(m_btDress, m_btSex, m_nCurrentFrame, m_nPx, m_nPy);
          m_TigerSurface := nil;
       end else begin
         if m_btJob = 3 then begin    //자객 옷
           if (m_btDress > 193) then //자객 옷 shape 값 101~ 105 그리고 2~3,4~5 포함
             m_BodySurface := FrmMain.GetWHum_Killer2Img(m_btDress - 194,m_btSex, m_btJob, m_nCurrentFrame, m_nPx, m_nPy)
           else
           if (m_btDress > 181) then //자객 옷 shape 값 140~
             m_BodySurface := FrmMain.GetWHum_Killer4Img(m_btDress - 182,m_btSex, m_btJob, m_nCurrentFrame, m_nPx, m_nPy)
           else
           if (m_btDress in [38,39,58,59,60,61]) then  //자객 감시자 ,흑룡신갑 옷
              m_BodySurface := FrmMain.GetWHum_Killer2Img(m_btDress - 32, m_btSex, m_btJob, m_nCurrentFrame, m_nPx, m_nPy)
           else
           m_BodySurface := FrmMain.GetWHum_KillerImg(m_btDress,m_btSex,m_btJob,m_nCurrentFrame,m_nPx,m_nPy);
           m_TigerSurface := nil;
           if (m_btWeapon < 180) or (m_btWeapon > 219) then begin   //자객 무기 검 아니고 일반검 이다면
             if m_btDress > 31 then begin  //자객 무기 아닐때 일반 옷
               if (m_btDress > 193) then //자객 옷 shape 값 101~ 105 그리고 2~3,4~5 포함
                 m_BodySurface := FrmMain.GetWHum2Img(m_btDress - 194,m_btSex,m_btJob ,m_nCurrentFrame, m_nPx, m_nPy)
               else
               if (m_btDress > 181) then //자객 옷 shape 값 140~
                 m_BodySurface := FrmMain.GetWHum4Img(m_btDress - 182,m_btSex, m_nCurrentFrame, m_nPx, m_nPy)
               else
               if (m_btDress in [222,223]) then //자객 옷 shape 값 101~ 105 그리고 2~3,4~5 포함
                 m_BodySurface := FrmMain.GetWHum2Img(m_btDress - 38,m_btSex,m_btJob ,m_nCurrentFrame, m_nPx, m_nPy)
               else
               m_BodySurface := FrmMain.GetWHum2Img(m_btDress - 32,m_btSex,m_btJob ,m_nCurrentFrame, m_nPx, m_nPy);
             end else   //자객 무기 아니고 일반옷 HUM1 일때.
             m_BodySurface := FrmMain.GetWHumImg(m_btDress,m_btSex,m_btJob ,m_nCurrentFrame, m_nPx, m_nPy);
             m_TigerSurface := nil;
           end;
           if (m_btWeapon = 0) or (m_btWeapon = 1) then begin   //검 착용 안했을시
             if (m_btDress > 193) then     //검 착용 안했을때 맨몸 자객 모션
               m_BodySurface := FrmMain.GetWHum_Killer2Img(m_btDress - 194,m_btSex, m_btJob, m_nCurrentFrame, m_nPx, m_nPy)
             else
             if (m_btDress > 181) then //자객 옷 shape 값 140~
               m_BodySurface := FrmMain.GetWHum_Killer4Img(m_btDress - 182,m_btSex, m_btJob, m_nCurrentFrame, m_nPx, m_nPy)
             else
             if (m_btDress in [38,39,58,59,60,61]) then //검 착용 안했을때 맨몸 자객 모션 감시자갑옷  흑룡신갑
               m_BodySurface := FrmMain.GetWHum_Killer2Img(m_btDress - 32, m_btSex, m_btJob, m_nCurrentFrame, m_nPx, m_nPy)
             else
             m_BodySurface := FrmMain.GetWHum_KillerImg(m_btDress,m_btSex,m_btJob,m_nCurrentFrame,m_nPx,m_nPy);
             m_TigerSurface := nil;
           end;;
         end else begin   //자객이 아닐때.
           if m_btDress > 31 then begin  //일반 옷
             if (m_btDress > 193) then  //자객이 아닌데 자객옷.
               m_BodySurface := FrmMain.GetWHum2Img(m_btDress - 194,m_btSex,m_btJob ,m_nCurrentFrame, m_nPx, m_nPy)
             else
             if (m_btDress > 161) then  //뉴옷
               m_BodySurface := FrmMain.GetWHum4Img(m_btDress - 162,m_btSex,m_nCurrentFrame, m_nPx, m_nPy)
             else
               m_BodySurface := FrmMain.GetWHum2Img(m_btDress - 32,m_btSex,m_btJob ,m_nCurrentFrame, m_nPx, m_nPy);
           end else
             m_BodySurface := FrmMain.GetWHumImg(m_btDress,m_btSex,m_btJob ,m_nCurrentFrame, m_nPx, m_nPy);
           m_TigerSurface := nil;
         end;   //if m_btJob = 3 then begin
       end;   //if (m_btJob in [4, 9]) then begin
       if m_BodySurface = nil then   //만약 맨몸 일때.
         m_BodySurface := FrmMain.GetWHumImg(0,m_btSex,m_btJob ,m_nCurrentFrame, m_nPx, m_nPy);
      end;
    end;
  end;

//===========================================================


//=======================무기=================================

  if (m_btHorse <> 0) then begin //호랑이 탔다면
     m_WeaponSurface:=nil;        //무기 안보임
     m_WeaponSurface2:=nil;
     FWeaponEffectSurface := nil;
     FWeaponEffectSurface_r := nil;
  end else begin
    if (m_btMask > 0) and (m_btMask <> 255) then begin  //변신탈
      m_WeaponSurface2:=nil;
      FWeaponEffectSurface := nil;
      FWeaponEffectSurface_r := nil;
      if (m_btWeapon in [94,95,96,97]) and ((m_nCurrentFrame > 919) and (m_nCurrentFrame < 1112)) then begin  //낚시
        m_WeaponSurface:=FrmMain.GetWFishingWeaponImg(m_btWeapon - 94,m_btSex,m_btJob,m_nCurrentFrame - 920, m_nWpx, m_nWpy);
      end else
        m_WeaponSurface:=nil;        //무기 안보임
    end else begin
      if (m_btJob in [5..8]) then begin //우화등선 무기
        m_WeaponSurface2:=nil;
        //FWeaponEffectSurface := nil;
        if m_btWeapon in [38,39] then begin  //곡괭이
          m_WeaponSurface:=FrmMain.GetWWeapon_CommonImg(m_btWeapon + 42,m_btSex,m_btJob,m_nCurrentFrame, m_nWpx, m_nWpy);
        end else
        if m_btWeapon in [68,69] then begin  //독고구검
          m_WeaponSurface:=FrmMain.GetWWeapon_CommonImg(m_btWeapon + 18,m_btSex,m_btJob,m_nCurrentFrame, m_nWpx, m_nWpy);
        end else
        if m_btWeapon in [70,71] then begin  //영사천신
          m_WeaponSurface:=FrmMain.GetWWeapon_CommonImg(m_btWeapon + 22,m_btSex,m_btJob,m_nCurrentFrame, m_nWpx, m_nWpy);
        end else
        if m_btWeapon in [72,73] then begin  //태극혜검
          m_WeaponSurface:=FrmMain.GetWWeapon_CommonImg(m_btWeapon + 26,m_btSex,m_btJob,m_nCurrentFrame, m_nWpx, m_nWpy);
        end else
        if m_btWeapon in [74,75] then begin  //천룡신형탈명검
          m_WeaponSurface:=FrmMain.GetWWeapon_CommonImg(m_btWeapon + 40,m_btSex,m_btJob,m_nCurrentFrame, m_nWpx, m_nWpy);
        end else
        if m_btWeapon in [78,79] then begin    //마혈검
          m_WeaponSurface:=FrmMain.GetWWeapon_CommonImg(m_btWeapon + 10,m_btSex,m_btJob,m_nCurrentFrame, m_nWpx, m_nWpy);
        end else
        if m_btWeapon in [80,81] then begin    //용혈검
          m_WeaponSurface:=FrmMain.GetWWeapon_CommonImg(m_btWeapon + 20,m_btSex,m_btJob,m_nCurrentFrame, m_nWpx, m_nWpy);
        end else
        if m_btWeapon in [82,83] then begin    //신혈창
          m_WeaponSurface:=FrmMain.GetWWeapon_CommonImg(m_btWeapon + 12,m_btSex,m_btJob,m_nCurrentFrame, m_nWpx, m_nWpy);
        end else
        if m_btWeapon in [84,85] then begin    //등선변경무기
          m_WeaponSurface:=FrmMain.GetWWeapon_CommonImg(m_btWeapon + 22,m_btSex,m_btJob,m_nCurrentFrame, m_nWpx, m_nWpy);
        end else
        if m_btWeapon in [86,87] then begin    //흑호부
          m_WeaponSurface:=FrmMain.GetWWeapon_CommonImg(m_btWeapon + 4,m_btSex,m_btJob,m_nCurrentFrame, m_nWpx, m_nWpy);
        end else
        if m_btWeapon in [88,89] then begin    //화연장
          m_WeaponSurface:=FrmMain.GetWWeapon_CommonImg(m_btWeapon + 8,m_btSex,m_btJob,m_nCurrentFrame, m_nWpx, m_nWpy);
        end else
        if m_btWeapon in [90,91] then begin    //학우선
          m_WeaponSurface:=FrmMain.GetWWeapon_CommonImg(m_btWeapon + 12,m_btSex,m_btJob,m_nCurrentFrame, m_nWpx, m_nWpy);
        end else
        if m_btWeapon in [92,93] then begin   //염옥혈검
          m_WeaponSurface:=FrmMain.GetWWeapon_CommonImg(m_btWeapon + 12,m_btSex,m_btJob,m_nCurrentFrame, m_nWpx, m_nWpy);
        end else
        if m_btWeapon in [94,95,96,97] then begin   //낚시대1
          if ((m_nCurrentFrame > 599) and (m_nCurrentFrame < 792)) then begin     //낚시
            m_WeaponSurface:=FrmMain.GetWFishingUpWeaponImg(m_btWeapon - 94,m_btSex,m_btJob,m_nCurrentFrame - 600, m_nWpx, m_nWpy)
          end else
            m_WeaponSurface:=FrmMain.GetWWeapon_CommonImg(m_btWeapon - 12,m_btSex,m_btJob,m_nCurrentFrame, m_nWpx, m_nWpy);
        end else
        if m_btWeapon in [110..115] then begin   //공용무기전사
          m_WeaponSurface:=FrmMain.GetWWeapon_CommonImg(m_btWeapon - 2,m_btSex,m_btJob,m_nCurrentFrame, m_nWpx, m_nWpy);
        end else

        if (m_btWeapon in [98,99]) then begin    //우화등선 벽혈 무기(혼수검)
          m_WeaponSurface:=FrmMain.GetWWeapon_WarrImg(m_btWeapon - 88,m_btSex,m_btJob,m_nCurrentFrame, m_nWpx, m_nWpy);
        end else
        if (m_btWeapon > 145) and (m_btWeapon < 156) then begin    //우화등선 벽혈 무기
          m_WeaponSurface:=FrmMain.GetWWeapon_WarrImg(m_btWeapon - 146,m_btSex,m_btJob,m_nCurrentFrame, m_nWpx, m_nWpy);
        end else

        if (m_btWeapon in [100,101]) then begin       //우화등선 홍현 무기(혼지검)
          m_WeaponSurface:=FrmMain.GetWWeapon_WizImg(m_btWeapon - 92,m_btSex,m_btJob,m_nCurrentFrame, m_nWpx, m_nWpy);
        end else
        if (m_btWeapon > 155) and (m_btWeapon < 164) then begin      //우화등선 홍현 무기
          m_WeaponSurface:=FrmMain.GetWWeapon_WizImg(m_btWeapon - 156,m_btSex,m_btJob,m_nCurrentFrame, m_nWpx, m_nWpy);
        end else

        if (m_btWeapon in [102,103]) then begin       //우화등선 익선 무기(혼참선)
          m_WeaponSurface:=FrmMain.GetWWeapon_MonkImg(m_btWeapon - 94,m_btSex,m_btJob,m_nCurrentFrame, m_nWpx, m_nWpy);
        end else
        if (m_btWeapon > 163) and (m_btWeapon < 172) then begin       //우화등선 익선 무기
          m_WeaponSurface:=FrmMain.GetWWeapon_MonkImg(m_btWeapon - 164,m_btSex,m_btJob,m_nCurrentFrame, m_nWpx, m_nWpy);
        end else

        if m_btWeapon in [172..179,192..197,200..205,208,209] then begin     //우화등선 비연 무기
          case m_btWeapon of
            200,201 : begin
              m_WeaponSurface:=FrmMain.GetWWeapon_Assassin_LeftImg(m_btWeapon - 192,m_btSex,m_btJob,m_nCurrentFrame, m_nWpx, m_nWpy);
              m_WeaponSurface2:=FrmMain.GetWWeapon_Assassin_RightImg(m_btWeapon - 192,m_btSex,m_btJob,m_nCurrentFrame, m_nWp2x, m_nWp2y);
            end;
            202..205 : begin
              m_WeaponSurface:=FrmMain.GetWWeapon_Assassin_LeftImg(m_btWeapon - 176,m_btSex,m_btJob,m_nCurrentFrame, m_nWpx, m_nWpy);
              m_WeaponSurface2:=FrmMain.GetWWeapon_Assassin_RightImg(m_btWeapon - 176,m_btSex,m_btJob,m_nCurrentFrame, m_nWp2x, m_nWp2y);
            end;
            208,209 : begin
              m_WeaponSurface:=FrmMain.GetWWeapon_Assassin_LeftImg(m_btWeapon - 178,m_btSex,m_btJob,m_nCurrentFrame, m_nWpx, m_nWpy);
              m_WeaponSurface2:=FrmMain.GetWWeapon_Assassin_RightImg(m_btWeapon - 178,m_btSex,m_btJob,m_nCurrentFrame, m_nWp2x, m_nWp2y);
            end;
            else begin
              m_WeaponSurface:=FrmMain.GetWWeapon_Assassin_LeftImg(m_btWeapon - 172,m_btSex,m_btJob,m_nCurrentFrame, m_nWpx, m_nWpy);
              m_WeaponSurface2:=FrmMain.GetWWeapon_Assassin_RightImg(m_btWeapon - 172,m_btSex,m_btJob,m_nCurrentFrame, m_nWp2x, m_nWp2y);
            end;
          end;
        end else begin
          if m_WeaponSurface = nil then
            m_WeaponSurface:=FrmMain.GetWWeapon_CommonImg(0,m_btSex,m_btJob,m_nCurrentFrame, m_nWpx, m_nWpy);
          m_WeaponSurface2 := nil;
        end;

        if (m_WEffect > 0) then begin
          FWeaponEffectSurface_r := nil;
          if m_WEffect = 34 then begin    //독고구검
            FWeaponEffectSurface := g_WWeapon_Effect_Common.GetCachedImage ( (HUWEAPONFRAME * (((m_WEffect + 9) * 2) + m_btSex)) + m_nCurrentFrame, wpx2, wpy2);
          end else
          if m_WEffect = 39 then begin    //마혈검
            FWeaponEffectSurface := g_WWeapon_Effect_Common.GetCachedImage ( (HUWEAPONFRAME * (((m_WEffect + 5) * 2) + m_btSex)) + m_nCurrentFrame, wpx2, wpy2);
          end else
          if m_WEffect = 43 then begin    //흑호부
            FWeaponEffectSurface := g_WWeapon_Effect_Common.GetCachedImage ( (HUWEAPONFRAME * (((m_WEffect + 2) * 2) + m_btSex)) + m_nCurrentFrame, wpx2, wpy2);
          end else
          if m_WEffect = 35 then begin    //영사천신
            FWeaponEffectSurface := g_WWeapon_Effect_Common.GetCachedImage ( (HUWEAPONFRAME * (((m_WEffect + 11) * 2) + m_btSex)) + m_nCurrentFrame, wpx2, wpy2);
          end else
          if m_WEffect in [41,45,46] then begin    //신혈창    //학우선   //염옥혈검
            FWeaponEffectSurface := g_WWeapon_Effect_Common.GetCachedImage ( (HUWEAPONFRAME * (((m_WEffect + 6) * 2) + m_btSex)) + m_nCurrentFrame, wpx2, wpy2);
          end else
          if m_WEffect = 44 then begin    //화연장
            FWeaponEffectSurface := g_WWeapon_Effect_Common.GetCachedImage ( (HUWEAPONFRAME * (((m_WEffect + 4) * 2) + m_btSex)) + m_nCurrentFrame, wpx2, wpy2);
          end else
          if m_WEffect = 36 then begin    //태극혜검
            FWeaponEffectSurface := g_WWeapon_Effect_Common.GetCachedImage ( (HUWEAPONFRAME * (((m_WEffect + 13) * 2) + m_btSex)) + m_nCurrentFrame, wpx2, wpy2);
          end else
          if m_WEffect = 40 then begin    //용혈검
            FWeaponEffectSurface := g_WWeapon_Effect_Common.GetCachedImage ( (HUWEAPONFRAME * (((m_WEffect + 10) * 2) + m_btSex)) + m_nCurrentFrame, wpx2, wpy2);
          end else
          if m_btJob = 5 then begin
            FWeaponEffectSurface := g_WWeapon_Effect_Warrior.GetCachedImage (WeaponEffectOffset + m_nCurrentFrame, wpx2, wpy2);
          end else
          if m_btJob = 6 then begin
            FWeaponEffectSurface := g_WWeapon_Effect_Wizard.GetCachedImage (WeaponEffectOffset + m_nCurrentFrame, wpx2, wpy2);
          end else
          if m_btJob = 7 then begin
            FWeaponEffectSurface := g_WWeapon_Effect_Monk.GetCachedImage (WeaponEffectOffset + m_nCurrentFrame, wpx2, wpy2);
          end else
          if m_btJob = 8 then begin
            FWeaponEffectSurface := g_WWeapon_Effect_Assassin_Left.GetCachedImage (WeaponEffectOffset + m_nCurrentFrame, wpx2, wpy2);
            FWeaponEffectSurface_r := g_WWeapon_Effect_Assassin_Right.GetCachedImage (WeaponEffectOffset + m_nCurrentFrame, wpx3, wpy3);
          end else begin
            FWeaponEffectSurface := nil;
            FWeaponEffectSurface_r := nil;
          end;
        end else begin
          FWeaponEffectSurface := nil;
          FWeaponEffectSurface_r := nil;
        end;
      end else begin     //우화등선이 아니다면
        if m_btJob in [4, 9] then begin //승려 파계승
          FWeaponEffectSurface_r := nil;
          if m_btWeapon > 1 then begin
            if (m_btWeapon in [94,95,96,97]) then begin
              if ((m_nCurrentFrame > 919) and (m_nCurrentFrame < 1112)) then begin  //낚시
                m_WeaponSurface:=FrmMain.GetWFishingWeaponImg(m_btWeapon - 94,m_btSex,m_btJob,m_nCurrentFrame - 920, m_nWpx, m_nWpy)
              end else
                m_WeaponSurface:=FrmMain.GetWWeaponImg(m_btWeapon,m_btSex,m_btJob,m_nCurrentFrame, m_nWpx, m_nWpy);
            end else begin
              m_WeaponSurface:=FrmMain.GetWWeapon_BonzeImg((m_btWeapon div 2),m_btSex,m_nCurrentFrame, m_nWpx, m_nWpy);
            end;
            m_WeaponSurface2:=nil;
          end;
          if m_WeaponSurface = nil then
            m_WeaponSurface:=FrmMain.GetWWeaponImg(0,m_btSex,m_btJob,m_nCurrentFrame, m_nWpx, m_nWpy);
          m_WeaponSurface2:=nil;
          if m_btWeapon in [28,30] then   //승려무기 이팩
            FWeaponEffectSurface := g_WWeapon_Bonze_Effect.GetCachedImage (WeaponEffectOffset + m_nCurrentFrame, wpx2, wpy2)
          else FWeaponEffectSurface := nil;

        end else begin
          if (m_btWeapon > 179) and (m_btWeapon < 220) then begin    //무기 80~ 99 까지     //자객 무기
            m_WeaponSurface:=FrmMain.GetWWeapon_Killer_LeftImg(m_btWeapon - 180,m_btSex,m_btJob,m_nCurrentFrame, m_nWpx, m_nWpy);
            m_WeaponSurface2:=FrmMain.GetWWeapon_Killer_RightImg(m_btWeapon - 180,m_btSex,m_btJob,m_nCurrentFrame, m_nWp2x, m_nWp2y);
          end else begin
            if ((m_btWeapon > 1) and (m_btWeapon < 180)) or (m_btWeapon > 219) then begin   //자객무기 아니다.
              if (m_btWeapon in [94,95,96,97]) and ((m_nCurrentFrame > 919) and (m_nCurrentFrame < 1112)) then begin  //낚시
                m_WeaponSurface:=FrmMain.GetWFishingWeaponImg(m_btWeapon - 94,m_btSex,m_btJob,m_nCurrentFrame - 920, m_nWpx, m_nWpy)
              end else
                m_WeaponSurface:=FrmMain.GetWWeaponImg(m_btWeapon,m_btSex,m_btJob,m_nCurrentFrame, m_nWpx, m_nWpy);
              m_WeaponSurface2:=nil;
            end;
            if m_WeaponSurface = nil then
              m_WeaponSurface:=FrmMain.GetWWeaponImg(0,m_btSex,m_btJob,m_nCurrentFrame, m_nWpx, m_nWpy);
            m_WeaponSurface2:=nil;
          end;
          if m_btWeapon in [76,77] then  //파관진검이팩
            FWeaponEffectSurface := g_WHumWingImages.GetCachedImage (WeaponEffectOffset + m_nCurrentFrame, wpx2, wpy2)
          else
          if m_WEffect > 0 then begin
            if m_WEffect in [93..98] then begin
              FWeaponEffectSurface := g_WWeapon_Effect_Killer_Left.GetCachedImage (WeaponEffectOffset + m_nCurrentFrame, wpx2, wpy2);
              FWeaponEffectSurface_r := g_WWeapon_Effect_Killer_Right.GetCachedImage (WeaponEffectOffset + m_nCurrentFrame, wpx3, wpy3);
            end else begin
              FWeaponEffectSurface := g_WWeapon_Effect.GetCachedImage (WeaponEffectOffset + m_nCurrentFrame, wpx2, wpy2);
              FWeaponEffectSurface_r := nil;
            end;
          end else begin
            FWeaponEffectSurface := nil;
            FWeaponEffectSurface_r := nil;
          end;
        end;
      end;
    end;
  end;
//===========================================================


//======================헤어 ================================
   if (m_btHorse <> 0) then begin    //호랑이 탔을때 헤어 부분
     if ((m_btMask > 0) and (m_btMask <> 255)) or (m_btJob in [4,9]) then begin  //변신탈
       m_HairSurface := nil;
     end else begin
       if (m_btJob in [5..8]) then begin   //우화등선 호랑이 탔을때 헤어
        if m_nHairOffset >= 0 then
          m_HairSurface := g_WHairComImgImages.GetCachedImage (m_nHairOffset + m_nCurrentFrame, m_nHpx, m_nHpy)
        else
          m_HairSurface := nil;
       end else begin
         if m_btJob in [4, 9] then begin //승려 파계승 헤어 없다.
           m_HairSurface := nil;
         end else begin
           if m_nHairOffset >= 0 then begin
            m_HairSurface := g_WHairImgImages.GetCachedImage (m_nHairOffset + m_nCurrentFrame, m_nHpx, m_nHpy)
           end else
            m_HairSurface := nil;
         end;
       end;
     end;
   end else begin //호랑이 안탔을때 헤어
     if ((m_btMask > 0) and (m_btMask <> 255)) or (m_btJob in [4,9]) then begin  //변신탈
        m_HairSurface := nil;
     end else begin
       if (m_btJob in [5..8]) then begin        //우화등선 헤어
         if m_nHairOffset >= 0 then begin
           if m_btWeapon in [98,99,146..155] then begin    //우화등선 벽혈
             m_HairSurface := g_WHair_WarriorUpImgImages.GetCachedImage (m_nHairOffset + m_nCurrentFrame, m_nHpx, m_nHpy)
           end else
           if m_btWeapon in [100,101,156..163] then begin    //우화등선 홍현
             m_HairSurface := g_WHair_WizardUpImgImages.GetCachedImage (m_nHairOffset + m_nCurrentFrame, m_nHpx, m_nHpy)
           end else
           if m_btWeapon in [102,103,164..171] then begin    //우화등선 익선
              m_HairSurface := g_WHair_MonkUpImgImages.GetCachedImage (m_nHairOffset + m_nCurrentFrame, m_nHpx, m_nHpy)
           end else
           if m_btWeapon in [172..179,192..197,200..205,208,209] then begin  //우화등선 비연
             m_HairSurface := g_WHair_AssassinImgImages.GetCachedImage (m_nHairOffset + m_nCurrentFrame, m_nHpx, m_nHpy)
           end else
             m_HairSurface := g_WHairComImgImages.GetCachedImage (m_nHairOffset + m_nCurrentFrame, m_nHpx, m_nHpy)
         end else begin
           m_HairSurface := nil;
         end;
       end else begin
         if m_btJob in [4, 9] then begin //승려 파계승 헤어 없다.
           m_HairSurface := nil;
         end else begin
           if m_btJob = 3 then begin     //자객 헤어
             if (m_btWeapon = 0) or (m_btWeapon = 1) or ((m_btWeapon > 179) and (m_btWeapon < 220)) then begin    //자객 무기
               m_HairSurface := g_WHair_KillerImgImages.GetCachedImage (m_nHairOffset + m_nCurrentFrame, m_nHpx, m_nHpy)
             end else m_HairSurface := g_WHairImgImages.GetCachedImage (m_nHairOffset + m_nCurrentFrame, m_nHpx, m_nHpy);
           end else begin
             if m_nHairOffset >= 0 then begin
               m_HairSurface := g_WHairImgImages.GetCachedImage (m_nHairOffset + m_nCurrentFrame, m_nHpx, m_nHpy)
             end else begin
               m_HairSurface := nil;
             end;
           end;
         end;
       end;
     end;
   end;
//===========================================================
//=====================이팩트==========================
  if (m_btEffect = 60) then begin    //흑룡신갑    DefaultMotion
    if (m_btJob in [5..8]) then begin        //우화등선
      if m_btWeapon in [98,99,146..155] then begin    //우화등선 벽혈
        m_HumWinSurface:=g_WUpWarr_EfImages.GetCachedImage (m_nHumHanOffset+ m_nCurrentFrame, m_nSpx, m_nSpy)
      end else
      if m_btWeapon in [100,101,156..163] then begin    //우화등선 홍현
        m_HumWinSurface:=g_WUpWiz_EfImages.GetCachedImage (m_nHumHanOffset+ m_nCurrentFrame, m_nSpx, m_nSpy)
      end else
      if m_btWeapon in [102,103,164..171] then begin    //우화등선 익선
        m_HumWinSurface:=g_WUpMonk_EfImages.GetCachedImage (m_nHumHanOffset+ m_nCurrentFrame, m_nSpx, m_nSpy)
      end else
      if m_btWeapon in [172..179,192..197,200..205,208,209] then begin  //우화등선 비연
        m_HumWinSurface:=g_WUpAssa_EfImages.GetCachedImage (m_nHumHanOffset+ m_nCurrentFrame, m_nSpx, m_nSpy)
      end else
        m_HumWinSurface:=g_WUpCom_EfImages.GetCachedImage (m_nHumHanOffset+ m_nCurrentFrame, m_nSpx, m_nSpy);
    end else begin
      if m_btJob = 3 then begin
        if (m_btWeapon > 179) and (m_btWeapon < 220) then begin         //자객 무기
          m_HumWinSurface:=g_WHumWing_KillerImages.GetCachedImage(m_nHumHanOffset + m_nCurrentFrame, m_nSpx, m_nSpy);
        end else
          m_HumWinSurface:=g_WHumWingImages.GetCachedImage (m_nHumHanOffset+ m_nCurrentFrame, m_nSpx, m_nSpy);
        if (m_btWeapon = 0) or (m_btWeapon = 1) then begin
          m_HumWinSurface:=g_WHumWing_KillerImages.GetCachedImage(m_nHumHanOffset + m_nCurrentFrame, m_nSpx, m_nSpy);
        end;
      end else begin
        m_HumWinSurface:=g_WHumWingImages.GetCachedImage (m_nHumHanOffset + m_nCurrentFrame, m_nSpx, m_nSpy);
      end;
    end;

    if (GetTickCount - m_HDressEffectStartTime) > m_HDressEffectFrameTime then begin
      if m_HDressEffectCurrentFrame < 9 then
         Inc(m_HDressEffectCurrentFrame)
      else begin
         m_HDressEffectCurrentFrame:=0;
      end;
      m_HDressEffectStartTime:=GetTickCount();
    end;
    m_HDressEffectSurface:=g_WHumEffectImages.GetCachedImage (m_nHumWinOffset + m_HDressEffectCurrentFrame, m_nSpx6, m_nSpy6);
  end else
   if (m_btEffect in [50]) then begin    //파황옷
     if not ((535 < m_nCurrentFrame) and (m_nCurrentFrame < 600)) then begin
       if (GetTickCount - m_dwFrameTick) > 150 then begin
         if ((m_btEffect = 50) and (m_nFrame < 38)) then
          Inc(m_nFrame)
         else begin
           if not m_bo2D0 then m_bo2D0:=True
           else m_bo2D0:=False;
           if m_bo2D0 then
             m_nFrame:=0;
         end;
         m_dwFrameTick:=GetTickCount();
       end;
       m_HumWinSurface:=g_WEffectImg.GetCachedImage (m_nHumWinOffset + m_nFrame, m_nSpx, m_nSpy);
     end else
       m_bo2D0:=False;
   end else

   if (m_btEffect <> 0) and (m_btEffect <> 60) then begin
      if m_nCurrentFrame < 64 then begin
        if (GetTickCount - m_dwFrameTick) > m_dwFrameTime then begin
            if (m_btJob in [5..8]) then begin        //우화등선
              if m_btWeapon in [0,1,38,39,68..97,110..115] then begin
                if m_nFrame < 7 then Inc(m_nFrame)
                 else m_nFrame:=0;
              end else begin
                if m_nFrame < 5 then Inc(m_nFrame)
                 else m_nFrame:=0;
              end;
            end else begin
              if (m_btJob in [4, 9]) then begin
                if m_nFrame < 3 then Inc(m_nFrame)
                 else m_nFrame:=0;
              end else begin
                if m_nFrame < 7 then Inc(m_nFrame)
                 else m_nFrame:=0;
              end;
            end;
          m_dwFrameTick:=GetTickCount();
        end;
        if (m_btHorse <> 0) then begin  //호랑이 탔을때
          if (m_btMask > 0) and (m_btMask <> 255) then begin  //변신탈
            m_HumWinSurface:= nil;
          end else
            if m_btJob in [4, 9] then begin    //승려, 파계승
              m_HumWinSurface:= nil;
            end else begin
              if (m_btJob in [5..8]) then begin        //우화등선 헤어
                m_HumWinSurface:=g_WUpCom_EfImages.GetCachedImage (m_nHumWinOffset+ (m_btDir * 8) + m_nFrame, m_nSpx, m_nSpy);
              end else begin
                m_HumWinSurface:=g_WHumWingImages.GetCachedImage (m_nHumWinOffset+ (m_btDir * 8) + m_nFrame, m_nSpx, m_nSpy)
              end;
            end;
        end else begin       //호랑이 안탔다면
          if (m_btMask > 0) and (m_btMask <> 255) then begin  //변신탈
             m_HumWinSurface:= nil;
          end else begin
              if (m_btJob in [5..8]) then begin        //우화등선 헤어
                if m_btWeapon in [98,99,146..155] then begin    //우화등선 벽혈
                  m_HumWinSurface:=g_WUpWarr_EfImages.GetCachedImage (m_nHumWinOffset+ (m_btDir * 8) + m_nFrame, m_nSpx, m_nSpy)
                end else
                if m_btWeapon in [100,101,156..163] then begin    //우화등선 홍현
                  m_HumWinSurface:=g_WUpWiz_EfImages.GetCachedImage (m_nHumWinOffset+ (m_btDir * 8) + m_nFrame, m_nSpx, m_nSpy)
                end else
                if m_btWeapon in [102,103,164..171] then begin    //우화등선 익선
                  m_HumWinSurface:=g_WUpMonk_EfImages.GetCachedImage (m_nHumWinOffset+ (m_btDir * 8) + m_nFrame, m_nSpx, m_nSpy)
                end else
                if m_btWeapon in [172..179,192..197,200..205,208,209] then begin  //우화등선 비연
                  m_HumWinSurface:=g_WUpAssa_EfImages.GetCachedImage (m_nHumWinOffset+ (m_btDir * 8) + m_nFrame, m_nSpx, m_nSpy)
                end else
                  m_HumWinSurface:=g_WUpCom_EfImages.GetCachedImage (m_nHumWinOffset+ (m_btDir * 8) + m_nFrame, m_nSpx, m_nSpy);
              end else begin
                if m_btJob in [4, 9] then begin    //승려 파계승
                  m_HumWinSurface:=g_WHumWing_BonzeImages.GetCachedImage (m_nHumWinOffset+ (m_btDir * 8) + m_nFrame, m_nSpx, m_nSpy);
                end else begin
                  if m_btJob = 3 then begin      //자객 옷 날개
                    if (m_btWeapon > 179) and (m_btWeapon < 220) then begin       //자객 무기
                       m_HumWinSurface:=g_WHumWing_KillerImages.GetCachedImage (m_nHumWinOffset+ (m_btDir * 8) + m_nFrame, m_nSpx, m_nSpy)
                    end else
                       m_HumWinSurface:=g_WHumWingImages.GetCachedImage (m_nHumWinOffset+ (m_btDir * 8) + m_nFrame, m_nSpx, m_nSpy);
                    if (m_btWeapon = 0) or (m_btWeapon = 1) then begin
                       m_HumWinSurface:=g_WHumWing_KillerImages.GetCachedImage (m_nHumWinOffset+ (m_btDir * 8) + m_nFrame, m_nSpx, m_nSpy)
                    end;
                  end else begin
                    m_HumWinSurface:=g_WHumWingImages.GetCachedImage (m_nHumWinOffset+ (m_btDir * 8) + m_nFrame, m_nSpx, m_nSpy);
                 end;
                end;
              end;
          end;
        end;
      end else begin

        if (m_btHorse <> 0) then begin   //호랑이
          if (m_btMask > 0) and (m_btMask <> 255) then begin  //변신탈
            m_HumWinSurface:= nil;
          end else
            if m_btJob in [4, 9] then begin  //승려 파계승
              m_HumWinSurface:= nil;
            end else begin;
              if (m_btJob in [5..8]) then begin        //우화등선 헤어
                m_HumWinSurface:=g_WUpCom_EfImages.GetCachedImage (m_nHumWinOffset+ m_nCurrentFrame, m_nSpx, m_nSpy);
              end else begin
                m_HumWinSurface:=g_WHumWingImages.GetCachedImage (m_nHumWinOffset + m_nCurrentFrame, m_nSpx, m_nSpy)
              end;
            end;
        end else begin
        if (m_btMask > 0) and (m_btMask <> 255) then begin  //변신탈
           m_HumWinSurface:= nil;
        end else begin
          if (m_btJob in [5..8]) then begin        //우화등선 헤어
            if m_btWeapon in [98,99,146..155] then begin    //우화등선 벽혈
              m_HumWinSurface:=g_WUpWarr_EfImages.GetCachedImage (m_nHumWinOffset+ m_nCurrentFrame, m_nSpx, m_nSpy)
            end else
            if m_btWeapon in [100,101,156..163] then begin    //우화등선 홍현
              m_HumWinSurface:=g_WUpWiz_EfImages.GetCachedImage (m_nHumWinOffset+ m_nCurrentFrame, m_nSpx, m_nSpy)
            end else
            if m_btWeapon in [102,103,164..171] then begin    //우화등선 익선
              m_HumWinSurface:=g_WUpMonk_EfImages.GetCachedImage (m_nHumWinOffset+ m_nCurrentFrame, m_nSpx, m_nSpy)
            end else
            if m_btWeapon in [172..179,192..197,200..205,208,209] then begin  //우화등선 비연
              m_HumWinSurface:=g_WUpAssa_EfImages.GetCachedImage (m_nHumWinOffset+ m_nCurrentFrame, m_nSpx, m_nSpy)
            end else
              m_HumWinSurface:=g_WUpCom_EfImages.GetCachedImage (m_nHumWinOffset+ m_nCurrentFrame, m_nSpx, m_nSpy);
          end else begin
            if m_btJob in [4, 9] then begin //승려 파계승
              m_HumWinSurface:=g_WHumWing_BonzeImages.GetCachedImage (m_nHumWinOffset + m_nCurrentFrame, m_nSpx, m_nSpy);
            end else begin
              if m_btJob = 3 then begin
                if (m_btWeapon > 179) and (m_btWeapon < 220) then begin   //자객 무기
                  m_HumWinSurface:=g_WHumWing_KillerImages.GetCachedImage (m_nHumWinOffset + m_nCurrentFrame, m_nSpx, m_nSpy)
                end else
                  m_HumWinSurface:=g_WHumWingImages.GetCachedImage (m_nHumWinOffset + m_nCurrentFrame, m_nSpx, m_nSpy);
                if (m_btWeapon = 0) or (m_btWeapon = 1) then begin
                  m_HumWinSurface:=g_WHumWing_KillerImages.GetCachedImage (m_nHumWinOffset + m_nCurrentFrame, m_nSpx, m_nSpy)
                end;
              end else begin
                m_HumWinSurface:=g_WHumWingImages.GetCachedImage (m_nHumWinOffset + m_nCurrentFrame, m_nSpx, m_nSpy);
              end;
            end;
          end;
        end;
        end;
      end;
   end;



   //-----------------------//낚시--------------------------
    if (m_nState and $00080000 <> 0) then begin    //낚시 중
      if (g_FishTime > g_FishTiming) then begin       //낚을 타이밍 온상타
        if (g_FishTime < 180) then begin
          if (GetTickCount - m_dwFrameTick3) > m_dwFrameTime3 then begin
            if m_nFrame3 < 5 then begin
              Inc(m_nFrame3);
            end else begin
              m_nFrame3:=0;
            end;
            m_dwFrameTick3:=GetTickCount();
            m_HumfishSurface:=g_WEffectImg.GetCachedImage (640 + m_nFrame3, m_fishx, m_fishy);     //낚시 이펙트
            m_HumfishSurface2:=g_WEffectImg.GetCachedImage (671 + m_nFrame3, m_fishdx, m_fishdy);   //낚시 이펙트
          end;
        end;
       end;
      if (GetTickCount - m_dwFrameTick3) > m_dwFrameTime3 then begin
        if m_nFrame3 < 5 then begin
          Inc(m_nFrame3);
        end else begin
          m_nFrame3:=0;
        end;
        m_dwFrameTick3:=GetTickCount();
        m_HumfishSurface:=g_WEffectImg.GetCachedImage (640 + m_nFrame3, m_fishx, m_fishy);     //낚시 이펙트
        m_HumfishSurface2:=g_WEffectImg.GetCachedImage (650 + m_nFrame3, m_fishdx, m_fishdy);   //낚시 이펙트
      end;
    end else begin
       m_HumfishSurface:= nil;
       m_HumfishSurface2:= nil;
       if m_fishbor then begin
        if (GetTickCount - m_dwFrameTick3) > m_dwFrameTime3 then begin
          if m_nFrame3 < 5 then begin
           Inc(m_nFrame3);
          end else begin
           m_nFrame3:=0;
           m_fishbor := False;
          end;
          m_dwFrameTick3:=GetTickCount();
          m_HumfishSurface2:=g_WEffectImg.GetCachedImage (671 + m_nFrame3, m_fishdx, m_fishdy);     //낚시 이펙트
        end;
       end;
     end;


   if (m_btHumEffect = 1) then begin    //레벨 50이팩트
      if (GetTickCount - m_H50LevelEffectStartTime) > m_H50LevelEffectFrameTime then begin
        if m_H50LevelEffectCurrentFrame < 11 then
           Inc (m_H50LevelEffectCurrentFrame)
        else begin
           m_H50LevelEffectCurrentFrame:=0;
           m_n50LevelHEffect := Not m_n50LevelHEffect;
        end;
        m_H50LevelEffectStartTime:=GetTickCount();
      end;
      m_H50LevelEffectSurface:=g_WEffectImg.GetCachedImage (m_H50LevelEffectOffset + m_H50LevelEffectCurrentFrame, m_nSpx2, m_nSpy2);
   end;

   if (m_btHumEffect = 2) then begin          //60레벨 이팩트 바닥
     if (GetTickCount - m_H60LevelEffectStartTime) >= m_H60LevelEffectFrameTime then begin
        m_H60LevelEffectStartTime:=GetTickCount();
        Inc(m_H60LevelEffectCurrentFrame)
      end;

      if m_H60LevelEffectCurrentFrame >= m_H60LevelEffectMaxCurrentFrame  then begin
         m_H60LevelEffectCurrentFrame := m_H60LevelEffectMaxCurrentFrame;
         m_H60LevelEffectCurrentFrame := 0;
      end;
      m_H60LevelEffectSurface:=g_WEffectImg.GetCachedImage (m_H60LevelEffectOffset + m_H60LevelEffectCurrentFrame, m_nSpx3, m_nSpy3);
   end;

   if (m_btHumEffect = 2) then begin             //60레벨 이팩트 용
      if (GetTickCount - m_H60LevelEffectStartTime2) > m_H60LevelEffectFrameTime2 then begin
        if m_H60LevelEffectCurrentFrame2 < m_H60LevelEffectMaxCurrentFrame2 then
           Inc(m_H60LevelEffectCurrentFrame2)
        else begin
           m_H60LevelEffectCurrentFrame2:=0;
           m_n60LevelHEffect2 := Not m_n60LevelHEffect2;
        end;
        m_H60LevelEffectStartTime2:=GetTickCount();
      end;
      m_H60LevelEffectSurface2:=g_WEffectImg.GetCachedImage (m_H60LevelEffectOffset2 + m_H60LevelEffectCurrentFrame2, m_nSpx4, m_nSpy4);
   end;


   if (m_btHumEffect = 3) then begin             //등선 이팩트
      if (GetTickCount - m_HumUpLevelEffectStartTime) >= m_HumUpLevelEffectFrameTime then begin
        m_HumUpLevelEffectStartTime:=GetTickCount();
       Inc(m_HumUpLevelEffectCurrentFrame)
      end;

      if m_HumUpLevelEffectCurrentFrame >= m_HumUpLevelEffectMaxCurrentFrame  then begin
         m_HumUpLevelEffectCurrentFrame := m_HumUpLevelEffectMaxCurrentFrame;
         m_HumUpLevelEffectCurrentFrame := 0;
      end;
      m_HumUpLevelEffectSurface:=g_WEffectImg.GetCachedImage (m_HumUpLevelEffectOffset + m_HumUpLevelEffectCurrentFrame, m_nSpx4, m_nSpy4);
   end;


   if (m_btHumEffect = 3) then begin             //등선 이팩트 용
      if (GetTickCount - m_HumUpLevelEffectStartTime3) > m_HumUpLevelEffectFrameTime3 then begin  
        if m_HumUpLevelEffectCurrentFrame3 < m_HumUpLevelEffectMaxCurrentFrame3 then
           Inc(m_HumUpLevelEffectCurrentFrame3)
        else begin
           m_HumUpLevelEffectCurrentFrame3:=0;
           m_HumUpLevelHEffect3 := Not m_HumUpLevelHEffect3;
        end;
        m_HumUpLevelEffectStartTime3:=GetTickCount();
      end;
      m_HumUpLevelEffectSurface3:=g_WEffectImg.GetCachedImage (m_HumUpLevelEffectOffset3 + m_HumUpLevelEffectCurrentFrame3, m_nSpx5, m_nSpy5);
   end;

   if (m_btHumEffect = 4) then begin             //등선 70이팩트
      if (GetTickCount - m_HumUp70LevelEffectStartTime) >= m_HumUp70LevelEffectFrameTime then begin
        m_HumUp70LevelEffectStartTime:=GetTickCount();
       Inc(m_HumUp70LevelEffectCurrentFrame)
      end;

      if m_HumUp70LevelEffectCurrentFrame >= m_HumUp70LevelEffectMaxCurrentFrame  then begin
         m_HumUp70LevelEffectCurrentFrame := m_HumUp70LevelEffectMaxCurrentFrame;
         m_HumUp70LevelEffectCurrentFrame := 0;
      end;
      m_HumUp70LevelEffectSurface:=g_WEffectImg.GetCachedImage (m_HumUp70LevelEffectOffset + m_HumUp70LevelEffectCurrentFrame, m_nSpx4, m_nSpy4);
   end;


   if (m_btHumEffect = 4) then begin             //등선 70이팩트 용
      if (GetTickCount - m_HumUp70LevelEffectStartTime3) > m_HumUp70LevelEffectFrameTime3 then begin
        if m_HumUp70LevelEffectCurrentFrame3 < m_HumUp70LevelEffectMaxCurrentFrame3 then
           Inc(m_HumUp70LevelEffectCurrentFrame3)
        else begin
           m_HumUp70LevelEffectCurrentFrame3:=0;
           m_HumUp70LevelHEffect3 := Not m_HumUp70LevelHEffect3;
        end;
        m_HumUp70LevelEffectStartTime3:=GetTickCount();
      end;
      m_HumUp70LevelEffectSurface3:=g_WEffectImg.GetCachedImage (m_HumUp70LevelEffectOffset3 + m_HumUp70LevelEffectCurrentFrame3, m_nSpx5, m_nSpy5);
   end;

   if (m_btHumEffect = 5) then begin             //80 이팩트
      if (GetTickCount - m_Hum80LevelEffectStartTime) >= m_Hum80LevelEffectFrameTime then begin
        m_Hum80LevelEffectStartTime:=GetTickCount();
        Inc(m_Hum80LevelEffectCurrentFrame)
      end;

      if m_Hum80LevelEffectCurrentFrame >= m_Hum80LevelEffectMaxCurrentFrame  then begin
         m_Hum80LevelEffectCurrentFrame := m_Hum80LevelEffectMaxCurrentFrame;
         m_Hum80LevelEffectCurrentFrame := 0;
      end;
      m_Hum80LevelEffectSurface:= g_WAresImages.GetCachedImage (m_Hum80LevelEffectOffset + m_Hum80LevelEffectCurrentFrame, m_nSpx4, m_nSpy4);
   end;


   if (m_btEventEffect in [1..4]) then begin   //빼빼로
      if GetTickCount - FoodStickDayEffectStartTime > FoodStickDayEffectFrameTime then begin
         if FoodStickDayEffectCurrentFrame < 14 then
            Inc (FoodStickDayEffectCurrentFrame)
         else begin
            FoodStickDayEffectCurrentFrame := 0;
         end;
         FoodStickDayEffectStartTime := GetTickCount;
      end;
      FoodStickDayEffectSurface := g_WEffectImg.GetCachedImage (FoodStickDayEffectOffset + FoodStickDayEffectCurrentFrame, epx3, epy3);
      FoodStickDayEffectSurface2 := g_WEffectImg.GetCachedImage (FoodStickDayEffectOffset2 + FoodStickDayEffectCurrentFrame, epx4, epy4);
   end;

end;

procedure  THumActor.DrawChr (dsurface: TDirectDrawSurface; dx, dy: integer; blend: Boolean;boFlag:Boolean);
var
   idx, ax, ay: integer;
   d,d1,d2,e: TDirectDrawSurface;
   ceff: TColorEffect;
   wimg: TWMImages;
   bax,bay,wilimg: integer;
   pcm: PTClientMagic;
   tx,ty:integer;
begin
   d:=nil;
   if not (m_btDir in [0..7]) then exit;
   if GetTickCount - m_dwLoadSurfaceTime > 60 * 1000 then begin
      m_dwLoadSurfaceTime := GetTickCount;
      LoadSurface; //bodysurface loadsurface
   end;

   ceff := GetDrawEffectValue;    //밝기 효과

   if m_btRace = 0 then begin

      if m_btGuildMark > 0 then begin     //문파 마크
        ShowGuildLable(dsurface);
      end;

      if (m_nCurrentFrame >= 0) and (m_nCurrentFrame <= 599) then begin
        if (m_btJob in [5..8]) then begin //우화등선 칼 보이는거
          if m_btWeapon in [98,99,146..155] then //우화등선 벽혈
            m_nWpord := WORDER2[m_btSex, m_nCurrentFrame]
          else
          if m_btWeapon in [102,103,164..171] then //우화등선 익선
            m_nWpord := WORDER3[m_btSex, m_nCurrentFrame]
          else
          if m_btWeapon in [208,209] then //우화등선 비연
            m_nWpord := WORDER5[m_btSex, m_nCurrentFrame]
          else
          m_nWpord := WORDER[m_btSex, m_nCurrentFrame];
        end else
        if m_btJob = 3 then begin
          if (m_btWeapon < 180) or (m_btWeapon > 219) then //자객 무기 검 아니고 일반검 이다면
            m_nWpord := WORDER[m_btSex, m_nCurrentFrame]
          else
          m_nWpord := WORDER4[m_btSex, m_nCurrentFrame];
        end else
        m_nWpord := WORDER[m_btSex, m_nCurrentFrame];
      end;

      if m_btEffect <> 0 then begin
        if g_MySelf = Self then begin
          if ((m_btDir = 3) or (m_btDir = 4) or (m_btDir = 5)) and
               (m_HumWinSurface <> nil) and not boFlag then begin
            if (Self <> g_MySelf) and ((m_nState and $00000200 <> 0) or (m_nState and $00000080 <> 0)) and not (frmMain.IsGroupMember(self.m_sUserName)) then begin
            end else
            if (Self <> g_MySelf) and (m_nState and $00004000 <> 0) and       //월영술 안보이게 이팩트 날게
              ((abs(self.m_nCurrX - g_MySelf.m_nCurrX) > 2) OR (abs(self.m_nCurrY - g_MySelf.m_nCurrY) > 2)) and not (frmMain.IsGroupMember(self.m_sUserName)) then begin

            end else
               DrawBlend (dsurface,
                          dx + m_nSpx + m_nShiftX,
                          dy + m_nSpy + m_nShiftY,
                          m_HumWinSurface,
                          1);
          end else begin//0x0047CED1
            if ((m_btDir = 3) or (m_btDir = 4) or (m_btDir = 5)) and
                 (m_HumWinSurface <> nil) and boFlag then begin
              if (Self <> g_MySelf) and ((m_nState and $00000200 <> 0) or (m_nState and $00000080 <> 0)) and not (frmMain.IsGroupMember(self.m_sUserName)) then begin
              end else
              if (Self <> g_MySelf) and (m_nState and $00004000 <> 0) and           //월영술 안보이게 이팩트 날게
               ((abs(self.m_nCurrX - g_MySelf.m_nCurrX) > 2) OR (abs(self.m_nCurrY - g_MySelf.m_nCurrY) > 2)) and not (frmMain.IsGroupMember(self.m_sUserName)) then begin

              end else
                 DrawBlend (dsurface,
                           dx + m_nSpx + m_nShiftX,
                           dy + m_nSpy + m_nShiftY,
                           m_HumWinSurface,
                           1);
            end;
          end;
        end else begin;//0x0047CF4D
          if ((g_FocusCret <> nil) or (g_MagicTarget <> nil)) and
             blend and ((m_btDir = 3) or (m_btDir = 4) or (m_btDir = 5)) and
             (m_HumWinSurface <> nil) and not boFlag then begin
            if (Self <> g_MySelf) and ((m_nState and $00000200 <> 0) or (m_nState and $00000080 <> 0)) and not (frmMain.IsGroupMember(self.m_sUserName)) then begin
            end else
            if (Self <> g_MySelf) and (m_nState and $00004000 <> 0) and                //월영술 안보이게 이팩트 날개
            ((abs(self.m_nCurrX - g_MySelf.m_nCurrX) > 2) OR (abs(self.m_nCurrY - g_MySelf.m_nCurrY) > 2)) and not (frmMain.IsGroupMember(self.m_sUserName)) then begin

            end else
             DrawBlend (dsurface,
                        dx + m_nSpx + m_nShiftX,
                        dy + m_nSpy + m_nShiftY,
                        m_HumWinSurface,
                        1);
          end else begin;//0x0047CFD4
            if ((m_btDir = 3) or (m_btDir = 4) or (m_btDir = 5)) and
               (m_HumWinSurface <> nil) and boFlag then begin
            if (Self <> g_MySelf) and ((m_nState and $00000200 <> 0) or (m_nState and $00000080 <> 0)) and not (frmMain.IsGroupMember(self.m_sUserName)) then begin
            end else
            if (Self <> g_MySelf) and (m_nState and $00004000 <> 0) and     //월영술 안보이게 이팩트 날개
            ((abs(self.m_nCurrX - g_MySelf.m_nCurrX) > 2) OR (abs(self.m_nCurrY - g_MySelf.m_nCurrY) > 2)) and not (frmMain.IsGroupMember(self.m_sUserName)) then begin

            end else
               DrawBlend (dsurface,
                          dx + m_nSpx + m_nShiftX,
                          dy + m_nSpy + m_nShiftY,
                          m_HumWinSurface,
                          1);
            end;//0x0047D03F
          end;
        end;
      end;//0x0047D03F

      if (m_HumfishSurface <> nil) or (m_HumfishSurface2 <> nil) then begin    //낚시 이펙트
         GetFrontPosition2 (m_nShiftX, m_nShiftY, m_btDir, tx,ty);
         if m_HumfishSurface2 <> nil then
         DrawBlend (dsurface, dx + m_fishdx + tx, dy + m_fishdx + ty, m_HumfishSurface2, 1);
         if m_HumfishSurface <> nil then
         DrawEffSurface (dsurface, m_HumfishSurface, dx + m_fishx + tx, dy + m_fishx + ty-10, blend, ceNone);
      end;

      if m_nState and $00000400 <> 0 then begin  //복호장
         idx := 200 + (m_nGenAniCount mod 8);
         d := g_WMagic_BonzeImages.GetCachedImage (idx, ax, ay);
         if d <> nil then
         if (Self <> g_MySelf) and (m_nState and $00000200 <> 0) and not (frmMain.IsGroupMember(self.m_sUserName)) then begin

         end else
            DrawBlend (dsurface,
                             dx + ax + m_nShiftX,
                             dy + ay + m_nShiftY,
                             d, 1);
      end;
      
      if (m_btHumEffect = 2) and (m_H60LevelEffectSurface <> nil) then begin    //60레벨 이팩트 바닥
         if (Self <> g_MySelf) and ((m_nState and $00000200 <> 0) or (m_nState and $00000080 <> 0)) and not (frmMain.IsGroupMember(self.m_sUserName)) then begin
         end else
         if (Self <> g_MySelf) and (m_nState and $00004000 <> 0) and     //월영술 안보이게 60 레벨 이팩
          ((abs(self.m_nCurrX - g_MySelf.m_nCurrX) > 2) OR (abs(self.m_nCurrY - g_MySelf.m_nCurrY) > 2)) and not (frmMain.IsGroupMember(self.m_sUserName)) then begin
         end else
          DrawBlend (dsurface, dx + m_nSpx3 + m_nShiftX, dy + m_nSpy3 + m_nShiftY, m_H60LevelEffectSurface, 1);   //DrawBlend3
      end;

      if (m_btHumEffect = 3)  and (m_HumUpLevelEffectSurface <> nil) then begin
         if (Self <> g_MySelf) and ((m_nState and $00000200 <> 0) or (m_nState and $00000080 <> 0)) and not (frmMain.IsGroupMember(self.m_sUserName)) then begin
         end else
         if (Self <> g_MySelf) and (m_nState and $00004000 <> 0) and           //월영술 안보이게 등선 이팩
            ((abs(self.m_nCurrX - g_MySelf.m_nCurrX) > 2) OR (abs(self.m_nCurrY - g_MySelf.m_nCurrY) > 2)) and not (frmMain.IsGroupMember(self.m_sUserName)) then begin
         end else
          DrawBlend (dsurface, dx + m_nSpx4 + m_nShiftX, dy + m_nSpy4 + m_nShiftY, m_HumUpLevelEffectSurface, 1);  //DrawBlend3
      end;

      if (m_btHumEffect = 4) and (m_HumUp70LevelEffectSurface <> nil) then begin   //등선 70이팩
         if (Self <> g_MySelf) and ((m_nState and $00000200 <> 0) or (m_nState and $00000080 <> 0)) and not (frmMain.IsGroupMember(self.m_sUserName)) then begin
         end else
         if (Self <> g_MySelf) and (m_nState and $00004000 <> 0) and                   //월영술 안보이게 70 레벨 이팩
            ((abs(self.m_nCurrX - g_MySelf.m_nCurrX) > 2) OR (abs(self.m_nCurrY - g_MySelf.m_nCurrY) > 2)) and not (frmMain.IsGroupMember(self.m_sUserName)) then begin
         end else
          DrawBlend (dsurface, dx + m_nSpx4 + m_nShiftX, dy + m_nSpy4 + m_nShiftY, m_HumUp70LevelEffectSurface, 1);  //DrawBlend3
      end;


      if m_TigerSurface <> nil then  //호랑이
         DrawEffSurface (dsurface, m_TigerSurface, dx + m_nTdx + m_nShiftX, dy + m_nTdy + m_nShiftY, blend, ceff);

      if (m_nWpord = 0) and (not blend) and (m_btWeapon >= 2) and (m_WeaponSurface <> nil) and (not m_boHideWeapon) then begin
         DrawEffSurface (dsurface, m_WeaponSurface, dx + m_nWpx + m_nShiftX, dy + m_nWpy + m_nShiftY, blend, ceNone);
         if m_WeaponSurface2 <> nil then
         DrawEffSurface (dsurface, m_WeaponSurface2, dx + m_nWp2x + m_nShiftX, dy + m_nWp2y + m_nShiftY, blend, ceNone);
         if FWeaponEffectSurface <> nil then begin
           if m_btWeapon in [76,77] then
              DrawBlend (dsurface, dx + wpx2 + m_nShiftX, dy + wpy2 + m_nShiftY, FWeaponEffectSurface, 1);
           if (m_btJob in [4, 9]) and (m_btWeapon in [30,28]) then
             DrawBlend (dsurface, dx + wpx2 + m_nShiftX, dy + wpy2 + m_nShiftY, FWeaponEffectSurface, 1);
           if m_WEffect > 0 then
             DrawBlend (dsurface, dx + wpx2 + m_nShiftX, dy + wpy2 + m_nShiftY, FWeaponEffectSurface, 1);
         end;
         if FWeaponEffectSurface_r <> nil then begin
           if m_WEffect > 0 then
             DrawBlend (dsurface, dx + wpx3 + m_nShiftX, dy + wpy3 + m_nShiftY, FWeaponEffectSurface_r, 1);
         end;
      end;

      if TransFormWeaponEffectSurface <> nil then
         DrawBlend (dsurface, dx + m_nPx3 + m_nShiftX, dy + m_nPy3 + m_nShiftY, TransFormWeaponEffectSurface, 1);

      if (m_BodySurface <> nil) and ((m_btJob <> 4) or (m_btHorse = 0) or (m_btMask <> 0)) then
         DrawEffSurface (dsurface, m_BodySurface, dx + m_nPx + m_nShiftX, dy + m_nPy + m_nShiftY, blend, ceff);

      if TransFormEffectSurface <> nil then
         DrawBlend (dsurface, dx + m_nPx2 + m_nShiftX, dy + m_nPy2 + m_nShiftY, TransFormEffectSurface, 1);

      if m_HairSurface <> nil then
         DrawEffSurface (dsurface, m_HairSurface, dx + m_nHpx + m_nShiftX, dy + m_nHpy + m_nShiftY, blend, ceff);

      if (m_nWpord = 1) and (m_btWeapon >= 2) and (m_WeaponSurface <> nil) and (not m_boHideWeapon) then begin
         DrawEffSurface (dsurface, m_WeaponSurface, dx + m_nWpx + m_nShiftX, dy + m_nWpy + m_nShiftY, blend, ceNone);
         if m_WeaponSurface2 <> nil then
         DrawEffSurface (dsurface, m_WeaponSurface2, dx + m_nWp2x + m_nShiftX, dy + m_nWp2y + m_nShiftY, blend, ceNone);
         if FWeaponEffectSurface <> nil then begin
           if m_btWeapon in [76,77] then
             DrawBlend (dsurface, dx + wpx2 + m_nShiftX, dy + wpy2 + m_nShiftY, FWeaponEffectSurface, 1);
           if (m_btJob in [4, 9]) and (m_btWeapon in [30,28]) then
             DrawBlend (dsurface, dx + wpx2 + m_nShiftX, dy + wpy2 + m_nShiftY, FWeaponEffectSurface, 1);
           if m_WEffect > 0 then
             DrawBlend (dsurface, dx + wpx2 + m_nShiftX, dy + wpy2 + m_nShiftY, FWeaponEffectSurface, 1);
         end;
         if FWeaponEffectSurface_r <> nil then begin
           if m_WEffect > 0 then
             DrawBlend (dsurface, dx + wpx3 + m_nShiftX, dy + wpy3 + m_nShiftY, FWeaponEffectSurface_r, 1);
         end;
      end;

      if (m_btHumEffect = 1)  and (m_n50LevelHEffect) and (m_H50LevelEffectSurface <> nil) then begin           //50레벨 이팩
         if (Self <> g_MySelf) and ((m_nState and $00000200 <> 0) or (m_nState and $00000080 <> 0)) and not (frmMain.IsGroupMember(self.m_sUserName)) then begin
         end else
         if (Self <> g_MySelf) and (m_nState and $00004000 <> 0) and     //월영술 안보이게 50레벨 이팩
            ((abs(self.m_nCurrX - g_MySelf.m_nCurrX) > 2) OR (abs(self.m_nCurrY - g_MySelf.m_nCurrY) > 2)) and not (frmMain.IsGroupMember(self.m_sUserName)) then begin        //월영술 안보이기
         end else
            DrawBlend (dsurface, dx + m_nSpx2 + m_nShiftX, dy + m_nSpy2 + m_nShiftY, m_H50LevelEffectSurface, 1); //DrawBlend3
      end;

      if (m_btEffect = 60) and (m_HDressEffectSurface <> nil) then begin           //흑룡신갑
         if (Self <> g_MySelf) and ((m_nState and $00000200 <> 0) or (m_nState and $00000080 <> 0)) and not (frmMain.IsGroupMember(self.m_sUserName)) then begin
         end else
         if (Self <> g_MySelf) and (m_nState and $00004000 <> 0) and     //월영술 안보이게 50레벨 이팩
            ((abs(self.m_nCurrX - g_MySelf.m_nCurrX) > 2) OR (abs(self.m_nCurrY - g_MySelf.m_nCurrY) > 2)) and not (frmMain.IsGroupMember(self.m_sUserName)) then begin        //월영술 안보이기
         end else
            DrawBlend (dsurface, dx + m_nSpx6 + m_nShiftX, dy + m_nSpy6 + m_nShiftY, m_HDressEffectSurface, 1);
      end;


      if (m_btHumEffect = 2) and (m_n60LevelHEffect2) and (not (m_btHorse <> 0)) and (m_H60LevelEffectSurface2 <> nil) then begin       //60레벨 이팩트 용
         if (Self <> g_MySelf) and ((m_nState and $00000200 <> 0) or (m_nState and $00000080 <> 0)) and not (frmMain.IsGroupMember(self.m_sUserName)) then begin
         end else
         if (Self <> g_MySelf) and (m_nState and $00004000 <> 0) and     //월영술 안보이게 60레벨 이팩
          ((abs(self.m_nCurrX - g_MySelf.m_nCurrX) > 2) OR (abs(self.m_nCurrY - g_MySelf.m_nCurrY) > 2)) and not (frmMain.IsGroupMember(self.m_sUserName)) then begin
         end else
           DrawBlend (dsurface, dx + m_nSpx4 + m_nShiftX, dy + m_nSpy4 + m_nShiftY, m_H60LevelEffectSurface2, 1);   //DrawBlend3
      end;


      if (m_btHumEffect = 3) and (m_HumUpLevelHEffect3) and (not (m_btHorse <> 0)) and (m_HumUpLevelEffectSurface3 <> nil) then begin  //등선 이팩트 용
        if (Self <> g_MySelf) and ((m_nState and $00000200 <> 0) or (m_nState and $00000080 <> 0)) and not (frmMain.IsGroupMember(self.m_sUserName)) then begin
        end else
        if (Self <> g_MySelf) and (m_nState and $00004000 <> 0) and      //월영술 안보이게 등선 이팩
          ((abs(self.m_nCurrX - g_MySelf.m_nCurrX) > 2) OR (abs(self.m_nCurrY - g_MySelf.m_nCurrY) > 2)) and not (frmMain.IsGroupMember(self.m_sUserName)) then begin
        end else
          DrawBlend (dsurface, dx + m_nSpx5 + m_nShiftX, dy + m_nSpy5 + m_nShiftY, m_HumUpLevelEffectSurface3, 1);//DrawBlend3
      end;

      if (m_btHumEffect = 4) and (m_HumUp70LevelHEffect3) and (not (m_btHorse <> 0)) and (m_HumUp70LevelEffectSurface3 <> nil) then begin  //등선 70이팩트 용
        if (Self <> g_MySelf) and ((m_nState and $00000200 <> 0) or (m_nState and $00000080 <> 0)) and not (frmMain.IsGroupMember(self.m_sUserName)) then begin
        end else
        if (Self <> g_MySelf) and (m_nState and $00004000 <> 0) and           //월영술 안보이게 70 이팩
          ((abs(self.m_nCurrX - g_MySelf.m_nCurrX) > 2) OR (abs(self.m_nCurrY - g_MySelf.m_nCurrY) > 2)) and not (frmMain.IsGroupMember(self.m_sUserName)) then begin
        end else
          DrawBlend (dsurface, dx + m_nSpx5 + m_nShiftX, dy + m_nSpy5 + m_nShiftY, m_HumUp70LevelEffectSurface3, 1);  //DrawBlend3
      end;

      if (m_btHumEffect = 5) and (m_Hum80LevelEffectSurface <> nil) then begin  //80레벨
        if (Self <> g_MySelf) and ((m_nState and $00000200 <> 0) or (m_nState and $00000080 <> 0)) and not (frmMain.IsGroupMember(self.m_sUserName)) then begin
        end else
        if (Self <> g_MySelf) and (m_nState and $00004000 <> 0) and           //월영술 안보이게 80 이팩
          ((abs(self.m_nCurrX - g_MySelf.m_nCurrX) > 2) OR (abs(self.m_nCurrY - g_MySelf.m_nCurrY) > 2)) and not (frmMain.IsGroupMember(self.m_sUserName)) then begin
        end else
          DrawBlend (dsurface, dx + m_nSpx4 + m_nShiftX, dy + m_nSpy4 + m_nShiftY, m_Hum80LevelEffectSurface, 1);   //DrawBlend3
      end;


      //---빼빼로데이 이벤트------------------------------------------------------------------------------
      if (m_btEventEffect = 1) and (not (m_btHorse <> 0)) then begin    //하트
           FoodStickDayEffectOffset  := 550;
           FoodStickDayEffectOffset2 := 530;
           BoFoodStickDayEffect := True;
           FoodStickDayEffectFrameTime := 100;
           if FoodStickDayEffectSurface <> nil then begin
              if (Self <> g_MySelf) and ((m_nState and $00000200 <> 0) or (m_nState and $00000080 <> 0)) and not (frmMain.IsGroupMember(self.m_sUserName)) then begin

              end else
              if (Self <> g_MySelf) and (m_nState and $00004000 <> 0) and           //월영술 안보이게 하트 이팩
                ((abs(self.m_nCurrX - g_MySelf.m_nCurrX) > 2) OR (abs(self.m_nCurrY - g_MySelf.m_nCurrY) > 2)) and not (frmMain.IsGroupMember(self.m_sUserName)) then begin
              end else

              DrawBlend (dsurface, dx + epx3 + m_nShiftX, dy + epy3 + m_nShiftY, FoodStickDayEffectSurface, 1);
           end;
           if FoodStickDayEffectSurface2 <> nil then begin
              if (Self <> g_MySelf) and ((m_nState and $00000200 <> 0) or (m_nState and $00000080 <> 0)) and not (frmMain.IsGroupMember(self.m_sUserName)) then begin

              end else
              if (Self <> g_MySelf) and (m_nState and $00004000 <> 0) and           //월영술 안보이게 하트 이팩
                ((abs(self.m_nCurrX - g_MySelf.m_nCurrX) > 2) OR (abs(self.m_nCurrY - g_MySelf.m_nCurrY) > 2)) and not (frmMain.IsGroupMember(self.m_sUserName)) then begin
              end else

              dsurface.Draw (dx + epx4 + m_nShiftX, dy + epy4 + m_nShiftY, FoodStickDayEffectSurface2.ClientRect, FoodStickDayEffectSurface2, TRUE);
           end;
      end;

      if (m_btEventEffect = 2) and (not (m_btHorse <> 0)) then begin       //남자
           FoodStickDayEffectOffset  := 490;
           FoodStickDayEffectOffset2 := 470;

           BoFoodStickDayEffect := True;
           FoodStickDayEffectFrameTime := 100;
           if FoodStickDayEffectSurface <> nil then begin
              if (Self <> g_MySelf) and ((m_nState and $00000200 <> 0) or (m_nState and $00000080 <> 0)) and not (frmMain.IsGroupMember(self.m_sUserName)) then begin

              end else
              if (Self <> g_MySelf) and (m_nState and $00004000 <> 0) and           //월영술 안보이게 빼빼로 이팩
                ((abs(self.m_nCurrX - g_MySelf.m_nCurrX) > 2) OR (abs(self.m_nCurrY - g_MySelf.m_nCurrY) > 2)) and not (frmMain.IsGroupMember(self.m_sUserName)) then begin
              end else

              DrawBlend (dsurface, dx + epx3 + m_nShiftX, dy + epy3 + m_nShiftY, FoodStickDayEffectSurface, 1);
           end;
           if FoodStickDayEffectSurface2 <> nil then begin
              if (Self <> g_MySelf) and ((m_nState and $00000200 <> 0) or (m_nState and $00000080 <> 0)) and not (frmMain.IsGroupMember(self.m_sUserName)) then begin

              end else
              if (Self <> g_MySelf) and (m_nState and $00004000 <> 0) and           //월영술 안보이게 빼빼로 이팩
                ((abs(self.m_nCurrX - g_MySelf.m_nCurrX) > 2) OR (abs(self.m_nCurrY - g_MySelf.m_nCurrY) > 2)) and not (frmMain.IsGroupMember(self.m_sUserName)) then begin
              end else

              dsurface.Draw (dx + epx4 + m_nShiftX, dy + epy4 + m_nShiftY, FoodStickDayEffectSurface2.ClientRect, FoodStickDayEffectSurface2, TRUE);
           end;
      end;
      if (m_btEventEffect = 3) and (not (m_btHorse <> 0)) then begin    //여자
           FoodStickDayEffectOffset  := 510;
           FoodStickDayEffectOffset2 := 470;

           BoFoodStickDayEffect := True;
           FoodStickDayEffectFrameTime := 100;
           if FoodStickDayEffectSurface <> nil then begin
              if (Self <> g_MySelf) and ((m_nState and $00000200 <> 0) or (m_nState and $00000080 <> 0)) and not (frmMain.IsGroupMember(self.m_sUserName)) then begin

              end else
              if (Self <> g_MySelf) and (m_nState and $00004000 <> 0) and           //월영술 안보이게 빼빼로 이팩
                ((abs(self.m_nCurrX - g_MySelf.m_nCurrX) > 2) OR (abs(self.m_nCurrY - g_MySelf.m_nCurrY) > 2)) and not (frmMain.IsGroupMember(self.m_sUserName)) then begin
              end else

              DrawBlend (dsurface, dx + epx3 + m_nShiftX, dy + epy3 + m_nShiftY, FoodStickDayEffectSurface, 1);
           end;
           if FoodStickDayEffectSurface2 <> nil then begin
              if (Self <> g_MySelf) and ((m_nState and $00000200 <> 0) or (m_nState and $00000080 <> 0)) and not (frmMain.IsGroupMember(self.m_sUserName)) then begin

              end else
              if (Self <> g_MySelf) and (m_nState and $00004000 <> 0) and           //월영술 안보이게 빼빼로 이팩
                ((abs(self.m_nCurrX - g_MySelf.m_nCurrX) > 2) OR (abs(self.m_nCurrY - g_MySelf.m_nCurrY) > 2)) and not (frmMain.IsGroupMember(self.m_sUserName)) then begin
              end else

              dsurface.Draw (dx + epx4 + m_nShiftX, dy + epy4 + m_nShiftY, FoodStickDayEffectSurface2.ClientRect, FoodStickDayEffectSurface2, TRUE);
           end;
      end;
      if (m_btEventEffect = 4) and (not (m_btHorse <> 0)) then begin   //호박
           FoodStickDayEffectOffset  := 440;
           FoodStickDayEffectOffset2 := 420;
           BoFoodStickDayEffect := True;
           FoodStickDayEffectFrameTime := 120;
           if FoodStickDayEffectSurface <> nil then begin
              if (Self <> g_MySelf) and ((m_nState and $00000200 <> 0) or (m_nState and $00000080 <> 0)) and not (frmMain.IsGroupMember(self.m_sUserName)) then begin

              end else
              if (Self <> g_MySelf) and (m_nState and $00004000 <> 0) and           //월영술 안보이게 호박 이팩
                ((abs(self.m_nCurrX - g_MySelf.m_nCurrX) > 2) OR (abs(self.m_nCurrY - g_MySelf.m_nCurrY) > 2)) and not (frmMain.IsGroupMember(self.m_sUserName)) then begin
              end else

              DrawBlend (dsurface, dx + epx3 + m_nShiftX, dy + epy3 + m_nShiftY, FoodStickDayEffectSurface, 1);
           end;
           if FoodStickDayEffectSurface2 <> nil then begin
              if (Self <> g_MySelf) and ((m_nState and $00000200 <> 0) or (m_nState and $00000080 <> 0)) and not (frmMain.IsGroupMember(self.m_sUserName)) then begin

              end else
              if (Self <> g_MySelf) and (m_nState and $00004000 <> 0) and           //월영술 안보이게 호박 이팩
                ((abs(self.m_nCurrX - g_MySelf.m_nCurrX) > 2) OR (abs(self.m_nCurrY - g_MySelf.m_nCurrY) > 2)) and not (frmMain.IsGroupMember(self.m_sUserName)) then begin
              end else

              dsurface.Draw (dx + epx4 + m_nShiftX, dy + epy4 + m_nShiftY, FoodStickDayEffectSurface2.ClientRect, FoodStickDayEffectSurface2, TRUE);
           end;
      end;

      if (m_btEffect = 60) then begin // 흑룡신갑
        if (m_HumWinSurface <> nil) {and m_bo2D0} then begin
         if (Self <> g_MySelf) and ((m_nState and $00000200 <> 0) or (m_nState and $00000080 <> 0)) and not (frmMain.IsGroupMember(self.m_sUserName)) then begin

         end else
         if (Self <> g_MySelf) and (m_nState and $00004000 <> 0) and    //월영술 안보이게 날개 이팩
            ((abs(self.m_nCurrX - g_MySelf.m_nCurrX) > 2) OR (abs(self.m_nCurrY - g_MySelf.m_nCurrY) > 2)) and not (frmMain.IsGroupMember(self.m_sUserName)) then begin

         end else
          DrawBlend (dsurface,
                          dx + m_nSpx + m_nShiftX,
                          dy + m_nSpy + m_nShiftY,
                          m_HumWinSurface,
                          1);
        end;
      end else
      if (m_btEffect in [50]) then begin //파황옷
        if (m_HumWinSurface <> nil) and m_bo2D0 then begin
         if (Self <> g_MySelf) and ((m_nState and $00000200 <> 0) or (m_nState and $00000080 <> 0)) and not (frmMain.IsGroupMember(self.m_sUserName)) then begin

         end else
         if (Self <> g_MySelf) and (m_nState and $00004000 <> 0) and    //월영술 안보이게 날개 이팩
            ((abs(self.m_nCurrX - g_MySelf.m_nCurrX) > 2) OR (abs(self.m_nCurrY - g_MySelf.m_nCurrY) > 2)) and not (frmMain.IsGroupMember(self.m_sUserName)) then begin

         end else
          DrawBlend (dsurface,
                          dx + m_nSpx + m_nShiftX,
                          dy + m_nSpy + m_nShiftY,
                          m_HumWinSurface,
                          1);
        end;
      end else
      if m_btEffect <> 0 then begin
        if g_MySelf = Self then begin
            if ((m_btDir = 0) or (m_btDir = 7) or (m_btDir = 1) or (m_btDir = 6)  or (m_btDir = 2)) and
               (m_HumWinSurface <> nil) and not boFlag then begin
            if (Self <> g_MySelf) and ((m_nState and $00000200 <> 0) or (m_nState and $00000080 <> 0)) and not (frmMain.IsGroupMember(self.m_sUserName)) then begin

            end else
            if (Self <> g_MySelf) and (m_nState and $00004000 <> 0) and     //월영술 안보이게 이팩
            ((abs(self.m_nCurrX - g_MySelf.m_nCurrX) > 2) OR (abs(self.m_nCurrY - g_MySelf.m_nCurrY) > 2)) and not (frmMain.IsGroupMember(self.m_sUserName)) then begin

            end else
               DrawBlend (dsurface,
                          dx + m_nSpx + m_nShiftX,
                          dy + m_nSpy + m_nShiftY,
                          m_HumWinSurface,
                          1);
            end else begin//0x0047D27F
              if ((m_btDir = 0) or (m_btDir = 7) or (m_btDir = 1) or (m_btDir = 6)  or (m_btDir = 2)) and
                 (m_HumWinSurface <> nil) and boFlag then begin
              if (Self <> g_MySelf) and ((m_nState and $00000200 <> 0) or (m_nState and $00000080 <> 0)) and not (frmMain.IsGroupMember(self.m_sUserName)) then begin

              end else
              if (Self <> g_MySelf) and (m_nState and $00004000 <> 0) and  //월영술 안보이게 이팩
               ((abs(self.m_nCurrX - g_MySelf.m_nCurrX) > 2) OR (abs(self.m_nCurrY - g_MySelf.m_nCurrY) > 2)) and not (frmMain.IsGroupMember(self.m_sUserName)) then begin

              end else
                DrawBlend (dsurface,
                          dx + m_nSpx + m_nShiftX,
                          dy + m_nSpy + m_nShiftY,
                          m_HumWinSurface,
                          1);
             end;
            end;
          //end;// gogo 0x0047D41D
        end else begin;//0x0047D30D
          if ((g_FocusCret <> nil) or (g_MagicTarget <> nil)) and
             ((m_btDir = 0) or (m_btDir = 7) or (m_btDir = 1) or (m_btDir = 6)  or (m_btDir = 2)) and
             (m_HumWinSurface <> nil) and not boFlag then begin
            if (Self <> g_MySelf) and ((m_nState and $00000200 <> 0) or (m_nState and $00000080 <> 0)) and not (frmMain.IsGroupMember(self.m_sUserName)) then begin

            end else
            if (Self <> g_MySelf) and (m_nState and $00004000 <> 0) and   //월영술 안보이게 이팩
            ((abs(self.m_nCurrX - g_MySelf.m_nCurrX) > 2) OR (abs(self.m_nCurrY - g_MySelf.m_nCurrY) > 2)) and not (frmMain.IsGroupMember(self.m_sUserName)) then begin

            end else
               DrawBlend (dsurface,
                          dx + m_nSpx + m_nShiftX,
                          dy + m_nSpy + m_nShiftY,
                          m_HumWinSurface,
                          1);
          end else begin;//0x0047D3A0
            if ((m_btDir = 0) or (m_btDir = 7) or (m_btDir = 1) or (m_btDir = 6)  or (m_btDir = 2)) and
               (m_HumWinSurface <> nil) and boFlag then begin
            if (Self <> g_MySelf) and ((m_nState and $00000200 <> 0) or (m_nState and $00000080 <> 0)) and not (frmMain.IsGroupMember(self.m_sUserName)) then begin

            end else
            if (Self <> g_MySelf) and (m_nState and $00004000 <> 0) and     //월영술 안보이게 이팩
            ((abs(self.m_nCurrX - g_MySelf.m_nCurrX) > 2) OR (abs(self.m_nCurrY - g_MySelf.m_nCurrY) > 2)) and not (frmMain.IsGroupMember(self.m_sUserName)) then begin

            end else
               DrawBlend (dsurface,
                          dx + m_nSpx + m_nShiftX,
                          dy + m_nSpy + m_nShiftY,
                          m_HumWinSurface,
                          1);
            end;//0x0047D41D
          end;
        end;
      end;//0x0047D41D


  //  end;  //m_btRace = 0  11-2-13


      if m_btMask = 29 then begin  //비광의탈
         idx := 3470 + (m_nGenAniCount mod 8);
         d := g_WMagic3Images.GetCachedImage (idx, ax, ay);
         if d <> nil then
         if (Self <> g_MySelf) and (m_nState and $00000200 <> 0) and not (frmMain.IsGroupMember(self.m_sUserName)) then begin

         end else
            DrawBlend (dsurface,
                             dx + ax + m_nShiftX,
                             dy + ay + m_nShiftY,
                             d, 1);
      end;

      if m_nState and $00010000 <> 0 then begin  //심연술
         idx := ABYSSBASE + (m_nGenAniCount mod 2);
         d := g_WMagic3Images.GetCachedImage (idx, ax, ay);
         if d <> nil then
         if (Self <> g_MySelf) and (m_nState and $00000200 <> 0) and not (frmMain.IsGroupMember(self.m_sUserName)) then begin

         end else
            DrawBlend (dsurface,
                             dx + ax + m_nShiftX,
                             dy + ay + m_nShiftY,
                             d, 1);
      end;
      if m_nState and $00002000 <> 0 then begin  //혈룡검법
         idx := BLOODSWORD + (m_nGenAniCount mod 2);
         d := g_WMagic3Images.GetCachedImage (idx, ax, ay);
         if d <> nil then
         if (Self <> g_MySelf) and (m_nState and $00000200 <> 0) and not (frmMain.IsGroupMember(self.m_sUserName)) then begin

         end else
            DrawBlend (dsurface,
                             dx + ax + m_nShiftX,
                             dy + ay + m_nShiftY,
                             d, 1);
      end;
      if m_nState and $00040000 <> 0 then begin  //천상비술
         idx := SKYSWORD + (m_nGenAniCount mod 2);
         d := g_WMagic3Images.GetCachedImage (idx, ax, ay);
         if d <> nil then
         if (Self <> g_MySelf) and (m_nState and $00000200 <> 0) and not (frmMain.IsGroupMember(self.m_sUserName)) then begin

         end else
            DrawBlend (dsurface,
                             dx + ax + m_nShiftX,
                             dy + ay + m_nShiftY,
                             d, 1);
      end;

      if m_nState and $01000000 <> 0 then begin  //선천기공
         if (m_nCurrentAction = SM_STRUCK) and (m_nCurBubbleStruck2 < 3) then
            idx := CELESTIALSTRUCKBASE + m_nCurBubbleStruck2
         else
            idx := CELESTIALBASE + (m_nGenAniCount mod 3);
         d := g_WMagic2Images.GetCachedImage (idx, ax, ay);
         if d <> nil then
         if (Self <> g_MySelf) and ((m_nState and $00000200 <> 0) or (m_nState and $00000080 <> 0)) and not (frmMain.IsGroupMember(self.m_sUserName)) then begin

         end else
         if (Self <> g_MySelf) and (m_nState and $00004000 <> 0) and    //월영술 안보이게 기공 이팩
         ((abs(self.m_nCurrX - g_MySelf.m_nCurrX) > 2) OR (abs(self.m_nCurrY - g_MySelf.m_nCurrY) > 2)) and not (frmMain.IsGroupMember(self.m_sUserName)) then begin

         end else
            DrawBlend (dsurface,
                             dx + ax + m_nShiftX,
                             dy + ay + m_nShiftY,
                             d, 1);
      end;
      if m_nState and $00100000 <> 0 then begin  //주술의막
         if m_nState and $00000040 <> 0 then begin  //주술의막 강화
           if (m_nCurrentAction = SM_STRUCK) and (m_nCurBubbleStruck < 3) then idx := MAGBUBBLESTRUCKBASEUP + m_nCurBubbleStruck
            else idx := MAGBUBBLEBASEUP + (m_nGenAniCount mod 3);
           d := g_WMagicUpImages.GetCachedImage (idx, ax, ay);
         end else begin
           if (m_nCurrentAction = SM_STRUCK) and (m_nCurBubbleStruck < 3) then idx := MAGBUBBLESTRUCKBASE + m_nCurBubbleStruck
            else  idx := MAGBUBBLEBASE + (m_nGenAniCount mod 3);
           d := g_WMagicImages.GetCachedImage (idx, ax, ay);
         end;
         if d <> nil then
         if (Self <> g_MySelf) and (m_nState and $00000200 <> 0) and not (frmMain.IsGroupMember(self.m_sUserName)) then begin

         end else
            DrawBlend (dsurface,
                             dx + ax + m_nShiftX,
                             dy + ay + m_nShiftY,
                             d, 1);
      end;
      if m_nState and $00000100 <> 0 then begin  //금강불괴
         idx := KUMGANG + (m_nGenAniCount mod 2);
         d := g_WMagic3Images.GetCachedImage (idx, ax, ay);
         if d <> nil then
         if (Self <> g_MySelf) and (m_nState and $00000200 <> 0) and not (frmMain.IsGroupMember(self.m_sUserName)) then begin

         end else
            DrawBlend (dsurface,
                             dx + ax + m_nShiftX,
                             dy + ay + m_nShiftY,
                             d, 1);
      end;

      if m_nState and $00001000 <> 0 then begin  //호신강기
         idx := PROTECTSHAILD + (m_nGenAniCount mod 5);
         d := g_WMagic_BonzeImages.GetCachedImage (idx, ax, ay);
         if d <> nil then
         if (Self <> g_MySelf) and (m_nState and $00000200 <> 0) and not (frmMain.IsGroupMember(self.m_sUserName)) then begin

         end else
            DrawBlend (dsurface,
                             dx + ax + m_nShiftX,
                             dy + ay + m_nShiftY,
                             d, 1);
      end;

   end;   //m_btRace = 0  11-2-13

   //좌표  무공

   if m_boHitEffect and (m_nHitEffectNumber = 8) then begin
   end else begin
   if m_boHitEffect and (m_nHitEffectNumber = 12) then begin
   end else begin
   if m_boUseMagic  and (m_CurMagic.EffectNumber > 0) then begin
    if m_nCurEffFrame in [0..m_nSpellFrame-1] then begin
     if (m_nState and $00000040 <> 0) and (m_curmagic.effectnumber in [20,29,65]) then
       GetUpEffectBase (m_CurMagic.EffectNumber-1, 0, wimg, idx)
     else
     if (m_nState and $00000020 <> 0) and (m_curmagic.effectnumber in [50,51,52,53,55,57,68]) then
       GetUpEffectBase (m_CurMagic.EffectNumber-1, 0, wimg, idx)
     else GetEffectBase (m_CurMagic.EffectNumber-1, 0, wimg, idx);

      if (m_curmagic.effectnumber in [57,59,60,66,68,76,77,80,110,126]) then begin     //빙염, 체신, 천이, 맹독 , 월하 ,빙뇌천 ,태극진, 독침술
          wilimg:=20;
        if (m_curmagic.effectnumber in [57,59,60,66,76,110,126]) then         //법륜연공  //회천격
          wilimg:=10;
        idx := idx + (m_btDir * wilimg);
      end;

      idx := idx + m_nCurEffFrame;
      if wimg <> nil then
        d := wimg.GetCachedImage (idx, ax, ay);

      if d <> nil then
        if (Self <> g_MySelf) and ((m_nState and $00000200 <> 0) or (m_nState and $00000080 <> 0)) and not (frmMain.IsGroupMember(self.m_sUserName)) then begin

        end else
        if (Self <> g_MySelf) and (m_nState and $00004000 <> 0) and         //월영술 안보이게 마법
        ((abs(self.m_nCurrX - g_MySelf.m_nCurrX) > 2) OR (abs(self.m_nCurrY - g_MySelf.m_nCurrY) > 2)) and not (frmMain.IsGroupMember(self.m_sUserName)) then begin

        end else
        DrawBlend (dsurface,dx + ax + m_nShiftX,
                             dy + ay + m_nShiftY,
                             d, 1);

     end;
   end;
   end;
   end;
   // 공파섬 별도 처리
   if m_boHitEffect and (m_nHitEffectNumber = 8) then begin
    if GetTickCount - SKillStartTime > SKillFrametime then begin
         if SKillCurrentFrame < (21) then
            Inc (SKillCurrentFrame)
         else begin
            SKillCurrentFrame := 0;
            m_boHitEffect := False;
         end;
         SKillStartTime := GetTickCount;
      end;
      idx := m_btDir*20;
      wimg := g_WMagic2Images;
      if wimg <> nil then
         d := wimg.GetCachedImage ((740+idx) + SKillCurrentFrame, ax, ay);
      if d <> nil then
      if (Self <> g_MySelf) and ((m_nState and $00000200 <> 0) or (m_nState and $00000080 <> 0)) and not (frmMain.IsGroupMember(self.m_sUserName)) then begin

      end else
      if (Self <> g_MySelf) and (m_nState and $00004000 <> 0) and     //월영술 안보이게 검법 효과
      ((abs(self.m_nCurrX - g_MySelf.m_nCurrX) > 2) OR (abs(self.m_nCurrY - g_MySelf.m_nCurrY) > 2)) and not (frmMain.IsGroupMember(self.m_sUserName)) then begin

      end else
         DrawBlend (dsurface,
                          dx + ax + m_nShiftX,
                          dy + ay + m_nShiftY,
                          d, 1);
   end else

   // 참격 별도 처리
   if m_boHitEffect and (m_nHitEffectNumber = 12) then begin
    if GetTickCount - CKillStartTime > CKillFrametime then begin
         if CKillCurrentFrame < (9) then
            Inc (CKillCurrentFrame)
         else begin
            CKillCurrentFrame := 0;
            m_boHitEffect := False;
         end;
         CKillStartTime := GetTickCount;
      end;
      idx := m_btDir * 10;
      wimg := g_WMagicNewImages;
      if wimg <> nil then
         d := wimg.GetCachedImage ((2490+idx) + CKillCurrentFrame, ax, ay);
      if d <> nil then
      if (Self <> g_MySelf) and ((m_nState and $00000200 <> 0) or (m_nState and $00000080 <> 0)) and not (frmMain.IsGroupMember(self.m_sUserName)) then begin

      end else
      if (Self <> g_MySelf) and (m_nState and $00004000 <> 0) and     //월영술 안보이게 검법 효과
      ((abs(self.m_nCurrX - g_MySelf.m_nCurrX) > 2) OR (abs(self.m_nCurrY - g_MySelf.m_nCurrY) > 2)) and not (frmMain.IsGroupMember(self.m_sUserName)) then begin

      end else
         DrawBlend (dsurface,
                          dx + ax + m_nShiftX,
                          dy + ay + m_nShiftY,
                          d, 1);
   end else

   //고려무진봉 별도 처리
   if m_boBonzeHitEff and (m_nHitEffectNumber in [16,17]) then begin
     if GetTickCount - BKillStartTime > BKillFrametime then begin
       if BKillCurrentFrame < (9) then
         Inc (BKillCurrentFrame)
       else begin
         BKillCurrentFrame := 0;
         m_boBonzeHitEff := False;
       end;
       BKillStartTime := GetTickCount;
     end;
      idx := m_btDir * 10;
      wimg := g_WMagic_BonzeImages;
      if wimg <> nil then
        if (m_nState and $00000040 <> 0) then
         d := wimg.GetCachedImage ((870+idx) + BKillCurrentFrame, ax, ay)
        else
         d := wimg.GetCachedImage ((510+idx) + BKillCurrentFrame, ax, ay);
      if d <> nil then
      if (Self <> g_MySelf) and ((m_nState and $00000200 <> 0) or (m_nState and $00000080 <> 0)) and not (frmMain.IsGroupMember(self.m_sUserName)) then begin

      end else
      if (Self <> g_MySelf) and (m_nState and $00004000 <> 0) and     //월영술 안보이게 검법 효과
      ((abs(self.m_nCurrX - g_MySelf.m_nCurrX) > 2) OR (abs(self.m_nCurrY - g_MySelf.m_nCurrY) > 2)) and not (frmMain.IsGroupMember(self.m_sUserName)) then begin

      end else
         DrawBlend (dsurface,
                          dx + ax + m_nShiftX,
                          dy + ay + m_nShiftY,
                          d, 1);
   end

   else if m_boBonzeHitEff and (m_nHitEffectNumber in [19]) then begin
     if GetTickCount - BCKillStartTime > BCKillFrametime then begin
       if BCKillCurrentFrame < (9) then
         Inc (BCKillCurrentFrame)
       else begin
         BCKillCurrentFrame := 0;
         m_boBonzeHitEff := False;
       end;
       BCKillStartTime := GetTickCount;
     end;
      idx := m_btDir * 10;
      wimg := g_WMagic_BonzeImages;
      if wimg <> nil then
        d := wimg.GetCachedImage ((1000+idx) + BCKillCurrentFrame, ax, ay);
      if d <> nil then
      if (Self <> g_MySelf) and ((m_nState and $00000200 <> 0) or (m_nState and $00000080 <> 0)) and not (frmMain.IsGroupMember(self.m_sUserName)) then begin

      end else
      if (Self <> g_MySelf) and (m_nState and $00004000 <> 0) and     //월영술 안보이게 검법 효과
      ((abs(self.m_nCurrX - g_MySelf.m_nCurrX) > 2) OR (abs(self.m_nCurrY - g_MySelf.m_nCurrY) > 2)) and not (frmMain.IsGroupMember(self.m_sUserName)) then begin

      end else
         DrawBlend (dsurface,
                          dx + ax + m_nShiftX,
                          dy + ay + m_nShiftY,
                          d, 1);
   end

   //검법 효과
   else if m_boHitEffect and (m_nHitEffectNumber > 0) then begin
      GetEffectBase (m_nHitEffectNumber - 1, 1, wimg, idx); //숫자는.... 이펙트 나가는법인듯...

      idx := idx + m_btDir*10 + (m_nCurrentFrame-m_nStartFrame);
      if wimg <> nil then
         d := wimg.GetCachedImage (idx, ax, ay);
      if d <> nil then
      if (Self <> g_MySelf) and ((m_nState and $00000200 <> 0) or (m_nState and $00000080 <> 0)) and not (frmMain.IsGroupMember(self.m_sUserName)) then begin

      end else
      if (Self <> g_MySelf) and (m_nState and $00004000 <> 0) and     //월영술 안보이게 검법 효과
      ((abs(self.m_nCurrX - g_MySelf.m_nCurrX) > 2) OR (abs(self.m_nCurrY - g_MySelf.m_nCurrY) > 2)) and not (frmMain.IsGroupMember(self.m_sUserName)) then begin

      end else
         DrawBlend (dsurface,
                          dx + ax + m_nShiftX,
                          dy + ay + m_nShiftY,
                          d, 1);  //숫자는 밝기조절

   end;


   if m_boHitEffect and (m_nAssEffectimg = 6) then begin
    if GetTickCount - HKillStartTime > HKillFrametime then begin
         if HKillCurrentFrame < (17) then
            Inc (HKillCurrentFrame)
         else begin
            HKillCurrentFrame := 0;
            m_boHitEffect := False;
         end;
         HKillStartTime := GetTickCount;
      end;
      idx := 3766;
      wimg := g_WMagicNewImages;
      if wimg <> nil then
         d := wimg.GetCachedImage (idx + HKillCurrentFrame, ax, ay);
      if d <> nil then
      if (Self <> g_MySelf) and ((m_nState and $00000200 <> 0) or (m_nState and $00000080 <> 0)) and not (frmMain.IsGroupMember(self.m_sUserName)) then begin

      end else
      if (Self <> g_MySelf) and (m_nState and $00004000 <> 0) and     //월영술 안보이게 검법 효과
      ((abs(self.m_nCurrX - g_MySelf.m_nCurrX) > 2) OR (abs(self.m_nCurrY - g_MySelf.m_nCurrY) > 2)) and not (frmMain.IsGroupMember(self.m_sUserName)) then begin

      end else
         DrawBlend (dsurface,
                          dx + ax + m_nShiftX,
                          dy + ay + m_nShiftY,
                          d, 1);
   end

   else if m_boHitEffect and (m_nAssEffectimg > 0) then begin   //풍검술
     GetEffectBase (m_nAssEffectimg-1, 2, wimg, idx);
      idx := idx + m_btDir * 10 + (m_nCurrentFrame-m_nStartFrame);

      if wimg <> nil then
         d := wimg.GetCachedImage (idx, ax, ay);
      if d <> nil then
      if (Self <> g_MySelf) and ((m_nState and $00000200 <> 0) or (m_nState and $00000080 <> 0)) and not (frmMain.IsGroupMember(self.m_sUserName)) then begin

      end else
      if (Self <> g_MySelf) and (m_nState and $00004000 <> 0) and     //월영술 안보이게 검법 효과
      ((abs(self.m_nCurrX - g_MySelf.m_nCurrX) > 2) OR (abs(self.m_nCurrY - g_MySelf.m_nCurrY) > 2)) and not (frmMain.IsGroupMember(self.m_sUserName)) then begin

      end else
         DrawBlend (dsurface,
                          dx + ax + m_nShiftX,
                          dy + ay + m_nShiftY,
                          d, 1);
   end;

   //무기 향상/부서짐 효과
   if m_boWeaponEffect then begin
      idx := WPEFFECTBASE + m_btDir * 10 + m_nCurWeaponEffect;
      d := g_WMagicImages.GetCachedImage (idx, ax, ay);
      if d <> nil then
      if (Self <> g_MySelf) and ((m_nState and $00000200 <> 0) or (m_nState and $00000080 <> 0)) and not (frmMain.IsGroupMember(self.m_sUserName)) then begin

      end else
      if (Self <> g_MySelf) and (m_nState and $00004000 <> 0) and          //월영술 안보이게 무기 부서짐 효과
      ((abs(self.m_nCurrX - g_MySelf.m_nCurrX) > 2) OR (abs(self.m_nCurrY - g_MySelf.m_nCurrY) > 2)) and not (frmMain.IsGroupMember(self.m_sUserName)) then begin

      end else
         DrawBlend (dsurface,
                     dx + ax + m_nShiftX,
                     dy + ay + m_nShiftY,
                     d, 1);
   end;



end;



procedure  THumActor.DrawChrBody (dsurface: TDirectDrawSurface; dx, dy: integer; blend: Boolean;boFlag:Boolean);
var
   idx, ax, ay: integer;
   d,d1,d2,e: TDirectDrawSurface;
   ceff: TColorEffect;
   wimg: TWMImages;
   bax,bay,wilimg: integer;
   pcm: PTClientMagic;
   tx,ty:integer;
begin
   d:=nil;
   if not (m_btDir in [0..7]) then exit;
   if GetTickCount - m_dwLoadSurfaceTime > 60 * 1000 then begin
      m_dwLoadSurfaceTime := GetTickCount;
      LoadSurface; //bodysurface loadsurface
   end;

   ceff := GetDrawEffectValue;    //밝기 효과

   if m_btRace = 0 then begin

     { if m_btGuildMark > 0 then begin     //문파 마크
        ShowGuildLable(dsurface);
      end;   }
   
      if (m_nCurrentFrame >= 0) and (m_nCurrentFrame <= 599) then begin
        if (m_btJob in [5..8]) then begin //우화등선 칼 보이는거
          if m_btWeapon in [98,99,146..155] then //우화등선 벽혈
            m_nWpord := WORDER2[m_btSex, m_nCurrentFrame]
          else
          if m_btWeapon in [102,103,164..171] then //우화등선 익선
            m_nWpord := WORDER3[m_btSex, m_nCurrentFrame]
          else
          if m_btWeapon in [208,209] then //우화등선 비연
            m_nWpord := WORDER5[m_btSex, m_nCurrentFrame]
          else
          m_nWpord := WORDER[m_btSex, m_nCurrentFrame];
        end else
        if m_btJob = 3 then begin
          if (m_btWeapon < 180) or (m_btWeapon > 219) then //자객 무기 검 아니고 일반검 이다면
            m_nWpord := WORDER[m_btSex, m_nCurrentFrame]
          else
          m_nWpord := WORDER4[m_btSex, m_nCurrentFrame];
        end else
        m_nWpord := WORDER[m_btSex, m_nCurrentFrame];
      end;

      if m_btEffect <> 0 then begin
        if g_MySelf = Self then begin
          if ((m_btDir = 3) or (m_btDir = 4) or (m_btDir = 5)) and
               (m_HumWinSurface <> nil) and not boFlag then begin
            if (Self <> g_MySelf) and ((m_nState and $00000200 <> 0) or (m_nState and $00000080 <> 0)) and not (frmMain.IsGroupMember(self.m_sUserName)) then begin
            end else
            if (Self <> g_MySelf) and (m_nState and $00004000 <> 0) and       //월영술 안보이게 이팩트 날게
              ((abs(self.m_nCurrX - g_MySelf.m_nCurrX) > 2) OR (abs(self.m_nCurrY - g_MySelf.m_nCurrY) > 2)) and not (frmMain.IsGroupMember(self.m_sUserName)) then begin

            end else
               DrawBlend (dsurface,
                          dx + m_nSpx + m_nShiftX,
                          dy + m_nSpy + m_nShiftY,
                          m_HumWinSurface,
                          1);
          end else begin//0x0047CED1
            if ((m_btDir = 3) or (m_btDir = 4) or (m_btDir = 5)) and
                 (m_HumWinSurface <> nil) and boFlag then begin
              if (Self <> g_MySelf) and ((m_nState and $00000200 <> 0) or (m_nState and $00000080 <> 0)) and not (frmMain.IsGroupMember(self.m_sUserName)) then begin
              end else
              if (Self <> g_MySelf) and (m_nState and $00004000 <> 0) and           //월영술 안보이게 이팩트 날게
               ((abs(self.m_nCurrX - g_MySelf.m_nCurrX) > 2) OR (abs(self.m_nCurrY - g_MySelf.m_nCurrY) > 2)) and not (frmMain.IsGroupMember(self.m_sUserName)) then begin

              end else
                 DrawBlend (dsurface,
                           dx + m_nSpx + m_nShiftX,
                           dy + m_nSpy + m_nShiftY,
                           m_HumWinSurface,
                           1);
            end;
          end;
        end else begin;//0x0047CF4D
          if ((g_FocusCret <> nil) or (g_MagicTarget <> nil)) and
             blend and ((m_btDir = 3) or (m_btDir = 4) or (m_btDir = 5)) and
             (m_HumWinSurface <> nil) and not boFlag then begin
            if (Self <> g_MySelf) and ((m_nState and $00000200 <> 0) or (m_nState and $00000080 <> 0)) and not (frmMain.IsGroupMember(self.m_sUserName)) then begin
            end else
            if (Self <> g_MySelf) and (m_nState and $00004000 <> 0) and                //월영술 안보이게 이팩트 날개
            ((abs(self.m_nCurrX - g_MySelf.m_nCurrX) > 2) OR (abs(self.m_nCurrY - g_MySelf.m_nCurrY) > 2)) and not (frmMain.IsGroupMember(self.m_sUserName)) then begin

            end else
             DrawBlend (dsurface,
                        dx + m_nSpx + m_nShiftX,
                        dy + m_nSpy + m_nShiftY,
                        m_HumWinSurface,
                        1);
          end else begin;//0x0047CFD4
            if ((m_btDir = 3) or (m_btDir = 4) or (m_btDir = 5)) and
               (m_HumWinSurface <> nil) and boFlag then begin
            if (Self <> g_MySelf) and ((m_nState and $00000200 <> 0) or (m_nState and $00000080 <> 0)) and not (frmMain.IsGroupMember(self.m_sUserName)) then begin
            end else
            if (Self <> g_MySelf) and (m_nState and $00004000 <> 0) and     //월영술 안보이게 이팩트 날개
            ((abs(self.m_nCurrX - g_MySelf.m_nCurrX) > 2) OR (abs(self.m_nCurrY - g_MySelf.m_nCurrY) > 2)) and not (frmMain.IsGroupMember(self.m_sUserName)) then begin

            end else
               DrawBlend (dsurface,
                          dx + m_nSpx + m_nShiftX,
                          dy + m_nSpy + m_nShiftY,
                          m_HumWinSurface,
                          1);
            end;//0x0047D03F
          end;
        end;
      end;//0x0047D03F

      if (m_HumfishSurface <> nil) or (m_HumfishSurface2 <> nil) then begin    //낚시 이펙트
         GetFrontPosition2 (m_nShiftX, m_nShiftY, m_btDir, tx,ty);
         if m_HumfishSurface2 <> nil then
         DrawBlend (dsurface, dx + m_fishdx + tx, dy + m_fishdx + ty, m_HumfishSurface2, 1);
         if m_HumfishSurface <> nil then
         DrawEffSurface (dsurface, m_HumfishSurface, dx + m_fishx + tx, dy + m_fishx + ty-10, blend, ceNone);
      end;

     { if m_nState and $00000400 <> 0 then begin  //복호장
         idx := 200 + (m_nGenAniCount mod 8);
         d := g_WMagic_BonzeImages.GetCachedImage (idx, ax, ay);
         if d <> nil then
         if (Self <> g_MySelf) and (m_nState and $00000200 <> 0) and not (frmMain.IsGroupMember(self.m_sUserName)) then begin

         end else
            DrawBlend (dsurface,
                             dx + ax + m_nShiftX,
                             dy + ay + m_nShiftY,
                             d, 1);
      end;  

      if (m_btHumEffect = 2) and (m_H60LevelEffectSurface <> nil) then begin    //60레벨 이팩트 바닥
         if (Self <> g_MySelf) and ((m_nState and $00000200 <> 0) or (m_nState and $00000080 <> 0)) and not (frmMain.IsGroupMember(self.m_sUserName)) then begin
         end else
         if (Self <> g_MySelf) and (m_nState and $00004000 <> 0) and     //월영술 안보이게 60 레벨 이팩
          ((abs(self.m_nCurrX - g_MySelf.m_nCurrX) > 2) OR (abs(self.m_nCurrY - g_MySelf.m_nCurrY) > 2)) and not (frmMain.IsGroupMember(self.m_sUserName)) then begin
         end else
          DrawBlend (dsurface, dx + m_nSpx3 + m_nShiftX, dy + m_nSpy3 + m_nShiftY, m_H60LevelEffectSurface, 1);   //DrawBlend3
      end;

      if (m_btHumEffect = 3)  and (m_HumUpLevelEffectSurface <> nil) then begin
         if (Self <> g_MySelf) and ((m_nState and $00000200 <> 0) or (m_nState and $00000080 <> 0)) and not (frmMain.IsGroupMember(self.m_sUserName)) then begin
         end else
         if (Self <> g_MySelf) and (m_nState and $00004000 <> 0) and           //월영술 안보이게 등선 이팩
            ((abs(self.m_nCurrX - g_MySelf.m_nCurrX) > 2) OR (abs(self.m_nCurrY - g_MySelf.m_nCurrY) > 2)) and not (frmMain.IsGroupMember(self.m_sUserName)) then begin
         end else
          DrawBlend (dsurface, dx + m_nSpx4 + m_nShiftX, dy + m_nSpy4 + m_nShiftY, m_HumUpLevelEffectSurface, 1);  //DrawBlend3
      end;

      if (m_btHumEffect = 4) and (m_HumUp70LevelEffectSurface <> nil) then begin   //등선 70이팩
         if (Self <> g_MySelf) and ((m_nState and $00000200 <> 0) or (m_nState and $00000080 <> 0)) and not (frmMain.IsGroupMember(self.m_sUserName)) then begin
         end else
         if (Self <> g_MySelf) and (m_nState and $00004000 <> 0) and                   //월영술 안보이게 70 레벨 이팩
            ((abs(self.m_nCurrX - g_MySelf.m_nCurrX) > 2) OR (abs(self.m_nCurrY - g_MySelf.m_nCurrY) > 2)) and not (frmMain.IsGroupMember(self.m_sUserName)) then begin
         end else
          DrawBlend (dsurface, dx + m_nSpx4 + m_nShiftX, dy + m_nSpy4 + m_nShiftY, m_HumUp70LevelEffectSurface, 1);  //DrawBlend3
      end;         }

      if m_TigerSurface <> nil then  //호랑이
         DrawEffSurface (dsurface, m_TigerSurface, dx + m_nTdx + m_nShiftX, dy + m_nTdy + m_nShiftY, blend, ceff);

      if (m_nWpord = 0) and (not blend) and (m_btWeapon >= 2) and (m_WeaponSurface <> nil) and (not m_boHideWeapon) then begin
         DrawEffSurface (dsurface, m_WeaponSurface, dx + m_nWpx + m_nShiftX, dy + m_nWpy + m_nShiftY, blend, ceNone);
         if m_WeaponSurface2 <> nil then
         DrawEffSurface (dsurface, m_WeaponSurface2, dx + m_nWp2x + m_nShiftX, dy + m_nWp2y + m_nShiftY, blend, ceNone);
         if FWeaponEffectSurface <> nil then begin
           if m_btWeapon in [76,77] then
             DrawBlend (dsurface, dx + wpx2 + m_nShiftX, dy + wpy2 + m_nShiftY, FWeaponEffectSurface, 1);
           if (m_btJob in [4, 9]) and (m_btWeapon in [30,28]) then
             DrawBlend (dsurface, dx + wpx2 + m_nShiftX, dy + wpy2 + m_nShiftY, FWeaponEffectSurface, 1);
           if m_WEffect > 0 then
             DrawBlend (dsurface, dx + wpx2 + m_nShiftX, dy + wpy2 + m_nShiftY, FWeaponEffectSurface, 1);
         end;
         if FWeaponEffectSurface_r <> nil then begin
           if m_WEffect > 0 then
             DrawBlend (dsurface, dx + wpx3 + m_nShiftX, dy + wpy3 + m_nShiftY, FWeaponEffectSurface_r, 1);
         end;
      end;

      if TransFormWeaponEffectSurface <> nil then
         DrawBlend (dsurface, dx + m_nPx3 + m_nShiftX, dy + m_nPy3 + m_nShiftY, TransFormWeaponEffectSurface, 1);

      if (m_BodySurface <> nil) and ((m_btJob <> 4) or (m_btHorse = 0) or (m_btMask <> 0)) then
         DrawEffSurface (dsurface, m_BodySurface, dx + m_nPx + m_nShiftX, dy + m_nPy + m_nShiftY, blend, ceff);

      if TransFormEffectSurface <> nil then
         DrawBlend (dsurface, dx + m_nPx2 + m_nShiftX, dy + m_nPy2 + m_nShiftY, TransFormEffectSurface, 1);

      if m_HairSurface <> nil then
         DrawEffSurface (dsurface, m_HairSurface, dx + m_nHpx + m_nShiftX, dy + m_nHpy + m_nShiftY, blend, ceff);

      if (m_nWpord = 1) and (m_btWeapon >= 2) and (m_WeaponSurface <> nil) and (not m_boHideWeapon) then begin
         DrawEffSurface (dsurface, m_WeaponSurface, dx + m_nWpx + m_nShiftX, dy + m_nWpy + m_nShiftY, blend, ceNone);
         if m_WeaponSurface2 <> nil then
         DrawEffSurface (dsurface, m_WeaponSurface2, dx + m_nWp2x + m_nShiftX, dy + m_nWp2y + m_nShiftY, blend, ceNone);
         if FWeaponEffectSurface <> nil then begin
           if m_btWeapon in [76,77] then
             DrawBlend (dsurface, dx + wpx2 + m_nShiftX, dy + wpy2 + m_nShiftY, FWeaponEffectSurface, 1);
           if (m_btJob in [4, 9]) and (m_btWeapon in [30,28]) then
             DrawBlend (dsurface, dx + wpx2 + m_nShiftX, dy + wpy2 + m_nShiftY, FWeaponEffectSurface, 1);
           if m_WEffect > 0 then
             DrawBlend (dsurface, dx + wpx2 + m_nShiftX, dy + wpy2 + m_nShiftY, FWeaponEffectSurface, 1);
         end;
      end;

      if (m_btEffect = 60) then begin //흑룡신갑
        if (m_HumWinSurface <> nil) {and m_bo2D0} then begin
         if (Self <> g_MySelf) and ((m_nState and $00000200 <> 0) or (m_nState and $00000080 <> 0)) and not (frmMain.IsGroupMember(self.m_sUserName)) then begin

         end else
         if (Self <> g_MySelf) and (m_nState and $00004000 <> 0) and    //월영술 안보이게 날개 이팩
            ((abs(self.m_nCurrX - g_MySelf.m_nCurrX) > 2) OR (abs(self.m_nCurrY - g_MySelf.m_nCurrY) > 2)) and not (frmMain.IsGroupMember(self.m_sUserName)) then begin

         end else
          DrawBlend (dsurface,
                          dx + m_nSpx + m_nShiftX,
                          dy + m_nSpy + m_nShiftY,
                          m_HumWinSurface,
                          1);
        end;
      end else
      if (m_btEffect in [50]) then begin //파황옷
        if (m_HumWinSurface <> nil) and m_bo2D0 then begin
         if (Self <> g_MySelf) and ((m_nState and $00000200 <> 0) or (m_nState and $00000080 <> 0)) and not (frmMain.IsGroupMember(self.m_sUserName)) then begin

         end else
         if (Self <> g_MySelf) and (m_nState and $00004000 <> 0) and    //월영술 안보이게 날개 이팩
            ((abs(self.m_nCurrX - g_MySelf.m_nCurrX) > 2) OR (abs(self.m_nCurrY - g_MySelf.m_nCurrY) > 2)) and not (frmMain.IsGroupMember(self.m_sUserName)) then begin

         end else
          DrawBlend (dsurface,
                          dx + m_nSpx + m_nShiftX,
                          dy + m_nSpy + m_nShiftY,
                          m_HumWinSurface,
                          1);
        end;
      end else
      if m_btEffect <> 0 then begin
        if g_MySelf = Self then begin
            if ((m_btDir = 0) or (m_btDir = 7) or (m_btDir = 1) or (m_btDir = 6)  or (m_btDir = 2)) and
               (m_HumWinSurface <> nil) and not boFlag then begin
            if (Self <> g_MySelf) and ((m_nState and $00000200 <> 0) or (m_nState and $00000080 <> 0)) and not (frmMain.IsGroupMember(self.m_sUserName)) then begin

            end else
            if (Self <> g_MySelf) and (m_nState and $00004000 <> 0) and     //월영술 안보이게 이팩
            ((abs(self.m_nCurrX - g_MySelf.m_nCurrX) > 2) OR (abs(self.m_nCurrY - g_MySelf.m_nCurrY) > 2)) and not (frmMain.IsGroupMember(self.m_sUserName)) then begin

            end else
               DrawBlend (dsurface,
                          dx + m_nSpx + m_nShiftX,
                          dy + m_nSpy + m_nShiftY,
                          m_HumWinSurface,
                          1);
            end else begin//0x0047D27F
              if ((m_btDir = 0) or (m_btDir = 7) or (m_btDir = 1) or (m_btDir = 6)  or (m_btDir = 2)) and
                 (m_HumWinSurface <> nil) and boFlag then begin
              if (Self <> g_MySelf) and ((m_nState and $00000200 <> 0) or (m_nState and $00000080 <> 0)) and not (frmMain.IsGroupMember(self.m_sUserName)) then begin

              end else
              if (Self <> g_MySelf) and (m_nState and $00004000 <> 0) and  //월영술 안보이게 이팩
               ((abs(self.m_nCurrX - g_MySelf.m_nCurrX) > 2) OR (abs(self.m_nCurrY - g_MySelf.m_nCurrY) > 2)) and not (frmMain.IsGroupMember(self.m_sUserName)) then begin

              end else
                DrawBlend (dsurface,
                          dx + m_nSpx + m_nShiftX,
                          dy + m_nSpy + m_nShiftY,
                          m_HumWinSurface,
                          1);
             end;
            end;
          //end;// gogo 0x0047D41D
        end else begin;//0x0047D30D
          if ((g_FocusCret <> nil) or (g_MagicTarget <> nil)) and
             ((m_btDir = 0) or (m_btDir = 7) or (m_btDir = 1) or (m_btDir = 6)  or (m_btDir = 2)) and
             (m_HumWinSurface <> nil) and not boFlag then begin
            if (Self <> g_MySelf) and ((m_nState and $00000200 <> 0) or (m_nState and $00000080 <> 0)) and not (frmMain.IsGroupMember(self.m_sUserName)) then begin

            end else
            if (Self <> g_MySelf) and (m_nState and $00004000 <> 0) and   //월영술 안보이게 이팩
            ((abs(self.m_nCurrX - g_MySelf.m_nCurrX) > 2) OR (abs(self.m_nCurrY - g_MySelf.m_nCurrY) > 2)) and not (frmMain.IsGroupMember(self.m_sUserName)) then begin

            end else
               DrawBlend (dsurface,
                          dx + m_nSpx + m_nShiftX,
                          dy + m_nSpy + m_nShiftY,
                          m_HumWinSurface,
                          1);
          end else begin;//0x0047D3A0
            if ((m_btDir = 0) or (m_btDir = 7) or (m_btDir = 1) or (m_btDir = 6)  or (m_btDir = 2)) and
               (m_HumWinSurface <> nil) and boFlag then begin
            if (Self <> g_MySelf) and ((m_nState and $00000200 <> 0) or (m_nState and $00000080 <> 0)) and not (frmMain.IsGroupMember(self.m_sUserName)) then begin

            end else
            if (Self <> g_MySelf) and (m_nState and $00004000 <> 0) and     //월영술 안보이게 이팩
            ((abs(self.m_nCurrX - g_MySelf.m_nCurrX) > 2) OR (abs(self.m_nCurrY - g_MySelf.m_nCurrY) > 2)) and not (frmMain.IsGroupMember(self.m_sUserName)) then begin

            end else
               DrawBlend (dsurface,
                          dx + m_nSpx + m_nShiftX,
                          dy + m_nSpy + m_nShiftY,
                          m_HumWinSurface,
                          1);
            end;//0x0047D41D
          end;
        end;
      end;//0x0047D41D
  //  end;  //m_btRace = 0  11-2-13






      if m_nState and $00010000 <> 0 then begin  //심연술
         idx := ABYSSBASE + (m_nGenAniCount mod 2);
         d := g_WMagic3Images.GetCachedImage (idx, ax, ay);
         if d <> nil then
         if (Self <> g_MySelf) and (m_nState and $00000200 <> 0) and not (frmMain.IsGroupMember(self.m_sUserName)) then begin

         end else
            DrawBlend (dsurface,
                             dx + ax + m_nShiftX,
                             dy + ay + m_nShiftY,
                             d, 1);
      end;
      if m_nState and $00002000 <> 0 then begin  //혈룡검법
         idx := BLOODSWORD + (m_nGenAniCount mod 2);
         d := g_WMagic3Images.GetCachedImage (idx, ax, ay);
         if d <> nil then
         if (Self <> g_MySelf) and (m_nState and $00000200 <> 0) and not (frmMain.IsGroupMember(self.m_sUserName)) then begin

         end else
            DrawBlend (dsurface,
                             dx + ax + m_nShiftX,
                             dy + ay + m_nShiftY,
                             d, 1);
      end;
      if m_nState and $00040000 <> 0 then begin  //천상비술
         idx := SKYSWORD + (m_nGenAniCount mod 2);
         d := g_WMagic3Images.GetCachedImage (idx, ax, ay);
         if d <> nil then
         if (Self <> g_MySelf) and (m_nState and $00000200 <> 0) and not (frmMain.IsGroupMember(self.m_sUserName)) then begin

         end else
            DrawBlend (dsurface,
                             dx + ax + m_nShiftX,
                             dy + ay + m_nShiftY,
                             d, 1);
      end;

      if m_nState and $01000000 <> 0 then begin  //선천기공
         if (m_nCurrentAction = SM_STRUCK) and (m_nCurBubbleStruck2 < 3) then
            idx := CELESTIALSTRUCKBASE + m_nCurBubbleStruck2
         else
            idx := CELESTIALBASE + (m_nGenAniCount mod 3);
         d := g_WMagic2Images.GetCachedImage (idx, ax, ay);
         if d <> nil then
         if (Self <> g_MySelf) and ((m_nState and $00000200 <> 0) or (m_nState and $00000080 <> 0)) and not (frmMain.IsGroupMember(self.m_sUserName)) then begin

         end else
         if (Self <> g_MySelf) and (m_nState and $00004000 <> 0) and    //월영술 안보이게 기공 이팩
         ((abs(self.m_nCurrX - g_MySelf.m_nCurrX) > 2) OR (abs(self.m_nCurrY - g_MySelf.m_nCurrY) > 2)) and not (frmMain.IsGroupMember(self.m_sUserName)) then begin

         end else
            DrawBlend (dsurface,
                             dx + ax + m_nShiftX,
                             dy + ay + m_nShiftY,
                             d, 1);
      end;
      if m_nState and $00100000 <> 0 then begin  //주술의막
         if m_nState and $00000040 <> 0 then begin  //주술의막 강화
           if (m_nCurrentAction = SM_STRUCK) and (m_nCurBubbleStruck < 3) then idx := MAGBUBBLESTRUCKBASEUP + m_nCurBubbleStruck
            else idx := MAGBUBBLEBASEUP + (m_nGenAniCount mod 3);
           d := g_WMagicUpImages.GetCachedImage (idx, ax, ay);
         end else begin
           if (m_nCurrentAction = SM_STRUCK) and (m_nCurBubbleStruck < 3) then idx := MAGBUBBLESTRUCKBASE + m_nCurBubbleStruck
            else  idx := MAGBUBBLEBASE + (m_nGenAniCount mod 3);
           d := g_WMagicImages.GetCachedImage (idx, ax, ay);
         end;
         if d <> nil then
         if (Self <> g_MySelf) and (m_nState and $00000200 <> 0) and not (frmMain.IsGroupMember(self.m_sUserName)) then begin

         end else
            DrawBlend (dsurface,
                             dx + ax + m_nShiftX,
                             dy + ay + m_nShiftY,
                             d, 1);
      end;
      if m_nState and $00000100 <> 0 then begin  //금강불괴
         idx := KUMGANG + (m_nGenAniCount mod 2);
         d := g_WMagic3Images.GetCachedImage (idx, ax, ay);
         if d <> nil then
         if (Self <> g_MySelf) and (m_nState and $00000200 <> 0) and not (frmMain.IsGroupMember(self.m_sUserName)) then begin

         end else
            DrawBlend (dsurface,
                             dx + ax + m_nShiftX,
                             dy + ay + m_nShiftY,
                             d, 1);
      end;

      if m_nState and $00001000 <> 0 then begin  //호신강기
         idx := PROTECTSHAILD + (m_nGenAniCount mod 5);
         d := g_WMagic_BonzeImages.GetCachedImage (idx, ax, ay);
         if d <> nil then
         if (Self <> g_MySelf) and (m_nState and $00000200 <> 0) and not (frmMain.IsGroupMember(self.m_sUserName)) then begin

         end else
            DrawBlend (dsurface,
                             dx + ax + m_nShiftX,
                             dy + ay + m_nShiftY,
                             d, 1);
      end;



   end;   //m_btRace = 0  11-2-13

   //좌표  무공

   if m_boHitEffect and (m_nHitEffectNumber = 8) then begin
   end else begin
   if m_boHitEffect and (m_nHitEffectNumber = 12) then begin
   end else begin
   if m_boUseMagic  and (m_CurMagic.EffectNumber > 0) then begin
    if m_nCurEffFrame in [0..m_nSpellFrame-1] then begin
     if (m_nState and $00000040 <> 0) and (m_curmagic.effectnumber in [20,29,65]) then
       GetUpEffectBase (m_CurMagic.EffectNumber-1, 0, wimg, idx)
     else
     if (m_nState and $00000020 <> 0) and (m_curmagic.effectnumber in [50,51,52,53,55,57,68]) then
       GetUpEffectBase (m_CurMagic.EffectNumber-1, 0, wimg, idx)
     else GetEffectBase (m_CurMagic.EffectNumber-1, 0, wimg, idx);

      if (m_curmagic.effectnumber in [57,59,60,66,68,76,77,80,110,126]) then begin     //빙염, 체신, 천이, 맹독 , 월하 ,빙뇌천 ,태극진, 독침술,
        wilimg := 10;
        if (m_curmagic.effectnumber in [68,77,80]) then
          wilimg:=20;
        if (m_curmagic.effectnumber in [57,59,60,66,76,110,126]) then           //법륜연공 //회천격
          wilimg:=10;
        idx := idx + (m_btDir * wilimg);
      end;

      idx := idx + m_nCurEffFrame;
      if wimg <> nil then
        d := wimg.GetCachedImage (idx, ax, ay);

      if d <> nil then
        if (Self <> g_MySelf) and ((m_nState and $00000200 <> 0) or (m_nState and $00000080 <> 0)) and not (frmMain.IsGroupMember(self.m_sUserName)) then begin

        end else
        if (Self <> g_MySelf) and (m_nState and $00004000 <> 0) and         //월영술 안보이게 마법
        ((abs(self.m_nCurrX - g_MySelf.m_nCurrX) > 2) OR (abs(self.m_nCurrY - g_MySelf.m_nCurrY) > 2)) and not (frmMain.IsGroupMember(self.m_sUserName)) then begin

        end else
        DrawBlend (dsurface,dx + ax + m_nShiftX,
                             dy + ay + m_nShiftY,
                             d, 1);

     end;
   end;
   end;
   end;

   // 공파섬 별도 처리
   if m_boHitEffect and (m_nHitEffectNumber = 8) then begin
    if GetTickCount - SKillStartTime > SKillFrametime then begin
         if SKillCurrentFrame < (21) then
            Inc (SKillCurrentFrame)
         else begin
            SKillCurrentFrame := 0;
            m_boHitEffect := False;
         end;
         SKillStartTime := GetTickCount;
      end;
      idx := m_btDir*20;
      wimg := g_WMagic2Images;
      if wimg <> nil then
         d := wimg.GetCachedImage ((740+idx) + SKillCurrentFrame, ax, ay);
      if d <> nil then
      if (Self <> g_MySelf) and ((m_nState and $00000200 <> 0) or (m_nState and $00000080 <> 0)) and not (frmMain.IsGroupMember(self.m_sUserName)) then begin

      end else
      if (Self <> g_MySelf) and (m_nState and $00004000 <> 0) and     //월영술 안보이게 검법 효과
      ((abs(self.m_nCurrX - g_MySelf.m_nCurrX) > 2) OR (abs(self.m_nCurrY - g_MySelf.m_nCurrY) > 2)) and not (frmMain.IsGroupMember(self.m_sUserName)) then begin

      end else
         DrawBlend (dsurface,
                          dx + ax + m_nShiftX,
                          dy + ay + m_nShiftY,
                          d, 1);
   end else

   // 참격 별도 처리
   if m_boHitEffect and (m_nHitEffectNumber = 12) then begin
    if GetTickCount - CKillStartTime > CKillFrametime then begin
         if CKillCurrentFrame < (9) then
            Inc (CKillCurrentFrame)
         else begin
            CKillCurrentFrame := 0;
            m_boHitEffect := False;
         end;
         CKillStartTime := GetTickCount;
      end;
      idx := m_btDir * 10;
      wimg := g_WMagicNewImages;
      if wimg <> nil then
         d := wimg.GetCachedImage ((2490+idx) + CKillCurrentFrame, ax, ay);
      if d <> nil then
      if (Self <> g_MySelf) and ((m_nState and $00000200 <> 0) or (m_nState and $00000080 <> 0)) and not (frmMain.IsGroupMember(self.m_sUserName)) then begin

      end else
      if (Self <> g_MySelf) and (m_nState and $00004000 <> 0) and     //월영술 안보이게 검법 효과
      ((abs(self.m_nCurrX - g_MySelf.m_nCurrX) > 2) OR (abs(self.m_nCurrY - g_MySelf.m_nCurrY) > 2)) and not (frmMain.IsGroupMember(self.m_sUserName)) then begin

      end else
         DrawBlend (dsurface,
                          dx + ax + m_nShiftX,
                          dy + ay + m_nShiftY,
                          d, 1);
   end else

   //고려무진봉 별도 처리
   if m_boBonzeHitEff and (m_nHitEffectNumber in [16,17]) then begin
    if GetTickCount - BKillStartTime > BKillFrametime then begin
         if BKillCurrentFrame < (9) then
            Inc (BKillCurrentFrame)
         else begin
            BKillCurrentFrame := 0;
            m_boBonzeHitEff := False;
         end;
         BKillStartTime := GetTickCount;
      end;
      idx := m_btDir * 10;
      wimg := g_WMagic_BonzeImages;
      if wimg <> nil then
        if (m_nState and $00000040 <> 0) then
         d := wimg.GetCachedImage ((870+idx) + BKillCurrentFrame, ax, ay)
        else
         d := wimg.GetCachedImage ((510+idx) + BKillCurrentFrame, ax, ay);
      if d <> nil then
      if (Self <> g_MySelf) and ((m_nState and $00000200 <> 0) or (m_nState and $00000080 <> 0)) and not (frmMain.IsGroupMember(self.m_sUserName)) then begin

      end else
      if (Self <> g_MySelf) and (m_nState and $00004000 <> 0) and     //월영술 안보이게 검법 효과
      ((abs(self.m_nCurrX - g_MySelf.m_nCurrX) > 2) OR (abs(self.m_nCurrY - g_MySelf.m_nCurrY) > 2)) and not (frmMain.IsGroupMember(self.m_sUserName)) then begin

      end else
         DrawBlend (dsurface,
                          dx + ax + m_nShiftX,
                          dy + ay + m_nShiftY,
                          d, 1);
   end else

   if m_boBonzeHitEff and (m_nHitEffectNumber in [19]) then begin
    if GetTickCount - BCKillStartTime > BCKillFrametime then begin
         if BCKillCurrentFrame < (9) then
            Inc (BCKillCurrentFrame)
         else begin
            BCKillCurrentFrame := 0;
            m_boBonzeHitEff := False;
         end;
         BCKillStartTime := GetTickCount;
      end;
      idx := m_btDir * 10;
      wimg := g_WMagic_BonzeImages;
      if wimg <> nil then
       d := wimg.GetCachedImage ((1000+idx) + BCKillCurrentFrame, ax, ay);
      if d <> nil then
      if (Self <> g_MySelf) and ((m_nState and $00000200 <> 0) or (m_nState and $00000080 <> 0)) and not (frmMain.IsGroupMember(self.m_sUserName)) then begin

      end else
      if (Self <> g_MySelf) and (m_nState and $00004000 <> 0) and     //월영술 안보이게 검법 효과
      ((abs(self.m_nCurrX - g_MySelf.m_nCurrX) > 2) OR (abs(self.m_nCurrY - g_MySelf.m_nCurrY) > 2)) and not (frmMain.IsGroupMember(self.m_sUserName)) then begin

      end else
         DrawBlend (dsurface,
                          dx + ax + m_nShiftX,
                          dy + ay + m_nShiftY,
                          d, 1);
   end

   //검법 효과
   else if m_boHitEffect and (m_nHitEffectNumber > 0) then begin
      GetEffectBase (m_nHitEffectNumber - 1, 1, wimg, idx); //숫자는.... 이펙트 나가는법인듯...

      idx := idx + m_btDir*10 + (m_nCurrentFrame-m_nStartFrame);
      if wimg <> nil then
         d := wimg.GetCachedImage (idx, ax, ay);
      if d <> nil then
      if (Self <> g_MySelf) and ((m_nState and $00000200 <> 0) or (m_nState and $00000080 <> 0)) and not (frmMain.IsGroupMember(self.m_sUserName)) then begin

      end else
      if (Self <> g_MySelf) and (m_nState and $00004000 <> 0) and     //월영술 안보이게 검법 효과
      ((abs(self.m_nCurrX - g_MySelf.m_nCurrX) > 2) OR (abs(self.m_nCurrY - g_MySelf.m_nCurrY) > 2)) and not (frmMain.IsGroupMember(self.m_sUserName)) then begin

      end else
         DrawBlend (dsurface,
                          dx + ax + m_nShiftX,
                          dy + ay + m_nShiftY,
                          d, 1);  //숫자는 밝기조절
   end;

   if m_boHitEffect and (m_nAssEffectimg = 6) then begin
    if GetTickCount - HKillStartTime > HKillFrametime then begin
         if HKillCurrentFrame < (17) then
            Inc (HKillCurrentFrame)
         else begin
            HKillCurrentFrame := 0;
            m_boHitEffect := False;
         end;
         HKillStartTime := GetTickCount;
      end;
      idx := 3766;
      wimg := g_WMagicNewImages;
      if wimg <> nil then
         d := wimg.GetCachedImage (idx + HKillCurrentFrame, ax, ay);
      if d <> nil then
      if (Self <> g_MySelf) and ((m_nState and $00000200 <> 0) or (m_nState and $00000080 <> 0)) and not (frmMain.IsGroupMember(self.m_sUserName)) then begin

      end else
      if (Self <> g_MySelf) and (m_nState and $00004000 <> 0) and     //월영술 안보이게 검법 효과
      ((abs(self.m_nCurrX - g_MySelf.m_nCurrX) > 2) OR (abs(self.m_nCurrY - g_MySelf.m_nCurrY) > 2)) and not (frmMain.IsGroupMember(self.m_sUserName)) then begin

      end else
         DrawBlend (dsurface,
                          dx + ax + m_nShiftX,
                          dy + ay + m_nShiftY,
                          d, 1);
   end

   else if m_boHitEffect and (m_nAssEffectimg > 0) then begin   //풍검술
      GetEffectBase (m_nAssEffectimg-1, 2, wimg, idx);
      idx := idx + m_btDir * 10 + (m_nCurrentFrame-m_nStartFrame);

      if wimg <> nil then
         d := wimg.GetCachedImage (idx, ax, ay);
      if d <> nil then
      if (Self <> g_MySelf) and ((m_nState and $00000200 <> 0) or (m_nState and $00000080 <> 0)) and not (frmMain.IsGroupMember(self.m_sUserName)) then begin

      end else
      if (Self <> g_MySelf) and (m_nState and $00004000 <> 0) and     //월영술 안보이게 검법 효과
      ((abs(self.m_nCurrX - g_MySelf.m_nCurrX) > 2) OR (abs(self.m_nCurrY - g_MySelf.m_nCurrY) > 2)) and not (frmMain.IsGroupMember(self.m_sUserName)) then begin

      end else
         DrawBlend (dsurface,
                          dx + ax + m_nShiftX,
                          dy + ay + m_nShiftY,
                          d, 1);

   end;

   //무기 향상/부서짐 효과
   if m_boWeaponEffect then begin
      idx := WPEFFECTBASE + m_btDir * 10 + m_nCurWeaponEffect;
      d := g_WMagicImages.GetCachedImage (idx, ax, ay);
      if d <> nil then
      if (Self <> g_MySelf) and ((m_nState and $00000200 <> 0) or (m_nState and $00000080 <> 0)) and not (frmMain.IsGroupMember(self.m_sUserName)) then begin

      end else
      if (Self <> g_MySelf) and (m_nState and $00004000 <> 0) and          //월영술 안보이게 무기 부서짐 효과
      ((abs(self.m_nCurrX - g_MySelf.m_nCurrX) > 2) OR (abs(self.m_nCurrY - g_MySelf.m_nCurrY) > 2)) and not (frmMain.IsGroupMember(self.m_sUserName)) then begin

      end else
         DrawBlend (dsurface,
                     dx + ax + m_nShiftX,
                     dy + ay + m_nShiftY,
                     d, 1);
   end;



end;

{---- Adjust global SVN revision ----}
initialization
  //SVNRevision('$Id: Actor.pas 523 2006-12-16 10:08:26Z damian $');
end.
