{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [CONTABIL_PARAMETRO] 
                                                                                
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
unit ContabilParametroVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils;

type
  [TEntity]
  [TTable('CONTABIL_PARAMETRO')]
  TContabilParametroVO = class(TVO)
  private
    FID: Integer;
    FID_EMPRESA: Integer;
    FMASCARA: String;
    FNIVEIS: Integer;
    FINFORMAR_CONTA_POR: String;
    FCOMPARTILHA_PLANO_CONTA: String;
    FCOMPARTILHA_HISTORICOS: String;
    FALTERA_LANCAMENTO_OUTRO: String;
    FHISTORICO_OBRIGATORIO: String;
    FPERMITE_LANCAMENTO_ZERADO: String;
    FGERA_INFORMATIVO_SPED: String;
    FSPED_FORMA_ESCRIT_DIARIO: String;
    FSPED_NOME_LIVRO_DIARIO: String;
    FASSINATURA_DIREITA: String;
    FASSINATURA_ESQUERDA: String;
    FCONTA_ATIVO: String;
    FCONTA_PASSIVO: String;
    FCONTA_PATRIMONIO_LIQUIDO: String;
    FCONTA_DEPRECIACAO_ACUMULADA: String;
    FCONTA_CAPITAL_SOCIAL: String;
    FCONTA_RESULTADO_EXERCICIO: String;
    FCONTA_PREJUIZO_ACUMULADO: String;
    FCONTA_LUCRO_ACUMULADO: String;
    FCONTA_TITULO_PAGAR: String;
    FCONTA_TITULO_RECEBER: String;
    FCONTA_JUROS_PASSIVO: String;
    FCONTA_JUROS_ATIVO: String;
    FCONTA_DESCONTO_OBTIDO: String;
    FCONTA_DESCONTO_CONCEDIDO: String;
    FCONTA_CMV: String;
    FCONTA_VENDA: String;
    FCONTA_VENDA_SERVICO: String;
    FCONTA_ESTOQUE: String;
    FCONTA_APURA_RESULTADO: String;
    FCONTA_JUROS_APROPRIAR: String;
    FID_HIST_PADRAO_RESULTADO: Integer;
    FID_HIST_PADRAO_LUCRO: Integer;
    FID_HIST_PADRAO_PREJUIZO: Integer;

    //Transientes



  public 
    [TId('ID', [ldGrid, ldLookup, ldComboBox])]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;
    [TColumn('ID_EMPRESA', 'Id Empresa', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdEmpresa: Integer  read FID_EMPRESA write FID_EMPRESA;
    [TColumn('MASCARA', 'Mascara', 240, [ldGrid, ldLookup, ldCombobox], False)]
    property Mascara: String  read FMASCARA write FMASCARA;
    [TColumn('NIVEIS', 'Niveis', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Niveis: Integer  read FNIVEIS write FNIVEIS;
    [TColumn('INFORMAR_CONTA_POR', 'Informar Conta Por', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property InformarContaPor: String  read FINFORMAR_CONTA_POR write FINFORMAR_CONTA_POR;
    [TColumn('COMPARTILHA_PLANO_CONTA', 'Compartilha Plano Conta', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property CompartilhaPlanoConta: String  read FCOMPARTILHA_PLANO_CONTA write FCOMPARTILHA_PLANO_CONTA;
    [TColumn('COMPARTILHA_HISTORICOS', 'Compartilha Historicos', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property CompartilhaHistoricos: String  read FCOMPARTILHA_HISTORICOS write FCOMPARTILHA_HISTORICOS;
    [TColumn('ALTERA_LANCAMENTO_OUTRO', 'Altera Lancamento Outro', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property AlteraLancamentoOutro: String  read FALTERA_LANCAMENTO_OUTRO write FALTERA_LANCAMENTO_OUTRO;
    [TColumn('HISTORICO_OBRIGATORIO', 'Historico Obrigatorio', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property HistoricoObrigatorio: String  read FHISTORICO_OBRIGATORIO write FHISTORICO_OBRIGATORIO;
    [TColumn('PERMITE_LANCAMENTO_ZERADO', 'Permite Lancamento Zerado', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property PermiteLancamentoZerado: String  read FPERMITE_LANCAMENTO_ZERADO write FPERMITE_LANCAMENTO_ZERADO;
    [TColumn('GERA_INFORMATIVO_SPED', 'Gera Informativo Sped', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property GeraInformativoSped: String  read FGERA_INFORMATIVO_SPED write FGERA_INFORMATIVO_SPED;
    [TColumn('SPED_FORMA_ESCRIT_DIARIO', 'Sped Forma Escrit Diario', 24, [ldGrid, ldLookup, ldCombobox], False)]
    property SpedFormaEscritDiario: String  read FSPED_FORMA_ESCRIT_DIARIO write FSPED_FORMA_ESCRIT_DIARIO;
    [TColumn('SPED_NOME_LIVRO_DIARIO', 'Sped Nome Livro Diario', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property SpedNomeLivroDiario: String  read FSPED_NOME_LIVRO_DIARIO write FSPED_NOME_LIVRO_DIARIO;
    [TColumn('ASSINATURA_DIREITA', 'Assinatura Direita', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property AssinaturaDireita: String  read FASSINATURA_DIREITA write FASSINATURA_DIREITA;
    [TColumn('ASSINATURA_ESQUERDA', 'Assinatura Esquerda', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property AssinaturaEsquerda: String  read FASSINATURA_ESQUERDA write FASSINATURA_ESQUERDA;
    [TColumn('CONTA_ATIVO', 'Conta Ativo', 240, [ldGrid, ldLookup, ldCombobox], False)]
    property ContaAtivo: String  read FCONTA_ATIVO write FCONTA_ATIVO;
    [TColumn('CONTA_PASSIVO', 'Conta Passivo', 240, [ldGrid, ldLookup, ldCombobox], False)]
    property ContaPassivo: String  read FCONTA_PASSIVO write FCONTA_PASSIVO;
    [TColumn('CONTA_PATRIMONIO_LIQUIDO', 'Conta Patrimonio Liquido', 240, [ldGrid, ldLookup, ldCombobox], False)]
    property ContaPatrimonioLiquido: String  read FCONTA_PATRIMONIO_LIQUIDO write FCONTA_PATRIMONIO_LIQUIDO;
    [TColumn('CONTA_DEPRECIACAO_ACUMULADA', 'Conta Depreciacao Acumulada', 240, [ldGrid, ldLookup, ldCombobox], False)]
    property ContaDepreciacaoAcumulada: String  read FCONTA_DEPRECIACAO_ACUMULADA write FCONTA_DEPRECIACAO_ACUMULADA;
    [TColumn('CONTA_CAPITAL_SOCIAL', 'Conta Capital Social', 240, [ldGrid, ldLookup, ldCombobox], False)]
    property ContaCapitalSocial: String  read FCONTA_CAPITAL_SOCIAL write FCONTA_CAPITAL_SOCIAL;
    [TColumn('CONTA_RESULTADO_EXERCICIO', 'Conta Resultado Exercicio', 240, [ldGrid, ldLookup, ldCombobox], False)]
    property ContaResultadoExercicio: String  read FCONTA_RESULTADO_EXERCICIO write FCONTA_RESULTADO_EXERCICIO;
    [TColumn('CONTA_PREJUIZO_ACUMULADO', 'Conta Prejuizo Acumulado', 240, [ldGrid, ldLookup, ldCombobox], False)]
    property ContaPrejuizoAcumulado: String  read FCONTA_PREJUIZO_ACUMULADO write FCONTA_PREJUIZO_ACUMULADO;
    [TColumn('CONTA_LUCRO_ACUMULADO', 'Conta Lucro Acumulado', 240, [ldGrid, ldLookup, ldCombobox], False)]
    property ContaLucroAcumulado: String  read FCONTA_LUCRO_ACUMULADO write FCONTA_LUCRO_ACUMULADO;
    [TColumn('CONTA_TITULO_PAGAR', 'Conta Titulo Pagar', 240, [ldGrid, ldLookup, ldCombobox], False)]
    property ContaTituloPagar: String  read FCONTA_TITULO_PAGAR write FCONTA_TITULO_PAGAR;
    [TColumn('CONTA_TITULO_RECEBER', 'Conta Titulo Receber', 240, [ldGrid, ldLookup, ldCombobox], False)]
    property ContaTituloReceber: String  read FCONTA_TITULO_RECEBER write FCONTA_TITULO_RECEBER;
    [TColumn('CONTA_JUROS_PASSIVO', 'Conta Juros Passivo', 240, [ldGrid, ldLookup, ldCombobox], False)]
    property ContaJurosPassivo: String  read FCONTA_JUROS_PASSIVO write FCONTA_JUROS_PASSIVO;
    [TColumn('CONTA_JUROS_ATIVO', 'Conta Juros Ativo', 240, [ldGrid, ldLookup, ldCombobox], False)]
    property ContaJurosAtivo: String  read FCONTA_JUROS_ATIVO write FCONTA_JUROS_ATIVO;
    [TColumn('CONTA_DESCONTO_OBTIDO', 'Conta Desconto Obtido', 240, [ldGrid, ldLookup, ldCombobox], False)]
    property ContaDescontoObtido: String  read FCONTA_DESCONTO_OBTIDO write FCONTA_DESCONTO_OBTIDO;
    [TColumn('CONTA_DESCONTO_CONCEDIDO', 'Conta Desconto Concedido', 240, [ldGrid, ldLookup, ldCombobox], False)]
    property ContaDescontoConcedido: String  read FCONTA_DESCONTO_CONCEDIDO write FCONTA_DESCONTO_CONCEDIDO;
    [TColumn('CONTA_CMV', 'Conta Cmv', 240, [ldGrid, ldLookup, ldCombobox], False)]
    property ContaCmv: String  read FCONTA_CMV write FCONTA_CMV;
    [TColumn('CONTA_VENDA', 'Conta Venda', 240, [ldGrid, ldLookup, ldCombobox], False)]
    property ContaVenda: String  read FCONTA_VENDA write FCONTA_VENDA;
    [TColumn('CONTA_VENDA_SERVICO', 'Conta Venda Servico', 240, [ldGrid, ldLookup, ldCombobox], False)]
    property ContaVendaServico: String  read FCONTA_VENDA_SERVICO write FCONTA_VENDA_SERVICO;
    [TColumn('CONTA_ESTOQUE', 'Conta Estoque', 240, [ldGrid, ldLookup, ldCombobox], False)]
    property ContaEstoque: String  read FCONTA_ESTOQUE write FCONTA_ESTOQUE;
    [TColumn('CONTA_APURA_RESULTADO', 'Conta Apura Resultado', 240, [ldGrid, ldLookup, ldCombobox], False)]
    property ContaApuraResultado: String  read FCONTA_APURA_RESULTADO write FCONTA_APURA_RESULTADO;
    [TColumn('CONTA_JUROS_APROPRIAR', 'Conta Juros Apropriar', 240, [ldGrid, ldLookup, ldCombobox], False)]
    property ContaJurosApropriar: String  read FCONTA_JUROS_APROPRIAR write FCONTA_JUROS_APROPRIAR;
    [TColumn('ID_HIST_PADRAO_RESULTADO', 'Id Hist Padrao Resultado', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdHistPadraoResultado: Integer  read FID_HIST_PADRAO_RESULTADO write FID_HIST_PADRAO_RESULTADO;
    [TColumn('ID_HIST_PADRAO_LUCRO', 'Id Hist Padrao Lucro', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdHistPadraoLucro: Integer  read FID_HIST_PADRAO_LUCRO write FID_HIST_PADRAO_LUCRO;
    [TColumn('ID_HIST_PADRAO_PREJUIZO', 'Id Hist Padrao Prejuizo', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdHistPadraoPrejuizo: Integer  read FID_HIST_PADRAO_PREJUIZO write FID_HIST_PADRAO_PREJUIZO;


    //Transientes



  end;

implementation


initialization
  Classes.RegisterClass(TContabilParametroVO);

finalization
  Classes.UnRegisterClass(TContabilParametroVO);

end.
