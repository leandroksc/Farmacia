unit CadPaciente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxClasses,
  dxLayoutContainer, dxLayoutControl, dxLayoutcxEditAdapters, cxContainer, cxEdit, cxTextEdit, dxLayoutControlAdapters,
  Vcl.Menus, Vcl.StdCtrls, cxButtons, cxLabel, Aurelius.Engine.ObjectManager, uPessoaController, uEntities;

type
  TFrmCadPaciente = class(TForm)
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
  private
    FController: TPessoaController;
    procedure LoadData;
    procedure Salvar;
  protected
    FPaciente: TPessoa;
  public
    class procedure Abrir; overload;
    class procedure Abrir(APaciente: TPessoa); overload;
  end;

implementation

{$R *.dfm}

class procedure TFrmCadPaciente.Abrir(APaciente: TPessoa);
var
  AForm: TFrmCadPaciente;
begin
  AForm := TFrmCadPaciente.Create(nil);
  AForm.FPaciente := APaciente;
  AForm.Show;
end;

class procedure TFrmCadPaciente.Abrir;
begin
  Abrir(nil);
end;

procedure TFrmCadPaciente.BtnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmCadPaciente.BtnExcluirClick(Sender: TObject);
begin
  FController.Excluir(FPaciente);
  Close;
end;

procedure TFrmCadPaciente.BtnSalvarClick(Sender: TObject);
begin
  Salvar;
  Close;
end;

procedure TFrmCadPaciente.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmCadPaciente.FormCreate(Sender: TObject);
begin
  FController := TPessoaController.Create;
end;

procedure TFrmCadPaciente.FormShow(Sender: TObject);
begin
  LoadData;
end;

procedure TFrmCadPaciente.Salvar;
begin
  if FPaciente = nil then
    FPaciente := TPessoa.Create;
  FPaciente.Nome := EdtNome.Text;
  FController.Salvar(FPaciente);
end;

procedure TFrmCadPaciente.LoadData;
begin
  BtnExcluir.Enabled := FPaciente <> nil;
  if FPaciente <> nil then
  begin
    EdtID.EditValue   := FPaciente.Id;
    EdtNome.EditValue := FPaciente.Nome;
  end;
end;

end.
