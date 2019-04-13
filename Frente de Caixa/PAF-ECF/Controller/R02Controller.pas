{*******************************************************************************
Title: T2Ti ERP                                                                 
Description: Controller relacionado à tabela [R02] 
                                                                                
The MIT License                                                                 
                                                                                
Copyright: Copyright (C) 2010 T2Ti.COM                                          
                                                                                
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
t2ti.com@gmail.com</p>

Albert Eije (T2Ti.COM)
@version 2.0
*******************************************************************************}
unit R02Controller;

interface

uses
  Classes, SysUtils, DBClient, DB, Windows, Forms, Controller, Rtti, Atributos,
  VO, R02VO, R03VO, Generics.Collections, Biblioteca;


type
  TR02Controller = class(TController)
  private
    class var FDataSet: TClientDataSet;
    class function Inserir(pObjeto: TR02VO): Integer;
  public
    class procedure Consulta(pFiltro: String; pPagina: String; pConsultaCompleta: Boolean = False);
    class function ConsultaLista(pFiltro: String): TObjectList<TR02VO>;
    class function ConsultaObjeto(pFiltro: String): TR02VO;
    class procedure Insere(pObjeto: TR02VO);
    class procedure InsereObjeto(pObjeto: TR02VO);
    class function Altera(pObjeto: TR02VO): Boolean;
    class function Exclui(pId: Integer): Boolean;
    class function GetDataSet: TClientDataSet; override;
    class procedure SetDataSet(pDataSet: TClientDataSet); override;
    class procedure TratarListaRetorno(pListaObjetos: TObjectList<TVO>);
  end;

implementation

uses T2TiORM;

class procedure TR02Controller.Consulta(pFiltro: String; pPagina: String; pConsultaCompleta: Boolean);
var
  Retorno: TObjectList<TR02VO>;
begin
  try
    Retorno := TT2TiORM.Consultar<TR02VO>(pFiltro, pPagina, pConsultaCompleta);
    TratarRetorno<TR02VO>(Retorno);
  finally
  end;
end;

class function TR02Controller.ConsultaLista(pFiltro: String): TObjectList<TR02VO>;
begin
  try
    Result := TT2TiORM.Consultar<TR02VO>(pFiltro, '-1', True);
  finally
  end;
end;

class function TR02Controller.ConsultaObjeto(pFiltro: String): TR02VO;
begin
  try
    Result := TT2TiORM.ConsultarUmObjeto<TR02VO>(pFiltro, True);
  finally
  end;
end;

class procedure TR02Controller.Insere(pObjeto: TR02VO);
var
  UltimoID: Integer;
begin
  try
    UltimoID := Inserir(pObjeto);
    Consulta('ID = ' + IntToStr(UltimoID), '0');
  finally
  end;
end;

class procedure TR02Controller.InsereObjeto(pObjeto: TR02VO);
var
  UltimoID: Integer;
begin
  try
    UltimoID := Inserir(pObjeto);
    TratarRetorno<TR02VO>(ConsultaObjeto('ID=' + IntToStr(UltimoID)));
  finally
  end;
end;

class function TR02Controller.Inserir(pObjeto: TR02VO): Integer;
var
  Detalhe: TR03VO;
  DetalheEnumerator: TEnumerator<TR03VO>;
begin
  try
    FormatSettings.DecimalSeparator := '.';
    pObjeto.HashRegistro := '0';
    pObjeto.HashRegistro := MD5String(pObjeto.ToJSONString);
    Result := TT2TiORM.Inserir(pObjeto);

    // Detalhes
    DetalheEnumerator := pObjeto.ListaR03VO.GetEnumerator;
    try
      with DetalheEnumerator do
      begin
        while MoveNext do
        begin
          Detalhe := Current;
          Detalhe.SerieEcf := Sessao.Configuracao.EcfImpressoraVO.Serie;
          Detalhe.IdR02 := Result;

          Detalhe.HashRegistro := '0';
          Detalhe.HashRegistro := MD5String(Detalhe.ToJSONString);
          TT2TiORM.Inserir(Detalhe);
        end;
      end;
    finally
      FreeAndNil(DetalheEnumerator);
    end;

  finally
    FormatSettings.DecimalSeparator := ',';
  end;
end;

class function TR02Controller.Altera(pObjeto: TR02VO): Boolean;
begin
  try
    Result := TT2TiORM.Alterar(pObjeto);
  finally
  end;
end;

class function TR02Controller.Exclui(pId: Integer): Boolean;
var
  ObjetoLocal: TR02VO;
begin
  try
    ObjetoLocal := TR02VO.Create;
    ObjetoLocal.Id := pId;
    Result := TT2TiORM.Excluir(ObjetoLocal);
  finally
    FreeAndNil(ObjetoLocal);
  end;
end;

class function TR02Controller.GetDataSet: TClientDataSet;
begin
  Result := FDataSet;
end;

class procedure TR02Controller.SetDataSet(pDataSet: TClientDataSet);
begin
  FDataSet := pDataSet;
end;

class procedure TR02Controller.TratarListaRetorno(pListaObjetos: TObjectList<TVO>);
begin
  try
    TratarRetorno<TR02VO>(TObjectList<TR02VO>(pListaObjetos));
  finally
    FreeAndNil(pListaObjetos);
  end;
end;

initialization
  Classes.RegisterClass(TR02Controller);

finalization
  Classes.UnRegisterClass(TR02Controller);

end.
