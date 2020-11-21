unit uFarmaceuticoController;

interface

uses
  uInterfaces, uEntities, uServerContext, uBaseController, Generics.Collections;

type
  TFarmaceuticoController = class(TBaseController, IController<TFarmaceutico>)
  public
    procedure Salvar(const AObject: TFarmaceutico);
    procedure Excluir(const AObject: TFarmaceutico);
    function Buscar(const AFilter: string): TList<TFarmaceutico>;
  end;

implementation

uses
  System.SysUtils;

{ TFarmaceuticoController }

function TFarmaceuticoController.Buscar(const AFilter: string): TList<TFarmaceutico>;
var
  AQuery: string;
begin
  AQuery := '';
  if AFilter <> '' then
    AQuery := '$filter=contains(Nome, ' + QuotedStr(AFilter) + ')';
  Result := FServerContext.Client.List<TFarmaceutico>(AQuery);
end;

procedure TFarmaceuticoController.Excluir(const AObject: TFarmaceutico);
begin
  FServerContext.Client.Delete(AObject);
end;

procedure TFarmaceuticoController.Salvar(const AObject: TFarmaceutico);
begin
  AObject.Validar;
  if AObject.Id <> 0 then
    FServerContext.Client.Put(AObject)
  else
    FServerContext.Client.Post(AObject);
end;

end.
