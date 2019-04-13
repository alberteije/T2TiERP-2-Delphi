{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [CONTRATO] 
                                                                                
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
unit ContratoVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils, DB,
  ContratoHistFaturamentoVO, ContratoHistoricoReajusteVO, ContratoPrevFaturamentoVO,
  ContabilContaVO, TipoContratoVO, ContratoSolicitacaoServicoVO;

type
  [TEntity]
  [TTable('CONTRATO')]
  TContratoVO = class(TVO)
  private
    FID: Integer;
    FID_SOLICITACAO_SERVICO: Integer;
    FID_TIPO_CONTRATO: Integer;
    FNUMERO: String;
    FNOME: String;
    FDESCRICAO: String;
    FDATA_CADASTRO: TDateTime;
    FDATA_INICIO_VIGENCIA: TDateTime;
    FDATA_FIM_VIGENCIA: TDateTime;
    FDIA_FATURAMENTO: String;
    FVALOR: Extended;
    FQUANTIDADE_PARCELAS: Integer;
    FINTERVALO_ENTRE_PARCELAS: Integer;
    FOBSERVACAO: String;
    FCLASSIFICACAO_CONTABIL_CONTA: String;

    //Transientes
    FArquivo: String;
    FTipoArquivo: String;

    FContabilContaClassificacao: String;
    FTipoContratoNome: String;
    FContratoSolicitacaoServicoDescricao: String;

    FContabilContaVO: TContabilContaVO;
    FTipoContratoVO: TTipoContratoVO;
    FContratoSolicitacaoServicoVO: TContratoSolicitacaoServicoVO;

    FListaContratoHistFaturamentoVO: TObjectList<TContratoHistFaturamentoVO>;
    FListaContratoHistoricoReajusteVO: TObjectList<TContratoHistoricoReajusteVO>;
    FListaContratoPrevFaturamentoVO: TObjectList<TContratoPrevFaturamentoVO>;

  public
    constructor Create; override;
    destructor Destroy; override;

    [TId('ID', [ldGrid, ldLookup, ldComboBox])]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;

    [TColumn('ID_SOLICITACAO_SERVICO', 'Id Solicitacao Servico', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdSolicitacaoServico: Integer  read FID_SOLICITACAO_SERVICO write FID_SOLICITACAO_SERVICO;
    [TColumnDisplay('CONTRATO_SOLICITACAO_SERVICO.DESCRICAO', 'Descrição da Solicitação', 250, [ldGrid], ftString, 'ContratoSolicitacaoServicoVO.TContratoSolicitacaoServicoVO', True)]
    property ContratoSolicitacaoServicoDescricao: String read FContratoSolicitacaoServicoDescricao write FContratoSolicitacaoServicoDescricao;

    [TColumn('ID_TIPO_CONTRATO', 'Id Tipo Contrato', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdTipoContrato: Integer  read FID_TIPO_CONTRATO write FID_TIPO_CONTRATO;
    [TColumnDisplay('TIPO_CONTRATO.NOME', 'Tipo Contrato', 200, [ldGrid], ftString, 'TipoContratoVO.TTipoContratoVO', True)]
    property TipoContratoNome: String read FTipoContratoNome write FTipoContratoNome;

    [TColumn('NUMERO', 'Numero', 400, [ldGrid, ldLookup, ldCombobox], False)]
    property Numero: String  read FNUMERO write FNUMERO;
    [TColumn('NOME', 'Nome', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property Nome: String  read FNOME write FNOME;
    [TColumn('DESCRICAO', 'Descricao', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property Descricao: String  read FDESCRICAO write FDESCRICAO;
    [TColumn('DATA_CADASTRO', 'Data Cadastro', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property DataCadastro: TDateTime  read FDATA_CADASTRO write FDATA_CADASTRO;
    [TColumn('DATA_INICIO_VIGENCIA', 'Data Inicio Vigencia', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property DataInicioVigencia: TDateTime  read FDATA_INICIO_VIGENCIA write FDATA_INICIO_VIGENCIA;
    [TColumn('DATA_FIM_VIGENCIA', 'Data Fim Vigencia', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property DataFimVigencia: TDateTime  read FDATA_FIM_VIGENCIA write FDATA_FIM_VIGENCIA;
    [TColumn('DIA_FATURAMENTO', 'Dia Faturamento', 16, [ldGrid, ldLookup, ldCombobox], False)]
    property DiaFaturamento: String  read FDIA_FATURAMENTO write FDIA_FATURAMENTO;
    [TColumn('VALOR', 'Valor', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property Valor: Extended  read FVALOR write FVALOR;
    [TColumn('QUANTIDADE_PARCELAS', 'Quantidade Parcelas', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property QuantidadeParcelas: Integer  read FQUANTIDADE_PARCELAS write FQUANTIDADE_PARCELAS;
    [TColumn('INTERVALO_ENTRE_PARCELAS', 'Intervalo Entre Parcelas', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IntervaloEntreParcelas: Integer  read FINTERVALO_ENTRE_PARCELAS write FINTERVALO_ENTRE_PARCELAS;
    [TColumn('OBSERVACAO', 'Observacao', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property Observacao: String  read FOBSERVACAO write FOBSERVACAO;
    [TColumn('CLASSIFICACAO_CONTABIL_CONTA', 'Classificacao Contabil Conta', 240, [ldGrid, ldLookup, ldCombobox], False)]
    property ClassificacaoContabilConta: String  read FCLASSIFICACAO_CONTABIL_CONTA write FCLASSIFICACAO_CONTABIL_CONTA;


    //Transientes
    [TColumn('ARQUIVO', 'Arquivo', 80, [], True)]
    property Arquivo: String read FArquivo write FArquivo;
    [TColumn('TIPO_ARQUIVO', 'Tipo Arquivo', 80, [], True)]
    property TipoArquivo: String read FTipoArquivo write FTipoArquivo;


    [TAssociation('CLASSIFICACAO', 'CLASSIFICACAO_CONTABIL_CONTA')]
    property ContabilContaVO: TContabilContaVO read FContabilContaVO write FContabilContaVO;

    [TAssociation('ID', 'ID_TIPO_CONTRATO')]
    property TipoContratoVO: TTipoContratoVO read FTipoContratoVO write FTipoContratoVO;

    [TAssociation('ID', 'ID_SOLICITACAO_SERVICO')]
    property ContratoSolicitacaoServicoVO: TContratoSolicitacaoServicoVO read FContratoSolicitacaoServicoVO write FContratoSolicitacaoServicoVO;


    [TManyValuedAssociation('ID_CONTRATO', 'ID')]
    property ListaContratoHistFaturamentoVO: TObjectList<TContratoHistFaturamentoVO> read FListaContratoHistFaturamentoVO write FListaContratoHistFaturamentoVO;

    [TManyValuedAssociation('ID_CONTRATO', 'ID')]
    property ListaContratoHistoricoReajusteVO: TObjectList<TContratoHistoricoReajusteVO> read FListaContratoHistoricoReajusteVO write FListaContratoHistoricoReajusteVO;

    [TManyValuedAssociation('ID_CONTRATO', 'ID')]
    property ListaContratoPrevFaturamentoVO: TObjectList<TContratoPrevFaturamentoVO> read FListaContratoPrevFaturamentoVO write FListaContratoPrevFaturamentoVO;


  end;

implementation

constructor TContratoVO.Create;
begin
  inherited;

  FContabilContaVO := TContabilContaVO.Create;
  FTipoContratoVO := TTipoContratoVO.Create;
  FContratoSolicitacaoServicoVO := TContratoSolicitacaoServicoVO.Create;

  FListaContratoHistFaturamentoVO := TObjectList<TContratoHistFaturamentoVO>.Create;
  FListaContratoHistoricoReajusteVO := TObjectList<TContratoHistoricoReajusteVO>.Create;
  FListaContratoPrevFaturamentoVO := TObjectList<TContratoPrevFaturamentoVO>.Create;
end;

destructor TContratoVO.Destroy;
begin
  FreeAndNil(FContabilContaVO);
  FreeAndNil(FTipoContratoVO);
  FreeAndNil(FContratoSolicitacaoServicoVO);

  FreeAndNil(FListaContratoHistFaturamentoVO);
  FreeAndNil(FListaContratoHistoricoReajusteVO);
  FreeAndNil(FListaContratoPrevFaturamentoVO);

  inherited;
end;

initialization
  Classes.RegisterClass(TContratoVO);

finalization
  Classes.UnRegisterClass(TContratoVO);

end.
