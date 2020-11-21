unit Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, uDMServerContainer;

type
  TMainForm = class(TForm)
    mmInfo: TMemo;
    btStart: TButton;
    btStop: TButton;
    BtnUpdateDataBase: TButton;
    procedure btStartClick(ASender: TObject);
    procedure btStopClick(ASender: TObject);
    procedure FormCreate(ASender: TObject);
  strict private
    procedure UpdateGUI;
    procedure SQLOnExecute(Sender: TObject; const ASQL: string);
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

resourcestring
  SServerStopped = 'Server stopped';
  SServerStartedAt = 'Server started at ';

{ TMainForm }

procedure TMainForm.btStartClick(ASender: TObject);
begin
  ServerContainer.SparkleHttpSysDispatcher.Start;
  UpdateGUI;
end;

procedure TMainForm.btStopClick(ASender: TObject);
begin
  ServerContainer.SparkleHttpSysDispatcher.Stop;
  UpdateGUI;
end;

procedure TMainForm.FormCreate(ASender: TObject);
begin
  ServerContainer.OnSQLExecute := SQLOnExecute;
  UpdateGUI;
end;

procedure TMainForm.SQLOnExecute(Sender: TObject; const ASQL: string);
begin
  mmInfo.Lines.Add('--------------------------');
  mmInfo.Lines.Add(ASQL);
end;

procedure TMainForm.UpdateGUI;
const
  cHttp = 'http://+';
  cHttpLocalhost = 'http://localhost';
begin
  btStart.Enabled := not ServerContainer.SparkleHttpSysDispatcher.Active;
  btStop.Enabled := not btStart.Enabled;
  if ServerContainer.SparkleHttpSysDispatcher.Active then
    mmInfo.Lines.Add(SServerStartedAt + StringReplace(
      ServerContainer.XDataServer.BaseUrl,
      cHttp, cHttpLocalhost, [rfIgnoreCase]))
  else
    mmInfo.Lines.Add(SServerStopped);
end;

end.
