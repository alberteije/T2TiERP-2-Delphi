{*******************************************************************************
Title: T2Ti ERP                                                                 
Description: Controller do lado Cliente relacionado à tabela [VENDA_CONDICOES_PAGAMENTO] 
                                                                                
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
unit VendaCondicoesPagamentoController;

interface

uses
  Classes, Dialogs, SysUtils, DBClient, DB,  Windows, Forms, Controller, Rtti,
  Atributos, VO, Generics.Collections, VendaCondicoesPagamentoVO;

type
  TVendaCondicoesPagamentoController = class(TController)
  private
    class var FDataSet: TClientDataSet;
  public
    class procedure Consulta(pFiltro: String; pPagina: String; pConsultaCompleta: Boolean = False);
    class function ConsultaLista(pFiltro: String): TObjectList<TVendaCondicoesPagamentoVO>;
    class function ConsultaObjeto(pFiltro: String): TVendaCondicoesPagamentoVO;

    class procedure Insere(pObjeto: TVendaCondicoesPagamentoVO);
    class function Altera(pObjeto: TVendaCondicoesPagamentoVO): Boolean;

    class function Exclui(pId: Integer): Boolean;

    class function GetDataSet: TClientDataSet; override;
    class procedure SetDataSet(pDataSet: TClientDataSet); override;
    class procedure TratarListaRetorno(pListaObjetos: TObjectList<TVO>);
  end;

implementation

uses UDataModule, T2TiORM, VendaCondicoesParcelasVO;

class procedure TVendaCondicoesPagamentoController.Consulta(pFiltro: String; pPagina: String; pConsultaCompleta: Boolean);
var
  Retorno: TObjectList<TVendaCondicoesPagamentoVO>;
begin
  try
    Retorno := TT2TiORM.Consultar<TVendaCondicoesPagamentoVO>(pFiltro, pPagina, pConsultaCompleta);
    TratarRetorno<TVendaCondicoesPagamentoVO>(Retorno);
  finally
  end;
end;

class function TVendaCondicoesPagamentoController.ConsultaLista(pFiltro: String): TObjectList<TVendaCondicoesPagamentoVO>;
begin
  try
    Result := TT2TiORM.Consultar<TVendaCondicoesPagamentoVO>(pFiltro, '-1', True);
  finally
  end;
end;

class function TVendaCondicoesPagamentoController.ConsultaObjeto(pFiltro: String): TVendaCondicoesPagamentoVO;
begin
  try
    Result := TT2TiORM.ConsultarUmObjeto<TVendaCondicoesPagamentoVO>(pFiltro, True);
  finally
  end;
end;

class procedure TVendaCondicoesPagamentoController.Insere(pObjeto: TVendaCondicoesPagamentoVO);
var
  UltimoID: Integer;
  CondicoesParcelassEnumerator: TEnumerator<TVendaCondicoesParcelasVO>;
begin
  try
    UltimoID := TT2TiORM.Inserir(pObjeto);

    // Condições Parcela
    CondicoesParcelassEnumerator := pObjeto.ListaVendaCondicoesParcelasVO.GetEnumerator;
    try
      with CondicoesParcelassEnumerator do
      begin
        while MoveNext do
        begin
          Current.IdVendaCondicoesPagamento := UltimoID;
          TT2TiORM.Inserir(Current);
        end;
      end;
    finally
      FreeAndNil(CondicoesParcelassEnumerator);
    end;

    Consulta('ID = ' + IntToStr(UltimoID), '0');
  finally
  end;
end;

class function TVendaCondicoesPagamentoController.Altera(pObjeto: TVendaCondicoesPagamentoVO): Boolean;
var
  CondicoesParcelasEnumerator: TEnumerator<TVendaCondicoesParcelasVO>;
begin
  try
    Result := TT2TiORM.Alterar(pObjeto);

    // Condicoes Parcela
    try
      CondicoesParcelasEnumerator := pObjeto.ListaVendaCondicoesParcelasVO.GetEnumerator;
      with CondicoesParcelasEnumerator do
      begin
        while MoveNext do
        begin
          if Current.Id > 0 then
            Result := TT2TiORM.Alterar(Current)
          else
          begin
            Current.IdVendaCondicoesPagamento := pObjeto.Id;
            Result := TT2TiORM.Inserir(Current) > 0;
          end;
        end;
      end;
    finally
      FreeAndNil(CondicoesParcelasEnumerator);
    end;

  finally
  end;
end;

class function TVendaCondicoesPagamentoController.Exclui(pId: Integer): Boolean;
var
  ObjetoLocal: TVendaCondicoesPagamentoVO;
begin
  try
    ObjetoLocal := TVendaCondicoesPagamentoVO.Create;
    ObjetoLocal.Id := pId;
    Result := TT2TiORM.Excluir(ObjetoLocal);
    TratarRetorno(Result);
  finally
    FreeAndNil(ObjetoLocal)
  end;
end;

class function TVendaCondicoesPagamentoController.GetDataSet: TClientDataSet;
begin
  Result := FDataSet;
end;

class procedure TVendaCondicoesPagamentoController.SetDataSet(pDataSet: TClientDataSet);
begin
  FDataSet := pDataSet;
end;

class procedure TVendaCondicoesPagamentoController.TratarListaRetorno(pListaObjetos: TObjectList<TVO>);
begin
  try
    TratarRetorno<TVendaCondicoesPagamentoVO>(TObjectList<TVendaCondicoesPagamentoVO>(pListaObjetos));
  finally
    FreeAndNil(pListaObjetos);
  end;
end;

initialization
  Classes.RegisterClass(TVendaCondicoesPagamentoController);

finalization
  Classes.UnRegisterClass(TVendaCondicoesPagamentoController);

end.
