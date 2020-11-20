unit ConServico;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxClasses, dxLayoutContainer, dxLayoutControl, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, dxDateRanges, dxScrollbarAnnotations, Data.DB, cxDBData, cxGridLevel,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, dxLayoutcxEditAdapters,
  dxLayoutControlAdapters, cxContainer, Vcl.Menus, Vcl.StdCtrls, cxButtons, cxTextEdit, uPessoaController,
  Generics.Collections, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Aurelius.Bind.BaseDataset, Aurelius.Bind.Dataset, uServicoController, uEntities;

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
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EdtConsultaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure GridPacientesDBTableView1DblClick(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
  private
    { Private declarations }
    FController: TServicoController;
    procedure UpdateView;
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses
  CadServico;

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
  ADSServicos.Close;
  ADSServicos.SetSourceList(FController.ListarTodos {Buscar(EdtConsulta.Text)});
  ADSServicos.Open;
end;

end.
