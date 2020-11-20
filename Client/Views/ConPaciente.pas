unit ConPaciente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxClasses, dxLayoutContainer, dxLayoutControl, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, dxDateRanges, dxScrollbarAnnotations, Data.DB, cxDBData, cxGridLevel,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, dxLayoutcxEditAdapters,
  dxLayoutControlAdapters, cxContainer, Vcl.Menus, Vcl.StdCtrls, cxButtons, cxTextEdit, uPessoaController,
  uEntities, Generics.Collections, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Aurelius.Bind.BaseDataset, Aurelius.Bind.Dataset;

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
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EdtConsultaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure GridPacientesDBTableView1DblClick(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
  private
    { Private declarations }
    FController: TPessoaController;
    procedure UpdateView;
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses
  CadPaciente;

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
  FController := TPessoaController.Create;
end;

procedure TFrmConPaciente.FormShow(Sender: TObject);
begin
  UpdateView;
end;

procedure TFrmConPaciente.GridPacientesDBTableView1DblClick(Sender: TObject);
begin
  TFrmCadPaciente.Abrir(ADSPacientes.Current<TPessoa>);
end;

procedure TFrmConPaciente.UpdateView;
begin
  ADSPacientes.Close;
  ADSPacientes.SetSourceList(FController.Buscar(EdtConsulta.Text));
  ADSPacientes.Open;
end;

end.
