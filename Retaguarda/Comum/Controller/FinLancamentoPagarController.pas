{*******************************************************************************
Title: T2Ti ERP                                                                 
Description: Controller do lado Cliente relacionado à tabela [FIN_LANCAMENTO_PAGAR] 
                                                                                
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
unit FinLancamentoPagarController;

interface

uses
  Classes, Dialogs, SysUtils, DBClient, DB,  Windows, Forms, Controller, Rtti,
  Atributos, VO, Generics.Collections, FinLancamentoPagarVO, FinParcelaPagarVO,
  FinLctoPagarNtFinanceiraVO;

type
  TFinLancamentoPagarController = class(TController)
  private
    class var FDataSet: TClientDataSet;
  public
    class procedure Consulta(pFiltro: String; pPagina: String; pConsultaCompleta: Boolean = False);
    class function ConsultaLista(pFiltro: String): TObjectList<TFinLancamentoPagarVO>;
    class function ConsultaObjeto(pFiltro: String): TFinLancamentoPagarVO;

    class procedure Insere(pObjeto: TFinLancamentoPagarVO);
    class function Altera(pObjeto: TFinLancamentoPagarVO): Boolean;

    class function Exclui(pId: Integer): Boolean;

    class function GetDataSet: TClientDataSet; override;
    class procedure SetDataSet(pDataSet: TClientDataSet); override;
    class procedure TratarListaRetorno(pListaObjetos: TObjectList<TVO>);
  end;

implementation

uses UDataModule, T2TiORM;

class procedure TFinLancamentoPagarController.Consulta(pFiltro: String; pPagina: String; pConsultaCompleta: Boolean);
var
  Retorno: TObjectList<TFinLancamentoPagarVO>;
begin
  try
    Retorno := TT2TiORM.Consultar<TFinLancamentoPagarVO>(pFiltro, pPagina, pConsultaCompleta);
    TratarRetorno<TFinLancamentoPagarVO>(Retorno);
  finally
  end;
end;

class function TFinLancamentoPagarController.ConsultaLista(pFiltro: String): TObjectList<TFinLancamentoPagarVO>;
begin
  try
    Result := TT2TiORM.Consultar<TFinLancamentoPagarVO>(pFiltro, '-1', True);
  finally
  end;
end;

class function TFinLancamentoPagarController.ConsultaObjeto(pFiltro: String): TFinLancamentoPagarVO;
begin
  try
    Result := TT2TiORM.ConsultarUmObjeto<TFinLancamentoPagarVO>(pFiltro, True);
    Result.FornecedorNome := Result.FornecedorVO.Nome;
    Result.DocumentoOrigemSigla := Result.DocumentoOrigemVO.SiglaDocumento;
  finally
  end;
end;

class procedure TFinLancamentoPagarController.Insere(pObjeto: TFinLancamentoPagarVO);
var
  UltimoID:Integer;
  ParcelaPagar: TFinParcelaPagarVO;
  ParcelaPagarEnumerator: TEnumerator<TFinParcelaPagarVO>;
  LancamentoNaturezaFinanceira: TFinLctoPagarNtFinanceiraVO;
  LancamentoNaturezaFinanceiraEnumerator: TEnumerator<TFinLctoPagarNtFinanceiraVO>;
begin
  try
    UltimoID := TT2TiORM.Inserir(pObjeto);

    // Parcela Pagar
    ParcelaPagarEnumerator := pObjeto.ListaParcelaPagarVO.GetEnumerator;
    try
      with ParcelaPagarEnumerator do
      begin
        while MoveNext do
        begin
          ParcelaPagar := Current;
          ParcelaPagar.IdFinLancamentoPagar := UltimoID;
          TT2TiORM.Inserir(ParcelaPagar);
        end;
      end;
    finally
      ParcelaPagarEnumerator.Free;
    end;


    // Natureza Financeira
    LancamentoNaturezaFinanceiraEnumerator := pObjeto.ListaLancPagarNatFinanceiraVO.GetEnumerator;
    try
      with LancamentoNaturezaFinanceiraEnumerator do
      begin
        while MoveNext do
        begin
          LancamentoNaturezaFinanceira := Current;
          LancamentoNaturezaFinanceira.IdFinLancamentoPagar := UltimoID;
          TT2TiORM.Inserir(LancamentoNaturezaFinanceira);
        end;
      end;
    finally
      LancamentoNaturezaFinanceiraEnumerator.Free;
    end;


    Consulta('ID = ' + IntToStr(UltimoID), '0');
  finally
  end;
end;

class function TFinLancamentoPagarController.Altera(pObjeto: TFinLancamentoPagarVO): Boolean;
var
  ParcelaPagarEnumerator: TEnumerator<TFinParcelaPagarVO>;
  LancamentoNaturezaFinanceiraEnumerator: TEnumerator<TFinLctoPagarNtFinanceiraVO>;
begin
  try
    Result := TT2TiORM.Alterar(pObjeto);

    // Parcela Pagar
    try
      ParcelaPagarEnumerator := pObjeto.ListaParcelaPagarVO.GetEnumerator;
      with ParcelaPagarEnumerator do
      begin
        while MoveNext do
        begin
          if Current.Id > 0 then
            Result := TT2TiORM.Alterar(Current)
          else
          begin
            Current.IdFinLancamentoPagar := pObjeto.Id;
            Result := TT2TiORM.Inserir(Current) > 0;
          end;
        end;
      end;
    finally
      FreeAndNil(ParcelaPagarEnumerator);
    end;

    // Natureza Financeira
    try
      LancamentoNaturezaFinanceiraEnumerator := pObjeto.ListaLancPagarNatFinanceiraVO.GetEnumerator;
      with LancamentoNaturezaFinanceiraEnumerator do
      begin
        while MoveNext do
        begin
          if Current.Id > 0 then
            Result := TT2TiORM.Alterar(Current)
          else
          begin
            Current.IdFinLancamentoPagar := pObjeto.Id;
            Result := TT2TiORM.Inserir(Current) > 0;
          end;
        end;
      end;
    finally
      FreeAndNil(LancamentoNaturezaFinanceiraEnumerator);
    end;

  finally
  end;
end;

class function TFinLancamentoPagarController.Exclui(pId: Integer): Boolean;
var
  ObjetoLocal: TFinLancamentoPagarVO;
begin
  try
    ObjetoLocal := TFinLancamentoPagarVO.Create;
    ObjetoLocal.Id := pId;
    Result := TT2TiORM.Excluir(ObjetoLocal);
    TratarRetorno(Result);
  finally
    FreeAndNil(ObjetoLocal)
  end;
end;

class function TFinLancamentoPagarController.GetDataSet: TClientDataSet;
begin
  Result := FDataSet;
end;

class procedure TFinLancamentoPagarController.SetDataSet(pDataSet: TClientDataSet);
begin
  FDataSet := pDataSet;
end;

class procedure TFinLancamentoPagarController.TratarListaRetorno(pListaObjetos: TObjectList<TVO>);
begin
  try
    TratarRetorno<TFinLancamentoPagarVO>(TObjectList<TFinLancamentoPagarVO>(pListaObjetos));
  finally
    FreeAndNil(pListaObjetos);
  end;
end;

initialization
  Classes.RegisterClass(TFinLancamentoPagarController);

finalization
  Classes.UnRegisterClass(TFinLancamentoPagarController);

end.
