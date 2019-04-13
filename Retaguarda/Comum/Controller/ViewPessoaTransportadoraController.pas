{*******************************************************************************
Title: T2Ti ERP                                                                 
Description: Controller do lado Transportadora relacionado à tabela [VIEW_PESSOA_TRANSPORTADORA] 
                                                                                
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
unit ViewPessoaTransportadoraController;

interface

uses
  Classes, Dialogs, SysUtils, DBClient, DB, Windows, Forms, Controller, Rtti, Atributos,
  ViewPessoaTransportadoraVO, Generics.Collections;


type
  TViewPessoaTransportadoraController = class(TController)
  private
    class var FDataSet: TClientDataSet;
  public
    class procedure Consulta(pFiltro: String; pPagina: String; pConsultaCompleta: Boolean = False);
    class function ConsultaLista(pFiltro: String): TObjectList<TViewPessoaTransportadoraVO>;
    class function ConsultaObjeto(pFiltro: String): TViewPessoaTransportadoraVO;

    class function GetDataSet: TClientDataSet; override;
    class procedure SetDataSet(pDataSet: TClientDataSet); override;
  end;

implementation

uses UDataModule, T2TiORM;

class procedure TViewPessoaTransportadoraController.Consulta(pFiltro: String; pPagina: String; pConsultaCompleta: Boolean);
var
  Retorno: TObjectList<TViewPessoaTransportadoraVO>;
begin
  try
    Retorno := TT2TiORM.Consultar<TViewPessoaTransportadoraVO>(pFiltro, pPagina, pConsultaCompleta);
    TratarRetorno<TViewPessoaTransportadoraVO>(Retorno);
  finally
  end;
end;

class function TViewPessoaTransportadoraController.ConsultaLista(pFiltro: String): TObjectList<TViewPessoaTransportadoraVO>;
begin
  try
    Result := TT2TiORM.Consultar<TViewPessoaTransportadoraVO>(pFiltro, '-1', True);
  finally
  end;
end;

class function TViewPessoaTransportadoraController.ConsultaObjeto(pFiltro: String): TViewPessoaTransportadoraVO;
begin
  try
    Result := TT2TiORM.ConsultarUmObjeto<TViewPessoaTransportadoraVO>(pFiltro, True);
  finally
  end;
end;

class function TViewPessoaTransportadoraController.GetDataSet: TClientDataSet;
begin
  Result := FDataSet;
end;

class procedure TViewPessoaTransportadoraController.SetDataSet(pDataSet: TClientDataSet);
begin
  FDataSet := pDataSet;
end;

initialization
  Classes.RegisterClass(TViewPessoaTransportadoraController);

finalization
  Classes.UnRegisterClass(TViewPessoaTransportadoraController);

end.
