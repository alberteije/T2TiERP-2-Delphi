{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [CTE_SEGURO] 
                                                                                
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
unit CteSeguroVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils;

type
  [TEntity]
  [TTable('CTE_SEGURO')]
  TCteSeguroVO = class(TVO)
  private
    FID: Integer;
    FID_CTE_CABECALHO: Integer;
    FRESPONSAVEL: Integer;
    FSEGURADORA: String;
    FAPOLICE: String;
    FAVERBACAO: String;
    FVALOR_CARGA: Extended;

    //Transientes



  public 
    [TId('ID', [ldGrid, ldLookup, ldComboBox])]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;
    [TColumn('ID_CTE_CABECALHO', 'Id Cte Cabecalho', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdCteCabecalho: Integer  read FID_CTE_CABECALHO write FID_CTE_CABECALHO;
    [TColumn('RESPONSAVEL', 'Responsavel', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Responsavel: Integer  read FRESPONSAVEL write FRESPONSAVEL;
    [TColumn('SEGURADORA', 'Seguradora', 240, [ldGrid, ldLookup, ldCombobox], False)]
    property Seguradora: String  read FSEGURADORA write FSEGURADORA;
    [TColumn('APOLICE', 'Apolice', 160, [ldGrid, ldLookup, ldCombobox], False)]
    property Apolice: String  read FAPOLICE write FAPOLICE;
    [TColumn('AVERBACAO', 'Averbacao', 160, [ldGrid, ldLookup, ldCombobox], False)]
    property Averbacao: String  read FAVERBACAO write FAVERBACAO;
    [TColumn('VALOR_CARGA', 'Valor Carga', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorCarga: Extended  read FVALOR_CARGA write FVALOR_CARGA;


    //Transientes



  end;

implementation


initialization
  Classes.RegisterClass(TCteSeguroVO);

finalization
  Classes.UnRegisterClass(TCteSeguroVO);

end.
