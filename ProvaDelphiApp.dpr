program ProvaDelphiApp;

uses
  Vcl.Forms,
  uMenuPrincipal in 'uMenuPrincipal.pas' {fMenuPrincipal},
  ufTarefa3 in 'ufTarefa3.pas' {fTarefa3},
  ufTarefa1 in 'ufTarefa1.pas' {fTarefa1},
  ufTarefa2 in 'ufTarefa2.pas' {fTarefa2};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfMenuPrincipal, fMenuPrincipal);
  Application.Run;
end.
