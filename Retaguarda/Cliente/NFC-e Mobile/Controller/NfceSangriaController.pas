{*******************************************************************************
Title: T2Ti ERP                                                                 
Description: Controller do lado Cliente relacionado à tabela [NFCE_SANGRIA] 
                                                                                
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
unit NfceSangriaController;

interface

uses
  Classes, Dialogs, SysUtils, DBClient, DB,  Windows, Forms, Controller, Rtti,
  Atributos, VO, Generics.Collections, NfceSangriaVO;

type
  TNfceSangriaController = class(TController)
  private
    class var FDataSet: TClientDataSet;
  public
    class procedure Consulta(pFiltro: String; pPagina: String; pConsultaCompleta: Boolean = False);
    class function ConsultaLista(pFiltro: String): TObjectList<TNfceSangriaVO>;
    class function ConsultaObjeto(pFiltro: String): TNfceSangriaVO;

    class procedure Insere(pObjeto: TNfceSangriaVO);
    class function Altera(pObjeto: TNfceSangriaVO): Boolean;

    class function Exclui(pId: Integer): Boolean;

    class function GetDataSet: TClientDataSet; override;
    class procedure SetDataSet(pDataSet: TClientDataSet); override;
    class procedure TratarListaRetorno(pListaObjetos: TObjectList<TVO>);
  end;

implementation

uses T2TiORM;

class procedure TNfceSangriaController.Consulta(pFiltro: String; pPagina: String; pConsultaCompleta: Boolean);
var
  Retorno: TObjectList<TNfceSangriaVO>;
begin
  try
    Retorno := TT2TiORM.Consultar<TNfceSangriaVO>(pFiltro, pPagina, pConsultaCompleta);
    TratarRetorno<TNfceSangriaVO>(Retorno);
  finally
  end;
end;

class function TNfceSangriaController.ConsultaLista(pFiltro: String): TObjectList<TNfceSangriaVO>;
begin
  try
    Result := TT2TiORM.Consultar<TNfceSangriaVO>(pFiltro, '-1', True);
  finally
  end;
end;

class function TNfceSangriaController.ConsultaObjeto(pFiltro: String): TNfceSangriaVO;
begin
  try
    Result := TT2TiORM.ConsultarUmObjeto<TNfceSangriaVO>(pFiltro, True);
  finally
  end;
end;

class procedure TNfceSangriaController.Insere(pObjeto: TNfceSangriaVO);
var
  UltimoID: Integer;
begin
  try
    UltimoID := TT2TiORM.Inserir(pObjeto);
    Consulta('ID = ' + IntToStr(UltimoID), '0');
  finally
  end;
end;

class function TNfceSangriaController.Altera(pObjeto: TNfceSangriaVO): Boolean;
begin
  try
    Result := TT2TiORM.Alterar(pObjeto);
  finally
  end;
end;

class function TNfceSangriaController.Exclui(pId: Integer): Boolean;
var
  ObjetoLocal: TNfceSangriaVO;
begin
  try
    ObjetoLocal := TNfceSangriaVO.Create;
    ObjetoLocal.Id := pId;
    Result := TT2TiORM.Excluir(ObjetoLocal);
    TratarRetorno(Result);
  finally
    FreeAndNil(ObjetoLocal)
  end;
end;

class function TNfceSangriaController.GetDataSet: TClientDataSet;
begin
  Result := FDataSet;
end;

class procedure TNfceSangriaController.SetDataSet(pDataSet: TClientDataSet);
begin
  FDataSet := pDataSet;
end;

class procedure TNfceSangriaController.TratarListaRetorno(pListaObjetos: TObjectList<TVO>);
begin
  try
    TratarRetorno<TNfceSangriaVO>(TObjectList<TNfceSangriaVO>(pListaObjetos));
  finally
    FreeAndNil(pListaObjetos);
  end;
end;

initialization
  Classes.RegisterClass(TNfceSangriaController);

finalization
  Classes.UnRegisterClass(TNfceSangriaController);

end.
