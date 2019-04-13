{*******************************************************************************
Title: T2Ti ERP                                                                 
Description: Controller relacionado à tabela [NOTA_FISCAL_CABECALHO] 
                                                                                
The MIT License                                                                 
                                                                                
Copyright: Copyright (C) 2010 T2Ti.COM                                          
                                                                                
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
t2ti.com@gmail.com</p>

Albert Eije (T2Ti.COM)
@version 2.0
*******************************************************************************}
unit NotaFiscalCabecalhoController;

interface

uses
  Classes, SysUtils, DBClient, DB, Windows, Forms, Controller, Rtti, Atributos,
  VO, NotaFiscalCabecalhoVO, NotaFiscalDetalheVO, Generics.Collections;


type
  TNotaFiscalCabecalhoController = class(TController)
  private
    class var FDataSet: TClientDataSet;
    class function Inserir(pObjeto: TNotaFiscalCabecalhoVO): Integer;
  public
    class procedure Consulta(pFiltro: String; pPagina: String; pConsultaCompleta: Boolean = False);
    class function ConsultaLista(pFiltro: String): TObjectList<TNotaFiscalCabecalhoVO>;
    class function ConsultaObjeto(pFiltro: String): TNotaFiscalCabecalhoVO;
    class procedure Insere(pObjeto: TNotaFiscalCabecalhoVO);
    class procedure InsereObjeto(pObjeto: TNotaFiscalCabecalhoVO);
    class function Altera(pObjeto: TNotaFiscalCabecalhoVO): Boolean;
    class function Exclui(pId: Integer): Boolean;
    class function GetDataSet: TClientDataSet; override;
    class procedure SetDataSet(pDataSet: TClientDataSet); override;
    class procedure TratarListaRetorno(pListaObjetos: TObjectList<TVO>);
  end;

implementation

uses T2TiORM;

class procedure TNotaFiscalCabecalhoController.Consulta(pFiltro: String; pPagina: String; pConsultaCompleta: Boolean);
var
  Retorno: TObjectList<TNotaFiscalCabecalhoVO>;
begin
  try
    Retorno := TT2TiORM.Consultar<TNotaFiscalCabecalhoVO>(pFiltro, pPagina, pConsultaCompleta);
    TratarRetorno<TNotaFiscalCabecalhoVO>(Retorno);
  finally
  end;
end;

class function TNotaFiscalCabecalhoController.ConsultaLista(pFiltro: String): TObjectList<TNotaFiscalCabecalhoVO>;
begin
  try
    Result := TT2TiORM.Consultar<TNotaFiscalCabecalhoVO>(pFiltro, '-1', True);
  finally
  end;
end;

class function TNotaFiscalCabecalhoController.ConsultaObjeto(pFiltro: String): TNotaFiscalCabecalhoVO;
begin
  try
    Result := TT2TiORM.ConsultarUmObjeto<TNotaFiscalCabecalhoVO>(pFiltro, True);
  finally
  end;
end;

class procedure TNotaFiscalCabecalhoController.Insere(pObjeto: TNotaFiscalCabecalhoVO);
var
  UltimoID: Integer;
begin
  try
    UltimoID := Inserir(pObjeto);
    Consulta('ID = ' + IntToStr(UltimoID), '0');
  finally
  end;
end;

class procedure TNotaFiscalCabecalhoController.InsereObjeto(pObjeto: TNotaFiscalCabecalhoVO);
var
  UltimoID: Integer;
begin
  try
    UltimoID := Inserir(pObjeto);
    TratarRetorno<TNotaFiscalCabecalhoVO>(ConsultaObjeto('ID=' + IntToStr(UltimoID)));
  finally
  end;
end;

class function TNotaFiscalCabecalhoController.Inserir(pObjeto: TNotaFiscalCabecalhoVO): Integer;
var
  Detalhe: TNotaFiscalDetalheVO;
  DetalheEnumerator: TEnumerator<TNotaFiscalDetalheVO>;
begin
  try
    Result := TT2TiORM.Inserir(pObjeto);

    // Detalhes
    DetalheEnumerator := pObjeto.ListaNotaFiscalDetalheVO.GetEnumerator;
    try
      with DetalheEnumerator do
      begin
        while MoveNext do
        begin
          Detalhe := Current;
          Detalhe.IdNfCabecalho := Result;
          TT2TiORM.Inserir(Detalhe);
        end;
      end;
    finally
      FreeAndNil(DetalheEnumerator);
    end;

  finally
  end;
end;

class function TNotaFiscalCabecalhoController.Altera(pObjeto: TNotaFiscalCabecalhoVO): Boolean;
begin
  try
    Result := TT2TiORM.Alterar(pObjeto);
  finally
  end;
end;

class function TNotaFiscalCabecalhoController.Exclui(pId: Integer): Boolean;
var
  ObjetoLocal: TNotaFiscalCabecalhoVO;
begin
  try
    ObjetoLocal := TNotaFiscalCabecalhoVO.Create;
    ObjetoLocal.Id := pId;
    Result := TT2TiORM.Excluir(ObjetoLocal);
  finally
    FreeAndNil(ObjetoLocal);
  end;
end;

class function TNotaFiscalCabecalhoController.GetDataSet: TClientDataSet;
begin
  Result := FDataSet;
end;

class procedure TNotaFiscalCabecalhoController.SetDataSet(pDataSet: TClientDataSet);
begin
  FDataSet := pDataSet;
end;

class procedure TNotaFiscalCabecalhoController.TratarListaRetorno(pListaObjetos: TObjectList<TVO>);
begin
  try
    TratarRetorno<TNotaFiscalCabecalhoVO>(TObjectList<TNotaFiscalCabecalhoVO>(pListaObjetos));
  finally
    FreeAndNil(pListaObjetos);
  end;
end;

initialization
  Classes.RegisterClass(TNotaFiscalCabecalhoController);

finalization
  Classes.UnRegisterClass(TNotaFiscalCabecalhoController);

end.
