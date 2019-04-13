{*******************************************************************************
Title: T2Ti ERP                                                                 
Description: Controller do lado Cliente relacionado à tabela [PONTO_ESCALA] 
                                                                                
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
unit PontoEscalaController;

interface

uses
  Classes, Dialogs, SysUtils, DBClient, DB,  Windows, Forms, Controller, Rtti,
  Atributos, VO, Generics.Collections, PontoEscalaVO;

type
  TPontoEscalaController = class(TController)
  private
    class var FDataSet: TClientDataSet;
  public
    class procedure Consulta(pFiltro: String; pPagina: String; pConsultaCompleta: Boolean = False);
    class function ConsultaLista(pFiltro: String): TObjectList<TPontoEscalaVO>;
    class function ConsultaObjeto(pFiltro: String): TPontoEscalaVO;

    class procedure Insere(pObjeto: TPontoEscalaVO);
    class function Altera(pObjeto: TPontoEscalaVO): Boolean;

    class function Exclui(pId: Integer): Boolean;

    class function GetDataSet: TClientDataSet; override;
    class procedure SetDataSet(pDataSet: TClientDataSet); override;
    class procedure TratarListaRetorno(pListaObjetos: TObjectList<TVO>);
  end;

implementation

uses UDataModule, T2TiORM, PontoTurmaVO;

class procedure TPontoEscalaController.Consulta(pFiltro: String; pPagina: String; pConsultaCompleta: Boolean);
var
  Retorno: TObjectList<TPontoEscalaVO>;
begin
  try
    Retorno := TT2TiORM.Consultar<TPontoEscalaVO>(pFiltro, pPagina, pConsultaCompleta);
    TratarRetorno<TPontoEscalaVO>(Retorno);
  finally
  end;
end;

class function TPontoEscalaController.ConsultaLista(pFiltro: String): TObjectList<TPontoEscalaVO>;
begin
  try
    Result := TT2TiORM.Consultar<TPontoEscalaVO>(pFiltro, '-1', True);
  finally
  end;
end;

class function TPontoEscalaController.ConsultaObjeto(pFiltro: String): TPontoEscalaVO;
begin
  try
    Result := TT2TiORM.ConsultarUmObjeto<TPontoEscalaVO>(pFiltro, True);
  finally
  end;
end;

class procedure TPontoEscalaController.Insere(pObjeto: TPontoEscalaVO);
var
  UltimoID: Integer;
  PontoTurmaEnumerator: TEnumerator<TPontoTurmaVO>;
begin
  try
    UltimoID := TT2TiORM.Inserir(pObjeto);

    // Turmas
    PontoTurmaEnumerator := pObjeto.ListaPontoTurmaVO.GetEnumerator;
    try
      with PontoTurmaEnumerator do
      begin
        while MoveNext do
        begin
          Current.IdPontoEscala := UltimoID;
          TT2TiORM.Inserir(Current);
        end;
      end;
    finally
      FreeAndNil(PontoTurmaEnumerator);
    end;

    Consulta('ID = ' + IntToStr(UltimoID), '0');
  finally
  end;
end;

class function TPontoEscalaController.Altera(pObjeto: TPontoEscalaVO): Boolean;
var
  PontoTurmaEnumerator: TEnumerator<TPontoTurmaVO>;
begin
  try
    Result := TT2TiORM.Alterar(pObjeto);

    // Turmas
    try
      PontoTurmaEnumerator := pObjeto.ListaPontoTurmaVO.GetEnumerator;
      with PontoTurmaEnumerator do
      begin
        while MoveNext do
        begin
          if Current.Id > 0 then
            Result := TT2TiORM.Alterar(Current)
          else
          begin
            Current.IdPontoEscala := pObjeto.Id;
            Result := TT2TiORM.Inserir(Current) > 0;
          end;
        end;
      end;
    finally
      FreeAndNil(PontoTurmaEnumerator);
    end;
  finally
  end;
end;

class function TPontoEscalaController.Exclui(pId: Integer): Boolean;
var
  ObjetoLocal: TPontoEscalaVO;
begin
  try
    ObjetoLocal := TPontoEscalaVO.Create;
    ObjetoLocal.Id := pId;

    Result := TT2TiORM.ComandoSQL('DELETE FROM PONTO_TURMA where ID_PONTO_ESCALA = ' + IntToStr(pId));

    Result := TT2TiORM.Excluir(ObjetoLocal);
    TratarRetorno(Result);
  finally
    FreeAndNil(ObjetoLocal)
  end;
end;

class function TPontoEscalaController.GetDataSet: TClientDataSet;
begin
  Result := FDataSet;
end;

class procedure TPontoEscalaController.SetDataSet(pDataSet: TClientDataSet);
begin
  FDataSet := pDataSet;
end;

class procedure TPontoEscalaController.TratarListaRetorno(pListaObjetos: TObjectList<TVO>);
begin
  try
    TratarRetorno<TPontoEscalaVO>(TObjectList<TPontoEscalaVO>(pListaObjetos));
  finally
    FreeAndNil(pListaObjetos);
  end;
end;

initialization
  Classes.RegisterClass(TPontoEscalaController);

finalization
  Classes.UnRegisterClass(TPontoEscalaController);

end.
