unit ConServico;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Vcl.Controls,
  Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxClasses, dxLayoutContainer, dxLayoutControl, cxEdit, Data.DB,
  cxGridLevel, cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, cxContainer,
  Vcl.Menus, Vcl.StdCtrls, cxButtons, cxTextEdit, Generics.Collections, Aurelius.Bind.BaseDataset, Aurelius.Bind.Dataset,
  uServicoController, uEntities, cxLookAndFeels,cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxNavigator, dxDateRanges,dxScrollbarAnnotations, cxDBData, dxLayoutcxEditAdapters,
  dxLayoutControlAdapters;

type
  TFrmConServico = class(TForm)
    dxLayoutControl1Group_Root: TdxLayoutGroup;
    dxLayoutControl1: TdxLayoutControl;
    GridPacientesDBTableView1: TcxGridDBTableView;
    GridPacientesLevel1: TcxGridLevel;
    GridPacientes: TcxGrid;
    dxLayoutItem1: TdxLayoutItem;
    EdtConsulta: TcxTextEdit;
    dxLayoutItem2: TdxLayoutItem;
    cxButton1: TcxButton;
    dxLayoutItem3: TdxLayoutItem;
    dxLayoutAutoCreatedGroup1: TdxLayoutAutoCreatedGroup;
    DSServicos: TDataSource;
    GridPacientesDBTableView1ID: TcxGridDBColumn;
    GridPacientesDBTableView1Nome: TcxGridDBColumn;
    ADSServicos: TAureliusDataset;
    ADSServicosPacienteNome: TStringField;
    ADSServicosID: TIntegerField;
    ADSServicosFarmaceuticoNome: TStringField;
    GridPacientesDBTableView1FarmaceuticoNome: TcxGridDBColumn;
    BtnBuscar: TcxButton;
    dxLayoutItem4: TdxLayoutItem;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EdtConsultaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure GridPacientesDBTableView1DblClick(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure BtnBuscarClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    FController: TServicoController;
    FLista: TList<TServico>;
    procedure UpdateView;
  public
  end;

implementation

{$R *.dfm}

uses
  CadServico;

procedure TFrmConServico.BtnBuscarClick(Sender: TObject);
begin
  UpdateView;
end;

procedure TFrmConServico.cxButton1Click(Sender: TObject);
begin
  TFrmCadServico.Abrir;
end;

procedure TFrmConServico.EdtConsultaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
    UpdateView;
end;

procedure TFrmConServico.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmConServico.FormCreate(Sender: TObject);
begin
  FController := TServicoController.Create;
end;

procedure TFrmConServico.FormDestroy(Sender: TObject);
begin
  FLista.Free;
  FController.Free;
end;

procedure TFrmConServico.FormShow(Sender: TObject);
begin
  UpdateView;
end;

procedure TFrmConServico.GridPacientesDBTableView1DblClick(Sender: TObject);
begin
  TFrmCadServico.Abrir(ADSServicos.Current<TServico>);
end;

procedure TFrmConServico.UpdateView;
begin
  FreeAndNil(FLista);
  FLista := FController.Buscar(EdtConsulta.Text);
  ADSServicos.Close;
  ADSServicos.SetSourceList(FLista);
  ADSServicos.Open;
end;

end.
