unit CadServico;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxClasses,
  dxLayoutContainer, dxLayoutControl, dxLayoutcxEditAdapters, cxContainer, cxEdit, cxTextEdit, dxLayoutControlAdapters,
  Vcl.Menus, Vcl.StdCtrls, cxButtons, cxLabel, Aurelius.Engine.ObjectManager, uServicoController,
  Vcl.ComCtrls, dxCore, cxDateUtils, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator, dxDateRanges,
  dxScrollbarAnnotations, Data.DB, cxDBData, cxGridLevel, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxMaskEdit, cxCalendar,
  cxMemo, uPessoaController, Generics.Collections, Aurelius.Bind.BaseDataset, Aurelius.Bind.Dataset,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Comp.DataSet, FireDAC.Comp.Client, cxCurrencyEdit, uEntities,
  Aurelius.Types.Nullable;

type
  TFrmCadServico = class(TForm)
    dxLayoutControl1Group_Root: TdxLayoutGroup;
    dxLayoutControl1: TdxLayoutControl;
    EdtID: TcxTextEdit;
    LiEdtID: TdxLayoutItem;
    BtnSalvar: TcxButton;
    LiBtnSalvar: TdxLayoutItem;
    BtnCancelar: TcxButton;
    LiBtnCancelar: TdxLayoutItem;
    dxLayoutGroup1: TdxLayoutGroup;
    dxLayoutSeparatorItem1: TdxLayoutSeparatorItem;
    cxLabel1: TcxLabel;
    dxLayoutItem1: TdxLayoutItem;
    GrupoContent: TdxLayoutGroup;
    EdtData: TcxDateEdit;
    dxLayoutItem2: TdxLayoutItem;
    LcbPaciente: TcxLookupComboBox;
    dxLayoutItem3: TdxLayoutItem;
    LcbFarmaceutico: TcxLookupComboBox;
    dxLayoutItem4: TdxLayoutItem;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    dxLayoutItem5: TdxLayoutItem;
    MemoObservacao: TcxMemo;
    dxLayoutItem6: TdxLayoutItem;
    LblTotal: TcxLabel;
    dxLayoutItem7: TdxLayoutItem;
    dxLayoutAutoCreatedGroup1: TdxLayoutAutoCreatedGroup;
    dxLayoutAutoCreatedGroup2: TdxLayoutAutoCreatedGroup;
    BtnNovoProcedimento: TcxButton;
    dxLayoutItem8: TdxLayoutItem;
    ADSPacientes: TAureliusDataset;
    ADSFarmaceuticos: TAureliusDataset;
    DSPacientes: TDataSource;
    DSFarmaceuticos: TDataSource;
    DSProcedimentos: TDataSource;
    cxGrid1DBTableView1Column1: TcxGridDBColumn;
    cxGrid1DBTableView1Column2: TcxGridDBColumn;
    cxGrid1DBTableView1Column3: TcxGridDBColumn;
    MemProcedimentoTipos: TFDMemTable;
    DSMemProcedimentoTipos: TDataSource;
    MemProcedimentoTiposID: TIntegerField;
    MemProcedimentoTiposDescricao: TStringField;
    MemProcedimentos: TFDMemTable;
    MemProcedimentosID: TIntegerField;
    MemProcedimentosDescricao: TStringField;
    MemProcedimentosTipo: TIntegerField;
    MemProcedimentosValor: TCurrencyField;
    MemPacientes: TFDMemTable;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnNovoProcedimentoClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    FController: TServicoController;
    FPacienteController: TPessoaController;
    FManager: TObjectManager;
    procedure Salvar;
    procedure LoadData;
  protected
    FServico: TServico;
  public
    class procedure Abrir; overload;
    class procedure Abrir(AServico: TServico); overload;
  end;

implementation

uses
  uEnums;

{$R *.dfm}

class procedure TFrmCadServico.Abrir(AServico: TServico);
var
  AForm: TFrmCadServico;
begin
  AForm := TFrmCadServico.Create(nil);
  AForm.FServico := AServico;
  AForm.Show;
end;

