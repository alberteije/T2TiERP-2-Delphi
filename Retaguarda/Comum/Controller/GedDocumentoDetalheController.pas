{*******************************************************************************
Title: T2Ti ERP                                                                 
Description: Controller do lado Cliente relacionado à tabela [GED_DOCUMENTO_DETALHE] 
                                                                                
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
unit GedDocumentoDetalheController;

interface

uses
  Classes, Dialogs, SysUtils, DBClient, DB,  Windows, Forms, Controller, Rtti,
  Atributos, VO, Generics.Collections, GedDocumentoDetalheVO, GedVersaoDocumentoVO,
  DBXJson, Biblioteca;

type
  TGedDocumentoDetalheController = class(TController)
  private
    class var FDataSet: TClientDataSet;
  public
    class procedure Consulta(pFiltro: String; pPagina: String; pConsultaCompleta: Boolean = False);
    class function ConsultaLista(pFiltro: String): TObjectList<TGedDocumentoDetalheVO>;
    class function ConsultaObjeto(pFiltro: String): TGedDocumentoDetalheVO;

    class procedure Insere(pObjeto: TGedDocumentoDetalheVO);
    class function Altera(pObjeto: TGedDocumentoDetalheVO; pArrayArquivos: TJSONValue): Boolean;

    class function Exclui(pId: Integer): Boolean;

    class function GetDataSet: TClientDataSet; override;
    class procedure SetDataSet(pDataSet: TClientDataSet); override;
    class procedure TratarListaRetorno(pListaObjetos: TObjectList<TVO>);

    class function ArmazenarArquivo(pArrayArquivos: TJSONValue; pOperacao: String; pIdPai: Integer): Boolean;

  end;

implementation

uses UDataModule, T2TiORM;

class procedure TGedDocumentoDetalheController.Consulta(pFiltro: String; pPagina: String; pConsultaCompleta: Boolean);
var
  Retorno: TObjectList<TGedDocumentoDetalheVO>;
begin
  try
    Retorno := TT2TiORM.Consultar<TGedDocumentoDetalheVO>(pFiltro, pPagina, pConsultaCompleta);
    TratarRetorno<TGedDocumentoDetalheVO>(Retorno);
  finally
  end;
end;

class function TGedDocumentoDetalheController.ConsultaLista(pFiltro: String): TObjectList<TGedDocumentoDetalheVO>;
begin
  try
    Result := TT2TiORM.Consultar<TGedDocumentoDetalheVO>(pFiltro, '-1', True);
  finally
  end;
end;

class function TGedDocumentoDetalheController.ConsultaObjeto(pFiltro: String): TGedDocumentoDetalheVO;
begin
  try
    Result := TT2TiORM.ConsultarUmObjeto<TGedDocumentoDetalheVO>(pFiltro, True);
  finally
  end;
end;

class procedure TGedDocumentoDetalheController.Insere(pObjeto: TGedDocumentoDetalheVO);
var
  UltimoID: Integer;
begin
  try
    UltimoID := TT2TiORM.Inserir(pObjeto);
    Consulta('ID = ' + IntToStr(UltimoID), '0');
  finally
  end;
end;

class function TGedDocumentoDetalheController.Altera(pObjeto: TGedDocumentoDetalheVO; pArrayArquivos: TJSONValue): Boolean;
var
  UltimoID: Integer;
  VersaoDocumento: TGedVersaoDocumentoVO;
begin
  try
    if pObjeto.Id > 0 then
    begin
      Result := TT2TiORM.Alterar(pObjeto);
      ArmazenarArquivo(pArrayArquivos, 'A', pObjeto.Id);
    end
    else
    begin
      UltimoID := TT2TiORM.Inserir(pObjeto);
      ArmazenarArquivo(pArrayArquivos, 'I', UltimoID);
      Result := True;
    end;
  finally
  end;
end;

class function TGedDocumentoDetalheController.Exclui(pId: Integer): Boolean;
var
  ObjetoLocal: TGedDocumentoDetalheVO;
begin
  try
    ObjetoLocal := TGedDocumentoDetalheVO.Create;
    ObjetoLocal.Id := pId;
    Result := TT2TiORM.Excluir(ObjetoLocal);
    TratarRetorno(Result);
  finally
    FreeAndNil(ObjetoLocal)
  end;
end;

class function TGedDocumentoDetalheController.GetDataSet: TClientDataSet;
begin
  Result := FDataSet;
end;

class procedure TGedDocumentoDetalheController.SetDataSet(pDataSet: TClientDataSet);
begin
  FDataSet := pDataSet;
end;

class procedure TGedDocumentoDetalheController.TratarListaRetorno(pListaObjetos: TObjectList<TVO>);
begin
  try
    TratarRetorno<TGedDocumentoDetalheVO>(TObjectList<TGedDocumentoDetalheVO>(pListaObjetos));
  finally
    FreeAndNil(pListaObjetos);
  end;
end;

class function TGedDocumentoDetalheController.ArmazenarArquivo(pArrayArquivos: TJSONValue; pOperacao: String; pIdPai: Integer): Boolean;
var
  TipoArquivo, ArquivoString, AssinaturaString, MD5: String;
  I, TamanhoArquivo, TamanhoAssinatura, UltimoIdVersao: Integer;
  ArrayStringsArquivo, ArrayStringsAssinatura: TStringList;
  ArquivoBytes, AssinaturaBytes: Tbytes;
  ArquivoStream, AssinaturaStream: TStringStream;
  VersaoDocumento: TGedVersaoDocumentoVO;
begin
  if not DirectoryExists(ExtractFilePath(Application.ExeName) + '\Arquivos\GED\') then
    ForceDirectories(ExtractFilePath(Application.ExeName) + '\Arquivos\GED\');

  ArrayStringsArquivo := nil;
  ArrayStringsAssinatura := nil;
  ArquivoStream := nil;
  AssinaturaStream := nil;

  try
    try
      //na posicao cinco temos o MD5 do arquivo enviado
      MD5 := (pArrayArquivos as TJSONArray).Get(5).ToString;
      //retira as aspas do JSON
      Delete(MD5, Length(MD5), 1);
      Delete(MD5, 1, 1);

      //na posicao zero temos o arquivo de assinatura
      AssinaturaString := (pArrayArquivos as TJSONArray).Get(0).ToString;
      //retira as aspas do JSON
      Delete(AssinaturaString, Length(AssinaturaString), 1);
      Delete(AssinaturaString, 1, 1);

      //na posicao um temos o tamanho do arquivo de assinatura
      TamanhoAssinatura := StrToInt((pArrayArquivos as TJSONArray).Get(1).ToString);

      if TamanhoAssinatura > 0 then
      begin
        //salva o arquivo de assinatura em disco
        ArrayStringsAssinatura := TStringList.Create;
        Split(',',AssinaturaString, ArrayStringsAssinatura);

        SetLength(AssinaturaBytes, TamanhoAssinatura);

        for I := 0 to TamanhoAssinatura - 1 do
        begin
          AssinaturaBytes[i] := StrToInt(ArrayStringsAssinatura[i]);
        end;
        AssinaturaStream := TStringStream.Create(AssinaturaBytes);
        AssinaturaStream.SaveToFile(ExtractFilePath(Application.ExeName) + '\Arquivos\GED\' + MD5 + '.assinatura');
      end;

      //na posicao dois temos o arquivo enviado
      ArquivoString := (pArrayArquivos as TJSONArray).Get(2).ToString;
      //retira as aspas do JSON
      Delete(ArquivoString, Length(ArquivoString), 1);
      Delete(ArquivoString, 1, 1);

      //na posicao tres temos o tamanho do arquivo enviado
      TamanhoArquivo := StrToInt((pArrayArquivos as TJSONArray).Get(3).ToString);

      //na posicao quatro temos o tipo de arquivo enviado
      TipoArquivo := (pArrayArquivos as TJSONArray).Get(4).ToString;
      //retira as aspas do JSON
      Delete(TipoArquivo, Length(TipoArquivo), 1);
      Delete(TipoArquivo, 1, 1);

      //salva o arquivo enviado em disco
      ArrayStringsArquivo := TStringList.Create;
      Split(',',ArquivoString, ArrayStringsArquivo);

      SetLength(ArquivoBytes, TamanhoArquivo);

      for I := 0 to TamanhoArquivo - 1 do
      begin
        ArquivoBytes[i] := StrToInt(ArrayStringsArquivo[i]);
      end;
      ArquivoStream := TStringStream.Create(ArquivoBytes);
      ArquivoStream.SaveToFile(ExtractFilePath(Application.ExeName) + '\Arquivos\GED\' + MD5 + tipoarquivo);

      //devemos inserir um registro de versionamento informando a inclusão/alteração do documento
      if pOperacao = 'I' then
      begin
        VersaoDocumento := TGedVersaoDocumentoVO.Create;
        VersaoDocumento.Versao := 1;
        VersaoDocumento.Acao := 'I';
      end
      else if pOperacao = 'A' then
      begin
        UltimoIdVersao := TT2TiORM.SelectMax('GED_VERSAO_DOCUMENTO', 'ID_GED_DOCUMENTO=' + QuotedStr(IntToStr(pIdPai)));
        if UltimoIdVersao = -1 then
        begin
          VersaoDocumento := TGedVersaoDocumentoVO.Create;
          VersaoDocumento.Versao := 1;
        end
        else
        begin
          VersaoDocumento := TT2TiORM.ConsultarUmObjeto<TGedVersaoDocumentoVO>('ID=' + QuotedStr(IntToStr(UltimoIdVersao)), True);
          VersaoDocumento.Versao := VersaoDocumento.Versao + 1;
        end;
        VersaoDocumento.Acao := 'A';
      end;

      VersaoDocumento.IdColaborador := Sessao.Usuario.Id;
      VersaoDocumento.IdGedDocumento := pIdPai;
      VersaoDocumento.DataHora := Now;
      VersaoDocumento.HashArquivo := MD5;
      VersaoDocumento.Caminho := ExtractFilePath(Application.ExeName) + '\Arquivos\GED\' + MD5 + tipoarquivo;
      VersaoDocumento.Caminho := StringReplace(VersaoDocumento.Caminho,'\','/',[rfReplaceAll]);

      TT2TiORM.Inserir(VersaoDocumento);

      Result := True;
    except
      Result := False;
    end;
  finally
    ArrayStringsArquivo.Free;
    ArrayStringsAssinatura.Free;
    ArquivoStream.Free;
    AssinaturaStream.Free;
  end;
end;

initialization
  Classes.RegisterClass(TGedDocumentoDetalheController);

finalization
  Classes.UnRegisterClass(TGedDocumentoDetalheController);

end.
