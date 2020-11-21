unit Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, System.Actions, Vcl.ActnList;

type
  TFrmPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    ActionList1: TActionList;
    ActPaciente: TAction;
    Cadastros1: TMenuItem;
    Action11: TMenuItem;
    ActServico: TAction;
    Servio1: TMenuItem;
    ActFarmaceutico: TAction;
    Farmacutico1: TMenuItem;
    procedure ActPacienteExecute(Sender: TObject);
    procedure ActServicoExecute(Sender: TObject);
    procedure ActFarmaceuticoExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

{$R *.dfm}

uses
  ConPaciente, uServerContext, ConServico, ConFarmaceutico;

procedure TFrmPrincipal.ActFarmaceuticoExecute(Sender: TObject);
begin
  TFrmConFarmaceutico.Create(nil).Show;
end;

procedure TFrmPrincipal.ActPacienteExecute(Sender: TObject);
begin
  TFrmConPaciente.Create(nil).Show;
end;

procedure TFrmPrincipal.ActServicoExecute(Sender: TObject);
begin
  TFrmConServico.Create(nil).Show;
end;

end.
