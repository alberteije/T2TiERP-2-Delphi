program NFCe;

uses
  Forms,
  Windows,
  Dialogs,
  DAVDetalheVO in 'VO\DAVDetalheVO.pas',
  ProdutoController in 'Controller\ProdutoController.pas',
  VendaController in 'Controller\VendaController.pas',
  UCaixa in 'Tela\UCaixa.pas' {FCaixa},
  UDescontoAcrescimo in 'Tela\UDescontoAcrescimo.pas' {FDescontoAcrescimo},
  UEfetuaPagamento in 'Tela\UEfetuaPagamento.pas' {FEfetuaPagamento},
  UIdentificaCliente in 'Tela\UIdentificaCliente.pas' {FIdentificaCliente},
  UImportaCliente in 'Tela\UImportaCliente.pas' {FImportaCliente},
  UImportaNumero in 'Tela\UImportaNumero.pas' {FImportaNumero},
  UIniciaMovimento in 'Tela\UIniciaMovimento.pas' {FIniciaMovimento},
  UMovimentoAberto in 'Tela\UMovimentoAberto.pas' {FMovimentoAberto},
  UValorReal in 'Tela\UValorReal.pas' {FValorReal},
  UImportaProduto in 'Tela\UImportaProduto.pas' {FImportaProduto},
  Biblioteca in 'Util\Biblioteca.pas',
  DAVController in 'Controller\DAVController.pas',
  ULoginGerenteSupervisor in 'Tela\ULoginGerenteSupervisor.pas' {FLoginGerenteSupervisor},
  Constantes in 'Util\Constantes.pas',
  UFechaEfetuaPagamento in 'Tela\UFechaEfetuaPagamento.pas' {FFechaEfetuaPagamento},
  UParcelamento in 'Tela\UParcelamento.pas' {FParcelamento},
  UEncerraMovimento in 'Tela\UEncerraMovimento.pas' {FEncerraMovimento},
  DavCabecalhoVO in 'VO\DavCabecalhoVO.pas',
  UnidadeProdutoVO in 'VO\UnidadeProdutoVO.pas',
  UCarregaDAV in 'Tela\UCarregaDAV.pas' {FCarregaDAV},
  Atributos in 'Util\Atributos.pas',
  JSonVO in 'VO\JSonVO.pas',
  VO in 'VO\VO.pas',
  UBase in 'Tela\UBase.pas' {FBase},
  UDataModuleConexao in 'DataModule\UDataModuleConexao.pas' {FDataModuleConexao: TDataModule},
  SessaoUsuario in 'Util\SessaoUsuario.pas',
  Controller in 'Controller\Controller.pas',
  T2TiORM in 'Util\T2TiORM.pas',
  Tipos in 'Util\Tipos.pas',
  Conversor in 'Util\Conversor.pas',
  DavDetalheController in 'Controller\DavDetalheController.pas',
  NfceCaixaVO in 'VO\NfceCaixaVO.pas',
  EmpresaVO in 'VO\EmpresaVO.pas',
  NfceTurnoVO in 'VO\NfceTurnoVO.pas',
  NfceTurnoController in 'Controller\NfceTurnoController.pas',
  NfceOperadorController in 'Controller\NfceOperadorController.pas',
  NfceOperadorVO in 'VO\NfceOperadorVO.pas',
  NfceFechamentoVO in 'VO\NfceFechamentoVO.pas',
  NfceFechamentoController in 'Controller\NfceFechamentoController.pas',
  NfceSangriaVO in 'VO\NfceSangriaVO.pas',
  NfceSuprimentoVO in 'VO\NfceSuprimentoVO.pas',
  NfceSuprimentoController in 'Controller\NfceSuprimentoController.pas',
  NfceSangriaController in 'Controller\NfceSangriaController.pas',
  NfceMovimentoVO in 'VO\NfceMovimentoVO.pas',
  NfceMovimentoController in 'Controller\NfceMovimentoController.pas',
  ViewNfceClienteVO in 'VO\ViewNfceClienteVO.pas',
  ViewNfceClienteController in 'Controller\ViewNfceClienteController.pas',
  NfcePosicaoComponentesVO in 'VO\NfcePosicaoComponentesVO.pas',
  NfceResolucaoVO in 'VO\NfceResolucaoVO.pas',
  NfceConfiguracaoBalancaVO in 'VO\NfceConfiguracaoBalancaVO.pas',
  NfceConfiguracaoLeitorSerVO in 'VO\NfceConfiguracaoLeitorSerVO.pas',
  NfceConfiguracaoController in 'Controller\NfceConfiguracaoController.pas',
  NfceConfiguracaoVO in 'VO\NfceConfiguracaoVO.pas',
  ProdutoVO in 'VO\ProdutoVO.pas',
  NfceTipoPagamentoVO in 'VO\NfceTipoPagamentoVO.pas',
  NfceTipoPagamentoController in 'Controller\NfceTipoPagamentoController.pas',
  VendedorVO in 'VO\VendedorVO.pas',
  VendedorController in 'Controller\VendedorController.pas',
  NfeAcessoXmlVO in 'VO\NfeAcessoXmlVO.pas',
  NfeCabecalhoVO in 'VO\NfeCabecalhoVO.pas',
  NfeCanaDeducoesSafraVO in 'VO\NfeCanaDeducoesSafraVO.pas',
  NfeCanaFornecimentoDiarioVO in 'VO\NfeCanaFornecimentoDiarioVO.pas',
  NfeCanaVO in 'VO\NfeCanaVO.pas',
  NfeConfiguracaoVO in 'VO\NfeConfiguracaoVO.pas',
  NfeCteReferenciadoVO in 'VO\NfeCteReferenciadoVO.pas',
  NfeCupomFiscalReferenciadoVO in 'VO\NfeCupomFiscalReferenciadoVO.pas',
  NfeDeclaracaoImportacaoVO in 'VO\NfeDeclaracaoImportacaoVO.pas',
  NfeDestinatarioVO in 'VO\NfeDestinatarioVO.pas',
  NfeDetalheImpostoCofinsVO in 'VO\NfeDetalheImpostoCofinsVO.pas',
  NfeDetalheImpostoIcmsVO in 'VO\NfeDetalheImpostoIcmsVO.pas',
  NfeDetalheImpostoIiVO in 'VO\NfeDetalheImpostoIiVO.pas',
  NfeDetalheImpostoIpiVO in 'VO\NfeDetalheImpostoIpiVO.pas',
  NfeDetalheImpostoIssqnVO in 'VO\NfeDetalheImpostoIssqnVO.pas',
  NfeDetalheImpostoPisVO in 'VO\NfeDetalheImpostoPisVO.pas',
  NfeDetalheVO in 'VO\NfeDetalheVO.pas',
  NfeDetEspecificoArmamentoVO in 'VO\NfeDetEspecificoArmamentoVO.pas',
  NfeDetEspecificoCombustivelVO in 'VO\NfeDetEspecificoCombustivelVO.pas',
  NfeDetEspecificoMedicamentoVO in 'VO\NfeDetEspecificoMedicamentoVO.pas',
  NfeDetEspecificoVeiculoVO in 'VO\NfeDetEspecificoVeiculoVO.pas',
  NfeDuplicataVO in 'VO\NfeDuplicataVO.pas',
  NfeEmitenteVO in 'VO\NfeEmitenteVO.pas',
  NfeExportacaoVO in 'VO\NfeExportacaoVO.pas',
  NfeFaturaVO in 'VO\NfeFaturaVO.pas',
  NfeFormaPagamentoVO in 'VO\NfeFormaPagamentoVO.pas',
  NfeImportacaoDetalheVO in 'VO\NfeImportacaoDetalheVO.pas',
  NfeLocalEntregaVO in 'VO\NfeLocalEntregaVO.pas',
  NfeLocalRetiradaVO in 'VO\NfeLocalRetiradaVO.pas',
  NfeNfReferenciadaVO in 'VO\NfeNfReferenciadaVO.pas',
  NfeNumeroVO in 'VO\NfeNumeroVO.pas',
  NfeProcessoReferenciadoVO in 'VO\NfeProcessoReferenciadoVO.pas',
  NfeProdRuralReferenciadaVO in 'VO\NfeProdRuralReferenciadaVO.pas',
  NfeReferenciadaVO in 'VO\NfeReferenciadaVO.pas',
  NfeTransporteReboqueVO in 'VO\NfeTransporteReboqueVO.pas',
  NfeTransporteVO in 'VO\NfeTransporteVO.pas',
  NfeTransporteVolumeLacreVO in 'VO\NfeTransporteVolumeLacreVO.pas',
  NfeTransporteVolumeVO in 'VO\NfeTransporteVolumeVO.pas',
  FiscalNotaFiscalEntradaVO in 'VO\FiscalNotaFiscalEntradaVO.pas',
  TributOperacaoFiscalVO in 'VO\TributOperacaoFiscalVO.pas',
  CfopVO in 'VO\CfopVO.pas',
  NfeConfiguracaoController in 'Controller\NfeConfiguracaoController.pas',
  UDataModule in 'DataModule\UDataModule.pas' {FDataModule: TDataModule},
  NfeNumeroController in 'Controller\NfeNumeroController.pas',
  NfeFormaPagamentoController in 'Controller\NfeFormaPagamentoController.pas',
  ProdutoLoteVO in 'VO\ProdutoLoteVO.pas',
  ControleEstoqueController in 'Controller\ControleEstoqueController.pas',
  EmpresaEnderecoVO in 'VO\EmpresaEnderecoVO.pas',
  EmpresaEnderecoController in 'Controller\EmpresaEnderecoController.pas',
  UListaNFCe in 'Tela\UListaNFCe.pas' {FListaNFCe},
  FinParcelaReceberVO in 'VO\FinParcelaReceberVO.pas',
  FinLancamentoReceberVO in 'VO\FinLancamentoReceberVO.pas',
  FinLancamentoReceberController in 'Controller\FinLancamentoReceberController.pas';

{$R *.res}


var
  Instancia: THandle;
begin

  Instancia:= CreateMutex(nil, false, 'InstanciaIniciada');

  if WaitForSingleObject(Instancia, 0) = wait_Timeout then
  begin
    Application.MessageBox('Você não pode executar outra cópia do aplicativo.', 'Informação do Sistema', MB_OK + MB_ICONINFORMATION);
    exit;
  end else
  begin
    Application.Initialize;
    Application.MainFormOnTaskbar := True;
    Application.Title := 'NFC-e';
    Application.CreateForm(TFCaixa, FCaixa);
  Application.CreateForm(TFDataModule, FDataModule);
  FCaixa.Show;
    Application.Run;
  end;

end.