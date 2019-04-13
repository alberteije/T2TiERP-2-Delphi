{*******************************************************************************
Title: T2Ti ERP                                                                 
Description: Controller do lado Cliente relacionado à tabela [FOLHA_LANCAMENTO_CABECALHO] 
                                                                                
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
unit FolhaLancamentoCabecalhoController;

interface

uses
  Classes, Dialogs, SysUtils, DBClient, DB,  Windows, Forms, Controller, Rtti,
  Atributos, VO, Generics.Collections, FolhaLancamentoCabecalhoVO;

type
  TFolhaLancamentoCabecalhoController = class(TController)
  private
    class var FDataSet: TClientDataSet;
  public
    class procedure Consulta(pFiltro: String; pPagina: String; pConsultaCompleta: Boolean = False);
    class function ConsultaLista(pFiltro: String): TObjectList<TFolhaLancamentoCabecalhoVO>;
    class function ConsultaObjeto(pFiltro: String): TFolhaLancamentoCabecalhoVO;

    class procedure Insere(pObjeto: TFolhaLancamentoCabecalhoVO);
    class function Altera(pObjeto: TFolhaLancamentoCabecalhoVO): Boolean;

    class function Exclui(pId: Integer): Boolean;

    class function GetDataSet: TClientDataSet; override;
    class procedure SetDataSet(pDataSet: TClientDataSet); override;
    class procedure TratarListaRetorno(pListaObjetos: TObjectList<TVO>);
  end;

implementation

uses UDataModule, T2TiORM, FolhaLancamentoDetalheVO;

class procedure TFolhaLancamentoCabecalhoController.Consulta(pFiltro: String; pPagina: String; pConsultaCompleta: Boolean);
var
  Retorno: TObjectList<TFolhaLancamentoCabecalhoVO>;
begin
  try
    Retorno := TT2TiORM.Consultar<TFolhaLancamentoCabecalhoVO>(pFiltro, pPagina, pConsultaCompleta);
    TratarRetorno<TFolhaLancamentoCabecalhoVO>(Retorno);
  finally
  end;
end;

class function TFolhaLancamentoCabecalhoController.ConsultaLista(pFiltro: String): TObjectList<TFolhaLancamentoCabecalhoVO>;
begin
  try
    Result := TT2TiORM.Consultar<TFolhaLancamentoCabecalhoVO>(pFiltro, '-1', True);
  finally
  end;
end;

class function TFolhaLancamentoCabecalhoController.ConsultaObjeto(pFiltro: String): TFolhaLancamentoCabecalhoVO;
begin
  try
    Result := TT2TiORM.ConsultarUmObjeto<TFolhaLancamentoCabecalhoVO>(pFiltro, True);
  finally
  end;
end;

class procedure TFolhaLancamentoCabecalhoController.Insere(pObjeto: TFolhaLancamentoCabecalhoVO);
var
  UltimoID: Integer;
  FolhaLancamentoDetalheEnumerator: TEnumerator<TFolhaLancamentoDetalheVO>;
begin
  try
    UltimoID := TT2TiORM.Inserir(pObjeto);

    // Detalhes
    FolhaLancamentoDetalheEnumerator := pObjeto.ListaFolhaLancamentoDetalheVO.GetEnumerator;
    try
      with FolhaLancamentoDetalheEnumerator do
      begin
        while MoveNext do
        begin
          Current.IdFolhaLancamentoCabecalho := UltimoID;
          TT2TiORM.Inserir(Current);
        end;
      end;
    finally
      FreeAndNil(FolhaLancamentoDetalheEnumerator);
    end;

    Consulta('ID = ' + IntToStr(UltimoID), '0');
  finally
  end;
end;

class function TFolhaLancamentoCabecalhoController.Altera(pObjeto: TFolhaLancamentoCabecalhoVO): Boolean;
var
  FolhaLancamentoDetalheEnumerator: TEnumerator<TFolhaLancamentoDetalheVO>;
begin
  try
    Result := TT2TiORM.Alterar(pObjeto);
    // Detalhes
    try
      FolhaLancamentoDetalheEnumerator := pObjeto.ListaFolhaLancamentoDetalheVO.GetEnumerator;
      with FolhaLancamentoDetalheEnumerator do
      begin
        while MoveNext do
        begin
          if Current.Id > 0 then
            Result := TT2TiORM.Alterar(Current)
          else
          begin
            Current.IdFolhaLancamentoCabecalho := pObjeto.Id;
            Result := TT2TiORM.Inserir(Current) > 0;
          end;
        end;
      end;
    finally
      FreeAndNil(FolhaLancamentoDetalheEnumerator);
    end;

  finally
  end;
end;

class function TFolhaLancamentoCabecalhoController.Exclui(pId: Integer): Boolean;
var
  ObjetoLocal: TFolhaLancamentoCabecalhoVO;
begin
  try
    ObjetoLocal := TFolhaLancamentoCabecalhoVO.Create;
    ObjetoLocal.Id := pId;
    Result := TT2TiORM.Excluir(ObjetoLocal);
    TratarRetorno(Result);
  finally
    FreeAndNil(ObjetoLocal)
  end;
end;

class function TFolhaLancamentoCabecalhoController.GetDataSet: TClientDataSet;
begin
  Result := FDataSet;
end;

class procedure TFolhaLancamentoCabecalhoController.SetDataSet(pDataSet: TClientDataSet);
begin
  FDataSet := pDataSet;
end;

class procedure TFolhaLancamentoCabecalhoController.TratarListaRetorno(pListaObjetos: TObjectList<TVO>);
begin
  try
    TratarRetorno<TFolhaLancamentoCabecalhoVO>(TObjectList<TFolhaLancamentoCabecalhoVO>(pListaObjetos));
  finally
    FreeAndNil(pListaObjetos);
  end;
end;

initialization
  Classes.RegisterClass(TFolhaLancamentoCabecalhoController);

finalization
  Classes.UnRegisterClass(TFolhaLancamentoCabecalhoController);

end.
