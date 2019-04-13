{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [CONTABIL_ENCERRAMENTO_EXE_DET] 
                                                                                
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
unit ContabilEncerramentoExeDetVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils;

type
  [TEntity]
  [TTable('CONTABIL_ENCERRAMENTO_EXE_DET')]
  TContabilEncerramentoExeDetVO = class(TVO)
  private
    FID: Integer;
    FID_CONTABIL_CONTA: Integer;
    FID_CONTABIL_ENCERRAMENTO_EXE: Integer;
    FSALDO_ANTERIOR: Extended;
    FVALOR_DEBITO: Extended;
    FVALOR_CREDITO: Extended;
    FSALDO: Extended;

    //Transientes



  public 
    [TId('ID', [ldGrid, ldLookup, ldComboBox])]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;
    [TColumn('ID_CONTABIL_CONTA', 'Id Contabil Conta', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdContabilConta: Integer  read FID_CONTABIL_CONTA write FID_CONTABIL_CONTA;
    [TColumn('ID_CONTABIL_ENCERRAMENTO_EXE', 'Id Contabil Encerramento Exe', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdContabilEncerramentoExe: Integer  read FID_CONTABIL_ENCERRAMENTO_EXE write FID_CONTABIL_ENCERRAMENTO_EXE;
    [TColumn('SALDO_ANTERIOR', 'Saldo Anterior', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property SaldoAnterior: Extended  read FSALDO_ANTERIOR write FSALDO_ANTERIOR;
    [TColumn('VALOR_DEBITO', 'Valor Debito', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorDebito: Extended  read FVALOR_DEBITO write FVALOR_DEBITO;
    [TColumn('VALOR_CREDITO', 'Valor Credito', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorCredito: Extended  read FVALOR_CREDITO write FVALOR_CREDITO;
    [TColumn('SALDO', 'Saldo', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property Saldo: Extended  read FSALDO write FSALDO;


    //Transientes



  end;

implementation


initialization
  Classes.RegisterClass(TContabilEncerramentoExeDetVO);

finalization
  Classes.UnRegisterClass(TContabilEncerramentoExeDetVO);

end.
