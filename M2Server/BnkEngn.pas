unit BnkEngn;

interface

uses
  {svn, }Windows,Classes,ObjBase,ObjNpc;

type
  TOpAction = (o_GetGold,o_SaveGold,o_ViewGold);
  TReQuestInfo = record
    NPC        :TMerchant;
    PlayObject  :TPlayObject;
    OpAction   :TOpAction;
    nGameGold  :Integer;
    sAccount   :String;
    sPassword  :String;
  end;
  pTReQuestInfo = ^TReQuestInfo;
  TBankEngine = class(TThread)
    m_UserReQuestList:TList;
    m_CompleteList:TList;
    m_CS:TRTLCriticalSection;
  private
    { Private declarations }
  protected
    procedure Execute; override;
  public
    constructor Create(CreateSuspended: Boolean);
    destructor Destroy; override;
    procedure Lock;
    procedure UnLock;
  end;

implementation

{ TBankEngine }

constructor TBankEngine.Create(CreateSuspended: Boolean);
begin
  inherited;
  InitializeCriticalSection(m_CS);
  m_UserReQuestList:=TList.Create;
  m_CompleteList:=TList.Create;
end;

destructor TBankEngine.Destroy;
begin
  m_UserReQuestList.Free;
  m_CompleteList.Free;
  DeleteCriticalSection(m_CS);
  inherited;
end;

procedure TBankEngine.Execute;
var
  I: Integer;
  ReQuestInfo:pTReQuestInfo;
begin
  while not Terminated do begin
    Lock;
    try

    finally
      UnLock;
    end;
    for I := 0 to m_UserReQuestList.Count - 1 do begin
      ReQuestInfo:=m_UserReQuestList.Items[I];
      case ReQuestInfo.OpAction of    //
        o_GetGold: ;
        o_SaveGold: ;
        o_ViewGold: ;
      end;
    end;
    Sleep(1);
  end;
end;

procedure TBankEngine.Lock;
begin
  EnterCriticalSection(m_CS);
end;

procedure TBankEngine.UnLock;
begin
  LeaveCriticalSection(m_CS);
end;

{---- Adjust global SVN revision ----}
initialization
  //SVNRevision('$Id: BnkEngn.pas 121 2006-08-06 01:10:41Z Dataforce $');
end.
