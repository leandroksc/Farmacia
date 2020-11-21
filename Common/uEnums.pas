unit uEnums;

interface

uses
  Aurelius.Mapping.Attributes, Data.DB;

type
  [Enumeration(TEnumMappingType.emInteger)]
  TProcedimentoTipo = (ptAtencaoFarmaceuticaDomiciliar, ptAfericaoParametrosFisiologicos, ptAfericaoParametrosBioquimicos,
                       ptAdministracaoMedicamentos);

  TProcedimentoTipoHelper = record helper for TProcedimentoTipo
  public
    function ToDescricao: string;
    class procedure PreencheDataSet(ADataSet: TDataSet); static;
  end;

implementation

{ TProcedimentoTipoHelper }

class procedure TProcedimentoTipoHelper.PreencheDataSet(ADataSet: TDataSet);
var
  ATipo: TProcedimentoTipo;
begin
  for ATipo := Low(TProcedimentoTipo) to High(TProcedimentoTipo) do
  begin
    ADataSet.Append;
    ADataSet.FieldByName('ID').AsInteger       := Integer(ATipo);
    ADataSet.FieldByName('Descricao').AsString := ATipo.ToDescricao;
    ADataSet.Post;
  end;
end;

function TProcedimentoTipoHelper.ToDescricao: string;
begin
  case Self of
    ptAtencaoFarmaceuticaDomiciliar:  Result := 'Aten��o Farmac�utica Domiciliar';
    ptAfericaoParametrosFisiologicos: Result := 'Aferi��o de Par�metros Fisiol�gicos (Aferi��o de Press�o Arterial (PA) e Temperatura Corporal)';
    ptAfericaoParametrosBioquimicos:  Result := 'Aferi��o de Par�metros Bioqu�micos (Aferi��o de Glicemia Capilar)';
    ptAdministracaoMedicamentos:      Result := 'Administra��o de Medicamentos (Inala��o e Aplica��o de Injet�veis)';
  end;
end;

end.
