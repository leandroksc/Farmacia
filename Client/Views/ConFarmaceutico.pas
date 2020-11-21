unit ConFarmaceutico;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Vcl.Controls,
  Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxClasses, dxLayoutContainer, dxLayoutControl, cxEdit, Data.DB,
  cxGridLevel, cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, cxContainer,
  Vcl.Menus, Vcl.StdCtrls, cxButtons, cxTextEdit, uFarmaceuticoController, uEntities, Generics.Collections,
  Aurelius.Bind.BaseDataset, Aurelius.Bind.Dataset, cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxNavigator, dxDateRanges, dxScrollbarAnnotations, cxDBData, dxLayoutcxEditAdapters,
  dxLayoutControlAdapters;

type
  TFrmConFarmaceutico = class(TForm)
    dxLayoutControl1Group_Root: TdxLayoutGroup;
    dxLayoutControl1: TdxLayoutControl;
    GridFarmaceuticosDBTableView1: TcxGridDBTableView;
    GridFarmaceuticosLevel1: TcxGridLevel;
    GridFarmaceuticos: TcxGrid;
    dxLayoutItem1: TdxLayoutItem;
    EdtConsulta: TcxTextEdit;
    dxLayoutItem2: TdxLayoutItem;
    cxButton1: TcxButton;
    dxLayoutItem3: TdxLayoutItem;
    dxLayoutAutoCreatedGroup1: TdxLayoutAutoCreatedGroup;
    DSFarmaceuticos: TDataSource;
    GridFarmaceuticosDBTableView1ID: TcxGridDBColumn;
    GridFarmaceuticosDBTableView1Nome: TcxGridDBColumn;
    ADSFarmaceuticos: TAureliusDataset;
    dxLayoutItem4: TdxLayoutItem;
    BtnBuscar: TcxButton;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EdtConsultaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure GridFarmaceuticosDBTableView1DblClick(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure BtnBuscarClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    FController: TFarmaceuticoController;
    FLista: TList<TFarmaceutico>;
    procedure UpdateView;
  public
  end;

implementation

{$R *.dfm}

uses
  CadFarmaceutico;

procedure TFrmConFarmaceutico.BtnBuscarClick(Sender: TObject);
begin
  UpdateView;
end;

procedure TFrmConFarmaceutico.cxButton1Click(Sender: TObject);
begin
  TFrmCadFarmaceutico.Abrir;
end;

procedure TFrmConFarmaceutico.EdtConsultaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
    UpdateView;
end;

procedure TFrmConFarmaceutico.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmConFarmaceutico.FormCreate(Sender: TObject);
begin
  FController := TFarmaceuticoController.Create;
end;

procedure TFrmConFarmaceutico.FormDestroy(Sender: TObject);
begin
  FController.Free;
  FLista.Free;
end;

procedure TFrmConFarmaceutico.FormShow(Sender: TObject);
begin
  UpdateView;
end;

procedure TFrmConFarmaceutico.GridFarmaceuticosDBTableView1DblClick(Sender: TObject);
begin
  TFrmCadFarmaceutico.Abrir(ADSFarmaceuticos.Current<TFarmaceutico>);
end;

procedure TFrmConFarmaceutico.UpdateView;
begin
  FreeAndNil(FLista);
  FLista := FController.Buscar(EdtConsulta.Text);
  ADSFarmaceuticos.Close;
  ADSFarmaceuticos.SetSourceList(FLista);
  ADSFarmaceuticos.Open;
end;

end.
