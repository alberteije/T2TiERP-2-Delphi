{*******************************************************************************
Title: T2Ti ERP                                                                 
Description: Controller do lado Cliente relacionado à tabela [TRIBUT_ICMS_CUSTOM_CAB] 
                                                                                
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
@version 1.0                                                                    
*******************************************************************************}
unit TributIcmsCustomCabController;

interface

uses
  Classes, Dialogs, SysUtils, DBClient, DB, Windows, Forms, Controller, Rtti, Atributos,
  TributIcmsCustomCabVO, TributIcmsCustomDetVO, Generics.Collections, VO;

type
  TTributIcmsCustomCabController = class(TController)
  private
    class var FDataSet: TClientDataSet;
  public
    class procedure Consulta(pFiltro: String; pPagina: String; pConsultaCompleta: Boolean = False);
    class function ConsultaLista(pFiltro: String): TObjectList<TTributIcmsCustomCabVO>;
    class function ConsultaObjeto(pFiltro: String): TTributIcmsCustomCabVO;

    class procedure Insere(pObjeto: TTributIcmsCustomCabVO);
    class function Altera(pObjeto: TTributIcmsCustomCabVO): Boolean;

    class function Exclui(pId: Integer): Boolean;
    class function ExcluiDetalhe(pId: Integer): Boolean;

    class function GetDataSet: TClientDataSet; override;
    class procedure SetDataSet(pDataSet: TClientDataSet); override;
    class procedure TratarListaRetorno(pListaObjetos: TObjectList<TVO>);
  end;

implementation

uses T2TiORM;

class procedure TTributIcmsCustomCabController.Consulta(pFiltro: String; pPagina: String; pConsultaCompleta: Boolean);
var
  Retorno: TObjectList<TTributIcmsCustomCabVO>;
begin
  try
    Retorno := TT2TiORM.Consultar<TTributIcmsCustomCabVO>(pFiltro, pPagina, pConsultaCompleta);
    TratarRetorno<TTributIcmsCustomCabVO>(Retorno);
  finally
  end;
end;

class function TTributIcmsCustomCabController.ConsultaLista(pFiltro: String): TObjectList<TTributIcmsCustomCabVO>;
begin
  try
    Result := TT2TiORM.Consultar<TTributIcmsCustomCabVO>(pFiltro, '-1', True);
  finally
  end;
end;

class function TTributIcmsCustomCabController.ConsultaObjeto(pFiltro: String): TTributIcmsCustomCabVO;
begin
  try
    Result := TT2TiORM.ConsultarUmObjeto<TTributIcmsCustomCabVO>(pFiltro, True);
  finally
  end;
end;

class procedure TTributIcmsCustomCabController.Insere(pObjeto: TTributIcmsCustomCabVO);
var
  DetalheEnumerator: TEnumerator<TTributIcmsCustomDetVO>;
  UltimoID: Integer;
begin
  try
    UltimoID := TT2TiORM.Inserir(pObjeto);

    // Detalhes
    try
      DetalheEnumerator := pObjeto.ListaTributIcmsCustomDetVO.GetEnumerator;
      with DetalheEnumerator do
      begin
        while MoveNext do
        begin
          Current.IdTributIcmsCustomCab := UltimoID;
          TT2TiORM.Inserir(Current);
        end;
      end;
    finally
      FreeAndNil(DetalheEnumerator);
    end;

    Consulta('ID = ' + IntToStr(UltimoID), '0');
  finally
  end;
end;

class function TTributIcmsCustomCabController.Altera(pObjeto: TTributIcmsCustomCabVO): Boolean;
var
  DetalheEnumerator: TEnumerator<TTributIcmsCustomDetVO>;
begin
  try
    Result := TT2TiORM.Alterar(pObjeto);

    // Detalhes
    try
      DetalheEnumerator := pObjeto.ListaTributIcmsCustomDetVO.GetEnumerator;
      with DetalheEnumerator do
      begin
        while MoveNext do
        begin
          if Current.Id > 0 then
            Result := TT2TiORM.Alterar(Current)
          else
          begin
            Current.IdTributIcmsCustomCab := pObjeto.Id;
            Result := TT2TiORM.Inserir(Current) > 0;
          end;
        end;
      end;
    finally
      FreeAndNil(DetalheEnumerator);
    end;
  finally
  end;
end;

class function TTributIcmsCustomCabController.Exclui(pId: Integer): Boolean;
var
  ObjetoLocal: TTributIcmsCustomCabVO;
begin
  try
    ObjetoLocal := TTributIcmsCustomCabVO.Create;
    ObjetoLocal.Id := pId;
    Result := TT2TiORM.Excluir(ObjetoLocal);
    TratarRetorno(Result);
  finally
    FreeAndNil(ObjetoLocal)
  end;
end;

class function TTributIcmsCustomCabController.ExcluiDetalhe(pId: Integer): Boolean;
var
  ObjetoLocal: TTributIcmsCustomDetVO;
begin
  try
    ObjetoLocal := TTributIcmsCustomDetVO.Create;
    ObjetoLocal.Id := pId;
    Result := TT2TiORM.Excluir(ObjetoLocal);
    TratarRetorno(Result);
  finally
    FreeAndNil(ObjetoLocal)
  end;
end;

class function TTributIcmsCustomCabController.GetDataSet: TClientDataSet;
begin
  Result := FDataSet;
end;

class procedure TTributIcmsCustomCabController.SetDataSet(pDataSet: TClientDataSet);
begin
  FDataSet := pDataSet;
end;

class procedure TTributIcmsCustomCabController.TratarListaRetorno(pListaObjetos: TObjectList<TVO>);
begin
  try
    TratarRetorno<TTributIcmsCustomCabVO>(TObjectList<TTributIcmsCustomCabVO>(pListaObjetos));
  finally
    FreeAndNil(pListaObjetos);
  end;
end;

initialization
  Classes.RegisterClass(TTributIcmsCustomCabController);

finalization
  Classes.UnRegisterClass(TTributIcmsCustomCabController);

end.
