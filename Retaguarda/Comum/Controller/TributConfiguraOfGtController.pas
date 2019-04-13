{*******************************************************************************
Title: T2Ti ERP                                                                 
Description: Controller do lado Cliente relacionado à tabela [tribut_configura_of_gt] 
                                                                                
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
unit TributConfiguraOfGtController;

interface

uses
  Classes, Dialogs, SysUtils, DBClient, DB, Windows, Forms, Controller, Rtti, Atributos,
  TributConfiguraOfGtVO, Generics.Collections, VO;

type
  TTributConfiguraOfGtController = class(TController)
  private
    class var FDataSet: TClientDataSet;
  public
    class procedure Consulta(pFiltro: String; pPagina: String; pConsultaCompleta: Boolean = False);
    class function ConsultaLista(pFiltro: String): TObjectList<TTributConfiguraOfGtVO>;
    class function ConsultaObjeto(pFiltro: String): TTributConfiguraOfGtVO;

    class procedure Insere(pObjeto: TTributConfiguraOfGtVO);
    class function Altera(pObjeto: TTributConfiguraOfGtVO): Boolean;

    class function Exclui(pId: Integer): Boolean;
    class function ExcluiDetalhe(pId: Integer): Boolean;

    class function GetDataSet: TClientDataSet; override;
    class procedure SetDataSet(pDataSet: TClientDataSet); override;
    class procedure TratarListaRetorno(pListaObjetos: TObjectList<TVO>);
  end;

implementation

uses T2TiORM,
    //
    TributPisCodApuracaoVO, TributCofinsCodApuracaoVO, TributIpiDipiVO, TributIcmsUfVO;

class procedure TTributConfiguraOfGtController.Consulta(pFiltro: String; pPagina: String; pConsultaCompleta: Boolean);
var
  Retorno: TObjectList<TTributConfiguraOfGtVO>;
begin
  try
    Retorno := TT2TiORM.Consultar<TTributConfiguraOfGtVO>(pFiltro, pPagina, pConsultaCompleta);
    TratarRetorno<TTributConfiguraOfGtVO>(Retorno);
  finally
  end;
end;

class function TTributConfiguraOfGtController.ConsultaLista(pFiltro: String): TObjectList<TTributConfiguraOfGtVO>;
begin
  try
    Result := TT2TiORM.Consultar<TTributConfiguraOfGtVO>(pFiltro, '-1', True);
  finally
  end;
end;

class function TTributConfiguraOfGtController.ConsultaObjeto(pFiltro: String): TTributConfiguraOfGtVO;
begin
  try
    Result := TT2TiORM.ConsultarUmObjeto<TTributConfiguraOfGtVO>(pFiltro, True);
  finally
  end;
end;

class procedure TTributConfiguraOfGtController.Insere(pObjeto: TTributConfiguraOfGtVO);
var
  DetalheEnumerator: TEnumerator<TTributIcmsUfVO>;
  UltimoID: Integer;
begin
  try
    UltimoID := TT2TiORM.Inserir(pObjeto);

    { Pis }
    pObjeto.TributPisCodApuracaoVO.IdTributConfiguraOfGt := UltimoID;
    TT2TiORM.Inserir(pObjeto.TributPisCodApuracaoVO);

    { Cofins }
    pObjeto.TributCofinsCodApuracaoVO.IdTributConfiguraOfGt := UltimoID;
    TT2TiORM.Inserir(pObjeto.TributCofinsCodApuracaoVO);

    { Ipi }
    pObjeto.TributIpiDipiVO.IdTributConfiguraOfGt := UltimoID;
    TT2TiORM.Inserir(pObjeto.TributIpiDipiVO);

    // Detalhes
    try
      DetalheEnumerator := pObjeto.ListaTributIcmsUfVO.GetEnumerator;
      with DetalheEnumerator do
      begin
        while MoveNext do
        begin
          Current.IdTributConfiguraOfGt := UltimoID;
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

class function TTributConfiguraOfGtController.Altera(pObjeto: TTributConfiguraOfGtVO): Boolean;
var
  DetalheEnumerator: TEnumerator<TTributIcmsUfVO>;
begin
  try
    Result := TT2TiORM.Alterar(pObjeto);

    { Pis }
    Result := TT2TiORM.Alterar(pObjeto.TributPisCodApuracaoVO);
    { Cofins }
    Result := TT2TiORM.Alterar(pObjeto.TributCofinsCodApuracaoVO);
    { Ipi }
    Result := TT2TiORM.Alterar(pObjeto.TributIpiDipiVO);

    // Detalhes
    try
      DetalheEnumerator := pObjeto.ListaTributIcmsUfVO.GetEnumerator;
      with DetalheEnumerator do
      begin
        while MoveNext do
        begin
          if Current.Id > 0 then
            Result := TT2TiORM.Alterar(Current)
          else
          begin
            Current.IdTributConfiguraOfGt := pObjeto.Id;
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

class function TTributConfiguraOfGtController.Exclui(pId: Integer): Boolean;
var
  ObjetoLocal: TTributConfiguraOfGtVO;
begin
  try
    ObjetoLocal := TTributConfiguraOfGtVO.Create;
    ObjetoLocal.Id := pId;
    Result := TT2TiORM.Excluir(ObjetoLocal);
    TratarRetorno(Result);
  finally
    FreeAndNil(ObjetoLocal)
  end;
end;

class function TTributConfiguraOfGtController.ExcluiDetalhe(pId: Integer): Boolean;
var
  ObjetoLocal: TTributIcmsUfVO;
begin
  try
    ObjetoLocal := TTributIcmsUfVO.Create;
    ObjetoLocal.Id := pId;
    Result := TT2TiORM.Excluir(ObjetoLocal);
    TratarRetorno(Result);
  finally
    FreeAndNil(ObjetoLocal)
  end;
end;

class function TTributConfiguraOfGtController.GetDataSet: TClientDataSet;
begin
  Result := FDataSet;
end;

class procedure TTributConfiguraOfGtController.SetDataSet(pDataSet: TClientDataSet);
begin
  FDataSet := pDataSet;
end;

class procedure TTributConfiguraOfGtController.TratarListaRetorno(pListaObjetos: TObjectList<TVO>);
begin
  try
    TratarRetorno<TTributConfiguraOfGtVO>(TObjectList<TTributConfiguraOfGtVO>(pListaObjetos));
  finally
    FreeAndNil(pListaObjetos);
  end;
end;

initialization
  Classes.RegisterClass(TTributConfiguraOfGtController);

finalization
  Classes.UnRegisterClass(TTributConfiguraOfGtController);

end.
