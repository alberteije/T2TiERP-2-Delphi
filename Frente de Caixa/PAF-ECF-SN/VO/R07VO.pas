{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [R07] 
                                                                                
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
unit R07VO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils;

type
  [TEntity]
  [TTable('R07')]
  TR07VO = class(TVO)
  private
    FID: Integer;
    FID_R06: Integer;
    FCCF: Integer;
    FMEIO_PAGAMENTO: String;
    FVALOR_PAGAMENTO: Extended;
    FESTORNO: String;
    FVALOR_ESTORNO: Extended;
    FLOGSS: String;

  public 
    [TId('ID')]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;
    [TColumn('ID_R06', 'Id R06', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdR06: Integer  read FID_R06 write FID_R06;
    [TColumn('CCF', 'Ccf', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Ccf: Integer  read FCCF write FCCF;
    [TColumn('MEIO_PAGAMENTO', 'Meio Pagamento', 160, [ldGrid, ldLookup, ldCombobox], False)]
    property MeioPagamento: String  read FMEIO_PAGAMENTO write FMEIO_PAGAMENTO;
    [TColumn('VALOR_PAGAMENTO', 'Valor Pagamento', 128, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorPagamento: Extended  read FVALOR_PAGAMENTO write FVALOR_PAGAMENTO;
    [TColumn('ESTORNO', 'Estorno', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property Estorno: String  read FESTORNO write FESTORNO;
    [TColumn('VALOR_ESTORNO', 'Valor Estorno', 128, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorEstorno: Extended  read FVALOR_ESTORNO write FVALOR_ESTORNO;
    [TColumn('LOGSS', 'Log', 8, [], False)]
    property HashRegistro: String  read FLOGSS write FLOGSS;

  end;

implementation


initialization
  Classes.RegisterClass(TR07VO);

finalization
  Classes.UnRegisterClass(TR07VO);

end.
