unit QuestProgressInfo;

interface
uses
  Windows, Classes, SysUtils, StrUtils, DateUtils, SDK, IniFiles, Forms, ObjBase, QuestInfo, M2Share;

type
  TQuestProgressInfo = class
    Index          :integer;
    Quest          :TQuestInfo;
    StartDateTime  :TDateTime;
    EndDateTime    :TDateTime;
    KillTaskCount  :TList;
    ItemTaskCount  :TList;
    FlagTaskSet    :Tlist;
    TaskList       :TList;
  private

  public
    constructor Create();
    destructor Destroy; override;
    procedure QuestProgressInfo(index: integer);
    function CheckCompleted() :Boolean;
    procedure UpdateTasks();
    procedure UpdateKillTasks();
    procedure UpdateItemTasks();

  end;

implementation

constructor TQuestProgressInfo.Create();
begin

end;

destructor TQuestProgressInfo.Destroy;
begin

end;

procedure TQuestProgressInfo.QuestProgressInfo(index: integer);
var
  i, ii :integer;
  Questi :TQuestInfo;
begin
  for i := 0 to UserEngine.QuestInfoList.Count - 1 do begin
    Questi := TQuestInfo(UserEngine.QuestInfoList.Items[i]);
    if Questi <> nil then begin
      if Questi.Index = index then begin
        for ii := 0 to KillTaskCount.Count - 1 do begin
         //  KillTaskCount.Insert[ii, 0];
        end;
      end;
    end;
  end;
end;

function TQuestProgressInfo.CheckCompleted() :Boolean;
var
  canComplete: Boolean;
  i, II: integer;
begin
  UpdateTasks();

  canComplete := True;
  for i := 0 to Quest.KillTasks.Count - 1 do begin
    if (KillTaskCount[i] >= pTQuestKillTask(Quest.KillTasks.Items[i]).Count) then continue;
    canComplete := False;
  end;

  for i := 0 to Quest.ItemTasks.Count - 1 do begin
    if (ItemTaskCount[i] >= pTQuestItemTask(Quest.ItemTasks.Items[i]).Count) then continue;
    canComplete := False;
  end;

  for i := 0 to Quest.FlagTasks.Count - 1 do begin
    if (FlagTaskSet[i] >= pTQuestFlagTask(Quest.FlagTasks.Items[i]).Count) then continue;
    canComplete := False;
  end;

  if canComplete then  EndDateTime := Now;

  Result := canComplete;
end;

procedure TQuestProgressInfo.UpdateTasks();
begin
  TaskList := TList.Create;


  UpdateKillTasks();
  UpdateItemTasks();
end;

procedure TQuestProgressInfo.UpdateKillTasks();
begin

end;

procedure TQuestProgressInfo.UpdateItemTasks();
begin

end;

end.
