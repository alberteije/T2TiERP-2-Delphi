{*******************************************************************************
Title: T2Ti ERP
Description: Controller do lado Cliente relacionado às tabelas
  [PCP_OP_CABECALHO] e [PCP_OP_DETALHE]

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
unit PcpOpController;

interface

uses
  Classes, Dialogs, SysUtils, DBClient, DB,  Windows, Forms, Controller, Rtti,
  Atributos, VO, Generics.Collections, PcpOpCabecalhoVO, PcpOpDetalheVO, PcpInstrucaoOpVO,
  PcpServicoVO, PcpServicoColaboradorVO, PcpServicoEquipamentoVO;

type
  TPcpOpController = class(TController)
  private
    class var FDataSet: TClientDataSet;
  public
    class procedure Consulta(pFiltro: String; pPagina: String; pConsultaCompleta: Boolean = False);
    class function ConsultaLista(pFiltro: String): TObjectList<TPcpOpCabecalhoVO>;
    class function ConsultaObjeto(pFiltro: String): TPcpOpCabecalhoVO;

    class procedure Insere(pObjeto: TPcpOpCabecalhoVO);
    class function Altera(pObjeto: TPcpOpCabecalhoVO): Boolean;

    class function Exclui(pId: Integer): Boolean;
    class function ExcluiInstrucao(pId: Integer): Boolean;
    class function ExcluiItem(pId: Integer): Boolean;
    class function ExcluiServico(pId: Integer): Boolean;
    class function ExcluiColaborador(pId: Integer): Boolean;
    class function ExcluiEquipamento(pId: Integer): Boolean;


    class function GetDataSet: TClientDataSet; override;
    class procedure SetDataSet(pDataSet: TClientDataSet); override;
    class procedure TratarListaRetorno(pListaObjetos: TObjectList<TVO>);
  end;

implementation

uses
  UDataModule, T2TiORM;

class procedure TPcpOpController.Consulta(pFiltro: String; pPagina: String; pConsultaCompleta: Boolean);
var
  Retorno: TObjectList<TPcpOpCabecalhoVO>;
begin
  try
    Retorno := TT2TiORM.Consultar<TPcpOpCabecalhoVO>(pFiltro, pPagina, pConsultaCompleta);
    TratarRetorno<TPcpOpCabecalhoVO>(Retorno);
  finally
  end;
end;

class function TPcpOpController.ConsultaLista(pFiltro: String): TObjectList<TPcpOpCabecalhoVO>;
begin
  try
    Result := TT2TiORM.Consultar<TPcpOpCabecalhoVO>(pFiltro, '-1', True);
  finally
  end;
end;

class function TPcpOpController.ConsultaObjeto(pFiltro: String): TPcpOpCabecalhoVO;
begin
  try
    Result := TT2TiORM.ConsultarUmObjeto<TPcpOpCabecalhoVO>(pFiltro, True);
  finally
  end;
end;

class procedure TPcpOpController.Insere(pObjeto: TPcpOpCabecalhoVO);
var
  UltimoID, IDDetalhe, IDServico: Integer;

  InstrucoesEnumerator: TEnumerator<TPcpInstrucaoOpVO>;
  PcpOpDetalheEnumerator: TEnumerator<TPcpOpDetalheVO>;
  PcpServicoEnumerator: TEnumerator<TpcpServicoVO>;
  PcpServicoColaboradorEnumerator: TEnumerator<TPcpServicoColaboradorVO>;
  PcpServicoEquipamentoEnumerator: TEnumerator<TPcpServicoEquipamentoVO>;
begin
  try
    UltimoID := TT2TiORM.Inserir(pObjeto);

    // Instrucoes
    InstrucoesEnumerator := pObjeto.ListaPcpInstrucaoOpVO.GetEnumerator;
    try
      with InstrucoesEnumerator do
      begin
        while MoveNext do
        begin
          Current.IdPcpOpCabecalho := UltimoID;
          TT2TiORM.Inserir(Current);
        end;
      end;
    finally
      FreeAndNil(InstrucoesEnumerator);
    end;

    // Detalhe
    PcpOpDetalheEnumerator := pObjeto.ListaPcpOpDetalheVO.GetEnumerator;
    try
      with PcpOpDetalheEnumerator do
      begin
        while MoveNext do
        begin
          Current.IdPcpOpCabecalho := UltimoID;
          IDDetalhe := TT2TiORM.Inserir(Current);

          PcpServicoEnumerator := TPcpOpDetalheVO(Current).ListaPcpServicoVO.GetEnumerator;
          try
            with PcpServicoEnumerator do
            begin
              while MoveNext do
              begin
                Current.IdPcpOpDetalhe := IDDetalhe;
                IDServico := TT2TiORM.Inserir(Current);

                PcpServicoColaboradorEnumerator := TPcpServicoVO(Current).ListaPcpColabradorVO.GetEnumerator;
                try
                  with PcpServicoColaboradorEnumerator do
                  begin
                    while MoveNext do
                    begin
                      Current.IdPcpServico := IDServico;
                      TT2TiORM.Inserir(Current);
                    end;
                  end;
                finally
                  FreeAndNil(PcpServicoColaboradorEnumerator);
                end;

                PcpServicoEquipamentoEnumerator := TPcpServicoVO(Current).ListaPcpServicoEquipamentoVO.GetEnumerator;
                try
                  with PcpServicoEquipamentoEnumerator do
                  begin
                    while MoveNext do
                    begin
                      Current.IdPcpServico := IDServico;
                      TT2TiORM.Inserir(Current);
                    end;
                  end;
                finally
                  FreeAndNil(PcpServicoEquipamentoEnumerator);
                end;
              end;
            end;
          finally
            FreeAndNil(PcpServicoEnumerator);
          end;
        end;
      end;
    finally
      FreeAndNil(PcpOpDetalheEnumerator);
    end;
    Consulta('ID = ' + IntToStr(UltimoID), '0');
  finally
  end;
end;

class function TPcpOpController.Altera(pObjeto: TPcpOpCabecalhoVO): Boolean;
begin
  try
    Result := TT2TiORM.Alterar(pObjeto);
  finally
  end;
end;

class function TPcpOpController.Exclui(pId: Integer): Boolean;
var
  ObjetoLocal: TPcpOpCabecalhoVO;
begin
  try
    ObjetoLocal := TPcpOpCabecalhoVO.Create;
    ObjetoLocal.Id := pId;
    Result := TT2TiORM.Excluir(ObjetoLocal);
    TratarRetorno(Result);
  finally
    FreeAndNil(ObjetoLocal)
  end;
end;

class function TPcpOpController.ExcluiColaborador(pId: Integer): Boolean;
var
  ObjetoLocal: TPcpServicoColaboradorVO;
begin
  try
    ObjetoLocal := TPcpServicoColaboradorVO.Create;
    ObjetoLocal.Id := pId;
    Result := TT2TiORM.Excluir(ObjetoLocal);
    TratarRetorno(Result);
  finally
    FreeAndNil(ObjetoLocal)
  end;
end;

class function TPcpOpController.ExcluiEquipamento(pId: Integer): Boolean;
var
  ObjetoLocal: TPcpServicoEquipamentoVO;
begin
  try
    ObjetoLocal := TPcpServicoEquipamentoVO.Create;
    ObjetoLocal.Id := pId;
    Result := TT2TiORM.Excluir(ObjetoLocal);
    TratarRetorno(Result);
  finally
    FreeAndNil(ObjetoLocal)
  end;

end;

class function TPcpOpController.ExcluiInstrucao(pId: Integer): Boolean;
var
  ObjetoLocal: TPcpInstrucaoOpVO;
begin
  try
    ObjetoLocal := TPcpInstrucaoOpVO.Create;
    ObjetoLocal.Id := pId;
    Result := TT2TiORM.Excluir(ObjetoLocal);
    TratarRetorno(Result);
  finally
    FreeAndNil(ObjetoLocal)
  end;
end;

class function TPcpOpController.ExcluiItem(pId: Integer): Boolean;
var
  ObjetoLocal: TPcpOpDetalheVO;
begin
  try
    ObjetoLocal := TPcpOpDetalheVO.Create;
    ObjetoLocal.Id := pId;
    Result := TT2TiORM.Excluir(ObjetoLocal);
    TratarRetorno(Result);
  finally
    FreeAndNil(ObjetoLocal)
  end;
end;

class function TPcpOpController.ExcluiServico(pId: Integer): Boolean;
var
  ObjetoLocal: TPcpServicoVO;
begin
  try
    ObjetoLocal := TPcpServicoVO.Create;
    ObjetoLocal.Id := pId;
    Result := TT2TiORM.Excluir(ObjetoLocal);
    TratarRetorno(Result);
  finally
    FreeAndNil(ObjetoLocal)
  end;
end;

class function TPcpOpController.GetDataSet: TClientDataSet;
begin
  Result := FDataSet;
end;

class procedure TPcpOpController.SetDataSet(pDataSet: TClientDataSet);
begin
  FDataSet := pDataSet;
end;

class procedure TPcpOpController.TratarListaRetorno(pListaObjetos: TObjectList<TVO>);
begin
  try
    TratarRetorno<TPcpOpCabecalhoVO>(TObjectList<TPcpOpCabecalhoVO>(pListaObjetos));
  finally
    FreeAndNil(pListaObjetos);
  end;
end;

initialization
  Classes.RegisterClass(TPcpOpController);

finalization
  Classes.UnRegisterClass(TPcpOpController);

end.
