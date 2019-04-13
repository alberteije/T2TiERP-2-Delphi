{*******************************************************************************
Title: T2Ti ERP                                                                 
Description: Controller do lado Cliente relacionado à tabela [FOLHA_PPP] 
                                                                                
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
unit FolhaPppController;

interface

uses
  Classes, Dialogs, SysUtils, DBClient, DB,  Windows, Forms, Controller, Rtti,
  Atributos, VO, Generics.Collections, FolhaPppVO;

type
  TFolhaPppController = class(TController)
  private
    class var FDataSet: TClientDataSet;
  public
    class procedure Consulta(pFiltro: String; pPagina: String; pConsultaCompleta: Boolean = False);
    class function ConsultaLista(pFiltro: String): TObjectList<TFolhaPppVO>;
    class function ConsultaObjeto(pFiltro: String): TFolhaPppVO;

    class procedure Insere(pObjeto: TFolhaPppVO);
    class function Altera(pObjeto: TFolhaPppVO): Boolean;

    class function Exclui(pId: Integer): Boolean;

    class function GetDataSet: TClientDataSet; override;
    class procedure SetDataSet(pDataSet: TClientDataSet); override;
    class procedure TratarListaRetorno(pListaObjetos: TObjectList<TVO>);
  end;

implementation

uses UDataModule, T2TiORM, FolhaPppCatVO, FolhaPppAtividadeVO, FolhaPppFatorRiscoVO,
  FolhaPppExameMedicoVO;

class procedure TFolhaPppController.Consulta(pFiltro: String; pPagina: String; pConsultaCompleta: Boolean);
var
  Retorno: TObjectList<TFolhaPppVO>;
begin
  try
    Retorno := TT2TiORM.Consultar<TFolhaPppVO>(pFiltro, pPagina, pConsultaCompleta);
    TratarRetorno<TFolhaPppVO>(Retorno);
  finally
  end;
end;

class function TFolhaPppController.ConsultaLista(pFiltro: String): TObjectList<TFolhaPppVO>;
begin
  try
    Result := TT2TiORM.Consultar<TFolhaPppVO>(pFiltro, '-1', True);
  finally
  end;
end;

class function TFolhaPppController.ConsultaObjeto(pFiltro: String): TFolhaPppVO;
begin
  try
    Result := TT2TiORM.ConsultarUmObjeto<TFolhaPppVO>(pFiltro, True);
  finally
  end;
end;

class procedure TFolhaPppController.Insere(pObjeto: TFolhaPppVO);
var
  UltimoID: Integer;
  FolhaPppCatEnumerator: TEnumerator<TFolhaPppCatVO>;
  FolhaPppAtividadeEnumerator: TEnumerator<TFolhaPppAtividadeVO>;
  FolhaPppFatorRiscoEnumerator: TEnumerator<TFolhaPppFatorRiscoVO>;
  FolhaPppExameMedicoEnumerator: TEnumerator<TFolhaPppExameMedicoVO>;
begin
  try
    UltimoID := TT2TiORM.Inserir(pObjeto);


      // CAT
      FolhaPppCatEnumerator := pObjeto.ListaFolhaPppCatVO.GetEnumerator;
      try
        with FolhaPppCatEnumerator do
        begin
          while MoveNext do
          begin
            Current.IdFolhaPpp := UltimoID;
            TT2TiORM.Inserir(Current);
          end;
        end;
      finally
        FreeAndNil(FolhaPppCatEnumerator);
      end;

      // Atividade
      FolhaPppAtividadeEnumerator := pObjeto.ListaFolhaPppAtividadeVO.GetEnumerator;
      try
        with FolhaPppAtividadeEnumerator do
        begin
          while MoveNext do
          begin
            Current.IdFolhaPpp := UltimoID;
            TT2TiORM.Inserir(Current);
          end;
        end;
      finally
        FreeAndNil(FolhaPppAtividadeEnumerator);
      end;

      // Fator Risco
      FolhaPppFatorRiscoEnumerator := pObjeto.ListaFolhaPppFatorRiscoVO.GetEnumerator;
      try
        with FolhaPppFatorRiscoEnumerator do
        begin
          while MoveNext do
          begin
            Current.IdFolhaPpp := UltimoID;
            TT2TiORM.Inserir(Current);
          end;
        end;
      finally
        FreeAndNil(FolhaPppFatorRiscoEnumerator);
      end;

      // Exame Médico
      FolhaPppExameMedicoEnumerator := pObjeto.ListaFolhaPppExameMedicoVO.GetEnumerator;
      try
        with FolhaPppExameMedicoEnumerator do
        begin
          while MoveNext do
          begin
            Current.IdFolhaPpp := UltimoID;
            TT2TiORM.Inserir(Current);
          end;
        end;
      finally
        FreeAndNil(FolhaPppExameMedicoEnumerator);
      end;


    Consulta('ID = ' + IntToStr(UltimoID), '0');
  finally
  end;
end;

class function TFolhaPppController.Altera(pObjeto: TFolhaPppVO): Boolean;
var
  FolhaPppCatEnumerator: TEnumerator<TFolhaPppCatVO>;
  FolhaPppAtividadeEnumerator: TEnumerator<TFolhaPppAtividadeVO>;
  FolhaPppFatorRiscoEnumerator: TEnumerator<TFolhaPppFatorRiscoVO>;
  FolhaPppExameMedicoEnumerator: TEnumerator<TFolhaPppExameMedicoVO>;
begin
  try
    Result := TT2TiORM.Alterar(pObjeto);

 // CAT
    try
      FolhaPppCatEnumerator := pObjeto.ListaFolhaPppCatVO.GetEnumerator;
      with FolhaPppCatEnumerator do
      begin
        while MoveNext do
        begin
          if Current.Id > 0 then
            Result := TT2TiORM.Alterar(Current)
          else
          begin
            Current.IdFolhaPpp := pObjeto.Id;
            Result := TT2TiORM.Inserir(Current) > 0;
          end;
        end;
      end;
    finally
      FreeAndNil(FolhaPppCatEnumerator);
    end;

    // Atividade
    try
      FolhaPppAtividadeEnumerator := pObjeto.ListaFolhaPppAtividadeVO.GetEnumerator;
      with FolhaPppAtividadeEnumerator do
      begin
        while MoveNext do
        begin
          if Current.Id > 0 then
            Result := TT2TiORM.Alterar(Current)
          else
          begin
            Current.IdFolhaPpp := pObjeto.Id;
            Result := TT2TiORM.Inserir(Current) > 0;
          end;
        end;
      end;
    finally
      FreeAndNil(FolhaPppAtividadeEnumerator);
    end;

    // Fator Risco
    try
      FolhaPppFatorRiscoEnumerator := pObjeto.ListaFolhaPppFatorRiscoVO.GetEnumerator;
      with FolhaPppFatorRiscoEnumerator do
      begin
        while MoveNext do
        begin
          if Current.Id > 0 then
            Result := TT2TiORM.Alterar(Current)
          else
          begin
            Current.IdFolhaPpp := pObjeto.Id;
            Result := TT2TiORM.Inserir(Current) > 0;
          end;
        end;
      end;
    finally
      FreeAndNil(FolhaPppFatorRiscoEnumerator);
    end;

    // Exame Médico
    try
      FolhaPppExameMedicoEnumerator := pObjeto.ListaFolhaPppExameMedicoVO.GetEnumerator;
      with FolhaPppExameMedicoEnumerator do
      begin
        while MoveNext do
        begin
          if Current.Id > 0 then
            Result := TT2TiORM.Alterar(Current)
          else
          begin
            Current.IdFolhaPpp := pObjeto.Id;
            Result := TT2TiORM.Inserir(Current) > 0;
          end;
        end;
      end;
    finally
      FreeAndNil(FolhaPppExameMedicoEnumerator);
    end;

  finally
  end;
end;

class function TFolhaPppController.Exclui(pId: Integer): Boolean;
var
  ObjetoLocal: TFolhaPppVO;
begin
  try
    ObjetoLocal := TFolhaPppVO.Create;
    ObjetoLocal.Id := pId;
    Result := TT2TiORM.Excluir(ObjetoLocal);
    TratarRetorno(Result);
  finally
    FreeAndNil(ObjetoLocal)
  end;
end;

class function TFolhaPppController.GetDataSet: TClientDataSet;
begin
  Result := FDataSet;
end;

class procedure TFolhaPppController.SetDataSet(pDataSet: TClientDataSet);
begin
  FDataSet := pDataSet;
end;

class procedure TFolhaPppController.TratarListaRetorno(pListaObjetos: TObjectList<TVO>);
begin
  try
    TratarRetorno<TFolhaPppVO>(TObjectList<TFolhaPppVO>(pListaObjetos));
  finally
    FreeAndNil(pListaObjetos);
  end;
end;

initialization
  Classes.RegisterClass(TFolhaPppController);

finalization
  Classes.UnRegisterClass(TFolhaPppController);

end.
