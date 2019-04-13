{*******************************************************************************
Title: T2Ti ERP                                                                 
Description: Controller do lado Cliente relacionado à tabela [CODIGO_GPS] 
                                                                                
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
unit CodigoGpsController;

interface

uses
  Classes, Dialogs, SysUtils, DBClient, DB,  Windows, Forms, Controller, Rtti,
  Atributos, VO, Generics.Collections, CodigoGpsVO;

type
  TCodigoGpsController = class(TController)
  private
    class var FDataSet: TClientDataSet;
  public
    class procedure Consulta(pFiltro: String; pPagina: String; pConsultaCompleta: Boolean = False);
    class function ConsultaLista(pFiltro: String): TObjectList<TCodigoGpsVO>;
    class function ConsultaObjeto(pFiltro: String): TCodigoGpsVO;

    class procedure Insere(pObjeto: TCodigoGpsVO);
    class function Altera(pObjeto: TCodigoGpsVO): Boolean;

    class function Exclui(pId: Integer): Boolean;

    class function GetDataSet: TClientDataSet; override;
    class procedure SetDataSet(pDataSet: TClientDataSet); override;
    class procedure TratarListaRetorno(pListaObjetos: TObjectList<TVO>);
  end;

implementation

uses UDataModule, T2TiORM;

class procedure TCodigoGpsController.Consulta(pFiltro: String; pPagina: String; pConsultaCompleta: Boolean);
var
  Retorno: TObjectList<TCodigoGpsVO>;
begin
  try
    Retorno := TT2TiORM.Consultar<TCodigoGpsVO>(pFiltro, pPagina, pConsultaCompleta);
    TratarRetorno<TCodigoGpsVO>(Retorno);
  finally
  end;
end;

class function TCodigoGpsController.ConsultaLista(pFiltro: String): TObjectList<TCodigoGpsVO>;
begin
  try
    Result := TT2TiORM.Consultar<TCodigoGpsVO>(pFiltro, '-1', True);
  finally
  end;
end;

class function TCodigoGpsController.ConsultaObjeto(pFiltro: String): TCodigoGpsVO;
begin
  try
    Result := TT2TiORM.ConsultarUmObjeto<TCodigoGpsVO>(pFiltro, True);
  finally
  end;
end;

class procedure TCodigoGpsController.Insere(pObjeto: TCodigoGpsVO);
var
  UltimoID: Integer;
begin
  try
    UltimoID := TT2TiORM.Inserir(pObjeto);
    Consulta('ID = ' + IntToStr(UltimoID), '0');
  finally
  end;
end;

class function TCodigoGpsController.Altera(pObjeto: TCodigoGpsVO): Boolean;
begin
  try
    Result := TT2TiORM.Alterar(pObjeto);
  finally
  end;
end;

class function TCodigoGpsController.Exclui(pId: Integer): Boolean;
var
  ObjetoLocal: TCodigoGpsVO;
begin
  try
    ObjetoLocal := TCodigoGpsVO.Create;
    ObjetoLocal.Id := pId;
    Result := TT2TiORM.Excluir(ObjetoLocal);
    TratarRetorno(Result);
  finally
    FreeAndNil(ObjetoLocal)
  end;
end;

class function TCodigoGpsController.GetDataSet: TClientDataSet;
begin
  Result := FDataSet;
end;

class procedure TCodigoGpsController.SetDataSet(pDataSet: TClientDataSet);
begin
  FDataSet := pDataSet;
end;

class procedure TCodigoGpsController.TratarListaRetorno(pListaObjetos: TObjectList<TVO>);
begin
  try
    TratarRetorno<TCodigoGpsVO>(TObjectList<TCodigoGpsVO>(pListaObjetos));
  finally
    FreeAndNil(pListaObjetos);
  end;
end;

initialization
  Classes.RegisterClass(TCodigoGpsController);

finalization
  Classes.UnRegisterClass(TCodigoGpsController);

end.
