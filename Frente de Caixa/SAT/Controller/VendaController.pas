{ *******************************************************************************
Title: T2Ti ERP
Description: Controller relacionado aos procedimentos de venda

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
unit VendaController;

interface

uses
  Classes, SysUtils, NfeCabecalhoVO, NfeDetalheVO, Generics.Collections,
  DB, VO, Controller, DBClient, Biblioteca, NfeFormaPagamentoVO,
  ControleEstoqueController;

type
  TVendaController = class(TController)
  private
    class var FDataSet: TClientDataSet;
  public
    class procedure Consulta(pFiltro: String; pPagina: String; pConsultaCompleta: Boolean = False);
    class function ConsultaLista(pFiltro: String): TObjectList<TNfeCabecalhoVO>;
    class function ConsultaObjeto(pFiltro: String): TNfeCabecalhoVO;
    class procedure VendaCabecalho(pFiltro: String);
    class procedure VendaDetalhe(pFiltro: String);
    class procedure Insere(pObjeto: TNfeCabecalhoVO);
    class procedure InsereItem(pObjeto: TNfeDetalheVO);
    class function Altera(pObjeto: TNfeCabecalhoVO): Boolean;
    class function CancelaVenda(pObjeto: TNfeCabecalhoVO): Boolean;
    class function CancelaItemVenda(pItem: Integer): Boolean;
    class function GetDataSet: TClientDataSet; override;
    class procedure SetDataSet(pDataSet: TClientDataSet); override;
    class procedure TratarListaRetorno(pListaObjetos: TObjectList<TVO>);
  end;

implementation

uses T2TiORM;

class procedure TVendaController.Consulta(pFiltro: String; pPagina: String; pConsultaCompleta: Boolean);
var
  Retorno: TObjectList<TNfeCabecalhoVO>;
begin
  try
    Retorno := TT2TiORM.Consultar<TNfeCabecalhoVO>(pFiltro, pPagina, pConsultaCompleta);
    TratarRetorno<TNfeCabecalhoVO>(Retorno);
  finally
  end;
end;

class function TVendaController.ConsultaLista(pFiltro: String): TObjectList<TNfeCabecalhoVO>;
begin
  try
    Result := TT2TiORM.Consultar<TNfeCabecalhoVO>(pFiltro, '-1', True);
  finally
  end;
end;

class function TVendaController.ConsultaObjeto(pFiltro: String): TNfeCabecalhoVO;
begin
  try
    Result := TT2TiORM.ConsultarUmObjeto<TNfeCabecalhoVO>(pFiltro, True);
  finally
  end;
end;

class procedure TVendaController.VendaCabecalho(pFiltro: String);
var
  ObjetoLocal: TNfeCabecalhoVO;
begin
  try
    ObjetoLocal := TT2TiORM.ConsultarUmObjeto<TNfeCabecalhoVO>(pFiltro, True);
    TratarRetorno<TNfeCabecalhoVO>(ObjetoLocal);
  finally
  end;
end;

class procedure TVendaController.VendaDetalhe(pFiltro: String);
var
  ObjetoLocal: TNfeDetalheVO;
begin
  try
    ObjetoLocal := TT2TiORM.ConsultarUmObjeto<TNfeDetalheVO>(pFiltro, True);
    TratarRetorno<TNfeDetalheVO>(ObjetoLocal);
  finally
  end;
end;

class procedure TVendaController.Insere(pObjeto: TNfeCabecalhoVO);
var
  UltimoID: Integer;
begin
  try
    UltimoID := TT2TiORM.Inserir(pObjeto);

    { Destinatario }
    if pObjeto.NfeDestinatarioVO.CpfCnpj <> '' then
    begin
      pObjeto.NfeDestinatarioVO.IdNfeCabecalho := UltimoID;
      TT2TiORM.Inserir(pObjeto.NfeDestinatarioVO);
    end;

    VendaCabecalho('ID = ' + IntToStr(UltimoID));
  finally
  end;
end;

class procedure TVendaController.InsereItem(pObjeto: TNfeDetalheVO);
var
  UltimoID: Integer;
begin
  try
    UltimoID := TT2TiORM.Inserir(pObjeto);

    TControleEstoqueController.AtualizarEstoque(pObjeto.QuantidadeComercial * -1, pObjeto.IdProduto, Sessao.VendaAtual.IdEmpresa, Sessao.Configuracao.EmpresaVO.TipoControleEstoque);

    { Detalhe - Imposto - ICMS }
    pObjeto.NfeDetalheImpostoIcmsVO.IdNfeDetalhe := UltimoID;
    TT2TiORM.Inserir(pObjeto.NfeDetalheImpostoIcmsVO);

    VendaDetalhe('ID = ' + IntToStr(UltimoID));
  finally
  end;
end;

class function TVendaController.Altera(pObjeto: TNfeCabecalhoVO): Boolean;
begin
  try
    Result := TT2TiORM.Alterar(pObjeto);

    { Destinatario }
    if pObjeto.NfeDestinatarioVO.Id > 0 then
      Result := TT2TiORM.Alterar(pObjeto.NfeDestinatarioVO)
    else
    begin
      pObjeto.NfeDestinatarioVO.IdNfeCabecalho := pObjeto.Id;
      Result := TT2TiORM.Inserir(pObjeto.NfeDestinatarioVO) > 0;
    end;

  finally
  end;
end;

class function TVendaController.CancelaVenda(pObjeto: TNfeCabecalhoVO): Boolean;
var
  DetalheEnumerator: TEnumerator<TNfeDetalheVO>;
  PagamentoEnumerator: TEnumerator<TNfeFormaPagamentoVO>;
begin
  try
    Result := TT2TiORM.Alterar(pObjeto);

    // Detalhes
    try
      DetalheEnumerator := pObjeto.ListaNfeDetalheVO.GetEnumerator;
      with DetalheEnumerator do
      begin
        while MoveNext do
        begin
          Result := TT2TiORM.Alterar(Current)
        end;
      end;
    finally
      FreeAndNil(DetalheEnumerator);
    end;

    // Detalhes
    try
      PagamentoEnumerator := pObjeto.ListaNfeFormaPagamentoVO.GetEnumerator;
      with PagamentoEnumerator do
      begin
        while MoveNext do
        begin
          Current.Estorno := 'S';
          Result := TT2TiORM.Alterar(Current)
        end;
      end;
    finally
      FreeAndNil(PagamentoEnumerator);
    end;

  finally
  end;
end;

class function TVendaController.CancelaItemVenda(pItem: Integer): Boolean;
var
  NfeDetalhe: TNfeDetalheVO;
begin
  try
    NfeDetalhe := TT2TiORM.ConsultarUmObjeto<TNfeDetalheVO>('NUMERO_ITEM=' + IntToStr(pitem) + ' AND ID_NFE_CABECALHO=' + IntToStr(Sessao.VendaAtual.Id), True);

    Result := TT2TiORM.ComandoSQL('DELETE FROM NFE_DETALHE_IMPOSTO_COFINS where ID_NFE_DETALHE = ' + IntToStr(NfeDetalhe.Id));
    Result := TT2TiORM.ComandoSQL('DELETE FROM NFE_DETALHE_IMPOSTO_PIS where ID_NFE_DETALHE = ' + IntToStr(NfeDetalhe.Id));
    Result := TT2TiORM.ComandoSQL('DELETE FROM NFE_DETALHE_IMPOSTO_ICMS where ID_NFE_DETALHE = ' + IntToStr(NfeDetalhe.Id));
    Result := TT2TiORM.ComandoSQL('DELETE FROM NFE_DETALHE_IMPOSTO_II where ID_NFE_DETALHE = ' + IntToStr(NfeDetalhe.Id));
    Result := TT2TiORM.ComandoSQL('DELETE FROM NFE_DETALHE_IMPOSTO_IPI where ID_NFE_DETALHE = ' + IntToStr(NfeDetalhe.Id));
    Result := TT2TiORM.ComandoSQL('DELETE FROM NFE_DETALHE_IMPOSTO_ISSQN where ID_NFE_DETALHE = ' + IntToStr(NfeDetalhe.Id));
    Result := TT2TiORM.ComandoSQL('DELETE FROM NFE_DET_ESPECIFICO_COMBUSTIVEL where ID_NFE_DETALHE = ' + IntToStr(NfeDetalhe.Id));
    Result := TT2TiORM.ComandoSQL('DELETE FROM NFE_DET_ESPECIFICO_VEICULO where ID_NFE_DETALHE = ' + IntToStr(NfeDetalhe.Id));
    Result := TT2TiORM.ComandoSQL('DELETE FROM NFE_DET_ESPECIFICO_ARMAMENTO where ID_NFE_DETALHE = ' + IntToStr(NfeDetalhe.Id));
    Result := TT2TiORM.ComandoSQL('DELETE FROM NFE_DET_ESPECIFICO_MEDICAMENTO where ID_NFE_DETALHE = ' + IntToStr(NfeDetalhe.Id));

    // Exercício - atualize o estoque

    Result := TT2TiORM.ComandoSQL('DELETE FROM NFE_DETALHE where ID = ' + IntToStr(NfeDetalhe.Id));
    TratarRetorno(Result);
  finally
  end;
end;

class function TVendaController.GetDataSet: TClientDataSet;
begin
  Result := FDataSet;
end;

class procedure TVendaController.SetDataSet(pDataSet: TClientDataSet);
begin
  FDataSet := pDataSet;
end;

class procedure TVendaController.TratarListaRetorno(pListaObjetos: TObjectList<TVO>);
begin
  try
    TratarRetorno<TNfeCabecalhoVO>(TObjectList<TNfeCabecalhoVO>(pListaObjetos));
  finally
    FreeAndNil(pListaObjetos);
  end;
end;


initialization
  Classes.RegisterClass(TVendaController);

finalization
  Classes.UnRegisterClass(TVendaController);

end.
