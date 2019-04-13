{*******************************************************************************
Title: T2Ti ERP
Description: Controller do lado Servidor relacionado ao Sintegra

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
unit SintegraController;

interface

uses
  Forms, Classes, SQLExpr, SysUtils, Generics.Collections, Controller, DBXJSON, DBXCommon,
  Biblioteca, Constantes, ACBrSintegra;

type
  TSintegraController = class(TController)
  private
    class procedure GerarRegistro10;
    class procedure GerarRegistro11;
    class procedure GerarRegistro50;
    class procedure GerarRegistro60;
    class procedure GerarRegistro61;
    class function GerarArquivoSintegra: Boolean;
  protected
  public
    // consultar
    class function GerarSintegra(pFiltro: String): String;
  end;

implementation

uses
  T2TiORM, UDataModule, EmpresaController,
  // VOs
  EmpresaVO, ProdutoVO, EcfImpressoraVO, NfeCabecalhoVO, ViewSpedNfeDetalheVO,
  EcfSintegra60mVO, EcfSintegra60aVO, ViewSintegra60dVO, ViewSintegra60rVO,
  EcfNotaFiscalCabecalhoVO, ViewSintegra61rVO;

{ TSintegraController }

var
  Empresa: TEmpresaVO;
  CodigoConvenio, FinalidadeArquivo, NaturezaInformacao, IdEmpresa, IdContador, Inventario: Integer;
  DataInicial, DataFinal, Arquivo, FiltroLocal: String;

{$REGION 'Infra'}
class function TSintegraController.GerarSintegra(pFiltro: String): String;
var
  ConteudoFiltro: TStringList;
begin
  try
    ConteudoFiltro := TStringList.Create;
    Split('|', pFiltro, ConteudoFiltro);
    {
      0 - Periodo Inicial
      1 - Periodo Final
      2 - Código Convênio
      3 - Finalidade Arquivo
      4 - Natureza das Informações
      5 - IdEmpresa
      6 - Inventario
      7 - IdContador
      }
    DataInicial := ConteudoFiltro[0];
    DataFinal := ConteudoFiltro[1];
    CodigoConvenio := StrToInt(ConteudoFiltro[2]);
    FinalidadeArquivo := StrToInt(ConteudoFiltro[3]);
    NaturezaInformacao := StrToInt(ConteudoFiltro[4]);
    IdEmpresa := StrToInt(ConteudoFiltro[5]);
    Inventario := StrToInt(ConteudoFiltro[6]);
    IdContador := StrToInt(ConteudoFiltro[7]);
    //
    GerarArquivoSintegra;
    Result := Arquivo;
  finally
    FreeAndNil(ConteudoFiltro);
  end;
end;
{$ENDREGION}

{$REGION 'Geração Arquivo'}

{$REGION 'REGISTRO TIPO 10 - MESTRE DO ESTABELECIMENTO'}
class procedure TSintegraController.GerarRegistro10;
begin
  try
	  Empresa := TEmpresaController.ConsultaObjeto('ID=' + IntToStr(IdEmpresa));

    with FDataModule.ACBrSintegra do
    begin
      Registro10.CNPJ := Empresa.CNPJ;
      Registro10.Inscricao := Empresa.InscricaoEstadual;
      Registro10.RazaoSocial := Empresa.RazaoSocial;
      Registro10.Cidade := Empresa.EnderecoPrincipal.Cidade;
      Registro10.Estado := Empresa.EnderecoPrincipal.Uf;
      Registro10.Telefone := Empresa.EnderecoPrincipal.Fone;
      Registro10.DataInicial := TextoParaData(DataInicial);
      Registro10.DataFinal := TextoParaData(DataFinal);
      Registro10.CodigoConvenio := IntToStr(CodigoConvenio);
      Registro10.NaturezaInformacoes := IntToStr(NaturezaInformacao);
      Registro10.FinalidadeArquivo := IntToStr(FinalidadeArquivo);
    end;

  finally
  end;
end;
{$ENDREGION}

{$REGION 'Registro Tipo 11 - Dados Complementares do Informante'}
class procedure TSintegraController.GerarRegistro11;
begin
  with FDataModule.ACBrSintegra do
  begin
    Registro11.Endereco := Empresa.EnderecoPrincipal.Logradouro;
    Registro11.Numero := Empresa.EnderecoPrincipal.Numero;
    Registro11.Bairro := Empresa.EnderecoPrincipal.Bairro;
    Registro11.Cep := Empresa.EnderecoPrincipal.CEP;
    Registro11.Responsavel := Empresa.Contato;
    Registro11.Telefone := Empresa.EnderecoPrincipal.Fone;
  end;
end;
{$ENDREGION}

{$REGION 'REGISTRO TIPO 50 - Nota Fiscal, modelo 1 ou 1-A (código 01), quanto ao ICMS, a critério de cada UF, Nota Fiscal do Produtor, modelo 4
(código 04), Nota Fiscal/Conta de Energia Elétrica, modelo 6 (código 06), Nota Fiscal de Serviço de Comunicação, modelo 21 (código 21),
Nota Fiscal de Serviços de Telecomunicações, modelo 22 (código 22), Nota Fiscal Eletrônica, modelo 55 (código 55).'}
class procedure TSintegraController.GerarRegistro50;
var
  ListaNFeCabecalho: TObjectList<TNfeCabecalhoVO>;
  ListaNFeDetalhe: TObjectList<TViewSpedNfeDetalheVO>;
  Registro50: TRegistro50;
  Registro54: TRegistro54;
  Registro75: TRegistro75;
  i, j: Integer;
begin
  try
    ListaNFeCabecalho := TT2TiORM.Consultar<TNfeCabecalhoVO>('DATA_HORA_EMISSAO BETWEEN ' + QuotedStr(DataInicial) + ' and ' + QuotedStr(DataFinal), '-1', False);

    if assigned(ListaNFeCabecalho) then
    begin
      for i := 0 to ListaNFeCabecalho.Count - 1 do
      begin
        Registro50 := TRegistro50.Create;
        Registro50.CPFCNPJ := Empresa.Cnpj;
        Registro50.Inscricao := Empresa.InscricaoEstadual;
        Registro50.DataDocumento := TNfeCabecalhoVO(ListaNFeCabecalho.Items[i]).DataHoraEmissao;
        Registro50.UF := Empresa.EnderecoPrincipal.UF;
        Registro50.ValorContabil := TNfeCabecalhoVO(ListaNFeCabecalho.Items[i]).ValorTotal;
        Registro50.Modelo := TNfeCabecalhoVO(ListaNFeCabecalho.Items[i]).CodigoModelo;
        Registro50.Serie := TNfeCabecalhoVO(ListaNFeCabecalho.Items[i]).Serie;
        Registro50.Numero := TNfeCabecalhoVO(ListaNFeCabecalho.Items[i]).Numero;
        Registro50.EmissorDocumento := 'P';
        Registro50.BasedeCalculo := TNfeCabecalhoVO(ListaNFeCabecalho.Items[i]).BaseCalculoIcms;
        Registro50.Icms := TNfeCabecalhoVO(ListaNFeCabecalho.Items[i]).ValorIcms;
        Registro50.Outras := TNfeCabecalhoVO(ListaNFeCabecalho.Items[i]).ValorDespesasAcessorias;
        Registro50.Situacao := 'N';
        FDataModule.ACBrSintegra.Registros50.Add(Registro50);

        // REGISTRO TIPO 51 - TOTAL DE NOTA FISCAL QUANTO AO IPI
        // REGISTRO TIPO 53 - SUBSTITUIÇÃO TRIBUTÁRIA
        { Não Implementado }

        // REGISTRO TIPO 54 - PRODUTO
        try
          ListaNFeDetalhe := TT2TiORM.Consultar<TViewSpedNfeDetalheVO>('ID_NFE_CABECALHO=' + IntToStr(TNfeCabecalhoVO(ListaNFeCabecalho.Items[i]).Id), '-1', False);
          if assigned(ListaNFeDetalhe) then
          begin
            for j := 0 to ListaNFeDetalhe.Count - 1 do
            begin
              Registro54 := TRegistro54.Create;
              Registro54.CPFCNPJ := Empresa.Cnpj;
              Registro54.Modelo := TNfeCabecalhoVO(ListaNFeCabecalho.Items[i]).CodigoModelo;
              Registro54.Serie := TNfeCabecalhoVO(ListaNFeCabecalho.Items[i]).Serie;
              Registro54.Numero := TNfeCabecalhoVO(ListaNFeCabecalho.Items[i]).Numero;
              Registro54.Cfop := IntToStr(TViewSpedNfeDetalheVO(ListaNFeDetalhe.Items[j]).Cfop);
              Registro54.CST := TViewSpedNfeDetalheVO(ListaNFeDetalhe.Items[j]).CstIcms;
              Registro54.NumeroItem := TViewSpedNfeDetalheVO(ListaNFeDetalhe.Items[j]).NumeroItem;
              Registro54.Codigo := TViewSpedNfeDetalheVO(ListaNFeDetalhe.Items[j]).Gtin;
              Registro54.Descricao := TViewSpedNfeDetalheVO(ListaNFeDetalhe.Items[j]).NomeProduto;
              Registro54.Quantidade := TViewSpedNfeDetalheVO(ListaNFeDetalhe.Items[j]).QuantidadeComercial;
              Registro54.Valor := TViewSpedNfeDetalheVO(ListaNFeDetalhe.Items[j]).ValorTotal;
              Registro54.ValorDescontoDespesa := TViewSpedNfeDetalheVO(ListaNFeDetalhe.Items[j]).ValorDesconto;
              Registro54.BasedeCalculo := TViewSpedNfeDetalheVO(ListaNFeDetalhe.Items[j]).BaseCalculoIcms;
              Registro54.BaseST := TViewSpedNfeDetalheVO(ListaNFeDetalhe.Items[j]).ValorBaseCalculoIcmsSt;
              Registro54.ValorIpi := TViewSpedNfeDetalheVO(ListaNFeDetalhe.Items[j]).ValorIpi;
              Registro54.Aliquota := TViewSpedNfeDetalheVO(ListaNFeDetalhe.Items[j]).AliquotaIcms;
              FDataModule.ACBrSintegra.Registros54.Add(Registro54);

              // REGISTRO TIPO 75 - CÓDIGO DE PRODUTO OU SERVIÇO
              Registro75 := TRegistro75.Create;
              Registro75.DataInicial := TextoParaData(DataInicial);
              Registro75.DataFinal := TextoParaData(DataFinal);
              Registro75.Codigo := TViewSpedNfeDetalheVO(ListaNFeDetalhe.Items[j]).Gtin;
              Registro75.NCM := TViewSpedNfeDetalheVO(ListaNFeDetalhe.Items[j]).Ncm;
              Registro75.Descricao := TViewSpedNfeDetalheVO(ListaNFeDetalhe.Items[j]).NomeProduto;
              Registro75.Unidade := TViewSpedNfeDetalheVO(ListaNFeDetalhe.Items[j]).UnidadeComercial;
              Registro75.AliquotaIpi := TViewSpedNfeDetalheVO(ListaNFeDetalhe.Items[j]).AliquotaIpi;
              Registro75.AliquotaICMS := TViewSpedNfeDetalheVO(ListaNFeDetalhe.Items[j]).AliquotaIcms;
              FDataModule.ACBrSintegra.Registros75.Add(Registro75);
            end;
          end;
        finally
          FreeAndNil(ListaNFeDetalhe);
        end;

        // REGISTRO TIPO 55 - GUIA NACIONAL DE RECOLHIMENTO DE TRIBUTOS ESTADUAIS
        // REGISTRO TIPO 56 - OPERAÇÕES COM VEÍCULOS AUTOMOTORES NOVOS
        // REGISTRO TIPO 57 - NÚMERO DE LOTE DE FABRICAÇÃO DE PRODUTO
        { Não Implementado }

      end;
    end;

  finally
    FreeAndNil(ListaNFeCabecalho);
  end;
end;
{$ENDREGION}

{$REGION 'Registro Tipo 60 - Cupom Fiscal, Cupom Fiscal - PDV ,e os seguintes Documentos Fiscais quando emitidos por
Equipamento Emissor de Cupom Fiscal: Bilhete de Passagem Rodoviário (modelo 13), Bilhete de Passagem Aquaviário
(modelo 14), Bilhete de Passagem e Nota de Bagagem (modelo 15), Bilhete de Passagem Ferroviário (modelo 16), e
Nota Fiscal de Venda a Consumidor (modelo 2)'}
class procedure TSintegraController.GerarRegistro60;
var
  Registro60M: TRegistro60M;
  Registro60A: TRegistro60A;
  Registro60D: TRegistro60D;
  Registro60R: TRegistro60R;
  Registro75: TRegistro75;
  Lista60M: TObjectList<TEcfSintegra60mVO>;
  Lista60A: TObjectList<TEcfSintegra60aVO>;
  Lista60D: TObjectList<TViewSintegra60dVO>;
  Lista60R: TObjectList<TViewSintegra60rVO>;
  Produto: TProdutoVO;
  i,j: Integer;
begin
  try
    // Registro Tipo 60 - Mestre (60M): Identificador do equipamento
    Lista60M := TT2TiORM.Consultar<TEcfSintegra60mVO>('DATA_EMISSAO BETWEEN ' + QuotedStr(DataInicial) + ' and ' + QuotedStr(DataFinal), '-1', False);

    if Assigned(Lista60M) then
    begin

      for i := 0 to Lista60M.Count - 1 do
      begin
        Registro60M := TRegistro60M.Create;
        Registro60M.Emissao := TEcfSintegra60mVO(Lista60M.Items[i]).DataEmissao;
        Registro60M.NumSerie := TEcfSintegra60mVO(Lista60M.Items[i]).NumeroSerieEcf;
        Registro60M.NumOrdem := TEcfSintegra60mVO(Lista60M.Items[i]).NumeroEquipamento;
        if (TEcfSintegra60mVO(Lista60M.Items[i]).ModeloDocumentoFiscal) = '' then
          Registro60M.ModeloDoc := '2D'
        else
          Registro60M.ModeloDoc := TEcfSintegra60mVO(Lista60M.Items[i]).ModeloDocumentoFiscal;
        Registro60M.CooInicial := TEcfSintegra60mVO(Lista60M.Items[i]).COOInicial;
        Registro60M.CooFinal := TEcfSintegra60mVO(Lista60M.Items[i]).COOFinal;
        Registro60M.CRZ := TEcfSintegra60mVO(Lista60M.Items[i]).CRZ;
        Registro60M.CRO := TEcfSintegra60mVO(Lista60M.Items[i]).CRO;
        Registro60M.VendaBruta := TEcfSintegra60mVO(Lista60M.Items[i]).ValorVendaBruta;
        Registro60M.ValorGT := TEcfSintegra60mVO(Lista60M.Items[i]).ValorGrandeTotal;
        FDataModule.ACBrSintegra.Registros60M.Add(Registro60M);

        try
          // Registro Tipo 60 - Analítico (60A): Identificador de cada Situação Tributária no final do dia de cada equipamento emissor de cupom fiscal
          Lista60A := TT2TiORM.Consultar<TEcfSintegra60aVO>('ID_SINTEGRA_60M = ' + IntToStr(Lista60M.Items[i].Id), '-1', False);
          if Assigned(Lista60A) then
          begin
            for j := 0 to Lista60A.Count - 1 do
            begin
              Registro60A := TRegistro60A.Create;
              Registro60A.Emissao := Registro60M.Emissao;
              Registro60A.NumSerie := TEcfSintegra60mVO(Lista60M.Items[i]).NumeroSerieEcf;
              Registro60A.StAliquota := TEcfSintegra60aVO(Lista60A.Items[j]).SituacaoTributaria;
              Registro60A.Valor := TEcfSintegra60aVO(Lista60A.Items[j]).Valor;
              FDataModule.ACBrSintegra.Registros60A.Add(Registro60A);
            end;
          end;
        finally
          FreeAndNil(Lista60A);
        end;
      end;
    end;

    // Registro Tipo 60 - Resumo Diário (60D): Registro de mercadoria/produto ou serviço constante em documento fiscal emitido por Terminal Ponto de Venda (PDV) ou equipamento Emissor de Cupom Fiscal (ECF)
    Lista60D := TT2TiORM.Consultar<TViewSintegra60dVO>('DATA_EMISSAO BETWEEN ' + QuotedStr(DataInicial) + ' and ' + QuotedStr(DataFinal), '-1', False);
    for i := 0 to Lista60D.Count - 1 do
    begin
      Registro60D := TRegistro60D.Create;
      Registro60D.Emissao := TViewSintegra60dVO(Lista60D.Items[i]).DataEmissao;
      Registro60D.NumSerie := TViewSintegra60dVO(Lista60D.Items[i]).Serie;
      Registro60D.Codigo := TViewSintegra60dVO(Lista60D.Items[i]).Gtin;
      Registro60D.Quantidade := TViewSintegra60dVO(Lista60D.Items[i]).SomaQuantidade;
      Registro60D.Valor := TViewSintegra60dVO(Lista60D.Items[i]).SomaItem;
      Registro60D.BaseDeCalculo := TViewSintegra60dVO(Lista60D.Items[i]).SomaBaseIcms;
      Registro60D.StAliquota := TViewSintegra60dVO(Lista60D.Items[i]).EcfIcmsSt;
      Registro60D.ValorIcms := TViewSintegra60dVO(Lista60D.Items[i]).SomaIcms;
      FDataModule.ACBrSintegra.Registros60D.Add(Registro60D);

      // REGISTRO TIPO 75 - CÓDIGO DE PRODUTO OU SERVIÇO
      Produto := TT2TiORM.ConsultarUmObjeto<TProdutoVO>('GTIN=' + QuotedStr(Registro60D.Codigo), False);
      Registro75 := TRegistro75.Create;
      Registro75.DataInicial := FDataModule.ACBrSintegra.Registro10.DataInicial;
      Registro75.DataFinal := FDataModule.ACBrSintegra.Registro10.DataFinal;
      Registro75.Codigo := Registro60D.Codigo;
      Registro75.NCM := Produto.NCM;
      Registro75.Descricao := Produto.DescricaoPDV;
      Registro75.Unidade := Produto.UnidadeProdutoSigla;
      Registro75.AliquotaIPI := 0;
      Registro75.AliquotaICMS := 0;
      FDataModule.ACBrSintegra.Registros75.Add(Registro75);
      FreeAndNil(Produto);
    end;

    // Registro Tipo 60 - Resumo Mensal (60R): Registro de mercadoria/produto ou serviço processado em equipamento Emissor de Cupom Fiscal
    Lista60R := TT2TiORM.Consultar<TViewSintegra60rVO>('DATA_EMISSAO BETWEEN ' + QuotedStr(DataInicial) + ' and ' + QuotedStr(DataFinal), '-1', False);
    for i := 0 to Lista60R.Count - 1 do
    begin
      Registro60R := TRegistro60R.Create;
      Registro60R.MesAno := IntToStr(TViewSintegra60rVO(Lista60R.Items[i]).MesEmissao) + IntToStr(TViewSintegra60rVO(Lista60R.Items[i]).AnoEmissao);
      Registro60R.Codigo := TViewSintegra60rVO(Lista60R.Items[i]).GTIN;
      Registro60R.Qtd := TViewSintegra60rVO(Lista60R.Items[i]).SomaQuantidade;
      Registro60R.Valor := TViewSintegra60rVO(Lista60R.Items[i]).SomaItem;
      Registro60R.BaseDeCalculo := TViewSintegra60rVO(Lista60R.Items[i]).SomaBaseICMS;
      Registro60R.Aliquota := TViewSintegra60rVO(Lista60R.Items[i]).EcfIcmsSt;
      FDataModule.ACBrSintegra.Registros60R.Add(Registro60R);

      // REGISTRO TIPO 75 - CÓDIGO DE PRODUTO OU SERVIÇO
      Produto := TT2TiORM.ConsultarUmObjeto<TProdutoVO>('GTIN=' + QuotedStr(Registro60R.Codigo), False);
      Registro75 := TRegistro75.Create;
      Registro75.DataInicial := FDataModule.ACBrSintegra.Registro10.DataInicial;
      Registro75.DataFinal := FDataModule.ACBrSintegra.Registro10.DataFinal;
      Registro75.Codigo := Registro60R.Codigo;
      Registro75.NCM := Produto.NCM;
      Registro75.Descricao := Produto.Descricao;
      Registro75.Unidade := Produto.UnidadeProdutoSigla;
      Registro75.AliquotaIPI := 0;
      Registro75.AliquotaICMS := 0;
      FDataModule.ACBrSintegra.Registros75.Add(Registro75);
    end;

    // Registro Tipo 60 - Item (60I): Item do documento fiscal emitido por Terminal Ponto de Venda (PDV) ou equipamento Emissor de Cupom Fiscal (ECF)
    { Não Implementado }

  finally
    FreeAndNil(Lista60M);
    FreeAndNil(Lista60D);
    FreeAndNil(Lista60R);
  end;
end;
{$ENDREGION}

{$REGION 'Registro Tipo 61 - REGISTRO TIPO 61: Para os documentos fiscais descritos a seguir, quando não emitidos por equipamento emissor
de cupom fiscal : Bilhete de Passagem Aquaviário (modelo 14), Bilhete de Passagem e Nota de Bagagem (modelo 15),
Bilhete de Passagem Ferroviário (modelo 16), Bilhete de Passagem Rodoviário (modelo 13) e Nota Fiscal de Venda a
Consumidor (modelo 2), Nota Fiscal de Produtor (modelo 4), para as unidades da Federação que não o exigirem na
forma prevista no item 11'}
class procedure TSintegraController.GerarRegistro61;
var
  Registro61: TRegistro61;
  Registro61R: TRegistro61R;
  Registro75: TRegistro75;
  ListaNF2Cabecalho: TObjectList<TEcfNotaFiscalCabecalhoVO>;
  Lista61R: TObjectList<TViewSintegra61rVO>;
  Produto: TProdutoVO;
  i: Integer;
begin
  try
    ListaNF2Cabecalho := TT2TiORM.Consultar<TEcfNotaFiscalCabecalhoVO>('DATA_EMISSAO BETWEEN ' + QuotedStr(DataInicial) + ' and ' + QuotedStr(DataFinal), '-1', False);

    if assigned(ListaNF2Cabecalho) then
    begin
      for i := 0 to ListaNF2Cabecalho.Count - 1 do
      begin
        Registro61 := TRegistro61.Create;
        Registro61.Emissao := TEcfNotaFiscalCabecalhoVO(ListaNF2Cabecalho.Items[i]).DataEmissao;
        Registro61.Modelo := '02';
        Registro61.NumOrdemInicial := StrToInt(TEcfNotaFiscalCabecalhoVO(ListaNF2Cabecalho.Items[i]).Numero);
        Registro61.NumOrdemFinal := StrToInt(TEcfNotaFiscalCabecalhoVO(ListaNF2Cabecalho.Items[i]).Numero);
        Registro61.Serie := TEcfNotaFiscalCabecalhoVO(ListaNF2Cabecalho.Items[i]).Serie;
        Registro61.SubSerie := TEcfNotaFiscalCabecalhoVO(ListaNF2Cabecalho.Items[i]).SubSerie;
        Registro61.Valor := TEcfNotaFiscalCabecalhoVO(ListaNF2Cabecalho.Items[i]).TotalNF;
        Registro61.BaseDeCalculo := TEcfNotaFiscalCabecalhoVO(ListaNF2Cabecalho.Items[i]).BaseICMS;
        Registro61.ValorIcms := TEcfNotaFiscalCabecalhoVO(ListaNF2Cabecalho.Items[i]).ICMS;
        Registro61.Outras := TEcfNotaFiscalCabecalhoVO(ListaNF2Cabecalho.Items[i]).ICMSOutras;
        FDataModule.ACBrSintegra.Registros61.Add(Registro61);
      end;
    end;

    // Registro Tipo 61 - Resumo Mensal por Item (61R): Registro de mercadoria/produto ou serviço comercializados através de Nota Fiscal de Produtor ou Nota Fiscal de Venda a Consumidor não emitida por ECF
    Lista61R := TT2TiORM.Consultar<TViewSintegra61rVO>('DATA_EMISSAO BETWEEN ' + QuotedStr(DataInicial) + ' and ' + QuotedStr(DataFinal), '-1', False);
    if Assigned(Lista61R) then
    begin
      for i := 0 to Lista61R.Count - 1 do
      begin
        Registro61R := TRegistro61R.Create;
        Registro61R.MesAno := IntToStr(TViewSintegra61rVO(Lista61R.Items[i]).MesEmissao) + IntToStr(TViewSintegra61rVO(Lista61R.Items[i]).AnoEmissao);
        Registro61R.Codigo := TViewSintegra61rVO(Lista61R.Items[i]).GTIN;
        Registro61R.Qtd := TViewSintegra61rVO(Lista61R.Items[i]).SomaQuantidade;
        Registro61R.Valor := TViewSintegra61rVO(Lista61R.Items[i]).SomaItem;
        Registro61R.BaseDeCalculo := TViewSintegra61rVO(Lista61R.Items[i]).SomaBaseICMS;

        try
          Registro61R.Aliquota := StrToFloat(TViewSintegra61rVO(Lista61R.Items[i]).EcfIcmsSt)/100;
        except
          Registro61R.Aliquota := 0;
        end;
        FDataModule.ACBrSintegra.Registros61R.Add(Registro61R);

        // REGISTRO TIPO 75 - CÓDIGO DE PRODUTO OU SERVIÇO
        Produto := TT2TiORM.ConsultarUmObjeto<TProdutoVO>('GTIN=' + QuotedStr(Registro61R.Codigo), False);
        Registro75 := TRegistro75.Create;
        Registro75.DataInicial := FDataModule.ACBrSintegra.Registro10.DataInicial;
        Registro75.DataFinal := FDataModule.ACBrSintegra.Registro10.DataFinal;
        Registro75.Codigo := Registro61R.Codigo;
        Registro75.NCM := Produto.NCM;
        Registro75.Descricao := Produto.Descricao;
        Registro75.Unidade := Produto.UnidadeProdutoSigla;
        Registro75.AliquotaIPI := 0;
        Registro75.AliquotaICMS := 0;
        FDataModule.ACBrSintegra.Registros75.Add(Registro75);
      end;
    end;
  finally
    FreeAndNil(ListaNF2Cabecalho);
    FreeAndNil(Lista61R);
  end;
end;
{$ENDREGION}

{$REGION 'Gerar Arquivo'}
class function TSintegraController.GerarArquivoSintegra: Boolean;
begin
  Result := False;
  try
    try

      GerarRegistro10;
      GerarRegistro11;
      GerarRegistro50;
      GerarRegistro60;
      GerarRegistro61;

      // REGISTRO TIPO 70 - Nota Fiscal de Serviço de Transporte E OUTRAS
      // REGISTRO TIPO 71 - Informações da Carga Transportada
      // REGISTRO TIPO 74 - REGISTRO DE INVENTÁRIO
      // REGISTRO TIPO 76 - NOTA FISCAL DE SERVIÇOS DE COMUNICAÇÃO E OUTRAS
      // REGISTRO TIPO 77 - SERVIÇOS DE COMUNICAÇÃO E TELECOMUNICAÇÃO
      // REGISTRO TIPO 85 - Informações de Exportações
      // REGISTRO TIPO 86 - Informações Complementares de Exportações
      { Não Implementado }


      Arquivo := ExtractFilePath(Application.ExeName) + 'Arquivos\Sintegra\Sintegra' + FormatDateTime('DDMMYYYYhhmmss', Now) + '.txt';

      if not DirectoryExists(ExtractFilePath(Application.ExeName) + '\Arquivos\Sintegra\') then
        ForceDirectories(ExtractFilePath(Application.ExeName) + '\Arquivos\Sintegra\');

      FDataModule.ACBrSintegra.FileName := Arquivo;
      FDataModule.ACBrSintegra.VersaoValidador := TVersaoValidador(1);
      FDataModule.ACBrSintegra.GeraArquivo;

      Result := True;
    except
      Result := False;
    end;
  finally
    FreeAndNil(Empresa);
  end;
end;
{$ENDREGION}

{$ENDREGION}

initialization
  Classes.RegisterClass(TSintegraController);

finalization
  Classes.UnRegisterClass(TSintegraController);

end.
