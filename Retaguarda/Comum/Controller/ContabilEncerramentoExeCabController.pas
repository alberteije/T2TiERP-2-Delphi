{*******************************************************************************
Title: T2Ti ERP                                                                 
Description: Controller do lado Cliente relacionado à tabela [CONTABIL_ENCERRAMENTO_EXE_CAB] 
                                                                                
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
unit ContabilEncerramentoExeCabController;

interface

uses
  Classes, Dialogs, SysUtils, DBClient, DB,  Windows, Forms, Controller, Rtti,
  Atributos, VO, Generics.Collections, ContabilEncerramentoExeCabVO,
  ContabilEncerramentoExeDetVO;

type
  TContabilEncerramentoExeCabController = class(TController)
  private
    class var FDataSet: TClientDataSet;
  public
    class procedure Consulta(pFiltro: String; pPagina: String; pConsultaCompleta: Boolean = False);
    class function ConsultaLista(pFiltro: String): TObjectList<TContabilEncerramentoExeCabVO>;
    class function ConsultaObjeto(pFiltro: String): TContabilEncerramentoExeCabVO;

    class procedure Insere(pObjeto: TContabilEncerramentoExeCabVO);
    class function Altera(pObjeto: TContabilEncerramentoExeCabVO): Boolean;

    class function Exclui(pId: Integer): Boolean;

    class function GetDataSet: TClientDataSet; override;
    class procedure SetDataSet(pDataSet: TClientDataSet); override;
    class procedure TratarListaRetorno(pListaObjetos: TObjectList<TVO>);
  end;

implementation

uses UDataModule, T2TiORM;

class procedure TContabilEncerramentoExeCabController.Consulta(pFiltro: String; pPagina: String; pConsultaCompleta: Boolean);
var
  Retorno: TObjectList<TContabilEncerramentoExeCabVO>;
begin
  try
    Retorno := TT2TiORM.Consultar<TContabilEncerramentoExeCabVO>(pFiltro, pPagina, pConsultaCompleta);
    TratarRetorno<TContabilEncerramentoExeCabVO>(Retorno);
  finally
  end;
end;

class function TContabilEncerramentoExeCabController.ConsultaLista(pFiltro: String): TObjectList<TContabilEncerramentoExeCabVO>;
begin
  try
    Result := TT2TiORM.Consultar<TContabilEncerramentoExeCabVO>(pFiltro, '-1', True);
  finally
  end;
end;

class function TContabilEncerramentoExeCabController.ConsultaObjeto(pFiltro: String): TContabilEncerramentoExeCabVO;
begin
  try
    Result := TT2TiORM.ConsultarUmObjeto<TContabilEncerramentoExeCabVO>(pFiltro, True);
  finally
  end;
end;

class procedure TContabilEncerramentoExeCabController.Insere(pObjeto: TContabilEncerramentoExeCabVO);
var
  UltimoID: Integer;
  ContabilEncerramentoExeDetEnumerator: TEnumerator<TContabilEncerramentoExeDetVO>;
begin
  try
    UltimoID := TT2TiORM.Inserir(pObjeto);

    // Detalhes
    ContabilEncerramentoExeDetEnumerator := pObjeto.ListaContabilEncerramentoExeDetVO.GetEnumerator;
    try
      with ContabilEncerramentoExeDetEnumerator do
      begin
        while MoveNext do
        begin
          Current.IdContabilEncerramentoExe := UltimoID;
          TT2TiORM.Inserir(Current);
        end;
      end;
    finally
      ContabilEncerramentoExeDetEnumerator.Free;
    end;

    Consulta('ID = ' + IntToStr(UltimoID), '0');
  finally
  end;
end;

class function TContabilEncerramentoExeCabController.Altera(pObjeto: TContabilEncerramentoExeCabVO): Boolean;
var
  ContabilEncerramentoExeDetEnumerator: TEnumerator<TContabilEncerramentoExeDetVO>;
begin
  try
    Result := TT2TiORM.Alterar(pObjeto);

    // Detalhes
    try
      ContabilEncerramentoExeDetEnumerator := pObjeto.ListaContabilEncerramentoExeDetVO.GetEnumerator;
      with ContabilEncerramentoExeDetEnumerator do
      begin
        while MoveNext do
        begin
          if Current.Id > 0 then
            Result := TT2TiORM.Alterar(Current)
          else
          begin
            Current.IdContabilEncerramentoExe := pObjeto.Id;
            Result := TT2TiORM.Inserir(Current) > 0;
          end;
        end;
      end;
    finally
      FreeAndNil(ContabilEncerramentoExeDetEnumerator);
    end;

  finally
  end;
end;

class function TContabilEncerramentoExeCabController.Exclui(pId: Integer): Boolean;
var
  ObjetoLocal: TContabilEncerramentoExeCabVO;
begin
  try
    ObjetoLocal := TContabilEncerramentoExeCabVO.Create;
    ObjetoLocal.Id := pId;
    Result := TT2TiORM.Excluir(ObjetoLocal);
    TratarRetorno(Result);
  finally
    FreeAndNil(ObjetoLocal)
  end;
end;

class function TContabilEncerramentoExeCabController.GetDataSet: TClientDataSet;
begin
  Result := FDataSet;
end;

class procedure TContabilEncerramentoExeCabController.SetDataSet(pDataSet: TClientDataSet);
begin
  FDataSet := pDataSet;
end;

class procedure TContabilEncerramentoExeCabController.TratarListaRetorno(pListaObjetos: TObjectList<TVO>);
begin
  try
    TratarRetorno<TContabilEncerramentoExeCabVO>(TObjectList<TContabilEncerramentoExeCabVO>(pListaObjetos));
  finally
    FreeAndNil(pListaObjetos);
  end;
end;

initialization
  Classes.RegisterClass(TContabilEncerramentoExeCabController);

finalization
  Classes.UnRegisterClass(TContabilEncerramentoExeCabController);

end.
