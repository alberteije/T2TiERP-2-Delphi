{*******************************************************************************
Title: T2Ti ERP                                                                 
Description: Controller do lado Fornecedor relacionado à tabela [VIEW_PESSOA_FORNECEDOR] 
                                                                                
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
unit ViewPessoaFornecedorController;

interface

uses
  Classes, Dialogs, SysUtils, DBClient, DB, Windows, Forms, Controller, Rtti, Atributos,
  ViewPessoaFornecedorVO, Generics.Collections, VO;


type
  TViewPessoaFornecedorController = class(TController)
  private
    class var FDataSet: TClientDataSet;
  public
    class procedure Consulta(pFiltro: String; pPagina: String; pConsultaCompleta: Boolean = False);
    class function ConsultaLista(pFiltro: String): TObjectList<TViewPessoaFornecedorVO>;
    class function ConsultaObjeto(pFiltro: String): TViewPessoaFornecedorVO;

    class function GetDataSet: TClientDataSet; override;
    class procedure SetDataSet(pDataSet: TClientDataSet); override;
    class procedure TratarListaRetorno(pListaObjetos: TObjectList<TVO>);
  end;

implementation

uses UDataModule, T2TiORM;

class procedure TViewPessoaFornecedorController.Consulta(pFiltro: String; pPagina: String; pConsultaCompleta: Boolean);
var
  Retorno: TObjectList<TViewPessoaFornecedorVO>;
begin
  try
    Retorno := TT2TiORM.Consultar<TViewPessoaFornecedorVO>(pFiltro, pPagina, pConsultaCompleta);
    TratarRetorno<TViewPessoaFornecedorVO>(Retorno);
  finally
  end;
end;

class function TViewPessoaFornecedorController.ConsultaLista(pFiltro: String): TObjectList<TViewPessoaFornecedorVO>;
begin
  try
    Result := TT2TiORM.Consultar<TViewPessoaFornecedorVO>(pFiltro, '-1', True);
  finally
  end;
end;

class function TViewPessoaFornecedorController.ConsultaObjeto(pFiltro: String): TViewPessoaFornecedorVO;
begin
  try
    Result := TT2TiORM.ConsultarUmObjeto<TViewPessoaFornecedorVO>(pFiltro, True);
  finally
  end;
end;

class function TViewPessoaFornecedorController.GetDataSet: TClientDataSet;
begin
  Result := FDataSet;
end;

class procedure TViewPessoaFornecedorController.SetDataSet(pDataSet: TClientDataSet);
begin
  FDataSet := pDataSet;
end;

class procedure TViewPessoaFornecedorController.TratarListaRetorno(pListaObjetos: TObjectList<TVO>);
begin
  try
    TratarRetorno<TViewPessoaFornecedorVO>(TObjectList<TViewPessoaFornecedorVO>(pListaObjetos));
  finally
    FreeAndNil(pListaObjetos);
  end;
end;

initialization
  Classes.RegisterClass(TViewPessoaFornecedorController);

finalization
  Classes.UnRegisterClass(TViewPessoaFornecedorController);

end.
