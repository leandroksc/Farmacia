unit uEntities;

interface

uses
  Aurelius.Mapping.Attributes, uEnums, Generics.Collections, Aurelius.Types.Proxy, Aurelius.Types.Nullable, 
  System.SysUtils, uInterfaces;

type
  [Entity, Automapping]
  TPaciente = class(TInterfacedObject, IValidable)
  private
    FId: Integer;
    FNome: string;
  public
    property Id: Integer read FId write FId;
    property Nome: string read FNome write FNome;
    procedure Validar;
  end;

  [Entity, Automapping]
  TFarmaceutico = class(TInterfacedObject, IValidable)
  private
    FId: Integer;
    FNome: string;
  public
    property Id: Integer read FId write FId;
    property Nome: string read FNome write FNome;
    procedure Validar;
  end;

  [Entity, Automapping]
  TProcedimento = class
  private
    FDescricao: string;
    FTipo: TProcedimentoTipo;
    FValor: Currency;
    FID: Integer;
  public
    property ID: Integer read FID write FID;
    property Descricao: string read FDescricao write FDescricao;
    property Tipo: TProcedimentoTipo read FTipo write FTipo;
    property Valor: Currency read FValor write FValor;
  end;

  [Entity, Automapping]
  TServico = class(TInterfacedObject, IValidable)
  private
    FData: TDateTime;
    FObservacao: Nullable<string>;
    FFarmaceutico: TFarmaceutico;
    FPaciente: TPaciente;
    FProcedimentos: Proxy<TList<TProcedimento>>;
    FID: Integer;
    function GetTotal: Currency;
    function GetProcedimentos: TList<TProcedimento>;
  public
    property ID: Integer read FID write FID;
    property Data: TDateTime read FData write FData;
    property Total: Currency read GetTotal;
    property Observacao: Nullable<string> read FObservacao write FObservacao;
    property Farmaceutico: TFarmaceutico read FFarmaceutico write FFarmaceutico;
    property Paciente: TPaciente read FPaciente write FPaciente;
    [ManyValuedAssociation([TAssociationProp.Required], CascadeTypeAllRemoveOrphan)]
    property Procedimentos: TList<TProcedimento> read GetProcedimentos;

    procedure Validar;

    constructor Create;
    destructor Destroy; override;
  end;

implementation

{ TServico }

constructor TServico.Create;
begin
  FProcedimentos.SetInitialValue(TList<TProcedimento>.Create);
end;

destructor TServico.Destroy;
begin
  FProcedimentos.DestroyValue;
  inherited;
end;

function TServico.GetProcedimentos: TList<TProcedimento>;
begin
  Result := FProcedimentos.Value;
end;

function TServico.GetTotal: Currency;
var
  AProc: TProcedimento;
begin
  Result := 0;
  for AProc in FProcedimentos.Value do
    Result := Result + AProc.Valor;
end;

procedure TServico.Validar;
begin
  if FData <= 0 then
    raise Exception.Create('Data Inválida. Preencha uma Data');
  if (FPaciente = nil) or (FPaciente.Id = 0) then
    raise Exception.Create('Paciente não informado ou inválido');
  if (FFarmaceutico = nil) or (FFarmaceutico.Id = 0) then
    raise Exception.Create('Farmacêutico não informado ou inválido');
  if FProcedimentos.Value.Count = 0 then
    raise Exception.Create('Nenhum procedimento informado. Defina pelo menos 1 procedimento');
end;

{ TPaciente }

procedure TPaciente.Validar;
begin
  if FNome = '' then
    raise Exception.Create('Nome não informado');
end;

{ TFarmaceutico }

procedure TFarmaceutico.Validar;
begin
  if FNome = '' then
    raise Exception.Create('Nome não informado');
end;

initialization
  RegisterEntity(TServico);
  RegisterEntity(TProcedimento);
  RegisterEntity(TPaciente);
  RegisterEntity(TFarmaceutico);

end.