class procedure TFrmCadServico.Abrir;
begin
  Abrir(nil);
end;

procedure TFrmCadServico.BtnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmCadServico.BtnNovoProcedimentoClick(Sender: TObject);
begin
  MemProcedimentos.Append;
end;

procedure TFrmCadServico.BtnSalvarClick(Sender: TObject);
begin
  Salvar;
  Close;
end;

procedure TFrmCadServico.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmCadServico.FormCreate(Sender: TObject);
begin
//  FManager := TObjectManager.Create;
  FController := TServicoController.Create;
  FPacienteController := TPessoaController.Create;
end;

procedure TFrmCadServico.FormDestroy(Sender: TObject);
begin
//  FManager.Free;
end;

procedure TFrmCadServico.FormShow(Sender: TObject);
begin
  LoadData;
end;

procedure TFrmCadServico.LoadData;
var
  ATipo: TProcedimentoTipo;
  AProcedimento: TProcedimento;
  APessoas: TList<TPessoa>;
begin
  APessoas := FPacienteController.ListarTodos;
  try
//    ADSPacientes.Manager := FManager;
    ADSPacientes.SetSourceList(APessoas);
    ADSPacientes.Open;
  finally
//    APessoas.Free;
  end;

  {APessoas := FPacienteController.ListarTodos;
  try
    ADSFarmaceuticos.SetSourceList(APacientes);
    ADSFarmaceuticos.Open;
  finally
    APessoas.Free;
  end; }



  MemProcedimentos.Open;

  MemProcedimentoTipos.Open;
  for ATipo := Low(TProcedimentoTipo) to High(TProcedimentoTipo) do
  begin
    MemProcedimentoTipos.Append;
    MemProcedimentoTiposID.AsInteger       := Integer(ATipo);
    MemProcedimentoTiposDescricao.AsString := ATipo.ToDescricao;
    MemProcedimentoTipos.Post;
  end;

  if FServico <> nil then
  begin
    EdtID.Text   := FServico.ID.ToString;
    EdtData.Date := FServico.Data;
    if FServico.Paciente <> nil then
      LcbPaciente.EditValue := FServico.Paciente.Id;
    if FServico.Farmaceutico <> nil then
      LcbFarmaceutico.EditValue := FServico.Farmaceutico.Id;
    MemoObservacao.Lines.Text := FServico.Observacao.ValueOrDefault;

    for AProcedimento in FServico.Procedimentos do
    begin
      MemProcedimentos.Append;
      MemProcedimentosID.AsInteger       := AProcedimento.ID;
      MemProcedimentosDescricao.AsString := AProcedimento.Descricao;
      MemProcedimentosTipo.AsInteger     := Integer(AProcedimento.Tipo);
      MemProcedimentosValor.AsCurrency   := AProcedimento.Valor;
      MemProcedimentos.Post;
    end;
  end;
end;

procedure TFrmCadServico.Salvar;
var
  AProcedimento: TProcedimento;
begin
  if FServico = nil then
    FServico := TServico.Create;
  FServico.Data         := EdtData.Date;
  FServico.Farmaceutico := ADSFarmaceuticos.Current<TPessoa>;

//  FServico.Paciente := TPessoa.Create;
//  FServico.Paciente_Id := LcbPaciente.EditValue;

  FServico.Paciente     := ADSPacientes.Current<TPessoa>;
  if MemoObservacao.Lines.Count > 0 then
    FServico.Observacao := MemoObservacao.Lines.Text
  else
    FServico.Observacao := SNull;

  MemProcedimentos.First;
  while not MemProcedimentos.Eof do
  begin
    AProcedimento := TProcedimento.Create;
    AProcedimento.Descricao := MemProcedimentosDescricao.AsString;
    AProcedimento.Tipo      := TProcedimentoTipo(MemProcedimentosTipo.AsInteger);
    AProcedimento.Valor     := MemProcedimentosValor.AsFloat;
    FServico.Procedimentos.Add(AProcedimento);

    MemProcedimentos.Next;
  end;

  FController.Salvar(FServico);
end;

end.
