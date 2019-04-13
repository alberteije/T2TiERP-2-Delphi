{*******************************************************************************
Title: T2Ti ERP                                                                 
Description: Controller do lado Cliente relacionado à tabela [CONTRATO] 
                                                                                
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
unit ContratoController;

interface

uses
  Classes, Dialogs, SysUtils, DBClient, DB,  Windows, Forms, Controller, Rtti,
  Atributos, VO, Generics.Collections, ContratoVO, Biblioteca;

type
  TContratoController = class(TController)
  private
    class var FDataSet: TClientDataSet;
    class function ArmazenarArquivo(pObjeto: TContratoVO): Boolean;
  public
    class procedure Consulta(pFiltro: String; pPagina: String; pConsultaCompleta: Boolean = False);
    class function ConsultaLista(pFiltro: String): TObjectList<TContratoVO>;
    class function ConsultaObjeto(pFiltro: String): TContratoVO;

    class procedure Insere(pObjeto: TContratoVO);
    class function Altera(pObjeto: TContratoVO): Boolean;

    class function Exclui(pId: Integer): Boolean;

    class function GetDataSet: TClientDataSet; override;
    class procedure SetDataSet(pDataSet: TClientDataSet); override;
    class procedure TratarListaRetorno(pListaObjetos: TObjectList<TVO>);

    class function BaixarArquivo(pFiltro: String): String;
  end;

implementation

uses UDataModule, T2TiORM, ContratoHistFaturamentoVO, ContratoHistoricoReajusteVO,
  ContratoPrevFaturamentoVO;

class procedure TContratoController.Consulta(pFiltro: String; pPagina: String; pConsultaCompleta: Boolean);
var
  Retorno: TObjectList<TContratoVO>;
begin
  try
    Retorno := TT2TiORM.Consultar<TContratoVO>(pFiltro, pPagina, pConsultaCompleta);
    TratarRetorno<TContratoVO>(Retorno);
  finally
  end;
end;

class function TContratoController.ConsultaLista(pFiltro: String): TObjectList<TContratoVO>;
begin
  try
    Result := TT2TiORM.Consultar<TContratoVO>(pFiltro, '-1', True);
  finally
  end;
end;

class function TContratoController.ConsultaObjeto(pFiltro: String): TContratoVO;
begin
  try
    Result := TT2TiORM.ConsultarUmObjeto<TContratoVO>(pFiltro, True);
  finally
  end;
end;

class procedure TContratoController.Insere(pObjeto: TContratoVO);
var
  UltimoID: Integer;
  HistoricoFaturamentoEnumerator: TEnumerator<TContratoHistFaturamentoVO>;
  HistoricoReajusteEnumerator: TEnumerator<TContratoHistoricoReajusteVO>;
  PrevisaoFaturamentoEnumerator: TEnumerator<TContratoPrevFaturamentoVO>;
begin
  try
    UltimoID := TT2TiORM.Inserir(pObjeto);

    // Histórico Faturamento
    HistoricoFaturamentoEnumerator := pObjeto.ListaContratoHistFaturamentoVO.GetEnumerator;
    try
      with HistoricoFaturamentoEnumerator do
      begin
        while MoveNext do
        begin
          Current.IdContrato := UltimoID;
          TT2TiORM.Inserir(Current);
        end;
      end;
    finally
      FreeAndNil(HistoricoFaturamentoEnumerator);
    end;

    // Histórico Reajuste
    HistoricoReajusteEnumerator := pObjeto.ListaContratoHistoricoReajusteVO.GetEnumerator;
    try
      with HistoricoReajusteEnumerator do
      begin
        while MoveNext do
        begin
          Current.IdContrato := UltimoID;
          TT2TiORM.Inserir(Current);
        end;
      end;
    finally
      FreeAndNil(HistoricoReajusteEnumerator);
    end;

    // Previsão Faturamento
    PrevisaoFaturamentoEnumerator := pObjeto.ListaContratoPrevFaturamentoVO.GetEnumerator;
    try
      with PrevisaoFaturamentoEnumerator do
      begin
        while MoveNext do
        begin
          Current.IdContrato := UltimoID;
          TT2TiORM.Inserir(Current);
        end;
      end;
    finally
      FreeAndNil(PrevisaoFaturamentoEnumerator);
    end;

    // Se subiu um documento, armazena
    if pObjeto.Arquivo <> '' then
    begin
      pObjeto.Id := UltimoID;
      ArmazenarArquivo(pObjeto);
    end;

    Consulta('ID = ' + IntToStr(UltimoID), '0');
  finally
  end;
end;

class function TContratoController.Altera(pObjeto: TContratoVO): Boolean;
var
  HistoricoFaturamentoEnumerator: TEnumerator<TContratoHistFaturamentoVO>;
  HistoricoReajusteEnumerator: TEnumerator<TContratoHistoricoReajusteVO>;
  PrevisaoFaturamentoEnumerator: TEnumerator<TContratoPrevFaturamentoVO>;
begin
  try
    try
      // Se subiu um documento, armazena
      if pObjeto.Arquivo <> '' then
        Result := ArmazenarArquivo(pObjeto);

      Result := TT2TiORM.Alterar(pObjeto);
    except
    end;

    // Histórico Faturamento
    try
      HistoricoFaturamentoEnumerator := pObjeto.ListaContratoHistFaturamentoVO.GetEnumerator;
      with HistoricoFaturamentoEnumerator do
      begin
        while MoveNext do
        begin
          if Current.Id > 0 then
            Result := TT2TiORM.Alterar(Current)
          else
          begin
            Current.IdContrato := pObjeto.Id;
            Result := TT2TiORM.Inserir(Current) > 0;
          end;
        end;
      end;
    finally
      FreeAndNil(HistoricoFaturamentoEnumerator);
    end;

    // Histórico Reajuste
    try
      HistoricoReajusteEnumerator := pObjeto.ListaContratoHistoricoReajusteVO.GetEnumerator;
      with HistoricoReajusteEnumerator do
      begin
        while MoveNext do
        begin
          if Current.Id > 0 then
            Result := TT2TiORM.Alterar(Current)
          else
          begin
            Current.IdContrato := pObjeto.Id;
            Result := TT2TiORM.Inserir(Current) > 0;
          end;
        end;
      end;
    finally
      FreeAndNil(HistoricoReajusteEnumerator);
    end;

    // Previsão Faturamento
    try
      PrevisaoFaturamentoEnumerator := pObjeto.ListaContratoPrevFaturamentoVO.GetEnumerator;
      with PrevisaoFaturamentoEnumerator do
      begin
        while MoveNext do
        begin
          if Current.Id > 0 then
            Result := TT2TiORM.Alterar(Current)
          else
          begin
            Current.IdContrato := pObjeto.Id;
            Result := TT2TiORM.Inserir(Current) > 0;
          end;
        end;
      end;
    finally
      FreeAndNil(PrevisaoFaturamentoEnumerator);
    end;

  finally
  end;
end;

class function TContratoController.Exclui(pId: Integer): Boolean;
var
  ObjetoLocal: TContratoVO;
begin
  try
    ObjetoLocal := TContratoVO.Create;
    ObjetoLocal.Id := pId;
    Result := TT2TiORM.Excluir(ObjetoLocal);
    TratarRetorno(Result);
  finally
    FreeAndNil(ObjetoLocal)
  end;
end;

class function TContratoController.GetDataSet: TClientDataSet;
begin
  Result := FDataSet;
end;

class procedure TContratoController.SetDataSet(pDataSet: TClientDataSet);
begin
  FDataSet := pDataSet;
end;

class procedure TContratoController.TratarListaRetorno(pListaObjetos: TObjectList<TVO>);
begin
  try
    TratarRetorno<TContratoVO>(TObjectList<TContratoVO>(pListaObjetos));
  finally
    FreeAndNil(pListaObjetos);
  end;
end;

class function TContratoController.ArmazenarArquivo(pObjeto: TContratoVO): Boolean;
var
  ArrayStringsArquivo: TStringList;
  ArquivoBytes: TBytes;
  ArquivoStream: TStringStream;
  i: Integer;
begin
  try
    Result := False;

    ArrayStringsArquivo := TStringList.Create;
    Split(',', pObjeto.Arquivo, ArrayStringsArquivo);
    SetLength(ArquivoBytes, ArrayStringsArquivo.Count);
    for i := 0 to ArrayStringsArquivo.Count - 1 do
    begin
      ArquivoBytes[i] := StrToInt(ArrayStringsArquivo[i]);
    end;
    ArquivoStream := TStringStream.Create(ArquivoBytes);
    if not DirectoryExists(ExtractFilePath(Application.ExeName) + 'Arquivos')then
      CreateDir(ExtractFilePath(Application.ExeName) + 'Arquivos');
    if not DirectoryExists(ExtractFilePath(Application.ExeName) + 'Arquivos\Contratos')then
      CreateDir(ExtractFilePath(Application.ExeName) + 'Arquivos\Contratos');
    ArquivoStream.SaveToFile(ExtractFilePath(Application.ExeName) + 'Arquivos\Contratos\' + IntToStr(pObjeto.Id) + pObjeto.TipoArquivo);

    Result := True;
  finally
    ArrayStringsArquivo.Free;
    ArquivoStream.Free;
  end;
end;

class function TContratoController.BaixarArquivo(pFiltro: String): String;
begin
  try
    Result := ExtractFilePath(Application.ExeName) + 'Arquivos\Contratos\' + pFiltro;
  finally
  end;
end;

initialization
  Classes.RegisterClass(TContratoController);

finalization
  Classes.UnRegisterClass(TContratoController);

end.
