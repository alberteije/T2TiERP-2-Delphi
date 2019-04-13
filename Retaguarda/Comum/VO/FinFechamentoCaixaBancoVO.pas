{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [FIN_FECHAMENTO_CAIXA_BANCO] 
                                                                                
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
unit FinFechamentoCaixaBancoVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils;

type
  [TEntity]
  [TTable('FIN_FECHAMENTO_CAIXA_BANCO')]
  TFinFechamentoCaixaBancoVO = class(TVO)
  private
    FID: Integer;
    FID_CONTA_CAIXA: Integer;
    FDATA_FECHAMENTO: TDateTime;
    FMES_ANO: String;
    FMES: String;
    FANO: String;
    FSALDO_ANTERIOR: Extended;
    FRECEBIMENTOS: Extended;
    FPAGAMENTOS: Extended;
    FSALDO_CONTA: Extended;
    FCHEQUE_NAO_COMPENSADO: Extended;
    FSALDO_DISPONIVEL: Extended;

    //Transientes



  public 
    [TId('ID', [ldGrid, ldLookup, ldComboBox])]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;
    [TColumn('ID_CONTA_CAIXA', 'Id Conta Caixa', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdContaCaixa: Integer  read FID_CONTA_CAIXA write FID_CONTA_CAIXA;
    [TColumn('DATA_FECHAMENTO', 'Data Fechamento', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property DataFechamento: TDateTime  read FDATA_FECHAMENTO write FDATA_FECHAMENTO;
    [TColumn('MES_ANO', 'Mes Ano', 56, [ldGrid, ldLookup, ldCombobox], False)]
    property MesAno: String  read FMES_ANO write FMES_ANO;
    [TColumn('MES', 'Mes', 16, [ldGrid, ldLookup, ldCombobox], False)]
    property Mes: String  read FMES write FMES;
    [TColumn('ANO', 'Ano', 32, [ldGrid, ldLookup, ldCombobox], False)]
    property Ano: String  read FANO write FANO;
    [TColumn('SALDO_ANTERIOR', 'Saldo Anterior', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property SaldoAnterior: Extended  read FSALDO_ANTERIOR write FSALDO_ANTERIOR;
    [TColumn('RECEBIMENTOS', 'Recebimentos', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property Recebimentos: Extended  read FRECEBIMENTOS write FRECEBIMENTOS;
    [TColumn('PAGAMENTOS', 'Pagamentos', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property Pagamentos: Extended  read FPAGAMENTOS write FPAGAMENTOS;
    [TColumn('SALDO_CONTA', 'Saldo Conta', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property SaldoConta: Extended  read FSALDO_CONTA write FSALDO_CONTA;
    [TColumn('CHEQUE_NAO_COMPENSADO', 'Cheque Nao Compensado', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ChequeNaoCompensado: Extended  read FCHEQUE_NAO_COMPENSADO write FCHEQUE_NAO_COMPENSADO;
    [TColumn('SALDO_DISPONIVEL', 'Saldo Disponivel', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property SaldoDisponivel: Extended  read FSALDO_DISPONIVEL write FSALDO_DISPONIVEL;


    //Transientes



  end;

implementation


initialization
  Classes.RegisterClass(TFinFechamentoCaixaBancoVO);

finalization
  Classes.UnRegisterClass(TFinFechamentoCaixaBancoVO);

end.
