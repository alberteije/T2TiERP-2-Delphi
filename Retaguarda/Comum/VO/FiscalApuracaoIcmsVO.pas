{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [FISCAL_APURACAO_ICMS] 
                                                                                
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
unit FiscalApuracaoIcmsVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils;

type
  [TEntity]
  [TTable('FISCAL_APURACAO_ICMS')]
  TFiscalApuracaoIcmsVO = class(TVO)
  private
    FID: Integer;
    FID_EMPRESA: Integer;
    FCOMPETENCIA: String;
    FVALOR_TOTAL_DEBITO: Extended;
    FVALOR_AJUSTE_DEBITO: Extended;
    FVALOR_TOTAL_AJUSTE_DEBITO: Extended;
    FVALOR_ESTORNO_CREDITO: Extended;
    FVALOR_TOTAL_CREDITO: Extended;
    FVALOR_AJUSTE_CREDITO: Extended;
    FVALOR_TOTAL_AJUSTE_CREDITO: Extended;
    FVALOR_ESTORNO_DEBITO: Extended;
    FVALOR_SALDO_CREDOR_ANTERIOR: Extended;
    FVALOR_SALDO_APURADO: Extended;
    FVALOR_TOTAL_DEDUCAO: Extended;
    FVALOR_ICMS_RECOLHER: Extended;
    FVALOR_SALDO_CREDOR_TRANSP: Extended;
    FVALOR_DEBITO_ESPECIAL: Extended;

  public 
    [TId('ID')]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;
    [TColumn('ID_EMPRESA', 'Id Empresa', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdEmpresa: Integer  read FID_EMPRESA write FID_EMPRESA;
    [TColumn('COMPETENCIA', 'Competencia', 56, [ldGrid, ldLookup, ldCombobox], False)]
    property Competencia: String  read FCOMPETENCIA write FCOMPETENCIA;
    [TColumn('VALOR_TOTAL_DEBITO', 'Valor Total Debito', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorTotalDebito: Extended  read FVALOR_TOTAL_DEBITO write FVALOR_TOTAL_DEBITO;
    [TColumn('VALOR_AJUSTE_DEBITO', 'Valor Ajuste Debito', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorAjusteDebito: Extended  read FVALOR_AJUSTE_DEBITO write FVALOR_AJUSTE_DEBITO;
    [TColumn('VALOR_TOTAL_AJUSTE_DEBITO', 'Valor Total Ajuste Debito', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorTotalAjusteDebito: Extended  read FVALOR_TOTAL_AJUSTE_DEBITO write FVALOR_TOTAL_AJUSTE_DEBITO;
    [TColumn('VALOR_ESTORNO_CREDITO', 'Valor Estorno Credito', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorEstornoCredito: Extended  read FVALOR_ESTORNO_CREDITO write FVALOR_ESTORNO_CREDITO;
    [TColumn('VALOR_TOTAL_CREDITO', 'Valor Total Credito', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorTotalCredito: Extended  read FVALOR_TOTAL_CREDITO write FVALOR_TOTAL_CREDITO;
    [TColumn('VALOR_AJUSTE_CREDITO', 'Valor Ajuste Credito', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorAjusteCredito: Extended  read FVALOR_AJUSTE_CREDITO write FVALOR_AJUSTE_CREDITO;
    [TColumn('VALOR_TOTAL_AJUSTE_CREDITO', 'Valor Total Ajuste Credito', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorTotalAjusteCredito: Extended  read FVALOR_TOTAL_AJUSTE_CREDITO write FVALOR_TOTAL_AJUSTE_CREDITO;
    [TColumn('VALOR_ESTORNO_DEBITO', 'Valor Estorno Debito', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorEstornoDebito: Extended  read FVALOR_ESTORNO_DEBITO write FVALOR_ESTORNO_DEBITO;
    [TColumn('VALOR_SALDO_CREDOR_ANTERIOR', 'Valor Saldo Credor Anterior', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorSaldoCredorAnterior: Extended  read FVALOR_SALDO_CREDOR_ANTERIOR write FVALOR_SALDO_CREDOR_ANTERIOR;
    [TColumn('VALOR_SALDO_APURADO', 'Valor Saldo Apurado', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorSaldoApurado: Extended  read FVALOR_SALDO_APURADO write FVALOR_SALDO_APURADO;
    [TColumn('VALOR_TOTAL_DEDUCAO', 'Valor Total Deducao', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorTotalDeducao: Extended  read FVALOR_TOTAL_DEDUCAO write FVALOR_TOTAL_DEDUCAO;
    [TColumn('VALOR_ICMS_RECOLHER', 'Valor Icms Recolher', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorIcmsRecolher: Extended  read FVALOR_ICMS_RECOLHER write FVALOR_ICMS_RECOLHER;
    [TColumn('VALOR_SALDO_CREDOR_TRANSP', 'Valor Saldo Credor Transp', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorSaldoCredorTransp: Extended  read FVALOR_SALDO_CREDOR_TRANSP write FVALOR_SALDO_CREDOR_TRANSP;
    [TColumn('VALOR_DEBITO_ESPECIAL', 'Valor Debito Especial', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorDebitoEspecial: Extended  read FVALOR_DEBITO_ESPECIAL write FVALOR_DEBITO_ESPECIAL;

  end;

implementation


initialization
  Classes.RegisterClass(TFiscalApuracaoIcmsVO);

finalization
  Classes.UnRegisterClass(TFiscalApuracaoIcmsVO);

end.
