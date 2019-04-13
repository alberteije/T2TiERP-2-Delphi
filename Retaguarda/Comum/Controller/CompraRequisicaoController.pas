{*******************************************************************************
Title: T2Ti ERP                                                                 
Description: Controller do lado Cliente relacionado à tabela [COMPRA_REQUISICAO] 
                                                                                
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
unit CompraRequisicaoController;

interface

uses
  Classes, Dialogs, SysUtils, DBClient, DB,  Windows, Forms, Controller, Rtti,
  Atributos, VO, Generics.Collections, CompraRequisicaoVO, CompraRequisicaoDetalheVO;

type
  TCompraRequisicaoController = class(TController)
  private
    class var FDataSet: TClientDataSet;
  public
    class procedure Consulta(pFiltro: String; pPagina: String; pConsultaCompleta: Boolean = False);
    class function ConsultaLista(pFiltro: String): TObjectList<TCompraRequisicaoVO>;
    class function ConsultaObjeto(pFiltro: String): TCompraRequisicaoVO;

    class procedure Insere(pObjeto: TCompraRequisicaoVO);
    class function Altera(pObjeto: TCompraRequisicaoVO): Boolean;

    class function Exclui(pId: Integer): Boolean;

    class function GetDataSet: TClientDataSet; override;
    class procedure SetDataSet(pDataSet: TClientDataSet); override;
    class procedure TratarListaRetorno(pListaObjetos: TObjectList<TVO>);
  end;

implementation

uses UDataModule, T2TiORM;

class procedure TCompraRequisicaoController.Consulta(pFiltro: String; pPagina: String; pConsultaCompleta: Boolean);
var
  Retorno: TObjectList<TCompraRequisicaoVO>;
begin
  try
    Retorno := TT2TiORM.Consultar<TCompraRequisicaoVO>(pFiltro, pPagina, pConsultaCompleta);
    TratarRetorno<TCompraRequisicaoVO>(Retorno);
  finally
  end;
end;

class function TCompraRequisicaoController.ConsultaLista(pFiltro: String): TObjectList<TCompraRequisicaoVO>;
begin
  try
    Result := TT2TiORM.Consultar<TCompraRequisicaoVO>(pFiltro, '-1', True);
  finally
  end;
end;

class function TCompraRequisicaoController.ConsultaObjeto(pFiltro: String): TCompraRequisicaoVO;
begin
  try
    Result := TT2TiORM.ConsultarUmObjeto<TCompraRequisicaoVO>(pFiltro, True);
    Result.ColaboradorPessoaNome := Result.ColaboradorVO.Nome;
    Result.CompraTipoRequisicaoNome := Result.CompraTipoRequisicaoVO.Nome;
  finally
  end;
end;

class procedure TCompraRequisicaoController.Insere(pObjeto: TCompraRequisicaoVO);
var
  UltimoID: Integer;
  DetalheEnumerator: TEnumerator<TCompraRequisicaoDetalheVO>;
begin
  try
    UltimoID := TT2TiORM.Inserir(pObjeto);

    // Detalhes
    try
      DetalheEnumerator := pObjeto.ListaCompraRequisicaoDetalheVO.GetEnumerator;
      with DetalheEnumerator do
      begin
        while MoveNext do
        begin
          Current.IdCompraRequisicao := UltimoID;
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

class function TCompraRequisicaoController.Altera(pObjeto: TCompraRequisicaoVO): Boolean;
var
  DetalheEnumerator: TEnumerator<TCompraRequisicaoDetalheVO>;
begin
  try
    Result := TT2TiORM.Alterar(pObjeto);

    // Detalhes
    try
      DetalheEnumerator := pObjeto.ListaCompraRequisicaoDetalheVO.GetEnumerator;
      with DetalheEnumerator do
      begin
        while MoveNext do
        begin
          if Current.Id > 0 then
            Result := TT2TiORM.Alterar(Current)
          else
          begin
            Current.IdCompraRequisicao := pObjeto.Id;
            Result := TT2TiORM.Inserir(Current) > 0;
          end;
        end;
      end;
    finally
      FreeAndNil(DetalheEnumerator);
    end;
  finally
  end;
end;

class function TCompraRequisicaoController.Exclui(pId: Integer): Boolean;
var
  ObjetoLocal: TCompraRequisicaoVO;
begin
  try
    ObjetoLocal := TCompraRequisicaoVO.Create;
    ObjetoLocal.Id := pId;

    Result := TT2TiORM.ComandoSQL('DELETE FROM COMPRA_REQUISICAO_DETALHE where ID_COMPRA_REQUISICAO = ' + IntToStr(pId));

    Result := TT2TiORM.Excluir(ObjetoLocal);
    TratarRetorno(Result);
  finally
    FreeAndNil(ObjetoLocal)
  end;
end;

class function TCompraRequisicaoController.GetDataSet: TClientDataSet;
begin
  Result := FDataSet;
end;

class procedure TCompraRequisicaoController.SetDataSet(pDataSet: TClientDataSet);
begin
  FDataSet := pDataSet;
end;

class procedure TCompraRequisicaoController.TratarListaRetorno(pListaObjetos: TObjectList<TVO>);
begin
  try
    TratarRetorno<TCompraRequisicaoVO>(TObjectList<TCompraRequisicaoVO>(pListaObjetos));
  finally
    FreeAndNil(pListaObjetos);
  end;
end;

initialization
  Classes.RegisterClass(TCompraRequisicaoController);

finalization
  Classes.UnRegisterClass(TCompraRequisicaoController);

end.
