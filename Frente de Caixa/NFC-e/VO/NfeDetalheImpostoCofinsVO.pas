{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [NFE_DETALHE_IMPOSTO_COFINS] 
                                                                                
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
unit NfeDetalheImpostoCofinsVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils;

type
  [TEntity]
  [TTable('NFE_DETALHE_IMPOSTO_COFINS')]
  TNfeDetalheImpostoCofinsVO = class(TVO)
  private
    FID: Integer;
    FID_NFE_DETALHE: Integer;
    FCST_COFINS: String;
    FQUANTIDADE_VENDIDA: Extended;
    FBASE_CALCULO_COFINS: Extended;
    FALIQUOTA_COFINS_PERCENTUAL: Extended;
    FALIQUOTA_COFINS_REAIS: Extended;
    FVALOR_COFINS: Extended;

    //Usado no lado cliente para controlar quais registros serão persistidos
    FPersiste: String;

  public
    [TId('ID')]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;
    [TColumn('ID_NFE_DETALHE', 'Id Nfe Detalhe', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdNfeDetalhe: Integer  read FID_NFE_DETALHE write FID_NFE_DETALHE;
    [TColumn('CST_COFINS', 'Cst Cofins', 16, [ldGrid, ldLookup, ldCombobox], False)]
    property CstCofins: String  read FCST_COFINS write FCST_COFINS;
    [TColumn('QUANTIDADE_VENDIDA', 'Quantidade Vendida', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property QuantidadeVendida: Extended  read FQUANTIDADE_VENDIDA write FQUANTIDADE_VENDIDA;
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

    [TColumn('PERSISTE', 'Persiste', 60, [], True)]
    property Persiste: String  read FPersiste write FPersiste;

  end;

implementation


initialization
  Classes.RegisterClass(TNfeDetalheImpostoCofinsVO);

finalization
  Classes.UnRegisterClass(TNfeDetalheImpostoCofinsVO);

end.
