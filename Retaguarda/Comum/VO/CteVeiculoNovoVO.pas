{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [CTE_VEICULO_NOVO] 
                                                                                
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
unit CteVeiculoNovoVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils;

type
  [TEntity]
  [TTable('CTE_VEICULO_NOVO')]
  TCteVeiculoNovoVO = class(TVO)
  private
    FID: Integer;
    FID_CTE_CABECALHO: Integer;
    FCHASSI: String;
    FCOR: String;
    FDESCRICAO_COR: String;
    FCODIGO_MARCA_MODELO: String;
    FVALOR_UNITARIO: Extended;
    FVALOR_FRETE: Extended;

    //Transientes



  public 
    [TId('ID', [ldGrid, ldLookup, ldComboBox])]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;
    [TColumn('ID_CTE_CABECALHO', 'Id Cte Cabecalho', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdCteCabecalho: Integer  read FID_CTE_CABECALHO write FID_CTE_CABECALHO;
    [TColumn('CHASSI', 'Chassi', 136, [ldGrid, ldLookup, ldCombobox], False)]
    property Chassi: String  read FCHASSI write FCHASSI;
    [TColumn('COR', 'Cor', 32, [ldGrid, ldLookup, ldCombobox], False)]
    property Cor: String  read FCOR write FCOR;
    [TColumn('DESCRICAO_COR', 'Descricao Cor', 320, [ldGrid, ldLookup, ldCombobox], False)]
    property DescricaoCor: String  read FDESCRICAO_COR write FDESCRICAO_COR;
    [TColumn('CODIGO_MARCA_MODELO', 'Codigo Marca Modelo', 48, [ldGrid, ldLookup, ldCombobox], False)]
    property CodigoMarcaModelo: String  read FCODIGO_MARCA_MODELO write FCODIGO_MARCA_MODELO;
    [TColumn('VALOR_UNITARIO', 'Valor Unitario', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorUnitario: Extended  read FVALOR_UNITARIO write FVALOR_UNITARIO;
    [TColumn('VALOR_FRETE', 'Valor Frete', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorFrete: Extended  read FVALOR_FRETE write FVALOR_FRETE;


    //Transientes



  end;

implementation


initialization
  Classes.RegisterClass(TCteVeiculoNovoVO);

finalization
  Classes.UnRegisterClass(TCteVeiculoNovoVO);

end.
