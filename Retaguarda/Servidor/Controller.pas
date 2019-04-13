{ *******************************************************************************
Title: T2Ti ERP
Description: Unit de controle Base - Servidor.

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
******************************************************************************* }
unit Controller;

interface

uses
  Classes, DSServer, DBClient, DBXJSON, SessaoUsuario, T2TiORM, SysUtils, Generics.Collections,
  RTTI, VO, JSonVO, Conversor, Biblioteca;

type
{$METHODINFO ON}
  TArrayParametros = array of TValue;

  TController = class(TPersistent)
  public
    class var JsonArrayResposta: TJSONArray;
    class var FDataSet: TClientDataSet;

    function Sessao(pIdSessao: String): TSessaoUsuario;
    class function GetDataSet: TClientDataSet; virtual;
    class procedure SetDataSet(pDataSet: TClientDataSet); virtual;
    class procedure TratarRetorno<O: class>(pListaObjetos: TObjectList<O>); overload;
    class procedure TratarRetorno<O: class>(pObjeto: O); overload;
    class procedure TratarRetorno(pRetornoBoolean: Boolean); overload;
    class function MontarParametros(pParametros: String): TArrayParametros;

    // consultar
    function ObjetoJson(pSessao: String; pNomeClasseController: String; pNomeMetodo: String; pTipoRetorno: String; pParametros: String): TJSONArray;
    // inserir
    function AcceptObjetoJson(pSessao: String; pNomeClasseController: String; pNomeMetodo: String; pTipoRetorno: String; pObjeto: TJSONValue): TJSONArray;
    // alterar
    function UpdateObjetoJson(pSessao: String; pNomeClasseController: String; pNomeMetodo: String; pTipoRetorno: String; pObjeto: TJSONValue): TJSONArray;
    // excluir
    function CancelObjetoJson(pSessao: String; pNomeClasseController: String; pNomeMetodo: String; pTipoRetorno: String; pId: Integer): TJSONArray;
  end;
{$METHODINFO OFF}

implementation

{ TController }

{$Region 'Infra'}
class function TController.GetDataSet: TClientDataSet;
begin
  Result := nil;
end;

class procedure TController.SetDataSet(pDataSet: TClientDataSet);
begin
  // Usado no Lado Cliente
end;

class procedure TController.TratarRetorno<O>(pListaObjetos: TObjectList<O>);
var
  i: Integer;
begin
  try
    for i := 0 to pListaObjetos.Count - 1 do
    begin
      JsonArrayResposta.AddElement(TJSonVO.ObjectToJSON<O>(pListaObjetos[i]));
    end;
  finally
    FreeAndNil(pListaObjetos);
  end;
end;

class procedure TController.TratarRetorno<O>(pObjeto: O);
begin
  try
    JsonArrayResposta.AddElement(TJSonVO.ObjectToJSON<O>(pObjeto));
  finally
    FreeAndNil(pObjeto);
  end;
end;

class procedure TController.TratarRetorno(pRetornoBoolean: Boolean);
begin
  if pRetornoBoolean then
    JsonArrayResposta.AddElement(TJSONTrue.Create)
  else
    JsonArrayResposta.AddElement(TJSONFalse.Create);
end;

function TController.Sessao(pIdSessao: String): TSessaoUsuario;
begin
  Result := TListaSessaoUsuario.Instance.GetSessao(pIdSessao);
end;

{$EndRegion 'Infra'}

{$Region 'REST'}
function TController.ObjetoJson(pSessao, pNomeClasseController, pNomeMetodo, pTipoRetorno, pParametros: String): TJSONArray;
var
  Contexto: TRttiContext;
  RttiInstanceType: TRttiInstanceType;
  Parametros: TArrayParametros;
  RetornoLista: TObjectList<TVO>;
  RetornoObjeto: TVO;
  RetornoArquivo: String;

  I: Integer;
  BytesArquivo, TipoArquivo, NomeArquivo: String;
  ArquivoStream: TStringStream;
begin
  try
    if pNomeClasseController <> '' then
    begin
      try
        JsonArrayResposta := TJSONArray.Create;
        Result := JsonArrayResposta;

        Parametros := MontarParametros(pParametros);

        RttiInstanceType := Contexto.FindType(pNomeClasseController) as TRttiInstanceType;

        if pTipoRetorno = 'Lista' then
        begin
          RetornoLista := TObjectList<TVO>(RttiInstanceType.GetMethod(pNomeMetodo).Invoke(RttiInstanceType.MetaclassType, Parametros).AsObject);
          if Assigned(RetornoLista) then
            TratarRetorno<TVO>(RetornoLista);
        end
        else if pTipoRetorno = 'Objeto' then
        begin
          RetornoObjeto := TVO(RttiInstanceType.GetMethod(pNomeMetodo).Invoke(RttiInstanceType.MetaclassType, Parametros).AsObject);
          TratarRetorno<TVO>(RetornoObjeto);
        end
        else if pTipoRetorno = 'Arquivo' then
        begin
          RetornoArquivo := RttiInstanceType.GetMethod(pNomeMetodo).Invoke(RttiInstanceType.MetaclassType, [pParametros]).AsString;

          if FileExists(RetornoArquivo) then
          begin
            ArquivoStream := TStringStream.Create;
            ArquivoStream.LoadFromFile(RetornoArquivo);

            BytesArquivo := '';

            // laço pra pegar os bytes do arquivo ou imagem
            for I := 0 to ArquivoStream.Size - 1 do
            begin
              BytesArquivo := BytesArquivo + IntToStr(ArquivoStream.Bytes[i]) + ', ';
            end;
            // Tira a ultima virgula
            Delete(BytesArquivo, Length(BytesArquivo) - 1, 2);

            // adiciona o arquivo no array do json (posicao zero do array)
            Result.Add(BytesArquivo);

            // adiciona o nome do arquivo
            NomeArquivo := ExtractFileName(RetornoArquivo);
            Result.AddElement(TJSONString.Create(NomeArquivo));

            // adiciona o tipo do arquivo no array (posicao um do array)
            TipoArquivo := ExtractFileExt(RetornoArquivo);
            Result.AddElement(TJSONString.Create(TipoArquivo));
          end
          else
          begin
            Result.AddElement(TJSONString.Create('RESPOSTA'));
            Result.AddElement(TJSONString.Create('Arquivo Inexistente.'));
          end;

        end
        else
          // No caso de outros retornos: boolean, etc
          RttiInstanceType.GetMethod(pNomeMetodo).Invoke(RttiInstanceType.MetaclassType, Parametros);

      except
        on E: Exception do
        begin
          Result.AddElement(TJSOnString.Create('ERRO'));
          Result.AddElement(TJSOnString.Create(E.Message));
        end;
      end;
    end;
  finally
    Contexto.Free;
    ArquivoStream.Free;
  end;
