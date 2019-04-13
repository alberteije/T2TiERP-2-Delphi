{*******************************************************************************
Title: T2Ti ERP                                                                 
Description: Controller do lado Cliente relacionado à tabela [COMPRA_COTACAO] 
                                                                                
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
unit CompraCotacaoController;

interface

uses
  Classes, Dialogs, SysUtils, DBClient, DB,  Windows, Forms, Controller, Rtti,
  Atributos, VO, Generics.Collections, CompraCotacaoVO, CompraFornecedorCotacaoVO,
  CompraCotacaoDetalheVO, CompraReqCotacaoDetalheVO, CompraRequisicaoDetalheVO;

type
  TCompraCotacaoController = class(TController)
  private
    class var FDataSet: TClientDataSet;
  public
    class procedure Consulta(pFiltro: String; pPagina: String; pConsultaCompleta: Boolean = False);
    class function ConsultaLista(pFiltro: String): TObjectList<TCompraCotacaoVO>;
    class function ConsultaObjeto(pFiltro: String): TCompraCotacaoVO;

    class procedure Insere(pObjeto: TCompraCotacaoVO);
    class function Altera(pObjeto: TCompraCotacaoVO): Boolean;

    class function Exclui(pId: Integer): Boolean;

    class function GetDataSet: TClientDataSet; override;
    class procedure SetDataSet(pDataSet: TClientDataSet); override;
    class procedure TratarListaRetorno(pListaObjetos: TObjectList<TVO>);
  end;

implementation

uses UDataModule, T2TiORM;

class procedure TCompraCotacaoController.Consulta(pFiltro: String; pPagina: String; pConsultaCompleta: Boolean);
var
  Retorno: TObjectList<TCompraCotacaoVO>;
begin
  try
    Retorno := TT2TiORM.Consultar<TCompraCotacaoVO>(pFiltro, pPagina, pConsultaCompleta);
    TratarRetorno<TCompraCotacaoVO>(Retorno);
  finally
  end;
end;

class function TCompraCotacaoController.ConsultaLista(pFiltro: String): TObjectList<TCompraCotacaoVO>;
begin
  try
    Result := TT2TiORM.Consultar<TCompraCotacaoVO>(pFiltro, '-1', True);
  finally
  end;
end;

class function TCompraCotacaoController.ConsultaObjeto(pFiltro: String): TCompraCotacaoVO;
begin
  try
    Result := TT2TiORM.ConsultarUmObjeto<TCompraCotacaoVO>(pFiltro, True);
  finally
  end;
end;

class procedure TCompraCotacaoController.Insere(pObjeto: TCompraCotacaoVO);
var
  UltimoID, UltimoIDFornecedorCotacao, UltimoIDCotacaoDetalhe: Integer;
  i, j: Integer;
  CompraFornecedorCotacao: TCompraFornecedorCotacaoVO;
  CompraCotacaoDetalhe: TCompraCotacaoDetalheVO;
  CompraReqCotacaoDetalhe: TCompraReqCotacaoDetalheVO;
  CompraRequisicaoDetalhe: TCompraRequisicaoDetalheVO;
  CompraReqCotacaoDetalheEnumerator: TEnumerator<TCompraReqCotacaoDetalheVO>;
begin
  try
    UltimoID := TT2TiORM.Inserir(pObjeto);

    try
      for i := 0 to pObjeto.ListaCompraFornecedorCotacao.Count - 1 do
      begin
        CompraFornecedorCotacao := pObjeto.ListaCompraFornecedorCotacao[i];
        CompraFornecedorCotacao.IdCompraCotacao := UltimoID;
        UltimoIDFornecedorCotacao := TT2TiORM.Inserir(CompraFornecedorCotacao);

        for j := 0 to CompraFornecedorCotacao.ListaCompraCotacaoDetalhe.Count - 1 do
        begin
          CompraCotacaoDetalhe := CompraFornecedorCotacao.ListaCompraCotacaoDetalhe[j];
          CompraCotacaoDetalhe.IdCompraFornecedorCotacao := UltimoIDFornecedorCotacao;
          UltimoIDCotacaoDetalhe := TT2TiORM.Inserir(CompraCotacaoDetalhe);
        end;
      end;
    finally
    end;

    // Lista de itens da requisição que foram utilizados na cotação
    CompraReqCotacaoDetalheEnumerator := pObjeto.ListaCompraReqCotacaoDetalheVO.GetEnumerator;
    try
      CompraRequisicaoDetalhe := TCompraRequisicaoDetalheVO.Create;
      with CompraReqCotacaoDetalheEnumerator do
      begin
        while MoveNext do
        begin
          //insere os items em COMPRA_REQ_COTACAO_DETALHE
          CompraReqCotacaoDetalhe := Current;
          CompraReqCotacaoDetalhe.IdCompraCotacao := UltimoID;
          TT2TiORM.Inserir(CompraReqCotacaoDetalhe);

          //atualiza a quantidade cotada em COMPRA_REQUISICAO_DETALHE
          CompraRequisicaoDetalhe.Id := CompraReqCotacaoDetalhe.IdCompraRequisicaoDetalhe;
          CompraRequisicaoDetalhe.QuantidadeCotada := CompraReqCotacaoDetalhe.QuantidadeCotada;
          TT2TiORM.Alterar(CompraRequisicaoDetalhe);
        end;
      end;
    finally
      CompraReqCotacaoDetalheEnumerator.Free;
    end;

    Consulta('ID = ' + IntToStr(UltimoID), '0');
  finally
  end;
end;

class function TCompraCotacaoController.Altera(pObjeto: TCompraCotacaoVO): Boolean;
begin
  try
    Result := TT2TiORM.Alterar(pObjeto);
  finally
  end;
end;

class function TCompraCotacaoController.Exclui(pId: Integer): Boolean;
var
  ObjetoLocal: TCompraCotacaoVO;
begin
  try
    ObjetoLocal := TCompraCotacaoVO.Create;
    ObjetoLocal.Id := pId;
    Result := TT2TiORM.Excluir(ObjetoLocal);
    TratarRetorno(Result);
  finally
    FreeAndNil(ObjetoLocal)
  end;
end;

class function TCompraCotacaoController.GetDataSet: TClientDataSet;
begin
  Result := FDataSet;
end;

class procedure TCompraCotacaoController.SetDataSet(pDataSet: TClientDataSet);
begin
  FDataSet := pDataSet;
end;

class procedure TCompraCotacaoController.TratarListaRetorno(pListaObjetos: TObjectList<TVO>);
begin
  try
    TratarRetorno<TCompraCotacaoVO>(TObjectList<TCompraCotacaoVO>(pListaObjetos));
  finally
    FreeAndNil(pListaObjetos);
  end;
end;

initialization
  Classes.RegisterClass(TCompraCotacaoController);

finalization
  Classes.UnRegisterClass(TCompraCotacaoController);

end.
