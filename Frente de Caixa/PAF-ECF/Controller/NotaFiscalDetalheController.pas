{*******************************************************************************
Title: T2Ti ERP                                                                 
Description: Controller relacionado à tabela [NOTA_FISCAL_DETALHE] 
                                                                                
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
unit NotaFiscalDetalheController;

interface

uses
  Classes, SysUtils, DBClient, DB, Windows, Forms, Controller, Rtti, Atributos,
  VO, NotaFiscalDetalheVO, Generics.Collections;


type
  TNotaFiscalDetalheController = class(TController)
  private
    class var FDataSet: TClientDataSet;
  public
    class procedure Consulta(pFiltro: String; pPagina: String; pConsultaCompleta: Boolean = False);
    class procedure Insere(pObjeto: TNotaFiscalDetalheVO);
    class function Altera(pObjeto: TNotaFiscalDetalheVO): Boolean;
    class function Exclui(pId: Integer): Boolean;
    class function GetDataSet: TClientDataSet; override;
    class procedure SetDataSet(pDataSet: TClientDataSet); override;
    class procedure TratarListaRetorno(pListaObjetos: TObjectList<TVO>);
  end;

implementation

uses T2TiORM;

class procedure TNotaFiscalDetalheController.Consulta(pFiltro: String; pPagina: String; pConsultaCompleta: Boolean);
var
  Retorno: TObjectList<TNotaFiscalDetalheVO>;
begin
  try
    Retorno := TT2TiORM.Consultar<TNotaFiscalDetalheVO>(pFiltro, pPagina, pConsultaCompleta);
    TratarRetorno<TNotaFiscalDetalheVO>(Retorno);
  finally
  end;
end;

class procedure TNotaFiscalDetalheController.Insere(pObjeto: TNotaFiscalDetalheVO);
var
  UltimoID: Integer;
begin
  try
    UltimoID := TT2TiORM.Inserir(pObjeto);
    Consulta('ID = ' + IntToStr(UltimoID), '0');
  finally
  end;
end;

class function TNotaFiscalDetalheController.Altera(pObjeto: TNotaFiscalDetalheVO): Boolean;
begin
  try
    Result := TT2TiORM.Alterar(pObjeto);
  finally
  end;
end;

class function TNotaFiscalDetalheController.Exclui(pId: Integer): Boolean;
var
  ObjetoLocal: TNotaFiscalDetalheVO;
begin
  try
    ObjetoLocal := TNotaFiscalDetalheVO.Create;
    ObjetoLocal.Id := pId;
    Result := TT2TiORM.Excluir(ObjetoLocal);
  finally
    FreeAndNil(ObjetoLocal);
  end;
end;

class function TNotaFiscalDetalheController.GetDataSet: TClientDataSet;
begin
  Result := FDataSet;
end;

class procedure TNotaFiscalDetalheController.SetDataSet(pDataSet: TClientDataSet);
begin
  FDataSet := pDataSet;
end;

class procedure TNotaFiscalDetalheController.TratarListaRetorno(pListaObjetos: TObjectList<TVO>);
begin
  try
    TratarRetorno<TNotaFiscalDetalheVO>(TObjectList<TNotaFiscalDetalheVO>(pListaObjetos));
  finally
    FreeAndNil(pListaObjetos);
  end;
end;

initialization
  Classes.RegisterClass(TNotaFiscalDetalheController);

finalization
  Classes.UnRegisterClass(TNotaFiscalDetalheController);

end.
