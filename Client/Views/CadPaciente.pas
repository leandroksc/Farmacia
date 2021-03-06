unit CadPaciente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,   Vcl.Controls,
  Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxClasses, dxLayoutContainer, dxLayoutControl, cxContainer, cxEdit,
  cxTextEdit, Vcl.Menus, Vcl.StdCtrls, cxButtons, cxLabel, uPacienteController, uEntities, cxLookAndFeels,
  cxLookAndFeelPainters, dxLayoutcxEditAdapters, dxLayoutControlAdapters;

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
    procedure FormDestroy(Sender: TObject);
  private
    FController: TPacienteController;
    FOwnsObject: Boolean;
    procedure LoadData;
    procedure Salvar;
  protected
    FPaciente: TPaciente;
  public
    class procedure Abrir; overload;
    class procedure Abrir(APaciente: TPaciente); overload;
  end;

implementation

{$R *.dfm}

class procedure TFrmCadPaciente.Abrir(APaciente: TPaciente);
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
  FController := TPacienteController.Create;
end;

procedure TFrmCadPaciente.FormDestroy(Sender: TObject);
begin
  FController.Free;
  if FOwnsObject then
    FPaciente.Free;
end;

procedure TFrmCadPaciente.FormShow(Sender: TObject);
begin
  LoadData;
end;

procedure TFrmCadPaciente.Salvar;
begin
  FPaciente.Nome := EdtNome.Text;
  FController.Salvar(FPaciente);
end;

procedure TFrmCadPaciente.LoadData;
begin
  if FPaciente = nil then
  begin
    FPaciente := TPaciente.Create;
    FOwnsObject := True;
  end;
  BtnExcluir.Enabled := FPaciente.Id <> 0;
  if FPaciente.Id <> 0 then
    EdtID.EditValue := FPaciente.Id;
  EdtNome.EditValue := FPaciente.Nome;
end;

end.
