unit uServicoController;

interface

uses
  uInterfaces, uEntities, uServerContext, uBaseController, Generics.Collections, Aurelius.Criteria.Linq;

type
  TServicoController = class(TBaseController, IController<TServico>)
  public
    procedure Salvar(const AObject: TServico);
    procedure Excluir(const AObject: TServico);
    function Buscar(const AFilter: string): TList<TServico>;
    function ListarTodos: TList<TServico>;
  end;

implementation

{ TServicoController }

function TServicoController.Buscar(const AFilter: string): TList<TServico>;
begin
  {Result := FManager.Find<TServico>
              .CreateAlias('Paciente', 'p')
              .Add(
                //Linq['Nome'].Contains(AFilter) or
                Linq['p.Nome'].Contains(AFilter)
              )
              .OrderBy('p.Nome')
              .List; }
end;

procedure TServicoController.Excluir(const AObject: TServico);
begin
  FServerContext.Client.Delete(AObject);
end;

function TServicoController.ListarTodos: TList<TServico>;
begin
  Result := FServerContext.Client.List<TServico>('$expand=Paciente&$expand=Farmaceutico&$expand=Procedimentos');
end;

procedure TServicoController.Salvar(const AObject: TServico);
begin
  if AObject.Id <> 0 then
    FServerContext.Client.Put(AObject)
  else
    FServerContext.Client.Post(AObject);
end;

end.
