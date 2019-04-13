{*******************************************************************************
Title: T2Ti ERP                                                                 
Description: Controller do lado Cliente relacionado à tabela [EMPRESA] 
                                                                                
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
           t2ti.com@gmail.com

@author Albert Eije (t2ti.com@gmail.com)
@version 1.0
*******************************************************************************}
unit EmpresaController;

interface

uses
  Classes, Dialogs, SysUtils, DBClient, DB, Windows, Forms, Controller, Rtti, Atributos,
  EmpresaVO, Generics.Collections, VO;


type
  TEmpresaController = class(TController)
  private
    class var FDataSet: TClientDataSet;
  public
    class procedure Consulta(pFiltro: String; pPagina: String; pConsultaCompleta: Boolean = False);
    class function ConsultaObjeto(pFiltro: String): TEmpresaVO;

    class function GetDataSet: TClientDataSet; override;
    class procedure SetDataSet(pDataSet: TClientDataSet); override;
    class procedure TratarListaRetorno(pListaObjetos: TObjectList<TVO>);
  end;

implementation

uses T2TiORM,
    EmpresaEnderecoVO;

class procedure TEmpresaController.Consulta(pFiltro: String; pPagina: String; pConsultaCompleta: Boolean);
var
  Retorno: TObjectList<TEmpresaVO>;
begin
  try
    Retorno := TT2TiORM.Consultar<TEmpresaVO>(pFiltro, pPagina, pConsultaCompleta);
    TratarRetorno<TEmpresaVO>(Retorno);
  finally
  end;
end;

class function TEmpresaController.ConsultaObjeto(pFiltro: String): TEmpresaVO;
var
  EnderecosEnumerator: TEnumerator<TEmpresaEnderecoVO>;
begin
  try
    Result := TT2TiORM.ConsultarUmObjeto<TEmpresaVO>(pFiltro, True);

    // Procura o endereço principal para uso
    EnderecosEnumerator := Result.ListaEmpresaEnderecoVO.GetEnumerator;
    try
      with EnderecosEnumerator do
      begin
        while MoveNext do
        begin
          if Current.Principal = 'S' then
          begin
            Result.EnderecoPrincipal := Current;
          end;
        end;
      end;
    finally
      FreeAndNil(EnderecosEnumerator);
    end;

  finally
  end;
end;

class function TEmpresaController.GetDataSet: TClientDataSet;
begin
  Result := FDataSet;
end;

class procedure TEmpresaController.SetDataSet(pDataSet: TClientDataSet);
begin
  FDataSet := pDataSet;
end;

class procedure TEmpresaController.TratarListaRetorno(pListaObjetos: TObjectList<TVO>);
begin
  try
    TratarRetorno<TEmpresaVO>(TObjectList<TEmpresaVO>(pListaObjetos));
  finally
    FreeAndNil(pListaObjetos);
  end;
end;

initialization
  Classes.RegisterClass(TEmpresaController);

finalization
  Classes.UnRegisterClass(TEmpresaController);

end.

