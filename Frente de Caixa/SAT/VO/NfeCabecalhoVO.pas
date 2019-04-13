{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [NFE_CABECALHO] 
                                                                                
The MIT License                                                                 
                                                                                
Copyright: Copyright (C) 2014 T2Ti.COM                                          
                                                                                
Permission is hereby granted, free of charge, to any person                     
obtaining a copy of this software and associated documentation                  
files (the "Software"), to deal in the Software without                         
restriction, including without limitation the rights to use,                    
copy, modify, merge, publish, distribute, sublicense, and/or sell               
copies of the Software, and to permit persons to whom the                       
Software is furnished to do so, subject to the following                        
conditions:                                                                     
                                                                                
The above copyright notice and this permission notice shall be                  
included in all copies or substantial portions of the Software.                 
                                                                                
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,                 
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES                 
OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND                        
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT                     
HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,                    
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING                    
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR                   
OTHER DEALINGS IN THE SOFTWARE.                                                 
                                                                                
       The author may be contacted at:                                          
           t2ti.com@gmail.com                                                   
                                                                                
@author Albert Eije (t2ti.com@gmail.com)                    
@version 2.0                                                                    
*******************************************************************************}
unit NfeCabecalhoVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils,

  TributOperacaoFiscalVO,
  NfeEmitenteVO, NfeDestinatarioVO, NfeLocalRetiradaVO, NfeLocalEntregaVO,
  NfeAcessoXmlVO, NfeTransporteVO, NfeFaturaVO, NfeCanaVO, EmpresaVO,

  NfeReferenciadaVO, NfeNfReferenciadaVO, NfeCteReferenciadoVO, NfeProdRuralReferenciadaVO,
  NfeCupomFiscalReferenciadoVO, NfeDetalheVO, NfeDuplicataVO, NfeFormaPagamentoVO,
  NfeProcessoReferenciadoVO, FiscalNotaFiscalEntradaVO;

