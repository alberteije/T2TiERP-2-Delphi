{*******************************************************************************
Title: T2Ti ERP                                                                 
Description: Controller do lado Cliente relacionado à tabela [NFCE_MOVIMENTO] 
                                                                                
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
*******************************************************************************}
unit NfceMovimentoController;

interface

uses
  Classes, Dialogs, SysUtils, DBClient, DB,  Windows, Forms, Controller, Rtti,
  Atributos, VO, Generics.Collections, NfceMovimentoVO;

type
  TNfceMovimentoController = class(TController)
  private
    class var FDataSet: TClientDataSet;
  public
    class procedure Consulta(pFiltro: String; pPagina: String; pConsultaCompleta: Boolean = False);
    class function ConsultaLista(pFiltro: String): TObjectList<TNfceMovimentoVO>;
    class function ConsultaObjeto(pFiltro: String): TNfceMovimentoVO;

    class procedure Insere(pObjeto: TNfceMovimentoVO);
    class function Altera(pObjeto: TNfceMovimentoVO): Boolean;

    class function Exclui(pId: Integer): Boolean;

    class procedure IniciaMovimento(pObjeto: TNfceMovimentoVO);

    class function GetDataSet: TClientDataSet; override;
    class procedure SetDataSet(pDataSet: TClientDataSet); override;
    class procedure TratarListaRetorno(pListaObjetos: TObjectList<TVO>);
  end;

implementation

uses T2TiORM;

class procedure TNfceMovimentoController.Consulta(pFiltro: String; pPagina: String; pConsultaCompleta: Boolean);
var
  Retorno: TObjectList<TNfceMovimentoVO>;
begin
  try
    Retorno := TT2TiORM.Consultar<TNfceMovimentoVO>(pFiltro, pPagina, pConsultaCompleta);
    TratarRetorno<TNfceMovimentoVO>(Retorno);
  finally
  end;
end;

class function TNfceMovimentoController.ConsultaLista(pFiltro: String): TObjectList<TNfceMovimentoVO>;
begin
  try
    Result := TT2TiORM.Consultar<TNfceMovimentoVO>(pFiltro, '-1', True);
  finally
  end;
end;

class function TNfceMovimentoController.ConsultaObjeto(pFiltro: String): TNfceMovimentoVO;
begin
  try
    Result := TT2TiORM.ConsultarUmObjeto<TNfceMovimentoVO>(pFiltro, True);
  finally
  end;
end;

class procedure TNfceMovimentoController.Insere(pObjeto: TNfceMovimentoVO);
var
  UltimoID: Integer;
begin
  try
    UltimoID := TT2TiORM.Inserir(pObjeto);
    Consulta('ID = ' + IntToStr(UltimoID), '0');
  finally
  end;
end;

class function TNfceMovimentoController.Altera(pObjeto: TNfceMovimentoVO): Boolean;
begin
  try
    Result := TT2TiORM.Alterar(pObjeto);
  finally
  end;
end;

class function TNfceMovimentoController.Exclui(pId: Integer): Boolean;
var
  ObjetoLocal: TNfceMovimentoVO;
begin
  try
    ObjetoLocal := TNfceMovimentoVO.Create;
    ObjetoLocal.Id := pId;
    Result := TT2TiORM.Excluir(ObjetoLocal);
    TratarRetorno(Result);
  finally
    FreeAndNil(ObjetoLocal)
  end;
end;

class procedure TNfceMovimentoController.IniciaMovimento(pObjeto: TNfceMovimentoVO);
var
  UltimoID: Integer;
  ObjetoLocal: TNfceMovimentoVO;
begin
  try
    UltimoID := TT2TiORM.Inserir(pObjeto);
    ObjetoLocal := TT2TiORM.ConsultarUmObjeto<TNfceMovimentoVO>('ID = ' + IntToStr(UltimoID), True);
    TratarRetorno<TNfceMovimentoVO>(ObjetoLocal);
  finally
  end;
end;

class function TNfceMovimentoController.GetDataSet: TClientDataSet;
begin
  Result := FDataSet;
end;

class procedure TNfceMovimentoController.SetDataSet(pDataSet: TClientDataSet);
begin
  FDataSet := pDataSet;
end;

class procedure TNfceMovimentoController.TratarListaRetorno(pListaObjetos: TObjectList<TVO>);
begin
  try
    TratarRetorno<TNfceMovimentoVO>(TObjectList<TNfceMovimentoVO>(pListaObjetos));
  finally
    FreeAndNil(pListaObjetos);
  end;
end;

initialization
  Classes.RegisterClass(TNfceMovimentoController);

finalization
  Classes.UnRegisterClass(TNfceMovimentoController);

end.
