{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [FOLHA_FERIAS_COLETIVAS] 
                                                                                
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
unit FolhaFeriasColetivasVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils;

type
  [TEntity]
  [TTable('FOLHA_FERIAS_COLETIVAS')]
  TFolhaFeriasColetivasVO = class(TVO)
  private
    FID: Integer;
    FID_EMPRESA: Integer;
    FDATA_INICIO: TDateTime;
    FDATA_FIM: TDateTime;
    FDIAS_GOZO: Integer;
    FABONO_PECUNIARIO_INICIO: TDateTime;
    FABONO_PECUNIARIO_FIM: TDateTime;
    FDIAS_ABONO: Integer;
    FDATA_PAGAMENTO: TDateTime;

    //Transientes



  public 
    [TId('ID', [ldGrid, ldLookup, ldComboBox])]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;
    [TColumn('ID_EMPRESA', 'Id Empresa', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdEmpresa: Integer  read FID_EMPRESA write FID_EMPRESA;
    [TColumn('DATA_INICIO', 'Data Inicio', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property DataInicio: TDateTime  read FDATA_INICIO write FDATA_INICIO;
    [TColumn('DATA_FIM', 'Data Fim', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property DataFim: TDateTime  read FDATA_FIM write FDATA_FIM;
    [TColumn('DIAS_GOZO', 'Dias Gozo', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property DiasGozo: Integer  read FDIAS_GOZO write FDIAS_GOZO;
    [TColumn('ABONO_PECUNIARIO_INICIO', 'Abono Pecuniario Inicio', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property AbonoPecuniarioInicio: TDateTime  read FABONO_PECUNIARIO_INICIO write FABONO_PECUNIARIO_INICIO;
    [TColumn('ABONO_PECUNIARIO_FIM', 'Abono Pecuniario Fim', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property AbonoPecuniarioFim: TDateTime  read FABONO_PECUNIARIO_FIM write FABONO_PECUNIARIO_FIM;
    [TColumn('DIAS_ABONO', 'Dias Abono', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property DiasAbono: Integer  read FDIAS_ABONO write FDIAS_ABONO;
    [TColumn('DATA_PAGAMENTO', 'Data Pagamento', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property DataPagamento: TDateTime  read FDATA_PAGAMENTO write FDATA_PAGAMENTO;


    //Transientes



  end;

implementation


initialization
  Classes.RegisterClass(TFolhaFeriasColetivasVO);

finalization
  Classes.UnRegisterClass(TFolhaFeriasColetivasVO);

end.
