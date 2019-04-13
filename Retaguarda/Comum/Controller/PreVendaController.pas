{ *******************************************************************************
Title: T2Ti ERP
Description: Controller relacionado às tabelas [PRE_VENDA_CABECALHO e PRE_VENDA_DETALHE]

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

@author Albert Eije (t2ti.com@gmail.com)
@version 2.0
******************************************************************************* }
unit PreVendaController;

interface

uses
  Classes, Dialogs, SysUtils, DBClient, DB,  Windows, Forms, Controller, Rtti, Atributos,
  VO, PreVendaCabecalhoVO, PreVendaDetalheVO, Generics.Collections, Biblioteca;

type
  TPreVendaController = class(TController)
  private
    class var FDataSet: TClientDataSet;
  public
    class procedure Consulta(pFiltro: String; pPagina: String; pConsultaCompleta: Boolean = False);
    class function ConsultaLista(pFiltro: String): TObjectList<TPreVendaCabecalhoVO>;
    class function ConsultaObjeto(pFiltro: String): TPreVendaCabecalhoVO;

    class procedure Insere(pObjeto: TPreVendaCabecalhoVO);
    class function Altera(pObjeto: TPreVendaCabecalhoVO): Boolean;

    class function Exclui(pId: Integer): Boolean;

    class function GetDataSet: TClientDataSet; override;
    class procedure SetDataSet(pDataSet: TClientDataSet); override;
    class procedure TratarListaRetorno(pListaObjetos: TObjectList<TVO>);
  end;

implementation

uses T2TiORM;

class procedure TPreVendaController.Consulta(pFiltro: String; pPagina: String; pConsultaCompleta: Boolean);
var
  Retorno: TObjectList<TPreVendaCabecalhoVO>;
begin
  try
    Retorno := TT2TiORM.Consultar<TPreVendaCabecalhoVO>(pFiltro, pPagina, pConsultaCompleta);
    TratarRetorno<TPreVendaCabecalhoVO>(Retorno);
  finally
  end;
end;

class function TPreVendaController.ConsultaLista(pFiltro: String): TObjectList<TPreVendaCabecalhoVO>;
begin
  try
    Result := TT2TiORM.Consultar<TPreVendaCabecalhoVO>(pFiltro, '-1', True);
  finally
  end;
end;

class function TPreVendaController.ConsultaObjeto(pFiltro: String): TPreVendaCabecalhoVO;
begin
  try
    Result := TT2TiORM.ConsultarUmObjeto<TPreVendaCabecalhoVO>(pFiltro, True);
  finally
  end;
end;

class procedure TPreVendaController.Insere(pObjeto: TPreVendaCabecalhoVO);
var
  PreVendaDetalheEnumerator: TEnumerator<TPreVendaDetalheVO>;
  UltimoID: Integer;
begin
  try
    UltimoID := TT2TiORM.Inserir(pObjeto);

    // Detalhes
    try
      PreVendaDetalheEnumerator := pObjeto.ListaPreVendaDetalheVO.GetEnumerator;
      with PreVendaDetalheEnumerator do
      begin
        while MoveNext do
        begin
          Current.IdPreVendaCabecalho := UltimoID;
          TT2TiORM.Inserir(Current);
        end;
      end;
    finally
      FreeAndNil(PreVendaDetalheEnumerator);
    end;

    Consulta('ID = ' + IntToStr(UltimoID), '0');
  finally
  end;
end;

class function TPreVendaController.Altera(pObjeto: TPreVendaCabecalhoVO): Boolean;
var
  PreVendaDetalheEnumerator: TEnumerator<TPreVendaDetalheVO>;
begin
  try
    Result := TT2TiORM.Alterar(pObjeto);

    // Detalhes
    try
      PreVendaDetalheEnumerator := pObjeto.ListaPreVendaDetalheVO.GetEnumerator;
      with PreVendaDetalheEnumerator do
      begin
        while MoveNext do
        begin
          if Current.Id > 0 then
            Result := TT2TiORM.Alterar(Current)
          else
          begin
            Current.IdPreVendaCabecalho := pObjeto.Id;
            Result := TT2TiORM.Inserir(Current) > 0;
          end;
        end;
      end;
    finally
      FreeAndNil(PreVendaDetalheEnumerator);
    end;

  finally
  end;
end;

class function TPreVendaController.Exclui(pId: Integer): Boolean;
begin
  try
    raise Exception.Create('Não é permitido excluir uma PreVenda.');
  finally
  end;
end;

class function TPreVendaController.GetDataSet: TClientDataSet;
begin
  Result := FDataSet;
end;

class procedure TPreVendaController.SetDataSet(pDataSet: TClientDataSet);
begin
  FDataSet := pDataSet;
end;

class procedure TPreVendaController.TratarListaRetorno(pListaObjetos: TObjectList<TVO>);
begin
  try
    TratarRetorno<TPreVendaCabecalhoVO>(TObjectList<TPreVendaCabecalhoVO>(pListaObjetos));
  finally
    FreeAndNil(pListaObjetos);
  end;
end;

initialization
  Classes.RegisterClass(TPreVendaController);

finalization
  Classes.UnRegisterClass(TPreVendaController);

end.
