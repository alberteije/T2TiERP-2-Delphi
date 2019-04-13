{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [OPERADORA_CARTAO] 
                                                                                
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
unit OperadoraCartaoVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils, DB,
  ContaCaixaVO;

type
  [TEntity]
  [TTable('OPERADORA_CARTAO')]
  TOperadoraCartaoVO = class(TVO)
  private
    FID: Integer;
    FID_CONTA_CAIXA: Integer;
    FBANDEIRA: String;
    FNOME: String;
    FTAXA_ADM: Extended;
    FTAXA_ADM_DEBITO: Extended;
    FVALOR_ALUGUEL_POS_PIN: Extended;
    FVENCIMENTO_ALUGUEL: Integer;
    FFONE1: String;
    FFONE2: String;
    FCLASSIFICACAO_CONTABIL_CONTA: String;

    //Transientes
    FContaCaixaNome: String;

    FContaCaixaVO: TContaCaixaVO;


  public
    constructor Create; override;
    destructor Destroy; override;

    [TId('ID', [ldGrid, ldLookup, ldComboBox])]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;

    [TColumn('ID_CONTA_CAIXA', 'Id Conta Caixa', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdContaCaixa: Integer  read FID_CONTA_CAIXA write FID_CONTA_CAIXA;
    [TColumnDisplay('CONTA_CAIXA.NOME', 'Conta Caixa', 150, [ldGrid, ldLookup], ftString, 'ContaCaixaVO.TContaCaixaVO', True)]
    property ContaCaixaNome: String read FContaCaixaNome write FContaCaixaNome;

    [TColumn('BANDEIRA', 'Bandeira', 240, [ldGrid, ldLookup, ldCombobox], False)]
    property Bandeira: String  read FBANDEIRA write FBANDEIRA;
    [TColumn('NOME', 'Nome', 400, [ldGrid, ldLookup, ldCombobox], False)]
    property Nome: String  read FNOME write FNOME;
    [TColumn('TAXA_ADM', 'Taxa Adm', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property TaxaAdm: Extended  read FTAXA_ADM write FTAXA_ADM;
    [TColumn('TAXA_ADM_DEBITO', 'Taxa Adm Debito', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property TaxaAdmDebito: Extended  read FTAXA_ADM_DEBITO write FTAXA_ADM_DEBITO;
    [TColumn('VALOR_ALUGUEL_POS_PIN', 'Valor Aluguel Pos Pin', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorAluguelPosPin: Extended  read FVALOR_ALUGUEL_POS_PIN write FVALOR_ALUGUEL_POS_PIN;
    [TColumn('VENCIMENTO_ALUGUEL', 'Vencimento Aluguel', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property VencimentoAluguel: Integer  read FVENCIMENTO_ALUGUEL write FVENCIMENTO_ALUGUEL;
    [TColumn('FONE1', 'Fone1', 112, [ldGrid, ldLookup, ldCombobox], False)]
    property Fone1: String  read FFONE1 write FFONE1;
    [TColumn('FONE2', 'Fone2', 112, [ldGrid, ldLookup, ldCombobox], False)]
    property Fone2: String  read FFONE2 write FFONE2;
    [TColumn('CLASSIFICACAO_CONTABIL_CONTA', 'Classificacao Contabil Conta', 240, [ldGrid, ldLookup, ldCombobox], False)]
    property ClassificacaoContabilConta: String  read FCLASSIFICACAO_CONTABIL_CONTA write FCLASSIFICACAO_CONTABIL_CONTA;


    //Transientes
    [TAssociation('ID', 'ID_CONTA_CAIXA')]
    property ContaCaixaVO: TContaCaixaVO read FContaCaixaVO write FContaCaixaVO;

  end;

implementation

constructor TOperadoraCartaoVO.Create;
begin
  inherited;

  FContaCaixaVO := TContaCaixaVO.Create;
end;

destructor TOperadoraCartaoVO.Destroy;
begin
  FreeAndNil(FContaCaixaVO);
  inherited;
end;

initialization
  Classes.RegisterClass(TOperadoraCartaoVO);

finalization
  Classes.UnRegisterClass(TOperadoraCartaoVO);

end.
