{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [CTE_INFORMACAO_NF_CARGA] 
                                                                                
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
unit CteInformacaoNfCargaVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils;

type
  [TEntity]
  [TTable('CTE_INFORMACAO_NF_CARGA')]
  TCteInformacaoNfCargaVO = class(TVO)
  private
    FID: Integer;
    FID_CTE_INFORMACAO_NF: Integer;
    FTIPO_UNIDADE_CARGA: Integer;
    FID_UNIDADE_CARGA: String;

    //Transientes



  public 
    [TId('ID', [ldGrid, ldLookup, ldComboBox])]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;
    [TColumn('ID_CTE_INFORMACAO_NF', 'Id Cte Informacao Nf', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdCteInformacaoNf: Integer  read FID_CTE_INFORMACAO_NF write FID_CTE_INFORMACAO_NF;
    [TColumn('TIPO_UNIDADE_CARGA', 'Tipo Unidade Carga', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property TipoUnidadeCarga: Integer  read FTIPO_UNIDADE_CARGA write FTIPO_UNIDADE_CARGA;
    [TColumn('ID_UNIDADE_CARGA', 'Id Unidade Carga', 160, [ldGrid, ldLookup, ldCombobox], False)]
    property IdUnidadeCarga: String  read FID_UNIDADE_CARGA write FID_UNIDADE_CARGA;


    //Transientes



  end;

implementation


initialization
  Classes.RegisterClass(TCteInformacaoNfCargaVO);

finalization
  Classes.UnRegisterClass(TCteInformacaoNfCargaVO);

end.
