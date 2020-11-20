unit uPessoaController;

interface

uses
  uInterfaces, uEntities, uServerContext, uBaseController, Generics.Collections, Aurelius.Criteria.Linq;

type
  TPessoaController = class(TBaseController, IController<TPessoa>)
  public
    procedure Salvar(const AObject: TPessoa);
    procedure Excluir(const AObject: TPessoa);
    function Buscar(const AFilter: string): TList<TPessoa>;
    function ListarTodos: TList<TPessoa>;
  end;

implementation

uses
  System.SysUtils;

{ TPacienteController }

function TPessoaController.Buscar(const AFilter: string): TList<TPessoa>;
begin
  Result := FServerContext.Client.List<TPessoa>;//('$filter=Nome eq ' + QuotedStr(AFilter));
//  Result := FManager.Find<TPessoa>
//              .Where(
//                Linq['Nome'].Contains(AFilter)
//              ).OrderBy('Nome')
//              .List;
end;

procedure TPessoaController.Excluir(const AObject: TPessoa);
begin
  FServerContext.Client.Delete(AObject);
end;

function TPessoaController.ListarTodos: TList<TPessoa>;
begin
  Result := FServerContext.Client.List<TPessoa>;
end;

procedure TPessoaController.Salvar(const AObject: TPessoa);
begin
  if AObject.Id <> 0 then
    FServerContext.Client.Put(AObject)
  else
    FServerContext.Client.Post(AObject);
end;

end.
