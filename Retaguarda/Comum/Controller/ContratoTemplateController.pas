{*******************************************************************************
Title: T2Ti ERP                                                                 
Description: Controller do lado Cliente relacionado à tabela [CONTRATO_TEMPLATE] 
                                                                                
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
unit ContratoTemplateController;

interface

uses
  Classes, Dialogs, SysUtils, DBClient, DB,  Windows, Forms, Controller, Rtti,
  Atributos, VO, Generics.Collections, ContratoTemplateVO, Biblioteca;

type
  TContratoTemplateController = class(TController)
  private
    class var FDataSet: TClientDataSet;
    class function ArmazenarArquivo(pObjeto: TContratoTemplateVO): Boolean;
  public
    class procedure Consulta(pFiltro: String; pPagina: String; pConsultaCompleta: Boolean = False);
    class function ConsultaLista(pFiltro: String): TObjectList<TContratoTemplateVO>;
    class function ConsultaObjeto(pFiltro: String): TContratoTemplateVO;

    class procedure Insere(pObjeto: TContratoTemplateVO);
    class function Altera(pObjeto: TContratoTemplateVO): Boolean;

    class function Exclui(pId: Integer): Boolean;

    class function GetDataSet: TClientDataSet; override;
    class procedure SetDataSet(pDataSet: TClientDataSet); override;
    class procedure TratarListaRetorno(pListaObjetos: TObjectList<TVO>);

    class function BaixarArquivo(pFiltro: String): String;
  end;

implementation

uses UDataModule, T2TiORM;

class procedure TContratoTemplateController.Consulta(pFiltro: String; pPagina: String; pConsultaCompleta: Boolean);
var
  Retorno: TObjectList<TContratoTemplateVO>;
begin
  try
    Retorno := TT2TiORM.Consultar<TContratoTemplateVO>(pFiltro, pPagina, pConsultaCompleta);
    TratarRetorno<TContratoTemplateVO>(Retorno);
  finally
  end;
end;

class function TContratoTemplateController.ConsultaLista(pFiltro: String): TObjectList<TContratoTemplateVO>;
begin
  try
    Result := TT2TiORM.Consultar<TContratoTemplateVO>(pFiltro, '-1', True);
  finally
  end;
end;

class function TContratoTemplateController.ConsultaObjeto(pFiltro: String): TContratoTemplateVO;
begin
  try
    Result := TT2TiORM.ConsultarUmObjeto<TContratoTemplateVO>(pFiltro, True);
  finally
  end;
end;

class procedure TContratoTemplateController.Insere(pObjeto: TContratoTemplateVO);
var
  UltimoID: Integer;
begin
  try
    UltimoID := TT2TiORM.Inserir(pObjeto);

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

class function TContratoTemplateController.Altera(pObjeto: TContratoTemplateVO): Boolean;
begin
  try
    // Se subiu um documento, armazena
    if pObjeto.Arquivo <> '' then
      Result := ArmazenarArquivo(pObjeto);

    Result := TT2TiORM.Alterar(pObjeto);
  finally
  end;
end;

class function TContratoTemplateController.Exclui(pId: Integer): Boolean;
var
  ObjetoLocal: TContratoTemplateVO;
begin
  try
    ObjetoLocal := TContratoTemplateVO.Create;
    ObjetoLocal.Id := pId;
    Result := TT2TiORM.Excluir(ObjetoLocal);
    TratarRetorno(Result);
  finally
    FreeAndNil(ObjetoLocal)
  end;
end;

class function TContratoTemplateController.GetDataSet: TClientDataSet;
begin
  Result := FDataSet;
end;

class procedure TContratoTemplateController.SetDataSet(pDataSet: TClientDataSet);
begin
  FDataSet := pDataSet;
end;

class procedure TContratoTemplateController.TratarListaRetorno(pListaObjetos: TObjectList<TVO>);
begin
  try
    TratarRetorno<TContratoTemplateVO>(TObjectList<TContratoTemplateVO>(pListaObjetos));
  finally
    FreeAndNil(pListaObjetos);
  end;
end;

class function TContratoTemplateController.ArmazenarArquivo(pObjeto: TContratoTemplateVO): Boolean;
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
    if not DirectoryExists(ExtractFilePath(Application.ExeName) + '\Arquivos')then
      CreateDir(ExtractFilePath(Application.ExeName) + '\Arquivos');
    if not DirectoryExists(ExtractFilePath(Application.ExeName) + '\Arquivos\Contratos')then
      CreateDir(ExtractFilePath(Application.ExeName) + '\Arquivos\Contratos');
    if not DirectoryExists(ExtractFilePath(Application.ExeName) + '\Arquivos\Contratos\Templates')then
      CreateDir(ExtractFilePath(Application.ExeName) + '\Arquivos\Contratos\Templates');
    ArquivoStream.SaveToFile(ExtractFilePath(Application.ExeName) + '\Arquivos\Contratos\Templates\' + IntToStr(pObjeto.Id) + pObjeto.TipoArquivo);

    Result := True;
  finally
    ArrayStringsArquivo.Free;
    ArquivoStream.Free;
  end;
end;

class function TContratoTemplateController.BaixarArquivo(pFiltro: String): String;
begin
  try
    Result := ExtractFilePath(Application.ExeName) + 'Arquivos\Contratos\Templates\' + pFiltro;
  finally
  end;
end;


initialization
  Classes.RegisterClass(TContratoTemplateController);

finalization
  Classes.UnRegisterClass(TContratoTemplateController);

end.
