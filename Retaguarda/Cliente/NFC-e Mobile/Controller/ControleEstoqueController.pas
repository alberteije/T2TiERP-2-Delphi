{ *******************************************************************************
Title: T2Ti ERP
Description: Unit que controla o estoque (incremento e decremento)

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
t2ti.com@gmail.com</p>

@author Albert Eije (T2Ti.COM)
@version 2.0
******************************************************************************* }
unit ControleEstoqueController;

interface

uses
  Classes, SQLExpr, SysUtils, Generics.Collections, Controller, DBXJSON, DBXCommon,
  IWSystem;

type
  TControleEstoqueController = class(TController)
  protected
  public
    class function AtualizarEstoque(pQuantidade: Extended; pIdProduto: Integer; pIdEmpresa: Integer = 0; pTipoAtualizacaoEstoque: String = ''): Boolean;
  end;

implementation

uses
  T2TiORM;

class function TControleEstoqueController.AtualizarEstoque(pQuantidade: Extended; pIdProduto: Integer; pIdEmpresa: Integer; pTipoAtualizacaoEstoque: String): Boolean;
var
  ComandoSQL: String;
begin
  try
    if (pTipoAtualizacaoEstoque <> '') and (pTipoAtualizacaoEstoque <> 'D') then
    begin
      //atualiza tabela PRODUTO
      ComandoSQL :=
                    'update PRODUTO ' +
                    'set QUANTIDADE_ESTOQUE = ' +
                    'case ' +
                    'when QUANTIDADE_ESTOQUE is null then ' + FloatToStr(pQuantidade) + ' ' +
                    'when QUANTIDADE_ESTOQUE is not null then QUANTIDADE_ESTOQUE + ' + FloatToStr(pQuantidade) + ' ' +
                    'end ' +
                    'where ID= ' + IntToStr(pIdProduto);
    end
    else if pTipoAtualizacaoEstoque = 'D' then
    begin
      //atualiza tabela EMPRESA_PRODUTO
      ComandoSQL :=
                    'update EMPRESA_PRODUTO ' +
                    'set QUANTIDADE_ESTOQUE = ' +
                    'case ' +
                    'when QUANTIDADE_ESTOQUE is null then ' + FloatToStr(pQuantidade) + ' ' +
                    'when QUANTIDADE_ESTOQUE is not null then QUANTIDADE_ESTOQUE + ' + FloatToStr(pQuantidade) + ' ' +
                    'end ' +
                    'where ID_PRODUTO= ' + IntToStr(pIdProduto) + ' and ID_EMPRESA= ' + IntToStr(pIdEmpresa);
    end;

    Result := TT2TiORM.ComandoSQL(ComandoSQL);
  finally
  end;
end;

end.
