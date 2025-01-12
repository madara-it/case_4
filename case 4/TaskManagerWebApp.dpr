program TaskManagerWebApp;

uses
  Vcl.Forms,
  WebModuleUnit in 'WebModuleUnit.pas' {WebModule1: TWebModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TWebModule1, WebModule1);
  Application.Run;
end.