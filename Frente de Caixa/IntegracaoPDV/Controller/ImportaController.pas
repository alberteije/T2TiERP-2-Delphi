{*******************************************************************************
Title: T2Ti ERP
Description: Unit para controle das importações de arquivos

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
           t2ti.com@gmail.com

@author Albert Eije (t2ti.com@gmail.com)
@version 2.0
*******************************************************************************}
unit ImportaController;

interface
uses
  Classes, Dialogs, SysUtils, DBClient, DB, Windows, Forms,SQLExpr,
   Generics.Collections, Biblioteca, DBXCommon, DBXJson, JSonVO;
type
  TImportaController = class
  private
  protected
  public
    class function ImportarDadosDoPDV(pPathLocal: String): Boolean;
    class procedure GravarIntegracaoPDV(Identificador: String);
  end;


implementation

uses
  T2TiORM,
  IntegracaoPdvVO, NotaFiscalCabecalhoVO, NotaFiscalDetalheVO, R06VO, R07VO,
  EcfVendaCabecalhoVO, EcfVendaDetalheVO, EcfTotalTipoPagamentoVO, EcfMovimentoVO,
  EcfSuprimentoVO, EcfSangriaVO, EcfFechamentoVO, R02VO, R03VO, Sintegra60mVO,
  Sintegra60aVO,
  LogImportacaoController, ControleEstoqueController;

{ TImportaController }

{
  Procedimento que faz o controle de importação dos registros que estão no arquivo
}
class function TImportaController.ImportarDadosDoPDV(pPathLocal: String): Boolean;
var
  ObjetoIntegracaoPdvVO: TIntegracaoPdvVO;
  ObjetoNotaFiscalCabecalhoVO: TNotaFiscalCabecalhoVO;
  ObjetoEcfVendaCabecalhoVO: TEcfVendaCabecalhoVO;
  ObjetoR02VO: TR02VO;
  ObjetoR06VO: TR06VO;
  ObjetoEcfMovimentoVO: TEcfMovimentoVO;
  ObjetoSintegra60MVO: TSintegra60mVO;

  Filtro, Identificador, Objeto, NomeCaixa, Tupla: String;
  ObjetoJson: TJSONObject;

  ArquivoTexto: TextFile;
  ListaParametros: TStringList;

  Contador: Integer;

  NotaFiscalDetalheEnumerator: TEnumerator<TNotaFiscalDetalheVO>;
  EcfVendaDetalheEnumerator: TEnumerator<TEcfVendaDetalheVO>;
  EcfTotalTipoPagamentoEnumerator: TEnumerator<TEcfTotalTipoPagamentoVO>;
  EcfSuprimentoEnumerator: TEnumerator<TEcfSuprimentoVO>;
  EcfSangriaEnumerator: TEnumerator<TEcfSangriaVO>;
  EcfFechamentoEnumerator: TEnumerator<TEcfFechamentoVO>;
  R03Enumerator: TEnumerator<TR03VO>;
  Sintegra60AEnumerator: TEnumerator<TSintegra60aVO>;