type
  [TEntity]
  [TTable('NFE_CABECALHO')]
  TNfeCabecalhoVO = class(TVO)
  private
    FID: Integer;
    FID_VENDEDOR: Integer;
    FID_NFCE_MOVIMENTO: Integer;
    FID_TRIBUT_OPERACAO_FISCAL: Integer;
    FID_VENDA_CABECALHO: Integer;
    FID_EMPRESA: Integer;
    FID_FORNECEDOR: Integer;
    FID_CLIENTE: Integer;
    FUF_EMITENTE: Integer;
    FCODIGO_NUMERICO: String;
    FNATUREZA_OPERACAO: String;
    FINDICADOR_FORMA_PAGAMENTO: Integer;
    FCODIGO_MODELO: String;
    FSERIE: String;
    FNUMERO: String;
    FDATA_HORA_EMISSAO: TDateTime;
    FDATA_HORA_ENTRADA_SAIDA: TDateTime;
    FTIPO_OPERACAO: Integer;
    FLOCAL_DESTINO: Integer;
    FCODIGO_MUNICIPIO: Integer;
    FFORMATO_IMPRESSAO_DANFE: Integer;
    FTIPO_EMISSAO: Integer;
    FCHAVE_ACESSO: String;
    FDIGITO_CHAVE_ACESSO: String;
    FAMBIENTE: Integer;
    FFINALIDADE_EMISSAO: Integer;
    FCONSUMIDOR_OPERACAO: Integer;
    FCONSUMIDOR_PRESENCA: Integer;
    FPROCESSO_EMISSAO: Integer;
    FVERSAO_PROCESSO_EMISSAO: String;
    FDATA_ENTRADA_CONTINGENCIA: TDateTime;
    FJUSTIFICATIVA_CONTINGENCIA: String;
    FBASE_CALCULO_ICMS: Extended;
    FVALOR_ICMS: Extended;
    FVALOR_ICMS_DESONERADO: Extended;
    FBASE_CALCULO_ICMS_ST: Extended;
    FVALOR_ICMS_ST: Extended;
    FVALOR_TOTAL_PRODUTOS: Extended;
    FVALOR_FRETE: Extended;
    FVALOR_SEGURO: Extended;
    FVALOR_DESCONTO: Extended;
    FVALOR_IMPOSTO_IMPORTACAO: Extended;
    FVALOR_IPI: Extended;
    FVALOR_PIS: Extended;
    FVALOR_COFINS: Extended;
    FVALOR_DESPESAS_ACESSORIAS: Extended;
    FVALOR_TOTAL: Extended;
    FVALOR_SERVICOS: Extended;
    FBASE_CALCULO_ISSQN: Extended;
    FVALOR_ISSQN: Extended;
    FVALOR_PIS_ISSQN: Extended;
    FVALOR_COFINS_ISSQN: Extended;
    FDATA_PRESTACAO_SERVICO: TDateTime;
    FVALOR_DEDUCAO_ISSQN: Extended;
    FOUTRAS_RETENCOES_ISSQN: Extended;
    FDESCONTO_INCONDICIONADO_ISSQN: Extended;
    FDESCONTO_CONDICIONADO_ISSQN: Extended;
    FTOTAL_RETENCAO_ISSQN: Extended;
    FREGIME_ESPECIAL_TRIBUTACAO: Integer;
    FVALOR_RETIDO_PIS: Extended;
    FVALOR_RETIDO_COFINS: Extended;
    FVALOR_RETIDO_CSLL: Extended;
    FBASE_CALCULO_IRRF: Extended;
    FVALOR_RETIDO_IRRF: Extended;
    FBASE_CALCULO_PREVIDENCIA: Extended;
    FVALOR_RETIDO_PREVIDENCIA: Extended;
    FTROCO: Extended;
    FCOMEX_UF_EMBARQUE: String;
    FCOMEX_LOCAL_EMBARQUE: String;
    FCOMEX_LOCAL_DESPACHO: String;
    FCOMPRA_NOTA_EMPENHO: String;
    FCOMPRA_PEDIDO: String;
    FCOMPRA_CONTRATO: String;
    FINFORMACOES_ADD_FISCO: String;
    FINFORMACOES_ADD_CONTRIBUINTE: String;
    FSTATUS_NOTA: Integer;

    FEmpresaVO: TEmpresaVO;

    FTributOperacaoFiscalVO: TTributOperacaoFiscalVO;

    FFiscalNotaFiscalEntradaVO: TFiscalNotaFiscalEntradaVO; //1:1

    // Grupo C
    FNfeEmitenteVO: TNfeEmitenteVO; //1:1
    // Grupo E
    FNfeDestinatarioVO: TNfeDestinatarioVO; //0:1
    // Grupo F
    FNfeLocalRetiradaVO: TNfeLocalRetiradaVO; //0:1
    // Grupo G
    FNfeLocalEntregaVO: TNfeLocalEntregaVO; //0:1
    // Grupo X
    FNfeTransporteVO: TNfeTransporteVO; //1:1
    // Grupo Y - Y02
    FNfeFaturaVO: TNfeFaturaVO; //0:1
    // Grupo ZC
    FNfeCanaVO: TNfeCanaVO; //0:1

    // Grupo BA
    FListaNfeReferenciadaVO: TObjectList<TNfeReferenciadaVO>; //0:500
    FListaNfeNfReferenciadaVO: TObjectList<TNfeNfReferenciadaVO>; //0:500
    FListaNfeCteReferenciadoVO: TObjectList<TNfeCteReferenciadoVO>; //0:500
    FListaNfeProdRuralReferenciadaVO: TObjectList<TNfeProdRuralReferenciadaVO>; //0:500
    FListaNfeCupomFiscalReferenciadoVO: TObjectList<TNfeCupomFiscalReferenciadoVO>; //0:500
    // Grupo GA
    FListaNfeAcessoXmlVO: TObjectList<TNfeAcessoXmlVO>; //0:10
    // Grupo I
    FListaNfeDetalheVO: TObjectList<TNfeDetalheVO>; //1:990
    // Grupo Y - Y07
    FListaNfeDuplicataVO: TObjectList<TNfeDuplicataVO>; //0:120
    // Grupo YA [usado apenas na NFC-e]
    FListaNfeFormaPagamentoVO: TObjectList<TNfeFormaPagamentoVO>; //0:100
    // Grupo Z - Z10
    FListaNfeProcessoReferenciadoVO: TObjectList<TNfeProcessoReferenciadoVO>; //0:100

  public
    constructor Create; override;
    destructor Destroy; override;

    [TId('ID', [ldGrid, ldLookup, ldComboBox])]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;

    [TColumn('NUMERO', 'Numero', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property Numero: String  read FNUMERO write FNUMERO;
    [TColumn('SERIE', 'Serie', 24, [ldGrid, ldLookup, ldCombobox], False)]
    property Serie: String  read FSERIE write FSERIE;
    [TColumn('DATA_HORA_EMISSAO', 'Data Hora Emissao', 120, [ldGrid, ldLookup, ldCombobox], False)]
    property DataHoraEmissao: TDateTime  read FDATA_HORA_EMISSAO write FDATA_HORA_EMISSAO;

    [TColumn('NATUREZA_OPERACAO', 'Natureza Operacao', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property NaturezaOperacao: String  read FNATUREZA_OPERACAO write FNATUREZA_OPERACAO;

    [TColumn('CHAVE_ACESSO', 'Chave Acesso', 352, [ldGrid, ldLookup, ldCombobox], False)]
    property ChaveAcesso: String  read FCHAVE_ACESSO write FCHAVE_ACESSO;
    [TColumn('DIGITO_CHAVE_ACESSO', 'Digito Chave Acesso', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property DigitoChaveAcesso: String  read FDIGITO_CHAVE_ACESSO write FDIGITO_CHAVE_ACESSO;

    [TColumn('ID_NFCE_MOVIMENTO', 'Id Movimento', 80, [], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdNfceMovimento: Integer  read FID_NFCE_MOVIMENTO write FID_NFCE_MOVIMENTO;
    [TColumn('ID_VENDEDOR', 'Id Vendedor', 80, [], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdVendedor: Integer  read FID_VENDEDOR write FID_VENDEDOR;
    [TColumn('ID_TRIBUT_OPERACAO_FISCAL', 'Id Tribut Operacao Fiscal', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdTributOperacaoFiscal: Integer  read FID_TRIBUT_OPERACAO_FISCAL write FID_TRIBUT_OPERACAO_FISCAL;
    [TColumn('ID_VENDA_CABECALHO', 'Id Venda Cabecalho', 80, [], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdVendaCabecalho: Integer  read FID_VENDA_CABECALHO write FID_VENDA_CABECALHO;
    [TColumn('ID_EMPRESA', 'Id Empresa', 80, [], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdEmpresa: Integer  read FID_EMPRESA write FID_EMPRESA;
    [TColumn('ID_FORNECEDOR', 'Id Fornecedor', 80, [], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdFornecedor: Integer  read FID_FORNECEDOR write FID_FORNECEDOR;
    [TColumn('ID_CLIENTE', 'Id Cliente', 80, [], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdCliente: Integer  read FID_CLIENTE write FID_CLIENTE;
    [TColumn('UF_EMITENTE', 'Uf Emitente', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property UfEmitente: Integer  read FUF_EMITENTE write FUF_EMITENTE;
    [TColumn('CODIGO_NUMERICO', 'Codigo Numerico', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property CodigoNumerico: String  read FCODIGO_NUMERICO write FCODIGO_NUMERICO;
    [TColumn('INDICADOR_FORMA_PAGAMENTO', 'Indicador Forma Pagamento', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IndicadorFormaPagamento: Integer  read FINDICADOR_FORMA_PAGAMENTO write FINDICADOR_FORMA_PAGAMENTO;
    [TColumn('CODIGO_MODELO', 'Codigo Modelo', 16, [ldGrid, ldLookup, ldCombobox], False)]
    property CodigoModelo: String  read FCODIGO_MODELO write FCODIGO_MODELO;
    [TColumn('DATA_HORA_ENTRADA_SAIDA', 'Data Hora Entrada Saida', 272, [ldGrid, ldLookup, ldCombobox], False)]
    property DataHoraEntradaSaida: TDateTime  read FDATA_HORA_ENTRADA_SAIDA write FDATA_HORA_ENTRADA_SAIDA;
    [TColumn('TIPO_OPERACAO', 'Tipo Operacao', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property TipoOperacao: Integer  read FTIPO_OPERACAO write FTIPO_OPERACAO;
    [TColumn('LOCAL_DESTINO', 'Local Destino', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property LocalDestino: Integer  read FLOCAL_DESTINO write FLOCAL_DESTINO;
    [TColumn('CODIGO_MUNICIPIO', 'Codigo Municipio', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property CodigoMunicipio: Integer  read FCODIGO_MUNICIPIO write FCODIGO_MUNICIPIO;
    [TColumn('FORMATO_IMPRESSAO_DANFE', 'Formato Impressao Danfe', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property FormatoImpressaoDanfe: Integer  read FFORMATO_IMPRESSAO_DANFE write FFORMATO_IMPRESSAO_DANFE;
    [TColumn('TIPO_EMISSAO', 'Tipo Emissao', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property TipoEmissao: Integer  read FTIPO_EMISSAO write FTIPO_EMISSAO;
    [TColumn('AMBIENTE', 'Ambiente', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Ambiente: Integer  read FAMBIENTE write FAMBIENTE;
    [TColumn('FINALIDADE_EMISSAO', 'Finalidade Emissao', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property FinalidadeEmissao: Integer  read FFINALIDADE_EMISSAO write FFINALIDADE_EMISSAO;
    [TColumn('CONSUMIDOR_OPERACAO', 'Consumidor Operacao', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property ConsumidorOperacao: Integer  read FCONSUMIDOR_OPERACAO write FCONSUMIDOR_OPERACAO;
    [TColumn('CONSUMIDOR_PRESENCA', 'Consumidor Presenca', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property ConsumidorPresenca: Integer  read FCONSUMIDOR_PRESENCA write FCONSUMIDOR_PRESENCA;
    [TColumn('PROCESSO_EMISSAO', 'Processo Emissao', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property ProcessoEmissao: Integer  read FPROCESSO_EMISSAO write FPROCESSO_EMISSAO;
    [TColumn('VERSAO_PROCESSO_EMISSAO', 'Versao Processo Emissao', 160, [ldGrid, ldLookup, ldCombobox], False)]
    property VersaoProcessoEmissao: String  read FVERSAO_PROCESSO_EMISSAO write FVERSAO_PROCESSO_EMISSAO;
    [TColumn('DATA_ENTRADA_CONTINGENCIA', 'Data Entrada Contingencia', 272, [ldGrid, ldLookup, ldCombobox], False)]
    property DataEntradaContingencia: TDateTime  read FDATA_ENTRADA_CONTINGENCIA write FDATA_ENTRADA_CONTINGENCIA;
    [TColumn('JUSTIFICATIVA_CONTINGENCIA', 'Justificativa Contingencia', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property JustificativaContingencia: String  read FJUSTIFICATIVA_CONTINGENCIA write FJUSTIFICATIVA_CONTINGENCIA;
    [TColumn('BASE_CALCULO_ICMS', 'Base Calculo Icms', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property BaseCalculoIcms: Extended  read FBASE_CALCULO_ICMS write FBASE_CALCULO_ICMS;
    [TColumn('VALOR_ICMS', 'Valor Icms', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorIcms: Extended  read FVALOR_ICMS write FVALOR_ICMS;
    [TColumn('VALOR_ICMS_DESONERADO', 'Valor Icms Desonerado', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorIcmsDesonerado: Extended  read FVALOR_ICMS_DESONERADO write FVALOR_ICMS_DESONERADO;
    [TColumn('BASE_CALCULO_ICMS_ST', 'Base Calculo Icms St', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property BaseCalculoIcmsSt: Extended  read FBASE_CALCULO_ICMS_ST write FBASE_CALCULO_ICMS_ST;
    [TColumn('VALOR_ICMS_ST', 'Valor Icms St', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorIcmsSt: Extended  read FVALOR_ICMS_ST write FVALOR_ICMS_ST;
    [TColumn('VALOR_TOTAL_PRODUTOS', 'Valor Total Produtos', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorTotalProdutos: Extended  read FVALOR_TOTAL_PRODUTOS write FVALOR_TOTAL_PRODUTOS;
    [TColumn('VALOR_FRETE', 'Valor Frete', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorFrete: Extended  read FVALOR_FRETE write FVALOR_FRETE;
    [TColumn('VALOR_SEGURO', 'Valor Seguro', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorSeguro: Extended  read FVALOR_SEGURO write FVALOR_SEGURO;
    [TColumn('VALOR_DESCONTO', 'Valor Desconto', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorDesconto: Extended  read FVALOR_DESCONTO write FVALOR_DESCONTO;
    [TColumn('VALOR_IMPOSTO_IMPORTACAO', 'Valor Imposto Importacao', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorImpostoImportacao: Extended  read FVALOR_IMPOSTO_IMPORTACAO write FVALOR_IMPOSTO_IMPORTACAO;
    [TColumn('VALOR_IPI', 'Valor Ipi', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorIpi: Extended  read FVALOR_IPI write FVALOR_IPI;
    [TColumn('VALOR_PIS', 'Valor Pis', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorPis: Extended  read FVALOR_PIS write FVALOR_PIS;
    [TColumn('VALOR_COFINS', 'Valor Cofins', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorCofins: Extended  read FVALOR_COFINS write FVALOR_COFINS;
    [TColumn('VALOR_DESPESAS_ACESSORIAS', 'Valor Despesas Acessorias', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorDespesasAcessorias: Extended  read FVALOR_DESPESAS_ACESSORIAS write FVALOR_DESPESAS_ACESSORIAS;
    [TColumn('VALOR_TOTAL', 'Valor Total', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorTotal: Extended  read FVALOR_TOTAL write FVALOR_TOTAL;
    [TColumn('VALOR_SERVICOS', 'Valor Servicos', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorServicos: Extended  read FVALOR_SERVICOS write FVALOR_SERVICOS;
    [TColumn('BASE_CALCULO_ISSQN', 'Base Calculo Issqn', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property BaseCalculoIssqn: Extended  read FBASE_CALCULO_ISSQN write FBASE_CALCULO_ISSQN;
    [TColumn('VALOR_ISSQN', 'Valor Issqn', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorIssqn: Extended  read FVALOR_ISSQN write FVALOR_ISSQN;
    [TColumn('VALOR_PIS_ISSQN', 'Valor Pis Issqn', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorPisIssqn: Extended  read FVALOR_PIS_ISSQN write FVALOR_PIS_ISSQN;
    [TColumn('VALOR_COFINS_ISSQN', 'Valor Cofins Issqn', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorCofinsIssqn: Extended  read FVALOR_COFINS_ISSQN write FVALOR_COFINS_ISSQN;
    [TColumn('DATA_PRESTACAO_SERVICO', 'Data Prestacao Servico', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property DataPrestacaoServico: TDateTime  read FDATA_PRESTACAO_SERVICO write FDATA_PRESTACAO_SERVICO;
    [TColumn('VALOR_DEDUCAO_ISSQN', 'Valor Deducao Issqn', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorDeducaoIssqn: Extended  read FVALOR_DEDUCAO_ISSQN write FVALOR_DEDUCAO_ISSQN;
    [TColumn('OUTRAS_RETENCOES_ISSQN', 'Outras Retencoes Issqn', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property OutrasRetencoesIssqn: Extended  read FOUTRAS_RETENCOES_ISSQN write FOUTRAS_RETENCOES_ISSQN;
    [TColumn('DESCONTO_INCONDICIONADO_ISSQN', 'Desconto Incondicionado Issqn', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property DescontoIncondicionadoIssqn: Extended  read FDESCONTO_INCONDICIONADO_ISSQN write FDESCONTO_INCONDICIONADO_ISSQN;
    [TColumn('DESCONTO_CONDICIONADO_ISSQN', 'Desconto Condicionado Issqn', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property DescontoCondicionadoIssqn: Extended  read FDESCONTO_CONDICIONADO_ISSQN write FDESCONTO_CONDICIONADO_ISSQN;
    [TColumn('TOTAL_RETENCAO_ISSQN', 'Total Retencao Issqn', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property TotalRetencaoIssqn: Extended  read FTOTAL_RETENCAO_ISSQN write FTOTAL_RETENCAO_ISSQN;
    [TColumn('REGIME_ESPECIAL_TRIBUTACAO', 'Regime Especial Tributacao', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property RegimeEspecialTributacao: Integer  read FREGIME_ESPECIAL_TRIBUTACAO write FREGIME_ESPECIAL_TRIBUTACAO;
    [TColumn('VALOR_RETIDO_PIS', 'Valor Retido Pis', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorRetidoPis: Extended  read FVALOR_RETIDO_PIS write FVALOR_RETIDO_PIS;
    [TColumn('VALOR_RETIDO_COFINS', 'Valor Retido Cofins', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorRetidoCofins: Extended  read FVALOR_RETIDO_COFINS write FVALOR_RETIDO_COFINS;
    [TColumn('VALOR_RETIDO_CSLL', 'Valor Retido Csll', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorRetidoCsll: Extended  read FVALOR_RETIDO_CSLL write FVALOR_RETIDO_CSLL;
    [TColumn('BASE_CALCULO_IRRF', 'Base Calculo Irrf', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property BaseCalculoIrrf: Extended  read FBASE_CALCULO_IRRF write FBASE_CALCULO_IRRF;
    [TColumn('VALOR_RETIDO_IRRF', 'Valor Retido Irrf', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorRetidoIrrf: Extended  read FVALOR_RETIDO_IRRF write FVALOR_RETIDO_IRRF;
    [TColumn('BASE_CALCULO_PREVIDENCIA', 'Base Calculo Previdencia', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property BaseCalculoPrevidencia: Extended  read FBASE_CALCULO_PREVIDENCIA write FBASE_CALCULO_PREVIDENCIA;
    [TColumn('VALOR_RETIDO_PREVIDENCIA', 'Valor Retido Previdencia', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorRetidoPrevidencia: Extended  read FVALOR_RETIDO_PREVIDENCIA write FVALOR_RETIDO_PREVIDENCIA;
    [TColumn('COMEX_UF_EMBARQUE', 'Comex Uf Embarque', 16, [ldGrid, ldLookup, ldCombobox], False)]
    property ComexUfEmbarque: String  read FCOMEX_UF_EMBARQUE write FCOMEX_UF_EMBARQUE;
    [TColumn('COMEX_LOCAL_EMBARQUE', 'Comex Local Embarque', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property ComexLocalEmbarque: String  read FCOMEX_LOCAL_EMBARQUE write FCOMEX_LOCAL_EMBARQUE;
    [TColumn('COMEX_LOCAL_DESPACHO', 'Comex Local Despacho', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property ComexLocalDespacho: String  read FCOMEX_LOCAL_DESPACHO write FCOMEX_LOCAL_DESPACHO;
    [TColumn('COMPRA_NOTA_EMPENHO', 'Compra Nota Empenho', 176, [ldGrid, ldLookup, ldCombobox], False)]
    property CompraNotaEmpenho: String  read FCOMPRA_NOTA_EMPENHO write FCOMPRA_NOTA_EMPENHO;
    [TColumn('COMPRA_PEDIDO', 'Compra Pedido', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property CompraPedido: String  read FCOMPRA_PEDIDO write FCOMPRA_PEDIDO;
    [TColumn('COMPRA_CONTRATO', 'Compra Contrato', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property CompraContrato: String  read FCOMPRA_CONTRATO write FCOMPRA_CONTRATO;
    [TColumn('INFORMACOES_ADD_FISCO', 'Informacoes Add Fisco', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property InformacoesAddFisco: String  read FINFORMACOES_ADD_FISCO write FINFORMACOES_ADD_FISCO;
    [TColumn('INFORMACOES_ADD_CONTRIBUINTE', 'Informacoes Add Contribuinte', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property InformacoesAddContribuinte: String  read FINFORMACOES_ADD_CONTRIBUINTE write FINFORMACOES_ADD_CONTRIBUINTE;
    [TColumn('STATUS_NOTA', 'Status Nota', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property StatusNota: Integer  read FSTATUS_NOTA write FSTATUS_NOTA;
    [TColumn('TROCO', 'Troco', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property Troco: Extended  read FTROCO write FTROCO;

    [TAssociation('ID', 'ID_EMPRESA')]
    property EmpresaVO: TEmpresaVO read FEmpresaVO write FEmpresaVO;

    [TAssociation('ID', 'ID_TRIBUT_OPERACAO_FISCAL')]
    property TributOperacaoFiscalVO: TTributOperacaoFiscalVO read FTributOperacaoFiscalVO write FTributOperacaoFiscalVO;

    [TAssociation('ID_NFE_CABECALHO', 'ID')]
    property FiscalNotaFiscalEntradaVO: TFiscalNotaFiscalEntradaVO read FFiscalNotaFiscalEntradaVO write FFiscalNotaFiscalEntradaVO;

    [TAssociation('ID_NFE_CABECALHO', 'ID')]
    property NfeEmitenteVO: TNfeEmitenteVO read FNfeEmitenteVO write FNfeEmitenteVO;

    [TAssociation('ID_NFE_CABECALHO', 'ID')]
    property NfeDestinatarioVO: TNfeDestinatarioVO read FNfeDestinatarioVO write FNfeDestinatarioVO;

    [TAssociation('ID_NFE_CABECALHO', 'ID')]
    property NfeLocalRetiradaVO: TNfeLocalRetiradaVO read FNfeLocalRetiradaVO write FNfeLocalRetiradaVO;

    [TAssociation('ID_NFE_CABECALHO', 'ID')]
    property NfeLocalEntregaVO: TNfeLocalEntregaVO read FNfeLocalEntregaVO write FNfeLocalEntregaVO;

    [TAssociation('ID_NFE_CABECALHO', 'ID')]
    property NfeTransporteVO: TNfeTransporteVO read FNfeTransporteVO write FNfeTransporteVO;

    [TAssociation('ID_NFE_CABECALHO', 'ID')]
    property NfeFaturaVO: TNfeFaturaVO read FNfeFaturaVO write FNfeFaturaVO;

    [TAssociation('ID_NFE_CABECALHO', 'ID')]
    property NfeCanaVO: TNfeCanaVO read FNfeCanaVO write FNfeCanaVO;


    [TManyValuedAssociation('ID_NFE_CABECALHO', 'ID')]
    property ListaNfeReferenciadaVO: TObjectList<TNfeReferenciadaVO> read FListaNfeReferenciadaVO write FListaNfeReferenciadaVO;

    [TManyValuedAssociation('ID_NFE_CABECALHO', 'ID')]
    property ListaNfeNfReferenciadaVO: TObjectList<TNfeNfReferenciadaVO> read FListaNfeNfReferenciadaVO write FListaNfeNfReferenciadaVO;

    [TManyValuedAssociation('ID_NFE_CABECALHO', 'ID')]
    property ListaNfeCteReferenciadoVO: TObjectList<TNfeCteReferenciadoVO> read FListaNfeCteReferenciadoVO write FListaNfeCteReferenciadoVO;

    [TManyValuedAssociation('ID_NFE_CABECALHO', 'ID')]
    property ListaNfeProdRuralReferenciadaVO: TObjectList<TNfeProdRuralReferenciadaVO> read FListaNfeProdRuralReferenciadaVO write FListaNfeProdRuralReferenciadaVO;

    [TManyValuedAssociation('ID_NFE_CABECALHO', 'ID')]
    property ListaNfeCupomFiscalReferenciadoVO: TObjectList<TNfeCupomFiscalReferenciadoVO> read FListaNfeCupomFiscalReferenciadoVO write FListaNfeCupomFiscalReferenciadoVO;

    [TManyValuedAssociation('ID_NFE_CABECALHO', 'ID')]
    property ListaNfeAcessoXmlVO: TObjectList<TNfeAcessoXmlVO> read FListaNfeAcessoXmlVO write FListaNfeAcessoXmlVO;

    [TManyValuedAssociation('ID_NFE_CABECALHO', 'ID')]
    property ListaNfeDetalheVO: TObjectList<TNFeDetalheVO> read FListaNfeDetalheVO write FListaNfeDetalheVO;

    [TManyValuedAssociation('ID_NFE_CABECALHO', 'ID')]
    property ListaNfeDuplicataVO: TObjectList<TNfeDuplicataVO> read FListaNfeDuplicataVO write FListaNfeDuplicataVO;

    [TManyValuedAssociation('ID_NFE_CABECALHO', 'ID')]
    property ListaNfeFormaPagamentoVO: TObjectList<TNfeFormaPagamentoVO> read FListaNfeFormaPagamentoVO write FListaNfeFormaPagamentoVO;

    [TManyValuedAssociation('ID_NFE_CABECALHO', 'ID')]
    property ListaNfeProcessoReferenciadoVO: TObjectList<TNfeProcessoReferenciadoVO> read FListaNfeProcessoReferenciadoVO write FListaNfeProcessoReferenciadoVO;

  end;

implementation

constructor TNfeCabecalhoVO.Create;
begin
  inherited;

  FEmpresaVO := TEmpresaVO.Create;
  FTributOperacaoFiscalVO := TTributOperacaoFiscalVO.Create;
  FFiscalNotaFiscalEntradaVO := TFiscalNotaFiscalEntradaVO.Create;
  FNfeEmitenteVO := TNfeEmitenteVO.Create;
  FNfeDestinatarioVO := TNfeDestinatarioVO.Create;
  FNfeLocalRetiradaVO := TNfeLocalRetiradaVO.Create;
  FNfeLocalEntregaVO := TNfeLocalEntregaVO.Create;
  FNfeTransporteVO := TNfeTransporteVO.Create;
  FNfeFaturaVO := TNfeFaturaVO.Create;
  FNfeCanaVO := TNfeCanaVO.Create;

  FListaNfeReferenciadaVO := TObjectList<TNfeReferenciadaVO>.Create;
  FListaNfeNfReferenciadaVO := TObjectList<TNfeNfReferenciadaVO>.Create;
  FListaNfeCteReferenciadoVO := TObjectList<TNfeCteReferenciadoVO>.Create;
  FListaNfeProdRuralReferenciadaVO := TObjectList<TNfeProdRuralReferenciadaVO>.Create;
  FListaNfeCupomFiscalReferenciadoVO := TObjectList<TNfeCupomFiscalReferenciadoVO>.Create;
  FListaNfeAcessoXmlVO := TObjectList<TNfeAcessoXmlVO>.Create;
  FListaNfeDetalheVO := TObjectList<TNfeDetalheVO>.Create;
  FListaNfeDuplicataVO := TObjectList<TNfeDuplicataVO>.Create;
  FListaNfeFormaPagamentoVO := TObjectList<TNfeFormaPagamentoVO>.Create;
  FListaNfeProcessoReferenciadoVO := TObjectList<TNfeProcessoReferenciadoVO>.Create;
end;

destructor TNfeCabecalhoVO.Destroy;
begin
  FreeAndNil(FEmpresaVO);
  FreeAndNil(FTributOperacaoFiscalVO);
  FreeAndNil(FFiscalNotaFiscalEntradaVO);
  FreeAndNil(FNfeEmitenteVO);
  FreeAndNil(FNfeDestinatarioVO);
  FreeAndNil(FNfeLocalRetiradaVO);
  FreeAndNil(FNfeLocalEntregaVO);
  FreeAndNil(FNfeTransporteVO);
  FreeAndNil(FNfeFaturaVO);
  FreeAndNil(FNfeCanaVO);

  FreeAndNil(FListaNfeReferenciadaVO);
  FreeAndNil(FListaNfeNfReferenciadaVO);
  FreeAndNil(FListaNfeCteReferenciadoVO);
  FreeAndNil(FListaNfeProdRuralReferenciadaVO);
  FreeAndNil(FListaNfeCupomFiscalReferenciadoVO);
  FreeAndNil(FListaNfeAcessoXmlVO);
  FreeAndNil(FListaNfeDetalheVO);
  FreeAndNil(FListaNfeDuplicataVO);
  FreeAndNil(FListaNfeFormaPagamentoVO);
  FreeAndNil(FListaNfeProcessoReferenciadoVO);

  inherited;
end;


initialization
  Classes.RegisterClass(TNfeCabecalhoVO);

finalization
  Classes.UnRegisterClass(TNfeCabecalhoVO);

end.
