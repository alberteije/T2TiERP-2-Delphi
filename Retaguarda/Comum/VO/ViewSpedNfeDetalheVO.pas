{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [VIEW_SPED_NFE_DETALHE] 
                                                                                
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
unit ViewSpedNfeDetalheVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils;

type
  [TEntity]
  [TTable('VIEW_SPED_NFE_DETALHE')]
  TViewSpedNfeDetalheVO = class(TVO)
  private
    FID: Integer;
    FID_PRODUTO: Integer;
    FID_NFE_CABECALHO: Integer;
    FNUMERO_ITEM: Integer;
    FCODIGO_PRODUTO: String;
    FGTIN: String;
    FNOME_PRODUTO: String;
    FNCM: String;
    FNVE: String;
    FEX_TIPI: Integer;
    FCFOP: Integer;
    FUNIDADE_COMERCIAL: String;
    FQUANTIDADE_COMERCIAL: Extended;
    FVALOR_UNITARIO_COMERCIAL: Extended;
    FVALOR_BRUTO_PRODUTO: Extended;
    FGTIN_UNIDADE_TRIBUTAVEL: String;
    FUNIDADE_TRIBUTAVEL: String;
    FQUANTIDADE_TRIBUTAVEL: Extended;
    FVALOR_UNITARIO_TRIBUTAVEL: Extended;
    FVALOR_FRETE: Extended;
    FVALOR_SEGURO: Extended;
    FVALOR_DESCONTO: Extended;
    FVALOR_OUTRAS_DESPESAS: Extended;
    FENTRA_TOTAL: Integer;
    FVALOR_SUBTOTAL: Extended;
    FVALOR_TOTAL: Extended;
    FNUMERO_PEDIDO_COMPRA: String;
    FITEM_PEDIDO_COMPRA: Integer;
    FINFORMACOES_ADICIONAIS: String;
    FNUMERO_FCI: String;
    FNUMERO_RECOPI: String;
    FVALOR_TOTAL_TRIBUTOS: Extended;
    FPERCENTUAL_DEVOLVIDO: Extended;
    FVALOR_IPI_DEVOLVIDO: Extended;
    FID_TRIBUT_OPERACAO_FISCAL: Integer;
    FID_UNIDADE_PRODUTO: Integer;
    FCST_COFINS: String;
    FQUANTIDADE_VENDIDA_COFINS: Extended;
    FBASE_CALCULO_COFINS: Extended;
    FALIQUOTA_COFINS_PERCENTUAL: Extended;
    FALIQUOTA_COFINS_REAIS: Extended;
    FVALOR_COFINS: Extended;
    FORIGEM_MERCADORIA: Integer;
    FCST_ICMS: String;
    FCSOSN: String;
    FMODALIDADE_BC_ICMS: Integer;
    FTAXA_REDUCAO_BC_ICMS: Extended;
    FBASE_CALCULO_ICMS: Extended;
    FALIQUOTA_ICMS: Extended;
    FVALOR_ICMS: Extended;
    FMOTIVO_DESONERACAO_ICMS: Integer;
    FMODALIDADE_BC_ICMS_ST: Integer;
    FPERCENTUAL_MVA_ICMS_ST: Extended;
    FPERCENTUAL_REDUCAO_BC_ICMS_ST: Extended;
    FVALOR_BASE_CALCULO_ICMS_ST: Extended;
    FALIQUOTA_ICMS_ST: Extended;
    FVALOR_ICMS_ST: Extended;
    FVALOR_BC_ICMS_ST_RETIDO: Extended;
    FVALOR_ICMS_ST_RETIDO: Extended;
    FVALOR_BC_ICMS_ST_DESTINO: Extended;
    FVALOR_ICMS_ST_DESTINO: Extended;
    FALIQUOTA_CREDITO_ICMS_SN: Extended;
    FVALOR_CREDITO_ICMS_SN: Extended;
    FPERCENTUAL_BC_OPERACAO_PROPRIA: Extended;
    FUF_ST: String;
    FVALOR_BC_II: Extended;
    FVALOR_DESPESAS_ADUANEIRAS: Extended;
    FVALOR_IMPOSTO_IMPORTACAO: Extended;
    FVALOR_IOF: Extended;
    FENQUADRAMENTO_IPI: String;
    FCNPJ_PRODUTOR: String;
    FCODIGO_SELO_IPI: String;
    FQUANTIDADE_SELO_IPI: Integer;
    FENQUADRAMENTO_LEGAL_IPI: String;
    FCST_IPI: String;
    FVALOR_BASE_CALCULO_IPI: Extended;
    FALIQUOTA_IPI: Extended;
    FQUANTIDADE_UNIDADE_TRIBUTAVEL: Extended;
    FVALOR_UNIDADE_TRIBUTAVEL: Extended;
    FVALOR_IPI: Extended;
    FBASE_CALCULO_ISSQN: Extended;
    FALIQUOTA_ISSQN: Extended;
    FVALOR_ISSQN: Extended;
    FMUNICIPIO_ISSQN: Integer;
    FITEM_LISTA_SERVICOS: Integer;
    FCST_PIS: String;
    FQUANTIDADE_VENDIDA_PIS: Extended;
    FVALOR_BASE_CALCULO_PIS: Extended;
    FALIQUOTA_PIS_PERCENTUAL: Extended;
    FALIQUOTA_PIS_REAIS: Extended;
    FVALOR_PIS: Extended;

  public 
    [TId('ID')]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;
    [TColumn('ID_PRODUTO', 'Id Produto', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdProduto: Integer  read FID_PRODUTO write FID_PRODUTO;
    [TColumn('ID_NFE_CABECALHO', 'Id Nfe Cabecalho', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdNfeCabecalho: Integer  read FID_NFE_CABECALHO write FID_NFE_CABECALHO;
    [TColumn('NUMERO_ITEM', 'Numero Item', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property NumeroItem: Integer  read FNUMERO_ITEM write FNUMERO_ITEM;
    [TColumn('CODIGO_PRODUTO', 'Codigo Produto', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property CodigoProduto: String  read FCODIGO_PRODUTO write FCODIGO_PRODUTO;
    [TColumn('GTIN', 'Gtin', 112, [ldGrid, ldLookup, ldCombobox], False)]
    property Gtin: String  read FGTIN write FGTIN;
    [TColumn('NOME_PRODUTO', 'Nome Produto', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property NomeProduto: String  read FNOME_PRODUTO write FNOME_PRODUTO;
    [TColumn('NCM', 'Ncm', 64, [ldGrid, ldLookup, ldCombobox], False)]
    property Ncm: String  read FNCM write FNCM;
    [TColumn('NVE', 'Nve', 48, [ldGrid, ldLookup, ldCombobox], False)]
    property Nve: String  read FNVE write FNVE;
    [TColumn('EX_TIPI', 'Ex Tipi', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property ExTipi: Integer  read FEX_TIPI write FEX_TIPI;
    [TColumn('CFOP', 'Cfop', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Cfop: Integer  read FCFOP write FCFOP;
    [TColumn('UNIDADE_COMERCIAL', 'Unidade Comercial', 48, [ldGrid, ldLookup, ldCombobox], False)]
    property UnidadeComercial: String  read FUNIDADE_COMERCIAL write FUNIDADE_COMERCIAL;
    [TColumn('QUANTIDADE_COMERCIAL', 'Quantidade Comercial', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property QuantidadeComercial: Extended  read FQUANTIDADE_COMERCIAL write FQUANTIDADE_COMERCIAL;
    [TColumn('VALOR_UNITARIO_COMERCIAL', 'Valor Unitario Comercial', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorUnitarioComercial: Extended  read FVALOR_UNITARIO_COMERCIAL write FVALOR_UNITARIO_COMERCIAL;
    [TColumn('VALOR_BRUTO_PRODUTO', 'Valor Bruto Produto', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorBrutoProduto: Extended  read FVALOR_BRUTO_PRODUTO write FVALOR_BRUTO_PRODUTO;
    [TColumn('GTIN_UNIDADE_TRIBUTAVEL', 'Gtin Unidade Tributavel', 112, [ldGrid, ldLookup, ldCombobox], False)]
    property GtinUnidadeTributavel: String  read FGTIN_UNIDADE_TRIBUTAVEL write FGTIN_UNIDADE_TRIBUTAVEL;
    [TColumn('UNIDADE_TRIBUTAVEL', 'Unidade Tributavel', 48, [ldGrid, ldLookup, ldCombobox], False)]
    property UnidadeTributavel: String  read FUNIDADE_TRIBUTAVEL write FUNIDADE_TRIBUTAVEL;
    [TColumn('QUANTIDADE_TRIBUTAVEL', 'Quantidade Tributavel', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property QuantidadeTributavel: Extended  read FQUANTIDADE_TRIBUTAVEL write FQUANTIDADE_TRIBUTAVEL;
    [TColumn('VALOR_UNITARIO_TRIBUTAVEL', 'Valor Unitario Tributavel', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorUnitarioTributavel: Extended  read FVALOR_UNITARIO_TRIBUTAVEL write FVALOR_UNITARIO_TRIBUTAVEL;
    [TColumn('VALOR_FRETE', 'Valor Frete', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorFrete: Extended  read FVALOR_FRETE write FVALOR_FRETE;
    [TColumn('VALOR_SEGURO', 'Valor Seguro', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorSeguro: Extended  read FVALOR_SEGURO write FVALOR_SEGURO;
    [TColumn('VALOR_DESCONTO', 'Valor Desconto', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorDesconto: Extended  read FVALOR_DESCONTO write FVALOR_DESCONTO;
    [TColumn('VALOR_OUTRAS_DESPESAS', 'Valor Outras Despesas', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorOutrasDespesas: Extended  read FVALOR_OUTRAS_DESPESAS write FVALOR_OUTRAS_DESPESAS;
    [TColumn('ENTRA_TOTAL', 'Entra Total', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property EntraTotal: Integer  read FENTRA_TOTAL write FENTRA_TOTAL;
    [TColumn('VALOR_SUBTOTAL', 'Valor Subtotal', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorSubtotal: Extended  read FVALOR_SUBTOTAL write FVALOR_SUBTOTAL;
    [TColumn('VALOR_TOTAL', 'Valor Total', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorTotal: Extended  read FVALOR_TOTAL write FVALOR_TOTAL;
    [TColumn('NUMERO_PEDIDO_COMPRA', 'Numero Pedido Compra', 120, [ldGrid, ldLookup, ldCombobox], False)]
    property NumeroPedidoCompra: String  read FNUMERO_PEDIDO_COMPRA write FNUMERO_PEDIDO_COMPRA;
    [TColumn('ITEM_PEDIDO_COMPRA', 'Item Pedido Compra', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property ItemPedidoCompra: Integer  read FITEM_PEDIDO_COMPRA write FITEM_PEDIDO_COMPRA;
    [TColumn('INFORMACOES_ADICIONAIS', 'Informacoes Adicionais', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property InformacoesAdicionais: String  read FINFORMACOES_ADICIONAIS write FINFORMACOES_ADICIONAIS;
    [TColumn('NUMERO_FCI', 'Numero Fci', 288, [ldGrid, ldLookup, ldCombobox], False)]
    property NumeroFci: String  read FNUMERO_FCI write FNUMERO_FCI;
    [TColumn('NUMERO_RECOPI', 'Numero Recopi', 160, [ldGrid, ldLookup, ldCombobox], False)]
    property NumeroRecopi: String  read FNUMERO_RECOPI write FNUMERO_RECOPI;
    [TColumn('VALOR_TOTAL_TRIBUTOS', 'Valor Total Tributos', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorTotalTributos: Extended  read FVALOR_TOTAL_TRIBUTOS write FVALOR_TOTAL_TRIBUTOS;
    [TColumn('PERCENTUAL_DEVOLVIDO', 'Percentual Devolvido', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property PercentualDevolvido: Extended  read FPERCENTUAL_DEVOLVIDO write FPERCENTUAL_DEVOLVIDO;
    [TColumn('VALOR_IPI_DEVOLVIDO', 'Valor Ipi Devolvido', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorIpiDevolvido: Extended  read FVALOR_IPI_DEVOLVIDO write FVALOR_IPI_DEVOLVIDO;
    [TColumn('ID_TRIBUT_OPERACAO_FISCAL', 'Id Tribut Operacao Fiscal', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdTributOperacaoFiscal: Integer  read FID_TRIBUT_OPERACAO_FISCAL write FID_TRIBUT_OPERACAO_FISCAL;
    [TColumn('ID_UNIDADE_PRODUTO', 'Id Unidade Produto', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdUnidadeProduto: Integer  read FID_UNIDADE_PRODUTO write FID_UNIDADE_PRODUTO;
    [TColumn('CST_COFINS', 'Cst Cofins', 16, [ldGrid, ldLookup, ldCombobox], False)]
    property CstCofins: String  read FCST_COFINS write FCST_COFINS;
    [TColumn('QUANTIDADE_VENDIDA_COFINS', 'Quantidade Vendida Cofins', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property QuantidadeVendidaCofins: Extended  read FQUANTIDADE_VENDIDA_COFINS write FQUANTIDADE_VENDIDA_COFINS;
    [TColumn('BASE_CALCULO_COFINS', 'Base Calculo Cofins', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property BaseCalculoCofins: Extended  read FBASE_CALCULO_COFINS write FBASE_CALCULO_COFINS;
    [TColumn('ALIQUOTA_COFINS_PERCENTUAL', 'Aliquota Cofins Percentual', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property AliquotaCofinsPercentual: Extended  read FALIQUOTA_COFINS_PERCENTUAL write FALIQUOTA_COFINS_PERCENTUAL;
    [TColumn('ALIQUOTA_COFINS_REAIS', 'Aliquota Cofins Reais', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property AliquotaCofinsReais: Extended  read FALIQUOTA_COFINS_REAIS write FALIQUOTA_COFINS_REAIS;
    [TColumn('VALOR_COFINS', 'Valor Cofins', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorCofins: Extended  read FVALOR_COFINS write FVALOR_COFINS;
    [TColumn('ORIGEM_MERCADORIA', 'Origem Mercadoria', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property OrigemMercadoria: Integer  read FORIGEM_MERCADORIA write FORIGEM_MERCADORIA;
    [TColumn('CST_ICMS', 'Cst Icms', 16, [ldGrid, ldLookup, ldCombobox], False)]
    property CstIcms: String  read FCST_ICMS write FCST_ICMS;
    [TColumn('CSOSN', 'Csosn', 24, [ldGrid, ldLookup, ldCombobox], False)]
    property Csosn: String  read FCSOSN write FCSOSN;
    [TColumn('MODALIDADE_BC_ICMS', 'Modalidade Bc Icms', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property ModalidadeBcIcms: Integer  read FMODALIDADE_BC_ICMS write FMODALIDADE_BC_ICMS;
    [TColumn('TAXA_REDUCAO_BC_ICMS', 'Taxa Reducao Bc Icms', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property TaxaReducaoBcIcms: Extended  read FTAXA_REDUCAO_BC_ICMS write FTAXA_REDUCAO_BC_ICMS;
    [TColumn('BASE_CALCULO_ICMS', 'Base Calculo Icms', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property BaseCalculoIcms: Extended  read FBASE_CALCULO_ICMS write FBASE_CALCULO_ICMS;
    [TColumn('ALIQUOTA_ICMS', 'Aliquota Icms', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property AliquotaIcms: Extended  read FALIQUOTA_ICMS write FALIQUOTA_ICMS;
    [TColumn('VALOR_ICMS', 'Valor Icms', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorIcms: Extended  read FVALOR_ICMS write FVALOR_ICMS;
    [TColumn('MOTIVO_DESONERACAO_ICMS', 'Motivo Desoneracao Icms', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property MotivoDesoneracaoIcms: Integer  read FMOTIVO_DESONERACAO_ICMS write FMOTIVO_DESONERACAO_ICMS;
    [TColumn('MODALIDADE_BC_ICMS_ST', 'Modalidade Bc Icms St', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property ModalidadeBcIcmsSt: Integer  read FMODALIDADE_BC_ICMS_ST write FMODALIDADE_BC_ICMS_ST;
    [TColumn('PERCENTUAL_MVA_ICMS_ST', 'Percentual Mva Icms St', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property PercentualMvaIcmsSt: Extended  read FPERCENTUAL_MVA_ICMS_ST write FPERCENTUAL_MVA_ICMS_ST;
    [TColumn('PERCENTUAL_REDUCAO_BC_ICMS_ST', 'Percentual Reducao Bc Icms St', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property PercentualReducaoBcIcmsSt: Extended  read FPERCENTUAL_REDUCAO_BC_ICMS_ST write FPERCENTUAL_REDUCAO_BC_ICMS_ST;
    [TColumn('VALOR_BASE_CALCULO_ICMS_ST', 'Valor Base Calculo Icms St', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorBaseCalculoIcmsSt: Extended  read FVALOR_BASE_CALCULO_ICMS_ST write FVALOR_BASE_CALCULO_ICMS_ST;
    [TColumn('ALIQUOTA_ICMS_ST', 'Aliquota Icms St', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property AliquotaIcmsSt: Extended  read FALIQUOTA_ICMS_ST write FALIQUOTA_ICMS_ST;
    [TColumn('VALOR_ICMS_ST', 'Valor Icms St', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorIcmsSt: Extended  read FVALOR_ICMS_ST write FVALOR_ICMS_ST;
    [TColumn('VALOR_BC_ICMS_ST_RETIDO', 'Valor Bc Icms St Retido', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorBcIcmsStRetido: Extended  read FVALOR_BC_ICMS_ST_RETIDO write FVALOR_BC_ICMS_ST_RETIDO;
    [TColumn('VALOR_ICMS_ST_RETIDO', 'Valor Icms St Retido', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorIcmsStRetido: Extended  read FVALOR_ICMS_ST_RETIDO write FVALOR_ICMS_ST_RETIDO;
    [TColumn('VALOR_BC_ICMS_ST_DESTINO', 'Valor Bc Icms St Destino', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorBcIcmsStDestino: Extended  read FVALOR_BC_ICMS_ST_DESTINO write FVALOR_BC_ICMS_ST_DESTINO;
    [TColumn('VALOR_ICMS_ST_DESTINO', 'Valor Icms St Destino', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorIcmsStDestino: Extended  read FVALOR_ICMS_ST_DESTINO write FVALOR_ICMS_ST_DESTINO;
    [TColumn('ALIQUOTA_CREDITO_ICMS_SN', 'Aliquota Credito Icms Sn', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property AliquotaCreditoIcmsSn: Extended  read FALIQUOTA_CREDITO_ICMS_SN write FALIQUOTA_CREDITO_ICMS_SN;
    [TColumn('VALOR_CREDITO_ICMS_SN', 'Valor Credito Icms Sn', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorCreditoIcmsSn: Extended  read FVALOR_CREDITO_ICMS_SN write FVALOR_CREDITO_ICMS_SN;
    [TColumn('PERCENTUAL_BC_OPERACAO_PROPRIA', 'Percentual Bc Operacao Propria', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property PercentualBcOperacaoPropria: Extended  read FPERCENTUAL_BC_OPERACAO_PROPRIA write FPERCENTUAL_BC_OPERACAO_PROPRIA;
    [TColumn('UF_ST', 'Uf St', 16, [ldGrid, ldLookup, ldCombobox], False)]
    property UfSt: String  read FUF_ST write FUF_ST;
    [TColumn('VALOR_BC_II', 'Valor Bc Ii', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorBcIi: Extended  read FVALOR_BC_II write FVALOR_BC_II;
    [TColumn('VALOR_DESPESAS_ADUANEIRAS', 'Valor Despesas Aduaneiras', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorDespesasAduaneiras: Extended  read FVALOR_DESPESAS_ADUANEIRAS write FVALOR_DESPESAS_ADUANEIRAS;
    [TColumn('VALOR_IMPOSTO_IMPORTACAO', 'Valor Imposto Importacao', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorImpostoImportacao: Extended  read FVALOR_IMPOSTO_IMPORTACAO write FVALOR_IMPOSTO_IMPORTACAO;
    [TColumn('VALOR_IOF', 'Valor Iof', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorIof: Extended  read FVALOR_IOF write FVALOR_IOF;
    [TColumn('ENQUADRAMENTO_IPI', 'Enquadramento Ipi', 40, [ldGrid, ldLookup, ldCombobox], False)]
    property EnquadramentoIpi: String  read FENQUADRAMENTO_IPI write FENQUADRAMENTO_IPI;
    [TColumn('CNPJ_PRODUTOR', 'Cnpj Produtor', 112, [ldGrid, ldLookup, ldCombobox], False)]
    property CnpjProdutor: String  read FCNPJ_PRODUTOR write FCNPJ_PRODUTOR;
    [TColumn('CODIGO_SELO_IPI', 'Codigo Selo Ipi', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property CodigoSeloIpi: String  read FCODIGO_SELO_IPI write FCODIGO_SELO_IPI;
    [TColumn('QUANTIDADE_SELO_IPI', 'Quantidade Selo Ipi', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property QuantidadeSeloIpi: Integer  read FQUANTIDADE_SELO_IPI write FQUANTIDADE_SELO_IPI;
    [TColumn('ENQUADRAMENTO_LEGAL_IPI', 'Enquadramento Legal Ipi', 24, [ldGrid, ldLookup, ldCombobox], False)]
    property EnquadramentoLegalIpi: String  read FENQUADRAMENTO_LEGAL_IPI write FENQUADRAMENTO_LEGAL_IPI;
    [TColumn('CST_IPI', 'Cst Ipi', 16, [ldGrid, ldLookup, ldCombobox], False)]
    property CstIpi: String  read FCST_IPI write FCST_IPI;
    [TColumn('VALOR_BASE_CALCULO_IPI', 'Valor Base Calculo Ipi', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorBaseCalculoIpi: Extended  read FVALOR_BASE_CALCULO_IPI write FVALOR_BASE_CALCULO_IPI;
    [TColumn('ALIQUOTA_IPI', 'Aliquota Ipi', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property AliquotaIpi: Extended  read FALIQUOTA_IPI write FALIQUOTA_IPI;
    [TColumn('QUANTIDADE_UNIDADE_TRIBUTAVEL', 'Quantidade Unidade Tributavel', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property QuantidadeUnidadeTributavel: Extended  read FQUANTIDADE_UNIDADE_TRIBUTAVEL write FQUANTIDADE_UNIDADE_TRIBUTAVEL;
    [TColumn('VALOR_UNIDADE_TRIBUTAVEL', 'Valor Unidade Tributavel', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorUnidadeTributavel: Extended  read FVALOR_UNIDADE_TRIBUTAVEL write FVALOR_UNIDADE_TRIBUTAVEL;
    [TColumn('VALOR_IPI', 'Valor Ipi', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorIpi: Extended  read FVALOR_IPI write FVALOR_IPI;
    [TColumn('BASE_CALCULO_ISSQN', 'Base Calculo Issqn', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property BaseCalculoIssqn: Extended  read FBASE_CALCULO_ISSQN write FBASE_CALCULO_ISSQN;
    [TColumn('ALIQUOTA_ISSQN', 'Aliquota Issqn', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property AliquotaIssqn: Extended  read FALIQUOTA_ISSQN write FALIQUOTA_ISSQN;
    [TColumn('VALOR_ISSQN', 'Valor Issqn', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorIssqn: Extended  read FVALOR_ISSQN write FVALOR_ISSQN;
    [TColumn('MUNICIPIO_ISSQN', 'Municipio Issqn', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property MunicipioIssqn: Integer  read FMUNICIPIO_ISSQN write FMUNICIPIO_ISSQN;
    [TColumn('ITEM_LISTA_SERVICOS', 'Item Lista Servicos', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property ItemListaServicos: Integer  read FITEM_LISTA_SERVICOS write FITEM_LISTA_SERVICOS;
    [TColumn('CST_PIS', 'Cst Pis', 16, [ldGrid, ldLookup, ldCombobox], False)]
    property CstPis: String  read FCST_PIS write FCST_PIS;
    [TColumn('QUANTIDADE_VENDIDA_PIS', 'Quantidade Vendida Pis', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property QuantidadeVendidaPis: Extended  read FQUANTIDADE_VENDIDA_PIS write FQUANTIDADE_VENDIDA_PIS;
    [TColumn('VALOR_BASE_CALCULO_PIS', 'Valor Base Calculo Pis', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorBaseCalculoPis: Extended  read FVALOR_BASE_CALCULO_PIS write FVALOR_BASE_CALCULO_PIS;
    [TColumn('ALIQUOTA_PIS_PERCENTUAL', 'Aliquota Pis Percentual', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property AliquotaPisPercentual: Extended  read FALIQUOTA_PIS_PERCENTUAL write FALIQUOTA_PIS_PERCENTUAL;
    [TColumn('ALIQUOTA_PIS_REAIS', 'Aliquota Pis Reais', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property AliquotaPisReais: Extended  read FALIQUOTA_PIS_REAIS write FALIQUOTA_PIS_REAIS;
    [TColumn('VALOR_PIS', 'Valor Pis', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorPis: Extended  read FVALOR_PIS write FVALOR_PIS;

  end;

implementation


initialization
  Classes.RegisterClass(TViewSpedNfeDetalheVO);

finalization
  Classes.UnRegisterClass(TViewSpedNfeDetalheVO);

end.
