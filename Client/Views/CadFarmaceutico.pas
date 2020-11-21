unit CadFarmaceutico;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Vcl.Controls,
  Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxClasses, dxLayoutContainer, dxLayoutControl, cxContainer, cxEdit,
  cxTextEdit, Vcl.Menus, Vcl.StdCtrls, cxButtons, cxLabel, uFarmaceuticoController, uEntities, cxLookAndFeels,
  cxLookAndFeelPainters, dxLayoutcxEditAdapters, dxLayoutControlAdapters;

type
  TFrmCadFarmaceutico = class(TForm)
    dxLayoutControl1Group_Root: TdxLayoutGroup;
    dxLayoutControl1: TdxLayoutControl;
    EdtNome: TcxTextEdit;
    LiEdtNome: TdxLayoutItem;
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
    dxLayoutItem2: TdxLayoutItem;
    BtnExcluir: TcxButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    FController: TFarmaceuticoController;
    FOwnsObject: Boolean;
    procedure LoadData;
    procedure Salvar;
  protected
    FFarmaceutico: TFarmaceutico;
  public
    class procedure Abrir; overload;
    class procedure Abrir(AFarmaceutico: TFarmaceutico); overload;
  end;

implementation

{$R *.dfm}

class procedure TFrmCadFarmaceutico.Abrir(AFarmaceutico: TFarmaceutico);
var
  AForm: TFrmCadFarmaceutico;
begin
  AForm := TFrmCadFarmaceutico.Create(nil);
  AForm.FFarmaceutico := AFarmaceutico;
  AForm.Show;
end;

class procedure TFrmCadFarmaceutico.Abrir;
begin
  Abrir(nil);
end;

procedure TFrmCadFarmaceutico.BtnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmCadFarmaceutico.BtnExcluirClick(Sender: TObject);
begin
  FController.Excluir(FFarmaceutico);
  Close;
end;

procedure TFrmCadFarmaceutico.BtnSalvarClick(Sender: TObject);
begin
  Salvar;
  Close;
end;

procedure TFrmCadFarmaceutico.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmCadFarmaceutico.FormCreate(Sender: TObject);
begin
  FController := TFarmaceuticoController.Create;
end;

procedure TFrmCadFarmaceutico.FormDestroy(Sender: TObject);
begin
  FController.Free;
  if FOwnsObject then
    FFarmaceutico.Free;
end;

procedure TFrmCadFarmaceutico.FormShow(Sender: TObject);
begin
  LoadData;
end;

procedure TFrmCadFarmaceutico.Salvar;
begin
  FFarmaceutico.Nome := EdtNome.Text;
  FController.Salvar(FFarmaceutico);
end;

procedure TFrmCadFarmaceutico.LoadData;
begin
  if FFarmaceutico = nil then
  begin
    FFarmaceutico := TFarmaceutico.Create;
    FOwnsObject := True;
  end;
  BtnExcluir.Enabled := FFarmaceutico.Id <> 0;
  if FFarmaceutico.Id <> 0 then
    EdtID.EditValue := FFarmaceutico.Id;
  EdtNome.EditValue := FFarmaceutico.Nome;
end;

end.
