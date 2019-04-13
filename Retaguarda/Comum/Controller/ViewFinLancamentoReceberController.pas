{*******************************************************************************
Title: T2Ti ERP                                                                 
Description: Controller do lado Cliente relacionado à tabela [VIEW_FIN_LANCAMENTO_RECEBER] 
                                                                                
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
unit ViewFinLancamentoReceberController;

interface

uses
  Classes, Dialogs, SysUtils, DBClient, DB,  Windows, Forms, Controller, Rtti,
  Atributos, VO, Generics.Collections, ViewFinLancamentoReceberVO;

type
  TViewFinLancamentoReceberController = class(TController)
  private
    class var FDataSet: TClientDataSet;
  public
    class procedure Consulta(pFiltro: String; pPagina: String; pConsultaCompleta: Boolean = False);
    class function ConsultaLista(pFiltro: String): TObjectList<TViewFinLancamentoReceberVO>;
    class function ConsultaObjeto(pFiltro: String): TViewFinLancamentoReceberVO;

    class procedure Insere(pObjeto: TViewFinLancamentoReceberVO);
    class function Altera(pObjeto: TViewFinLancamentoReceberVO): Boolean;

    class function GetDataSet: TClientDataSet; override;
    class procedure SetDataSet(pDataSet: TClientDataSet); override;
    class procedure TratarListaRetorno(pListaObjetos: TObjectList<TVO>);
  end;

implementation

uses UDataModule, T2TiORM;

class procedure TViewFinLancamentoReceberController.Consulta(pFiltro: String; pPagina: String; pConsultaCompleta: Boolean);
var
  Retorno: TObjectList<TViewFinLancamentoReceberVO>;
begin
  try
    Retorno := TT2TiORM.Consultar<TViewFinLancamentoReceberVO>(pFiltro, pPagina, pConsultaCompleta);
    TratarRetorno<TViewFinLancamentoReceberVO>(Retorno);
  finally
  end;
end;

class function TViewFinLancamentoReceberController.ConsultaLista(pFiltro: String): TObjectList<TViewFinLancamentoReceberVO>;
begin
  try
    Result := TT2TiORM.Consultar<TViewFinLancamentoReceberVO>(pFiltro, '-1', True);
  finally
  end;
end;

class function TViewFinLancamentoReceberController.ConsultaObjeto(pFiltro: String): TViewFinLancamentoReceberVO;
begin
  try
    Result := TT2TiORM.ConsultarUmObjeto<TViewFinLancamentoReceberVO>(pFiltro, True);
  finally
  end;
end;

class procedure TViewFinLancamentoReceberController.Insere(pObjeto: TViewFinLancamentoReceberVO);
var
  UltimoID: Integer;
begin
  try
    UltimoID := TT2TiORM.Inserir(pObjeto);
    Consulta('ID = ' + IntToStr(UltimoID), '0');
  finally
  end;
end;

class function TViewFinLancamentoReceberController.Altera(pObjeto: TViewFinLancamentoReceberVO): Boolean;
begin
  try
    Result := TT2TiORM.Alterar(pObjeto);
  finally
  end;
end;

class function TViewFinLancamentoReceberController.GetDataSet: TClientDataSet;
begin
  Result := FDataSet;
end;

class procedure TViewFinLancamentoReceberController.SetDataSet(pDataSet: TClientDataSet);
begin
  FDataSet := pDataSet;
end;

class procedure TViewFinLancamentoReceberController.TratarListaRetorno(pListaObjetos: TObjectList<TVO>);
begin
  try
    TratarRetorno<TViewFinLancamentoReceberVO>(TObjectList<TViewFinLancamentoReceberVO>(pListaObjetos));
  finally
    FreeAndNil(pListaObjetos);
  end;
end;

initialization
  Classes.RegisterClass(TViewFinLancamentoReceberController);

finalization
  Classes.UnRegisterClass(TViewFinLancamentoReceberController);

end.
