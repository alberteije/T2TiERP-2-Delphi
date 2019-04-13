{*******************************************************************************
Title: T2Ti ERP                                                                 
Description: Controller relacionado à tabela [SINTEGRA_60M] 
                                                                                
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
unit Sintegra60MController;

interface

uses
  Classes, SysUtils, DBClient, DB, Windows, Forms, Controller, Rtti, Atributos,
  VO, Sintegra60MVO, Sintegra60AVO, Generics.Collections;


type
  TSintegra60MController = class(TController)
  private
    class var FDataSet: TClientDataSet;
    class function Inserir(pObjeto: TSintegra60MVO): Integer;
  public
    class procedure Consulta(pFiltro: String; pPagina: String; pConsultaCompleta: Boolean = False);
    class function ConsultaObjeto(pFiltro: String): TSintegra60MVO;
    class procedure Sintegra60M(pFiltro: String);
    class procedure Insere(pObjeto: TSintegra60MVO);
    class procedure InsereObjeto(pObjeto: TSintegra60MVO);
    class function Altera(pObjeto: TSintegra60MVO): Boolean;
    class function Exclui(pId: Integer): Boolean;
    class function GetDataSet: TClientDataSet; override;
    class procedure SetDataSet(pDataSet: TClientDataSet); override;
    class procedure TratarListaRetorno(pListaObjetos: TObjectList<TVO>);
  end;

implementation

uses T2TiORM;

class procedure TSintegra60MController.Consulta(pFiltro: String; pPagina: String; pConsultaCompleta: Boolean);
var
  Retorno: TObjectList<TSintegra60MVO>;
begin
  try
    Retorno := TT2TiORM.Consultar<TSintegra60MVO>(pFiltro, pPagina, pConsultaCompleta);
    TratarRetorno<TSintegra60MVO>(Retorno);
  finally
  end;
end;

class function TSintegra60MController.ConsultaObjeto(pFiltro: String): TSintegra60MVO;
begin
  try
    Result := TT2TiORM.ConsultarUmObjeto<TSintegra60MVO>(pFiltro, True);
  finally
  end;
end;

class procedure TSintegra60MController.Sintegra60M(pFiltro: String);
var
  ObjetoLocal: TSintegra60MVO;
begin
  try
    ObjetoLocal := TT2TiORM.ConsultarUmObjeto<TSintegra60MVO>(pFiltro, True);
    TratarRetorno<TSintegra60MVO>(ObjetoLocal);
  finally
  end;
end;

class procedure TSintegra60MController.Insere(pObjeto: TSintegra60MVO);
var
  UltimoID: Integer;
begin
  try
    UltimoID := Inserir(pObjeto);
    Consulta('ID = ' + IntToStr(UltimoID), '0');
  finally
  end;
end;

class procedure TSintegra60MController.InsereObjeto(pObjeto: TSintegra60MVO);
var
  UltimoID: Integer;
begin
  try
    UltimoID := Inserir(pObjeto);
    TratarRetorno<TSintegra60MVO>(ConsultaObjeto('ID=' + IntToStr(UltimoID)));
  finally
  end;
end;

class function TSintegra60MController.Inserir(pObjeto: TSintegra60MVO): Integer;
var
  Detalhe: TSintegra60AVO;
  DetalheEnumerator: TEnumerator<TSintegra60AVO>;
begin
  try
    Result := TT2TiORM.Inserir(pObjeto);

    // Detalhes
    DetalheEnumerator := pObjeto.ListaSintegra60AVO.GetEnumerator;
    try
      with DetalheEnumerator do
      begin
        while MoveNext do
        begin
          Detalhe := Current;
          Detalhe.IdSintegra60M := Result;
          TT2TiORM.Inserir(Detalhe);
        end;
      end;
    finally
      FreeAndNil(DetalheEnumerator);
    end;

  finally
  end;
end;

class function TSintegra60MController.Altera(pObjeto: TSintegra60MVO): Boolean;
begin
  try
    Result := TT2TiORM.Alterar(pObjeto);
  finally
  end;
end;

class function TSintegra60MController.Exclui(pId: Integer): Boolean;
var
  ObjetoLocal: TSintegra60MVO;
begin
  try
    ObjetoLocal := TSintegra60MVO.Create;
    ObjetoLocal.Id := pId;
    Result := TT2TiORM.Excluir(ObjetoLocal);
  finally
    FreeAndNil(ObjetoLocal);
  end;
end;

class function TSintegra60MController.GetDataSet: TClientDataSet;
begin
  Result := FDataSet;
end;

class procedure TSintegra60MController.SetDataSet(pDataSet: TClientDataSet);
begin
  FDataSet := pDataSet;
end;

class procedure TSintegra60MController.TratarListaRetorno(pListaObjetos: TObjectList<TVO>);
begin
  try
    TratarRetorno<TSintegra60MVO>(TObjectList<TSintegra60MVO>(pListaObjetos));
  finally
    FreeAndNil(pListaObjetos);
  end;
end;

initialization
  Classes.RegisterClass(TSintegra60MController);

finalization
  Classes.UnRegisterClass(TSintegra60MController);

end.
