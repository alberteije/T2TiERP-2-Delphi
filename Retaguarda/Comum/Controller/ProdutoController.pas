{ *******************************************************************************
Title: T2Ti ERP
Description: Controller do lado Cliente relacionado à tabela [PRODUTO]

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
t2ti.com@gmail.com</p>

@author Albert Eije (t2ti.com@gmail.com)
@version 2.0
******************************************************************************* }
unit ProdutoController;

interface

uses
  Classes, Dialogs, SysUtils, DBClient, DB,  Windows, Forms, Controller, Rtti,
  Atributos, VO, ProdutoVO, EcfProdutoVO, EcfE3VO, Generics.Collections, Biblioteca,
  FichaTecnicaVO;

type
  TProdutoController = class(TController)
  private
    class var FDataSet: TClientDataSet;
    class function Inserir(pObjeto: TProdutoVO): Integer;

  public
    class procedure Consulta(pFiltro: String; pPagina: String; pConsultaCompleta: Boolean = False);
    class function ConsultaObjeto(pFiltro: String): TProdutoVO;
    class procedure Produto(pFiltro: String);
    class function ConsultaLista(pFiltro: String): TObjectList<TProdutoVO>;
    class procedure Insere(pObjeto: TProdutoVO);
    class procedure InsereObjeto(pObjeto: TProdutoVO);
    class procedure AtualizaEstoquePAF(pEcfE3VO: TEcfE3VO);
    class function Altera(pObjeto: TProdutoVO): Boolean;
    class function Exclui(pId: Integer): Boolean;
    class function ExcluiFichaTecnica(pId: Integer): Boolean;
    class function GetDataSet: TClientDataSet; override;
    class procedure SetDataSet(pDataSet: TClientDataSet); override;
    class procedure TratarListaRetorno(pListaObjetos: TObjectList<TVO>);
  end;

implementation

uses UDataModule, T2TiORM,
     //
     UnidadeProdutoVO, AlmoxarifadoVO, TributIcmsCustomCabVO, TributGrupoTributarioVO,
     ProdutoMarcaVO, ProdutoSubGrupoVO;

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

class function TProdutoController.ConsultaObjeto(pFiltro: String): TProdutoVO;
begin
  try
    Result := TT2TiORM.ConsultarUmObjeto<TProdutoVO>(pFiltro, True);
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

class function TProdutoController.ConsultaLista(pFiltro: String): TObjectList<TProdutoVO>;
begin
  try
    Result := TT2TiORM.Consultar<TProdutoVO>(pFiltro, '-1', False);
  finally
  end;
end;

class procedure TProdutoController.Insere(pObjeto: TProdutoVO);
var
  UltimoID: Integer;
  FichaTecnicaEnumerator: TEnumerator<TFichaTecnicaVO>;
  FichaTecnica: TFichaTecnicaVO;
begin
  try
    UltimoID := Inserir(pObjeto);
  finally
  end;

  FichaTecnicaEnumerator := pObjeto.ListaFichaTecnicaVO.GetEnumerator;
  try
    with FichaTecnicaEnumerator do
    begin
      while MoveNext do
      begin
        FichaTecnica := Current;
        FichaTecnica.IdProduto := UltimoID;
        TT2TiORM.Inserir(FichaTecnica);
      end;
    end;
  finally
    FreeAndNil(FichaTecnicaEnumerator);
  end;
  Consulta('ID = ' + IntToStr(UltimoID), '0');
end;

class procedure TProdutoController.InsereObjeto(pObjeto: TProdutoVO);
var
  UltimoID: Integer;
begin
  try
    UltimoID := Inserir(pObjeto);
    TratarRetorno<TProdutoVO>(ConsultaObjeto('ID=' + IntToStr(UltimoID)));
  finally
  end;
end;

class function TProdutoController.Inserir(pObjeto: TProdutoVO): Integer;
begin
  try
    Result := TT2TiORM.Inserir(pObjeto);
  finally
  end;
end;

class procedure TProdutoController.AtualizaEstoquePAF(pEcfE3VO: TEcfE3VO);
var
  Filtro: String;
  UltimoID: Integer;
  Retorno: TEcfE3VO;
begin
  try
    Filtro := 'DATA_ESTOQUE = ' + QuotedStr(DataParaTexto(pEcfE3VO.DataEstoque));
    Retorno := TT2TiORM.ConsultarUmObjeto<TEcfE3VO>(Filtro, False);
    // Se o objeto existir, já houve uma atualização do estoque nesse dia por algum terminal de caixa
    // Devolve o registro para atualização local
    if Assigned(Retorno) then
    begin
      TratarRetorno<TEcfE3VO>(Retorno);
    end

    // Se não, adiciona o objeto e retorna
    else
    begin
      UltimoID := TT2TiORM.Inserir(pEcfE3VO);
      Filtro := 'ID = ' + IntToStr(UltimoID);
      Retorno := TT2TiORM.ConsultarUmObjeto<TEcfE3VO>(Filtro, False);
      TratarRetorno<TEcfE3VO>(Retorno);
    end;
  finally
  end;
end;

class function TProdutoController.Altera(pObjeto: TProdutoVO): Boolean;
var
  FichaTecnicaEnumerator: TEnumerator<TFichaTecnicaVO>;
  FichaTecnica: TFichaTecnicaVO;
begin
  Result := TT2TiORM.Alterar(pObjeto);

  FichaTecnicaEnumerator := pObjeto.ListaFichaTecnicaVO.GetEnumerator;
  try
    with FichaTecnicaEnumerator do
    begin
      while MoveNext do
      begin
        if Current.Id > 0 then
          Result := TT2TiORM.Alterar(Current)
        else
        begin
          Current.IdProduto := pObjeto.Id;
          Result := TT2TiORM.Inserir(Current) > 0;
        end;
      end;
    end;
  finally
    FreeAndNil(FichaTecnicaEnumerator);
  end;
end;

class function TProdutoController.Exclui(pId: Integer): Boolean;
var
  ObjetoLocal: TProdutoVO;
begin
  try
    ObjetoLocal := TProdutoVO.Create;
    ObjetoLocal.Id := pId;
    Result := TT2TiORM.Excluir(ObjetoLocal);
    TratarRetorno(Result);
  finally
    FreeAndNil(ObjetoLocal)
  end;
end;

class function TProdutoController.ExcluiFichaTecnica(pId: Integer): Boolean;
var
  ObjetoLocal: TFichaTecnicaVO;
begin
  try
    ObjetoLocal := TFichaTecnicaVO.Create;
    ObjetoLocal.Id := pId;
    Result := TT2TiORM.Excluir(ObjetoLocal);
    TratarRetorno(Result);
  finally
    FreeAndNil(ObjetoLocal)
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
