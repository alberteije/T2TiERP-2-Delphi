{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [VIEW_SPED_C190] 
                                                                                
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
unit ViewSpedC190VO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils;

type
  [TEntity]
  [TTable('VIEW_SPED_C190')]
  TViewSpedC190VO = class(TVO)
  private
    FID: Integer;
    FCST_ICMS: String;
    FCFOP: Integer;
    FALIQUOTA_ICMS: Extended;
    FDATA_HORA_EMISSAO: TDateTime;
    FSOMA_VALOR_OPERACAO: Extended;
    FSOMA_BASE_CALCULO_ICMS: Extended;
    FSOMA_VALOR_ICMS: Extended;
    FSOMA_BASE_CALCULO_ICMS_ST: Extended;
    FSOMA_VALOR_ICMS_ST: Extended;
    FSOMA_VL_RED_BC: Extended;
    FSOMA_VALOR_IPI: Extended;

  public 
    [TId('ID')]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;
    [TColumn('CST_ICMS', 'Cst Icms', 16, [ldGrid, ldLookup, ldCombobox], False)]
    property CstIcms: String  read FCST_ICMS write FCST_ICMS;
    [TColumn('CFOP', 'Cfop', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Cfop: Integer  read FCFOP write FCFOP;
    [TColumn('ALIQUOTA_ICMS', 'Aliquota Icms', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property AliquotaIcms: Extended  read FALIQUOTA_ICMS write FALIQUOTA_ICMS;
    [TColumn('DATA_HORA_EMISSAO', 'Data Hora Emissao', 272, [ldGrid, ldLookup, ldCombobox], False)]
    property DataHoraEmissao: TDateTime  read FDATA_HORA_EMISSAO write FDATA_HORA_EMISSAO;
    [TColumn('SOMA_VALOR_OPERACAO', 'Soma Valor Operacao', 264, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property SomaValorOperacao: Extended  read FSOMA_VALOR_OPERACAO write FSOMA_VALOR_OPERACAO;
    [TColumn('SOMA_BASE_CALCULO_ICMS', 'Soma Base Calculo Icms', 264, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property SomaBaseCalculoIcms: Extended  read FSOMA_BASE_CALCULO_ICMS write FSOMA_BASE_CALCULO_ICMS;
    [TColumn('SOMA_VALOR_ICMS', 'Soma Valor Icms', 264, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property SomaValorIcms: Extended  read FSOMA_VALOR_ICMS write FSOMA_VALOR_ICMS;
    [TColumn('SOMA_BASE_CALCULO_ICMS_ST', 'Soma Base Calculo Icms St', 264, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property SomaBaseCalculoIcmsSt: Extended  read FSOMA_BASE_CALCULO_ICMS_ST write FSOMA_BASE_CALCULO_ICMS_ST;
    [TColumn('SOMA_VALOR_ICMS_ST', 'Soma Valor Icms St', 264, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property SomaValorIcmsSt: Extended  read FSOMA_VALOR_ICMS_ST write FSOMA_VALOR_ICMS_ST;
    [TColumn('SOMA_VL_RED_BC', 'Soma Vl Red Bc', 264, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property SomaVlRedBc: Extended  read FSOMA_VL_RED_BC write FSOMA_VL_RED_BC;
    [TColumn('SOMA_VALOR_IPI', 'Soma Valor Ipi', 264, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property SomaValorIpi: Extended  read FSOMA_VALOR_IPI write FSOMA_VALOR_IPI;

  end;

implementation


initialization
  Classes.RegisterClass(TViewSpedC190VO);

finalization
  Classes.UnRegisterClass(TViewSpedC190VO);

end.
