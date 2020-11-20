unit uServerContext;

interface

uses
  System.SysUtils, System.Classes, REST.Types, REST.Client, Data.Bind.Components, Data.Bind.ObjectScope, Data.DB,
  RemoteDB.Client.Dataset, Aurelius.Engine.ObjectManager, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, FireDAC.Comp.Client, Aurelius.Comp.Connection,
  Aurelius.Sql.MySQL, Aurelius.Schema.MySQL, Aurelius.Drivers.FireDac, Aurelius.Engine.DataBaseManager,
  XData.Client;

type
  TServerContext = class(TDataModule)
    AureliusConnection1: TAureliusConnection;
    FDConnection1: TFDConnection;
    FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    FManager: TObjectManager;
    FAdapter: TFireDacConnectionAdapter;
    FClient: TXDataClient;
    class var FInstance: TServerContext;
  public
//    property Adapter: TFireDacConnectionAdapter read FAdapter;
//    property Manager: TObjectManager read FManager write FManager;
    property Client: TXDataClient read FClient;
    procedure UpdateDataBase;
    class function GetInstance: TServerContext;
    class procedure ReleaseInstance;
  end;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TServerContext }

procedure TServerContext.DataModuleCreate(Sender: TObject);
begin
  FClient := TXDataClient.Create;
  FClient.Uri := 'http://localhost:2001/tms/xdata/';


//  FClient.

  FAdapter := TFireDacConnectionAdapter.Create(FDConnection1, False);
end;

procedure TServerContext.DataModuleDestroy(Sender: TObject);
begin
  FClient.Free;
end;

class function TServerContext.GetInstance: TServerContext;
begin
  if FInstance = nil then
    FInstance := TServerContext.Create(nil);
  Result := FInstance;
end;

class procedure TServerContext.ReleaseInstance;
begin
  FreeAndNil(FInstance);
end;

procedure TServerContext.UpdateDataBase;
begin
  TDatabaseManager.Update(FAdapter);
end;

end.
