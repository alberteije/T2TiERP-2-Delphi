{*******************************************************************************
Title: T2Ti ERP                                                                 
Description: Controller do lado Cliente relacionado à tabela [VIEW_COMPRA_MAPA_COMPARATIVO] 
                                                                                
The MIT License                                                                 
                                                                                
Copyright: Copyright (C) 2015 T2Ti.COM
                                                                                
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
unit ViewCompraMapaComparativoController;

interface

uses
  Classes, Dialogs, SysUtils, DBClient, DB,  Windows, Forms, Controller, Rtti,
  Atributos, VO, Generics.Collections, ViewCompraMapaComparativoVO,
  CompraCotacaoVO, CompraPedidoVO, CompraPedidoDetalheVO, CompraCotacaoPedidoDetalheVO,
  CompraCotacaoDetalheVO;

type
  TViewCompraMapaComparativoController = class(TController)
  private
    class var FDataSet: TClientDataSet;
  public
    class procedure Consulta(pFiltro: String; pPagina: String; pConsultaCompleta: Boolean = False);
    class function ConsultaLista(pFiltro: String): TObjectList<TViewCompraMapaComparativoVO>;
    class function ConsultaObjeto(pFiltro: String): TViewCompraMapaComparativoVO;

    class procedure Insere(pObjeto: TViewCompraMapaComparativoVO);
    class function Altera(pObjeto: TViewCompraMapaComparativoVO): Boolean;

    class function GerarPedidos(pObjeto: TCompraCotacaoVO): Boolean;

    class function GetDataSet: TClientDataSet; override;
    class procedure SetDataSet(pDataSet: TClientDataSet); override;
    class procedure TratarListaRetorno(pListaObjetos: TObjectList<TVO>);
  end;

implementation

uses UDataModule, T2TiORM;

class procedure TViewCompraMapaComparativoController.Consulta(pFiltro: String; pPagina: String; pConsultaCompleta: Boolean);
var
  Retorno: TObjectList<TViewCompraMapaComparativoVO>;
begin
  try
    Retorno := TT2TiORM.Consultar<TViewCompraMapaComparativoVO>(pFiltro, pPagina, pConsultaCompleta);
    TratarRetorno<TViewCompraMapaComparativoVO>(Retorno);
  finally
  end;
end;

class function TViewCompraMapaComparativoController.ConsultaLista(pFiltro: String): TObjectList<TViewCompraMapaComparativoVO>;
begin
  try
    Result := TT2TiORM.Consultar<TViewCompraMapaComparativoVO>(pFiltro, '-1', True);
  finally
  end;
end;

class function TViewCompraMapaComparativoController.ConsultaObjeto(pFiltro: String): TViewCompraMapaComparativoVO;
begin
  try
    Result := TT2TiORM.ConsultarUmObjeto<TViewCompraMapaComparativoVO>(pFiltro, True);
  finally
  end;
end;

class procedure TViewCompraMapaComparativoController.Insere(pObjeto: TViewCompraMapaComparativoVO);
var
  UltimoID: Integer;
begin
  try
    UltimoID := TT2TiORM.Inserir(pObjeto);
    Consulta('ID = ' + IntToStr(UltimoID), '0');
  finally
  end;
end;

class function TViewCompraMapaComparativoController.Altera(pObjeto: TViewCompraMapaComparativoVO): Boolean;
begin
  try
    Result := TT2TiORM.Alterar(pObjeto);
  finally
  end;
end;

class function TViewCompraMapaComparativoController.GerarPedidos(pObjeto: TCompraCotacaoVO): Boolean;
var
  UltimoID: Integer;
  i: Integer;
  FornecedorAtual: Integer;
  //
  objViewCompraMapaComparativo: TViewCompraMapaComparativoVO;
  //
  CompraCotacao: TCompraCotacaoVO;
  CompraPedido: TCompraPedidoVO;
  CompraPedidoDetalhe: TCompraPedidoDetalheVO;
  CompraCotacaoPedidoDetalhe: TCompraCotacaoPedidoDetalheVO;
  CompraCotacaoDetalhe: TCompraCotacaoDetalheVO;
  //
  ListaCompraPedido: TObjectDictionary<Integer, TCompraPedidoVO>;
  CompraPedidoEnumerator: TEnumerator<TPair<Integer, TCompraPedidoVO>>;
  CompraPedidoDetalheEnumerator: TEnumerator<TCompraPedidoDetalheVO>;
  CompraCotacaoPedidoDetalheEnumerator: TEnumerator<TCompraCotacaoPedidoDetalheVO>;
begin

  /// EXERCICIO: OBSERVE SE EXISTE ALGUM VAZAMENTO DE MEMORIA E CORRIJA, SE FOR O CASO

  try
    ListaCompraPedido := TObjectDictionary<Integer, TCompraPedidoVO>.Create;
    for i := 0 to pObjeto.ListaMapaComparativo.Count - 1 do
    begin
      objViewCompraMapaComparativo := pObjeto.ListaMapaComparativo[i];
      // Se não existir o fornecedor atual no dicionário, insere e cria um novo pedido. Se existir, pega o pedido e insere o seu item
      if not ListaCompraPedido.ContainsKey(objViewCompraMapaComparativo.IdFornecedor) then
      begin
        CompraPedido := TCompraPedidoVO.Create;
        CompraPedido.ListaCompraPedidoDetalheVO := TObjectList<TCompraPedidoDetalheVO>.Create;
        CompraPedido.ListaCompraCotacaoPedidoDetalheVO := TObjectList<TCompraCotacaoPedidoDetalheVO>.Create;
        // Pedido vindo de cotação sempre será marcado como Normal
        CompraPedido.IdCompraTipoPedido := 1;
        CompraPedido.IdFornecedor := objViewCompraMapaComparativo.IdFornecedor;
        CompraPedido.DataPedido := Now;

        // Insere o item no pedido
        CompraPedidoDetalhe := TCompraPedidoDetalheVO.Create;
        CompraPedidoDetalhe.IdProduto := objViewCompraMapaComparativo.IdProduto;
        CompraPedidoDetalhe.Quantidade := objViewCompraMapaComparativo.QuantidadePedida;
        CompraPedidoDetalhe.ValorUnitario := objViewCompraMapaComparativo.ValorUnitario;
        CompraPedidoDetalhe.ValorSubtotal := objViewCompraMapaComparativo.ValorSubtotal;
        CompraPedidoDetalhe.TaxaDesconto := objViewCompraMapaComparativo.TaxaDesconto;
        CompraPedidoDetalhe.ValorDesconto := objViewCompraMapaComparativo.ValorDesconto;
        CompraPedidoDetalhe.ValorTotal := objViewCompraMapaComparativo.ValorTotal;
        CompraPedido.ListaCompraPedidoDetalheVO.Add(CompraPedidoDetalhe);

        // Insere o item da cotação que foi utilizado no pedido
        CompraCotacaoPedidoDetalhe := TCompraCotacaoPedidoDetalheVO.Create;
        CompraCotacaoPedidoDetalhe.IdCompraCotacaoDetalhe := objViewCompraMapaComparativo.IdCompraCotacaoDetalhe;
        CompraCotacaoPedidoDetalhe.QuantidadePedida := objViewCompraMapaComparativo.QuantidadePedida;
        CompraPedido.ListaCompraCotacaoPedidoDetalheVO.Add(CompraCotacaoPedidoDetalhe);

        // Insere o pedido no dicionário
        ListaCompraPedido.Add(objViewCompraMapaComparativo.IdFornecedor, CompraPedido);
      end
      else
      begin
        //Insere o item no pedido
        CompraPedidoDetalhe := TCompraPedidoDetalheVO.Create;
        CompraPedidoDetalhe.IdProduto := objViewCompraMapaComparativo.IdProduto;
        CompraPedidoDetalhe.Quantidade := objViewCompraMapaComparativo.QuantidadePedida;
        CompraPedidoDetalhe.ValorUnitario := objViewCompraMapaComparativo.ValorUnitario;
        CompraPedidoDetalhe.ValorSubtotal := objViewCompraMapaComparativo.ValorSubtotal;
        CompraPedidoDetalhe.TaxaDesconto := objViewCompraMapaComparativo.TaxaDesconto;
        CompraPedidoDetalhe.ValorDesconto := objViewCompraMapaComparativo.ValorDesconto;
        CompraPedidoDetalhe.ValorTotal := objViewCompraMapaComparativo.ValorTotal;
        //
        ListaCompraPedido.Items[objViewCompraMapaComparativo.IdFornecedor].ListaCompraPedidoDetalheVO.Add(CompraPedidoDetalhe);

        // Insere o item da cotação que foi utilizado no pedido
        CompraCotacaoPedidoDetalhe := TCompraCotacaoPedidoDetalheVO.Create;
        CompraCotacaoPedidoDetalhe.IdCompraCotacaoDetalhe := objViewCompraMapaComparativo.IdCompraCotacaoDetalhe;
        CompraCotacaoPedidoDetalhe.QuantidadePedida := objViewCompraMapaComparativo.QuantidadePedida;
        CompraPedido.ListaCompraCotacaoPedidoDetalheVO.Add(CompraCotacaoPedidoDetalhe);
      end;

      // Atualiza o detalhe da cotação no banco de dados
      CompraCotacaoDetalhe := TCompraCotacaoDetalheVO.Create;
      CompraCotacaoDetalhe.Id := objViewCompraMapaComparativo.IdCompraCotacaoDetalhe;
      CompraCotacaoDetalhe.QuantidadePedida := objViewCompraMapaComparativo.QuantidadePedida;
      TT2TiORM.Alterar(CompraCotacaoDetalhe);
    end;

    // Insere os pedidos no banco de dados
    CompraPedidoEnumerator := ListaCompraPedido.GetEnumerator;
    try
      with CompraPedidoEnumerator do
      begin
        while MoveNext do
        begin
          CompraPedido := Current.Value;
          UltimoID := TT2TiORM.Inserir(CompraPedido);

          // Insere os itens do pedido no banco de dados
          CompraPedidoDetalheEnumerator := CompraPedido.ListaCompraPedidoDetalheVO.GetEnumerator;
          with CompraPedidoDetalheEnumerator do
          begin
            while MoveNext do
            begin
              CompraPedidoDetalhe := Current;
              CompraPedidoDetalhe.IdCompraPedido := UltimoID;
              TT2TiORM.Inserir(CompraPedidoDetalhe);
            end;
          end;

          // Insere os items em COMPRA_COTACAO_PEDIDO_DETALHE
          CompraCotacaoPedidoDetalheEnumerator := CompraPedido.ListaCompraCotacaoPedidoDetalheVO.GetEnumerator;
          with CompraCotacaoPedidoDetalheEnumerator do
          begin
            while MoveNext do
            begin
              CompraCotacaoPedidoDetalhe := Current;
              CompraCotacaoPedidoDetalhe.IdCompraPedido := UltimoID;
              TT2TiORM.Inserir(CompraCotacaoPedidoDetalhe);
            end;
          end;
        end;
      end;
    finally
      CompraPedidoEnumerator.Free;
      CompraPedidoDetalheEnumerator.Free;
      CompraCotacaoPedidoDetalheEnumerator.Free;
    end;

    // Atualiza o campo SITUACAO da cotação para F - Fechada
    CompraCotacao := TCompraCotacaoVO.Create;
    CompraCotacao.Id := objViewCompraMapaComparativo.IdCompraCotacao;
    CompraCotacao.Situacao := 'F';
    Result := TT2TiORM.Alterar(CompraCotacao);
  finally
  end;
end;

class function TViewCompraMapaComparativoController.GetDataSet: TClientDataSet;
begin
  Result := FDataSet;
end;

class procedure TViewCompraMapaComparativoController.SetDataSet(pDataSet: TClientDataSet);
begin
  FDataSet := pDataSet;
end;

class procedure TViewCompraMapaComparativoController.TratarListaRetorno(pListaObjetos: TObjectList<TVO>);
begin
  try
    TratarRetorno<TViewCompraMapaComparativoVO>(TObjectList<TViewCompraMapaComparativoVO>(pListaObjetos));
  finally
    FreeAndNil(pListaObjetos);
  end;
end;

initialization
  Classes.RegisterClass(TViewCompraMapaComparativoController);

finalization
  Classes.UnRegisterClass(TViewCompraMapaComparativoController);

end.
