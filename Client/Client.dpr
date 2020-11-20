program Client;

uses
  Vcl.Forms,
  Principal in 'Principal.pas' {Form1},
  CadPaciente in 'Views\CadPaciente.pas' {FrmCadPaciente},
  uPessoaController in 'Controllers\uPessoaController.pas',
  uInterfaces in 'Controllers\uInterfaces.pas',
  uServerContext in 'uServerContext.pas' {ServerContext: TDataModule},
  uBaseController in 'Controllers\uBaseController.pas',
  ConPaciente in 'Views\ConPaciente.pas' {FrmConPaciente},
  CadServico in 'Views\CadServico.pas' {FrmCadServico},
  ConServico in 'Views\ConServico.pas' {FrmConServico},
  uServicoController in 'Controllers\uServicoController.pas',
  uEntities in '..\Common\uEntities.pas',
  uEnums in '..\Common\uEnums.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
