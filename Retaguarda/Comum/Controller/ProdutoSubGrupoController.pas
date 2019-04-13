{*******************************************************************************
Title: T2Ti ERP                                                                 
Description: Controller do lado Cliente relacionado à tabela [PRODUTO_SUB_GRUPO] 
                                                                                
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
unit ProdutoSubGrupoController;

interface

uses
  Classes, Dialogs, SysUtils, DBClient, DB,  Windows, Forms, Controller, Rtti,
  Atributos, VO, Generics.Collections, ProdutoSubGrupoVO;

type
  TProdutoSubGrupoController = class(TController)
  private
    class var FDataSet: TClientDataSet;
  public
    class procedure Consulta(pFiltro: String; pPagina: String; pConsultaCompleta: Boolean = False);
    class function ConsultaLista(pFiltro: String): TObjectList<TProdutoSubGrupoVO>;
    class function ConsultaObjeto(pFiltro: String): TProdutoSubGrupoVO;

    class procedure Insere(pObjeto: TProdutoSubGrupoVO);
    class function Altera(pObjeto: TProdutoSubGrupoVO): Boolean;

    class function Exclui(pId: Integer): Boolean;

    class function GetDataSet: TClientDataSet; override;
    class procedure SetDataSet(pDataSet: TClientDataSet); override;
    class procedure TratarListaRetorno(pListaObjetos: TObjectList<TVO>);
  end;

implementation

uses UDataModule, T2TiORM;

class procedure TProdutoSubGrupoController.Consulta(pFiltro: String; pPagina: String; pConsultaCompleta: Boolean);
var
  Retorno: TObjectList<TProdutoSubGrupoVO>;
begin
  try
    Retorno := TT2TiORM.Consultar<TProdutoSubGrupoVO>(pFiltro, pPagina, pConsultaCompleta);
    TratarRetorno<TProdutoSubGrupoVO>(Retorno);
  finally
  end;
end;

class function TProdutoSubGrupoController.ConsultaLista(pFiltro: String): TObjectList<TProdutoSubGrupoVO>;
begin
  try
    Result := TT2TiORM.Consultar<TProdutoSubGrupoVO>(pFiltro, '-1', True);
  finally
  end;
end;

class function TProdutoSubGrupoController.ConsultaObjeto(pFiltro: String): TProdutoSubGrupoVO;
begin
  try
    Result := TT2TiORM.ConsultarUmObjeto<TProdutoSubGrupoVO>(pFiltro, True);
  finally
  end;
end;

class procedure TProdutoSubGrupoController.Insere(pObjeto: TProdutoSubGrupoVO);
var
  UltimoID: Integer;
begin
  try
    UltimoID := TT2TiORM.Inserir(pObjeto);
    Consulta('ID = ' + IntToStr(UltimoID), '0');
  finally
  end;
end;

class function TProdutoSubGrupoController.Altera(pObjeto: TProdutoSubGrupoVO): Boolean;
begin
  try
    Result := TT2TiORM.Alterar(pObjeto);
  finally
  end;
end;

class function TProdutoSubGrupoController.Exclui(pId: Integer): Boolean;
var
  ObjetoLocal: TProdutoSubGrupoVO;
begin
  try
    ObjetoLocal := TProdutoSubGrupoVO.Create;
    ObjetoLocal.Id := pId;
    Result := TT2TiORM.Excluir(ObjetoLocal);
    TratarRetorno(Result);
  finally
    FreeAndNil(ObjetoLocal)
  end;
end;

class function TProdutoSubGrupoController.GetDataSet: TClientDataSet;
begin
  Result := FDataSet;
end;

class procedure TProdutoSubGrupoController.SetDataSet(pDataSet: TClientDataSet);
begin
  FDataSet := pDataSet;
end;

class procedure TProdutoSubGrupoController.TratarListaRetorno(pListaObjetos: TObjectList<TVO>);
begin
  try
    TratarRetorno<TProdutoSubGrupoVO>(TObjectList<TProdutoSubGrupoVO>(pListaObjetos));
  finally
    FreeAndNil(pListaObjetos);
  end;
end;

initialization
  Classes.RegisterClass(TProdutoSubGrupoController);

finalization
  Classes.UnRegisterClass(TProdutoSubGrupoController);

end.
