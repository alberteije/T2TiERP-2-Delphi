{*******************************************************************************
Title: T2Ti ERP                                                                 
Description: Controller do lado Cliente relacionado à tabela [REQUISICAO_INTERNA_CABECALHO] 
                                                                                
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
unit RequisicaoInternaCabecalhoController;

interface

uses
  Classes, Dialogs, SysUtils, DBClient, DB,  Windows, Forms, Controller, Rtti,
  Atributos, VO, Generics.Collections, RequisicaoInternaCabecalhoVO;

type
  TRequisicaoInternaCabecalhoController = class(TController)
  private
    class var FDataSet: TClientDataSet;
  public
    class procedure Consulta(pFiltro: String; pPagina: String; pConsultaCompleta: Boolean = False);
    class function ConsultaLista(pFiltro: String): TObjectList<TRequisicaoInternaCabecalhoVO>;
    class function ConsultaObjeto(pFiltro: String): TRequisicaoInternaCabecalhoVO;

    class procedure Insere(pObjeto: TRequisicaoInternaCabecalhoVO);
    class function Altera(pObjeto: TRequisicaoInternaCabecalhoVO): Boolean;

    class function Exclui(pId: Integer): Boolean;

    class function GetDataSet: TClientDataSet; override;
    class procedure SetDataSet(pDataSet: TClientDataSet); override;
    class procedure TratarListaRetorno(pListaObjetos: TObjectList<TVO>);
  end;

implementation

uses UDataModule, T2TiORM, RequisicaoInternaDetalheVO, ControleEstoqueController;

class procedure TRequisicaoInternaCabecalhoController.Consulta(pFiltro: String; pPagina: String; pConsultaCompleta: Boolean);
var
  Retorno: TObjectList<TRequisicaoInternaCabecalhoVO>;
begin
  try
    Retorno := TT2TiORM.Consultar<TRequisicaoInternaCabecalhoVO>(pFiltro, pPagina, pConsultaCompleta);
    TratarRetorno<TRequisicaoInternaCabecalhoVO>(Retorno);
  finally
  end;
end;

class function TRequisicaoInternaCabecalhoController.ConsultaLista(pFiltro: String): TObjectList<TRequisicaoInternaCabecalhoVO>;
begin
  try
    Result := TT2TiORM.Consultar<TRequisicaoInternaCabecalhoVO>(pFiltro, '-1', True);
  finally
  end;
end;

class function TRequisicaoInternaCabecalhoController.ConsultaObjeto(pFiltro: String): TRequisicaoInternaCabecalhoVO;
begin
  try
    Result := TT2TiORM.ConsultarUmObjeto<TRequisicaoInternaCabecalhoVO>(pFiltro, True);
  finally
  end;
end;

class procedure TRequisicaoInternaCabecalhoController.Insere(pObjeto: TRequisicaoInternaCabecalhoVO);
var
  UltimoID: Integer;
  RequisicaoInternaDetalheEnumerator: TEnumerator<TRequisicaoInternaDetalheVO>;
begin
  try
    UltimoID := TT2TiORM.Inserir(pObjeto);

    RequisicaoInternaDetalheEnumerator := pObjeto.ListaRequisicaoInterna.GetEnumerator;
    try
      with RequisicaoInternaDetalheEnumerator do
      begin
        while MoveNext do
        begin
          Current.IdReqInternaCabecalho := UltimoID;
          TT2TiORM.Inserir(Current);
        end;
      end;
    finally
      RequisicaoInternaDetalheEnumerator.Free;
    end;

    Consulta('ID = ' + IntToStr(UltimoID), '0');
  finally
  end;
end;

class function TRequisicaoInternaCabecalhoController.Altera(pObjeto: TRequisicaoInternaCabecalhoVO): Boolean;
var
  RequisicaoInternaDetalheEnumerator: TEnumerator<TRequisicaoInternaDetalheVO>;
begin
  try
    Result := TT2TiORM.Alterar(pObjeto);

    // Requisição Detalhe
    try
      RequisicaoInternaDetalheEnumerator := pObjeto.ListaRequisicaoInterna.GetEnumerator;
      with RequisicaoInternaDetalheEnumerator do
      begin
        while MoveNext do
        begin
          if Current.Id > 0 then
            Result := TT2TiORM.Alterar(Current)
          else
          begin
            Current.IdReqInternaCabecalho := pObjeto.Id;
            Result := TT2TiORM.Inserir(Current) > 0;
          end;

          // Atualiza estoque
          if pObjeto.Situacao = 'D' then
          begin
            TControleEstoqueController.AtualizarEstoque(Current.Quantidade * -1, Current.IdProduto, Sessao.Empresa.Id, Sessao.Empresa.TipoControleEstoque);
          end;
        end;
      end;
    finally
      FreeAndNil(RequisicaoInternaDetalheEnumerator);
    end;
  finally
    TratarRetorno(Result);
  end;
end;

class function TRequisicaoInternaCabecalhoController.Exclui(pId: Integer): Boolean;
var
  ObjetoLocal: TRequisicaoInternaCabecalhoVO;
begin
  try
    ObjetoLocal := TRequisicaoInternaCabecalhoVO.Create;
    ObjetoLocal.Id := pId;
    Result := TT2TiORM.Excluir(ObjetoLocal);
    TratarRetorno(Result);
  finally
    FreeAndNil(ObjetoLocal)
  end;
end;

class function TRequisicaoInternaCabecalhoController.GetDataSet: TClientDataSet;
begin
  Result := FDataSet;
end;

class procedure TRequisicaoInternaCabecalhoController.SetDataSet(pDataSet: TClientDataSet);
begin
  FDataSet := pDataSet;
end;

class procedure TRequisicaoInternaCabecalhoController.TratarListaRetorno(pListaObjetos: TObjectList<TVO>);
begin
  try
    TratarRetorno<TRequisicaoInternaCabecalhoVO>(TObjectList<TRequisicaoInternaCabecalhoVO>(pListaObjetos));
  finally
    FreeAndNil(pListaObjetos);
  end;
end;

initialization
  Classes.RegisterClass(TRequisicaoInternaCabecalhoController);

finalization
  Classes.UnRegisterClass(TRequisicaoInternaCabecalhoController);

end.
