{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [ECF_CONFIGURACAO] 
                                                                                
The MIT License                                                                 
                                                                                
Copyright: Copyright (C) 2010 T2Ti.COM                                          
                                                                                
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
@version 1.0
*******************************************************************************}
unit EcfConfiguracaoVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils, EcfResolucaoVO,
  EcfImpressoraVO, EcfCaixaVO, EcfEmpresaVO, EcfConfiguracaoBalancaVO,
  EcfRelatorioGerencialVO, EcfConfiguracaoLeitorSerVO,


  Biblioteca;

type
  [TEntity]
  [TTable('ECF_CONFIGURACAO')]
  TEcfConfiguracaoVO = class(TVO)
  private
    FID: Integer;
    FID_ECF_IMPRESSORA: Integer;
    FID_ECF_RESOLUCAO: Integer;
    FID_ECF_CAIXA: Integer;
    FID_ECF_EMPRESA: Integer;
    FMENSAGEM_CUPOM: String;
    FPORTA_ECF: String;
    FIP_SERVIDOR: String;
    FIP_SITEF: String;
    FTIPO_TEF: String;
    FTITULO_TELA_CAIXA: String;
    FCAMINHO_IMAGENS_PRODUTOS: String;
    FCAMINHO_IMAGENS_MARKETING: String;
    FCAMINHO_IMAGENS_LAYOUT: String;
    FCOR_JANELAS_INTERNAS: String;
    FMARKETING_ATIVO: String;
    FCFOP_ECF: Integer;
    FCFOP_NF2: Integer;
    FTIMEOUT_ECF: Integer;
    FINTERVALO_ECF: Integer;
    FDESCRICAO_SUPRIMENTO: String;
    FDESCRICAO_SANGRIA: String;
    FTEF_TIPO_GP: Integer;
    FTEF_TEMPO_ESPERA: Integer;
    FTEF_ESPERA_STS: Integer;
    FTEF_NUMERO_VIAS: Integer;
    FDECIMAIS_QUANTIDADE: Integer;
    FDECIMAIS_VALOR: Integer;
    FBITS_POR_SEGUNDO: Integer;
    FQUANTIDADE_MAXIMA_CARTOES: Integer;
    FPESQUISA_PARTE: String;
    FULTIMA_EXCLUSAO: Integer;
    FLAUDO: String;
    FINDICE_GERENCIAL: String;
    FDATA_ATUALIZACAO_ESTOQUE: TDateTime;
    FPEDE_CPF_CUPOM: String;
    FTIPO_INTEGRACAO: Integer;
    FTIMER_INTEGRACAO: Integer;
    FGAVETA_SINAL_INVERTIDO: String;
    FGAVETA_UTILIZACAO: Integer;
    FQUANTIDADE_MAXIMA_PARCELA: Integer;
    FIMPRIME_PARCELA: String;
    FUSA_TECLADO_REDUZIDO: String;
    FPERMITE_LANCAR_NF_MANUAL: String;

    FEcfResolucaoVO: TEcfResolucaoVO;
    FEcfImpressoraVO: TEcfImpressoraVO;
    FEcfCaixaVO: TEcfCaixaVO;
    FEcfEmpresaVO: TEcfEmpresaVO;
    FEcfConfiguracaoBalancaVO: TEcfConfiguracaoBalancaVO;
    FEcfRelatorioGerencialVO: TEcfRelatorioGerencialVO;
    FEcfConfiguracaoLeitorSerVO: TEcfConfiguracaoLeitorSerVO;

  public
    constructor Create; override;
    destructor Destroy; override;

    [TId('ID')]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;
    [TColumn('ID_ECF_IMPRESSORA', 'Id Ecf Impressora', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdEcfImpressora: Integer  read FID_ECF_IMPRESSORA write FID_ECF_IMPRESSORA;
    [TColumn('ID_ECF_RESOLUCAO', 'Id Ecf Resolucao', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdEcfResolucao: Integer  read FID_ECF_RESOLUCAO write FID_ECF_RESOLUCAO;
    [TColumn('ID_ECF_CAIXA', 'Id Ecf Caixa', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdEcfCaixa: Integer  read FID_ECF_CAIXA write FID_ECF_CAIXA;
    [TColumn('ID_ECF_EMPRESA', 'Id Ecf Empresa', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdEcfEmpresa: Integer  read FID_ECF_EMPRESA write FID_ECF_EMPRESA;
    [TColumn('MENSAGEM_CUPOM', 'Mensagem Cupom', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property MensagemCupom: String  read FMENSAGEM_CUPOM write FMENSAGEM_CUPOM;
    [TColumn('PORTA_ECF', 'Porta Ecf', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property PortaEcf: String  read FPORTA_ECF write FPORTA_ECF;
    [TColumn('IP_SERVIDOR', 'Ip Servidor', 120, [ldGrid, ldLookup, ldCombobox], False)]
    property IpServidor: String  read FIP_SERVIDOR write FIP_SERVIDOR;
    [TColumn('IP_SITEF', 'Ip Sitef', 120, [ldGrid, ldLookup, ldCombobox], False)]
    property IpSitef: String  read FIP_SITEF write FIP_SITEF;
    [TColumn('TIPO_TEF', 'Tipo Tef', 16, [ldGrid, ldLookup, ldCombobox], False)]
    property TipoTef: String  read FTIPO_TEF write FTIPO_TEF;
    [TColumn('TITULO_TELA_CAIXA', 'Titulo Tela Caixa', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property TituloTelaCaixa: String  read FTITULO_TELA_CAIXA write FTITULO_TELA_CAIXA;
    [TColumn('CAMINHO_IMAGENS_PRODUTOS', 'Caminho Imagens Produtos', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property CaminhoImagensProdutos: String  read FCAMINHO_IMAGENS_PRODUTOS write FCAMINHO_IMAGENS_PRODUTOS;
    [TColumn('CAMINHO_IMAGENS_MARKETING', 'Caminho Imagens Marketing', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property CaminhoImagensMarketing: String  read FCAMINHO_IMAGENS_MARKETING write FCAMINHO_IMAGENS_MARKETING;
    [TColumn('CAMINHO_IMAGENS_LAYOUT', 'Caminho Imagens Layout', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property CaminhoImagensLayout: String  read FCAMINHO_IMAGENS_LAYOUT write FCAMINHO_IMAGENS_LAYOUT;
    [TColumn('COR_JANELAS_INTERNAS', 'Cor Janelas Internas', 160, [ldGrid, ldLookup, ldCombobox], False)]
    property CorJanelasInternas: String  read FCOR_JANELAS_INTERNAS write FCOR_JANELAS_INTERNAS;
    [TColumn('MARKETING_ATIVO', 'Marketing Ativo', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property MarketingAtivo: String  read FMARKETING_ATIVO write FMARKETING_ATIVO;
    [TColumn('CFOP_ECF', 'Cfop Ecf', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property CfopEcf: Integer  read FCFOP_ECF write FCFOP_ECF;
    [TColumn('CFOP_NF2', 'Cfop Nf2', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property CfopNf2: Integer  read FCFOP_NF2 write FCFOP_NF2;
    [TColumn('TIMEOUT_ECF', 'Timeout Ecf', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property TimeoutEcf: Integer  read FTIMEOUT_ECF write FTIMEOUT_ECF;
    [TColumn('INTERVALO_ECF', 'Intervalo Ecf', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IntervaloEcf: Integer  read FINTERVALO_ECF write FINTERVALO_ECF;
    [TColumn('DESCRICAO_SUPRIMENTO', 'Descricao Suprimento', 160, [ldGrid, ldLookup, ldCombobox], False)]
    property DescricaoSuprimento: String  read FDESCRICAO_SUPRIMENTO write FDESCRICAO_SUPRIMENTO;
    [TColumn('DESCRICAO_SANGRIA', 'Descricao Sangria', 160, [ldGrid, ldLookup, ldCombobox], False)]
    property DescricaoSangria: String  read FDESCRICAO_SANGRIA write FDESCRICAO_SANGRIA;
    [TColumn('TEF_TIPO_GP', 'Tef Tipo Gp', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property TefTipoGp: Integer  read FTEF_TIPO_GP write FTEF_TIPO_GP;
    [TColumn('TEF_TEMPO_ESPERA', 'Tef Tempo Espera', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property TefTempoEspera: Integer  read FTEF_TEMPO_ESPERA write FTEF_TEMPO_ESPERA;
    [TColumn('TEF_ESPERA_STS', 'Tef Espera Sts', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property TefEsperaSts: Integer  read FTEF_ESPERA_STS write FTEF_ESPERA_STS;
    [TColumn('TEF_NUMERO_VIAS', 'Tef Numero Vias', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property TefNumeroVias: Integer  read FTEF_NUMERO_VIAS write FTEF_NUMERO_VIAS;
    [TColumn('DECIMAIS_QUANTIDADE', 'Decimais Quantidade', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property DecimaisQuantidade: Integer  read FDECIMAIS_QUANTIDADE write FDECIMAIS_QUANTIDADE;
    [TColumn('DECIMAIS_VALOR', 'Decimais Valor', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property DecimaisValor: Integer  read FDECIMAIS_VALOR write FDECIMAIS_VALOR;
    [TColumn('BITS_POR_SEGUNDO', 'Bits Por Segundo', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property BitsPorSegundo: Integer  read FBITS_POR_SEGUNDO write FBITS_POR_SEGUNDO;
    [TColumn('QUANTIDADE_MAXIMA_CARTOES', 'Qtde Maxima Cartoes', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property QuantidadeMaximaCartoes: Integer  read FQUANTIDADE_MAXIMA_CARTOES write FQUANTIDADE_MAXIMA_CARTOES;
    [TColumn('PESQUISA_PARTE', 'Pesquisa Parte', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property PesquisaParte: String  read FPESQUISA_PARTE write FPESQUISA_PARTE;
    [TColumn('ULTIMA_EXCLUSAO', 'Ultima Exclusao', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property UltimaExclusao: Integer  read FULTIMA_EXCLUSAO write FULTIMA_EXCLUSAO;
    [TColumn('LAUDO', 'Laudo', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property Laudo: String  read FLAUDO write FLAUDO;
    [TColumn('INDICE_GERENCIAL', 'Indice Gerencial', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property IndiceGerencial: String  read FINDICE_GERENCIAL write FINDICE_GERENCIAL;
    [TColumn('DATA_ATUALIZACAO_ESTOQUE', 'Data Atualizacao Estoque', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property DataAtualizacaoEstoque: TDateTime  read FDATA_ATUALIZACAO_ESTOQUE write FDATA_ATUALIZACAO_ESTOQUE;
    [TColumn('PEDE_CPF_CUPOM', 'Pede Cpf Cupom', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property PedeCpfCupom: String  read FPEDE_CPF_CUPOM write FPEDE_CPF_CUPOM;
    [TColumn('TIPO_INTEGRACAO', 'Tipo Integracao', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property TipoIntegracao: Integer  read FTIPO_INTEGRACAO write FTIPO_INTEGRACAO;
    [TColumn('TIMER_INTEGRACAO', 'Timer Integracao', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property TimerIntegracao: Integer  read FTIMER_INTEGRACAO write FTIMER_INTEGRACAO;
    [TColumn('GAVETA_SINAL_INVERTIDO', 'Gaveta Sinal Invertido', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property GavetaSinalInvertido: String  read FGAVETA_SINAL_INVERTIDO write FGAVETA_SINAL_INVERTIDO;
    [TColumn('GAVETA_UTILIZACAO', 'Gaveta Utilizacao', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property GavetaUtilizacao: Integer  read FGAVETA_UTILIZACAO write FGAVETA_UTILIZACAO;
    [TColumn('QUANTIDADE_MAXIMA_PARCELA', 'Quantidade Maxima Parcela', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property QuantidadeMaximaParcela: Integer  read FQUANTIDADE_MAXIMA_PARCELA write FQUANTIDADE_MAXIMA_PARCELA;
    [TColumn('IMPRIME_PARCELA', 'Imprime Parcela', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property ImprimeParcela: String  read FIMPRIME_PARCELA write FIMPRIME_PARCELA;
    [TColumn('USA_TECLADO_REDUZIDO', 'Usa Teclado Reduzido', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property UsaTecladoReduzido: String  read FUSA_TECLADO_REDUZIDO write FUSA_TECLADO_REDUZIDO;
    [TColumn('PERMITE_LANCAR_NF_MANUAL', 'Permite Lancar Nf Manual', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property PermiteLancarNfManual: String  read FPERMITE_LANCAR_NF_MANUAL write FPERMITE_LANCAR_NF_MANUAL;

    [TAssociation('ID', 'ID_ECF_RESOLUCAO')]
    property EcfResolucaoVO: TEcfResolucaoVO read FEcfResolucaoVO write FEcfResolucaoVO;

    [TAssociation('ID', 'ID_ECF_IMPRESSORA')]
    property EcfImpressoraVO: TEcfImpressoraVO read FEcfImpressoraVO write FEcfImpressoraVO;

    [TAssociation('ID', 'ID_ECF_CAIXA')]
    property EcfCaixaVO: TEcfCaixaVO read FEcfCaixaVO write FEcfCaixaVO;

    [TAssociation('ID', 'ID_ECF_EMPRESA')]
    property EcfEmpresaVO: TEcfEmpresaVO read FEcfEmpresaVO write FEcfEmpresaVO;

    [TAssociation('ID_ECF_CONFIGURACAO', 'ID')]
    property EcfConfiguracaoBalancaVO: TEcfConfiguracaoBalancaVO read FEcfConfiguracaoBalancaVO write FEcfConfiguracaoBalancaVO;

    [TAssociation('ID_ECF_CONFIGURACAO', 'ID')]
    property EcfRelatorioGerencialVO: TEcfRelatorioGerencialVO read FEcfRelatorioGerencialVO write FEcfRelatorioGerencialVO;

    [TAssociation('ID_ECF_CONFIGURACAO', 'ID')]
    property EcfConfiguracaoLeitorSerVO: TEcfConfiguracaoLeitorSerVO read FEcfConfiguracaoLeitorSerVO write FEcfConfiguracaoLeitorSerVO;

  end;

implementation

constructor TEcfConfiguracaoVO.Create;
begin
  inherited;

  FEcfResolucaoVO := TEcfResolucaoVO.Create;
  FEcfImpressoraVO := TEcfImpressoraVO.Create;
  FEcfCaixaVO := TEcfCaixaVO.Create;
  FEcfEmpresaVO := TEcfEmpresaVO.Create;
  FEcfConfiguracaoBalancaVO := TEcfConfiguracaoBalancaVO.Create;
  FEcfRelatorioGerencialVO := TEcfRelatorioGerencialVO.Create;
  FEcfConfiguracaoLeitorSerVO := TEcfConfiguracaoLeitorSerVO.Create;
end;

destructor TEcfConfiguracaoVO.Destroy;
begin
  FreeAndNil(FEcfResolucaoVO);
  FreeAndNil(FEcfImpressoraVO);
  FreeAndNil(FEcfCaixaVO);
  FreeAndNil(FEcfEmpresaVO);
  FreeAndNil(FEcfConfiguracaoBalancaVO);
  FreeAndNil(FEcfRelatorioGerencialVO);
  FreeAndNil(FEcfConfiguracaoLeitorSerVO);

  inherited;
end;

initialization
  Classes.RegisterClass(TEcfConfiguracaoVO);

finalization
  Classes.UnRegisterClass(TEcfConfiguracaoVO);


end.
