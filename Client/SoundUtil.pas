unit SoundUtil;

interface

uses
  {svn, }Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DXDraws, DirectX, DXClass, Grobal2, ExtCtrls, HUtil32, EdCode, Bass,
  Actor, DXSounds;

type
  TBGMState = (bgmPlay, bgmStop, bgmPause);

var
   CurVolume: integer;
   MusicHS: HSTREAM;

procedure LoadSoundList (flname: string);
procedure PlaySound (idx: integer);
procedure NextPlaySound (idx: integer);
function  PlayBGM (wavname: string): TDirectSoundBuffer;
procedure PlayBGM2(wavname: string);
function  PlaySound2 (wavname: string): TDirectSoundBuffer;
function  PlaySound3 (wavname: string): TDirectSoundBuffer;
procedure ChangeBGMState(BGMState: TBGMState);
procedure SilenceSound;
procedure ClearBGM();
procedure ClearBGMEx();
procedure ItemClickSound (std: TStdItem);
procedure ItemUseSound (stdmode: integer);
procedure PlayMapMusic(boFlag:Boolean);

type
   SoundInfo = record
      Idx: integer;
      Name: string;
   end;

const
   bmg_intro            = 'wav\log-in-long2.wav';
   bmg_Newintro         = 'wav\NewLogin.wav';                                       
   bmg_select           = 'wav\sellect-loop2.wav';
   bmg_Nesselect        = 'wav\NewSelect.wav';
   bmg_field            = 'wav\Field2.wav';
   bmg_gameover         = 'wav\game-over2.wav';
   bmg_revival          = 'wav\M54-4.wav';

   bmg_Camera           = 'wav\camera.wav';
   bmg_enter            = 'wav\enter.wav';
   s_Archer_Bow         = 'Wav\M89-0.wav';
   bmg_ItemLevel_OK     = 'wav\bmg_ItemLevel_OK.wav';
   bmg_ItemLevel_Fail   = 'wav\bmg_ItemLevel_Fail.wav';
   bmg_Repair           = 'wav\bmg_Repair.wav';
   WarFSel              = 'Wav\WarFSel.wav';
   WarMSel              = 'Wav\WarMSel.wav';
   WizFSel              = 'Wav\WizFSel.wav';
   WizMSel              = 'Wav\WizMSel.wav';
   TaoFSel              = 'Wav\TaoFSel.wav';
   TaoMSel              = 'Wav\TaoMSel.wav';
   AssFsel              = 'Wav\AssFSel.wav';
   AssMSel              = 'Wav\AssMSel.wav';
   BonFSel              = 'Wav\BonFSel.wav';

   Dice                 = 'wav\Dice.wav';
   s_THUNDERCIRCLE      = 'wav\THUNDERCIRCLE.wav';//������
   hyunwolboss_atk7     = 'wav\hyunwolboss_atk7.wav'; //����
   s_Kyo                = 'wav\Kyo.wav';          //����
   s_Singi              = 'wav\m_Singi.wav';          //�ű⹦��
   m_108_1              = 'wav\m_108_1.wav';           //���߷ڰ�
   m_108_2              = 'wav\m_108_2.wav';           //���߷ڰ�
   m_109_1              = 'wav\m_109_1.wav';           //�ϵ�����
   m_109_2              = 'wav\m_109_2.wav';           //�ϵ�����
   m_110_1              = 'wav\m_110_m.wav';           //�����
   m_110_2              = 'wav\m_110_w.wav';           //�����
   MB_113               = 'wav\MB_113.wav';            //��õ����
   MB_113_1             = 'wav\MB_113_1.wav';
   MB_114               = 'wav\MB_114.wav';            //Ÿ������
   MB_115               = 'wav\MB_115.wav';            //�������� - �·�
   MB_116               = 'wav\MB_116.wav';            //���ѱ�� - �·�
   MB_117               = 'wav\MB_117.wav';            //������� - �·�
   MB_118               = 'wav\MB_118.wav';            //ȣ�Ű��� - �·�
   MB_119               = 'wav\MB_119.wav';            //õȭ���� - �·�
   MB_120               = 'wav\MB_120.wav';            //��������� - �·�
   MB_121               = 'wav\MB_121.wav';            //������ - �·�
   MB_121_1             = 'wav\MB_121_1.wav';
   MB_122               = 'wav\MB_122.wav';            //��ȣ�� - ����
   MB_122_1             = 'wav\MB_122_1.wav';
   MB_123               = 'wav\MB_123.wav';            //�ݰ��� - ����
   MB_124               = 'wav\MB_124.wav';            //ȸǳõ���� - ����
   MB_125               = 'wav\MB_125.wav';
   MB_126_1             = 'wav\MB_126_1.wav';
   MB_126_2             = 'wav\MB_126_2.wav';
   MB_127_1             = 'wav\MB_127_1.wav';
   MB_127_2             = 'wav\MB_127_2.wav';
   MB_128_1             = 'wav\MB_128_1.wav';
   MB_128_2             = 'wav\MB_128_2.wav';
   MB_129               = 'wav\MB_129.wav';
   Thunder_Struck       = 'wav\Thunder_Struck.wav';    //��ȣ�� ��
   s_StarSuper          = 'wav\776-attack3.wav'; //������
   s_Super              = 'wav\Super.wav';       //������
   s_Skeleton           = 'wav\M17-3.wav';       //ȯ��
   s_HumUp              = 'wav\HumUp.wav';        //� ����
   s_TigerSet1          = 'wav\tiger_ride_1.wav';    //ȣ���� ������ ����
   s_TigerSet2          = 'wav\tiger_ride_2.wav';
   s_armoreffect        = 'wav\armoreffect.wav';   //�������� �ݰ�
   s_SpaceMove          = 'wav\759-move.wav';
   s_effect             = 'wav\769-effect5.wav';   //�űԹ���

   s_cboZs3_start_m     = 'wav\cboZs3_start_m.wav';
   s_cboZs3_start_w     = 'wav\cboZs3_start_w.wav';

   s_cboDs1_start       = 'wav\cboDs1_start.wav';
   s_cboDs1_target      = 'wav\cboDs1_target.wav';

   s_fishingStart       = 'wav\fishing_throw.wav'; //���ý���
   s_fishingEnd         = 'wav\fishing_pull.wav'; //��������
   s_fishingWater       = 'wav\fishing.wav'; //���� ���� �Ҹ�

   horse_r              = 'wav\horse_r.wav';
   horse_l              = 'wav\horse_l.wav';
   horse_run            = 'wav\horse_run.wav';

   Enchant_Fail         = 'wav\Enchant_Fail.wav';
   Enchant_Good         = 'wav\Enchant_Good.wav';
   Enchant_Hammer_Good  = 'wav\Enchant_Hammer_Good.wav';
   Enchant_Hammer_Miss  = 'wav\Enchant_Hammer_Miss.wav';

   fightcat_att         = 'wav\fightcat_att1.wav'; //��������
   fightcat_die_cat     = 'wav\fightcat_die_cat.wav'; //��������

   firecat_att          = 'wav\firecat_att1.wav';  //�ұ���
   firecat_att2         = 'wav\firecat_att2.wav';  //�ұ���
   firecat_die_cat      = 'wav\firecat_die_cat.wav'; //�ұ���

   spearcat_att         = 'wav\spearcat_att1.wav';  //â����
   spearcat_att2        = 'wav\spearcat_att2.wav';  //â����
   spearcat_die_cat     = 'wav\spearcat_die_cat.wav'; //â����

   hammercat_att        = 'wav\hammercat_att1.wav';  //����ġ����
   hammercat_die_cat    = 'wav\hammercat_die_cat.wav'; //����ġ����

   blackhammercat_att   = 'wav\blackhammercat_att2.wav'; //������ġ����

   armorcat_att         = 'wav\armorcat_att1.wav';  //������
   armorcat_att2        = 'wav\armorcat_att2.wav';  //������
   armorcat_att3        = 'wav\armorcat_att3.wav';  //������
   armorcat_die_cat     = 'wav\armorcat_die_cat.wav'; //������

   shamancat_att        = 'wav\shamancat_att1.wav';  //���籪��
   shamancat_att2       = 'wav\shamancat_att2.wav';  //���籪��
   shamancat_att3       = 'wav\shamancat_att3.wav';  //���籪��
   shamancat_die_cat    = 'wav\shamancat_die_cat.wav'; ///���籪��

   super                = 'wav\super.wav';
   Penetrate            = 'wav\Penetrate.wav';
   MWindMoon            = 'wav\M-1002.wav';

   pet_pig              = 'wav\pet_pig.wav';
   pet_chick            = 'wav\pet_chick.wav';
   pet_kitty            = 'wav\pet_kitty.wav';
   pet_skeleton         = 'wav\pet_skeleton.wav';
   pet_pigman           = 'wav\pet_pigman.wav';
   pet_weman            = 'wav\pet_weman.wav';
   pet_blackdragon      = 'wav\pet_blackdragon.wav';
   pet_pickup           = 'wav\pet_pickup.wav';
   pet_olympicmascot    = 'wav\pet_olympicmascot.wav';
   pet_wintersnow       = 'wav\pet_wintersnow.wav';
   pet_frog             = 'wav\pet_frog.wav';

   pot1_atk             = 'wav\pot1_atk.wav';    //ȣ�߱�2
   pot1_die             = 'wav\pot1_die.wav';    //ȣ�߱�2

   pot3_atk             = 'wav\pot3_atk.wav';    //ȣ�߱�1
   pot3_die             = 'wav\pot3_die.wav';    //ȣ�߱�1

   namman_att2          = 'wav\3490-att2.wav';   //�ܹ�
   namman_att3          = 'wav\3490-att3.wav';   //�ܹ�
   THUNDERCIRCLE        = 'wav\THUNDERCIRCLE.wav'; //��ǳ����

   as_130               = 'wav\as_130.wav';
   as_130_1             = 'wav\as_130_1.wav';

   as_132_1             = 'wav\as_132_1.wav';
   as_132_2             = 'wav\as_132_2.wav';
   as_132_3             = 'wav\as_132_3.wav';

   as_133               = 'wav\as_133.wav';

   as_134_1               = 'wav\as_134_1.wav';
   as_134_2               = 'wav\as_134_2.wav';
   as_134_3               = 'wav\as_134_3.wav';

   as_136                 = 'wav\as_136.wav';
   as_137_1               = 'wav\as_137_1.wav';
   as_137_2               = 'wav\as_137_2.wav';
   as_137_3               = 'wav\as_137_3.wav';

   as_138_1               = 'wav\as_138_1.wav';
   as_138_2               = 'wav\as_138_2.wav';
   as_138_3               = 'wav\as_138_3.wav';
   as_138_4               = 'wav\as_138_4.wav';

   as_139_1               = 'wav\as_139_1.wav';
   as_139_2               = 'wav\as_139_2.wav';
   as_139_3               = 'wav\as_139_3.wav';

   as_140_1               = 'wav\as_140_1.wav';
   as_140                 = 'wav\as_140.wav';

   as_141                 = 'wav\as_141.wav';

   s_walk_ground_l      = 1;              //���� ����
   s_walk_ground_r      = 2;
   s_run_ground_l       = 3;
   s_run_ground_r       = 4;
   s_walk_stone_l       = 5;
   s_walk_stone_r       = 6;
   s_run_stone_l        = 7;
   s_run_stone_r        = 8;
   s_walk_lawn_l        = 9;
   s_walk_lawn_r        = 10;
   s_run_lawn_l         = 11;
   s_run_lawn_r         = 12;
   s_walk_rough_l       = 13;
   s_walk_rough_r       = 14;
   s_run_rough_l        = 15;
   s_run_rough_r        = 16;
   s_walk_wood_l        = 17;
   s_walk_wood_r        = 18;
   s_run_wood_l         = 19;
   s_run_wood_r         = 20;
   s_walk_cave_l        = 21;
   s_walk_cave_r        = 22;
   s_run_cave_l         = 23;
   s_run_cave_r         = 24;
   s_walk_room_l        = 25;
   s_walk_room_r        = 26;
   s_run_room_l         = 27;
   s_run_room_r         = 28;
   s_walk_water_l       = 29;
   s_walk_water_r       = 30;
   s_run_water_l        = 31;
   s_run_water_r        = 32;
   s_ride_walk_l        = 176;

   s_hit_short          = 50;
   s_hit_wooden         = 51;
   s_hit_sword          = 52;
   s_hit_do             = 53;
   s_hit_axe            = 54;
   s_hit_club           = 55;
   s_hit_long           = 56;
   s_hit_fist           = 57;
   s_killerMan_att3     = 'wav\killerMan-att3.wav';
   s_killerWo_att3      = 'wav\killerWo-att3.wav';

   s_Tiger0             =  181;
   s_Tiger1             =  182;
   s_Tiger2             =  183;
   s_Tiger3             =  179;
   s_Tiger4             =  180;

   s_struck_short       = 60;
   s_struck_wooden      = 61;
   s_struck_sword       = 62;
   s_struck_do          = 63;
   s_struck_axe         = 64;
   s_struck_club        = 65;

   s_struck_body_sword  = 70;
   s_struck_body_axe    = 71;
   s_struck_body_longstick = 72;
   s_struck_body_fist   = 73;

   s_struck_armor_sword = 80;
   s_struck_armor_axe   = 81;
   s_struck_armor_longstick = 82;
   s_struck_armor_fist  = 83;

   s_strike_stone        = 91;
   s_drop_stonepiece     = 92;

   s_rock_door_open     = 100;
   s_intro_theme        = 102;
   s_meltstone          = 101;
   s_main_theme         = 102;
   s_norm_button_click  = 103;
   s_rock_button_click  = 104;
   s_glass_button_click = 105;
   s_money              = 106;
   s_eat_drug           = 107;
   s_click_drug         = 108;
   s_spacemove_out      = 109;
   s_spacemove_in       = 110;

   s_click_weapon       = 111;
   s_click_armor        = 112;
   s_click_ring         = 113;
   s_click_armring      = 114;
   s_click_necklace     = 115;
   s_click_helmet       = 116;
   s_click_grobes       = 117;
   s_itmclick           = 118;

   s_yedo_man           = 130;
   s_yedo_woman         = 131;
   s_wbhit              = 10605;     //ǳ�˼�
   s_wbhit2             = 10606;      //ǳ�˼�
   s_baldo_man          = 10625;
   s_baldo_wom          = 10626;
   s_pwidehit           = 10705;      //�͵��˱�
   s_longhit            = 132;

   s_widehit            = 133;
   s_rush_l             = 134;
   s_rush_r             = 135;
   s_firehit_ready      = 136;
   s_firehit            = 137;
   s_crshit             = 140;
   s_twinhit            = 141;

   s_man_struck     = 138;
   s_wom_struck     = 139;
   s_man_die        = 144;
   s_wom_die        = 145;
   s_killerman_struck = 164;
   s_killerwom_struck = 165;
   s_killerman_die  = 166;
   s_killerwom_die  = 167;
   s_Killerwepon1   = 170;
   s_Killerwepon2   = 171;
   s_Killerwepon3   = 172;
   s_struckck_axe   = 174;
   s_struckck_club  = 175;

