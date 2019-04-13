{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [DAV_DETALHE_ALTERACAO] 
                                                                                
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
unit DavDetalheAlteracaoVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils;

type
  [TEntity]
  [TTable('DAV_DETALHE_ALTERACAO')]
  TDavDetalheAlteracaoVO = class(TVO)
  private
    FID: Integer;
    FID_DAV_DETALHE: Integer;
    FDATA_ALTERACAO: TDateTime;
    FHORA_ALTERACAO: String;
    FTIPO_ALTERACAO: String;
    FOBJETO: String;

  public 
    [TId('ID')]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;
    [TColumn('ID_DAV_DETALHE', 'Id Dav Detalhe', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdDavDetalhe: Integer  read FID_DAV_DETALHE write FID_DAV_DETALHE;
    [TColumn('DATA_ALTERACAO', 'Data Alteracao', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property DataAlteracao: TDateTime  read FDATA_ALTERACAO write FDATA_ALTERACAO;
    [TColumn('HORA_ALTERACAO', 'Hora Alteracao', 64, [ldGrid, ldLookup, ldCombobox], False)]
    property HoraAlteracao: String  read FHORA_ALTERACAO write FHORA_ALTERACAO;
    [TColumn('TIPO_ALTERACAO', 'Tipo Alteracao', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property TipoAlteracao: String  read FTIPO_ALTERACAO write FTIPO_ALTERACAO;
    [TColumn('OBJETO', 'Objeto', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property Objeto: String  read FOBJETO write FOBJETO;

  end;

implementation


initialization
  Classes.RegisterClass(TDavDetalheAlteracaoVO);

finalization
  Classes.UnRegisterClass(TDavDetalheAlteracaoVO);

end.
