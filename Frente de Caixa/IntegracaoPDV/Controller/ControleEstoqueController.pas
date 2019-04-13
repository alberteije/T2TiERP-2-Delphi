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
  Classes, SQLExpr, SysUtils, Generics.Collections,
  IWSystem;

type
  TControleEstoqueController = class
  protected
  public
    class function AtualizarEstoque(pQuantidade: Extended; pIdProduto: Integer): Boolean;
  end;

implementation

uses
  T2TiORM;

class function TControleEstoqueController.AtualizarEstoque(pQuantidade: Extended; pIdProduto: Integer): Boolean;
var
  ComandoSQL: String;
begin
  try
    //atualiza tabela PRODUTO
    ComandoSQL := 'update PRODUTO set QUANTIDADE_ESTOQUE = QUANTIDADE_ESTOQUE + ' + FloatToStr(pQuantidade) + ' where ID= ' + IntToStr(pIdProduto);
    Result := TT2TiORM.ComandoSQL(ComandoSQL);
  finally
  end;
end;

end.
