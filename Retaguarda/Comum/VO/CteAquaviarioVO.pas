{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [CTE_AQUAVIARIO] 
                                                                                
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
unit CteAquaviarioVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils;

type
  [TEntity]
  [TTable('CTE_AQUAVIARIO')]
  TCteAquaviarioVO = class(TVO)
  private
    FID: Integer;
    FID_CTE_CABECALHO: Integer;
    FVALOR_PRESTACAO: Extended;
    FAFRMM: Extended;
    FNUMERO_BOOKING: String;
    FNUMERO_CONTROLE: String;
    FID_NAVIO: String;

    //Transientes



  public 
    [TId('ID', [ldGrid, ldLookup, ldComboBox])]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;
    [TColumn('ID_CTE_CABECALHO', 'Id Cte Cabecalho', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdCteCabecalho: Integer  read FID_CTE_CABECALHO write FID_CTE_CABECALHO;
    [TColumn('VALOR_PRESTACAO', 'Valor Prestacao', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorPrestacao: Extended  read FVALOR_PRESTACAO write FVALOR_PRESTACAO;
    [TColumn('AFRMM', 'Afrmm', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property Afrmm: Extended  read FAFRMM write FAFRMM;
    [TColumn('NUMERO_BOOKING', 'Numero Booking', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property NumeroBooking: String  read FNUMERO_BOOKING write FNUMERO_BOOKING;
    [TColumn('NUMERO_CONTROLE', 'Numero Controle', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property NumeroControle: String  read FNUMERO_CONTROLE write FNUMERO_CONTROLE;
    [TColumn('ID_NAVIO', 'Id Navio', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property IdNavio: String  read FID_NAVIO write FID_NAVIO;


    //Transientes



  end;

implementation


initialization
  Classes.RegisterClass(TCteAquaviarioVO);

finalization
  Classes.UnRegisterClass(TCteAquaviarioVO);

end.
