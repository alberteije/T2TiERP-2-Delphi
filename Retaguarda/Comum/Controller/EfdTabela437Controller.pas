{*******************************************************************************
Title: T2Ti ERP                                                                 
Description: Controller do lado Cliente relacionado à tabela [EFD_TABELA_437] 
                                                                                
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
unit EfdTabela437Controller;

interface

uses
  Classes, Dialogs, SysUtils, DBClient, DB,  Windows, Forms, Controller, Rtti,
  Atributos, VO, Generics.Collections, EfdTabela437VO;

type
  TEfdTabela437Controller = class(TController)
  private
    class var FDataSet: TClientDataSet;
  public
    class procedure Consulta(pFiltro: String; pPagina: String; pConsultaCompleta: Boolean = False);
    class function ConsultaLista(pFiltro: String): TObjectList<TEfdTabela437VO>;
    class function ConsultaObjeto(pFiltro: String): TEfdTabela437VO;

    class procedure Insere(pObjeto: TEfdTabela437VO);
    class function Altera(pObjeto: TEfdTabela437VO): Boolean;

    class function Exclui(pId: Integer): Boolean;

    class function GetDataSet: TClientDataSet; override;
    class procedure SetDataSet(pDataSet: TClientDataSet); override;
    class procedure TratarListaRetorno(pListaObjetos: TObjectList<TVO>);
  end;

implementation

uses UDataModule, T2TiORM;

class procedure TEfdTabela437Controller.Consulta(pFiltro: String; pPagina: String; pConsultaCompleta: Boolean);
var
  Retorno: TObjectList<TEfdTabela437VO>;
begin
  try
    Retorno := TT2TiORM.Consultar<TEfdTabela437VO>(pFiltro, pPagina, pConsultaCompleta);
    TratarRetorno<TEfdTabela437VO>(Retorno);
  finally
  end;
end;

class function TEfdTabela437Controller.ConsultaLista(pFiltro: String): TObjectList<TEfdTabela437VO>;
begin
  try
    Result := TT2TiORM.Consultar<TEfdTabela437VO>(pFiltro, '-1', True);
  finally
  end;
end;

class function TEfdTabela437Controller.ConsultaObjeto(pFiltro: String): TEfdTabela437VO;
begin
  try
    Result := TT2TiORM.ConsultarUmObjeto<TEfdTabela437VO>(pFiltro, True);
  finally
  end;
end;

class procedure TEfdTabela437Controller.Insere(pObjeto: TEfdTabela437VO);
var
  UltimoID: Integer;
begin
  try
    UltimoID := TT2TiORM.Inserir(pObjeto);
    Consulta('ID = ' + IntToStr(UltimoID), '0');
  finally
  end;
end;

class function TEfdTabela437Controller.Altera(pObjeto: TEfdTabela437VO): Boolean;
begin
  try
    Result := TT2TiORM.Alterar(pObjeto);
  finally
  end;
end;

class function TEfdTabela437Controller.Exclui(pId: Integer): Boolean;
var
  ObjetoLocal: TEfdTabela437VO;
begin
  try
    ObjetoLocal := TEfdTabela437VO.Create;
    ObjetoLocal.Id := pId;
    Result := TT2TiORM.Excluir(ObjetoLocal);
    TratarRetorno(Result);
  finally
    FreeAndNil(ObjetoLocal)
  end;
end;

class function TEfdTabela437Controller.GetDataSet: TClientDataSet;
begin
  Result := FDataSet;
end;

class procedure TEfdTabela437Controller.SetDataSet(pDataSet: TClientDataSet);
begin
  FDataSet := pDataSet;
end;

class procedure TEfdTabela437Controller.TratarListaRetorno(pListaObjetos: TObjectList<TVO>);
begin
  try
    TratarRetorno<TEfdTabela437VO>(TObjectList<TEfdTabela437VO>(pListaObjetos));
  finally
    FreeAndNil(pListaObjetos);
  end;
end;

initialization
  Classes.RegisterClass(TEfdTabela437Controller);

finalization
  Classes.UnRegisterClass(TEfdTabela437Controller);

end.
