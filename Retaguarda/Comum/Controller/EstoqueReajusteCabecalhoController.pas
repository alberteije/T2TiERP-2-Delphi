{*******************************************************************************
Title: T2Ti ERP                                                                 
Description: Controller do lado Cliente relacionado à tabela [ESTOQUE_REAJUSTE_CABECALHO] 
                                                                                
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
           t2ti.com@gmail.com                                                   
                                                                                
@author Albert Eije (t2ti.com@gmail.com)                    
@version 2.0                                                                    
*******************************************************************************}
unit EstoqueReajusteCabecalhoController;

interface

uses
  Classes, Dialogs, SysUtils, DBClient, DB,  Windows, Forms, Controller, Rtti,
  Atributos, VO, Generics.Collections, EstoqueReajusteCabecalhoVO;

type
  TEstoqueReajusteCabecalhoController = class(TController)
  private
    class var FDataSet: TClientDataSet;
  public
    class procedure Consulta(pFiltro: String; pPagina: String; pConsultaCompleta: Boolean = False);
    class function ConsultaLista(pFiltro: String): TObjectList<TEstoqueReajusteCabecalhoVO>;
    class function ConsultaObjeto(pFiltro: String): TEstoqueReajusteCabecalhoVO;

    class procedure Insere(pObjeto: TEstoqueReajusteCabecalhoVO);
    class function Altera(pObjeto: TEstoqueReajusteCabecalhoVO): Boolean;

    class function Exclui(pId: Integer): Boolean;

    class function GetDataSet: TClientDataSet; override;
    class procedure SetDataSet(pDataSet: TClientDataSet); override;
    class procedure TratarListaRetorno(pListaObjetos: TObjectList<TVO>);
  end;

implementation

uses UDataModule, T2TiORM, EstoqueReajusteDetalheVO, ProdutoVO;

class procedure TEstoqueReajusteCabecalhoController.Consulta(pFiltro: String; pPagina: String; pConsultaCompleta: Boolean);
var
  Retorno: TObjectList<TEstoqueReajusteCabecalhoVO>;
begin
  try
    Retorno := TT2TiORM.Consultar<TEstoqueReajusteCabecalhoVO>(pFiltro, pPagina, pConsultaCompleta);
    TratarRetorno<TEstoqueReajusteCabecalhoVO>(Retorno);
  finally
  end;
end;

class function TEstoqueReajusteCabecalhoController.ConsultaLista(pFiltro: String): TObjectList<TEstoqueReajusteCabecalhoVO>;
begin
  try
    Result := TT2TiORM.Consultar<TEstoqueReajusteCabecalhoVO>(pFiltro, '-1', True);
  finally
  end;
end;

class function TEstoqueReajusteCabecalhoController.ConsultaObjeto(pFiltro: String): TEstoqueReajusteCabecalhoVO;
begin
  try
    Result := TT2TiORM.ConsultarUmObjeto<TEstoqueReajusteCabecalhoVO>(pFiltro, True);
  finally
  end;
end;

class procedure TEstoqueReajusteCabecalhoController.Insere(pObjeto: TEstoqueReajusteCabecalhoVO);
var
  UltimoID: Integer;
  EstoqueReajusteDetalheEnumerator: TEnumerator<TEstoqueReajusteDetalheVO>;
  Produto: TProdutoVO;
begin
  try
    UltimoID := TT2TiORM.Inserir(pObjeto);

    EstoqueReajusteDetalheEnumerator := pObjeto.ListaEstoqueReajusteDetalheVO.GetEnumerator;
    try
      with EstoqueReajusteDetalheEnumerator do
      begin
        while MoveNext do
        begin
          Current.IdEstoqueReajusteCabecalho := UltimoID;
          TT2TiORM.Inserir(Current);

          // Atualiza Valor do Produto
          Produto := TProdutoVO.Create;
          Produto.Id := Current.IdProduto;
          Produto.ValorVenda := Current.ValorReajuste;
          TT2TiORM.Alterar(Produto);
        end;
      end;
    finally
      EstoqueReajusteDetalheEnumerator.Free;
    end;

    Consulta('ID = ' + IntToStr(UltimoID), '0');
  finally
  end;
end;

class function TEstoqueReajusteCabecalhoController.Altera(pObjeto: TEstoqueReajusteCabecalhoVO): Boolean;
var
  EstoqueReajusteDetalheEnumerator: TEnumerator<TEstoqueReajusteDetalheVO>;
  Produto: TProdutoVO;
begin
  try
    Result := TT2TiORM.Alterar(pObjeto);

    try
      EstoqueReajusteDetalheEnumerator := pObjeto.ListaEstoqueReajusteDetalheVO.GetEnumerator;
      with EstoqueReajusteDetalheEnumerator do
      begin
        while MoveNext do
        begin
          if Current.Id > 0 then
            Result := TT2TiORM.Alterar(Current)
          else
          begin
            Current.IdEstoqueReajusteCabecalho := pObjeto.Id;
            Result := TT2TiORM.Inserir(Current) > 0;
          end;

          // Atualiza Valor do Produto
          Produto := TProdutoVO.Create;
          Produto.Id := Current.IdProduto;
          Produto.ValorVenda := Current.ValorReajuste;
          Result := TT2TiORM.Alterar(Produto);
        end;
      end;
    finally
      FreeAndNil(EstoqueReajusteDetalheEnumerator);
    end;

  finally
  end;
end;

class function TEstoqueReajusteCabecalhoController.Exclui(pId: Integer): Boolean;
var
  ObjetoLocal: TEstoqueReajusteCabecalhoVO;
begin
  try
    ObjetoLocal := TEstoqueReajusteCabecalhoVO.Create;
    ObjetoLocal.Id := pId;
    Result := TT2TiORM.Excluir(ObjetoLocal);
    TratarRetorno(Result);
  finally
    FreeAndNil(ObjetoLocal)
  end;
end;

class function TEstoqueReajusteCabecalhoController.GetDataSet: TClientDataSet;
begin
  Result := FDataSet;
end;

class procedure TEstoqueReajusteCabecalhoController.SetDataSet(pDataSet: TClientDataSet);
begin
  FDataSet := pDataSet;
end;

class procedure TEstoqueReajusteCabecalhoController.TratarListaRetorno(pListaObjetos: TObjectList<TVO>);
begin
  try
    TratarRetorno<TEstoqueReajusteCabecalhoVO>(TObjectList<TEstoqueReajusteCabecalhoVO>(pListaObjetos));
  finally
    FreeAndNil(pListaObjetos);
  end;
end;

initialization
  Classes.RegisterClass(TEstoqueReajusteCabecalhoController);

finalization
  Classes.UnRegisterClass(TEstoqueReajusteCabecalhoController);

end.
