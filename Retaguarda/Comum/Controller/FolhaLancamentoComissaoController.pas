{*******************************************************************************
Title: T2Ti ERP                                                                 
Description: Controller do lado Cliente relacionado à tabela [FOLHA_LANCAMENTO_COMISSAO] 
                                                                                
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
unit FolhaLancamentoComissaoController;

interface

uses
  Classes, Dialogs, SysUtils, DBClient, DB,  Windows, Forms, Controller, Rtti,
  Atributos, VO, Generics.Collections, FolhaLancamentoComissaoVO;

type
  TFolhaLancamentoComissaoController = class(TController)
  private
    class var FDataSet: TClientDataSet;
  public
    class procedure Consulta(pFiltro: String; pPagina: String; pConsultaCompleta: Boolean = False);
    class function ConsultaLista(pFiltro: String): TObjectList<TFolhaLancamentoComissaoVO>;
    class function ConsultaObjeto(pFiltro: String): TFolhaLancamentoComissaoVO;

    class procedure Insere(pObjeto: TFolhaLancamentoComissaoVO);
    class function Altera(pObjeto: TFolhaLancamentoComissaoVO): Boolean;

    class function Exclui(pId: Integer): Boolean;

    class function GetDataSet: TClientDataSet; override;
    class procedure SetDataSet(pDataSet: TClientDataSet); override;
    class procedure TratarListaRetorno(pListaObjetos: TObjectList<TVO>);
  end;

implementation

uses UDataModule, T2TiORM;

class procedure TFolhaLancamentoComissaoController.Consulta(pFiltro: String; pPagina: String; pConsultaCompleta: Boolean);
var
  Retorno: TObjectList<TFolhaLancamentoComissaoVO>;
begin
  try
    Retorno := TT2TiORM.Consultar<TFolhaLancamentoComissaoVO>(pFiltro, pPagina, pConsultaCompleta);
    TratarRetorno<TFolhaLancamentoComissaoVO>(Retorno);
  finally
  end;
end;

class function TFolhaLancamentoComissaoController.ConsultaLista(pFiltro: String): TObjectList<TFolhaLancamentoComissaoVO>;
begin
  try
    Result := TT2TiORM.Consultar<TFolhaLancamentoComissaoVO>(pFiltro, '-1', True);
  finally
  end;
end;

class function TFolhaLancamentoComissaoController.ConsultaObjeto(pFiltro: String): TFolhaLancamentoComissaoVO;
begin
  try
    Result := TT2TiORM.ConsultarUmObjeto<TFolhaLancamentoComissaoVO>(pFiltro, True);
  finally
  end;
end;

class procedure TFolhaLancamentoComissaoController.Insere(pObjeto: TFolhaLancamentoComissaoVO);
var
  UltimoID: Integer;
begin
  try
    UltimoID := TT2TiORM.Inserir(pObjeto);
    Consulta('ID = ' + IntToStr(UltimoID), '0');
  finally
  end;
end;

class function TFolhaLancamentoComissaoController.Altera(pObjeto: TFolhaLancamentoComissaoVO): Boolean;
begin
  try
    Result := TT2TiORM.Alterar(pObjeto);
  finally
  end;
end;

class function TFolhaLancamentoComissaoController.Exclui(pId: Integer): Boolean;
var
  ObjetoLocal: TFolhaLancamentoComissaoVO;
begin
  try
    ObjetoLocal := TFolhaLancamentoComissaoVO.Create;
    ObjetoLocal.Id := pId;
    Result := TT2TiORM.Excluir(ObjetoLocal);
    TratarRetorno(Result);
  finally
    FreeAndNil(ObjetoLocal)
  end;
end;

class function TFolhaLancamentoComissaoController.GetDataSet: TClientDataSet;
begin
  Result := FDataSet;
end;

class procedure TFolhaLancamentoComissaoController.SetDataSet(pDataSet: TClientDataSet);
begin
  FDataSet := pDataSet;
end;

class procedure TFolhaLancamentoComissaoController.TratarListaRetorno(pListaObjetos: TObjectList<TVO>);
begin
  try
    TratarRetorno<TFolhaLancamentoComissaoVO>(TObjectList<TFolhaLancamentoComissaoVO>(pListaObjetos));
  finally
    FreeAndNil(pListaObjetos);
  end;
end;

initialization
  Classes.RegisterClass(TFolhaLancamentoComissaoController);

finalization
  Classes.UnRegisterClass(TFolhaLancamentoComissaoController);

end.
