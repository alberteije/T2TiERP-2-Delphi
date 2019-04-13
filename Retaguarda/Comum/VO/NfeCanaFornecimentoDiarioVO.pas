{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [NFE_CANA_FORNECIMENTO_DIARIO] 
                                                                                
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
unit NfeCanaFornecimentoDiarioVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils;

type
  [TEntity]
  [TTable('NFE_CANA_FORNECIMENTO_DIARIO')]
  TNfeCanaFornecimentoDiarioVO = class(TVO)
  private
    FID: Integer;
    FID_NFE_CANA: Integer;
    FDIA: String;
    FQUANTIDADE: Extended;
    FQUANTIDADE_TOTAL_MES: Extended;
    FQUANTIDADE_TOTAL_ANTERIOR: Extended;
    FQUANTIDADE_TOTAL_GERAL: Extended;

  public 
    [TId('ID')]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;
    [TColumn('ID_NFE_CANA', 'Id Nfe Cana', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdNfeCana: Integer  read FID_NFE_CANA write FID_NFE_CANA;
    [TColumn('DIA', 'Dia', 16, [ldGrid, ldLookup, ldCombobox], False)]
    property Dia: String  read FDIA write FDIA;
    [TColumn('QUANTIDADE', 'Quantidade', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property Quantidade: Extended  read FQUANTIDADE write FQUANTIDADE;
    [TColumn('QUANTIDADE_TOTAL_MES', 'Quantidade Total Mes', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property QuantidadeTotalMes: Extended  read FQUANTIDADE_TOTAL_MES write FQUANTIDADE_TOTAL_MES;
    [TColumn('QUANTIDADE_TOTAL_ANTERIOR', 'Quantidade Total Anterior', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property QuantidadeTotalAnterior: Extended  read FQUANTIDADE_TOTAL_ANTERIOR write FQUANTIDADE_TOTAL_ANTERIOR;
    [TColumn('QUANTIDADE_TOTAL_GERAL', 'Quantidade Total Geral', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property QuantidadeTotalGeral: Extended  read FQUANTIDADE_TOTAL_GERAL write FQUANTIDADE_TOTAL_GERAL;

  end;

implementation


initialization
  Classes.RegisterClass(TNfeCanaFornecimentoDiarioVO);

finalization
  Classes.UnRegisterClass(TNfeCanaFornecimentoDiarioVO);

end.
