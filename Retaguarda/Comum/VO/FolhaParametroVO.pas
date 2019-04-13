{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [FOLHA_PARAMETRO] 
                                                                                
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
unit FolhaParametroVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils;

type
  [TEntity]
  [TTable('FOLHA_PARAMETRO')]
  TFolhaParametroVO = class(TVO)
  private
    FID: Integer;
    FID_EMPRESA: Integer;
    FCOMPETENCIA: String;
    FCONTRIBUI_PIS: String;
    FALIQUOTA_PIS: Extended;
    FDISCRIMINAR_DSR: String;
    FDIA_PAGAMENTO: String;
    FCALCULO_PROPORCIONALIDADE: String;
    FDESCONTAR_FALTAS_13: String;
    FPAGAR_ADICIONAIS_13: String;
    FPAGAR_ESTAGIARIOS_13: String;
    FMES_ADIANTAMENTO_13: String;
    FPERCENTUAL_ADIANTAM_13: Extended;
    FFERIAS_DESCONTAR_FALTAS: String;
    FFERIAS_PAGAR_ADICIONAIS: String;
    FFERIAS_ADIANTAR_13: String;
    FFERIAS_PAGAR_ESTAGIARIOS: String;
    FFERIAS_CALC_JUSTA_CAUSA: String;
    FFERIAS_MOVIMENTO_MENSAL: String;

    //Transientes



  public 
    [TId('ID', [ldGrid, ldLookup, ldComboBox])]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;
    [TColumn('ID_EMPRESA', 'Id Empresa', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdEmpresa: Integer  read FID_EMPRESA write FID_EMPRESA;
    [TColumn('COMPETENCIA', 'Competencia', 56, [ldGrid, ldLookup, ldCombobox], False)]
    property Competencia: String  read FCOMPETENCIA write FCOMPETENCIA;
    [TColumn('CONTRIBUI_PIS', 'Contribui Pis', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property ContribuiPis: String  read FCONTRIBUI_PIS write FCONTRIBUI_PIS;
    [TColumn('ALIQUOTA_PIS', 'Aliquota Pis', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property AliquotaPis: Extended  read FALIQUOTA_PIS write FALIQUOTA_PIS;
    [TColumn('DISCRIMINAR_DSR', 'Discriminar Dsr', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property DiscriminarDsr: String  read FDISCRIMINAR_DSR write FDISCRIMINAR_DSR;
    [TColumn('DIA_PAGAMENTO', 'Dia Pagamento', 16, [ldGrid, ldLookup, ldCombobox], False)]
    property DiaPagamento: String  read FDIA_PAGAMENTO write FDIA_PAGAMENTO;
    [TColumn('CALCULO_PROPORCIONALIDADE', 'Calculo Proporcionalidade', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property CalculoProporcionalidade: String  read FCALCULO_PROPORCIONALIDADE write FCALCULO_PROPORCIONALIDADE;
    [TColumn('DESCONTAR_FALTAS_13', 'Descontar Faltas 13', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property DescontarFaltas13: String  read FDESCONTAR_FALTAS_13 write FDESCONTAR_FALTAS_13;
    [TColumn('PAGAR_ADICIONAIS_13', 'Pagar Adicionais 13', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property PagarAdicionais13: String  read FPAGAR_ADICIONAIS_13 write FPAGAR_ADICIONAIS_13;
    [TColumn('PAGAR_ESTAGIARIOS_13', 'Pagar Estagiarios 13', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property PagarEstagiarios13: String  read FPAGAR_ESTAGIARIOS_13 write FPAGAR_ESTAGIARIOS_13;
    [TColumn('MES_ADIANTAMENTO_13', 'Mes Adiantamento 13', 16, [ldGrid, ldLookup, ldCombobox], False)]
    property MesAdiantamento13: String  read FMES_ADIANTAMENTO_13 write FMES_ADIANTAMENTO_13;
    [TColumn('PERCENTUAL_ADIANTAM_13', 'Percentual Adiantam 13', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property PercentualAdiantam13: Extended  read FPERCENTUAL_ADIANTAM_13 write FPERCENTUAL_ADIANTAM_13;
    [TColumn('FERIAS_DESCONTAR_FALTAS', 'Ferias Descontar Faltas', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property FeriasDescontarFaltas: String  read FFERIAS_DESCONTAR_FALTAS write FFERIAS_DESCONTAR_FALTAS;
    [TColumn('FERIAS_PAGAR_ADICIONAIS', 'Ferias Pagar Adicionais', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property FeriasPagarAdicionais: String  read FFERIAS_PAGAR_ADICIONAIS write FFERIAS_PAGAR_ADICIONAIS;
    [TColumn('FERIAS_ADIANTAR_13', 'Ferias Adiantar 13', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property FeriasAdiantar13: String  read FFERIAS_ADIANTAR_13 write FFERIAS_ADIANTAR_13;
    [TColumn('FERIAS_PAGAR_ESTAGIARIOS', 'Ferias Pagar Estagiarios', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property FeriasPagarEstagiarios: String  read FFERIAS_PAGAR_ESTAGIARIOS write FFERIAS_PAGAR_ESTAGIARIOS;
    [TColumn('FERIAS_CALC_JUSTA_CAUSA', 'Ferias Calc Justa Causa', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property FeriasCalcJustaCausa: String  read FFERIAS_CALC_JUSTA_CAUSA write FFERIAS_CALC_JUSTA_CAUSA;
    [TColumn('FERIAS_MOVIMENTO_MENSAL', 'Ferias Movimento Mensal', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property FeriasMovimentoMensal: String  read FFERIAS_MOVIMENTO_MENSAL write FFERIAS_MOVIMENTO_MENSAL;


    //Transientes



  end;

implementation


initialization
  Classes.RegisterClass(TFolhaParametroVO);

finalization
  Classes.UnRegisterClass(TFolhaParametroVO);

end.
