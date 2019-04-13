{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [CLIENTE] 
                                                                                
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
unit ClienteVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils;

type
  [TEntity]
  [TTable('CLIENTE')]
  TClienteVO = class(TVO)
  private
    FID: Integer;
    FID_OPERACAO_FISCAL: Integer;
    FID_PESSOA: Integer;
    FID_ATIVIDADE_FOR_CLI: Integer;
    FID_SITUACAO_FOR_CLI: Integer;
    FDESDE: TDateTime;
    FDATA_CADASTRO: TDateTime;
    FOBSERVACAO: String;
    FCONTA_TOMADOR: String;
    FGERA_FINANCEIRO: String;
    FINDICADOR_PRECO: String;
    FPORCENTO_DESCONTO: Extended;
    FFORMA_DESCONTO: String;
    FLIMITE_CREDITO: Extended;
    FTIPO_FRETE: String;
    FCLASSIFICACAO_CONTABIL_CONTA: String;

  public
    [TId('ID', [ldGrid, ldLookup, ldComboBox])]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;
    [TColumn('ID_OPERACAO_FISCAL', 'Id Operacao Fiscal', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdOperacaoFiscal: Integer  read FID_OPERACAO_FISCAL write FID_OPERACAO_FISCAL;
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
    [TColumn('DATA_CADASTRO', 'Data Cadastro', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property DataCadastro: TDateTime  read FDATA_CADASTRO write FDATA_CADASTRO;
    [TColumn('OBSERVACAO', 'Observacao', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property Observacao: String  read FOBSERVACAO write FOBSERVACAO;
    [TColumn('CONTA_TOMADOR', 'Conta Tomador', 240, [ldGrid, ldLookup, ldCombobox], False)]
    property ContaTomador: String  read FCONTA_TOMADOR write FCONTA_TOMADOR;
    [TColumn('GERA_FINANCEIRO', 'Gera Financeiro', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property GeraFinanceiro: String  read FGERA_FINANCEIRO write FGERA_FINANCEIRO;
    [TColumn('INDICADOR_PRECO', 'Indicador Preco', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property IndicadorPreco: String  read FINDICADOR_PRECO write FINDICADOR_PRECO;
    [TColumn('PORCENTO_DESCONTO', 'Porcento Desconto', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property PorcentoDesconto: Extended  read FPORCENTO_DESCONTO write FPORCENTO_DESCONTO;
    [TColumn('FORMA_DESCONTO', 'Forma Desconto', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property FormaDesconto: String  read FFORMA_DESCONTO write FFORMA_DESCONTO;
    [TColumn('LIMITE_CREDITO', 'Limite Credito', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property LimiteCredito: Extended  read FLIMITE_CREDITO write FLIMITE_CREDITO;
    [TColumn('TIPO_FRETE', 'Tipo Frete', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property TipoFrete: String  read FTIPO_FRETE write FTIPO_FRETE;
    [TColumn('CLASSIFICACAO_CONTABIL_CONTA', 'Classificacao Contabil Conta', 240, [ldGrid, ldLookup, ldCombobox], False)]
    property ClassificacaoContabilConta: String  read FCLASSIFICACAO_CONTABIL_CONTA write FCLASSIFICACAO_CONTABIL_CONTA;


  end;

implementation


initialization
  Classes.RegisterClass(TClienteVO);

finalization
  Classes.UnRegisterClass(TClienteVO);

end.