begin
  try
    FormatSettings.DecimalSeparator := '.';

    Application.ProcessMessages;

    // Para contar o número de linhas
    Contador := 0;

    // Prepara o arquivo para ser utilizado
    AssignFile(ArquivoTexto, pPathLocal);
    Reset(ArquivoTexto);

    // Enquanto não chegar no final do arquivo que está sendo importado...
    while not Eof(ArquivoTexto) do
    begin
      try
        // Le uma linha do arquivo e armazena na variável Tupla
        Read(ArquivoTexto, Tupla);
        Inc(Contador);

        // Se houver dados na linha
        if Trim(Tupla) <> '' then
        begin

          // Identificador : Nome do Arquivo + Número da Linha
          Identificador := ExtractFileName(pPathLocal) + '_' + Contador.ToString;

          // Carrega os detalhes que vem no nome do arquivo numa lista para utilização
          ListaParametros := TStringList.Create;
          ExtractStrings(['_'],[], PChar(Identificador), ListaParametros);
          Objeto := ListaParametros[0];
          NomeCaixa := ListaParametros[1];

          // Consulta se o registro já foi inserido
          Filtro := 'IDENTIFICA = ' + QuotedStr(Identificador);
          ObjetoIntegracaoPdvVO := TT2TiORM.ConsultarUmObjeto<TIntegracaoPdvVO>(Filtro, True);

          // Só continua se o identificador não foi processado, ou seja, se a linha não foi gravada ainda na retaguarda
          if not Assigned(ObjetoIntegracaoPdvVO) then
          begin

            {$Region 'NF'}
            if Objeto = 'NF' then
            begin
              ObjetoJson := TJSONObject.ParseJsonValue(TEncoding.UTF8.GetBytes(Tupla), 0) as TJSONObject;
              ObjetoNotaFiscalCabecalhoVO := TJsonVO.JSONToObject<TNotaFiscalCabecalhoVO>(ObjetoJson);

              ObjetoNotaFiscalCabecalhoVO.IdGeradoCaixa := ObjetoNotaFiscalCabecalhoVO.Id;
              ObjetoNotaFiscalCabecalhoVO.NomeCaixa := NomeCaixa;
              ObjetoNotaFiscalCabecalhoVO.DataSincronizacao := Date;
              ObjetoNotaFiscalCabecalhoVO.HoraSincronizacao := TimeToStr(Now);
              ObjetoNotaFiscalCabecalhoVO.Id := 0;

              TT2TiORM.Inserir(ObjetoNotaFiscalCabecalhoVO);

              // Detalhes
              NotaFiscalDetalheEnumerator := ObjetoNotaFiscalCabecalhoVO.ListaNotaFiscalDetalheVO.GetEnumerator;
              try
                with NotaFiscalDetalheEnumerator do
                begin
                  while MoveNext do
                  begin

                    Current.IdGeradoCaixa := Current.Id;
                    Current.NomeCaixa := NomeCaixa;
                    Current.DataSincronizacao := Date;
                    Current.HoraSincronizacao := TimeToStr(Now);
                    Current.Id := 0;

                    TT2TiORM.Inserir(Current);

                    if Current.MovimentaEstoque = 'S' then
                      TControleEstoqueController.AtualizarEstoque(Current.Quantidade, Current.IdProduto);
                  end;
                end;
              finally
                FreeAndNil(NotaFiscalDetalheEnumerator);
              end;

              GravarIntegracaoPDV(Identificador);
            end
            {$EndRegion 'NF'}

            {$Region 'VENDA'}
            else if Objeto = 'VENDA' then
            begin
              ObjetoJson := TJSONObject.ParseJsonValue(TEncoding.UTF8.GetBytes(Tupla), 0) as TJSONObject;
              ObjetoEcfVendaCabecalhoVO := TJsonVO.JSONToObject<TEcfVendaCabecalhoVO>(ObjetoJson);

              ObjetoEcfVendaCabecalhoVO.IdGeradoCaixa := ObjetoEcfVendaCabecalhoVO.Id;
              ObjetoEcfVendaCabecalhoVO.NomeCaixa := NomeCaixa;
              ObjetoEcfVendaCabecalhoVO.DataSincronizacao := Date;
              ObjetoEcfVendaCabecalhoVO.HoraSincronizacao := TimeToStr(Now);
              ObjetoEcfVendaCabecalhoVO.Id := 0;

              TT2TiORM.Inserir(ObjetoEcfVendaCabecalhoVO);

              // Detalhes
              EcfVendaDetalheEnumerator := ObjetoEcfVendaCabecalhoVO.ListaEcfVendaDetalheVO.GetEnumerator;
              try
                with EcfVendaDetalheEnumerator do
                begin
                  while MoveNext do
                  begin

                    Current.IdGeradoCaixa := Current.Id;
                    Current.NomeCaixa := NomeCaixa;
                    Current.DataSincronizacao := Date;
                    Current.HoraSincronizacao := TimeToStr(Now);
                    Current.Id := 0;

                    TT2TiORM.Inserir(Current);

                    if Current.MovimentaEstoque = 'S' then
                      TControleEstoqueController.AtualizarEstoque(Current.Quantidade, Current.IdEcfProduto);
                  end;
                end;
              finally
                FreeAndNil(EcfVendaDetalheEnumerator);
              end;

              // TotalTipoPagamento
              EcfTotalTipoPagamentoEnumerator := ObjetoEcfVendaCabecalhoVO.ListaEcfTotalTipoPagamentoVO.GetEnumerator;
              try
                with EcfTotalTipoPagamentoEnumerator do
                begin
                  while MoveNext do
                  begin

                    Current.IdGeradoCaixa := Current.Id;
                    Current.NomeCaixa := NomeCaixa;
                    Current.DataSincronizacao := Date;
                    Current.HoraSincronizacao := TimeToStr(Now);
                    Current.Id := 0;

                    TT2TiORM.Inserir(Current);
                  end;
                end;
              finally
                FreeAndNil(EcfTotalTipoPagamentoEnumerator);
              end;

              GravarIntegracaoPDV(Identificador);
            end
            {$EndRegion 'VENDA'}

            {$Region 'MOVIMENTO'}
            else if Objeto = 'MOVIMENTO' then
            begin
              ObjetoJson := TJSONObject.ParseJsonValue(TEncoding.UTF8.GetBytes(Tupla), 0) as TJSONObject;
              ObjetoEcfMovimentoVO := TJsonVO.JSONToObject<TEcfMovimentoVO>(ObjetoJson);

              ObjetoEcfMovimentoVO.IdGeradoCaixa := ObjetoEcfMovimentoVO.Id;
              ObjetoEcfMovimentoVO.NomeCaixa := NomeCaixa;
              ObjetoEcfMovimentoVO.DataSincronizacao := Date;
              ObjetoEcfMovimentoVO.HoraSincronizacao := TimeToStr(Now);
              ObjetoEcfMovimentoVO.Id := 0;

              TT2TiORM.Inserir(ObjetoEcfMovimentoVO);

              // Suprimento
              EcfSuprimentoEnumerator := ObjetoEcfMovimentoVO.ListaEcfSuprimentoVO.GetEnumerator;
              try
                with EcfSuprimentoEnumerator do
                begin
                  while MoveNext do
                  begin

                    Current.IdGeradoCaixa := Current.Id;
                    Current.NomeCaixa := NomeCaixa;
                    Current.DataSincronizacao := Date;
                    Current.HoraSincronizacao := TimeToStr(Now);
                    Current.Id := 0;

                    TT2TiORM.Inserir(Current);
                  end;
                end;
              finally
                FreeAndNil(EcfSuprimentoEnumerator);
              end;

              // Sangria
              EcfSangriaEnumerator := ObjetoEcfMovimentoVO.ListaEcfSangriaVO.GetEnumerator;
              try
                with EcfSangriaEnumerator do
                begin
                  while MoveNext do
                  begin

                    Current.IdGeradoCaixa := Current.Id;
                    Current.NomeCaixa := NomeCaixa;
                    Current.DataSincronizacao := Date;
                    Current.HoraSincronizacao := TimeToStr(Now);
                    Current.Id := 0;

                    TT2TiORM.Inserir(Current);
                  end;
                end;
              finally
                FreeAndNil(EcfSangriaEnumerator);
              end;

              // Fechamento
              EcfFechamentoEnumerator := ObjetoEcfMovimentoVO.ListaEcfFechamentoVO.GetEnumerator;
              try
                with EcfFechamentoEnumerator do
                begin
                  while MoveNext do
                  begin

                    Current.IdGeradoCaixa := Current.Id;
                    Current.NomeCaixa := NomeCaixa;
                    Current.DataSincronizacao := Date;
                    Current.HoraSincronizacao := TimeToStr(Now);
                    Current.Id := 0;

                    TT2TiORM.Inserir(Current);
                  end;
                end;
              finally
                FreeAndNil(EcfFechamentoEnumerator);
              end;

              GravarIntegracaoPDV(Identificador);
            end
            {$EndRegion 'MOVIMENTO'}

            {$Region 'R02'}
            else if Objeto = 'R02' then
            begin
              ObjetoJson := TJSONObject.ParseJsonValue(TEncoding.UTF8.GetBytes(Tupla), 0) as TJSONObject;
              ObjetoR02VO := TJsonVO.JSONToObject<TR02VO>(ObjetoJson);

              ObjetoR02VO.IdGeradoCaixa := ObjetoR02VO.Id;
              ObjetoR02VO.NomeCaixa := NomeCaixa;
              ObjetoR02VO.DataSincronizacao := Date;
              ObjetoR02VO.HoraSincronizacao := TimeToStr(Now);
              ObjetoR02VO.Id := 0;

              TT2TiORM.Inserir(ObjetoR02VO);

              // Detalhes
              R03Enumerator := ObjetoR02VO.ListaR03VO.GetEnumerator;
              try
                with R03Enumerator do
                begin
                  while MoveNext do
                  begin

                    Current.IdGeradoCaixa := Current.Id;
                    Current.NomeCaixa := NomeCaixa;
                    Current.DataSincronizacao := Date;
                    Current.HoraSincronizacao := TimeToStr(Now);
                    Current.Id := 0;

                    TT2TiORM.Inserir(Current);
                  end;
                end;
              finally
                FreeAndNil(R03Enumerator);
              end;

              GravarIntegracaoPDV(Identificador);
            end
            {$EndRegion 'R02'}

            {$Region 'R06'}
            else if Objeto = 'R06' then
            begin
              ObjetoJson := TJSONObject.ParseJsonValue(TEncoding.UTF8.GetBytes(Tupla), 0) as TJSONObject;
              ObjetoR06VO := TJsonVO.JSONToObject<TR06VO>(ObjetoJson);

              ObjetoR06VO.IdGeradoCaixa := ObjetoR06VO.Id;
              ObjetoR06VO.NomeCaixa := NomeCaixa;
              ObjetoR06VO.DataSincronizacao := Date;
              ObjetoR06VO.HoraSincronizacao := TimeToStr(Now);
              ObjetoR06VO.Id := 0;

              TT2TiORM.Inserir(ObjetoR06VO);

              GravarIntegracaoPDV(Identificador);
            end
            {$EndRegion 'R06'}

            {$Region 'SINTEGRA60M'}
            else if Objeto = 'SINTEGRA60M' then
            begin
              ObjetoJson := TJSONObject.ParseJsonValue(TEncoding.UTF8.GetBytes(Tupla), 0) as TJSONObject;
              ObjetoSintegra60MVO := TJsonVO.JSONToObject<TSintegra60MVO>(ObjetoJson);

              ObjetoSintegra60MVO.IdGeradoCaixa := ObjetoSintegra60MVO.Id;
              ObjetoSintegra60MVO.NomeCaixa := NomeCaixa;
              ObjetoSintegra60MVO.DataSincronizacao := Date;
              ObjetoSintegra60MVO.HoraSincronizacao := TimeToStr(Now);
              ObjetoSintegra60MVO.Id := 0;

              TT2TiORM.Inserir(ObjetoSintegra60MVO);

              // Detalhes
              Sintegra60AEnumerator := ObjetoSintegra60MVO.ListaSintegra60AVO.GetEnumerator;
              try
                with Sintegra60AEnumerator do
                begin
                  while MoveNext do
                  begin

                    Current.IdGeradoCaixa := Current.Id;
                    Current.NomeCaixa := NomeCaixa;
                    Current.DataSincronizacao := Date;
                    Current.HoraSincronizacao := TimeToStr(Now);
                    Current.Id := 0;

                    TT2TiORM.Inserir(Current);
                  end;
                end;
              finally
                FreeAndNil(Sintegra60AEnumerator);
              end;

              GravarIntegracaoPDV(Identificador);
            end;
            {$EndRegion 'SINTEGRA60M'}

          end;
        end;

      except
        // Se ocorrer algum erro, grava o log de importação
        on E: Exception do
          TLogImportacaoController.GravarLogImportacao(Tupla, E.Message);
      end;
      Readln(ArquivoTexto);
    end;
  finally
    FormatSettings.DecimalSeparator := ',';
    FreeAndNil(ListaParametros);
    FreeAndNil(ObjetoJson);
    FreeAndNil(ObjetoIntegracaoPdvVO);
    FreeAndNil(ObjetoNotaFiscalCabecalhoVO);
    FreeAndNil(ObjetoEcfVendaCabecalhoVO);
    FreeAndNil(ObjetoEcfMovimentoVO);
    FreeAndNil(ObjetoR02VO);
    FreeAndNil(ObjetoR06VO);
    CloseFile(ArquivoTexto);
    Result:=true;
  end;
end;

{
  Grava os dados do registro na tabela integracao_pdv
}
class procedure TImportaController.GravarIntegracaoPDV(Identificador: String);
var
  ObjetoIntegracaoPdvVO: TIntegracaoPdvVO;
begin
  try
    ObjetoIntegracaoPdvVO := TIntegracaoPdvVO.Create;
    ObjetoIntegracaoPdvVO.Identifica := Identificador;
    ObjetoIntegracaoPdvVO.DataIntegracao := Date;
    ObjetoIntegracaoPdvVO.HoraIntegracao := TimeToStr(Now);

    TT2TiORM.Inserir(ObjetoIntegracaoPdvVO);
  finally
    FreeAndNil(ObjetoIntegracaoPdvVO);
  end;
end;

end.
