{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [CONTAS_PARCELAS] 
                                                                                
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
unit ContasParcelasVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils;

type
  [TEntity]
  [TTable('CONTAS_PARCELAS')]
  TContasParcelasVO = class(TVO)
  private
    FID: Integer;
    FID_CONTAS_PAGAR_RECEBER: Integer;
    FID_MEIOS_PAGAMENTO: Integer;
    FID_CHEQUE_EMITIDO: Integer;
    FID_CONTA_CAIXA: Integer;
    FDATA_EMISSAO: TDateTime;
    FDATA_VENCIMENTO: TDateTime;
    FDATA_PAGAMENTO: TDateTime;
    FNUMERO_PARCELA: Integer;
    FVALOR: Extended;
    FTAXA_JUROS: Extended;
    FTAXA_MULTA: Extended;
    FTAXA_DESCONTO: Extended;
    FVALOR_JUROS: Extended;
    FVALOR_MULTA: Extended;
    FVALOR_DESCONTO: Extended;
    FTOTAL_PARCELA: Extended;
    FHISTORICO: String;
    FSITUACAO: String;

  public 
    [TId('ID')]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;
    [TColumn('ID_CONTAS_PAGAR_RECEBER', 'Id Contas Pagar Receber', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdContasPagarReceber: Integer  read FID_CONTAS_PAGAR_RECEBER write FID_CONTAS_PAGAR_RECEBER;
    [TColumn('ID_MEIOS_PAGAMENTO', 'Id Meios Pagamento', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdMeiosPagamento: Integer  read FID_MEIOS_PAGAMENTO write FID_MEIOS_PAGAMENTO;
    [TColumn('ID_CHEQUE_EMITIDO', 'Id Cheque Emitido', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdChequeEmitido: Integer  read FID_CHEQUE_EMITIDO write FID_CHEQUE_EMITIDO;
    [TColumn('ID_CONTA_CAIXA', 'Id Conta Caixa', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdContaCaixa: Integer  read FID_CONTA_CAIXA write FID_CONTA_CAIXA;
    [TColumn('DATA_EMISSAO', 'Data Emissao', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property DataEmissao: TDateTime  read FDATA_EMISSAO write FDATA_EMISSAO;
    [TColumn('DATA_VENCIMENTO', 'Data Vencimento', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property DataVencimento: TDateTime  read FDATA_VENCIMENTO write FDATA_VENCIMENTO;
    [TColumn('DATA_PAGAMENTO', 'Data Pagamento', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property DataPagamento: TDateTime  read FDATA_PAGAMENTO write FDATA_PAGAMENTO;
    [TColumn('NUMERO_PARCELA', 'Numero Parcela', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property NumeroParcela: Integer  read FNUMERO_PARCELA write FNUMERO_PARCELA;
    [TColumn('VALOR', 'Valor', 128, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property Valor: Extended  read FVALOR write FVALOR;
    [TColumn('TAXA_JUROS', 'Taxa Juros', 128, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property TaxaJuros: Extended  read FTAXA_JUROS write FTAXA_JUROS;
    [TColumn('TAXA_MULTA', 'Taxa Multa', 128, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property TaxaMulta: Extended  read FTAXA_MULTA write FTAXA_MULTA;
    [TColumn('TAXA_DESCONTO', 'Taxa Desconto', 128, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property TaxaDesconto: Extended  read FTAXA_DESCONTO write FTAXA_DESCONTO;
    [TColumn('VALOR_JUROS', 'Valor Juros', 128, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorJuros: Extended  read FVALOR_JUROS write FVALOR_JUROS;
    [TColumn('VALOR_MULTA', 'Valor Multa', 128, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorMulta: Extended  read FVALOR_MULTA write FVALOR_MULTA;
    [TColumn('VALOR_DESCONTO', 'Valor Desconto', 128, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorDesconto: Extended  read FVALOR_DESCONTO write FVALOR_DESCONTO;
    [TColumn('TOTAL_PARCELA', 'Total Parcela', 128, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property TotalParcela: Extended  read FTOTAL_PARCELA write FTOTAL_PARCELA;
    [TColumn('HISTORICO', 'Historico', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property Historico: String  read FHISTORICO write FHISTORICO;
    [TColumn('SITUACAO', 'Situacao', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property Situacao: String  read FSITUACAO write FSITUACAO;

  end;

implementation


initialization
  Classes.RegisterClass(TContasParcelasVO);

finalization
  Classes.UnRegisterClass(TContasParcelasVO);

end.
