{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [FISCAL_NOTA_FISCAL_ENTRADA] 
                                                                                
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
unit FiscalNotaFiscalEntradaVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils;

type
  [TEntity]
  [TTable('FISCAL_NOTA_FISCAL_ENTRADA')]
  TFiscalNotaFiscalEntradaVO = class(TVO)
  private
    FID: Integer;
    FID_NFE_CABECALHO: Integer;
    FCOMPETENCIA: String;
    FCFOP_ENTRADA: Integer;
    FVALOR_RATEIO_FRETE: Extended;
    FVALOR_CUSTO_MEDIO: Extended;
    FVALOR_ICMS_ANTECIPADO: Extended;
    FVALOR_BC_ICMS_ANTECIPADO: Extended;
    FVALOR_BC_ICMS_CREDITADO: Extended;
    FVALOR_BC_PIS_CREDITADO: Extended;
    FVALOR_BC_COFINS_CREDITADO: Extended;
    FVALOR_BC_IPI_CREDITADO: Extended;
    FCST_CREDITO_ICMS: String;
    FCST_CREDITO_PIS: String;
    FCST_CREDITO_COFINS: String;
    FCST_CREDITO_IPI: String;
    FVALOR_ICMS_CREDITADO: Extended;
    FVALOR_PIS_CREDITADO: Extended;
    FVALOR_COFINS_CREDITADO: Extended;
    FVALOR_IPI_CREDITADO: Extended;
    FQTDE_PARCELA_CREDITO_PIS: Integer;
    FQTDE_PARCELA_CREDITO_COFINS: Integer;
    FQTDE_PARCELA_CREDITO_ICMS: Integer;
    FQTDE_PARCELA_CREDITO_IPI: Integer;
    FALIQUOTA_CREDITO_ICMS: Extended;
    FALIQUOTA_CREDITO_PIS: Extended;
    FALIQUOTA_CREDITO_COFINS: Extended;
    FALIQUOTA_CREDITO_IPI: Extended;

  public 
    [TId('ID')]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;
    [TColumn('ID_NFE_CABECALHO', 'Id Nfe Cabecalho', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdNfeCabecalho: Integer  read FID_NFE_CABECALHO write FID_NFE_CABECALHO;
    [TColumn('COMPETENCIA', 'Competencia', 56, [ldGrid, ldLookup, ldCombobox], False)]
    property Competencia: String  read FCOMPETENCIA write FCOMPETENCIA;
    [TColumn('CFOP_ENTRADA', 'Cfop Entrada', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property CfopEntrada: Integer  read FCFOP_ENTRADA write FCFOP_ENTRADA;
    [TColumn('VALOR_RATEIO_FRETE', 'Valor Rateio Frete', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorRateioFrete: Extended  read FVALOR_RATEIO_FRETE write FVALOR_RATEIO_FRETE;
    [TColumn('VALOR_CUSTO_MEDIO', 'Valor Custo Medio', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorCustoMedio: Extended  read FVALOR_CUSTO_MEDIO write FVALOR_CUSTO_MEDIO;
    [TColumn('VALOR_ICMS_ANTECIPADO', 'Valor Icms Antecipado', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorIcmsAntecipado: Extended  read FVALOR_ICMS_ANTECIPADO write FVALOR_ICMS_ANTECIPADO;
    [TColumn('VALOR_BC_ICMS_ANTECIPADO', 'Valor Bc Icms Antecipado', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorBcIcmsAntecipado: Extended  read FVALOR_BC_ICMS_ANTECIPADO write FVALOR_BC_ICMS_ANTECIPADO;
    [TColumn('VALOR_BC_ICMS_CREDITADO', 'Valor Bc Icms Creditado', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorBcIcmsCreditado: Extended  read FVALOR_BC_ICMS_CREDITADO write FVALOR_BC_ICMS_CREDITADO;
    [TColumn('VALOR_BC_PIS_CREDITADO', 'Valor Bc Pis Creditado', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorBcPisCreditado: Extended  read FVALOR_BC_PIS_CREDITADO write FVALOR_BC_PIS_CREDITADO;
    [TColumn('VALOR_BC_COFINS_CREDITADO', 'Valor Bc Cofins Creditado', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorBcCofinsCreditado: Extended  read FVALOR_BC_COFINS_CREDITADO write FVALOR_BC_COFINS_CREDITADO;
    [TColumn('VALOR_BC_IPI_CREDITADO', 'Valor Bc Ipi Creditado', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorBcIpiCreditado: Extended  read FVALOR_BC_IPI_CREDITADO write FVALOR_BC_IPI_CREDITADO;
    [TColumn('CST_CREDITO_ICMS', 'Cst Credito Icms', 24, [ldGrid, ldLookup, ldCombobox], False)]
    property CstCreditoIcms: String  read FCST_CREDITO_ICMS write FCST_CREDITO_ICMS;
    [TColumn('CST_CREDITO_PIS', 'Cst Credito Pis', 16, [ldGrid, ldLookup, ldCombobox], False)]
    property CstCreditoPis: String  read FCST_CREDITO_PIS write FCST_CREDITO_PIS;
    [TColumn('CST_CREDITO_COFINS', 'Cst Credito Cofins', 16, [ldGrid, ldLookup, ldCombobox], False)]
    property CstCreditoCofins: String  read FCST_CREDITO_COFINS write FCST_CREDITO_COFINS;
    [TColumn('CST_CREDITO_IPI', 'Cst Credito Ipi', 16, [ldGrid, ldLookup, ldCombobox], False)]
    property CstCreditoIpi: String  read FCST_CREDITO_IPI write FCST_CREDITO_IPI;
    [TColumn('VALOR_ICMS_CREDITADO', 'Valor Icms Creditado', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorIcmsCreditado: Extended  read FVALOR_ICMS_CREDITADO write FVALOR_ICMS_CREDITADO;
    [TColumn('VALOR_PIS_CREDITADO', 'Valor Pis Creditado', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorPisCreditado: Extended  read FVALOR_PIS_CREDITADO write FVALOR_PIS_CREDITADO;
    [TColumn('VALOR_COFINS_CREDITADO', 'Valor Cofins Creditado', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorCofinsCreditado: Extended  read FVALOR_COFINS_CREDITADO write FVALOR_COFINS_CREDITADO;
    [TColumn('VALOR_IPI_CREDITADO', 'Valor Ipi Creditado', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorIpiCreditado: Extended  read FVALOR_IPI_CREDITADO write FVALOR_IPI_CREDITADO;
    [TColumn('QTDE_PARCELA_CREDITO_PIS', 'Qtde Parcela Credito Pis', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property QtdeParcelaCreditoPis: Integer  read FQTDE_PARCELA_CREDITO_PIS write FQTDE_PARCELA_CREDITO_PIS;
    [TColumn('QTDE_PARCELA_CREDITO_COFINS', 'Qtde Parcela Credito Cofins', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property QtdeParcelaCreditoCofins: Integer  read FQTDE_PARCELA_CREDITO_COFINS write FQTDE_PARCELA_CREDITO_COFINS;
    [TColumn('QTDE_PARCELA_CREDITO_ICMS', 'Qtde Parcela Credito Icms', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property QtdeParcelaCreditoIcms: Integer  read FQTDE_PARCELA_CREDITO_ICMS write FQTDE_PARCELA_CREDITO_ICMS;
    [TColumn('QTDE_PARCELA_CREDITO_IPI', 'Qtde Parcela Credito Ipi', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property QtdeParcelaCreditoIpi: Integer  read FQTDE_PARCELA_CREDITO_IPI write FQTDE_PARCELA_CREDITO_IPI;
    [TColumn('ALIQUOTA_CREDITO_ICMS', 'Aliquota Credito Icms', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property AliquotaCreditoIcms: Extended  read FALIQUOTA_CREDITO_ICMS write FALIQUOTA_CREDITO_ICMS;
    [TColumn('ALIQUOTA_CREDITO_PIS', 'Aliquota Credito Pis', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property AliquotaCreditoPis: Extended  read FALIQUOTA_CREDITO_PIS write FALIQUOTA_CREDITO_PIS;
    [TColumn('ALIQUOTA_CREDITO_COFINS', 'Aliquota Credito Cofins', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property AliquotaCreditoCofins: Extended  read FALIQUOTA_CREDITO_COFINS write FALIQUOTA_CREDITO_COFINS;
    [TColumn('ALIQUOTA_CREDITO_IPI', 'Aliquota Credito Ipi', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property AliquotaCreditoIpi: Extended  read FALIQUOTA_CREDITO_IPI write FALIQUOTA_CREDITO_IPI;

  end;

implementation


initialization
  Classes.RegisterClass(TFiscalNotaFiscalEntradaVO);

finalization
  Classes.UnRegisterClass(TFiscalNotaFiscalEntradaVO);

end.
