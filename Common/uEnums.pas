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
    ptAtencaoFarmaceuticaDomiciliar:  Result := 'Atenção Farmacêutica Domiciliar';
    ptAfericaoParametrosFisiologicos: Result := 'Aferição de Parâmetros Fisiológicos (Aferição de Pressão Arterial (PA) e Temperatura Corporal)';
    ptAfericaoParametrosBioquimicos:  Result := 'Aferição de Parâmetros Bioquímicos (Aferição de Glicemia Capilar)';
    ptAdministracaoMedicamentos:      Result := 'Administração de Medicamentos (Inalação e Aplicação de Injetáveis)';
  end;
end;

end.
