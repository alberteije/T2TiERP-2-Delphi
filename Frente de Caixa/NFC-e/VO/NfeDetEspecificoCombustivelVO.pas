{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [NFE_DET_ESPECIFICO_COMBUSTIVEL] 
                                                                                
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
unit NfeDetEspecificoCombustivelVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils;

type
  [TEntity]
  [TTable('NFE_DET_ESPECIFICO_COMBUSTIVEL')]
  TNfeDetEspecificoCombustivelVO = class(TVO)
  private
    FID: Integer;
    FID_NFE_DETALHE: Integer;
    FCODIGO_ANP: Integer;
    FPERCENTUAL_GAS_NATURAL: Extended;
    FCODIF: String;
    FQUANTIDADE_TEMP_AMBIENTE: Extended;
    FUF_CONSUMO: String;
    FBASE_CALCULO_CIDE: Extended;
    FALIQUOTA_CIDE: Extended;
    FVALOR_CIDE: Extended;

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
    [TColumn('CODIGO_ANP', 'Codigo Anp', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property CodigoAnp: Integer  read FCODIGO_ANP write FCODIGO_ANP;
    [TColumn('PERCENTUAL_GAS_NATURAL', 'Percentual Gas Natural', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property PercentualGasNatural: Extended  read FPERCENTUAL_GAS_NATURAL write FPERCENTUAL_GAS_NATURAL;
    [TColumn('CODIF', 'Codif', 168, [ldGrid, ldLookup, ldCombobox], False)]
    property Codif: String  read FCODIF write FCODIF;
    [TColumn('QUANTIDADE_TEMP_AMBIENTE', 'Quantidade Temp Ambiente', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property QuantidadeTempAmbiente: Extended  read FQUANTIDADE_TEMP_AMBIENTE write FQUANTIDADE_TEMP_AMBIENTE;
    [TColumn('UF_CONSUMO', 'Uf Consumo', 16, [ldGrid, ldLookup, ldCombobox], False)]
    property UfConsumo: String  read FUF_CONSUMO write FUF_CONSUMO;
    [TColumn('BASE_CALCULO_CIDE', 'Base Calculo Cide', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property BaseCalculoCide: Extended  read FBASE_CALCULO_CIDE write FBASE_CALCULO_CIDE;
    [TColumn('ALIQUOTA_CIDE', 'Aliquota Cide', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property AliquotaCide: Extended  read FALIQUOTA_CIDE write FALIQUOTA_CIDE;
    [TColumn('VALOR_CIDE', 'Valor Cide', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorCide: Extended  read FVALOR_CIDE write FVALOR_CIDE;

    [TColumn('PERSISTE', 'Persiste', 60, [], True)]
    property Persiste: String  read FPersiste write FPersiste;

  end;

implementation


initialization
  Classes.RegisterClass(TNfeDetEspecificoCombustivelVO);

finalization
  Classes.UnRegisterClass(TNfeDetEspecificoCombustivelVO);

end.
