{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [ORCAMENTO_DETALHE] 
                                                                                
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
unit OrcamentoDetalheVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils, DB,
  NaturezaFinanceiraVO;

type
  [TEntity]
  [TTable('ORCAMENTO_DETALHE')]
  TOrcamentoDetalheVO = class(TVO)
  private
    FID: Integer;
    FID_NATUREZA_FINANCEIRA: Integer;
    FID_ORCAMENTO_EMPRESARIAL: Integer;
    FPERIODO: String;
    FVALOR_ORCADO: Extended;
    FVALOR_REALIZADO: Extended;
    FTAXA_VARIACAO: Extended;
    FVALOR_VARIACAO: Extended;

    //Transientes
    FNaturezaFinanceiraClassificacao: String;
    FNaturezaFinanceiraDescricao: String;

    FNaturezaFinanceiraVO: TNaturezaFinanceiraVO;

  public
    constructor Create; override;
    destructor Destroy; override;

    [TId('ID', [ldGrid, ldLookup, ldComboBox])]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;

    [TColumn('ID_NATUREZA_FINANCEIRA', 'Id Natureza Financeira', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdNaturezaFinanceira: Integer  read FID_NATUREZA_FINANCEIRA write FID_NATUREZA_FINANCEIRA;
    [TColumnDisplay('NATUREZA_FINANCEIRA.CLASSIFICACAO', 'Classificação', 100, [ldGrid, ldLookup], ftString, 'NaturezaFinanceiraVO.TNaturezaFinanceiraVO', True)]
    property NaturezaFinanceiraClassificacao: string read FNaturezaFinanceiraClassificacao write FNaturezaFinanceiraClassificacao;
    [TColumnDisplay('NATUREZA_FINANCEIRA.DESCRICAO', 'Descrição', 300, [ldGrid, ldLookup], ftString, 'NaturezaFinanceiraVO.TNaturezaFinanceiraVO', True)]
    property NaturezaFinanceiraDescricao: string read FNaturezaFinanceiraDescricao write FNaturezaFinanceiraDescricao;

    [TColumn('ID_ORCAMENTO_EMPRESARIAL', 'Id Orcamento Empresarial', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdOrcamentoEmpresarial: Integer  read FID_ORCAMENTO_EMPRESARIAL write FID_ORCAMENTO_EMPRESARIAL;
    [TColumn('PERIODO', 'Periodo', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property Periodo: String  read FPERIODO write FPERIODO;
    [TColumn('VALOR_ORCADO', 'Valor Orcado', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorOrcado: Extended  read FVALOR_ORCADO write FVALOR_ORCADO;
    [TColumn('VALOR_REALIZADO', 'Valor Realizado', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorRealizado: Extended  read FVALOR_REALIZADO write FVALOR_REALIZADO;
    [TColumn('TAXA_VARIACAO', 'Taxa Variacao', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property TaxaVariacao: Extended  read FTAXA_VARIACAO write FTAXA_VARIACAO;
    [TColumn('VALOR_VARIACAO', 'Valor Variacao', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorVariacao: Extended  read FVALOR_VARIACAO write FVALOR_VARIACAO;

    //Transientes
    [TAssociation('ID', 'ID_NATUREZA_FINANCEIRA')]
    property NaturezaFinanceiraVO: TNaturezaFinanceiraVO read FNaturezaFinanceiraVO write FNaturezaFinanceiraVO;

  end;

implementation

constructor TOrcamentoDetalheVO.Create;
begin
  inherited;

  FNaturezaFinanceiraVO := TNaturezaFinanceiraVO.Create;
end;

destructor TOrcamentoDetalheVO.Destroy;
begin
  FreeAndNil(FNaturezaFinanceiraVO);

  inherited;
end;


initialization
  Classes.RegisterClass(TOrcamentoDetalheVO);

finalization
  Classes.UnRegisterClass(TOrcamentoDetalheVO);

end.
