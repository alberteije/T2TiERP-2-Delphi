{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [CTE_RODOVIARIO] 
                                                                                
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
unit CteRodoviarioVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils;

type
  [TEntity]
  [TTable('CTE_RODOVIARIO')]
  TCteRodoviarioVO = class(TVO)
  private
    FID: Integer;
    FID_CTE_CABECALHO: Integer;
    FRNTRC: String;
    FDATA_PREVISTA_ENTREGA: TDateTime;
    FINDICADOR_LOTACAO: Integer;
    FCIOT: Integer;

    //Transientes



  public 
    [TId('ID', [ldGrid, ldLookup, ldComboBox])]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;
    [TColumn('ID_CTE_CABECALHO', 'Id Cte Cabecalho', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdCteCabecalho: Integer  read FID_CTE_CABECALHO write FID_CTE_CABECALHO;
    [TColumn('RNTRC', 'Rntrc', 64, [ldGrid, ldLookup, ldCombobox], False)]
    property Rntrc: String  read FRNTRC write FRNTRC;
    [TColumn('DATA_PREVISTA_ENTREGA', 'Data Prevista Entrega', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property DataPrevistaEntrega: TDateTime  read FDATA_PREVISTA_ENTREGA write FDATA_PREVISTA_ENTREGA;
    [TColumn('INDICADOR_LOTACAO', 'Indicador Lotacao', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IndicadorLotacao: Integer  read FINDICADOR_LOTACAO write FINDICADOR_LOTACAO;
    [TColumn('CIOT', 'Ciot', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Ciot: Integer  read FCIOT write FCIOT;


    //Transientes



  end;

implementation


initialization
  Classes.RegisterClass(TCteRodoviarioVO);

finalization
  Classes.UnRegisterClass(TCteRodoviarioVO);

end.
