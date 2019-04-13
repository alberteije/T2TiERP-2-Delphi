{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [FIN_EXTRATO_CONTA_BANCO] 
                                                                                
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
unit FinExtratoContaBancoVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils;

type
  [TEntity]
  [TTable('FIN_EXTRATO_CONTA_BANCO')]
  TFinExtratoContaBancoVO = class(TVO)
  private
    FID: Integer;
    FID_CONTA_CAIXA: Integer;
    FMES_ANO: String;
    FMES: String;
    FANO: String;
    FDATA_MOVIMENTO: TDateTime;
    FDATA_BALANCETE: TDateTime;
    FHISTORICO: String;
    FDOCUMENTO: String;
    FVALOR: Extended;
    FCONCILIADO: String;
    FOBSERVACAO: String;

    //Transientes

  public 
    [TId('ID', [ldGrid, ldLookup, ldComboBox])]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;
    [TColumn('ID_CONTA_CAIXA', 'Id Conta Caixa', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdContaCaixa: Integer  read FID_CONTA_CAIXA write FID_CONTA_CAIXA;
    [TColumn('MES_ANO', 'Mes Ano', 56, [ldGrid, ldLookup, ldCombobox], False)]
    property MesAno: String  read FMES_ANO write FMES_ANO;
    [TColumn('MES', 'Mes', 16, [ldGrid, ldLookup, ldCombobox], False)]
    property Mes: String  read FMES write FMES;
    [TColumn('ANO', 'Ano', 32, [ldGrid, ldLookup, ldCombobox], False)]
    property Ano: String  read FANO write FANO;
    [TColumn('DATA_MOVIMENTO', 'Data Movimento', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property DataMovimento: TDateTime  read FDATA_MOVIMENTO write FDATA_MOVIMENTO;
    [TColumn('DATA_BALANCETE', 'Data Balancete', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property DataBalancete: TDateTime  read FDATA_BALANCETE write FDATA_BALANCETE;
    [TColumn('HISTORICO', 'Historico', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property Historico: String  read FHISTORICO write FHISTORICO;
    [TColumn('DOCUMENTO', 'Documento', 400, [ldGrid, ldLookup, ldCombobox], False)]
    property Documento: String  read FDOCUMENTO write FDOCUMENTO;
    [TColumn('VALOR', 'Valor', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property Valor: Extended  read FVALOR write FVALOR;
    [TColumn('CONCILIADO', 'Conciliado', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property Conciliado: String  read FCONCILIADO write FCONCILIADO;
    [TColumn('OBSERVACAO', 'Observacao', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property Observacao: String  read FOBSERVACAO write FOBSERVACAO;


    //Transientes

  end;

implementation


initialization
  Classes.RegisterClass(TFinExtratoContaBancoVO);

finalization
  Classes.UnRegisterClass(TFinExtratoContaBancoVO);

end.