implementation

uses
   ClMain, MShare;

var
  OldBGName: string = '';
  OldBGIndex: Integer = -1;

procedure LoadSoundList (flname: string);
var
   i, k, idx, n: integer;
   strlist: TStringList;
   str, data: string;
begin
   if FileExists (flname) then begin
      strlist := TStringList.Create;
      strlist.LoadFromFile (flname);
      idx := 0;
      for i:=0 to strlist.Count-1 do begin
         str := strlist[i];
         if str <> '' then begin
            if str[1] = ';' then continue;
            str := Trim (GetValidStr3 (str, data, [':', ' ', #9]));
            n := Str_ToInt(data, 0);
            if n > idx then begin
               for k:=0 to n-g_SoundList.Count-1 do
                  g_SoundList.Add ('');
               g_SoundList.Add (str);
               idx := n;
            end;
         end;
      end;
      FreeAndNil(strlist);
   end;
end;

procedure PlaySound (idx: integer);
begin
  if (g_Sound <> nil) and g_boSound then  begin
    if (idx >= 0) and (idx < g_SoundList.Count) then begin
      if g_SoundList[idx] <> '' then
        if FileExists (g_SoundList[idx]) then
          try
            g_Sound.EffectFile(g_SoundList[idx], FALSE, FALSE);      //���� ����
          except
        end;
     end;
  end;
end;

function  PlaySound2 (wavname: string): TDirectSoundBuffer;
begin
   Result:=nil;
   if not g_boSound then exit;
   if g_Sound <> nil then  begin
      if wavname <> '' then
         if FileExists (wavname) then begin
            try
               g_Sound.EffectFile(wavname, FALSE, FALSE);      //���� ����
            except
            end;
         end;
   end;
end;

function  PlaySound3 (wavname: string): TDirectSoundBuffer;
begin
   Result:=nil;
   if not g_boAttSound then exit;
   if g_Sound <> nil then  begin
      if wavname <> '' then
         if FileExists (wavname) then begin
            try
               g_Sound.EffectFile(wavname, FALSE, FALSE);      //���� ����
            except
            end;
         end;
   end;
end;


procedure NextPlaySound (idx: integer);
begin
  if g_boSound then begin
    if (idx >= 0) and (idx < g_SoundList.Count) then begin
      if g_SoundList[idx] <> '' then
        if FileExists (g_SoundList[idx]) then
          try
            g_Sound.EffectFile(g_SoundList[idx], FALSE, FALSE);   //���� ����
          except
        end;
     end;
  end;
end;

procedure PlayMapMusic(boFlag:Boolean);
var
  i:Integer;
  pFileName:^String;
  sFileName:String;
  nIndex:Integer;
begin
  ClearBGM;
  if (g_nMapMusic >= 1) then begin
    sFileName:='.\Music\' + IntToStr(g_nMapMusic) + '.mp3';
    PlayBGM2(sFileName);
  end;
end;

procedure ChangeBGMState(BGMState: TBGMState);
begin
  if MusicHS >= BASS_ERROR_ENDED then begin
    case BGMState of
      bgmPlay: BASS_ChannelPlay(MusicHS, False);
      bgmStop: BASS_ChannelStop(MusicHS);
      bgmPause: BASS_ChannelPause(MusicHS);
    end;
    BASS_ChannelSetAttribute(MusicHS, BASS_ATTRIB_VOL, g_btMP3Volume / 100);
  end;
end;

function  PlayBGM (wavname: string): TDirectSoundBuffer;
begin
   Result:=nil;
   if not g_boBGSound then exit;
   if g_Sound <> nil then  begin
      if wavname <> '' then
         if FileExists (wavname) then begin
            try
               SilenceSound;
               g_Sound.EffectFile(wavname, TRUE, FALSE);     //���� ����
            except
            end;
         end;
   end;
end;

procedure PlayBGM2(wavname: string);
begin
  if (not g_boBGSound) or (g_btMP3Volume <= 0) then exit;
  if (OldBGName = wavname) and (MusicHS > 0) then begin
    if BASS_ChannelIsActive(MusicHS) <> BASS_ACTIVE_PLAYING then
      BASS_ChannelPlay(MusicHS, False);
      BASS_ChannelSetAttribute(MusicHS, BASS_ATTRIB_VOL, g_btMP3Volume / 100);
    exit;
  end;
  ClearBGMEx;
  if FileExists (wavname) then begin
  Try
    MusicHS := BASS_StreamCreateFile(False, PAnsiChar(wavname), 0, 0, BASS_SAMPLE_LOOP);
    if MusicHS < BASS_ERROR_ENDED then begin
      BASS_StreamFree(MusicHS);
      MusicHS := 0;
      exit;
    end;
    OldBGName := wavname;
    BASS_ChannelPlay(MusicHS, True);
    BASS_ChannelSetAttribute(MusicHS, BASS_ATTRIB_VOL, g_btMP3Volume / 100);
  Except
  End;
  end;
end;

procedure SilenceSound;
begin
   if g_Sound <> nil then  begin
      g_Sound.Clear;
   end;
end;

procedure ClearBGMEx();
begin
  OldBGName := '';
  OldBGIndex := -1;
  BASS_StreamFree(MusicHS);
  MusicHS := 0;
end;

procedure ClearBGM();
begin
  ChangeBGMState(bgmStop);
end;

procedure ItemClickSound (std: TStdItem);
begin
   case std.StdMode of
      0: PlaySound (s_click_drug);    //����
      5, 6, 7, 90, 99: PlaySound (s_click_weapon);
      10, 11, 12: PlaySound (s_click_armor);
      22, 23: PlaySound (s_click_ring);
      24, 26: begin
        if (pos ('����', std.Name) > 0) or (pos ('����', std.Name) > 0) then
          PlaySound (s_click_grobes)
        else
          PlaySound (s_click_armring);
      end;
      19, 20, 21: PlaySound (s_click_necklace);
      15: PlaySound (s_click_helmet);
      else PlaySound (s_itmclick);
   end;
end;

procedure ItemUseSound (stdmode: integer);
begin
   case stdmode of
      0 : PlaySound (s_click_drug);   //����
      1,2: PlaySound (s_eat_drug);
      else  ;
   end;
end;

{---- Adjust global SVN revision ----}
initialization
  //SVNRevision('$Id: SoundUtil.pas 534 2006-12-19 20:34:31Z damian $');
end.



