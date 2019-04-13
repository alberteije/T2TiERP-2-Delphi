{*******************************************************************************
Title: T2Ti ERP                                                                 
Description: Controller do lado Cliente relacionado à tabela [GED_VERSAO_DOCUMENTO] 
                                                                                
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
unit GedVersaoDocumentoController;

interface

uses
  Classes, Dialogs, SysUtils, DBClient, DB,  Windows, Forms, Controller, Rtti,
  Atributos, VO, Generics.Collections, GedVersaoDocumentoVO;

type
  TGedVersaoDocumentoController = class(TController)
  private
    class var FDataSet: TClientDataSet;
  public
    class procedure Consulta(pFiltro: String; pPagina: String; pConsultaCompleta: Boolean = False);
    class function ConsultaLista(pFiltro: String): TObjectList<TGedVersaoDocumentoVO>;
    class function ConsultaObjeto(pFiltro: String): TGedVersaoDocumentoVO;

    class procedure Insere(pObjeto: TGedVersaoDocumentoVO);
    class function Altera(pObjeto: TGedVersaoDocumentoVO): Boolean;

    class function Exclui(pId: Integer): Boolean;

    class function GetDataSet: TClientDataSet; override;
    class procedure SetDataSet(pDataSet: TClientDataSet); override;
    class procedure TratarListaRetorno(pListaObjetos: TObjectList<TVO>);
  end;

implementation

uses UDataModule, T2TiORM;

class procedure TGedVersaoDocumentoController.Consulta(pFiltro: String; pPagina: String; pConsultaCompleta: Boolean);
var
  Retorno: TObjectList<TGedVersaoDocumentoVO>;
begin
  try
    Retorno := TT2TiORM.Consultar<TGedVersaoDocumentoVO>(pFiltro, pPagina, pConsultaCompleta);
    TratarRetorno<TGedVersaoDocumentoVO>(Retorno);
  finally
  end;
end;

class function TGedVersaoDocumentoController.ConsultaLista(pFiltro: String): TObjectList<TGedVersaoDocumentoVO>;
begin
  try
    Result := TT2TiORM.Consultar<TGedVersaoDocumentoVO>(pFiltro, '-1', True);
  finally
  end;
end;

class function TGedVersaoDocumentoController.ConsultaObjeto(pFiltro: String): TGedVersaoDocumentoVO;
begin
  try
    Result := TT2TiORM.ConsultarUmObjeto<TGedVersaoDocumentoVO>(pFiltro, True);
  finally
  end;
end;

class procedure TGedVersaoDocumentoController.Insere(pObjeto: TGedVersaoDocumentoVO);
var
  UltimoID: Integer;
begin
  try
    UltimoID := TT2TiORM.Inserir(pObjeto);
    Consulta('ID = ' + IntToStr(UltimoID), '0');
  finally
  end;
end;

class function TGedVersaoDocumentoController.Altera(pObjeto: TGedVersaoDocumentoVO): Boolean;
begin
  try
    Result := TT2TiORM.Alterar(pObjeto);
  finally
  end;
end;

class function TGedVersaoDocumentoController.Exclui(pId: Integer): Boolean;
var
  ObjetoLocal: TGedVersaoDocumentoVO;
begin
  try
    ObjetoLocal := TGedVersaoDocumentoVO.Create;
    ObjetoLocal.Id := pId;
    Result := TT2TiORM.Excluir(ObjetoLocal);
    TratarRetorno(Result);
  finally
    FreeAndNil(ObjetoLocal)
  end;
end;

class function TGedVersaoDocumentoController.GetDataSet: TClientDataSet;
begin
  Result := FDataSet;
end;

class procedure TGedVersaoDocumentoController.SetDataSet(pDataSet: TClientDataSet);
begin
  FDataSet := pDataSet;
end;

class procedure TGedVersaoDocumentoController.TratarListaRetorno(pListaObjetos: TObjectList<TVO>);
begin
  try
    TratarRetorno<TGedVersaoDocumentoVO>(TObjectList<TGedVersaoDocumentoVO>(pListaObjetos));
  finally
    FreeAndNil(pListaObjetos);
  end;
end;

initialization
  Classes.RegisterClass(TGedVersaoDocumentoController);

finalization
  Classes.UnRegisterClass(TGedVersaoDocumentoController);

end.
