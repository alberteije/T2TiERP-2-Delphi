{*******************************************************************************
Title: T2Ti ERP                                                                 
Description: Controller do lado Cliente relacionado à tabela [CONTABIL_INDICE] 
                                                                                
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
unit ContabilIndiceController;

interface

uses
  Classes, Dialogs, SysUtils, DBClient, DB,  Windows, Forms, Controller, Rtti,
  Atributos, VO, Generics.Collections, ContabilIndiceVO, ContabilIndiceValorVO;

type
  TContabilIndiceController = class(TController)
  private
    class var FDataSet: TClientDataSet;
  public
    class procedure Consulta(pFiltro: String; pPagina: String; pConsultaCompleta: Boolean = False);
    class function ConsultaLista(pFiltro: String): TObjectList<TContabilIndiceVO>;
    class function ConsultaObjeto(pFiltro: String): TContabilIndiceVO;

    class procedure Insere(pObjeto: TContabilIndiceVO);
    class function Altera(pObjeto: TContabilIndiceVO): Boolean;

    class function Exclui(pId: Integer): Boolean;

    class function GetDataSet: TClientDataSet; override;
    class procedure SetDataSet(pDataSet: TClientDataSet); override;
    class procedure TratarListaRetorno(pListaObjetos: TObjectList<TVO>);
  end;

implementation

uses UDataModule, T2TiORM;

class procedure TContabilIndiceController.Consulta(pFiltro: String; pPagina: String; pConsultaCompleta: Boolean);
var
  Retorno: TObjectList<TContabilIndiceVO>;
begin
  try
    Retorno := TT2TiORM.Consultar<TContabilIndiceVO>(pFiltro, pPagina, pConsultaCompleta);
    TratarRetorno<TContabilIndiceVO>(Retorno);
  finally
  end;
end;

class function TContabilIndiceController.ConsultaLista(pFiltro: String): TObjectList<TContabilIndiceVO>;
begin
  try
    Result := TT2TiORM.Consultar<TContabilIndiceVO>(pFiltro, '-1', True);
  finally
  end;
end;

class function TContabilIndiceController.ConsultaObjeto(pFiltro: String): TContabilIndiceVO;
begin
  try
    Result := TT2TiORM.ConsultarUmObjeto<TContabilIndiceVO>(pFiltro, True);
  finally
  end;
end;

class procedure TContabilIndiceController.Insere(pObjeto: TContabilIndiceVO);
var
  UltimoID: Integer;
  ContabilIndiceValorEnumerator: TEnumerator<TContabilIndiceValorVO>;
begin
  try
    UltimoID := TT2TiORM.Inserir(pObjeto);

    // Detalhes
    ContabilIndiceValorEnumerator := pObjeto.ListaContabilIndiceValorVO.GetEnumerator;
    try
      with ContabilIndiceValorEnumerator do
      begin
        while MoveNext do
        begin
          Current.IdContabilIndice := UltimoID;
          TT2TiORM.Inserir(Current);
        end;
      end;
    finally
      ContabilIndiceValorEnumerator.Free;
    end;

    Consulta('ID = ' + IntToStr(UltimoID), '0');
  finally
  end;
end;

class function TContabilIndiceController.Altera(pObjeto: TContabilIndiceVO): Boolean;
var
  ContabilIndiceValorEnumerator: TEnumerator<TContabilIndiceValorVO>;
begin
  try
    Result := TT2TiORM.Alterar(pObjeto);

    // Detalhes
    try
      ContabilIndiceValorEnumerator := pObjeto.ListaContabilIndiceValorVO.GetEnumerator;
      with ContabilIndiceValorEnumerator do
      begin
        while MoveNext do
        begin
          if Current.Id > 0 then
            Result := TT2TiORM.Alterar(Current)
          else
          begin
            Current.IdContabilIndice := pObjeto.Id;
            Result := TT2TiORM.Inserir(Current) > 0;
          end;
        end;
      end;
    finally
      FreeAndNil(ContabilIndiceValorEnumerator);
    end;

  finally
  end;
end;

class function TContabilIndiceController.Exclui(pId: Integer): Boolean;
var
  ObjetoLocal: TContabilIndiceVO;
begin
  try
    ObjetoLocal := TContabilIndiceVO.Create;
    ObjetoLocal.Id := pId;
    Result := TT2TiORM.Excluir(ObjetoLocal);
    TratarRetorno(Result);
  finally
    FreeAndNil(ObjetoLocal)
  end;
end;

class function TContabilIndiceController.GetDataSet: TClientDataSet;
begin
  Result := FDataSet;
end;

class procedure TContabilIndiceController.SetDataSet(pDataSet: TClientDataSet);
begin
  FDataSet := pDataSet;
end;

class procedure TContabilIndiceController.TratarListaRetorno(pListaObjetos: TObjectList<TVO>);
begin
  try
    TratarRetorno<TContabilIndiceVO>(TObjectList<TContabilIndiceVO>(pListaObjetos));
  finally
    FreeAndNil(pListaObjetos);
  end;
end;

initialization
  Classes.RegisterClass(TContabilIndiceController);

finalization
  Classes.UnRegisterClass(TContabilIndiceController);

end.
