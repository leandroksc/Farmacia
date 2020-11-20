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
    ptAtencaoFarmaceuticaDomiciliar:  Result := 'Aten��o Farmac�utica Domiciliar';
    ptAfericaoParametrosFisiologicos: Result := 'Aferi��o de Par�metros Fisiol�gicos (Aferi��o de Press�o Arterial (PA) e Temperatura Corporal)';
    ptAfericaoParametrosBioquimicos:  Result := 'Aferi��o de Par�metros Bioqu�micos (Aferi��o de Glicemia Capilar)';
    ptAdministracaoMedicamentos:      Result := 'Administra��o de Medicamentos (Inala��o e Aplica��o de Injet�veis)';
  end;
end;

end.
