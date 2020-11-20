unit Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, System.Actions, Vcl.ActnList;

type
  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    ActionList1: TActionList;
    ActPaciente: TAction;
    Cadastros1: TMenuItem;
    Action11: TMenuItem;
    ActUpdateDatabase: TAction;
    Database1: TMenuItem;
    UpdateDatabase1: TMenuItem;
    ActServico: TAction;
    Servio1: TMenuItem;
    procedure ActPacienteExecute(Sender: TObject);
    procedure ActUpdateDatabaseExecute(Sender: TObject);
    procedure ActServicoExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses
  CadPaciente, ConPaciente, uServerContext, ConServico, CadServico;

procedure TForm1.ActPacienteExecute(Sender: TObject);
begin
  TFrmConPaciente.Create(nil).Show;
end;

procedure TForm1.ActServicoExecute(Sender: TObject);
begin
  TFrmConServico.Create(nil).Show;
end;

procedure TForm1.ActUpdateDatabaseExecute(Sender: TObject);
begin
  TServerContext.GetInstance.UpdateDataBase;
end;

end.
