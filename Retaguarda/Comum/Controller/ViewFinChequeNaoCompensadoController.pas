{*******************************************************************************
Title: T2Ti ERP                                                                 
Description: Controller do lado Cliente relacionado à tabela [VIEW_FIN_CHEQUE_NAO_COMPENSADO] 
                                                                                
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
unit ViewFinChequeNaoCompensadoController;

interface

uses
  Classes, Dialogs, SysUtils, DBClient, DB,  Windows, Forms, Controller, Rtti,
  Atributos, VO, Generics.Collections, ViewFinChequeNaoCompensadoVO;

type
  TViewFinChequeNaoCompensadoController = class(TController)
  private
    class var FDataSet: TClientDataSet;
  public
    class procedure Consulta(pFiltro: String; pPagina: String; pConsultaCompleta: Boolean = False);
    class function ConsultaLista(pFiltro: String): TObjectList<TViewFinChequeNaoCompensadoVO>;
    class function ConsultaObjeto(pFiltro: String): TViewFinChequeNaoCompensadoVO;

    class procedure Insere(pObjeto: TViewFinChequeNaoCompensadoVO);
    class function Altera(pObjeto: TViewFinChequeNaoCompensadoVO): Boolean;

    class function GetDataSet: TClientDataSet; override;
    class procedure SetDataSet(pDataSet: TClientDataSet); override;
    class procedure TratarListaRetorno(pListaObjetos: TObjectList<TVO>);
  end;

implementation

uses UDataModule, T2TiORM;

class procedure TViewFinChequeNaoCompensadoController.Consulta(pFiltro: String; pPagina: String; pConsultaCompleta: Boolean);
var
  Retorno: TObjectList<TViewFinChequeNaoCompensadoVO>;
begin
  try
    Retorno := TT2TiORM.Consultar<TViewFinChequeNaoCompensadoVO>(pFiltro, pPagina, pConsultaCompleta);
    TratarRetorno<TViewFinChequeNaoCompensadoVO>(Retorno);
  finally
  end;
end;

class function TViewFinChequeNaoCompensadoController.ConsultaLista(pFiltro: String): TObjectList<TViewFinChequeNaoCompensadoVO>;
begin
  try
    Result := TT2TiORM.Consultar<TViewFinChequeNaoCompensadoVO>(pFiltro, '-1', True);
  finally
  end;
end;

class function TViewFinChequeNaoCompensadoController.ConsultaObjeto(pFiltro: String): TViewFinChequeNaoCompensadoVO;
begin
  try
    Result := TT2TiORM.ConsultarUmObjeto<TViewFinChequeNaoCompensadoVO>(pFiltro, True);
  finally
  end;
end;

class procedure TViewFinChequeNaoCompensadoController.Insere(pObjeto: TViewFinChequeNaoCompensadoVO);
var
  UltimoID: Integer;
begin
  try
    UltimoID := TT2TiORM.Inserir(pObjeto);
    Consulta('ID = ' + IntToStr(UltimoID), '0');
  finally
  end;
end;

class function TViewFinChequeNaoCompensadoController.Altera(pObjeto: TViewFinChequeNaoCompensadoVO): Boolean;
begin
  try
    Result := TT2TiORM.Alterar(pObjeto);
  finally
  end;
end;

class function TViewFinChequeNaoCompensadoController.GetDataSet: TClientDataSet;
begin
  Result := FDataSet;
end;

class procedure TViewFinChequeNaoCompensadoController.SetDataSet(pDataSet: TClientDataSet);
begin
  FDataSet := pDataSet;
end;

class procedure TViewFinChequeNaoCompensadoController.TratarListaRetorno(pListaObjetos: TObjectList<TVO>);
begin
  try
    TratarRetorno<TViewFinChequeNaoCompensadoVO>(TObjectList<TViewFinChequeNaoCompensadoVO>(pListaObjetos));
  finally
    FreeAndNil(pListaObjetos);
  end;
end;

initialization
  Classes.RegisterClass(TViewFinChequeNaoCompensadoController);

finalization
  Classes.UnRegisterClass(TViewFinChequeNaoCompensadoController);

end.

/// EXERCICIO: CRIE UMA JANELA DE CADASTRO QUE PERMITA O LANCAMENTO DE DO SALDO DISPONIVEL NA TABELA FIN_FECHAMENTO_CAIXA_BANCO
///  ESSE SERÁ O SALDO INICIAL DA CONTA
///  VERIFIQUE SE JÁ EXISTEM FECHAMENTOS REALIZADOS. NESSE CASO NÃO PERMITA O CADASTRO

/// EXERCICIO: CRIE UMA JANELA QUE PERMITA A TRANSFERENCIA DE VALORES ENTRE CONTA/CAIXAS
///  SERÁ PRECISO CRIAR UMA TABELA PARA CONTROLAR ISSO?

/// EXERCICIO: CRIE O RELATÓRIO DE DEMONSTRAÇÕES FINANCEIRAS CONFORME ABAIXO:
///  ===========================================================================
///  DADOS MENSAIS - PERIODO: 01/2016
///  ===========================================================================
///  SALDO ANTERIOR                                                       100,00
///  TOTAL DE RECEBIMENTOS                                                 50,00
///  TOTAL DE PAGAMENTOS                                                   40,00
///  SALDO DISPONIVEL                                                     110,00
///  CHEQUES NAO COMPENSADOS                                              100,00
///  SALDO DE BANCO                                                        10,00
///  ===========================================================================
///  DADOS ANUAIS - ANO: 2016
///  ===========================================================================
///  SALDO ANTERIOR                                                       100,00
///  TOTAL DE RECEBIMENTOS                                                 50,00
///  TOTAL DE PAGAMENTOS                                                   40,00
///  SALDO DISPONIVEL                                                     110,00
///  CHEQUES NAO COMPENSADOS                                              100,00
///  SALDO DE BANCO                                                        10,00
///  ===========================================================================

