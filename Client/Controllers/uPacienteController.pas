unit uPacienteController;

interface

uses
  uInterfaces, uEntities, uServerContext, uBaseController, Generics.Collections;

type
  TPacienteController = class(TBaseController, IController<TPaciente>)
  public
    procedure Salvar(const AObject: TPaciente);
    procedure Excluir(const AObject: TPaciente);
    function Buscar(const AFilter: string): TList<TPaciente>;
  end;

implementation

uses
  System.SysUtils;

{ TPacienteController }

function TPacienteController.Buscar(const AFilter: string): TList<TPaciente>;
var
  AQuery: string;
begin
  AQuery := '';
  if AFilter <> '' then
    AQuery := '$filter=contains(Nome, ' + QuotedStr(AFilter) + ')';
  Result := FServerContext.Client.List<TPaciente>(AQuery);
end;

procedure TPacienteController.Excluir(const AObject: TPaciente);
begin
  FServerContext.Client.Delete(AObject);
end;

procedure TPacienteController.Salvar(const AObject: TPaciente);
begin
  AObject.Validar;
  if AObject.Id <> 0 then
    FServerContext.Client.Put(AObject)
  else
    FServerContext.Client.Post(AObject);
end;

end.
