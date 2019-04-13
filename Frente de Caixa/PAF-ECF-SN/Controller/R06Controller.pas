{*******************************************************************************
Title: T2Ti ERP                                                                 
Description: Controller relacionado à tabela [R06] 
                                                                                
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
unit R06Controller;

interface

uses
  Classes, SysUtils, DBClient, DB, Windows, Forms, Controller, Rtti, Atributos,
  VO, R06VO, Generics.Collections, Biblioteca;


type
  TR06Controller = class(TController)
  private
    class var FDataSet: TClientDataSet;
    class function Inserir(pObjeto: TR06VO): Integer;
  public
    class procedure Consulta(pFiltro: String; pPagina: String; pConsultaCompleta: Boolean = False);
    class function ConsultaLista(pFiltro: String): TObjectList<TR06VO>;
    class function ConsultaObjeto(pFiltro: String): TR06VO;
    class procedure Insere(pObjeto: TR06VO);
    class procedure InsereObjeto(pObjeto: TR06VO);
    class function Altera(pObjeto: TR06VO): Boolean;
    class function Exclui(pId: Integer): Boolean;
    class function GetDataSet: TClientDataSet; override;
    class procedure SetDataSet(pDataSet: TClientDataSet); override;
    class procedure TratarListaRetorno(pListaObjetos: TObjectList<TVO>);
  end;

implementation

uses T2TiORM;

class procedure TR06Controller.Consulta(pFiltro: String; pPagina: String; pConsultaCompleta: Boolean);
var
  Retorno: TObjectList<TR06VO>;
begin
  try
    Retorno := TT2TiORM.Consultar<TR06VO>(pFiltro, pPagina, pConsultaCompleta);
    TratarRetorno<TR06VO>(Retorno);
  finally
  end;
end;

class function TR06Controller.ConsultaLista(pFiltro: String): TObjectList<TR06VO>;
begin
  try
    Result := TT2TiORM.Consultar<TR06VO>(pFiltro, '-1', True);
  finally
  end;
end;

class function TR06Controller.ConsultaObjeto(pFiltro: String): TR06VO;
begin
  try
    Result := TT2TiORM.ConsultarUmObjeto<TR06VO>(pFiltro, True);
  finally
  end;
end;

class procedure TR06Controller.Insere(pObjeto: TR06VO);
var
  UltimoID: Integer;
begin
  try
    UltimoID := Inserir(pObjeto);
    Consulta('ID = ' + IntToStr(UltimoID), '0');
  finally
  end;
end;

class procedure TR06Controller.InsereObjeto(pObjeto: TR06VO);
var
  UltimoID: Integer;
begin
  try
    UltimoID := Inserir(pObjeto);
    TratarRetorno<TR06VO>(ConsultaObjeto('ID=' + IntToStr(UltimoID)));
  finally
  end;
end;

class function TR06Controller.Inserir(pObjeto: TR06VO): Integer;
begin
  try
    FormatSettings.DecimalSeparator := '.';
    pObjeto.HashRegistro := '0';
    pObjeto.HashRegistro := MD5String(pObjeto.ToJSONString);
    Result := TT2TiORM.Inserir(pObjeto);
  finally
    FormatSettings.DecimalSeparator := ',';
  end;
end;

class function TR06Controller.Altera(pObjeto: TR06VO): Boolean;
begin
  try
    Result := TT2TiORM.Alterar(pObjeto);
  finally
  end;
end;

class function TR06Controller.Exclui(pId: Integer): Boolean;
var
  ObjetoLocal: TR06VO;
begin
  try
    ObjetoLocal := TR06VO.Create;
    ObjetoLocal.Id := pId;
    Result := TT2TiORM.Excluir(ObjetoLocal);
  finally
    FreeAndNil(ObjetoLocal);
  end;
end;

class function TR06Controller.GetDataSet: TClientDataSet;
begin
  Result := FDataSet;
end;

class procedure TR06Controller.SetDataSet(pDataSet: TClientDataSet);
begin
  FDataSet := pDataSet;
end;

class procedure TR06Controller.TratarListaRetorno(pListaObjetos: TObjectList<TVO>);
begin
  try
    TratarRetorno<TR06VO>(TObjectList<TR06VO>(pListaObjetos));
  finally
    FreeAndNil(pListaObjetos);
  end;
end;

initialization
  Classes.RegisterClass(TR06Controller);

finalization
  Classes.UnRegisterClass(TR06Controller);

end.
