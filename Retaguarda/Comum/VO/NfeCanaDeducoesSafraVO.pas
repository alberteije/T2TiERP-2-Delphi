{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [NFE_CANA_DEDUCOES_SAFRA] 
                                                                                
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
unit NfeCanaDeducoesSafraVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils;

type
  [TEntity]
  [TTable('NFE_CANA_DEDUCOES_SAFRA')]
  TNfeCanaDeducoesSafraVO = class(TVO)
  private
    FID: Integer;
    FID_NFE_CANA: Integer;
    FDECRICAO: String;
    FVALOR_DEDUCAO: Extended;
    FVALOR_FORNECIMENTO: Extended;
    FVALOR_TOTAL_DEDUCAO: Extended;
    FVALOR_LIQUIDO_FORNECIMENTO: Extended;

  public 
    [TId('ID')]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;
    [TColumn('ID_NFE_CANA', 'Id Nfe Cana', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdNfeCana: Integer  read FID_NFE_CANA write FID_NFE_CANA;
    [TColumn('DECRICAO', 'Decricao', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property Decricao: String  read FDECRICAO write FDECRICAO;
    [TColumn('VALOR_DEDUCAO', 'Valor Deducao', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorDeducao: Extended  read FVALOR_DEDUCAO write FVALOR_DEDUCAO;
    [TColumn('VALOR_FORNECIMENTO', 'Valor Fornecimento', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorFornecimento: Extended  read FVALOR_FORNECIMENTO write FVALOR_FORNECIMENTO;
    [TColumn('VALOR_TOTAL_DEDUCAO', 'Valor Total Deducao', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorTotalDeducao: Extended  read FVALOR_TOTAL_DEDUCAO write FVALOR_TOTAL_DEDUCAO;
    [TColumn('VALOR_LIQUIDO_FORNECIMENTO', 'Valor Liquido Fornecimento', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorLiquidoFornecimento: Extended  read FVALOR_LIQUIDO_FORNECIMENTO write FVALOR_LIQUIDO_FORNECIMENTO;

  end;

implementation


initialization
  Classes.RegisterClass(TNfeCanaDeducoesSafraVO);

finalization
  Classes.UnRegisterClass(TNfeCanaDeducoesSafraVO);

end.
