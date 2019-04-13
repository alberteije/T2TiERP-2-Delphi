{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [FORNECEDOR] 
                                                                                
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
unit FornecedorVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils;

type
  [TEntity]
  [TTable('FORNECEDOR')]
  TFornecedorVO = class(TVO)
  private
    FID: Integer;
    FID_PESSOA: Integer;
    FID_ATIVIDADE_FOR_CLI: Integer;
    FID_SITUACAO_FOR_CLI: Integer;
    FDESDE: TDateTime;
    FOPTANTE_SIMPLES_NACIONAL: String;
    FLOCALIZACAO: String;
    FDATA_CADASTRO: TDateTime;
    FSOFRE_RETENCAO: String;
    FCHEQUE_NOMINAL_A: String;
    FOBSERVACAO: String;
    FCONTA_REMETENTE: String;
    FPRAZO_MEDIO_ENTREGA: Integer;
    FGERA_FATURAMENTO: String;
    FNUM_DIAS_PRIMEIRO_VENCIMENTO: Integer;
    FNUM_DIAS_INTERVALO: Integer;
    FQUANTIDADE_PARCELAS: Integer;
    FCLASSIFICACAO_CONTABIL_CONTA: String;

    //Transientes



  public 
    [TId('ID', [ldGrid, ldLookup, ldComboBox])]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;
    [TColumn('ID_PESSOA', 'Id Pessoa', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdPessoa: Integer  read FID_PESSOA write FID_PESSOA;
    [TColumn('ID_ATIVIDADE_FOR_CLI', 'Id Atividade For Cli', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdAtividadeForCli: Integer  read FID_ATIVIDADE_FOR_CLI write FID_ATIVIDADE_FOR_CLI;
    [TColumn('ID_SITUACAO_FOR_CLI', 'Id Situacao For Cli', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdSituacaoForCli: Integer  read FID_SITUACAO_FOR_CLI write FID_SITUACAO_FOR_CLI;
    [TColumn('DESDE', 'Desde', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property Desde: TDateTime  read FDESDE write FDESDE;
    [TColumn('OPTANTE_SIMPLES_NACIONAL', 'Optante Simples Nacional', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property OptanteSimplesNacional: String  read FOPTANTE_SIMPLES_NACIONAL write FOPTANTE_SIMPLES_NACIONAL;
    [TColumn('LOCALIZACAO', 'Localizacao', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property Localizacao: String  read FLOCALIZACAO write FLOCALIZACAO;
    [TColumn('DATA_CADASTRO', 'Data Cadastro', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property DataCadastro: TDateTime  read FDATA_CADASTRO write FDATA_CADASTRO;
    [TColumn('SOFRE_RETENCAO', 'Sofre Retencao', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property SofreRetencao: String  read FSOFRE_RETENCAO write FSOFRE_RETENCAO;
    [TColumn('CHEQUE_NOMINAL_A', 'Cheque Nominal A', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property ChequeNominalA: String  read FCHEQUE_NOMINAL_A write FCHEQUE_NOMINAL_A;
    [TColumn('OBSERVACAO', 'Observacao', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property Observacao: String  read FOBSERVACAO write FOBSERVACAO;
    [TColumn('CONTA_REMETENTE', 'Conta Remetente', 240, [ldGrid, ldLookup, ldCombobox], False)]
    property ContaRemetente: String  read FCONTA_REMETENTE write FCONTA_REMETENTE;
    [TColumn('PRAZO_MEDIO_ENTREGA', 'Prazo Medio Entrega', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property PrazoMedioEntrega: Integer  read FPRAZO_MEDIO_ENTREGA write FPRAZO_MEDIO_ENTREGA;
    [TColumn('GERA_FATURAMENTO', 'Gera Faturamento', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property GeraFaturamento: String  read FGERA_FATURAMENTO write FGERA_FATURAMENTO;
    [TColumn('NUM_DIAS_PRIMEIRO_VENCIMENTO', 'Num Dias Primeiro Vencimento', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property NumDiasPrimeiroVencimento: Integer  read FNUM_DIAS_PRIMEIRO_VENCIMENTO write FNUM_DIAS_PRIMEIRO_VENCIMENTO;
    [TColumn('NUM_DIAS_INTERVALO', 'Num Dias Intervalo', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property NumDiasIntervalo: Integer  read FNUM_DIAS_INTERVALO write FNUM_DIAS_INTERVALO;
    [TColumn('QUANTIDADE_PARCELAS', 'Quantidade Parcelas', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property QuantidadeParcelas: Integer  read FQUANTIDADE_PARCELAS write FQUANTIDADE_PARCELAS;
    [TColumn('CLASSIFICACAO_CONTABIL_CONTA', 'Classificacao Contabil Conta', 240, [ldGrid, ldLookup, ldCombobox], False)]
    property ClassificacaoContabilConta: String  read FCLASSIFICACAO_CONTABIL_CONTA write FCLASSIFICACAO_CONTABIL_CONTA;


    //Transientes



  end;

implementation


initialization
  Classes.RegisterClass(TFornecedorVO);

finalization
  Classes.UnRegisterClass(TFornecedorVO);

end.
