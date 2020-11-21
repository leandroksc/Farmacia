unit uServerContext;

interface

uses
  System.SysUtils, System.Classes, REST.Types, Data.Bind.Components, Data.Bind.ObjectScope, Data.DB,

  FireDAC.Phys,
  FireDAC.Phys.MySQL, FireDAC.Comp.Client, Aurelius.Comp.Connection,
  Aurelius.Drivers.FireDac, XData.Client, Aurelius.Sql.MySQL, Aurelius.Schema.MySQL, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait;

type
  TServerContext = class(TDataModule)
    AureliusConnection1: TAureliusConnection;
    FDConnection1: TFDConnection;
    FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    FClient: TXDataClient;
    class var FInstance: TServerContext;
  public
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

end;

initialization

finalization
  TServerContext.ReleaseInstance;

end.
