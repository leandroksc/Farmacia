unit uEnums;

interface

uses
  Aurelius.Mapping.Attributes;

type
  [Enumeration(TEnumMappingType.emInteger)]
  TProcedimentoTipo = (ptAtencaoFarmaceuticaDomiciliar, ptAfericaoParametrosFisiologicos, ptAfericaoParametrosBioquimicos,
                       ptAdministracaoMedicamentos);

  TProcedimentoTipoHelper = record helper for TProcedimentoTipo
  public
    function ToDescricao: string;
  end;

implementation

{ TProcedimentoTipoHelper }

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
