{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [SALARIO_MINIMO] 
                                                                                
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
unit SalarioMinimoVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils;

type
  [TEntity]
  [TTable('SALARIO_MINIMO')]
  TSalarioMinimoVO = class(TVO)
  private
    FID: Integer;
    FVIGENCIA: TDateTime;
    FVALOR_MENSAL: Extended;
    FVALOR_DIARIO: Extended;
    FVALOR_HORA: Extended;
    FNORMA_LEGAL: String;
    FDOU: TDateTime;

  public
    [TId('ID', [ldGrid, ldLookup, ldComboBox])]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;
    [TColumn('VIGENCIA', 'Vigencia', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property Vigencia: TDateTime  read FVIGENCIA write FVIGENCIA;
    [TColumn('VALOR_MENSAL', 'Valor Mensal', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorMensal: Extended  read FVALOR_MENSAL write FVALOR_MENSAL;
    [TColumn('VALOR_DIARIO', 'Valor Diario', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorDiario: Extended  read FVALOR_DIARIO write FVALOR_DIARIO;
    [TColumn('VALOR_HORA', 'Valor Hora', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorHora: Extended  read FVALOR_HORA write FVALOR_HORA;
    [TColumn('NORMA_LEGAL', 'Norma Legal', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property NormaLegal: String  read FNORMA_LEGAL write FNORMA_LEGAL;
    [TColumn('DOU', 'Dou', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property Dou: TDateTime  read FDOU write FDOU;

  end;

implementation


initialization
  Classes.RegisterClass(TSalarioMinimoVO);

finalization
  Classes.UnRegisterClass(TSalarioMinimoVO);

end.
