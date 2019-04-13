{*******************************************************************************
Title: T2Ti ERP                                                                 
Description: Controller do lado Cliente relacionado à tabela [VIEW_TRIBUTACAO_ISS] 
                                                                                
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
unit ViewTributacaoIssController;

interface

uses
  Classes, Dialogs, SysUtils, DBClient, DB, Windows, Forms, Controller, Rtti, Atributos,
  ViewTributacaoIssVO, Generics.Collections;


type
  TViewTributacaoIssController = class(TController)
  private
    class var FDataSet: TClientDataSet;
  public
    class procedure Consulta(pFiltro: String; pPagina: String; pConsultaCompleta: Boolean = False);
    class function ConsultaLista(pFiltro: String): TObjectList<TViewTributacaoIssVO>;
    class function ConsultaObjeto(pFiltro: String): TViewTributacaoIssVO;

    class function GetDataSet: TClientDataSet; override;
    class procedure SetDataSet(pDataSet: TClientDataSet); override;
  end;

implementation

uses UDataModule, T2TiORM;

class procedure TViewTributacaoIssController.Consulta(pFiltro: String; pPagina: String; pConsultaCompleta: Boolean);
var
  Retorno: TObjectList<TViewTributacaoIssVO>;
begin
  try
    Retorno := TT2TiORM.Consultar<TViewTributacaoIssVO>(pFiltro, pPagina, pConsultaCompleta);
    TratarRetorno<TViewTributacaoIssVO>(Retorno);
  finally
  end;
end;

class function TViewTributacaoIssController.ConsultaLista(pFiltro: String): TObjectList<TViewTributacaoIssVO>;
begin
  try
    Result := TT2TiORM.Consultar<TViewTributacaoIssVO>(pFiltro, '-1', True);
  finally
  end;
end;

class function TViewTributacaoIssController.ConsultaObjeto(pFiltro: String): TViewTributacaoIssVO;
begin
  try
    Result := TT2TiORM.ConsultarUmObjeto<TViewTributacaoIssVO>(pFiltro, True);
  finally
  end;
end;

class function TViewTributacaoIssController.GetDataSet: TClientDataSet;
begin
  Result := FDataSet;
end;

class procedure TViewTributacaoIssController.SetDataSet(pDataSet: TClientDataSet);
begin
  FDataSet := pDataSet;
end;

initialization
  Classes.RegisterClass(TViewTributacaoIssController);

finalization
  Classes.UnRegisterClass(TViewTributacaoIssController);

end.
