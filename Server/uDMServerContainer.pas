unit uDMServerContainer;

interface

uses
  System.SysUtils, System.Classes, Sparkle.HttpServer.Module,
  Sparkle.HttpServer.Context, Sparkle.Comp.Server,
  Sparkle.Comp.HttpSysDispatcher, Aurelius.Drivers.Interfaces,
  Aurelius.Comp.Connection, XData.Comp.ConnectionPool, XData.Server.Module,
  XData.Comp.Server, Aurelius.Sql.MySQL, Aurelius.Schema.MySQL, Aurelius.Drivers.FireDac, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, Aurelius.Engine.ObjectManager, Aurelius.Linq, Aurelius.Comp.Manager, Aurelius.Events.Manager,
  Aurelius.Comp.ModelEvents, XData.Module.Events, Aurelius.Engine.DataBaseManager;

type
  TSQLExecuteEvent = procedure(Sender: TObject; const ASQL: string) of object;

  TServerContainer = class(TDataModule)
    SparkleHttpSysDispatcher: TSparkleHttpSysDispatcher;
    XDataServer: TXDataServer;
    XDataConnectionPool: TXDataConnectionPool;
    AureliusConnection: TAureliusConnection;
    Banco: TFDConnection;
    AureliusModelEvents1: TAureliusModelEvents;
    procedure AureliusModelEvents1SQLExecuting(Sender: TObject; Args: TSQLExecutingArgs);
    procedure XDataServerEntityModifying(Sender: TObject; Args: TEntityModifyingArgs);
    procedure XDataServerEntityInserting(Sender: TObject; Args: TEntityInsertingArgs);
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    FOnSQLExecute: TSQLExecuteEvent;
    FAdapter: TFireDacConnectionAdapter;
    procedure DoValidateEntity(Args: TXDataEntityArgs);
  public
    property OnSQLExecute: TSQLExecuteEvent read FOnSQLExecute write FOnSQLExecute;
    procedure UpdateDataBase;
  end;

var
  ServerContainer: TServerContainer;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

uses
  uInterfaces;

procedure TServerContainer.AureliusModelEvents1SQLExecuting(Sender: TObject; Args: TSQLExecutingArgs);
begin
  if Assigned(FOnSQLExecute) then
    FOnSQLExecute(Sender, Args.SQL);
end;

procedure TServerContainer.UpdateDataBase;
begin
  TDatabaseManager.Update(FAdapter);
end;

procedure TServerContainer.DataModuleCreate(Sender: TObject);
begin
  FAdapter := TFireDacConnectionAdapter.Create(Banco, False);
end;

procedure TServerContainer.DataModuleDestroy(Sender: TObject);
begin
  FAdapter.Free;
end;

procedure TServerContainer.DoValidateEntity(Args: TXDataEntityArgs);
var
  [Weak] AObj: IValidable;
begin
  try
    if Supports(Args.Entity, IValidable, AObj) then
      AObj.Validar;
  except
    on E:Exception do
    begin
      Args.Handler.SendErrorResponse(412, '', E.Message);
      Abort;
    end;
  end;
end;

procedure TServerContainer.XDataServerEntityInserting(Sender: TObject; Args: TEntityInsertingArgs);
begin
  DoValidateEntity(Args);
end;

procedure TServerContainer.XDataServerEntityModifying(Sender: TObject; Args: TEntityModifyingArgs);
begin
  DoValidateEntity(Args);
end;

end.