end;

function TController.AcceptObjetoJson(pSessao, pNomeClasseController, pNomeMetodo, pTipoRetorno: String; pObjeto: TJSONValue): TJSONArray;
var
  ObjetoRecebido: TJSONObject;
  Contexto: TRttiContext;
  RttiInstanceType: TRttiInstanceType;
  NomeObjetoController: String;
  ObjetoLocal: TVO;
begin
  try
    try
      JsonArrayResposta := TJSONArray.Create;
      Result := JsonArrayResposta;

      ObjetoRecebido := TJSONObject.ParseJsonValue(TEncoding.UTF8.GetBytes(pObjeto.ToString), 0) as TJSONObject;

      ObjetoLocal := TJsonVO.JSONToObject<TVO>(ObjetoRecebido);

      Contexto := TRttiContext.Create;
      RttiInstanceType := Contexto.FindType(pNomeClasseController) as TRttiInstanceType;
      RttiInstanceType.GetMethod(pNomeMetodo).Invoke(RttiInstanceType.MetaclassType,[ObjetoLocal]);
    except
      on E: Exception do
      begin
        Result.AddElement(TJSOnString.Create('ERRO'));
        Result.AddElement(TJSOnString.Create(E.Message));
      end;
    end;
  finally
    Contexto.Free;
    FreeAndNil(ObjetoRecebido);
    FreeAndNil(ObjetoLocal);
  end;
end;

function TController.UpdateObjetoJson(pSessao, pNomeClasseController, pNomeMetodo, pTipoRetorno: String; pObjeto: TJSONValue): TJSONArray;
var
  ObjetoRecebido: TJSONObject;
  Contexto: TRttiContext;
  RttiInstanceType: TRttiInstanceType;
  NomeObjetoController: String;
  ObjetoLocal: TVO;
begin
  try
    try
      JsonArrayResposta := TJSONArray.Create;
      Result := JsonArrayResposta;

      ObjetoRecebido := TJSONObject.ParseJsonValue(TEncoding.UTF8.GetBytes(pObjeto.ToString), 0) as TJSONObject;

      ObjetoLocal := TJsonVO.JSONToObject<TVO>(ObjetoRecebido);

      Contexto := TRttiContext.Create;
      RttiInstanceType := Contexto.FindType(pNomeClasseController) as TRttiInstanceType;
      RttiInstanceType.GetMethod(pNomeMetodo).Invoke(RttiInstanceType.MetaclassType,[ObjetoLocal]);
    except
      on E: Exception do
      begin
        Result.AddElement(TJSOnString.Create('ERRO'));
        Result.AddElement(TJSOnString.Create(E.Message));
      end;
    end;
  finally
    Contexto.Free;
    FreeAndNil(ObjetoRecebido);
    FreeAndNil(ObjetoLocal);
  end;
end;

function TController.CancelObjetoJson(pSessao, pNomeClasseController, pNomeMetodo, pTipoRetorno: String; pId: Integer): TJSONArray;
var
  Contexto: TRttiContext;
  RttiInstanceType: TRttiInstanceType;
begin
  try
    try
      JsonArrayResposta := TJSONArray.Create;
      Result := JsonArrayResposta;

      Contexto := TRttiContext.Create;
      RttiInstanceType := Contexto.FindType(pNomeClasseController) as TRttiInstanceType;
      RttiInstanceType.GetMethod(pNomeMetodo).Invoke(RttiInstanceType.MetaclassType,[pId]);
    except
      on E: Exception do
      begin
        Result.AddElement(TJSOnString.Create('ERRO'));
        Result.AddElement(TJSOnString.Create(E.Message));
      end;
    end;
  finally
    Contexto.Free;
  end;
end;

class function TController.MontarParametros(pParametros: String): TArrayParametros;
var
  ListaParametros: TStringList;
  Parametro: String;
  I, ParametroInteiro: Integer;
begin
  try
    ListaParametros := TStringList.Create;

    ExtractStrings(['|'],[], PChar(pParametros), ListaParametros);

    SetLength(Result, ListaParametros.Count);

    for I := 0 to ListaParametros.Count - 1 do
    begin
      Parametro := ListaParametros[I];
      if Parametro = 'False' then
        Result[I] := False
      else if Parametro = 'True' then
        Result[I] := True
      else
      begin
        Parametro := StringReplace(Parametro, '*', '%', [rfReplaceAll]);
        Parametro := StringReplace(Parametro, '\"', '"', [rfReplaceAll]);
        Result[I] := Parametro;
      end;
    end;

  finally
    FreeAndNil(ListaParametros);
  end;
end;
{$EndRegion 'REST'}

end.
