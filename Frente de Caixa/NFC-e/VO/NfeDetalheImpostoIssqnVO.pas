{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [NFE_DETALHE_IMPOSTO_ISSQN] 
                                                                                
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
unit NfeDetalheImpostoIssqnVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils;

type
  [TEntity]
  [TTable('NFE_DETALHE_IMPOSTO_ISSQN')]
  TNfeDetalheImpostoIssqnVO = class(TVO)
  private
    FID: Integer;
    FID_NFE_DETALHE: Integer;
    FBASE_CALCULO_ISSQN: Extended;
    FALIQUOTA_ISSQN: Extended;
    FVALOR_ISSQN: Extended;
    FMUNICIPIO_ISSQN: Integer;
    FITEM_LISTA_SERVICOS: Integer;
    FVALOR_DEDUCAO: Extended;
    FVALOR_OUTRAS_RETENCOES: Extended;
    FVALOR_DESCONTO_INCONDICIONADO: Extended;
    FVALOR_DESCONTO_CONDICIONADO: Extended;
    FVALOR_RETENCAO_ISS: Extended;
    FINDICADOR_EXIGIBILIDADE_ISS: Integer;
    FCODIGO_SERVICO: String;
    FMUNICIPIO_INCIDENCIA: Integer;
    FPAIS_SEVICO_PRESTADO: Integer;
    FNUMERO_PROCESSO: String;
    FINDICADOR_INCENTIVO_FISCAL: Integer;

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
    [TColumn('BASE_CALCULO_ISSQN', 'Base Calculo Issqn', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property BaseCalculoIssqn: Extended  read FBASE_CALCULO_ISSQN write FBASE_CALCULO_ISSQN;
    [TColumn('ALIQUOTA_ISSQN', 'Aliquota Issqn', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property AliquotaIssqn: Extended  read FALIQUOTA_ISSQN write FALIQUOTA_ISSQN;
    [TColumn('VALOR_ISSQN', 'Valor Issqn', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorIssqn: Extended  read FVALOR_ISSQN write FVALOR_ISSQN;
    [TColumn('MUNICIPIO_ISSQN', 'Municipio Issqn', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property MunicipioIssqn: Integer  read FMUNICIPIO_ISSQN write FMUNICIPIO_ISSQN;
    [TColumn('ITEM_LISTA_SERVICOS', 'Item Lista Servicos', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property ItemListaServicos: Integer  read FITEM_LISTA_SERVICOS write FITEM_LISTA_SERVICOS;
    [TColumn('VALOR_DEDUCAO', 'Valor Deducao', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorDeducao: Extended  read FVALOR_DEDUCAO write FVALOR_DEDUCAO;
    [TColumn('VALOR_OUTRAS_RETENCOES', 'Valor Outras Retencoes', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorOutrasRetencoes: Extended  read FVALOR_OUTRAS_RETENCOES write FVALOR_OUTRAS_RETENCOES;
    [TColumn('VALOR_DESCONTO_INCONDICIONADO', 'Valor Desconto Incondicionado', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorDescontoIncondicionado: Extended  read FVALOR_DESCONTO_INCONDICIONADO write FVALOR_DESCONTO_INCONDICIONADO;
    [TColumn('VALOR_DESCONTO_CONDICIONADO', 'Valor Desconto Condicionado', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorDescontoCondicionado: Extended  read FVALOR_DESCONTO_CONDICIONADO write FVALOR_DESCONTO_CONDICIONADO;
    [TColumn('VALOR_RETENCAO_ISS', 'Valor Retencao Iss', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorRetencaoIss: Extended  read FVALOR_RETENCAO_ISS write FVALOR_RETENCAO_ISS;
    [TColumn('INDICADOR_EXIGIBILIDADE_ISS', 'Indicador Exigibilidade Iss', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IndicadorExigibilidadeIss: Integer  read FINDICADOR_EXIGIBILIDADE_ISS write FINDICADOR_EXIGIBILIDADE_ISS;
    [TColumn('CODIGO_SERVICO', 'Codigo Servico', 160, [ldGrid, ldLookup, ldCombobox], False)]
    property CodigoServico: String  read FCODIGO_SERVICO write FCODIGO_SERVICO;
    [TColumn('MUNICIPIO_INCIDENCIA', 'Municipio Incidencia', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property MunicipioIncidencia: Integer  read FMUNICIPIO_INCIDENCIA write FMUNICIPIO_INCIDENCIA;
    [TColumn('PAIS_SEVICO_PRESTADO', 'Pais Sevico Prestado', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property PaisSevicoPrestado: Integer  read FPAIS_SEVICO_PRESTADO write FPAIS_SEVICO_PRESTADO;
    [TColumn('NUMERO_PROCESSO', 'Numero Processo', 240, [ldGrid, ldLookup, ldCombobox], False)]
    property NumeroProcesso: String  read FNUMERO_PROCESSO write FNUMERO_PROCESSO;
    [TColumn('INDICADOR_INCENTIVO_FISCAL', 'Indicador Incentivo Fiscal', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IndicadorIncentivoFiscal: Integer  read FINDICADOR_INCENTIVO_FISCAL write FINDICADOR_INCENTIVO_FISCAL;

    [TColumn('PERSISTE', 'Persiste', 60, [], True)]
    property Persiste: String  read FPersiste write FPersiste;

  end;

implementation


initialization
  Classes.RegisterClass(TNfeDetalheImpostoIssqnVO);

finalization
  Classes.UnRegisterClass(TNfeDetalheImpostoIssqnVO);

end.
