{*******************************************************************************
Title: T2Ti ERP                                                                 
Description: Controller do lado Cliente relacionado à tabela [NFE_NUMERO] 
                                                                                
The MIT License                                                                 
                                                                                
Copyright: Copyright (C) 2010 T2Ti.COM                                          
                                                                                
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
@version 1.0                                                                    
*******************************************************************************}
unit NfeNumeroController;

interface

uses
  Classes, Dialogs, SysUtils, DBClient, DB, Windows, Forms, Controller, Rtti, Atributos,
  NfeNumeroVO, Generics.Collections;


type
  TNfeNumeroController = class(TController)
  private
    class var FDataSet: TClientDataSet;
  public
    class procedure Consulta(pFiltro: String; pPagina: String; pConsultaCompleta: Boolean = False); overload;
    class function ConsultaObjeto(pFiltro: String): TNfeNumeroVO;

    class function GetDataSet: TClientDataSet; override;
    class procedure SetDataSet(pDataSet: TClientDataSet); override;
  end;

implementation

uses UDataModule, T2TiORM;

class procedure TNfeNumeroController.Consulta(pFiltro: String; pPagina: String; pConsultaCompleta: Boolean);
var
  Retorno: TObjectList<TNfeNumeroVO>;
begin
  try
    Retorno := TT2TiORM.Consultar<TNfeNumeroVO>(pFiltro, pPagina, pConsultaCompleta);
    TratarRetorno<TNfeNumeroVO>(Retorno);
  finally
  end;
end;

class function TNfeNumeroController.ConsultaObjeto(pFiltro: String): TNfeNumeroVO;
var
  UltimoID: Integer;
begin
  try
    if TT2TiORM.SelectMax('NFE_NUMERO', pFiltro) = -1 then
    begin
      Result := TNfeNumeroVO.Create;
      Result.Serie := '001';
      Result.Numero := 1;
      Result.IdEmpresa := 1;
      UltimoID := TT2TiORM.Inserir(Result);
      Result := TT2TiORM.ConsultarUmObjeto<TNfeNumeroVO>('ID=' + IntToStr(UltimoID), False);
    end
    else
    begin
      TT2TiORM.ComandoSQL('update NFE_NUMERO set NUMERO = NUMERO + 1');
      Result := TT2TiORM.ConsultarUmObjeto<TNfeNumeroVO>('', False);
    end;
  finally
  end;
end;

class function TNfeNumeroController.GetDataSet: TClientDataSet;
begin
  Result := FDataSet;
end;

class procedure TNfeNumeroController.SetDataSet(pDataSet: TClientDataSet);
begin
  FDataSet := pDataSet;
end;

initialization
  Classes.RegisterClass(TNfeNumeroController);

finalization
  Classes.UnRegisterClass(TNfeNumeroController);

end.
