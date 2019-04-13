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
@version 2.0
******************************************************************************* }
unit VendaController;

interface

uses
  Classes, SysUtils, EcfVendaCabecalhoVO, EcfVendaDetalheVO, Generics.Collections,
  DB, VO, Controller, DBClient, Biblioteca, EcfTotalTipoPagamentoVO;

type
  TVendaController = class(TController)
  private
    class var FDataSet: TClientDataSet;
  public
    class procedure Consulta(pFiltro: String; pPagina: String; pConsultaCompleta: Boolean = False);
    class function ConsultaLista(pFiltro: String): TObjectList<TEcfVendaCabecalhoVO>;
    class function ConsultaObjeto(pFiltro: String): TEcfVendaCabecalhoVO;
    class procedure VendaCabecalho(pFiltro: String);
    class procedure VendaDetalhe(pFiltro: String);
    class procedure ExisteVendaAberta;
    class procedure Insere(pObjeto: TEcfVendaCabecalhoVO);
    class procedure InsereItem(pObjeto: TEcfVendaDetalheVO);
    class function Altera(pObjeto: TEcfVendaCabecalhoVO): Boolean;
    class function CancelaVenda(pObjeto: TEcfVendaCabecalhoVO): Boolean;
    class function CancelaItemVenda(pObjeto: TEcfVendaDetalheVO): Boolean;
    class function GetDataSet: TClientDataSet; override;
    class procedure SetDataSet(pDataSet: TClientDataSet); override;
    class procedure TratarListaRetorno(pListaObjetos: TObjectList<TVO>);
  end;

implementation

uses T2TiORM;

class procedure TVendaController.Consulta(pFiltro: String; pPagina: String; pConsultaCompleta: Boolean);
var
  Retorno: TObjectList<TEcfVendaCabecalhoVO>;
begin
  try
    Retorno := TT2TiORM.Consultar<TEcfVendaCabecalhoVO>(pFiltro, pPagina, pConsultaCompleta);
    TratarRetorno<TEcfVendaCabecalhoVO>(Retorno);
  finally
  end;
end;

class function TVendaController.ConsultaLista(pFiltro: String): TObjectList<TEcfVendaCabecalhoVO>;
begin
  try
    Result := TT2TiORM.Consultar<TEcfVendaCabecalhoVO>(pFiltro, '-1', True);
  finally
  end;
end;

class function TVendaController.ConsultaObjeto(pFiltro: String): TEcfVendaCabecalhoVO;
begin
  try
    Result := TT2TiORM.ConsultarUmObjeto<TEcfVendaCabecalhoVO>(pFiltro, True);
  finally
  end;
end;

class procedure TVendaController.VendaCabecalho(pFiltro: String);
var
  ObjetoLocal: TEcfVendaCabecalhoVO;
begin
  try
    ObjetoLocal := TT2TiORM.ConsultarUmObjeto<TEcfVendaCabecalhoVO>(pFiltro, True);
    TratarRetorno<TEcfVendaCabecalhoVO>(ObjetoLocal);
  finally
  end;
end;

class procedure TVendaController.VendaDetalhe(pFiltro: String);
var
  ObjetoLocal: TEcfVendaDetalheVO;
begin
  try
    ObjetoLocal := TT2TiORM.ConsultarUmObjeto<TEcfVendaDetalheVO>(pFiltro, True);
    TratarRetorno<TEcfVendaDetalheVO>(ObjetoLocal);
  finally
  end;
end;

class procedure TVendaController.ExisteVendaAberta;
var
  Filtro: String;
  Retorno: TObjectList<TEcfVendaCabecalhoVO>;
begin
  try
    Filtro := 'STATUS_VENDA = ' + QuotedStr('A');
    Retorno := TT2TiORM.Consultar<TEcfVendaCabecalhoVO>(Filtro, '0', False);
    TratarRetorno(Retorno.Count > 0);
  finally
    FreeAndNil(Retorno);
  end;
end;

class procedure TVendaController.Insere(pObjeto: TEcfVendaCabecalhoVO);
var
  UltimoID: Integer;
begin
  try
    pObjeto.SerieEcf := Sessao.Configuracao.EcfImpressoraVO.Serie;
    UltimoID := TT2TiORM.Inserir(pObjeto);
    VendaCabecalho('ID = ' + IntToStr(UltimoID));
  finally
  end;
end;

class procedure TVendaController.InsereItem(pObjeto: TEcfVendaDetalheVO);
var
  UltimoID: Integer;
