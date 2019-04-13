{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [FIN_COBRANCA_PARCELA_RECEBER] 
                                                                                
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
unit FinCobrancaParcelaReceberVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils;

type
  [TEntity]
  [TTable('FIN_COBRANCA_PARCELA_RECEBER')]
  TFinCobrancaParcelaReceberVO = class(TVO)
  private
    FID: Integer;
    FID_FIN_COBRANCA: Integer;
    FID_FIN_LANCAMENTO_RECEBER: Integer;
    FID_FIN_PARCELA_RECEBER: Integer;
    FDATA_VENCIMENTO: TDateTime;
    FVALOR_PARCELA: Extended;
    FVALOR_JURO_SIMULADO: Extended;
    FVALOR_MULTA_SIMULADO: Extended;
    FVALOR_RECEBER_SIMULADO: Extended;
    FVALOR_JURO_ACORDO: Extended;
    FVALOR_MULTA_ACORDO: Extended;
    FVALOR_RECEBER_ACORDO: Extended;

    //Transientes



  public 
    [TId('ID', [ldGrid, ldLookup, ldComboBox])]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;
    [TColumn('ID_FIN_COBRANCA', 'Id Fin Cobranca', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdFinCobranca: Integer  read FID_FIN_COBRANCA write FID_FIN_COBRANCA;
    [TColumn('ID_FIN_LANCAMENTO_RECEBER', 'Id Fin Lancamento Receber', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdFinLancamentoReceber: Integer  read FID_FIN_LANCAMENTO_RECEBER write FID_FIN_LANCAMENTO_RECEBER;
    [TColumn('ID_FIN_PARCELA_RECEBER', 'Id Fin Parcela Receber', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdFinParcelaReceber: Integer  read FID_FIN_PARCELA_RECEBER write FID_FIN_PARCELA_RECEBER;
    [TColumn('DATA_VENCIMENTO', 'Data Vencimento', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property DataVencimento: TDateTime  read FDATA_VENCIMENTO write FDATA_VENCIMENTO;
    [TColumn('VALOR_PARCELA', 'Valor Parcela', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorParcela: Extended  read FVALOR_PARCELA write FVALOR_PARCELA;
    [TColumn('VALOR_JURO_SIMULADO', 'Valor Juro Simulado', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorJuroSimulado: Extended  read FVALOR_JURO_SIMULADO write FVALOR_JURO_SIMULADO;
    [TColumn('VALOR_MULTA_SIMULADO', 'Valor Multa Simulado', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorMultaSimulado: Extended  read FVALOR_MULTA_SIMULADO write FVALOR_MULTA_SIMULADO;
    [TColumn('VALOR_RECEBER_SIMULADO', 'Valor Receber Simulado', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorReceberSimulado: Extended  read FVALOR_RECEBER_SIMULADO write FVALOR_RECEBER_SIMULADO;
    [TColumn('VALOR_JURO_ACORDO', 'Valor Juro Acordo', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorJuroAcordo: Extended  read FVALOR_JURO_ACORDO write FVALOR_JURO_ACORDO;
    [TColumn('VALOR_MULTA_ACORDO', 'Valor Multa Acordo', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorMultaAcordo: Extended  read FVALOR_MULTA_ACORDO write FVALOR_MULTA_ACORDO;
    [TColumn('VALOR_RECEBER_ACORDO', 'Valor Receber Acordo', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorReceberAcordo: Extended  read FVALOR_RECEBER_ACORDO write FVALOR_RECEBER_ACORDO;


    //Transientes



  end;

implementation


initialization
  Classes.RegisterClass(TFinCobrancaParcelaReceberVO);

finalization
  Classes.UnRegisterClass(TFinCobrancaParcelaReceberVO);

end.
