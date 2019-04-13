{*******************************************************************************
Title: T2Ti ERP                                                                 
Description: Controller do lado Cliente relacionado à tabela [USUARIO] 
                                                                                
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
unit UsuarioController;

interface

uses
  Classes, FMX.Dialogs, SysUtils, DBClient, DB, Biblioteca,
  Windows, FMX.Forms, Controller, Rtti, Atributos, UsuarioVO, Generics.Collections;

type
  TUsuarioController = class(TController)
  private
    class var FDataSet: TClientDataSet;
  public
    class procedure Usuario(pLogin, pSenha: String);
    class procedure Consulta(pFiltro: String; pPagina: String; pConsultaCompleta: Boolean = False);
    class function GetDataSet: TClientDataSet; override;
    class procedure SetDataSet(pDataSet: TClientDataSet); override;
    class function CriptografarLoginSenha(pLogin, pSenha: string): string;
  end;

implementation

class procedure TUsuarioController.Consulta(pFiltro: String; pPagina: String; pConsultaCompleta: Boolean);
var
  Retorno: TObjectList<TUsuarioVO>;
begin
  try
//    Retorno := TT2TiORM.Consultar<TUsuarioVO>(pFiltro, pPagina, pConsultaCompleta);
    TratarRetorno<TUsuarioVO>(Retorno);
  finally
  end;
end;

class procedure TUsuarioController.Usuario(pLogin, pSenha: String);
var
  Filtro: String;
  ObjetoLocal: TUsuarioVO;
begin
  try
    Filtro := 'LOGIN = '+QuotedStr(pLogin)+' AND SENHA = '+QuotedStr(CriptografarLoginSenha(pLogin, pSenha));
//    ObjetoLocal := TT2TiORM.ConsultarUmObjeto<TUsuarioVO>(Filtro, True);
    //if Assigned(ObjetoLocal) then
      TratarRetorno<TUsuarioVO>(ObjetoLocal);
  finally
  end;
end;

class function TUsuarioController.GetDataSet: TClientDataSet;
begin
  Result := FDataSet;
end;

class procedure TUsuarioController.SetDataSet(pDataSet: TClientDataSet);
begin
  FDataSet := pDataSet;
end;

class function TUsuarioController.CriptografarLoginSenha(pLogin, pSenha: string): string;
begin
  Result := MD5String(pLogin+pSenha);
end;

initialization
  Classes.RegisterClass(TUsuarioController);

finalization
  Classes.UnRegisterClass(TUsuarioController);

end.




