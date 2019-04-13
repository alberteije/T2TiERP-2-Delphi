{ *******************************************************************************
Title: T2Ti ERP
Description: Controller relacionado às tabelas [DAV_CABECALHO e DAV_DETALHE]

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
unit DAVController;

interface

uses
  Classes, Dialogs, SysUtils, DBClient, DB,  Windows, Forms, Controller, Rtti, Atributos,
  VO, DavCabecalhoVO, Generics.Collections, Biblioteca;

type
  TDAVController = class(TController)
  private
    class var FDataSet: TClientDataSet;
  public
    class procedure Consulta(pFiltro: String; pPagina: String; pConsultaCompleta: Boolean = False);
    class function ConsultaLista(pFiltro: String): TObjectList<TDavCabecalhoVO>;
    class function ConsultaObjeto(pFiltro: String): TDavCabecalhoVO;

    class procedure Insere(pObjeto: TDavCabecalhoVO);
    class function Altera(pObjeto: TDavCabecalhoVO): Boolean;

    class function Exclui(pId: Integer): Boolean;

    class function GetDataSet: TClientDataSet; override;
    class procedure SetDataSet(pDataSet: TClientDataSet); override;
    class procedure TratarListaRetorno(pListaObjetos: TObjectList<TVO>);
  end;

implementation

uses T2TiORM, DavDetalheVO;

class procedure TDAVController.Consulta(pFiltro: String; pPagina: String; pConsultaCompleta: Boolean);
var
  Retorno: TObjectList<TDavCabecalhoVO>;
begin
  try
    Retorno := TT2TiORM.Consultar<TDavCabecalhoVO>(pFiltro, pPagina, pConsultaCompleta);
    TratarRetorno<TDavCabecalhoVO>(Retorno);
  finally
  end;
end;

class function TDAVController.ConsultaLista(pFiltro: String): TObjectList<TDavCabecalhoVO>;
begin
  try
    Result := TT2TiORM.Consultar<TDavCabecalhoVO>(pFiltro, '-1', True);
  finally
  end;
end;

class function TDAVController.ConsultaObjeto(pFiltro: String): TDavCabecalhoVO;
begin
  try
    Result := TT2TiORM.ConsultarUmObjeto<TDavCabecalhoVO>(pFiltro, True);
  finally
  end;
end;

class procedure TDAVController.Insere(pObjeto: TDavCabecalhoVO);
var
  DavDetalheEnumerator: TEnumerator<TDavDetalheVO>;
  UltimoID: Integer;
begin
  try
    UltimoID := TT2TiORM.Inserir(pObjeto);
    pObjeto.Id := UltimoID;
    pObjeto.NumeroDav := StringOfChar('0',10-Length(UltimoID.ToString)) + UltimoID.ToString;
    pObjeto.HashRegistro := '0';
    pObjeto.HashRegistro := MD5String(pObjeto.ToJSONString);
    TT2TiORM.Alterar(pObjeto);

    // Detalhes
    try
      DavDetalheEnumerator := pObjeto.ListaDavDetalheVO.GetEnumerator;
      with DavDetalheEnumerator do
      begin
        while MoveNext do
        begin
          Current.IdDavCabecalho := pObjeto.Id;
          Current.NumeroDav := pObjeto.NumeroDav;
          Current.HashRegistro := '0';
          Current.HashRegistro := MD5String(Current.ToJSONString);
          TT2TiORM.Inserir(Current);
        end;
      end;
    finally
      FreeAndNil(DavDetalheEnumerator);
    end;

    Consulta('ID = ' + IntToStr(UltimoID), '0');
  finally
  end;
end;

class function TDAVController.Altera(pObjeto: TDavCabecalhoVO): Boolean;
var
  DavDetalheEnumerator: TEnumerator<TDavDetalheVO>;
  UltimoIdDetalhe: Integer;
begin
  try
    pObjeto.HashRegistro := '0';
    pObjeto.HashRegistro := MD5String(pObjeto.ToJSONString);

    Result := TT2TiORM.Alterar(pObjeto);

    // Detalhes
    try
      DavDetalheEnumerator := pObjeto.ListaDavDetalheVO.GetEnumerator;
      with DavDetalheEnumerator do
      begin
        while MoveNext do
        begin
          Current.IdDavCabecalho := pObjeto.Id;
          Current.NumeroDav := pObjeto.NumeroDav;
          Current.HashRegistro := '0';
          Current.HashRegistro := MD5String(Current.ToJSONString);

          if Current.Id > 0 then
          begin
            UltimoIdDetalhe := Current.Id;
            Result := TT2TiORM.Alterar(Current)
          end
          else
            UltimoIdDetalhe := TT2TiORM.Inserir(Current);

        end;
      end;
    finally
      FreeAndNil(DavDetalheEnumerator);
    end;

  finally
  end;
end;

class function TDAVController.Exclui(pId: Integer): Boolean;
begin
  try
    raise Exception.Create('Não é permitido excluir uma DAV.');
  finally
  end;
end;

class function TDAVController.GetDataSet: TClientDataSet;
begin
  Result := FDataSet;
end;

class procedure TDAVController.SetDataSet(pDataSet: TClientDataSet);
begin
  FDataSet := pDataSet;
end;

class procedure TDAVController.TratarListaRetorno(pListaObjetos: TObjectList<TVO>);
begin
  try
    TratarRetorno<TDavCabecalhoVO>(TObjectList<TDavCabecalhoVO>(pListaObjetos));
  finally
    FreeAndNil(pListaObjetos);
  end;
end;

initialization
  Classes.RegisterClass(TDAVController);

finalization
  Classes.UnRegisterClass(TDAVController);

end.
