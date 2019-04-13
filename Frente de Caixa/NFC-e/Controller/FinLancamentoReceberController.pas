{*******************************************************************************
Title: T2Ti ERP                                                                 
Description: Controller do lado Cliente relacionado à tabela [FIN_LANCAMENTO_RECEBER] 
                                                                                
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
unit FinLancamentoReceberController;

interface

uses
  Classes, Dialogs, SysUtils, DBClient, DB,  Windows, Forms, Controller, Rtti,
  Atributos, VO, Generics.Collections, FinLancamentoReceberVO, FinParcelaReceberVO;

type
  TFinLancamentoReceberController = class(TController)
  private
    class var FDataSet: TClientDataSet;
  public
    class procedure Consulta(pFiltro: String; pPagina: String; pConsultaCompleta: Boolean = False);
    class function ConsultaLista(pFiltro: String): TObjectList<TFinLancamentoReceberVO>;
    class function ConsultaObjeto(pFiltro: String): TFinLancamentoReceberVO;

    class procedure Insere(pObjeto: TFinLancamentoReceberVO);
    class function Altera(pObjeto: TFinLancamentoReceberVO): Boolean;

    class function Exclui(pId: Integer): Boolean;

    class function GetDataSet: TClientDataSet; override;
    class procedure SetDataSet(pDataSet: TClientDataSet); override;
    class procedure TratarListaRetorno(pListaObjetos: TObjectList<TVO>);
  end;

implementation

uses UDataModule, T2TiORM;

class procedure TFinLancamentoReceberController.Consulta(pFiltro: String; pPagina: String; pConsultaCompleta: Boolean);
var
  Retorno: TObjectList<TFinLancamentoReceberVO>;
begin
  try
    Retorno := TT2TiORM.Consultar<TFinLancamentoReceberVO>(pFiltro, pPagina, pConsultaCompleta);
    TratarRetorno<TFinLancamentoReceberVO>(Retorno);
  finally
  end;
end;

class function TFinLancamentoReceberController.ConsultaLista(pFiltro: String): TObjectList<TFinLancamentoReceberVO>;
begin
  try
    Result := TT2TiORM.Consultar<TFinLancamentoReceberVO>(pFiltro, '-1', True);
  finally
  end;
end;

class function TFinLancamentoReceberController.ConsultaObjeto(pFiltro: String): TFinLancamentoReceberVO;
begin
  try
    Result := TT2TiORM.ConsultarUmObjeto<TFinLancamentoReceberVO>(pFiltro, True);
  finally
  end;
end;

class procedure TFinLancamentoReceberController.Insere(pObjeto: TFinLancamentoReceberVO);
var
  UltimoID: Integer;
  ParcelaReceber: TFinParcelaReceberVO;
  ParcelaReceberEnumerator: TEnumerator<TFinParcelaReceberVO>;
begin
  try
    UltimoID := TT2TiORM.Inserir(pObjeto);

    // Parcela Receber
    ParcelaReceberEnumerator := pObjeto.ListaParcelaReceberVO.GetEnumerator;
    try
      with ParcelaReceberEnumerator do
      begin
        while MoveNext do
        begin
          ParcelaReceber := Current;
          ParcelaReceber.IdFinLancamentoReceber := UltimoID;
          TT2TiORM.Inserir(ParcelaReceber);
        end;
      end;
    finally
      ParcelaReceberEnumerator.Free;
    end;

    Consulta('ID = ' + IntToStr(UltimoID), '0');
  finally
  end;
end;

class function TFinLancamentoReceberController.Altera(pObjeto: TFinLancamentoReceberVO): Boolean;
begin
  try
    Result := TT2TiORM.Alterar(pObjeto);
  finally
  end;
end;

class function TFinLancamentoReceberController.Exclui(pId: Integer): Boolean;
var
  ObjetoLocal: TFinLancamentoReceberVO;
begin
  try
    ObjetoLocal := TFinLancamentoReceberVO.Create;
    ObjetoLocal.Id := pId;
    Result := TT2TiORM.Excluir(ObjetoLocal);
    TratarRetorno(Result);
  finally
    FreeAndNil(ObjetoLocal)
  end;
end;

class function TFinLancamentoReceberController.GetDataSet: TClientDataSet;
begin
  Result := FDataSet;
end;

class procedure TFinLancamentoReceberController.SetDataSet(pDataSet: TClientDataSet);
begin
  FDataSet := pDataSet;
end;

class procedure TFinLancamentoReceberController.TratarListaRetorno(pListaObjetos: TObjectList<TVO>);
begin
  try
    TratarRetorno<TFinLancamentoReceberVO>(TObjectList<TFinLancamentoReceberVO>(pListaObjetos));
  finally
    FreeAndNil(pListaObjetos);
  end;
end;

initialization
  Classes.RegisterClass(TFinLancamentoReceberController);

finalization
  Classes.UnRegisterClass(TFinLancamentoReceberController);

end.
