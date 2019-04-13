{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [VIEW_FIN_CHEQUE_EMITIDO] 
                                                                                
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
unit ViewFinChequeEmitidoVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils;

type
  [TEntity]
  [TTable('VIEW_FIN_CHEQUE_EMITIDO')]
  TViewFinChequeEmitidoVO = class(TVO)
  private
    FID_CONTA_CAIXA: Integer;
    FNOME_CONTA_CAIXA: String;
    FTALAO: String;
    FNUMERO_TALAO: Integer;
    FID_CHEQUE: Integer;
    FNUMERO_CHEQUE: Integer;
    FSTATUS_CHEQUE: String;
    FDATA_STATUS: TDateTime;
    FVALOR: Extended;

    //Transientes



  public 
    [TColumn('ID_CONTA_CAIXA', 'Id Conta Caixa', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdContaCaixa: Integer  read FID_CONTA_CAIXA write FID_CONTA_CAIXA;
    [TColumn('NOME_CONTA_CAIXA', 'Nome Conta Caixa', 400, [ldGrid, ldLookup, ldCombobox], False)]
    property NomeContaCaixa: String  read FNOME_CONTA_CAIXA write FNOME_CONTA_CAIXA;
    [TColumn('TALAO', 'Talao', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property Talao: String  read FTALAO write FTALAO;
    [TColumn('NUMERO_TALAO', 'Numero Talao', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property NumeroTalao: Integer  read FNUMERO_TALAO write FNUMERO_TALAO;
    [TColumn('ID_CHEQUE', 'Id Cheque', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdCheque: Integer  read FID_CHEQUE write FID_CHEQUE;
    [TColumn('NUMERO_CHEQUE', 'Numero Cheque', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property NumeroCheque: Integer  read FNUMERO_CHEQUE write FNUMERO_CHEQUE;
    [TColumn('STATUS_CHEQUE', 'Status Cheque', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property StatusCheque: String  read FSTATUS_CHEQUE write FSTATUS_CHEQUE;
    [TColumn('DATA_STATUS', 'Data Status', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property DataStatus: TDateTime  read FDATA_STATUS write FDATA_STATUS;
    [TColumn('VALOR', 'Valor', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property Valor: Extended  read FVALOR write FVALOR;


    //Transientes



  end;

implementation


initialization
  Classes.RegisterClass(TViewFinChequeEmitidoVO);

finalization
  Classes.UnRegisterClass(TViewFinChequeEmitidoVO);

end.
