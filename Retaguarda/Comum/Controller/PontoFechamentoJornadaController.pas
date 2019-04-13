{*******************************************************************************
Title: T2Ti ERP                                                                 
Description: Controller do lado Cliente relacionado à tabela [PONTO_FECHAMENTO_JORNADA] 
                                                                                
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
unit PontoFechamentoJornadaController;

interface

uses
  Classes, Dialogs, SysUtils, DBClient, DB,  Windows, Forms, Controller, Rtti,
  Atributos, VO, Generics.Collections, PontoFechamentoJornadaVO;

type
  TPontoFechamentoJornadaController = class(TController)
  private
    class var FDataSet: TClientDataSet;
  public
    class procedure Consulta(pFiltro: String; pPagina: String; pConsultaCompleta: Boolean = False);
    class function ConsultaLista(pFiltro: String): TObjectList<TPontoFechamentoJornadaVO>;
    class function ConsultaObjeto(pFiltro: String): TPontoFechamentoJornadaVO;

    class procedure Insere(pObjeto: TPontoFechamentoJornadaVO);
    class function Altera(pObjeto: TPontoFechamentoJornadaVO): Boolean;

    class function Exclui(pId: Integer): Boolean;

    class function GetDataSet: TClientDataSet; override;
    class procedure SetDataSet(pDataSet: TClientDataSet); override;
    class procedure TratarListaRetorno(pListaObjetos: TObjectList<TVO>);
  end;

implementation

uses UDataModule, T2TiORM;

class procedure TPontoFechamentoJornadaController.Consulta(pFiltro: String; pPagina: String; pConsultaCompleta: Boolean);
var
  Retorno: TObjectList<TPontoFechamentoJornadaVO>;
  ConsultaSQL: String;
begin
  try
    /// EXERCICIO: Crie uma view no banco de dados para substituir a consulta abaixo.
    ConsultaSQL :=
      'SELECT PFJ.*, C.PIS_NUMERO, P.NOME AS NOME_COLABORADOR, '+
      'PCJ.CODIGO AS CODIGO_CLASSIFICACAO, PCJ.NOME AS NOME_CLASSIFICACAO '+
      'FROM PONTO_FECHAMENTO_JORNADA PFJ '+
      'INNER JOIN COLABORADOR C ON (PFJ.ID_COLABORADOR = C.ID) '+
      'INNER JOIN PESSOA P ON (C.ID_PESSOA = P.ID) '+
      'INNER JOIN PONTO_CLASSIFICACAO_JORNADA PCJ ON (PFJ.ID_PONTO_CLASSIFICACAO_JORNADA = PCJ.ID)';

    Retorno := TT2TiORM.Consultar<TPontoFechamentoJornadaVO>(pFiltro, pPagina, pConsultaCompleta);
    TratarRetorno<TPontoFechamentoJornadaVO>(Retorno);
  finally
  end;
end;

class function TPontoFechamentoJornadaController.ConsultaLista(pFiltro: String): TObjectList<TPontoFechamentoJornadaVO>;
begin
  try
    Result := TT2TiORM.Consultar<TPontoFechamentoJornadaVO>(pFiltro, '-1', True);
  finally
  end;
end;

class function TPontoFechamentoJornadaController.ConsultaObjeto(pFiltro: String): TPontoFechamentoJornadaVO;
begin
  try
    Result := TT2TiORM.ConsultarUmObjeto<TPontoFechamentoJornadaVO>(pFiltro, True);
  finally
  end;
end;

class procedure TPontoFechamentoJornadaController.Insere(pObjeto: TPontoFechamentoJornadaVO);
var
  UltimoID: Integer;
begin
  try
    UltimoID := TT2TiORM.Inserir(pObjeto);
    Consulta('ID = ' + IntToStr(UltimoID), '0');
  finally
  end;
end;

class function TPontoFechamentoJornadaController.Altera(pObjeto: TPontoFechamentoJornadaVO): Boolean;
begin
  try
    Result := TT2TiORM.Alterar(pObjeto);
  finally
  end;
end;

class function TPontoFechamentoJornadaController.Exclui(pId: Integer): Boolean;
var
  ObjetoLocal: TPontoFechamentoJornadaVO;
begin
  try
    ObjetoLocal := TPontoFechamentoJornadaVO.Create;
    ObjetoLocal.Id := pId;
    Result := TT2TiORM.Excluir(ObjetoLocal);
    TratarRetorno(Result);
  finally
    FreeAndNil(ObjetoLocal)
  end;
end;

class function TPontoFechamentoJornadaController.GetDataSet: TClientDataSet;
begin
  Result := FDataSet;
end;

class procedure TPontoFechamentoJornadaController.SetDataSet(pDataSet: TClientDataSet);
begin
  FDataSet := pDataSet;
end;

class procedure TPontoFechamentoJornadaController.TratarListaRetorno(pListaObjetos: TObjectList<TVO>);
begin
  try
    TratarRetorno<TPontoFechamentoJornadaVO>(TObjectList<TPontoFechamentoJornadaVO>(pListaObjetos));
  finally
    FreeAndNil(pListaObjetos);
  end;
end;

initialization
  Classes.RegisterClass(TPontoFechamentoJornadaController);

finalization
  Classes.UnRegisterClass(TPontoFechamentoJornadaController);

end.
