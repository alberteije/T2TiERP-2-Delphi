{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [NFE_DETALHE_IMPOSTO_ICMS] 
                                                                                
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
unit NfeDetalheImpostoIcmsVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils;

type
  [TEntity]
  [TTable('NFE_DETALHE_IMPOSTO_ICMS')]
  TNfeDetalheImpostoIcmsVO = class(TVO)
  private
    FID: Integer;
    FID_NFE_DETALHE: Integer;
    FORIGEM_MERCADORIA: Integer;
    FCST_ICMS: String;
    FCSOSN: String;
    FMODALIDADE_BC_ICMS: Integer;
    FTAXA_REDUCAO_BC_ICMS: Extended;
    FBASE_CALCULO_ICMS: Extended;
    FALIQUOTA_ICMS: Extended;
    FVALOR_ICMS: Extended;
    FVALOR_ICMS_OPERACAO: Extended;
    FPERCENTUAL_DIFERIMENTO: Extended;
    FVALOR_ICMS_DIFERIDO: Extended;
    FMOTIVO_DESONERACAO_ICMS: Integer;
    FVALOR_ICMS_DESONERADO: Extended;
    FMODALIDADE_BC_ICMS_ST: Integer;
    FPERCENTUAL_MVA_ICMS_ST: Extended;
    FPERCENTUAL_REDUCAO_BC_ICMS_ST: Extended;
    FVALOR_BASE_CALCULO_ICMS_ST: Extended;
    FALIQUOTA_ICMS_ST: Extended;
    FVALOR_ICMS_ST: Extended;
    FVALOR_BC_ICMS_ST_RETIDO: Extended;
    FVALOR_ICMS_ST_RETIDO: Extended;
    FVALOR_BC_ICMS_ST_DESTINO: Extended;
    FVALOR_ICMS_ST_DESTINO: Extended;
    FALIQUOTA_CREDITO_ICMS_SN: Extended;
    FVALOR_CREDITO_ICMS_SN: Extended;
    FPERCENTUAL_BC_OPERACAO_PROPRIA: Extended;
    FUF_ST: String;

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
    [TColumn('ORIGEM_MERCADORIA', 'Origem Mercadoria', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property OrigemMercadoria: Integer  read FORIGEM_MERCADORIA write FORIGEM_MERCADORIA;
    [TColumn('CST_ICMS', 'Cst Icms', 16, [ldGrid, ldLookup, ldCombobox], False)]
    property CstIcms: String  read FCST_ICMS write FCST_ICMS;
    [TColumn('CSOSN', 'Csosn', 24, [ldGrid, ldLookup, ldCombobox], False)]
    property Csosn: String  read FCSOSN write FCSOSN;
    [TColumn('MODALIDADE_BC_ICMS', 'Modalidade Bc Icms', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property ModalidadeBcIcms: Integer  read FMODALIDADE_BC_ICMS write FMODALIDADE_BC_ICMS;
    [TColumn('TAXA_REDUCAO_BC_ICMS', 'Taxa Reducao Bc Icms', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property TaxaReducaoBcIcms: Extended  read FTAXA_REDUCAO_BC_ICMS write FTAXA_REDUCAO_BC_ICMS;
    [TColumn('BASE_CALCULO_ICMS', 'Base Calculo Icms', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property BaseCalculoIcms: Extended  read FBASE_CALCULO_ICMS write FBASE_CALCULO_ICMS;
    [TColumn('ALIQUOTA_ICMS', 'Aliquota Icms', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property AliquotaIcms: Extended  read FALIQUOTA_ICMS write FALIQUOTA_ICMS;
    [TColumn('VALOR_ICMS', 'Valor Icms', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorIcms: Extended  read FVALOR_ICMS write FVALOR_ICMS;
    [TColumn('VALOR_ICMS_OPERACAO', 'Valor Icms Operacao', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorIcmsOperacao: Extended  read FVALOR_ICMS_OPERACAO write FVALOR_ICMS_OPERACAO;
    [TColumn('PERCENTUAL_DIFERIMENTO', 'Percentual Diferimento', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property PercentualDiferimento: Extended  read FPERCENTUAL_DIFERIMENTO write FPERCENTUAL_DIFERIMENTO;
    [TColumn('VALOR_ICMS_DIFERIDO', 'Valor Icms Diferido', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorIcmsDiferido: Extended  read FVALOR_ICMS_DIFERIDO write FVALOR_ICMS_DIFERIDO;
    [TColumn('MOTIVO_DESONERACAO_ICMS', 'Motivo Desoneracao Icms', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property MotivoDesoneracaoIcms: Integer  read FMOTIVO_DESONERACAO_ICMS write FMOTIVO_DESONERACAO_ICMS;
    [TColumn('VALOR_ICMS_DESONERADO', 'Valor Icms Desonerado', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorIcmsDesonerado: Extended  read FVALOR_ICMS_DESONERADO write FVALOR_ICMS_DESONERADO;
    [TColumn('MODALIDADE_BC_ICMS_ST', 'Modalidade Bc Icms St', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property ModalidadeBcIcmsSt: Integer  read FMODALIDADE_BC_ICMS_ST write FMODALIDADE_BC_ICMS_ST;
    [TColumn('PERCENTUAL_MVA_ICMS_ST', 'Percentual Mva Icms St', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property PercentualMvaIcmsSt: Extended  read FPERCENTUAL_MVA_ICMS_ST write FPERCENTUAL_MVA_ICMS_ST;
    [TColumn('PERCENTUAL_REDUCAO_BC_ICMS_ST', 'Percentual Reducao Bc Icms St', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property PercentualReducaoBcIcmsSt: Extended  read FPERCENTUAL_REDUCAO_BC_ICMS_ST write FPERCENTUAL_REDUCAO_BC_ICMS_ST;
    [TColumn('VALOR_BASE_CALCULO_ICMS_ST', 'Valor Base Calculo Icms St', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorBaseCalculoIcmsSt: Extended  read FVALOR_BASE_CALCULO_ICMS_ST write FVALOR_BASE_CALCULO_ICMS_ST;
    [TColumn('ALIQUOTA_ICMS_ST', 'Aliquota Icms St', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property AliquotaIcmsSt: Extended  read FALIQUOTA_ICMS_ST write FALIQUOTA_ICMS_ST;
    [TColumn('VALOR_ICMS_ST', 'Valor Icms St', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorIcmsSt: Extended  read FVALOR_ICMS_ST write FVALOR_ICMS_ST;
    [TColumn('VALOR_BC_ICMS_ST_RETIDO', 'Valor Bc Icms St Retido', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorBcIcmsStRetido: Extended  read FVALOR_BC_ICMS_ST_RETIDO write FVALOR_BC_ICMS_ST_RETIDO;
    [TColumn('VALOR_ICMS_ST_RETIDO', 'Valor Icms St Retido', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorIcmsStRetido: Extended  read FVALOR_ICMS_ST_RETIDO write FVALOR_ICMS_ST_RETIDO;
    [TColumn('VALOR_BC_ICMS_ST_DESTINO', 'Valor Bc Icms St Destino', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorBcIcmsStDestino: Extended  read FVALOR_BC_ICMS_ST_DESTINO write FVALOR_BC_ICMS_ST_DESTINO;
    [TColumn('VALOR_ICMS_ST_DESTINO', 'Valor Icms St Destino', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorIcmsStDestino: Extended  read FVALOR_ICMS_ST_DESTINO write FVALOR_ICMS_ST_DESTINO;
    [TColumn('ALIQUOTA_CREDITO_ICMS_SN', 'Aliquota Credito Icms Sn', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property AliquotaCreditoIcmsSn: Extended  read FALIQUOTA_CREDITO_ICMS_SN write FALIQUOTA_CREDITO_ICMS_SN;
    [TColumn('VALOR_CREDITO_ICMS_SN', 'Valor Credito Icms Sn', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorCreditoIcmsSn: Extended  read FVALOR_CREDITO_ICMS_SN write FVALOR_CREDITO_ICMS_SN;
    [TColumn('PERCENTUAL_BC_OPERACAO_PROPRIA', 'Percentual Bc Operacao Propria', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property PercentualBcOperacaoPropria: Extended  read FPERCENTUAL_BC_OPERACAO_PROPRIA write FPERCENTUAL_BC_OPERACAO_PROPRIA;
    [TColumn('UF_ST', 'Uf St', 16, [ldGrid, ldLookup, ldCombobox], False)]
    property UfSt: String  read FUF_ST write FUF_ST;

    [TColumn('PERSISTE', 'Persiste', 60, [], True)]
    property Persiste: String  read FPersiste write FPersiste;

  end;

implementation


initialization
  Classes.RegisterClass(TNfeDetalheImpostoIcmsVO);

finalization
  Classes.UnRegisterClass(TNfeDetalheImpostoIcmsVO);

end.
