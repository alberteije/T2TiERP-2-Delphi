{ *******************************************************************************
Title: T2Ti ERP
Description: Controller do lado Cliente relacionado à tabela [PRODUTO]

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
t2ti.com@gmail.com</p>

@author Albert Eije (t2ti.com@gmail.com)
@version 1.0
******************************************************************************* }
unit ProdutoController;

interface

uses
  Classes, SysUtils, DBClient, DB, Windows, Forms, Controller, Rtti,
  Atributos, VO, ProdutoVO, Generics.Collections, Biblioteca;

type
  TProdutoController = class(TController)
  private
    class var FDataSet: TClientDataSet;
  public
    class procedure Consulta(pFiltro: String; pPagina: String; pConsultaCompleta: Boolean = False);
    class function ConsultaLista(pFiltro: String): TObjectList<TProdutoVO>;
    class function ConsultaObjeto(pFiltro: String): TProdutoVO;
    class function ConsultaPorTipo(pCodigo: String; pTipo: Integer): TProdutoVO;
    class procedure Produto(pFiltro: String);
    class function Altera(pObjeto: TProdutoVO): Boolean;
    class function GetDataSet: TClientDataSet; override;
    class procedure SetDataSet(pDataSet: TClientDataSet); override;
    class procedure TratarListaRetorno(pListaObjetos: TObjectList<TVO>);
  end;

implementation

uses T2TiORM;

class procedure TProdutoController.Consulta(pFiltro: String; pPagina: String; pConsultaCompleta: Boolean);
var
  Retorno: TObjectList<TProdutoVO>;
begin
  try
    Retorno := TT2TiORM.Consultar<TProdutoVO>(pFiltro, pPagina, pConsultaCompleta);
    TratarRetorno<TProdutoVO>(Retorno);
  finally
  end;
end;

class function TProdutoController.ConsultaLista(pFiltro: String): TObjectList<TProdutoVO>;
begin
  try
    Result := TT2TiORM.Consultar<TProdutoVO>(pFiltro, '-1', True);
  finally
  end;
end;

class function TProdutoController.ConsultaObjeto(pFiltro: String): TProdutoVO;
begin
  try
    Result := TT2TiORM.ConsultarUmObjeto<TProdutoVO>(pFiltro, True);
  finally
  end;
end;

class function TProdutoController.ConsultaPorTipo(pCodigo: String; pTipo: Integer): TProdutoVO;
var
  Filtro: String;
begin
  try
    case pTipo of
      1:
        begin // pesquisa pelo codigo da balanca
          Filtro := 'CODIGO_BALANCA = ' + QuotedStr(pCodigo);
        end;
      2:
        begin // pesquisa pelo GTIN
          Filtro := 'GTIN = ' + QuotedStr(pCodigo);
        end;
      3:
        begin // pesquisa pelo CODIGO_INTERNO ou GTIN
          Filtro := 'CODIGO_INTERNO = ' + QuotedStr(pCodigo);
        end;
      4:
        begin // pesquisa pelo Id
          Filtro := 'ID = ' + QuotedStr(pCodigo);
        end;
    end;
    Result := TT2TiORM.ConsultarUmObjeto<TProdutoVO>(Filtro, True);
  finally
  end;
end;

class procedure TProdutoController.Produto(pFiltro: String);
var
  ObjetoLocal: TProdutoVO;
begin
  try
    ObjetoLocal := TT2TiORM.ConsultarUmObjeto<TProdutoVO>(pFiltro, True);
    TratarRetorno<TProdutoVO>(ObjetoLocal);
  finally
  end;
end;

class function TProdutoController.Altera(pObjeto: TProdutoVO): Boolean;
begin
  try
    Result := TT2TiORM.Alterar(pObjeto);
  finally
  end;
end;

class function TProdutoController.GetDataSet: TClientDataSet;
begin
  Result := FDataSet;
end;

class procedure TProdutoController.SetDataSet(pDataSet: TClientDataSet);
begin
  FDataSet := pDataSet;
end;

class procedure TProdutoController.TratarListaRetorno(pListaObjetos: TObjectList<TVO>);
begin
  try
    TratarRetorno<TProdutoVO>(TObjectList<TProdutoVO>(pListaObjetos));
  finally
    FreeAndNil(pListaObjetos);
  end;
end;

initialization
  Classes.RegisterClass(TProdutoController);

finalization
  Classes.UnRegisterClass(TProdutoController);

end.






