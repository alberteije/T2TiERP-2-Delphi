{*******************************************************************************
Title: T2Ti ERP                                                                 
Description: Controller do lado Cliente relacionado à tabela [PATRIM_BEM] 
                                                                                
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
unit PatrimBemController;

interface

uses
  Classes, Dialogs, SysUtils, DBClient, DB,  Windows, Forms, Controller, Rtti,
  Atributos, VO, Generics.Collections, PatrimBemVO;

type
  TPatrimBemController = class(TController)
  private
    class var FDataSet: TClientDataSet;
  public
    class procedure Consulta(pFiltro: String; pPagina: String; pConsultaCompleta: Boolean = False);
    class function ConsultaLista(pFiltro: String): TObjectList<TPatrimBemVO>;
    class function ConsultaObjeto(pFiltro: String): TPatrimBemVO;

    class procedure Insere(pObjeto: TPatrimBemVO);
    class function Altera(pObjeto: TPatrimBemVO): Boolean;

    class function Exclui(pId: Integer): Boolean;

    class function GetDataSet: TClientDataSet; override;
    class procedure SetDataSet(pDataSet: TClientDataSet); override;
    class procedure TratarListaRetorno(pListaObjetos: TObjectList<TVO>);
  end;

implementation

uses UDataModule, T2TiORM, PatrimDocumentoBemVO, PatrimDepreciacaoBemVO, PatrimMovimentacaoBemVO;

class procedure TPatrimBemController.Consulta(pFiltro: String; pPagina: String; pConsultaCompleta: Boolean);
var
  Retorno: TObjectList<TPatrimBemVO>;
begin
  try
    Retorno := TT2TiORM.Consultar<TPatrimBemVO>(pFiltro, pPagina, pConsultaCompleta);
    TratarRetorno<TPatrimBemVO>(Retorno);
  finally
  end;
end;

class function TPatrimBemController.ConsultaLista(pFiltro: String): TObjectList<TPatrimBemVO>;
begin
  try
    Result := TT2TiORM.Consultar<TPatrimBemVO>(pFiltro, '-1', True);
  finally
  end;
end;

class function TPatrimBemController.ConsultaObjeto(pFiltro: String): TPatrimBemVO;
begin
  try
    Result := TT2TiORM.ConsultarUmObjeto<TPatrimBemVO>(pFiltro, True);
  finally
  end;
end;

class procedure TPatrimBemController.Insere(pObjeto: TPatrimBemVO);
var
  UltimoID: Integer;
  DocumentoBemVO: TPatrimDocumentoBemVO;
  DepreciacaoBemVO: TPatrimDepreciacaoBemVO;
  MovimentacaoBemVO: TPatrimMovimentacaoBemVO;
  DocumentoBemEnumerator: TEnumerator<TPatrimDocumentoBemVO>;
  DepreciacaoBemEnumerator: TEnumerator<TPatrimDepreciacaoBemVO>;
  MovimentacaoBemEnumerator: TEnumerator<TPatrimMovimentacaoBemVO>;
begin
  try
    UltimoID := TT2TiORM.Inserir(pObjeto);

    // Documento
    DocumentoBemEnumerator := pObjeto.ListaPatrimDocumentoBemVO.GetEnumerator;
    try
      with DocumentoBemEnumerator do
      begin
        while MoveNext do
        begin
          DocumentoBemVO := Current;
          DocumentoBemVO.IdPatrimBem := UltimoID;
          TT2TiORM.Inserir(DocumentoBemVO);
        end;
      end;
    finally
      DocumentoBemEnumerator.Free;
    end;

    // Depreciação
    DepreciacaoBemEnumerator := pObjeto.ListaPatrimDepreciacaoBemVO.GetEnumerator;
    try
      with DepreciacaoBemEnumerator do
      begin
        while MoveNext do
        begin
          DepreciacaoBemVO := Current;
          DepreciacaoBemVO.IdPatrimBem := UltimoID;
          TT2TiORM.Inserir(DepreciacaoBemVO);
        end;
      end;
    finally
      DepreciacaoBemEnumerator.Free;
    end;

    // Movimentação
    MovimentacaoBemEnumerator := pObjeto.ListaPatrimMovimentacaoBemVO.GetEnumerator;
    try
      with MovimentacaoBemEnumerator do
      begin
        while MoveNext do
        begin
          MovimentacaoBemVO := Current;
          MovimentacaoBemVO.IdPatrimBem := UltimoID;
          TT2TiORM.Inserir(MovimentacaoBemVO);
        end;
      end;
    finally
      MovimentacaoBemEnumerator.Free;
    end;

    Consulta('ID = ' + IntToStr(UltimoID), '0');
  finally
  end;
end;

class function TPatrimBemController.Altera(pObjeto: TPatrimBemVO): Boolean;
var
  DocumentoBemEnumerator: TEnumerator<TPatrimDocumentoBemVO>;
  DepreciacaoBemEnumerator: TEnumerator<TPatrimDepreciacaoBemVO>;
  MovimentacaoBemEnumerator: TEnumerator<TPatrimMovimentacaoBemVO>;
begin
  try
    Result := TT2TiORM.Alterar(pObjeto);

    // Documento
    try
      DocumentoBemEnumerator := pObjeto.ListaPatrimDocumentoBemVO.GetEnumerator;
      with DocumentoBemEnumerator do
      begin
        while MoveNext do
        begin
          if Current.Id > 0 then
            Result := TT2TiORM.Alterar(Current)
          else
          begin
            Current.IdPatrimBem := pObjeto.Id;
            Result := TT2TiORM.Inserir(Current) > 0;
          end;
        end;
      end;
    finally
      FreeAndNil(DocumentoBemEnumerator);
    end;

    // Depreciação
    try
      DepreciacaoBemEnumerator := pObjeto.ListaPatrimDepreciacaoBemVO.GetEnumerator;
      with DepreciacaoBemEnumerator do
      begin
        while MoveNext do
        begin
          if Current.Id > 0 then
            Result := TT2TiORM.Alterar(Current)
          else
          begin
            Current.IdPatrimBem := pObjeto.Id;
            Result := TT2TiORM.Inserir(Current) > 0;
          end;
        end;
      end;
    finally
      FreeAndNil(DepreciacaoBemEnumerator);
    end;

    // Movimentação
    try
      MovimentacaoBemEnumerator := pObjeto.ListaPatrimMovimentacaoBemVO.GetEnumerator;
      with MovimentacaoBemEnumerator do
      begin
        while MoveNext do
        begin
          if Current.Id > 0 then
            Result := TT2TiORM.Alterar(Current)
          else
          begin
            Current.IdPatrimBem := pObjeto.Id;
            Result := TT2TiORM.Inserir(Current) > 0;
          end;
        end;
      end;
    finally
      FreeAndNil(MovimentacaoBemEnumerator);
    end;

  finally
  end;
end;

class function TPatrimBemController.Exclui(pId: Integer): Boolean;
var
  ObjetoLocal: TPatrimBemVO;
begin
  try
    ObjetoLocal := TPatrimBemVO.Create;
    ObjetoLocal.Id := pId;
    Result := TT2TiORM.Excluir(ObjetoLocal);
    TratarRetorno(Result);
  finally
    FreeAndNil(ObjetoLocal)
  end;
end;

class function TPatrimBemController.GetDataSet: TClientDataSet;
begin
  Result := FDataSet;
end;

class procedure TPatrimBemController.SetDataSet(pDataSet: TClientDataSet);
begin
  FDataSet := pDataSet;
end;

class procedure TPatrimBemController.TratarListaRetorno(pListaObjetos: TObjectList<TVO>);
begin
  try
    TratarRetorno<TPatrimBemVO>(TObjectList<TPatrimBemVO>(pListaObjetos));
  finally
    FreeAndNil(pListaObjetos);
  end;
end;

initialization
  Classes.RegisterClass(TPatrimBemController);

finalization
  Classes.UnRegisterClass(TPatrimBemController);

end.
