unit ConPaciente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Vcl.Controls,
  Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxClasses, dxLayoutContainer, dxLayoutControl, Data.DB, cxGridLevel,
  cxGridDBTableView, cxGrid, Vcl.Menus, cxButtons, cxTextEdit, uPacienteController, uEntities, Generics.Collections,
  Aurelius.Bind.BaseDataset, Aurelius.Bind.Dataset, cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, dxDateRanges, dxScrollbarAnnotations, cxDBData, cxContainer,
  dxLayoutcxEditAdapters, dxLayoutControlAdapters, Vcl.StdCtrls, cxGridCustomTableView, cxGridTableView,
  cxGridCustomView;

type
  TFrmConPaciente = class(TForm)
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
    DSMemPacientes: TDataSource;
    GridPacientesDBTableView1ID: TcxGridDBColumn;
    GridPacientesDBTableView1Nome: TcxGridDBColumn;
    ADSPacientes: TAureliusDataset;
    dxLayoutItem4: TdxLayoutItem;
    BtnBuscar: TcxButton;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EdtConsultaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure GridPacientesDBTableView1DblClick(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure BtnBuscarClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    FController: TPacienteController;
    FLista: TList<TPaciente>;
    procedure UpdateView;
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses
  CadPaciente;

procedure TFrmConPaciente.BtnBuscarClick(Sender: TObject);
begin
  UpdateView;
end;

procedure TFrmConPaciente.cxButton1Click(Sender: TObject);
begin
  TFrmCadPaciente.Abrir;
end;

procedure TFrmConPaciente.EdtConsultaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
    UpdateView;
end;

procedure TFrmConPaciente.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmConPaciente.FormCreate(Sender: TObject);
begin
  FController := TPacienteController.Create;
end;

procedure TFrmConPaciente.FormDestroy(Sender: TObject);
begin
  FController.Free;
  FLista.Free;
end;

procedure TFrmConPaciente.FormShow(Sender: TObject);
begin
  UpdateView;
end;

procedure TFrmConPaciente.GridPacientesDBTableView1DblClick(Sender: TObject);
begin
  TFrmCadPaciente.Abrir(ADSPacientes.Current<TPaciente>);
end;

procedure TFrmConPaciente.UpdateView;
begin
  FreeAndNil(FLista);
  FLista := FController.Buscar(EdtConsulta.Text);
  ADSPacientes.Close;
  ADSPacientes.SetSourceList(FLista);
  ADSPacientes.Open;
end;

end.