begin
  try
    if pObjeto.EcfProdutoVO.EcfIcmsSt = 'NN' then
      pObjeto.EcfIcmsSt := 'N'
    else if pObjeto.EcfProdutoVO.EcfIcmsSt = 'FF' then
      pObjeto.EcfIcmsSt := 'F'
    else if pObjeto.EcfProdutoVO.EcfIcmsSt = 'II' then
      pObjeto.EcfIcmsSt := 'I'
    else
    begin
      if copy(pObjeto.TotalizadorParcial, 3, 1) = 'S' then
        pObjeto.EcfIcmsSt := copy(pObjeto.TotalizadorParcial, 4, 4)
      else if copy(pObjeto.TotalizadorParcial, 3, 1) = 'T' then
        pObjeto.EcfIcmsSt := copy(pObjeto.TotalizadorParcial, 4, 4)
      else if pObjeto.TotalizadorParcial = 'Can-T' then
        pObjeto.EcfIcmsSt := 'CANC'
      else
      begin
        pObjeto.EcfIcmsSt := '1700';
      end;
    end;

    pObjeto.Cancelado := 'N';

    if (pObjeto.EcfProdutoVO.EcfIcmsSt = 'II') or (pObjeto.EcfProdutoVO.EcfIcmsSt = 'NN') then
      pObjeto.TaxaICMS := 0;

    pObjeto.SerieEcf := Sessao.Configuracao.EcfImpressoraVO.Serie;

    FormatSettings.DecimalSeparator := '.';
    pObjeto.HashRegistro := '0';
    pObjeto.HashRegistro := MD5String(pObjeto.ToJSONString);
    UltimoID := TT2TiORM.Inserir(pObjeto);

    VendaDetalhe('ID = ' + IntToStr(UltimoID));
  finally
    FormatSettings.DecimalSeparator := ',';
  end;
end;

class function TVendaController.Altera(pObjeto: TEcfVendaCabecalhoVO): Boolean;
begin
  try
    FormatSettings.DecimalSeparator := '.';
    pObjeto.HashRegistro := '0';
    pObjeto.HashRegistro := MD5String(pObjeto.ToJSONString);
    Result := TT2TiORM.Alterar(pObjeto);
    TController.ExecutarMetodo('LogssController.TLogssController', 'AtualizarQuantidades', [], 'POST', 'Boolean');
  finally
    FormatSettings.DecimalSeparator := ',';
  end;
end;

class function TVendaController.CancelaVenda(pObjeto: TEcfVendaCabecalhoVO): Boolean;
var
  DetalheEnumerator: TEnumerator<TEcfVendaDetalheVO>;
  PagamentoEnumerator: TEnumerator<TEcfTotalTipoPagamentoVO>;
begin
  try
    FormatSettings.DecimalSeparator := '.';
    pObjeto.HashRegistro := '0';
    pObjeto.HashRegistro := MD5String(pObjeto.ToJSONString);
    Result := TT2TiORM.Alterar(pObjeto);

    // Detalhes
    try
      DetalheEnumerator := pObjeto.ListaEcfVendaDetalheVO.GetEnumerator;
      with DetalheEnumerator do
      begin
        while MoveNext do
        begin
          Current.TotalizadorParcial := 'Can-T';
          Current.Cancelado := 'S';
          Current.Ccf := pObjeto.Ccf;
          Current.Coo := pObjeto.Coo;
          Current.HashRegistro := '0';
          Current.HashRegistro := MD5String(Current.ToJSONString);
          Result := TT2TiORM.Alterar(Current)
        end;
      end;
    finally
      FreeAndNil(DetalheEnumerator);
    end;

    // Detalhes
    try
      PagamentoEnumerator := pObjeto.ListaEcfTotalTipoPagamentoVO.GetEnumerator;
      with PagamentoEnumerator do
      begin
        while MoveNext do
        begin
          Current.Estorno := 'S';
          Current.HashRegistro := '0';
          Current.HashRegistro := MD5String(Current.ToJSONString);
          Result := TT2TiORM.Alterar(Current)
        end;
      end;
    finally
      FreeAndNil(PagamentoEnumerator);
    end;

  finally
    FormatSettings.DecimalSeparator := ',';
  end;
end;

class function TVendaController.CancelaItemVenda(pObjeto: TEcfVendaDetalheVO): Boolean;
begin
  try
    FormatSettings.DecimalSeparator := '.';
    pObjeto.HashRegistro := '0';
    pObjeto.HashRegistro := MD5String(pObjeto.ToJSONString);

    Result := TT2TiORM.Alterar(pObjeto);
  finally
    FormatSettings.DecimalSeparator := ',';
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
    TratarRetorno<TEcfVendaCabecalhoVO>(TObjectList<TEcfVendaCabecalhoVO>(pListaObjetos));
  finally
    FreeAndNil(pListaObjetos);
  end;
end;


initialization
  Classes.RegisterClass(TVendaController);

finalization
  Classes.UnRegisterClass(TVendaController);

end.
