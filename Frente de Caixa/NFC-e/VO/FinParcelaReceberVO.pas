{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [FIN_PARCELA_RECEBER] 
                                                                                
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
unit FinParcelaReceberVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils;

type
  [TEntity]
  [TTable('FIN_PARCELA_RECEBER')]
  TFinParcelaReceberVO = class(TVO)
  private
    FID: Integer;
    FID_CONTA_CAIXA: Integer;
    FID_FIN_LANCAMENTO_RECEBER: Integer;
    FID_FIN_STATUS_PARCELA: Integer;
    FNUMERO_PARCELA: Integer;
    FDATA_EMISSAO: TDateTime;
    FDATA_VENCIMENTO: TDateTime;
    FDESCONTO_ATE: TDateTime;
    FVALOR: Extended;
    FTAXA_JURO: Extended;
    FTAXA_MULTA: Extended;
    FTAXA_DESCONTO: Extended;
    FVALOR_JURO: Extended;
    FVALOR_MULTA: Extended;
    FVALOR_DESCONTO: Extended;
    FEMITIU_BOLETO: String;
    FBOLETO_NOSSO_NUMERO: String;

    //Transientes



  public 
    [TId('ID')]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;
    [TColumn('ID_CONTA_CAIXA', 'Id Conta Caixa', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdContaCaixa: Integer  read FID_CONTA_CAIXA write FID_CONTA_CAIXA;
    [TColumn('ID_FIN_LANCAMENTO_RECEBER', 'Id Fin Lancamento Receber', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdFinLancamentoReceber: Integer  read FID_FIN_LANCAMENTO_RECEBER write FID_FIN_LANCAMENTO_RECEBER;
    [TColumn('ID_FIN_STATUS_PARCELA', 'Id Fin Status Parcela', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdFinStatusParcela: Integer  read FID_FIN_STATUS_PARCELA write FID_FIN_STATUS_PARCELA;
    [TColumn('NUMERO_PARCELA', 'Numero Parcela', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property NumeroParcela: Integer  read FNUMERO_PARCELA write FNUMERO_PARCELA;
    [TColumn('DATA_EMISSAO', 'Data Emissao', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property DataEmissao: TDateTime  read FDATA_EMISSAO write FDATA_EMISSAO;
    [TColumn('DATA_VENCIMENTO', 'Data Vencimento', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property DataVencimento: TDateTime  read FDATA_VENCIMENTO write FDATA_VENCIMENTO;
    [TColumn('DESCONTO_ATE', 'Desconto Ate', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property DescontoAte: TDateTime  read FDESCONTO_ATE write FDESCONTO_ATE;
    [TColumn('VALOR', 'Valor', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property Valor: Extended  read FVALOR write FVALOR;
    [TColumn('TAXA_JURO', 'Taxa Juro', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property TaxaJuro: Extended  read FTAXA_JURO write FTAXA_JURO;
    [TColumn('TAXA_MULTA', 'Taxa Multa', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property TaxaMulta: Extended  read FTAXA_MULTA write FTAXA_MULTA;
    [TColumn('TAXA_DESCONTO', 'Taxa Desconto', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property TaxaDesconto: Extended  read FTAXA_DESCONTO write FTAXA_DESCONTO;
    [TColumn('VALOR_JURO', 'Valor Juro', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorJuro: Extended  read FVALOR_JURO write FVALOR_JURO;
    [TColumn('VALOR_MULTA', 'Valor Multa', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorMulta: Extended  read FVALOR_MULTA write FVALOR_MULTA;
    [TColumn('VALOR_DESCONTO', 'Valor Desconto', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorDesconto: Extended  read FVALOR_DESCONTO write FVALOR_DESCONTO;
    [TColumn('EMITIU_BOLETO', 'Emitiu Boleto', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property EmitiuBoleto: String  read FEMITIU_BOLETO write FEMITIU_BOLETO;
    [TColumn('BOLETO_NOSSO_NUMERO', 'Boleto Nosso Numero', 400, [ldGrid, ldLookup, ldCombobox], False)]
    property BoletoNossoNumero: String  read FBOLETO_NOSSO_NUMERO write FBOLETO_NOSSO_NUMERO;


    //Transientes



  end;

implementation


initialization
  Classes.RegisterClass(TFinParcelaReceberVO);

finalization
  Classes.UnRegisterClass(TFinParcelaReceberVO);

end.
