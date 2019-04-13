{*******************************************************************************
Title: T2Ti ERP                                                                 
Description: Controller do lado Cliente relacionado à tabela [CONTABIL_LANCAMENTO_CABECALHO] 
                                                                                
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
unit ContabilLancamentoCabecalhoController;

interface

uses
  Classes, Dialogs, SysUtils, DBClient, DB,  Windows, Forms, Controller, Rtti,
  Atributos, VO, Generics.Collections, ContabilLancamentoCabecalhoVO,
  ContabilLancamentoDetalheVO;

type
  TContabilLancamentoCabecalhoController = class(TController)
  private
    class var FDataSet: TClientDataSet;
  public
    class procedure Consulta(pFiltro: String; pPagina: String; pConsultaCompleta: Boolean = False);
    class function ConsultaLista(pFiltro: String): TObjectList<TContabilLancamentoCabecalhoVO>;
    class function ConsultaObjeto(pFiltro: String): TContabilLancamentoCabecalhoVO;

    class procedure Insere(pObjeto: TContabilLancamentoCabecalhoVO);
    class function Altera(pObjeto: TContabilLancamentoCabecalhoVO): Boolean;

    class function Exclui(pId: Integer): Boolean;

    class function GetDataSet: TClientDataSet; override;
    class procedure SetDataSet(pDataSet: TClientDataSet); override;
    class procedure TratarListaRetorno(pListaObjetos: TObjectList<TVO>);
  end;

implementation

uses UDataModule, T2TiORM;

class procedure TContabilLancamentoCabecalhoController.Consulta(pFiltro: String; pPagina: String; pConsultaCompleta: Boolean);
var
  Retorno: TObjectList<TContabilLancamentoCabecalhoVO>;
begin
  try
    Retorno := TT2TiORM.Consultar<TContabilLancamentoCabecalhoVO>(pFiltro, pPagina, pConsultaCompleta);
    TratarRetorno<TContabilLancamentoCabecalhoVO>(Retorno);
  finally
  end;
end;

class function TContabilLancamentoCabecalhoController.ConsultaLista(pFiltro: String): TObjectList<TContabilLancamentoCabecalhoVO>;
begin
  try
    Result := TT2TiORM.Consultar<TContabilLancamentoCabecalhoVO>(pFiltro, '-1', True);
  finally
  end;
end;

class function TContabilLancamentoCabecalhoController.ConsultaObjeto(pFiltro: String): TContabilLancamentoCabecalhoVO;
begin
  try
    Result := TT2TiORM.ConsultarUmObjeto<TContabilLancamentoCabecalhoVO>(pFiltro, True);
  finally
  end;
end;

class procedure TContabilLancamentoCabecalhoController.Insere(pObjeto: TContabilLancamentoCabecalhoVO);
var
  UltimoID: Integer;
  ContabilLancamentoDetalheEnumerator: TEnumerator<TContabilLancamentoDetalheVO>;
begin
  try
    UltimoID := TT2TiORM.Inserir(pObjeto);

    // Detalhes
    ContabilLancamentoDetalheEnumerator := pObjeto.ListaContabilLancamentoDetalheVO.GetEnumerator;
    try
      with ContabilLancamentoDetalheEnumerator do
      begin
        while MoveNext do
        begin
          Current.IdContabilLancamentoCab := UltimoID;
          TT2TiORM.Inserir(Current);
        end;
      end;
    finally
      ContabilLancamentoDetalheEnumerator.Free;
    end;

    Consulta('ID = ' + IntToStr(UltimoID), '0');
  finally
  end;
end;

class function TContabilLancamentoCabecalhoController.Altera(pObjeto: TContabilLancamentoCabecalhoVO): Boolean;
var
  ContabilLancamentoDetalheEnumerator: TEnumerator<TContabilLancamentoDetalheVO>;
begin
  try
    Result := TT2TiORM.Alterar(pObjeto);

    // Detalhes
    try
      ContabilLancamentoDetalheEnumerator := pObjeto.ListaContabilLancamentoDetalheVO.GetEnumerator;
      with ContabilLancamentoDetalheEnumerator do
      begin
        while MoveNext do
        begin
          if Current.Id > 0 then
            Result := TT2TiORM.Alterar(Current)
          else
          begin
            Current.IdContabilLancamentoCab := pObjeto.Id;
            Result := TT2TiORM.Inserir(Current) > 0;
          end;
        end;
      end;
    finally
      FreeAndNil(ContabilLancamentoDetalheEnumerator);
    end;
  finally
  end;
end;

class function TContabilLancamentoCabecalhoController.Exclui(pId: Integer): Boolean;
var
  ObjetoLocal: TContabilLancamentoCabecalhoVO;
begin
  try
    ObjetoLocal := TContabilLancamentoCabecalhoVO.Create;
    ObjetoLocal.Id := pId;
    Result := TT2TiORM.Excluir(ObjetoLocal);
    TratarRetorno(Result);
  finally
    FreeAndNil(ObjetoLocal)
  end;
end;

class function TContabilLancamentoCabecalhoController.GetDataSet: TClientDataSet;
begin
  Result := FDataSet;
end;

class procedure TContabilLancamentoCabecalhoController.SetDataSet(pDataSet: TClientDataSet);
begin
  FDataSet := pDataSet;
end;

class procedure TContabilLancamentoCabecalhoController.TratarListaRetorno(pListaObjetos: TObjectList<TVO>);
begin
  try
    TratarRetorno<TContabilLancamentoCabecalhoVO>(TObjectList<TContabilLancamentoCabecalhoVO>(pListaObjetos));
  finally
    FreeAndNil(pListaObjetos);
  end;
end;

initialization
  Classes.RegisterClass(TContabilLancamentoCabecalhoController);

finalization
  Classes.UnRegisterClass(TContabilLancamentoCabecalhoController);

end.
