{*******************************************************************************
Title: T2Ti ERP                                                                 
Description: Controller do lado Cliente relacionado à tabela [AGENCIA_BANCO] 
                                                                                
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
unit AgenciaBancoController;

interface

uses
  Classes, Dialogs, SysUtils, DBClient, DB,  Windows, Forms, Controller, Rtti,
  Atributos, VO, Generics.Collections, AgenciaBancoVO;

type
  TAgenciaBancoController = class(TController)
  private
    class var FDataSet: TClientDataSet;
  public
    class procedure Consulta(pFiltro: String; pPagina: String; pConsultaCompleta: Boolean = False);
    class function ConsultaLista(pFiltro: String): TObjectList<TAgenciaBancoVO>;
    class function ConsultaObjeto(pFiltro: String): TAgenciaBancoVO;

    class procedure Insere(pObjeto: TAgenciaBancoVO);
    class function Altera(pObjeto: TAgenciaBancoVO): Boolean;

    class function Exclui(pId: Integer): Boolean;

    class function GetDataSet: TClientDataSet; override;
    class procedure SetDataSet(pDataSet: TClientDataSet); override;
    class procedure TratarListaRetorno(pListaObjetos: TObjectList<TVO>);
  end;

implementation

uses UDataModule, T2TiORM;

class procedure TAgenciaBancoController.Consulta(pFiltro: String; pPagina: String; pConsultaCompleta: Boolean);
var
  Retorno: TObjectList<TAgenciaBancoVO>;
begin
  try
    Retorno := TT2TiORM.Consultar<TAgenciaBancoVO>(pFiltro, pPagina, pConsultaCompleta);
    TratarRetorno<TAgenciaBancoVO>(Retorno);
  finally
  end;
end;

class function TAgenciaBancoController.ConsultaLista(pFiltro: String): TObjectList<TAgenciaBancoVO>;
begin
  try
    Result := TT2TiORM.Consultar<TAgenciaBancoVO>(pFiltro, '-1', True);
  finally
  end;
end;

class function TAgenciaBancoController.ConsultaObjeto(pFiltro: String): TAgenciaBancoVO;
begin
  try
    Result := TT2TiORM.ConsultarUmObjeto<TAgenciaBancoVO>(pFiltro, True);
  finally
  end;
end;

class procedure TAgenciaBancoController.Insere(pObjeto: TAgenciaBancoVO);
var
  UltimoID: Integer;
begin
  try
    UltimoID := TT2TiORM.Inserir(pObjeto);
    Consulta('ID = ' + IntToStr(UltimoID), '0');
  finally
  end;
end;

class function TAgenciaBancoController.Altera(pObjeto: TAgenciaBancoVO): Boolean;
begin
  try
    Result := TT2TiORM.Alterar(pObjeto);
  finally
  end;
end;

class function TAgenciaBancoController.Exclui(pId: Integer): Boolean;
var
  ObjetoLocal: TAgenciaBancoVO;
begin
  try
    ObjetoLocal := TAgenciaBancoVO.Create;
    ObjetoLocal.Id := pId;
    Result := TT2TiORM.Excluir(ObjetoLocal);
    TratarRetorno(Result);
  finally
    FreeAndNil(ObjetoLocal)
  end;
end;

class function TAgenciaBancoController.GetDataSet: TClientDataSet;
begin
  Result := FDataSet;
end;

class procedure TAgenciaBancoController.SetDataSet(pDataSet: TClientDataSet);
begin
  FDataSet := pDataSet;
end;

class procedure TAgenciaBancoController.TratarListaRetorno(pListaObjetos: TObjectList<TVO>);
begin
  try
    TratarRetorno<TAgenciaBancoVO>(TObjectList<TAgenciaBancoVO>(pListaObjetos));
  finally
    FreeAndNil(pListaObjetos);
  end;
end;

initialization
  Classes.RegisterClass(TAgenciaBancoController);

finalization
  Classes.UnRegisterClass(TAgenciaBancoController);

end.
