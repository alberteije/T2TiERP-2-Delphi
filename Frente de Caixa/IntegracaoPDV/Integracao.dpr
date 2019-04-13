program Integracao;

uses
  Forms,
  Windows,
  UIntegracaoPDV in 'UIntegracaoPDV.pas' {FIntegracaoPDV},
  ImportaController in 'Controller\ImportaController.pas',
  LogImportacaoController in 'Controller\LogImportacaoController.pas',
  LogImportacaoVO in 'VO\LogImportacaoVO.pas',
  IntegracaoPdvVO in 'VO\IntegracaoPdvVO.pas',
  UDataModuleConexao in 'UDataModuleConexao.pas' {FDataModuleConexao: TDataModule},
  JSonVO in '..\PAF-ECF\VO\JSonVO.pas',
  VO in '..\PAF-ECF\VO\VO.pas',
  Atributos in '..\PAF-ECF\Util\Atributos.pas',
  Biblioteca in '..\PAF-ECF\Util\Biblioteca.pas',
  Constantes in '..\PAF-ECF\Util\Constantes.pas',
  T2TiORM in '..\PAF-ECF\Util\T2TiORM.pas',
  EcfProdutoVO in '..\PAF-ECF\VO\EcfProdutoVO.pas',
  UnidadeProdutoVO in '..\PAF-ECF\VO\UnidadeProdutoVO.pas',
  NotaFiscalCabecalhoVO in 'VO\NotaFiscalCabecalhoVO.pas',
  NotaFiscalDetalheVO in 'VO\NotaFiscalDetalheVO.pas',
  R06VO in 'VO\R06VO.pas',
  R07VO in 'VO\R07VO.pas',
  ControleEstoqueController in 'Controller\ControleEstoqueController.pas',
  EcfVendaCabecalhoVO in 'VO\EcfVendaCabecalhoVO.pas',
  EcfVendaDetalheVO in 'VO\EcfVendaDetalheVO.pas',
  EcfTotalTipoPagamentoVO in 'VO\EcfTotalTipoPagamentoVO.pas',
  ClienteVO in '..\PAF-ECF\VO\ClienteVO.pas',
  EcfFuncionarioVO in '..\PAF-ECF\VO\EcfFuncionarioVO.pas',
  EcfMovimentoVO in 'VO\EcfMovimentoVO.pas',
  EcfTipoPagamentoVO in '..\PAF-ECF\VO\EcfTipoPagamentoVO.pas',
  EcfCaixaVO in '..\PAF-ECF\VO\EcfCaixaVO.pas',
  EcfEmpresaVO in '..\PAF-ECF\VO\EcfEmpresaVO.pas',
  EcfImpressoraVO in '..\PAF-ECF\VO\EcfImpressoraVO.pas',
  EcfOperadorVO in '..\PAF-ECF\VO\EcfOperadorVO.pas',
  EcfTurnoVO in '..\PAF-ECF\VO\EcfTurnoVO.pas',
  EcfFechamentoVO in 'VO\EcfFechamentoVO.pas',
  EcfSangriaVO in 'VO\EcfSangriaVO.pas',
  EcfSuprimentoVO in 'VO\EcfSuprimentoVO.pas',
  EcfDocumentosEmitidosVO in 'VO\EcfDocumentosEmitidosVO.pas',
  EcfRecebimentoNaoFiscalVO in 'VO\EcfRecebimentoNaoFiscalVO.pas',
  Sintegra60AVO in 'VO\Sintegra60AVO.pas',
  Sintegra60MVO in 'VO\Sintegra60MVO.pas',
  R02VO in 'VO\R02VO.pas',
  R03VO in 'VO\R03VO.pas';

{$R *.res}

var
  Instancia: THandle;

begin
  // ReportMemoryLeaksOnShutdown := DebugHook <> 0;
  Instancia := CreateMutex(nil, false, 'IntegracaoPDV');
  if not(WaitForSingleObject(Instancia, 0) = wait_Timeout) then
  begin
    Application.Initialize;
    Application.MainFormOnTaskbar := True;
    Application.CreateForm(TFIntegracaoPDV, FIntegracaoPDV);
  Application.CreateForm(TFDataModuleConexao, FDataModuleConexao);
  Application.Run;
  end;

end.
