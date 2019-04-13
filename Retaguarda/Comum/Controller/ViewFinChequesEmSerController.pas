{*******************************************************************************
Title: T2Ti ERP                                                                 
Description: Controller do lado Cliente relacionado à tabela [VIEW_FIN_CHEQUES_EM_SER] 
                                                                                
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
unit ViewFinChequesEmSerController;

interface

uses
  Classes, Dialogs, SysUtils, DBClient, DB,  Windows, Forms, Controller, Rtti,
  Atributos, VO, Generics.Collections, ViewFinChequesEmSerVO;

type
  TViewFinChequesEmSerController = class(TController)
  private
    class var FDataSet: TClientDataSet;
  public
    class procedure Consulta(pFiltro: String; pPagina: String; pConsultaCompleta: Boolean = False);
    class function ConsultaLista(pFiltro: String): TObjectList<TViewFinChequesEmSerVO>;
    class function ConsultaObjeto(pFiltro: String): TViewFinChequesEmSerVO;

    class procedure Insere(pObjeto: TViewFinChequesEmSerVO);
    class function Altera(pObjeto: TViewFinChequesEmSerVO): Boolean;

    class function GetDataSet: TClientDataSet; override;
    class procedure SetDataSet(pDataSet: TClientDataSet); override;
    class procedure TratarListaRetorno(pListaObjetos: TObjectList<TVO>);
  end;

implementation

uses UDataModule, T2TiORM;

class procedure TViewFinChequesEmSerController.Consulta(pFiltro: String; pPagina: String; pConsultaCompleta: Boolean);
var
  Retorno: TObjectList<TViewFinChequesEmSerVO>;
begin
  try
    Retorno := TT2TiORM.Consultar<TViewFinChequesEmSerVO>(pFiltro, pPagina, pConsultaCompleta);
    TratarRetorno<TViewFinChequesEmSerVO>(Retorno);
  finally
  end;
end;

class function TViewFinChequesEmSerController.ConsultaLista(pFiltro: String): TObjectList<TViewFinChequesEmSerVO>;
begin
  try
    Result := TT2TiORM.Consultar<TViewFinChequesEmSerVO>(pFiltro, '-1', True);
  finally
  end;
end;

class function TViewFinChequesEmSerController.ConsultaObjeto(pFiltro: String): TViewFinChequesEmSerVO;
begin
  try
    Result := TT2TiORM.ConsultarUmObjeto<TViewFinChequesEmSerVO>(pFiltro, True);
  finally
  end;
end;

class procedure TViewFinChequesEmSerController.Insere(pObjeto: TViewFinChequesEmSerVO);
var
  UltimoID: Integer;
begin
  try
    UltimoID := TT2TiORM.Inserir(pObjeto);
    Consulta('ID = ' + IntToStr(UltimoID), '0');
  finally
  end;
end;

class function TViewFinChequesEmSerController.Altera(pObjeto: TViewFinChequesEmSerVO): Boolean;
begin
  try
    Result := TT2TiORM.Alterar(pObjeto);
  finally
  end;
end;

class function TViewFinChequesEmSerController.GetDataSet: TClientDataSet;
begin
  Result := FDataSet;
end;

class procedure TViewFinChequesEmSerController.SetDataSet(pDataSet: TClientDataSet);
begin
  FDataSet := pDataSet;
end;

class procedure TViewFinChequesEmSerController.TratarListaRetorno(pListaObjetos: TObjectList<TVO>);
begin
  try
    TratarRetorno<TViewFinChequesEmSerVO>(TObjectList<TViewFinChequesEmSerVO>(pListaObjetos));
  finally
    FreeAndNil(pListaObjetos);
  end;
end;

initialization
  Classes.RegisterClass(TViewFinChequesEmSerController);

finalization
  Classes.UnRegisterClass(TViewFinChequesEmSerController);

end.
