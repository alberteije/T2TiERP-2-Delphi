{*******************************************************************************
Title: T2Ti ERP                                                                 
Description: Controller do lado Cliente relacionado à tabela [FOLHA_VALE_TRANSPORTE] 
                                                                                
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
unit FolhaValeTransporteController;

interface

uses
  Classes, Dialogs, SysUtils, DBClient, DB,  Windows, Forms, Controller, Rtti,
  Atributos, VO, Generics.Collections, FolhaValeTransporteVO;

type
  TFolhaValeTransporteController = class(TController)
  private
    class var FDataSet: TClientDataSet;
  public
    class procedure Consulta(pFiltro: String; pPagina: String; pConsultaCompleta: Boolean = False);
    class function ConsultaLista(pFiltro: String): TObjectList<TFolhaValeTransporteVO>;
    class function ConsultaObjeto(pFiltro: String): TFolhaValeTransporteVO;

    class procedure Insere(pObjeto: TFolhaValeTransporteVO);
    class function Altera(pObjeto: TFolhaValeTransporteVO): Boolean;

    class function Exclui(pId: Integer): Boolean;

    class function GetDataSet: TClientDataSet; override;
    class procedure SetDataSet(pDataSet: TClientDataSet); override;
    class procedure TratarListaRetorno(pListaObjetos: TObjectList<TVO>);
  end;

implementation

uses UDataModule, T2TiORM;

class procedure TFolhaValeTransporteController.Consulta(pFiltro: String; pPagina: String; pConsultaCompleta: Boolean);
var
  Retorno: TObjectList<TFolhaValeTransporteVO>;
begin
  try
    Retorno := TT2TiORM.Consultar<TFolhaValeTransporteVO>(pFiltro, pPagina, pConsultaCompleta);
    TratarRetorno<TFolhaValeTransporteVO>(Retorno);
  finally
  end;
end;

class function TFolhaValeTransporteController.ConsultaLista(pFiltro: String): TObjectList<TFolhaValeTransporteVO>;
begin
  try
    Result := TT2TiORM.Consultar<TFolhaValeTransporteVO>(pFiltro, '-1', True);
  finally
  end;
end;

class function TFolhaValeTransporteController.ConsultaObjeto(pFiltro: String): TFolhaValeTransporteVO;
begin
  try
    Result := TT2TiORM.ConsultarUmObjeto<TFolhaValeTransporteVO>(pFiltro, True);
  finally
  end;
end;

class procedure TFolhaValeTransporteController.Insere(pObjeto: TFolhaValeTransporteVO);
var
  UltimoID: Integer;
begin
  try
    UltimoID := TT2TiORM.Inserir(pObjeto);
    Consulta('ID = ' + IntToStr(UltimoID), '0');
  finally
  end;
end;

class function TFolhaValeTransporteController.Altera(pObjeto: TFolhaValeTransporteVO): Boolean;
begin
  try
    Result := TT2TiORM.Alterar(pObjeto);
  finally
  end;
end;

class function TFolhaValeTransporteController.Exclui(pId: Integer): Boolean;
var
  ObjetoLocal: TFolhaValeTransporteVO;
begin
  try
    ObjetoLocal := TFolhaValeTransporteVO.Create;
    ObjetoLocal.Id := pId;
    Result := TT2TiORM.Excluir(ObjetoLocal);
    TratarRetorno(Result);
  finally
    FreeAndNil(ObjetoLocal)
  end;
end;

class function TFolhaValeTransporteController.GetDataSet: TClientDataSet;
begin
  Result := FDataSet;
end;

class procedure TFolhaValeTransporteController.SetDataSet(pDataSet: TClientDataSet);
begin
  FDataSet := pDataSet;
end;

class procedure TFolhaValeTransporteController.TratarListaRetorno(pListaObjetos: TObjectList<TVO>);
begin
  try
    TratarRetorno<TFolhaValeTransporteVO>(TObjectList<TFolhaValeTransporteVO>(pListaObjetos));
  finally
    FreeAndNil(pListaObjetos);
  end;
end;

initialization
  Classes.RegisterClass(TFolhaValeTransporteController);

finalization
  Classes.UnRegisterClass(TFolhaValeTransporteController);

end.
