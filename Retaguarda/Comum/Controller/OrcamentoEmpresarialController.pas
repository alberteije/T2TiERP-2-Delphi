{*******************************************************************************
Title: T2Ti ERP                                                                 
Description: Controller do lado Cliente relacionado à tabela [ORCAMENTO_EMPRESARIAL] 
                                                                                
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
unit OrcamentoEmpresarialController;

interface

uses
  Classes, Dialogs, SysUtils, DBClient, DB,  Windows, Forms, Controller, Rtti,
  Atributos, VO, Generics.Collections, OrcamentoEmpresarialVO, OrcamentoDetalheVO;

type
  TOrcamentoEmpresarialController = class(TController)
  private
    class var FDataSet: TClientDataSet;
  public
    class procedure Consulta(pFiltro: String; pPagina: String; pConsultaCompleta: Boolean = False);
    class function ConsultaLista(pFiltro: String): TObjectList<TOrcamentoEmpresarialVO>;
    class function ConsultaObjeto(pFiltro: String): TOrcamentoEmpresarialVO;

    class procedure Insere(pObjeto: TOrcamentoEmpresarialVO);
    class function Altera(pObjeto: TOrcamentoEmpresarialVO): Boolean;

    class function Exclui(pId: Integer): Boolean;

    class function GetDataSet: TClientDataSet; override;
    class procedure SetDataSet(pDataSet: TClientDataSet); override;
    class procedure TratarListaRetorno(pListaObjetos: TObjectList<TVO>);
  end;

implementation

uses UDataModule, T2TiORM;

class procedure TOrcamentoEmpresarialController.Consulta(pFiltro: String; pPagina: String; pConsultaCompleta: Boolean);
var
  Retorno: TObjectList<TOrcamentoEmpresarialVO>;
begin
  try
    Retorno := TT2TiORM.Consultar<TOrcamentoEmpresarialVO>(pFiltro, pPagina, pConsultaCompleta);
    TratarRetorno<TOrcamentoEmpresarialVO>(Retorno);
  finally
  end;
end;

class function TOrcamentoEmpresarialController.ConsultaLista(pFiltro: String): TObjectList<TOrcamentoEmpresarialVO>;
begin
  try
    Result := TT2TiORM.Consultar<TOrcamentoEmpresarialVO>(pFiltro, '-1', True);
  finally
  end;
end;

class function TOrcamentoEmpresarialController.ConsultaObjeto(pFiltro: String): TOrcamentoEmpresarialVO;
begin
  try
    Result := TT2TiORM.ConsultarUmObjeto<TOrcamentoEmpresarialVO>(pFiltro, True);
    Result.OrcamentoPeriodoNome := Result.OrcamentoPeriodoVO.Nome;
    Result.OrcamentoPeriodoCodigo := Result.OrcamentoPeriodoVO.Periodo;
  finally
  end;
end;

class procedure TOrcamentoEmpresarialController.Insere(pObjeto: TOrcamentoEmpresarialVO);
var
  UltimoID: Integer;
  OrcamentoDetalheEnumerator: TEnumerator<TOrcamentoDetalheVO>;
begin
  try
    UltimoID := TT2TiORM.Inserir(pObjeto);

    // Detalhe do orçamento
    OrcamentoDetalheEnumerator := pObjeto.ListaOrcamentoDetalheVO.GetEnumerator;
    try
      with OrcamentoDetalheEnumerator do
      begin
        while MoveNext do
        begin
          Current.IdOrcamentoEmpresarial := UltimoID;
          TT2TiORM.Inserir(Current);
        end;
      end;
    finally
      OrcamentoDetalheEnumerator.Free;
    end;

    Consulta('ID = ' + IntToStr(UltimoID), '0');
  finally
  end;
end;

class function TOrcamentoEmpresarialController.Altera(pObjeto: TOrcamentoEmpresarialVO): Boolean;
var
  OrcamentoDetalheEnumerator: TEnumerator<TOrcamentoDetalheVO>;
begin
  try
    Result := TT2TiORM.Alterar(pObjeto);

    // Detalhe do orçamento
    try
      OrcamentoDetalheEnumerator := pObjeto.ListaOrcamentoDetalheVO.GetEnumerator;
      with OrcamentoDetalheEnumerator do
      begin
        while MoveNext do
        begin
          if Current.Id > 0 then
            Result := TT2TiORM.Alterar(Current)
          else
          begin
            Current.IdOrcamentoEmpresarial := pObjeto.Id;
            Result := TT2TiORM.Inserir(Current) > 0;
          end;
        end;
      end;
    except
    end;
  finally
  end;
end;

class function TOrcamentoEmpresarialController.Exclui(pId: Integer): Boolean;
var
  ObjetoLocal: TOrcamentoEmpresarialVO;
begin
  try
    ObjetoLocal := TOrcamentoEmpresarialVO.Create;
    ObjetoLocal.Id := pId;
    Result := TT2TiORM.Excluir(ObjetoLocal);
    TratarRetorno(Result);
  finally
    FreeAndNil(ObjetoLocal)
  end;
end;

class function TOrcamentoEmpresarialController.GetDataSet: TClientDataSet;
begin
  Result := FDataSet;
end;

class procedure TOrcamentoEmpresarialController.SetDataSet(pDataSet: TClientDataSet);
begin
  FDataSet := pDataSet;
end;

class procedure TOrcamentoEmpresarialController.TratarListaRetorno(pListaObjetos: TObjectList<TVO>);
begin
  try
    TratarRetorno<TOrcamentoEmpresarialVO>(TObjectList<TOrcamentoEmpresarialVO>(pListaObjetos));
  finally
    FreeAndNil(pListaObjetos);
  end;
end;

initialization
  Classes.RegisterClass(TOrcamentoEmpresarialController);

finalization
  Classes.UnRegisterClass(TOrcamentoEmpresarialController);

end.
