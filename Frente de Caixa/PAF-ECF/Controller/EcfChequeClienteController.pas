{*******************************************************************************
Title: T2Ti ERP                                                                 
Description: Controller relacionado à tabela [ECF_CHEQUE_CLIENTE] 
                                                                                
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
unit EcfChequeClienteController;

interface

uses
  Classes, SysUtils, DBClient, DB, Windows, Forms, Controller, Rtti, Atributos,
  VO, EcfChequeClienteVO, Generics.Collections;


type
  TEcfChequeClienteController = class(TController)
  private
    class var FDataSet: TClientDataSet;
  public
    class procedure Consulta(pFiltro: String; pPagina: String; pConsultaCompleta: Boolean = False);
    class procedure Insere(pObjeto: TEcfChequeClienteVO);
    class function Altera(pObjeto: TEcfChequeClienteVO): Boolean;
    class function Exclui(pId: Integer): Boolean;
    class function GetDataSet: TClientDataSet; override;
    class procedure SetDataSet(pDataSet: TClientDataSet); override;
    class procedure TratarListaRetorno(pListaObjetos: TObjectList<TVO>);
  end;

implementation

uses T2TiORM;

class procedure TEcfChequeClienteController.Consulta(pFiltro: String; pPagina: String; pConsultaCompleta: Boolean);
var
  Retorno: TObjectList<TEcfChequeClienteVO>;
begin
  try
    Retorno := TT2TiORM.Consultar<TEcfChequeClienteVO>(pFiltro, pPagina, pConsultaCompleta);
    TratarRetorno<TEcfChequeClienteVO>(Retorno);
  finally
  end;
end;

class procedure TEcfChequeClienteController.Insere(pObjeto: TEcfChequeClienteVO);
var
  UltimoID: Integer;
begin
  try
    UltimoID := TT2TiORM.Inserir(pObjeto);
    Consulta('ID = ' + IntToStr(UltimoID), '0');
  finally
  end;
end;

class function TEcfChequeClienteController.Altera(pObjeto: TEcfChequeClienteVO): Boolean;
begin
  try
    Result := TT2TiORM.Alterar(pObjeto);
  finally
  end;
end;

class function TEcfChequeClienteController.Exclui(pId: Integer): Boolean;
var
  ObjetoLocal: TEcfChequeClienteVO;
begin
  try
    ObjetoLocal := TEcfChequeClienteVO.Create;
    ObjetoLocal.Id := pId;
    Result := TT2TiORM.Excluir(ObjetoLocal);
  finally
    FreeAndNil(ObjetoLocal);
  end;
end;

class function TEcfChequeClienteController.GetDataSet: TClientDataSet;
begin
  Result := FDataSet;
end;

class procedure TEcfChequeClienteController.SetDataSet(pDataSet: TClientDataSet);
begin
  FDataSet := pDataSet;
end;

class procedure TEcfChequeClienteController.TratarListaRetorno(pListaObjetos: TObjectList<TVO>);
begin
  try
    TratarRetorno<TEcfChequeClienteVO>(TObjectList<TEcfChequeClienteVO>(pListaObjetos));
  finally
    FreeAndNil(pListaObjetos);
  end;
end;

initialization
  Classes.RegisterClass(TEcfChequeClienteController);

finalization
  Classes.UnRegisterClass(TEcfChequeClienteController);

end.
