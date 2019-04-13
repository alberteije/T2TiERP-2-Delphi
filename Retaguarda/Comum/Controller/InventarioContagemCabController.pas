{*******************************************************************************
Title: T2Ti ERP                                                                 
Description: Controller do lado Cliente relacionado à tabela [INVENTARIO_CONTAGEM_CAB] 
                                                                                
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
unit InventarioContagemCabController;

interface

uses
  Classes, Dialogs, SysUtils, DBClient, DB,  Windows, Forms, Controller, Rtti,
  Atributos, VO, Generics.Collections, InventarioContagemCabVO, InventarioContagemDetVO,
  ProdutoVO;

type
  TInventarioContagemCabController = class(TController)
  private
    class var FDataSet: TClientDataSet;
  public
    class procedure Consulta(pFiltro: String; pPagina: String; pConsultaCompleta: Boolean = False);
    class function ConsultaLista(pFiltro: String): TObjectList<TInventarioContagemCabVO>;
    class function ConsultaObjeto(pFiltro: String): TInventarioContagemCabVO;

    class procedure Insere(pObjeto: TInventarioContagemCabVO);
    class function Altera(pObjeto: TInventarioContagemCabVO): Boolean;

    class function Exclui(pId: Integer): Boolean;

    class function GetDataSet: TClientDataSet; override;
    class procedure SetDataSet(pDataSet: TClientDataSet); override;
    class procedure TratarListaRetorno(pListaObjetos: TObjectList<TVO>);
  end;

implementation

uses UDataModule, T2TiORM;

class procedure TInventarioContagemCabController.Consulta(pFiltro: String; pPagina: String; pConsultaCompleta: Boolean);
var
  Retorno: TObjectList<TInventarioContagemCabVO>;
begin
  try
    Retorno := TT2TiORM.Consultar<TInventarioContagemCabVO>(pFiltro, pPagina, pConsultaCompleta);
    TratarRetorno<TInventarioContagemCabVO>(Retorno);
  finally
  end;
end;

class function TInventarioContagemCabController.ConsultaLista(pFiltro: String): TObjectList<TInventarioContagemCabVO>;
begin
  try
    Result := TT2TiORM.Consultar<TInventarioContagemCabVO>(pFiltro, '-1', True);
  finally
  end;
end;

class function TInventarioContagemCabController.ConsultaObjeto(pFiltro: String): TInventarioContagemCabVO;
begin
  try
    Result := TT2TiORM.ConsultarUmObjeto<TInventarioContagemCabVO>(pFiltro, True);
  finally
  end;
end;

class procedure TInventarioContagemCabController.Insere(pObjeto: TInventarioContagemCabVO);
var
  UltimoID: Integer;
  DetalheEnumerator: TEnumerator<TInventarioContagemDetVO>;
begin
  try
    UltimoID := TT2TiORM.Inserir(pObjeto);

    // Detalhes
    try
      DetalheEnumerator := pObjeto.ListaInventarioContagemDetVO.GetEnumerator;
      with DetalheEnumerator do
      begin
        while MoveNext do
        begin
          Current.IdInventarioContagemCab := UltimoID;
          TT2TiORM.Inserir(Current);
        end;
      end;
    finally
      FreeAndNil(DetalheEnumerator);
    end;

    Consulta('ID = ' + IntToStr(UltimoID), '0');
  finally
  end;
end;

class function TInventarioContagemCabController.Altera(pObjeto: TInventarioContagemCabVO): Boolean;
var
  DetalheEnumerator: TEnumerator<TInventarioContagemDetVO>;
  Produto: TProdutoVO;
begin
  try
    Result := TT2TiORM.Alterar(pObjeto);

    // Detalhes
    try
      DetalheEnumerator := pObjeto.ListaInventarioContagemDetVO.GetEnumerator;
      with DetalheEnumerator do
      begin
        while MoveNext do
        begin
          if Current.Id > 0 then
            Result := TT2TiORM.Alterar(Current)
          else
          begin
            Current.IdInventarioContagemCab := pObjeto.Id;
            Result := TT2TiORM.Inserir(Current) > 0;
          end;

          // Atualiza Estoque
          if pObjeto.EstoqueAtualizado = 'S' then
          begin
            Produto := TProdutoVO.Create;
            Produto.Id := Current.IdProduto;

            /// EXERCICIO
            ///  Atualize de acordo com o campo selecionado em (FECHADO_CONTAGEM)
            Produto.QuantidadeEstoque := Current.Contagem01;
            Result := TT2TiORM.Alterar(Produto);
          end;
        end;
      end;
    finally
      FreeAndNil(DetalheEnumerator);
    end;
  finally
  end;
end;

class function TInventarioContagemCabController.Exclui(pId: Integer): Boolean;
var
  ObjetoLocal: TInventarioContagemCabVO;
begin
  try
    ObjetoLocal := TInventarioContagemCabVO.Create;
    ObjetoLocal.Id := pId;
    Result := TT2TiORM.Excluir(ObjetoLocal);
    TratarRetorno(Result);
  finally
    FreeAndNil(ObjetoLocal)
  end;
end;

class function TInventarioContagemCabController.GetDataSet: TClientDataSet;
begin
  Result := FDataSet;
end;

class procedure TInventarioContagemCabController.SetDataSet(pDataSet: TClientDataSet);
begin
  FDataSet := pDataSet;
end;

class procedure TInventarioContagemCabController.TratarListaRetorno(pListaObjetos: TObjectList<TVO>);
begin
  try
    TratarRetorno<TInventarioContagemCabVO>(TObjectList<TInventarioContagemCabVO>(pListaObjetos));
  finally
    FreeAndNil(pListaObjetos);
  end;
end;

initialization
  Classes.RegisterClass(TInventarioContagemCabController);

finalization
  Classes.UnRegisterClass(TInventarioContagemCabController);

end.
