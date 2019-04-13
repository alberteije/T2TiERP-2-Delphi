{*******************************************************************************
Title: T2Ti ERP                                                                 
Description: Controller do lado Cliente relacionado à tabela [FIN_COBRANCA] 
                                                                                
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
unit FinCobrancaController;

interface

uses
  Classes, Dialogs, SysUtils, DBClient, DB,  Windows, Forms, Controller, Rtti,
  Atributos, VO, Generics.Collections, FinCobrancaVO, FinCobrancaParcelaReceberVO;

type
  TFinCobrancaController = class(TController)
  private
    class var FDataSet: TClientDataSet;
  public
    class procedure Consulta(pFiltro: String; pPagina: String; pConsultaCompleta: Boolean = False);
    class function ConsultaLista(pFiltro: String): TObjectList<TFinCobrancaVO>;
    class function ConsultaObjeto(pFiltro: String): TFinCobrancaVO;

    class procedure Insere(pObjeto: TFinCobrancaVO);
    class function Altera(pObjeto: TFinCobrancaVO): Boolean;

    class function Exclui(pId: Integer): Boolean;

    class function GetDataSet: TClientDataSet; override;
    class procedure SetDataSet(pDataSet: TClientDataSet); override;
    class procedure TratarListaRetorno(pListaObjetos: TObjectList<TVO>);
  end;

implementation

uses UDataModule, T2TiORM;

class procedure TFinCobrancaController.Consulta(pFiltro: String; pPagina: String; pConsultaCompleta: Boolean);
var
  Retorno: TObjectList<TFinCobrancaVO>;
begin
  try
    Retorno := TT2TiORM.Consultar<TFinCobrancaVO>(pFiltro, pPagina, pConsultaCompleta);
    TratarRetorno<TFinCobrancaVO>(Retorno);
  finally
  end;
end;

class function TFinCobrancaController.ConsultaLista(pFiltro: String): TObjectList<TFinCobrancaVO>;
begin
  try
    Result := TT2TiORM.Consultar<TFinCobrancaVO>(pFiltro, '-1', True);
  finally
  end;
end;

class function TFinCobrancaController.ConsultaObjeto(pFiltro: String): TFinCobrancaVO;
begin
  try
    Result := TT2TiORM.ConsultarUmObjeto<TFinCobrancaVO>(pFiltro, True);
    Result.ClienteNome := Result.ClienteVO.Nome;
  finally
  end;
end;

class procedure TFinCobrancaController.Insere(pObjeto: TFinCobrancaVO);
var
  UltimoID: Integer;
  ParcelaReceber: TFinCobrancaParcelaReceberVO;
  ParcelaReceberEnumerator: TEnumerator<TFinCobrancaParcelaReceberVO>;
begin
  try
    UltimoID := TT2TiORM.Inserir(pObjeto);

    // Parcela Receber
    ParcelaReceberEnumerator := pObjeto.ListaCobrancaParcelaReceberVO.GetEnumerator;
    try
      with ParcelaReceberEnumerator do
      begin
        while MoveNext do
        begin
          ParcelaReceber := Current;
          ParcelaReceber.IdFinCobranca := UltimoID;
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

class function TFinCobrancaController.Altera(pObjeto: TFinCobrancaVO): Boolean;
var
  ParcelaReceberEnumerator: TEnumerator<TFinCobrancaParcelaReceberVO>;
begin
  try
    Result := TT2TiORM.Alterar(pObjeto);

    // Parcela Receber
    try
      ParcelaReceberEnumerator := pObjeto.ListaCobrancaParcelaReceberVO.GetEnumerator;
      with ParcelaReceberEnumerator do
      begin
        while MoveNext do
        begin
          if Current.Id > 0 then
            Result := TT2TiORM.Alterar(Current)
          else
          begin
            Current.IdFinCobranca := pObjeto.Id;
            Result := TT2TiORM.Inserir(Current) > 0;
          end;
        end;
      end;
    finally
      FreeAndNil(ParcelaReceberEnumerator);
    end;

  finally
  end;
end;

class function TFinCobrancaController.Exclui(pId: Integer): Boolean;
var
  ObjetoLocal: TFinCobrancaVO;
begin
  try
    ObjetoLocal := TFinCobrancaVO.Create;
    ObjetoLocal.Id := pId;
    Result := TT2TiORM.Excluir(ObjetoLocal);
    TratarRetorno(Result);
  finally
    FreeAndNil(ObjetoLocal)
  end;
end;

class function TFinCobrancaController.GetDataSet: TClientDataSet;
begin
  Result := FDataSet;
end;

class procedure TFinCobrancaController.SetDataSet(pDataSet: TClientDataSet);
begin
  FDataSet := pDataSet;
end;

class procedure TFinCobrancaController.TratarListaRetorno(pListaObjetos: TObjectList<TVO>);
begin
  try
    TratarRetorno<TFinCobrancaVO>(TObjectList<TFinCobrancaVO>(pListaObjetos));
  finally
    FreeAndNil(pListaObjetos);
  end;
end;

initialization
  Classes.RegisterClass(TFinCobrancaController);

finalization
  Classes.UnRegisterClass(TFinCobrancaController);

end.
