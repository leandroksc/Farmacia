unit CadServico;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Vcl.Controls,
  Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxClasses, dxLayoutContainer, dxLayoutControl, cxContainer, cxEdit,
  cxTextEdit, Vcl.Menus, Vcl.StdCtrls, cxButtons, cxLabel, uServicoController, Vcl.ComCtrls, Data.DB, cxGridLevel,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, cxMaskEdit, cxCalendar, cxMemo, uPacienteController, Generics.Collections,
  Aurelius.Bind.BaseDataset, Aurelius.Bind.Dataset, FireDAC.Comp.DataSet, FireDAC.Comp.Client, uEntities,
  Aurelius.Types.Nullable, uFarmaceuticoController, cxLookAndFeels, cxLookAndFeelPainters, dxCore, cxDateUtils,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator, dxDateRanges, dxScrollbarAnnotations, cxDBData,
  cxCurrencyEdit, dxLayoutcxEditAdapters, dxLayoutControlAdapters, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf;

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
    ADSProcedimentos: TAureliusDataset;
    dxLayoutItem9: TdxLayoutItem;
    BtnExcluirProcedimento: TcxButton;
    dxLayoutAutoCreatedGroup3: TdxLayoutAutoCreatedGroup;
    dxLayoutItem10: TdxLayoutItem;
    BtnExcluir: TcxButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnNovoProcedimentoClick(Sender: TObject);
    procedure BtnExcluirProcedimentoClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ADSProcedimentosAfterPost(DataSet: TDataSet);
    procedure ADSProcedimentosAfterDelete(DataSet: TDataSet);
  private
    FController: TServicoController;
    FPacienteController: TPacienteController;
    FFarmaceuticoController: TFarmaceuticoController;
    FPacientes: TList<TPaciente>;
    FFarmaceuticos: TList<TFarmaceutico>;
    FOwnsObject: Boolean;
    procedure Salvar;
    procedure LoadData;
    procedure UpdateTotal;
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

procedure TFrmCadServico.ADSProcedimentosAfterDelete(DataSet: TDataSet);
begin
  UpdateTotal;
end;

procedure TFrmCadServico.ADSProcedimentosAfterPost(DataSet: TDataSet);
begin
  UpdateTotal;
end;

procedure TFrmCadServico.BtnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmCadServico.BtnExcluirClick(Sender: TObject);
begin
  FController.Excluir(FServico);
  Close;
end;

procedure TFrmCadServico.BtnExcluirProcedimentoClick(Sender: TObject);
begin
  ADSProcedimentos.Delete;
end;

procedure TFrmCadServico.BtnNovoProcedimentoClick(Sender: TObject);
begin
  ADSProcedimentos.Append;
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
  FController := TServicoController.Create;
  FPacienteController := TPacienteController.Create;
  FFarmaceuticoController := TFarmaceuticoController.Create;
end;

procedure TFrmCadServico.FormDestroy(Sender: TObject);
begin
  if FOwnsObject then
    FServico.Free;
  FFarmaceuticoController.Free;
  FPacienteController.Free;
  FController.Free;
  FPacientes.Free;
  FFarmaceuticos.Free;
end;

procedure TFrmCadServico.FormShow(Sender: TObject);
begin
  LoadData;
  BtnExcluir.Enabled := FServico.ID <> 0;
end;

procedure TFrmCadServico.LoadData;
begin
  if FServico = nil then
  begin
    FServico := TServico.Create;
    FOwnsObject := True;
  end;

  MemProcedimentoTipos.Open;
  TProcedimentoTipo.PreencheDataSet(MemProcedimentoTipos);

  FPacientes := FPacienteController.Buscar('');
  ADSPacientes.SetSourceList(FPacientes);
  ADSPacientes.Open;

  FFarmaceuticos := FFarmaceuticoController.Buscar('');
  ADSFarmaceuticos.SetSourceList(FFarmaceuticos);
  ADSFarmaceuticos.Open;

  if FServico.ID <> 0 then
    EdtID.Text := FServico.ID.ToString;
  if FServico.Data <> 0 then
    EdtData.Date := FServico.Data;
  if FServico.Paciente <> nil then
    LcbPaciente.EditValue := FServico.Paciente.Id;
  if FServico.Farmaceutico <> nil then
    LcbFarmaceutico.EditValue := FServico.Farmaceutico.Id;
  MemoObservacao.Lines.Text := FServico.Observacao.ValueOrDefault;

  ADSProcedimentos.SetSourceList(FServico.Procedimentos);
  ADSProcedimentos.Open;
  UpdateTotal;
end;

procedure TFrmCadServico.Salvar;
begin
  if ADSProcedimentos.State in dsEditModes then
    ADSProcedimentos.Post;

  FServico.Data         := EdtData.Date;
  FServico.Farmaceutico := ADSFarmaceuticos.Current<TFarmaceutico>;
  FServico.Paciente     := ADSPacientes.Current<TPaciente>;
  if MemoObservacao.Lines.Count > 0 then
    FServico.Observacao := MemoObservacao.Lines.Text
  else
    FServico.Observacao := SNull;

  try
    FController.Salvar(FServico);
  except
    on E:Exception do
    begin
      ShowMessage(E.Message);
      Abort;
    end;
  end;
end;

procedure TFrmCadServico.UpdateTotal;
begin
  LblTotal.Caption := FormatFloat('R$ 0.00', FServico.Total);
end;

end.
