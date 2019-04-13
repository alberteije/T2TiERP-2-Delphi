{*******************************************************************************
Title: T2Ti ERP                                                                 
Description: Controller do lado Cliente relacionado à tabela [VIEW_PESSOA_COLABORADOR] 
                                                                                
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
unit ViewPessoaColaboradorController;

interface

uses
  Classes, Dialogs, SysUtils, DBClient, DB,  Windows, Forms, Controller, Rtti,
  Atributos, VO, Generics.Collections, ViewPessoaColaboradorVO;

type
  TViewPessoaColaboradorController = class(TController)
  private
    class var FDataSet: TClientDataSet;
  public
    class procedure Consulta(pFiltro: String; pPagina: String; pConsultaCompleta: Boolean = False);
    class function ConsultaLista(pFiltro: String): TObjectList<TViewPessoaColaboradorVO>;
    class function ConsultaObjeto(pFiltro: String): TViewPessoaColaboradorVO;

    class procedure Insere(pObjeto: TViewPessoaColaboradorVO);
    class function Altera(pObjeto: TViewPessoaColaboradorVO): Boolean;

    class function Exclui(pId: Integer): Boolean;

    class function GetDataSet: TClientDataSet; override;
    class procedure SetDataSet(pDataSet: TClientDataSet); override;
    class procedure TratarListaRetorno(pListaObjetos: TObjectList<TVO>);
  end;

implementation

uses UDataModule, T2TiORM;

class procedure TViewPessoaColaboradorController.Consulta(pFiltro: String; pPagina: String; pConsultaCompleta: Boolean);
var
  Retorno: TObjectList<TViewPessoaColaboradorVO>;
begin
  try
    Retorno := TT2TiORM.Consultar<TViewPessoaColaboradorVO>(pFiltro, pPagina, pConsultaCompleta);
    TratarRetorno<TViewPessoaColaboradorVO>(Retorno);
  finally
  end;
end;

class function TViewPessoaColaboradorController.ConsultaLista(pFiltro: String): TObjectList<TViewPessoaColaboradorVO>;
begin
  try
    Result := TT2TiORM.Consultar<TViewPessoaColaboradorVO>(pFiltro, '-1', True);
  finally
  end;
end;

class function TViewPessoaColaboradorController.ConsultaObjeto(pFiltro: String): TViewPessoaColaboradorVO;
begin
  try
    Result := TT2TiORM.ConsultarUmObjeto<TViewPessoaColaboradorVO>(pFiltro, True);
  finally
  end;
end;

class procedure TViewPessoaColaboradorController.Insere(pObjeto: TViewPessoaColaboradorVO);
var
  UltimoID: Integer;
begin
  try
    UltimoID := TT2TiORM.Inserir(pObjeto);
    Consulta('ID = ' + IntToStr(UltimoID), '0');
  finally
  end;
end;

class function TViewPessoaColaboradorController.Altera(pObjeto: TViewPessoaColaboradorVO): Boolean;
begin
  try
    Result := TT2TiORM.Alterar(pObjeto);
  finally
  end;
end;

class function TViewPessoaColaboradorController.Exclui(pId: Integer): Boolean;
var
  ObjetoLocal: TViewPessoaColaboradorVO;
begin
  try
    ObjetoLocal := TViewPessoaColaboradorVO.Create;
    ObjetoLocal.Id := pId;
    Result := TT2TiORM.Excluir(ObjetoLocal);
    TratarRetorno(Result);
  finally
    FreeAndNil(ObjetoLocal)
  end;
end;

class function TViewPessoaColaboradorController.GetDataSet: TClientDataSet;
begin
  Result := FDataSet;
end;

class procedure TViewPessoaColaboradorController.SetDataSet(pDataSet: TClientDataSet);
begin
  FDataSet := pDataSet;
end;

class procedure TViewPessoaColaboradorController.TratarListaRetorno(pListaObjetos: TObjectList<TVO>);
begin
  try
    TratarRetorno<TViewPessoaColaboradorVO>(TObjectList<TViewPessoaColaboradorVO>(pListaObjetos));
  finally
    FreeAndNil(pListaObjetos);
  end;
end;

initialization
  Classes.RegisterClass(TViewPessoaColaboradorController);

finalization
  Classes.UnRegisterClass(TViewPessoaColaboradorController);

end.
