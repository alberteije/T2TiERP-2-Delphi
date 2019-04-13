{*******************************************************************************
Title: T2Ti ERP                                                                 
Description: Controller do lado Cliente relacionado à tabela [ORCAMENTO_FLUXO_CAIXA] 
                                                                                
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
unit OrcamentoFluxoCaixaController;

interface

uses
  Classes, Dialogs, SysUtils, DBClient, DB,  Windows, Forms, Controller, Rtti,
  Atributos, VO, Generics.Collections, OrcamentoFluxoCaixaVO, OrcamentoFluxoCaixaDetalheVO;

type
  TOrcamentoFluxoCaixaController = class(TController)
  private
    class var FDataSet: TClientDataSet;
  public
    class procedure Consulta(pFiltro: String; pPagina: String; pConsultaCompleta: Boolean = False);
    class function ConsultaLista(pFiltro: String): TObjectList<TOrcamentoFluxoCaixaVO>;
    class function ConsultaObjeto(pFiltro: String): TOrcamentoFluxoCaixaVO;

    class procedure Insere(pObjeto: TOrcamentoFluxoCaixaVO);
    class function Altera(pObjeto: TOrcamentoFluxoCaixaVO): Boolean;

    class function Exclui(pId: Integer): Boolean;

    class function GetDataSet: TClientDataSet; override;
    class procedure SetDataSet(pDataSet: TClientDataSet); override;
    class procedure TratarListaRetorno(pListaObjetos: TObjectList<TVO>);
  end;

implementation

uses UDataModule, T2TiORM;

class procedure TOrcamentoFluxoCaixaController.Consulta(pFiltro: String; pPagina: String; pConsultaCompleta: Boolean);
var
  Retorno: TObjectList<TOrcamentoFluxoCaixaVO>;
begin
  try
    Retorno := TT2TiORM.Consultar<TOrcamentoFluxoCaixaVO>(pFiltro, pPagina, pConsultaCompleta);
    TratarRetorno<TOrcamentoFluxoCaixaVO>(Retorno);
  finally
  end;
end;

class function TOrcamentoFluxoCaixaController.ConsultaLista(pFiltro: String): TObjectList<TOrcamentoFluxoCaixaVO>;
begin
  try
    Result := TT2TiORM.Consultar<TOrcamentoFluxoCaixaVO>(pFiltro, '-1', True);
  finally
  end;
end;

class function TOrcamentoFluxoCaixaController.ConsultaObjeto(pFiltro: String): TOrcamentoFluxoCaixaVO;
begin
  try
    Result := TT2TiORM.ConsultarUmObjeto<TOrcamentoFluxoCaixaVO>(pFiltro, True);
    Result.OrcamentoPeriodoNome := Result.OrcamentoPeriodoVO.Nome;
    Result.OrcamentoPeriodoCodigo := Result.OrcamentoPeriodoVO.Periodo;
  finally
  end;
end;

class procedure TOrcamentoFluxoCaixaController.Insere(pObjeto: TOrcamentoFluxoCaixaVO);
var
  UltimoID: Integer;
  OrcamentoDetalhe: TOrcamentoFluxoCaixaDetalheVO;
  OrcamentoDetalheEnumerator: TEnumerator<TOrcamentoFluxoCaixaDetalheVO>;
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
          OrcamentoDetalhe := Current;
          OrcamentoDetalhe.IdOrcamentoFluxoCaixa := UltimoID;
          TT2TiORM.Inserir(OrcamentoDetalhe);
        end;
      end;
    finally
      OrcamentoDetalheEnumerator.Free;
    end;

    Consulta('ID = ' + IntToStr(UltimoID), '0');
  finally
  end;
end;

class function TOrcamentoFluxoCaixaController.Altera(pObjeto: TOrcamentoFluxoCaixaVO): Boolean;
var
  OrcamentoDetalheEnumerator: TEnumerator<TOrcamentoFluxoCaixaDetalheVO>;
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
            Current.IdOrcamentoFluxoCaixa := pObjeto.Id;
            Result := TT2TiORM.Inserir(Current) > 0;
          end;
        end;
      end;
    except
    end;

  finally
  end;
end;

class function TOrcamentoFluxoCaixaController.Exclui(pId: Integer): Boolean;
var
  ObjetoLocal: TOrcamentoFluxoCaixaVO;
begin
  try
    ObjetoLocal := TOrcamentoFluxoCaixaVO.Create;
    ObjetoLocal.Id := pId;
    Result := TT2TiORM.Excluir(ObjetoLocal);
    TratarRetorno(Result);
  finally
    FreeAndNil(ObjetoLocal)
  end;
end;

class function TOrcamentoFluxoCaixaController.GetDataSet: TClientDataSet;
begin
  Result := FDataSet;
end;

class procedure TOrcamentoFluxoCaixaController.SetDataSet(pDataSet: TClientDataSet);
begin
  FDataSet := pDataSet;
end;

class procedure TOrcamentoFluxoCaixaController.TratarListaRetorno(pListaObjetos: TObjectList<TVO>);
begin
  try
    TratarRetorno<TOrcamentoFluxoCaixaVO>(TObjectList<TOrcamentoFluxoCaixaVO>(pListaObjetos));
  finally
    FreeAndNil(pListaObjetos);
  end;
end;

initialization
  Classes.RegisterClass(TOrcamentoFluxoCaixaController);

finalization
  Classes.UnRegisterClass(TOrcamentoFluxoCaixaController);

end.
