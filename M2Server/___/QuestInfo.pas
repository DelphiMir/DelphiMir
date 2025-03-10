unit QuestInfo;

interface
uses
  Windows, Classes, SysUtils, StrUtils, DateUtils, SDK, IniFiles, Forms, ObjBase, ItmUnit;

type

  TQuestKillTask = record
    Monster  :TBaseObject;
    Count    :Integer;
    KMessage :String;
  end;
  pTQuestKillTask = ^TQuestKillTask;

  TQuestItemTask = record
    StdItem  :TItem;
    Count    :Integer;
    IMessage :String;
  end;
  pTQuestItemTask = ^TQuestItemTask;

  TQuestFlagTask = record
    Number    :Integer;
    FMessage :String;
  end;
  pTQuestFlagTask = ^TQuestFlagTask;


  TQuestInfo = class

  private
    _finishNpcIndex     :Integer;
  public
    Index               :Integer;
    NpcIndex            :Integer;
    Name                :string;
    Group               :string;
    QuestType           :Byte;
    FileName            :string;
    GotoMessage         :string;
    KillMessage         :string;
    ItemMessage         :string;
    FlagMessage         :string;
    RequiredMinLevel, RequiredMaxLevel, RequiredQuest  :Integer;
    RequiredClass       :Byte;

    Description         :TStringList;
    TaskDescription     :TStringList;
    CompletionDescription :TStringList;
    CarryItems          :TList;
    KillTasks           :TList;      //TQuestKillTask
    ItemTasks           :TList;      //TQuestItemTask
    FlagTasks           :TList;      //TQuestFlagTask
    GoldReward          :Integer;
    ExpReward           :Integer;
    CreditReward        :Integer;
    FixedRewards        :TList;
    SelectRewards       :TList;
    constructor Create();
    destructor Destroy; override;
    function  FinishNpcIndex (): integer;
  end;

implementation

constructor TQuestInfo.Create();
begin


end;

destructor TQuestInfo.Destroy;
begin

end;

function TQuestInfo.FinishNpcIndex(): integer;
begin
  if _finishNpcIndex = 0 then
    result := NpcIndex
  else Result := _finishNpcIndex;
end;

end.
