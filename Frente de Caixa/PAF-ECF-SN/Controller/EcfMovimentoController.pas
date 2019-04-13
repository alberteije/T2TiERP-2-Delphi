{*******************************************************************************
Title: T2Ti ERP                                                                 
Description: Controller relacionado à tabela [ECF_MOVIMENTO] 
                                                                                
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
unit EcfMovimentoController;

interface

uses
  Classes, SysUtils, DBClient, DB, Windows, Forms, Controller, Rtti, Atributos,
  VO, EcfMovimentoVO, Generics.Collections;


type
  TEcfMovimentoController = class(TController)
  private
    class var FDataSet: TClientDataSet;
  public
    class procedure Consulta(pFiltro: String; pPagina: String; pConsultaCompleta: Boolean = False);
    class function ConsultaObjeto(pFiltro: String): TEcfMovimentoVO;
    class procedure Insere(pObjeto: TEcfMovimentoVO);
    class function Altera(pObjeto: TEcfMovimentoVO): Boolean;
    class function Exclui(pId: Integer): Boolean;
    class procedure IniciaMovimento(pObjeto: TEcfMovimentoVO);
    class function GetDataSet: TClientDataSet; override;
    class procedure SetDataSet(pDataSet: TClientDataSet); override;
    class procedure TratarListaRetorno(pListaObjetos: TObjectList<TVO>);
  end;

implementation

uses T2TiORM;

class procedure TEcfMovimentoController.Consulta(pFiltro: String; pPagina: String; pConsultaCompleta: Boolean);
var
  Retorno: TObjectList<TEcfMovimentoVO>;
begin
  try
    Retorno := TT2TiORM.Consultar<TEcfMovimentoVO>(pFiltro, pPagina, pConsultaCompleta);
    TratarRetorno<TEcfMovimentoVO>(Retorno);
  finally
  end;
end;

class function TEcfMovimentoController.ConsultaObjeto(pFiltro: String): TEcfMovimentoVO;
begin
  try
    Result := TT2TiORM.ConsultarUmObjeto<TEcfMovimentoVO>(pFiltro, True);
  finally
  end;
end;

class procedure TEcfMovimentoController.Insere(pObjeto: TEcfMovimentoVO);
var
  UltimoID: Integer;
begin
  try
    UltimoID := TT2TiORM.Inserir(pObjeto);
    Consulta('ID = ' + IntToStr(UltimoID), '0');
  finally
  end;
end;

class function TEcfMovimentoController.Altera(pObjeto: TEcfMovimentoVO): Boolean;
begin
  try
    Result := TT2TiORM.Alterar(pObjeto);
  finally
  end;
end;

class function TEcfMovimentoController.Exclui(pId: Integer): Boolean;
var
  ObjetoLocal: TEcfMovimentoVO;
begin
  try
    ObjetoLocal := TEcfMovimentoVO.Create;
    ObjetoLocal.Id := pId;
    Result := TT2TiORM.Excluir(ObjetoLocal);
  finally
    FreeAndNil(ObjetoLocal);
  end;
end;

class procedure TEcfMovimentoController.IniciaMovimento(pObjeto: TEcfMovimentoVO);
var
  UltimoID: Integer;
  ObjetoLocal: TEcfMovimentoVO;
begin
  try
    UltimoID := TT2TiORM.Inserir(pObjeto);
    ObjetoLocal := TT2TiORM.ConsultarUmObjeto<TEcfMovimentoVO>('ID = ' + IntToStr(UltimoID), True);
    TratarRetorno<TEcfMovimentoVO>(ObjetoLocal);
  finally
  end;
end;

class function TEcfMovimentoController.GetDataSet: TClientDataSet;
begin
  Result := FDataSet;
end;

class procedure TEcfMovimentoController.SetDataSet(pDataSet: TClientDataSet);
begin
  FDataSet := pDataSet;
end;

class procedure TEcfMovimentoController.TratarListaRetorno(pListaObjetos: TObjectList<TVO>);
begin
  try
    TratarRetorno<TEcfMovimentoVO>(TObjectList<TEcfMovimentoVO>(pListaObjetos));
  finally
    FreeAndNil(pListaObjetos);
  end;
end;

initialization
  Classes.RegisterClass(TEcfMovimentoController);

finalization
  Classes.UnRegisterClass(TEcfMovimentoController);

end.
