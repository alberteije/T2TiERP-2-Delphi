{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [TRIBUT_IPI_DIPI] 
                                                                                
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
unit TributIpiDipiVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils, DB,
  CstIpiVO, TipoReceitaDipiVO;

type
  [TEntity]
  [TTable('TRIBUT_IPI_DIPI')]
  TTributIpiDipiVO = class(TVO)
  private
    FID: Integer;
    FID_TRIBUT_CONFIGURA_OF_GT: Integer;
    FID_TIPO_RECEITA_DIPI: Integer;
    FCST_IPI: String;
    FMODALIDADE_BASE_CALCULO: String;
    FPORCENTO_BASE_CALCULO: Extended;
    FALIQUOTA_PORCENTO: Extended;
    FALIQUOTA_UNIDADE: Extended;
    FVALOR_PRECO_MAXIMO: Extended;
    FVALOR_PAUTA_FISCAL: Extended;

    FCstIpiVO: TCstIpiVO;
    FTipoReceitaDipiVO: TTipoReceitaDipiVO;

  public
    constructor Create; override;
    destructor Destroy; override;

    [TId('ID')]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;
    [TColumn('ID_TRIBUT_CONFIGURA_OF_GT', 'Id Tribut Configura Of Gt', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdTributConfiguraOfGt: Integer  read FID_TRIBUT_CONFIGURA_OF_GT write FID_TRIBUT_CONFIGURA_OF_GT;
    [TColumn('ID_TIPO_RECEITA_DIPI', 'Id Tipo Receita Dipi', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdTipoReceitaDipi: Integer  read FID_TIPO_RECEITA_DIPI write FID_TIPO_RECEITA_DIPI;
    [TColumn('CST_IPI', 'Cst Ipi', 16, [ldGrid, ldLookup, ldCombobox], False)]
    property CstIpi: String  read FCST_IPI write FCST_IPI;
    [TColumn('MODALIDADE_BASE_CALCULO', 'Modalidade Base Calculo', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property ModalidadeBaseCalculo: String  read FMODALIDADE_BASE_CALCULO write FMODALIDADE_BASE_CALCULO;
    [TColumn('PORCENTO_BASE_CALCULO', 'Porcento Base Calculo', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property PorcentoBaseCalculo: Extended  read FPORCENTO_BASE_CALCULO write FPORCENTO_BASE_CALCULO;
    [TColumn('ALIQUOTA_PORCENTO', 'Aliquota Porcento', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property AliquotaPorcento: Extended  read FALIQUOTA_PORCENTO write FALIQUOTA_PORCENTO;
    [TColumn('ALIQUOTA_UNIDADE', 'Aliquota Unidade', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property AliquotaUnidade: Extended  read FALIQUOTA_UNIDADE write FALIQUOTA_UNIDADE;
    [TColumn('VALOR_PRECO_MAXIMO', 'Valor Preco Maximo', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorPrecoMaximo: Extended  read FVALOR_PRECO_MAXIMO write FVALOR_PRECO_MAXIMO;
    [TColumn('VALOR_PAUTA_FISCAL', 'Valor Pauta Fiscal', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorPautaFiscal: Extended  read FVALOR_PAUTA_FISCAL write FVALOR_PAUTA_FISCAL;

    [TAssociation('CODIGO', 'CST_IPI')]
    property CstIpiVO: TCstIpiVO read FCstIpiVO write FCstIpiVO;

    [TAssociation('ID', 'ID_TIPO_RECEITA_DIPI')]
    property TipoReceitaDipiVO: TTipoReceitaDipiVO read FTipoReceitaDipiVO write FTipoReceitaDipiVO;

  end;

implementation

constructor TTributIpiDipiVO.Create;
begin
  inherited;
  FCstIpiVO := TCstIpiVO.Create;
  FTipoReceitaDipiVO := TTipoReceitaDipiVO.Create;
end;

destructor TTributIpiDipiVO.Destroy;
begin
  FreeAndNil(FCstIpiVO);
  FreeAndNil(FTipoReceitaDipiVO);
  inherited;
end;

initialization
  Classes.RegisterClass(TTributIpiDipiVO);

finalization
  Classes.UnRegisterClass(TTributIpiDipiVO);

end.
