{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [CTE_CABECALHO] 
                                                                                
The MIT License                                                                 
                                                                                
Copyright: Copyright (C) 2016 T2Ti.COM                                          
                                                                                
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
unit CteCabecalhoVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils,

  EmpresaVO, CTeDestinatarioVO, CTeLocalEntregaVO, CteLocalColetaVO,
  CTeFaturaVO, CTeDuplicataVO, CteInformacaoNfOutrosVO;

type
  [TEntity]
  [TTable('CTE_CABECALHO')]
  TCteCabecalhoVO = class(TVO)
  private
    FID: Integer;
    FID_EMPRESA: Integer;
    FUF_EMITENTE: Integer;
    FCODIGO_NUMERICO: String;
    FCFOP: Integer;
    FNATUREZA_OPERACAO: String;
    FFORMA_PAGAMENTO: Integer;
    FMODELO: String;
    FSERIE: String;
    FNUMERO: String;
    FDATA_HORA_EMISSAO: TDateTime;
    FFORMATO_IMPRESSAO_DACTE: Integer;
    FTIPO_EMISSAO: Integer;
    FCHAVE_ACESSO: String;
    FDIGITO_CHAVE_ACESSO: String;
    FAMBIENTE: Integer;
    FTIPO_CTE: Integer;
    FPROCESSO_EMISSAO: Integer;
    FVERSAO_PROCESSO_EMISSAO: String;
    FCHAVE_REFERENCIADO: String;
    FCODIGO_MUNICIPIO_ENVIO: Integer;
    FNOME_MUNICIPIO_ENVIO: String;
    FUF_ENVIO: String;
    FMODAL: String;
    FTIPO_SERVICO: Integer;
    FCODIGO_MUNICIPIO_INI_PRESTACAO: Integer;
    FNOME_MUNICIPIO_INI_PRESTACAO: String;
    FUF_INI_PRESTACAO: String;
    FCODIGO_MUNICIPIO_FIM_PRESTACAO: Integer;
    FNOME_MUNICIPIO_FIM_PRESTACAO: String;
    FUF_FIM_PRESTACAO: String;
    FRETIRA: Integer;
    FRETIRA_DETALHE: String;
    FTOMADOR: Integer;
    FDATA_ENTRADA_CONTINGENCIA: TDateTime;
    FJUSTIFICATIVA_CONTINGENCIA: String;
    FCARAC_ADICIONAL_TRANSPORTE: String;
    FCARAC_ADICIONAL_SERVICO: String;
    FFUNCIONARIO_EMISSOR: String;
    FFLUXO_ORIGEM: String;
    FENTREGA_TIPO_PERIODO: Integer;
    FENTREGA_DATA_PROGRAMADA: TDateTime;
    FENTREGA_DATA_INICIAL: TDateTime;
    FENTREGA_DATA_FINAL: TDateTime;
    FENTREGA_TIPO_HORA: Integer;
    FENTREGA_HORA_PROGRAMADA: String;
    FENTREGA_HORA_INICIAL: String;
    FENTREGA_HORA_FINAL: String;
    FMUNICIPIO_ORIGEM_CALCULO: String;
    FMUNICIPIO_DESTINO_CALCULO: String;
    FOBSERVACOES_GERAIS: String;
    FVALOR_TOTAL_SERVICO: Extended;
    FVALOR_RECEBER: Extended;
    FCST: String;
    FBASE_CALCULO_ICMS: Extended;
    FALIQUOTA_ICMS: Extended;
    FVALOR_ICMS: Extended;
    FPERCENTUAL_REDUCAO_BC_ICMS: Extended;
    FVALOR_BC_ICMS_ST_RETIDO: Extended;
    FVALOR_ICMS_ST_RETIDO: Extended;
    FALIQUOTA_ICMS_ST_RETIDO: Extended;
    FVALOR_CREDITO_PRESUMIDO_ICMS: Extended;
    FPERCENTUAL_BC_ICMS_OUTRA_UF: Extended;
    FVALOR_BC_ICMS_OUTRA_UF: Extended;
    FALIQUOTA_ICMS_OUTRA_UF: Extended;
    FVALOR_ICMS_OUTRA_UF: Extended;
    FSIMPLES_NACIONAL_INDICADOR: Integer;
    FSIMPLES_NACIONAL_TOTAL: Extended;
    FINFORMACOES_ADD_FISCO: String;
    FVALOR_TOTAL_CARGA: Extended;
    FPRODUTO_PREDOMINANTE: String;
    FCARGA_OUTRAS_CARACTERISTICAS: String;
    FMODAL_VERSAO_LAYOUT: Integer;
    FCHAVE_CTE_SUBSTITUIDO: String;

    //Transientes
    FEmpresaVO: TEmpresaVO;
    FCTeDestinatarioVO: TCTeDestinatarioVO;
    FCTeLocalEntregaVO: TCteLocalEntregaVO;
    FCteLocalColetaVO: TCteLocalColetaVO;
    FCTeFaturaVO: TCTeFaturaVO;

    FListaCTeDuplicataVO: TObjectList<TCTeDuplicataVO>;
    FListaCteInformacaoNfOutrosVO: TObjectList<TCteInformacaoNfOutrosVO>;


  public 
    constructor Create; override;
    destructor Destroy; override;

    [TId('ID', [ldGrid, ldLookup, ldComboBox])]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;
    [TColumn('ID_EMPRESA', 'Id Empresa', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdEmpresa: Integer  read FID_EMPRESA write FID_EMPRESA;
    [TColumn('UF_EMITENTE', 'Uf Emitente', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property UfEmitente: Integer  read FUF_EMITENTE write FUF_EMITENTE;
    [TColumn('CODIGO_NUMERICO', 'Codigo Numerico', 64, [ldGrid, ldLookup, ldCombobox], False)]
    property CodigoNumerico: String  read FCODIGO_NUMERICO write FCODIGO_NUMERICO;
    [TColumn('CFOP', 'Cfop', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Cfop: Integer  read FCFOP write FCFOP;
    [TColumn('NATUREZA_OPERACAO', 'Natureza Operacao', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property NaturezaOperacao: String  read FNATUREZA_OPERACAO write FNATUREZA_OPERACAO;
    [TColumn('FORMA_PAGAMENTO', 'Forma Pagamento', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property FormaPagamento: Integer  read FFORMA_PAGAMENTO write FFORMA_PAGAMENTO;
    [TColumn('MODELO', 'Modelo', 16, [ldGrid, ldLookup, ldCombobox], False)]
    property Modelo: String  read FMODELO write FMODELO;
    [TColumn('SERIE', 'Serie', 24, [ldGrid, ldLookup, ldCombobox], False)]
    property Serie: String  read FSERIE write FSERIE;
    [TColumn('NUMERO', 'Numero', 72, [ldGrid, ldLookup, ldCombobox], False)]
    property Numero: String  read FNUMERO write FNUMERO;
    [TColumn('DATA_HORA_EMISSAO', 'Data Hora Emissao', 272, [ldGrid, ldLookup, ldCombobox], False)]
    property DataHoraEmissao: TDateTime  read FDATA_HORA_EMISSAO write FDATA_HORA_EMISSAO;
    [TColumn('FORMATO_IMPRESSAO_DACTE', 'Formato Impressao Dacte', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property FormatoImpressaoDacte: Integer  read FFORMATO_IMPRESSAO_DACTE write FFORMATO_IMPRESSAO_DACTE;
    [TColumn('TIPO_EMISSAO', 'Tipo Emissao', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property TipoEmissao: Integer  read FTIPO_EMISSAO write FTIPO_EMISSAO;
    [TColumn('CHAVE_ACESSO', 'Chave Acesso', 352, [ldGrid, ldLookup, ldCombobox], False)]
    property ChaveAcesso: String  read FCHAVE_ACESSO write FCHAVE_ACESSO;
    [TColumn('DIGITO_CHAVE_ACESSO', 'Digito Chave Acesso', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property DigitoChaveAcesso: String  read FDIGITO_CHAVE_ACESSO write FDIGITO_CHAVE_ACESSO;
    [TColumn('AMBIENTE', 'Ambiente', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Ambiente: Integer  read FAMBIENTE write FAMBIENTE;
    [TColumn('TIPO_CTE', 'Tipo Cte', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property TipoCte: Integer  read FTIPO_CTE write FTIPO_CTE;
    [TColumn('PROCESSO_EMISSAO', 'Processo Emissao', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property ProcessoEmissao: Integer  read FPROCESSO_EMISSAO write FPROCESSO_EMISSAO;
    [TColumn('VERSAO_PROCESSO_EMISSAO', 'Versao Processo Emissao', 160, [ldGrid, ldLookup, ldCombobox], False)]
    property VersaoProcessoEmissao: String  read FVERSAO_PROCESSO_EMISSAO write FVERSAO_PROCESSO_EMISSAO;
    [TColumn('CHAVE_REFERENCIADO', 'Chave Referenciado', 352, [ldGrid, ldLookup, ldCombobox], False)]
    property ChaveReferenciado: String  read FCHAVE_REFERENCIADO write FCHAVE_REFERENCIADO;
    [TColumn('CODIGO_MUNICIPIO_ENVIO', 'Codigo Municipio Envio', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property CodigoMunicipioEnvio: Integer  read FCODIGO_MUNICIPIO_ENVIO write FCODIGO_MUNICIPIO_ENVIO;
    [TColumn('NOME_MUNICIPIO_ENVIO', 'Nome Municipio Envio', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property NomeMunicipioEnvio: String  read FNOME_MUNICIPIO_ENVIO write FNOME_MUNICIPIO_ENVIO;
    [TColumn('UF_ENVIO', 'Uf Envio', 16, [ldGrid, ldLookup, ldCombobox], False)]
    property UfEnvio: String  read FUF_ENVIO write FUF_ENVIO;
    [TColumn('MODAL', 'Modal', 16, [ldGrid, ldLookup, ldCombobox], False)]
    property Modal: String  read FMODAL write FMODAL;
    [TColumn('TIPO_SERVICO', 'Tipo Servico', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property TipoServico: Integer  read FTIPO_SERVICO write FTIPO_SERVICO;
    [TColumn('CODIGO_MUNICIPIO_INI_PRESTACAO', 'Codigo Municipio Ini Prestacao', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property CodigoMunicipioIniPrestacao: Integer  read FCODIGO_MUNICIPIO_INI_PRESTACAO write FCODIGO_MUNICIPIO_INI_PRESTACAO;
    [TColumn('NOME_MUNICIPIO_INI_PRESTACAO', 'Nome Municipio Ini Prestacao', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property NomeMunicipioIniPrestacao: String  read FNOME_MUNICIPIO_INI_PRESTACAO write FNOME_MUNICIPIO_INI_PRESTACAO;
    [TColumn('UF_INI_PRESTACAO', 'Uf Ini Prestacao', 16, [ldGrid, ldLookup, ldCombobox], False)]
    property UfIniPrestacao: String  read FUF_INI_PRESTACAO write FUF_INI_PRESTACAO;
    [TColumn('CODIGO_MUNICIPIO_FIM_PRESTACAO', 'Codigo Municipio Fim Prestacao', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property CodigoMunicipioFimPrestacao: Integer  read FCODIGO_MUNICIPIO_FIM_PRESTACAO write FCODIGO_MUNICIPIO_FIM_PRESTACAO;
    [TColumn('NOME_MUNICIPIO_FIM_PRESTACAO', 'Nome Municipio Fim Prestacao', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property NomeMunicipioFimPrestacao: String  read FNOME_MUNICIPIO_FIM_PRESTACAO write FNOME_MUNICIPIO_FIM_PRESTACAO;
    [TColumn('UF_FIM_PRESTACAO', 'Uf Fim Prestacao', 16, [ldGrid, ldLookup, ldCombobox], False)]
    property UfFimPrestacao: String  read FUF_FIM_PRESTACAO write FUF_FIM_PRESTACAO;
    [TColumn('RETIRA', 'Retira', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Retira: Integer  read FRETIRA write FRETIRA;
    [TColumn('RETIRA_DETALHE', 'Retira Detalhe', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property RetiraDetalhe: String  read FRETIRA_DETALHE write FRETIRA_DETALHE;
    [TColumn('TOMADOR', 'Tomador', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Tomador: Integer  read FTOMADOR write FTOMADOR;
    [TColumn('DATA_ENTRADA_CONTINGENCIA', 'Data Entrada Contingencia', 272, [ldGrid, ldLookup, ldCombobox], False)]
    property DataEntradaContingencia: TDateTime  read FDATA_ENTRADA_CONTINGENCIA write FDATA_ENTRADA_CONTINGENCIA;
    [TColumn('JUSTIFICATIVA_CONTINGENCIA', 'Justificativa Contingencia', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property JustificativaContingencia: String  read FJUSTIFICATIVA_CONTINGENCIA write FJUSTIFICATIVA_CONTINGENCIA;
    [TColumn('CARAC_ADICIONAL_TRANSPORTE', 'Carac Adicional Transporte', 120, [ldGrid, ldLookup, ldCombobox], False)]
    property CaracAdicionalTransporte: String  read FCARAC_ADICIONAL_TRANSPORTE write FCARAC_ADICIONAL_TRANSPORTE;
    [TColumn('CARAC_ADICIONAL_SERVICO', 'Carac Adicional Servico', 240, [ldGrid, ldLookup, ldCombobox], False)]
    property CaracAdicionalServico: String  read FCARAC_ADICIONAL_SERVICO write FCARAC_ADICIONAL_SERVICO;
    [TColumn('FUNCIONARIO_EMISSOR', 'Funcionario Emissor', 160, [ldGrid, ldLookup, ldCombobox], False)]
    property FuncionarioEmissor: String  read FFUNCIONARIO_EMISSOR write FFUNCIONARIO_EMISSOR;
    [TColumn('FLUXO_ORIGEM', 'Fluxo Origem', 120, [ldGrid, ldLookup, ldCombobox], False)]
    property FluxoOrigem: String  read FFLUXO_ORIGEM write FFLUXO_ORIGEM;
    [TColumn('ENTREGA_TIPO_PERIODO', 'Entrega Tipo Periodo', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property EntregaTipoPeriodo: Integer  read FENTREGA_TIPO_PERIODO write FENTREGA_TIPO_PERIODO;
    [TColumn('ENTREGA_DATA_PROGRAMADA', 'Entrega Data Programada', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property EntregaDataProgramada: TDateTime  read FENTREGA_DATA_PROGRAMADA write FENTREGA_DATA_PROGRAMADA;
    [TColumn('ENTREGA_DATA_INICIAL', 'Entrega Data Inicial', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property EntregaDataInicial: TDateTime  read FENTREGA_DATA_INICIAL write FENTREGA_DATA_INICIAL;
    [TColumn('ENTREGA_DATA_FINAL', 'Entrega Data Final', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property EntregaDataFinal: TDateTime  read FENTREGA_DATA_FINAL write FENTREGA_DATA_FINAL;
    [TColumn('ENTREGA_TIPO_HORA', 'Entrega Tipo Hora', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property EntregaTipoHora: Integer  read FENTREGA_TIPO_HORA write FENTREGA_TIPO_HORA;
    [TColumn('ENTREGA_HORA_PROGRAMADA', 'Entrega Hora Programada', 64, [ldGrid, ldLookup, ldCombobox], False)]
    property EntregaHoraProgramada: String  read FENTREGA_HORA_PROGRAMADA write FENTREGA_HORA_PROGRAMADA;
    [TColumn('ENTREGA_HORA_INICIAL', 'Entrega Hora Inicial', 64, [ldGrid, ldLookup, ldCombobox], False)]
    property EntregaHoraInicial: String  read FENTREGA_HORA_INICIAL write FENTREGA_HORA_INICIAL;
    [TColumn('ENTREGA_HORA_FINAL', 'Entrega Hora Final', 64, [ldGrid, ldLookup, ldCombobox], False)]
    property EntregaHoraFinal: String  read FENTREGA_HORA_FINAL write FENTREGA_HORA_FINAL;
    [TColumn('MUNICIPIO_ORIGEM_CALCULO', 'Municipio Origem Calculo', 320, [ldGrid, ldLookup, ldCombobox], False)]
    property MunicipioOrigemCalculo: String  read FMUNICIPIO_ORIGEM_CALCULO write FMUNICIPIO_ORIGEM_CALCULO;
    [TColumn('MUNICIPIO_DESTINO_CALCULO', 'Municipio Destino Calculo', 320, [ldGrid, ldLookup, ldCombobox], False)]
    property MunicipioDestinoCalculo: String  read FMUNICIPIO_DESTINO_CALCULO write FMUNICIPIO_DESTINO_CALCULO;
    [TColumn('OBSERVACOES_GERAIS', 'Observacoes Gerais', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property ObservacoesGerais: String  read FOBSERVACOES_GERAIS write FOBSERVACOES_GERAIS;
    [TColumn('VALOR_TOTAL_SERVICO', 'Valor Total Servico', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorTotalServico: Extended  read FVALOR_TOTAL_SERVICO write FVALOR_TOTAL_SERVICO;
    [TColumn('VALOR_RECEBER', 'Valor Receber', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorReceber: Extended  read FVALOR_RECEBER write FVALOR_RECEBER;
    [TColumn('CST', 'Cst', 16, [ldGrid, ldLookup, ldCombobox], False)]
    property Cst: String  read FCST write FCST;
    [TColumn('BASE_CALCULO_ICMS', 'Base Calculo Icms', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property BaseCalculoIcms: Extended  read FBASE_CALCULO_ICMS write FBASE_CALCULO_ICMS;
    [TColumn('ALIQUOTA_ICMS', 'Aliquota Icms', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property AliquotaIcms: Extended  read FALIQUOTA_ICMS write FALIQUOTA_ICMS;
    [TColumn('VALOR_ICMS', 'Valor Icms', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorIcms: Extended  read FVALOR_ICMS write FVALOR_ICMS;
    [TColumn('PERCENTUAL_REDUCAO_BC_ICMS', 'Percentual Reducao Bc Icms', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property PercentualReducaoBcIcms: Extended  read FPERCENTUAL_REDUCAO_BC_ICMS write FPERCENTUAL_REDUCAO_BC_ICMS;
    [TColumn('VALOR_BC_ICMS_ST_RETIDO', 'Valor Bc Icms St Retido', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorBcIcmsStRetido: Extended  read FVALOR_BC_ICMS_ST_RETIDO write FVALOR_BC_ICMS_ST_RETIDO;
    [TColumn('VALOR_ICMS_ST_RETIDO', 'Valor Icms St Retido', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorIcmsStRetido: Extended  read FVALOR_ICMS_ST_RETIDO write FVALOR_ICMS_ST_RETIDO;
    [TColumn('ALIQUOTA_ICMS_ST_RETIDO', 'Aliquota Icms St Retido', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property AliquotaIcmsStRetido: Extended  read FALIQUOTA_ICMS_ST_RETIDO write FALIQUOTA_ICMS_ST_RETIDO;
    [TColumn('VALOR_CREDITO_PRESUMIDO_ICMS', 'Valor Credito Presumido Icms', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorCreditoPresumidoIcms: Extended  read FVALOR_CREDITO_PRESUMIDO_ICMS write FVALOR_CREDITO_PRESUMIDO_ICMS;
    [TColumn('PERCENTUAL_BC_ICMS_OUTRA_UF', 'Percentual Bc Icms Outra Uf', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property PercentualBcIcmsOutraUf: Extended  read FPERCENTUAL_BC_ICMS_OUTRA_UF write FPERCENTUAL_BC_ICMS_OUTRA_UF;
    [TColumn('VALOR_BC_ICMS_OUTRA_UF', 'Valor Bc Icms Outra Uf', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorBcIcmsOutraUf: Extended  read FVALOR_BC_ICMS_OUTRA_UF write FVALOR_BC_ICMS_OUTRA_UF;
    [TColumn('ALIQUOTA_ICMS_OUTRA_UF', 'Aliquota Icms Outra Uf', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property AliquotaIcmsOutraUf: Extended  read FALIQUOTA_ICMS_OUTRA_UF write FALIQUOTA_ICMS_OUTRA_UF;
    [TColumn('VALOR_ICMS_OUTRA_UF', 'Valor Icms Outra Uf', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorIcmsOutraUf: Extended  read FVALOR_ICMS_OUTRA_UF write FVALOR_ICMS_OUTRA_UF;
    [TColumn('SIMPLES_NACIONAL_INDICADOR', 'Simples Nacional Indicador', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property SimplesNacionalIndicador: Integer  read FSIMPLES_NACIONAL_INDICADOR write FSIMPLES_NACIONAL_INDICADOR;
    [TColumn('SIMPLES_NACIONAL_TOTAL', 'Simples Nacional Total', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property SimplesNacionalTotal: Extended  read FSIMPLES_NACIONAL_TOTAL write FSIMPLES_NACIONAL_TOTAL;
    [TColumn('INFORMACOES_ADD_FISCO', 'Informacoes Add Fisco', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property InformacoesAddFisco: String  read FINFORMACOES_ADD_FISCO write FINFORMACOES_ADD_FISCO;
    [TColumn('VALOR_TOTAL_CARGA', 'Valor Total Carga', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorTotalCarga: Extended  read FVALOR_TOTAL_CARGA write FVALOR_TOTAL_CARGA;
    [TColumn('PRODUTO_PREDOMINANTE', 'Produto Predominante', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property ProdutoPredominante: String  read FPRODUTO_PREDOMINANTE write FPRODUTO_PREDOMINANTE;
    [TColumn('CARGA_OUTRAS_CARACTERISTICAS', 'Carga Outras Caracteristicas', 240, [ldGrid, ldLookup, ldCombobox], False)]
    property CargaOutrasCaracteristicas: String  read FCARGA_OUTRAS_CARACTERISTICAS write FCARGA_OUTRAS_CARACTERISTICAS;
    [TColumn('MODAL_VERSAO_LAYOUT', 'Modal Versao Layout', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property ModalVersaoLayout: Integer  read FMODAL_VERSAO_LAYOUT write FMODAL_VERSAO_LAYOUT;
    [TColumn('CHAVE_CTE_SUBSTITUIDO', 'Chave Cte Substituido', 352, [ldGrid, ldLookup, ldCombobox], False)]
    property ChaveCteSubstituido: String  read FCHAVE_CTE_SUBSTITUIDO write FCHAVE_CTE_SUBSTITUIDO;


    //Transientes
    [TAssociation('ID', 'ID_EMPRESA')]
    property EmpresaVO: TEmpresaVO read FEmpresaVO write FEmpresaVO;

    [TAssociation('ID_CTE_CABECALHO', 'ID')]
    property CteDestinatarioVO: TCTeDestinatarioVO read FCTeDestinatarioVO write FCTeDestinatarioVO;

    [TAssociation('ID_CTE_CABECALHO', 'ID')]
    property CteLocalEntregaVO: TCTeLocalEntregaVO read FCteLocalEntregaVO write FCteLocalEntregaVO;

    [TAssociation('ID_CTE_CABECALHO', 'ID')]
    property CteLocalColetaVO: TCteLocalColetaVO read FCteLocalColetaVO write FCteLocalColetaVO;

    [TAssociation('ID_CTE_CABECALHO', 'ID')]
    property CTeFaturaVO: TCTeFaturaVO read FCTeFaturaVO write FCTeFaturaVO;

    [TManyValuedAssociation('ID_CTE_CABECALHO', 'ID')]
    property ListaCTeDuplicataVO: TObjectList<TCTeDuplicataVO> read FListaCTeDuplicataVO write FListaCTeDuplicataVO;

    [TManyValuedAssociation('ID_CTE_CABECALHO', 'ID')]
    property ListaCteInformacaoNfOutrosVO: TObjectList<TCteInformacaoNfOutrosVO> read FListaCteInformacaoNfOutrosVO write FListaCteInformacaoNfOutrosVO;

  end;

implementation

constructor TCteCabecalhoVO.Create;
begin
  inherited;

  FEmpresaVO := TEmpresaVO.Create;
  FCTeDestinatarioVO := TCTeDestinatarioVO.Create;
  FCteLocalEntregaVO := TCTeLocalEntregaVO.Create;
  FCteLocalColetaVO := TCteLocalColetaVO.Create;
  FCTeFaturaVO := TCTeFaturaVO.Create;

  FListaCTeDuplicataVO := TObjectList<TCTeDuplicataVO>.Create;
  FListaCteInformacaoNfOutrosVO := TObjectList<TCteInformacaoNfOutrosVO>.Create;
end;

destructor TCteCabecalhoVO.Destroy;
begin
  FreeAndNil(FEmpresaVO);
  FreeAndNil(FCTeDestinatarioVO);
  FreeAndNil(FCteLocalEntregaVO);
  FreeAndNil(FCteLocalColetaVO);
  FreeAndNil(FCTeFaturaVO);

  FreeAndNil(FListaCTeDuplicataVO);
  FreeAndNil(FListaCteInformacaoNfOutrosVO);
  inherited;
end;


initialization
  Classes.RegisterClass(TCteCabecalhoVO);

finalization
  Classes.UnRegisterClass(TCteCabecalhoVO);

end.
