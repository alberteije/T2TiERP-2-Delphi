{*******************************************************************************
Title: T2Ti ERP                                                                 
Description: Controller relacionado à tabela [ECF_E3] 
                                                                                
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
unit EcfE3Controller;

interface

uses
  Classes, SysUtils, DBClient, DB, Windows, Forms, Controller, Rtti, Atributos,
  VO, EcfE3VO, Generics.Collections;


type
  TEcfE3Controller = class(TController)
  private
    class var FDataSet: TClientDataSet;
  public
    class procedure Consulta(pFiltro: String; pPagina: String; pConsultaCompleta: Boolean = False);
    class function ConsultaObjeto(pFiltro: String): TEcfE3VO;
    class procedure EcfE3(pFiltro: String);
    class procedure Insere(pObjeto: TEcfE3VO);
    class function Altera(pObjeto: TEcfE3VO): Boolean;
    class function Exclui(pId: Integer): Boolean;
    class function GetDataSet: TClientDataSet; override;
    class procedure SetDataSet(pDataSet: TClientDataSet); override;
    class procedure TratarListaRetorno(pListaObjetos: TObjectList<TVO>);
  end;

implementation

uses T2TiORM;

class procedure TEcfE3Controller.Consulta(pFiltro: String; pPagina: String; pConsultaCompleta: Boolean);
var
  Retorno: TObjectList<TEcfE3VO>;
begin
  try
    Retorno := TT2TiORM.Consultar<TEcfE3VO>(pFiltro, pPagina, pConsultaCompleta);
    TratarRetorno<TEcfE3VO>(Retorno);
  finally
  end;
end;

class function TEcfE3Controller.ConsultaObjeto(pFiltro: String): TEcfE3VO;
begin
  try
    Result := TT2TiORM.ConsultarUmObjeto<TEcfE3VO>(pFiltro, True);
  finally
  end;
end;

class procedure TEcfE3Controller.EcfE3(pFiltro: String);
var
  ObjetoLocal: TEcfE3VO;
begin
  try
    ObjetoLocal := TT2TiORM.ConsultarUmObjeto<TEcfE3VO>(pFiltro, True);
    TratarRetorno<TEcfE3VO>(ObjetoLocal);
  finally
  end;
end;

class procedure TEcfE3Controller.Insere(pObjeto: TEcfE3VO);
var
  UltimoID: Integer;
begin
  try
    UltimoID := TT2TiORM.Inserir(pObjeto);
    Consulta('ID = ' + IntToStr(UltimoID), '0');
  finally
  end;
end;

class function TEcfE3Controller.Altera(pObjeto: TEcfE3VO): Boolean;
begin
  try
    Result := TT2TiORM.Alterar(pObjeto);
  finally
  end;
end;

class function TEcfE3Controller.Exclui(pId: Integer): Boolean;
var
  ObjetoLocal: TEcfE3VO;
begin
  try
    ObjetoLocal := TEcfE3VO.Create;
    ObjetoLocal.Id := pId;
    Result := TT2TiORM.Excluir(ObjetoLocal);
  finally
    FreeAndNil(ObjetoLocal);
  end;
end;

class function TEcfE3Controller.GetDataSet: TClientDataSet;
begin
  Result := FDataSet;
end;

class procedure TEcfE3Controller.SetDataSet(pDataSet: TClientDataSet);
begin
  FDataSet := pDataSet;
end;

class procedure TEcfE3Controller.TratarListaRetorno(pListaObjetos: TObjectList<TVO>);
begin
  try
    TratarRetorno<TEcfE3VO>(TObjectList<TEcfE3VO>(pListaObjetos));
  finally
    FreeAndNil(pListaObjetos);
  end;
end;

initialization
  Classes.RegisterClass(TEcfE3Controller);

finalization
  Classes.UnRegisterClass(TEcfE3Controller);

end.
