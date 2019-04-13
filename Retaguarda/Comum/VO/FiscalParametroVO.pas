{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [FISCAL_PARAMETRO] 
                                                                                
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
unit FiscalParametroVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils;

type
  [TEntity]
  [TTable('FISCAL_PARAMETRO')]
  TFiscalParametroVO = class(TVO)
  private
    FID: Integer;
    FID_FISCAL_ESTADUAL_PORTE: Integer;
    FID_FISCAL_ESTADUAL_REGIME: Integer;
    FID_FISCAL_MUNICIPAL_REGIME: Integer;
    FID_EMPRESA: Integer;
    FVIGENCIA: String;
    FDESCRICAO_VIGENCIA: String;
    FCRITERIO_LANCAMENTO: String;
    FAPURACAO: String;
    FMICROEMPREE_INDIVIDUAL: String;
    FCALC_PIS_COFINS_EFD: String;
    FSIMPLES_CODIGO_ACESSO: String;
    FSIMPLES_TABELA: String;
    FSIMPLES_ATIVIDADE: String;
    FPERFIL_SPED: String;
    FAPURACAO_CONSOLIDADA: String;
    FSUBSTITUICAO_TRIBUTARIA: String;
    FFORMA_CALCULO_ISS: String;

    //Transientes



  public 
    [TId('ID', [ldGrid, ldLookup, ldComboBox])]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;
    [TColumn('ID_FISCAL_ESTADUAL_PORTE', 'Id Fiscal Estadual Porte', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdFiscalEstadualPorte: Integer  read FID_FISCAL_ESTADUAL_PORTE write FID_FISCAL_ESTADUAL_PORTE;
    [TColumn('ID_FISCAL_ESTADUAL_REGIME', 'Id Fiscal Estadual Regime', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdFiscalEstadualRegime: Integer  read FID_FISCAL_ESTADUAL_REGIME write FID_FISCAL_ESTADUAL_REGIME;
    [TColumn('ID_FISCAL_MUNICIPAL_REGIME', 'Id Fiscal Municipal Regime', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdFiscalMunicipalRegime: Integer  read FID_FISCAL_MUNICIPAL_REGIME write FID_FISCAL_MUNICIPAL_REGIME;
    [TColumn('ID_EMPRESA', 'Id Empresa', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdEmpresa: Integer  read FID_EMPRESA write FID_EMPRESA;
    [TColumn('VIGENCIA', 'Vigencia', 56, [ldGrid, ldLookup, ldCombobox], False)]
    property Vigencia: String  read FVIGENCIA write FVIGENCIA;
    [TColumn('DESCRICAO_VIGENCIA', 'Descricao Vigencia', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property DescricaoVigencia: String  read FDESCRICAO_VIGENCIA write FDESCRICAO_VIGENCIA;
    [TColumn('CRITERIO_LANCAMENTO', 'Criterio Lancamento', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property CriterioLancamento: String  read FCRITERIO_LANCAMENTO write FCRITERIO_LANCAMENTO;
    [TColumn('APURACAO', 'Apuracao', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property Apuracao: String  read FAPURACAO write FAPURACAO;
    [TColumn('MICROEMPREE_INDIVIDUAL', 'Microempree Individual', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property MicroempreeIndividual: String  read FMICROEMPREE_INDIVIDUAL write FMICROEMPREE_INDIVIDUAL;
    [TColumn('CALC_PIS_COFINS_EFD', 'Calc Pis Cofins Efd', 16, [ldGrid, ldLookup, ldCombobox], False)]
    property CalcPisCofinsEfd: String  read FCALC_PIS_COFINS_EFD write FCALC_PIS_COFINS_EFD;
    [TColumn('SIMPLES_CODIGO_ACESSO', 'Simples Codigo Acesso', 400, [ldGrid, ldLookup, ldCombobox], False)]
    property SimplesCodigoAcesso: String  read FSIMPLES_CODIGO_ACESSO write FSIMPLES_CODIGO_ACESSO;
    [TColumn('SIMPLES_TABELA', 'Simples Tabela', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property SimplesTabela: String  read FSIMPLES_TABELA write FSIMPLES_TABELA;
    [TColumn('SIMPLES_ATIVIDADE', 'Simples Atividade', 16, [ldGrid, ldLookup, ldCombobox], False)]
    property SimplesAtividade: String  read FSIMPLES_ATIVIDADE write FSIMPLES_ATIVIDADE;
    [TColumn('PERFIL_SPED', 'Perfil Sped', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property PerfilSped: String  read FPERFIL_SPED write FPERFIL_SPED;
    [TColumn('APURACAO_CONSOLIDADA', 'Apuracao Consolidada', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property ApuracaoConsolidada: String  read FAPURACAO_CONSOLIDADA write FAPURACAO_CONSOLIDADA;
    [TColumn('SUBSTITUICAO_TRIBUTARIA', 'Substituicao Tributaria', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property SubstituicaoTributaria: String  read FSUBSTITUICAO_TRIBUTARIA write FSUBSTITUICAO_TRIBUTARIA;
    [TColumn('FORMA_CALCULO_ISS', 'Forma Calculo Iss', 16, [ldGrid, ldLookup, ldCombobox], False)]
    property FormaCalculoIss: String  read FFORMA_CALCULO_ISS write FFORMA_CALCULO_ISS;


    //Transientes



  end;

implementation


initialization
  Classes.RegisterClass(TFiscalParametroVO);

finalization
  Classes.UnRegisterClass(TFiscalParametroVO);

end.
