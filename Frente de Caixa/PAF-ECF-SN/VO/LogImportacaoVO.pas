{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [LOG_IMPORTACAO] 
                                                                                
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
unit LogImportacaoVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils;

type
  [TEntity]
  [TTable('LOG_IMPORTACAO')]
  TLogImportacaoVO = class(TVO)
  private
    FID: Integer;
    FDATA_IMPORTACAO: TDateTime;
    FLOG_ERRO: String;

  public 
    [TId('ID')]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;
    [TColumn('DATA_IMPORTACAO', 'Data Importacao', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property DataImportacao: TDateTime  read FDATA_IMPORTACAO write FDATA_IMPORTACAO;
    [TColumn('LOG_ERRO', 'Log Erro', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property LogErro: String  read FLOG_ERRO write FLOG_ERRO;

  end;

implementation

initialization
  Classes.RegisterClass(TLogImportacaoVO);

finalization
  Classes.UnRegisterClass(TLogImportacaoVO);


end.
