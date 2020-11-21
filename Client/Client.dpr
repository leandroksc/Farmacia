program Client;

uses
  Vcl.Forms,
  Principal in 'Principal.pas' {FrmPrincipal},
  CadPaciente in 'Views\CadPaciente.pas' {FrmCadPaciente},
  uPacienteController in 'Controllers\uPacienteController.pas',
  uServerContext in 'uServerContext.pas' {ServerContext: TDataModule},
  uBaseController in 'Controllers\uBaseController.pas',
  ConPaciente in 'Views\ConPaciente.pas' {FrmConPaciente},
  CadServico in 'Views\CadServico.pas' {FrmCadServico},
  ConServico in 'Views\ConServico.pas' {FrmConServico},
  uServicoController in 'Controllers\uServicoController.pas',
  uEntities in '..\Common\uEntities.pas',
  uEnums in '..\Common\uEnums.pas',
  uFarmaceuticoController in 'Controllers\uFarmaceuticoController.pas',
  uInterfaces in '..\Common\uInterfaces.pas',
  CadFarmaceutico in 'Views\CadFarmaceutico.pas' {FrmCadFarmaceutico},
  ConFarmaceutico in 'Views\ConFarmaceutico.pas' {FrmConFarmaceutico};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.Run;
end.
