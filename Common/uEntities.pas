unit uEntities;

interface

uses
  Aurelius.Mapping.Attributes, uEnums, Generics.Collections, Aurelius.Types.Proxy, Aurelius.Types.Nullable;

type
  [Entity, Automapping]
  TPessoa = class
  private
    FId: Integer;
    FNome: string;
  public
    property Id: Integer read FId write FId;
    property Nome: string read FNome write FNome;
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
  TServico = class
  private
    FData: TDateTime;

    [Association([TAssociationProp.Required])]
    [JoinColumn('FARMACEUTICO_ID')]
    FFarmaceutico: TPessoa;

    [Association([], CascadeTypeAllButRemove)]
    [JoinColumn('PACIENTE_ID')]
    FPaciente: TPessoa;
    FObservacao: Nullable<string>;

    [ManyValuedAssociation([TAssociationProp.Required], CascadeTypeAllRemoveOrphan)]
    FProcedimentos: Proxy<TList<TProcedimento>>;
    FID: Integer;
    FPaciente_ID: Integer;
    function GetTotal: Currency;
    function GetProcedimentos: TList<TProcedimento>;
  public
    property ID: Integer read FID write FID;
    property Data: TDateTime read FData write FData;
    property Farmaceutico: TPessoa read FFarmaceutico write FFarmaceutico;
    property Paciente: TPessoa read FPaciente write FPaciente;

//    [Column('PACIENTE_ID')]
//    property Paciente_ID: Integer read FPaciente_ID write FPaciente_ID;
    property Observacao: Nullable<string> read FObservacao write FObservacao;
    property Procedimentos: TList<TProcedimento> read GetProcedimentos;
    property Total: Currency read GetTotal;

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

initialization
  RegisterEntity(TServico);
  RegisterEntity(TProcedimento);
  RegisterEntity(TPessoa);

end.
