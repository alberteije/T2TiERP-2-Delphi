{*******************************************************************************
Title: T2Ti ERP                                                                 
Description: Controller do lado Cliente relacionado à tabela [VIEW_TRIBUTACAO_COFINS] 
                                                                                
The MIT License                                                                 
                                                                                
Copyright: Copyright (C) 2014 T2Ti.COM
                                                                                
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
unit ViewTributacaoCofinsController;

interface

uses
  Classes, Dialogs, SysUtils, DBClient, DB, Windows, Forms, Controller, Rtti, Atributos,
  ViewTributacaoCofinsVO, Generics.Collections;


type
  TViewTributacaoCofinsController = class(TController)
  private
    class var FDataSet: TClientDataSet;
  public
    class procedure Consulta(pFiltro: String; pPagina: String; pConsultaCompleta: Boolean = False);
    class function ConsultaLista(pFiltro: String): TObjectList<TViewTributacaoCofinsVO>;
    class function ConsultaObjeto(pFiltro: String): TViewTributacaoCofinsVO;

    class function GetDataSet: TClientDataSet; override;
    class procedure SetDataSet(pDataSet: TClientDataSet); override;
  end;

implementation

uses UDataModule, T2TiORM;

class procedure TViewTributacaoCofinsController.Consulta(pFiltro: String; pPagina: String; pConsultaCompleta: Boolean);
var
  Retorno: TObjectList<TViewTributacaoCofinsVO>;
begin
  try
    Retorno := TT2TiORM.Consultar<TViewTributacaoCofinsVO>(pFiltro, pPagina, pConsultaCompleta);
    TratarRetorno<TViewTributacaoCofinsVO>(Retorno);
  finally
  end;
end;

class function TViewTributacaoCofinsController.ConsultaLista(pFiltro: String): TObjectList<TViewTributacaoCofinsVO>;
begin
  try
    Result := TT2TiORM.Consultar<TViewTributacaoCofinsVO>(pFiltro, '-1', True);
  finally
  end;
end;

class function TViewTributacaoCofinsController.ConsultaObjeto(pFiltro: String): TViewTributacaoCofinsVO;
begin
  try
    Result := TT2TiORM.ConsultarUmObjeto<TViewTributacaoCofinsVO>(pFiltro, True);
  finally
  end;
end;

class function TViewTributacaoCofinsController.GetDataSet: TClientDataSet;
begin
  Result := FDataSet;
end;

class procedure TViewTributacaoCofinsController.SetDataSet(pDataSet: TClientDataSet);
begin
  FDataSet := pDataSet;
end;

initialization
  Classes.RegisterClass(TViewTributacaoCofinsController);

finalization
  Classes.UnRegisterClass(TViewTributacaoCofinsController);

end.
