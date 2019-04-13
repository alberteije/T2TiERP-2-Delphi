{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [FIN_LCTO_PAGAR_NT_FINANCEIRA] 
                                                                                
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
unit FinLctoPagarNtFinanceiraVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils, DB,
  NaturezaFinanceiraVO;

type
  [TEntity]
  [TTable('FIN_LCTO_PAGAR_NT_FINANCEIRA')]
  TFinLctoPagarNtFinanceiraVO = class(TVO)
  private
    FID: Integer;
    FID_FIN_LANCAMENTO_PAGAR: Integer;
    FID_CONTABIL_LANCAMENTO_DET: Integer;
    FID_NATUREZA_FINANCEIRA: Integer;
    FDATA_INCLUSAO: TDateTime;
    FVALOR: Extended;
    FPERCENTUAL: Extended;

    //Transientes
    FNaturezaFinanceiraDescricao: String;
    FNaturezaFinanceiraClassificacao: String;

    FNaturezaFinanceiraVO: TNaturezaFinanceiraVO;


  public
    constructor Create; override;
    destructor Destroy; override;

    [TId('ID', [ldGrid, ldLookup, ldComboBox])]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;
    [TColumn('ID_FIN_LANCAMENTO_PAGAR', 'Id Fin Lancamento Pagar', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdFinLancamentoPagar: Integer  read FID_FIN_LANCAMENTO_PAGAR write FID_FIN_LANCAMENTO_PAGAR;
    [TColumn('ID_CONTABIL_LANCAMENTO_DET', 'Id Contabil Lancamento Det', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdContabilLancamentoDet: Integer  read FID_CONTABIL_LANCAMENTO_DET write FID_CONTABIL_LANCAMENTO_DET;

    [TColumn('ID_NATUREZA_FINANCEIRA', 'Id Natureza Financeira', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdNaturezaFinanceira: Integer  read FID_NATUREZA_FINANCEIRA write FID_NATUREZA_FINANCEIRA;
    [TColumnDisplay('NATUREZA_FINANCEIRA.DESCRICAO', 'Natureza Financeira Descrição', 150, [ldGrid, ldLookup], ftString, 'NaturezaFinanceiraVO.TNaturezaFinanceiraVO', True)]
    property NaturezaFinanceiraDescricao: String read FNaturezaFinanceiraDescricao write FNaturezaFinanceiraDescricao;
    [TColumnDisplay('NATUREZA_FINANCEIRA.CLASSIFICACAO', 'Natureza Financeira Classificação', 150, [ldGrid, ldLookup], ftString, 'NaturezaFinanceiraVO.TNaturezaFinanceiraVO', True)]
    property NaturezaFinanceiraClassificacao: String read FNaturezaFinanceiraClassificacao write FNaturezaFinanceiraClassificacao;

    [TColumn('DATA_INCLUSAO', 'Data Inclusao', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property DataInclusao: TDateTime  read FDATA_INCLUSAO write FDATA_INCLUSAO;
    [TColumn('VALOR', 'Valor', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property Valor: Extended  read FVALOR write FVALOR;
    [TColumn('PERCENTUAL', 'Percentual', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property Percentual: Extended  read FPERCENTUAL write FPERCENTUAL;

    //Transientes
    [TAssociation('ID', 'ID_NATUREZA_FINANCEIRA')]
    property NaturezaFinanceiraVO: TNaturezaFinanceiraVO read FNaturezaFinanceiraVO write FNaturezaFinanceiraVO;


  end;

implementation

constructor TFinLctoPagarNtFinanceiraVO.Create;
begin
  inherited;

  FNaturezaFinanceiraVO := TNaturezaFinanceiraVO.Create;
end;

destructor TFinLctoPagarNtFinanceiraVO.Destroy;
begin
  FreeAndNil(FNaturezaFinanceiraVO);

  inherited;
end;


initialization
  Classes.RegisterClass(TFinLctoPagarNtFinanceiraVO);

finalization
  Classes.UnRegisterClass(TFinLctoPagarNtFinanceiraVO);

end.
