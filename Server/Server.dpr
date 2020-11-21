program Server;

uses
  Vcl.Forms,
  uDMServerContainer in 'uDMServerContainer.pas' {ServerContainer: TDataModule},
  Principal in 'Principal.pas' {MainForm},
  uEntities in '..\Common\uEntities.pas',
  uEnums in '..\Common\uEnums.pas',
  uInterfaces in '..\Common\uInterfaces.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TServerContainer, ServerContainer);
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
