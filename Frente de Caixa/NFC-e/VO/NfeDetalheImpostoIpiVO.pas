{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [NFE_DETALHE_IMPOSTO_IPI] 
                                                                                
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
unit NfeDetalheImpostoIpiVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils;

type
  [TEntity]
  [TTable('NFE_DETALHE_IMPOSTO_IPI')]
  TNfeDetalheImpostoIpiVO = class(TVO)
  private
    FID: Integer;
    FID_NFE_DETALHE: Integer;
    FENQUADRAMENTO_IPI: String;
    FCNPJ_PRODUTOR: String;
    FCODIGO_SELO_IPI: String;
    FQUANTIDADE_SELO_IPI: Integer;
    FENQUADRAMENTO_LEGAL_IPI: String;
    FCST_IPI: String;
    FVALOR_BASE_CALCULO_IPI: Extended;
    FALIQUOTA_IPI: Extended;
    FQUANTIDADE_UNIDADE_TRIBUTAVEL: Extended;
    FVALOR_UNIDADE_TRIBUTAVEL: Extended;
    FVALOR_IPI: Extended;

    //Usado no lado cliente para controlar quais registros serão persistidos
    FPersiste: String;

  public 
    [TId('ID')]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;
    [TColumn('ID_NFE_DETALHE', 'Id Nfe Detalhe', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdNfeDetalhe: Integer  read FID_NFE_DETALHE write FID_NFE_DETALHE;
    [TColumn('ENQUADRAMENTO_IPI', 'Enquadramento Ipi', 40, [ldGrid, ldLookup, ldCombobox], False)]
    property EnquadramentoIpi: String  read FENQUADRAMENTO_IPI write FENQUADRAMENTO_IPI;
    [TColumn('CNPJ_PRODUTOR', 'Cnpj Produtor', 112, [ldGrid, ldLookup, ldCombobox], False)]
    property CnpjProdutor: String  read FCNPJ_PRODUTOR write FCNPJ_PRODUTOR;
    [TColumn('CODIGO_SELO_IPI', 'Codigo Selo Ipi', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property CodigoSeloIpi: String  read FCODIGO_SELO_IPI write FCODIGO_SELO_IPI;
    [TColumn('QUANTIDADE_SELO_IPI', 'Quantidade Selo Ipi', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property QuantidadeSeloIpi: Integer  read FQUANTIDADE_SELO_IPI write FQUANTIDADE_SELO_IPI;
    [TColumn('ENQUADRAMENTO_LEGAL_IPI', 'Enquadramento Legal Ipi', 24, [ldGrid, ldLookup, ldCombobox], False)]
    property EnquadramentoLegalIpi: String  read FENQUADRAMENTO_LEGAL_IPI write FENQUADRAMENTO_LEGAL_IPI;
    [TColumn('CST_IPI', 'Cst Ipi', 16, [ldGrid, ldLookup, ldCombobox], False)]
    property CstIpi: String  read FCST_IPI write FCST_IPI;
    [TColumn('VALOR_BASE_CALCULO_IPI', 'Valor Base Calculo Ipi', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorBaseCalculoIpi: Extended  read FVALOR_BASE_CALCULO_IPI write FVALOR_BASE_CALCULO_IPI;
    [TColumn('ALIQUOTA_IPI', 'Aliquota Ipi', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property AliquotaIpi: Extended  read FALIQUOTA_IPI write FALIQUOTA_IPI;
    [TColumn('QUANTIDADE_UNIDADE_TRIBUTAVEL', 'Quantidade Unidade Tributavel', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property QuantidadeUnidadeTributavel: Extended  read FQUANTIDADE_UNIDADE_TRIBUTAVEL write FQUANTIDADE_UNIDADE_TRIBUTAVEL;
    [TColumn('VALOR_UNIDADE_TRIBUTAVEL', 'Valor Unidade Tributavel', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorUnidadeTributavel: Extended  read FVALOR_UNIDADE_TRIBUTAVEL write FVALOR_UNIDADE_TRIBUTAVEL;
    [TColumn('VALOR_IPI', 'Valor Ipi', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorIpi: Extended  read FVALOR_IPI write FVALOR_IPI;

    [TColumn('PERSISTE', 'Persiste', 60, [], True)]
    property Persiste: String  read FPersiste write FPersiste;

  end;

implementation


initialization
  Classes.RegisterClass(TNfeDetalheImpostoIpiVO);

finalization
  Classes.UnRegisterClass(TNfeDetalheImpostoIpiVO);

end.
