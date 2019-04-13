{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [ECF_CHEQUE_CLIENTE] 
                                                                                
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
unit EcfChequeClienteVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils;

type
  [TEntity]
  [TTable('ECF_CHEQUE_CLIENTE')]
  TEcfChequeClienteVO = class(TVO)
  private
    FID: Integer;
    FID_BANCO: Integer;
    FID_CLIENTE: Integer;
    FID_ECF_MOVIMENTO: Integer;
    FNUMERO_CHEQUE: Integer;
    FDATA_CHEQUE: TDateTime;
    FVALOR_CHEQUE: Extended;
    FOBSERVACOES: String;
    FAGENCIA: String;
    FCONTA: String;
    FTIPO_CHEQUE: String;

  public 
    [TId('ID')]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;
    [TColumn('ID_BANCO', 'Id Banco', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdBanco: Integer  read FID_BANCO write FID_BANCO;
    [TColumn('ID_CLIENTE', 'Id Cliente', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdCliente: Integer  read FID_CLIENTE write FID_CLIENTE;
    [TColumn('ID_ECF_MOVIMENTO', 'Id Ecf Movimento', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdEcfMovimento: Integer  read FID_ECF_MOVIMENTO write FID_ECF_MOVIMENTO;
    [TColumn('NUMERO_CHEQUE', 'Numero Cheque', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property NumeroCheque: Integer  read FNUMERO_CHEQUE write FNUMERO_CHEQUE;
    [TColumn('DATA_CHEQUE', 'Data Cheque', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property DataCheque: TDateTime  read FDATA_CHEQUE write FDATA_CHEQUE;
    [TColumn('VALOR_CHEQUE', 'Valor Cheque', 128, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorCheque: Extended  read FVALOR_CHEQUE write FVALOR_CHEQUE;
    [TColumn('OBSERVACOES', 'Observacoes', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property Observacoes: String  read FOBSERVACOES write FOBSERVACOES;
    [TColumn('AGENCIA', 'Agencia', 120, [ldGrid, ldLookup, ldCombobox], False)]
    property Agencia: String  read FAGENCIA write FAGENCIA;
    [TColumn('CONTA', 'Conta', 120, [ldGrid, ldLookup, ldCombobox], False)]
    property Conta: String  read FCONTA write FCONTA;
    [TColumn('TIPO_CHEQUE', 'Tipo Cheque', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property TipoCheque: String  read FTIPO_CHEQUE write FTIPO_CHEQUE;

  end;

implementation

initialization
  Classes.RegisterClass(TEcfChequeClienteVO);

finalization
  Classes.UnRegisterClass(TEcfChequeClienteVO);


end.
