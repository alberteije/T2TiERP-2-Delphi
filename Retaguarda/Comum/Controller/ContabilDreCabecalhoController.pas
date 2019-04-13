{*******************************************************************************
Title: T2Ti ERP                                                                 
Description: Controller do lado Cliente relacionado à tabela [CONTABIL_DRE_CABECALHO] 
                                                                                
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
unit ContabilDreCabecalhoController;

interface

uses
  Classes, Dialogs, SysUtils, DBClient, DB,  Windows, Forms, Controller, Rtti,
  Atributos, VO, Generics.Collections, ContabilDreCabecalhoVO, ContabilDreDetalheVO;

type
  TContabilDreCabecalhoController = class(TController)
  private
    class var FDataSet: TClientDataSet;
  public
    class procedure Consulta(pFiltro: String; pPagina: String; pConsultaCompleta: Boolean = False);
    class function ConsultaLista(pFiltro: String): TObjectList<TContabilDreCabecalhoVO>;
    class function ConsultaObjeto(pFiltro: String): TContabilDreCabecalhoVO;

    class procedure Insere(pObjeto: TContabilDreCabecalhoVO);
    class function Altera(pObjeto: TContabilDreCabecalhoVO): Boolean;

    class function Exclui(pId: Integer): Boolean;

    class function GetDataSet: TClientDataSet; override;
    class procedure SetDataSet(pDataSet: TClientDataSet); override;
    class procedure TratarListaRetorno(pListaObjetos: TObjectList<TVO>);
  end;

implementation

uses UDataModule, T2TiORM;

class procedure TContabilDreCabecalhoController.Consulta(pFiltro: String; pPagina: String; pConsultaCompleta: Boolean);
var
  Retorno: TObjectList<TContabilDreCabecalhoVO>;
begin
  try
    Retorno := TT2TiORM.Consultar<TContabilDreCabecalhoVO>(pFiltro, pPagina, pConsultaCompleta);
    TratarRetorno<TContabilDreCabecalhoVO>(Retorno);
  finally
  end;
end;

class function TContabilDreCabecalhoController.ConsultaLista(pFiltro: String): TObjectList<TContabilDreCabecalhoVO>;
begin
  try
    Result := TT2TiORM.Consultar<TContabilDreCabecalhoVO>(pFiltro, '-1', True);
  finally
  end;
end;

class function TContabilDreCabecalhoController.ConsultaObjeto(pFiltro: String): TContabilDreCabecalhoVO;
begin
  try
    Result := TT2TiORM.ConsultarUmObjeto<TContabilDreCabecalhoVO>(pFiltro, True);
  finally
  end;
end;

class procedure TContabilDreCabecalhoController.Insere(pObjeto: TContabilDreCabecalhoVO);
var
  UltimoID: Integer;
  ContabilDreDetalheEnumerator: TEnumerator<TContabilDreDetalheVO>;
begin
  try
    UltimoID := TT2TiORM.Inserir(pObjeto);

    // Detalhes
    ContabilDreDetalheEnumerator := pObjeto.ListaContabilDreDetalheVO.GetEnumerator;
    try
      with ContabilDreDetalheEnumerator do
      begin
        while MoveNext do
        begin
          Current.IdContabilDreCabecalho := UltimoID;
          TT2TiORM.Inserir(Current);
        end;
      end;
    finally
      ContabilDreDetalheEnumerator.Free;
    end;

    Consulta('ID = ' + IntToStr(UltimoID), '0');
  finally
  end;
end;

class function TContabilDreCabecalhoController.Altera(pObjeto: TContabilDreCabecalhoVO): Boolean;
var
  ContabilDreDetalheEnumerator: TEnumerator<TContabilDreDetalheVO>;
begin
  try
    Result := TT2TiORM.Alterar(pObjeto);

    // Detalhes
    try
      ContabilDreDetalheEnumerator := pObjeto.ListaContabilDreDetalheVO.GetEnumerator;
      with ContabilDreDetalheEnumerator do
      begin
        while MoveNext do
        begin
          if Current.Id > 0 then
            Result := TT2TiORM.Alterar(Current)
          else
          begin
            Current.IdContabilDreCabecalho := pObjeto.Id;
            Result := TT2TiORM.Inserir(Current) > 0;
          end;
        end;
      end;
    finally
      FreeAndNil(ContabilDreDetalheEnumerator);
    end;

  finally
  end;
end;

class function TContabilDreCabecalhoController.Exclui(pId: Integer): Boolean;
var
  ObjetoLocal: TContabilDreCabecalhoVO;
begin
  try
    ObjetoLocal := TContabilDreCabecalhoVO.Create;
    ObjetoLocal.Id := pId;
    Result := TT2TiORM.Excluir(ObjetoLocal);
    TratarRetorno(Result);
  finally
    FreeAndNil(ObjetoLocal)
  end;
end;

class function TContabilDreCabecalhoController.GetDataSet: TClientDataSet;
begin
  Result := FDataSet;
end;

class procedure TContabilDreCabecalhoController.SetDataSet(pDataSet: TClientDataSet);
begin
  FDataSet := pDataSet;
end;

class procedure TContabilDreCabecalhoController.TratarListaRetorno(pListaObjetos: TObjectList<TVO>);
begin
  try
    TratarRetorno<TContabilDreCabecalhoVO>(TObjectList<TContabilDreCabecalhoVO>(pListaObjetos));
  finally
    FreeAndNil(pListaObjetos);
  end;
end;

initialization
  Classes.RegisterClass(TContabilDreCabecalhoController);

finalization
  Classes.UnRegisterClass(TContabilDreCabecalhoController);

end.
