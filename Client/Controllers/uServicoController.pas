unit uServicoController;

interface

uses
  uInterfaces, uEntities, uServerContext, uBaseController, Generics.Collections,
  SysUtils;

type
  TServicoController = class(TBaseController, IController<TServico>)
  public
    procedure Salvar(const AObject: TServico);
    procedure Excluir(const AObject: TServico);
    function Buscar(const AFilter: string): TList<TServico>;
  end;

implementation

{ TServicoController }

function TServicoController.Buscar(const AFilter: string): TList<TServico>;
var
  AQuery: string;
begin
  AQuery := '$expand=Paciente&$expand=Farmaceutico&$expand=Procedimentos';
  if AFilter <> '' then
    AQuery := AQuery + '&$filter=contains(Paciente/Nome, ' + QuotedStr(AFilter) + ') ' +
                       'or contains(Farmaceutico/Nome, ' +  QuotedStr(AFilter) + ')';
  Result := FServerContext.Client.List<TServico>(AQuery);
end;

procedure TServicoController.Excluir(const AObject: TServico);
begin
  FServerContext.Client.Delete(AObject);
end;

procedure TServicoController.Salvar(const AObject: TServico);
begin
  AObject.Validar;
  if AObject.Id <> 0 then
    FServerContext.Client.Put(AObject)
  else
    FServerContext.Client.Post(AObject);
end;

end.
