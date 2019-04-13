program T2TiDataPump;

uses
  Forms,
  UPrincipal in 'UPrincipal.pas' {FPrincipal},
  ConexaoBD in 'ConexaoBD.pas',
  UTabelaSelecionada in 'UTabelaSelecionada.pas' {FTabelaSelecionada};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFPrincipal, FPrincipal);
  Application.CreateForm(TFTabelaSelecionada, FTabelaSelecionada);
  Application.Run;
end.
