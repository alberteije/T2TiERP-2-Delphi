{*******************************************************************************
Title: T2Ti ERP
Description: Controller do lado Cliente relacionado à tabela [NFE_CABECALHO]

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
unit NfeCabecalhoController;

interface

uses
  Classes, Dialogs, SysUtils, DBClient, DB,  Windows, Forms, Controller, Rtti,
  Atributos, NfeCabecalhoVO, NfeDetalheVO, Generics.Collections, VO;


type
  TNfeCabecalhoController = class(TController)
  private
    class var FDataSet: TClientDataSet;
  public
    class procedure Consulta(pFiltro: String; pPagina: String; pConsultaCompleta: Boolean = False);
    class function ConsultaLista(pFiltro: String): TObjectList<TNfeCabecalhoVO>;
    class function ConsultaObjeto(pFiltro: String): TNfeCabecalhoVO;
    class function ConsultaObjetoDetalhe(pFiltro: String): TNfeDetalheVO;

    class function Insere(pNfeCabecalho: TNfeCabecalhoVO): Boolean;
    class function Altera(pNfeCabecalho: TNfeCabecalhoVO): Boolean;

    class function Exclui(pId: Integer): Boolean;
    class function ExcluiCobranca(pId: Integer): Boolean;
    class function ExcluiReferenciado(pId: Integer): Boolean;
    class function ExcluiEntregaRetirada(pId: Integer): Boolean;
    class function ExcluiTransporte(pId: Integer): Boolean;
    class function ExcluiItem(pId: Integer): Boolean;

    class function GetDataSet: TClientDataSet; override;
    class procedure SetDataSet(pDataSet: TClientDataSet); override;
    class procedure TratarListaRetorno(pListaObjetos: TObjectList<TVO>);
  end;

implementation

uses UDataModule, T2TiORM,
    //
    NfeReferenciadaVO, NfeEmitenteVO, NfeLocalEntregaVO, NfeLocalRetiradaVO,
    NfeTransporteVO, NfeFaturaVO, NfeDuplicataVO, ProdutoLoteVO,
    NfeCupomFiscalReferenciadoVO, NfeDetalheImpostoCofinsVO, NfeDetalheImpostoIcmsVO,
    NfeDetalheImpostoPisVO, NfeDetalheImpostoIiVO, NfeDetalheImpostoIssqnVO,
    NfeDetalheImpostoIpiVO, NfeDeclaracaoImportacaoVO, NfeImportacaoDetalheVO,
    NfeDetEspecificoVeiculoVO, NfeDetEspecificoCombustivelVO, NfeDetEspecificoMedicamentoVO,
    NfeDetEspecificoArmamentoVO, NfeNfReferenciadaVO, NfeCteReferenciadoVO,
    NfeProdRuralReferenciadaVO, NfeTransporteReboqueVO, NfeTransporteVolumeVO,
    TributOperacaoFiscalVO, EmpresaVO,
    //
    ControleEstoqueController;

class procedure TNfeCabecalhoController.Consulta(pFiltro: String; pPagina: String; pConsultaCompleta: Boolean);
var
  Retorno: TObjectList<TNfeCabecalhoVO>;
begin
  try
    Retorno := TT2TiORM.Consultar<TNfeCabecalhoVO>(pFiltro, pPagina, pConsultaCompleta);
    TratarRetorno<TNfeCabecalhoVO>(Retorno);
  finally
  end;
end;

class function TNfeCabecalhoController.ConsultaLista(pFiltro: String): TObjectList<TNfeCabecalhoVO>;
begin
  try
    Result := TT2TiORM.Consultar<TNfeCabecalhoVO>(pFiltro, '-1', True);
  finally
  end;
end;

class function TNfeCabecalhoController.ConsultaObjeto(pFiltro: String): TNfeCabecalhoVO;
begin
  try
    Result := TT2TiORM.ConsultarUmObjeto<TNfeCabecalhoVO>(pFiltro, True);
  finally
  end;
end;

class function TNfeCabecalhoController.ConsultaObjetoDetalhe(pFiltro: String): TNfeDetalheVO;
begin
  try
    Result := TT2TiORM.ConsultarUmObjeto<TNfeDetalheVO>(pFiltro, True);
  finally
  end;
end;

class function TNfeCabecalhoController.Insere(pNfeCabecalho: TNfeCabecalhoVO): Boolean;
var
  UltimoID: Integer;
  //
  ProdutoLote: TProdutoLoteVO;
  //
  NfeReferenciada: TNfeReferenciadaVO;
  NfeNfReferenciada: TNfeNfReferenciadaVO;
  NfeCteReferenciado: TNfeCteReferenciadoVO;
  NfeCupomFiscalReferenciado: TNfeCupomFiscalReferenciadoVO;
  NfeRuralReferenciada: TNfeProdRuralReferenciadaVO;
  NfeTransporteReboque: TNfeTransporteReboqueVO;
  NfeTransporteVolume: TNfeTransporteVolumeVO;
  NfeDuplicata: TNfeDuplicataVO;
  //
  NfeDetalhe: TNfeDetalheVO;
  NfeDeclaracaoImportacao: TNfeDeclaracaoImportacaoVO;
  NfeImportacaoDetalhe: TNfeImportacaoDetalheVO;
  NfeDetalheEspecificoMedicamento: TNfeDetEspecificoMedicamentoVO;
  NfeDetalheEspecificoArmamento: TNfeDetEspecificoArmamentoVO;
  //
  NfeReferenciadaEnumerator: TEnumerator<TNfeReferenciadaVO>;
  NfReferenciadaEnumerator: TEnumerator<TNfeNfReferenciadaVO>;
  NfeRuralReferenciadaEnumerator: TEnumerator<TNfeProdRuralReferenciadaVO>;
  NfeCteReferenciadoEnumerator: TEnumerator<TNfeCteReferenciadoVO>;
  NfeCupomFiscalReferenciadoEnumerator: TEnumerator<TNfeCupomFiscalReferenciadoVO>;
  NfeTransporteReboqueEnumerator: TEnumerator<TNfeTransporteReboqueVO>;
  NfeTransporteVolumeEnumerator: TEnumerator<TNfeTransporteVolumeVO>;
  NfeDuplicataEnumerator: TEnumerator<TNfeDuplicataVO>;
  //
  NfeDetalheEnumerator: TEnumerator<TNfeDetalheVO>;
  NfeDeclaracaoImportacaoEnumerator: TEnumerator<TNfeDeclaracaoImportacaoVO>;
  NfeDetalheEspecificoMedicamentoEnumerator: TEnumerator<TNfeDetEspecificoMedicamentoVO>;
  NfeDetalheEspecificoArmamentoEnumerator: TEnumerator<TNfeDetEspecificoArmamentoVO>;
  NfeImportacaoDetalheEnumerator: TEnumerator<TNfeImportacaoDetalheVO>;
begin
  Result := False;
  try
    UltimoID := TT2TiORM.Inserir(pNfeCabecalho);

    { Destinatario }
    pNfeCabecalho.NfeDestinatarioVO.IdNfeCabecalho := UltimoID;
    TT2TiORM.Inserir(pNfeCabecalho.NfeDestinatarioVO);

    { Emitente }
    pNfeCabecalho.NfeEmitenteVO.IdNfeCabecalho := UltimoID;
    TT2TiORM.Inserir(pNfeCabecalho.NfeEmitenteVO);

    (* Grupo de informação dos documentos referenciados *)
    {NF-e Referenciada}
    NfeReferenciadaEnumerator := pNfeCabecalho.ListaNfeReferenciadaVO.GetEnumerator;
    try
      with NfeReferenciadaEnumerator do
      begin
        while MoveNext do
        begin
          NfeReferenciada := Current;
          NfeReferenciada.IdNfeCabecalho := UltimoID;
          TT2TiORM.Inserir(NfeReferenciada);
        end;
      end;
    finally
      NfeReferenciadaEnumerator.Free;
    end;

    {NF Referenciada}
    NfReferenciadaEnumerator := pNfeCabecalho.ListaNfeNfReferenciadaVO.GetEnumerator;
    try
      with NfReferenciadaEnumerator do
      begin
        while MoveNext do
        begin
          NfeNfReferenciada := Current;
          NfeNfReferenciada.IdNfeCabecalho := UltimoID;
          TT2TiORM.Inserir(NfeNfReferenciada);
        end;
      end;
    finally
      NfReferenciadaEnumerator.Free;
    end;

    {NF Rural Referenciada}
    NfeRuralReferenciadaEnumerator := pNfeCabecalho.ListaNfeProdRuralReferenciadaVO.GetEnumerator;
    try
      with NfeRuralReferenciadaEnumerator do
      begin
        while MoveNext do
        begin
          NfeRuralReferenciada := Current;
          NfeRuralReferenciada.IdNfeCabecalho := UltimoID;
          TT2TiORM.Inserir(NfeRuralReferenciada);
        end;
      end;
    finally
      NfeRuralReferenciadaEnumerator.Free;
    end;

    {CT-e Referenciado}
    NfeCteReferenciadoEnumerator := pNfeCabecalho.ListaNfeCteReferenciadoVO.GetEnumerator;
    try
      with NfeCteReferenciadoEnumerator do
      begin
        while MoveNext do
        begin
          NfeCteReferenciado := Current;
          NfeCteReferenciado.IdNfeCabecalho := UltimoID;
          TT2TiORM.Inserir(NfeCteReferenciado);
        end;
      end;
    finally
      NfeCteReferenciadoEnumerator.Free;
    end;

    {Cupom Fiscal Referenciado}
    NfeCupomFiscalReferenciadoEnumerator := pNfeCabecalho.ListaNfeCupomFiscalReferenciadoVO.GetEnumerator;
    try
      with NfeCupomFiscalReferenciadoEnumerator do
      begin
        while MoveNext do
        begin
          NfeCupomFiscalReferenciado := Current;
          NfeCupomFiscalReferenciado.IdNfeCabecalho := UltimoID;
          TT2TiORM.Inserir(NfeCupomFiscalReferenciado);
        end;
      end;
    finally
      NfeCupomFiscalReferenciadoEnumerator.Free;
    end;
    (* Fim Grupo de informação dos documentos referenciados *)

    { Local Entrega }
    pNfeCabecalho.NfeLocalEntregaVO.IdNfeCabecalho := UltimoID;
    TT2TiORM.Inserir(pNfeCabecalho.NfeLocalEntregaVO);

    { Local Retirada }
    pNfeCabecalho.NfeLocalRetiradaVO.IdNfeCabecalho := UltimoID;
    TT2TiORM.Inserir(pNfeCabecalho.NfeLocalRetiradaVO);


    (* Grupo de Transporte *)
    { Transporte }
    pNfeCabecalho.NfeTransporteVO.IdNfeCabecalho := UltimoID;
    pNfeCabecalho.NfeTransporteVO.Id := TT2TiORM.Inserir(pNfeCabecalho.NfeTransporteVO);

    { Transporte - Reboque }
    NfeTransporteReboqueEnumerator := pNfeCabecalho.NfeTransporteVO.ListaNfeTransporteReboqueVO.GetEnumerator;
    try
      with NfeTransporteReboqueEnumerator do
      begin
        while MoveNext do
        begin
          NfeTransporteReboque := Current;
          NfeTransporteReboque.IdNfeTransporte := pNfeCabecalho.NfeTransporteVO.Id;
          TT2TiORM.Inserir(NfeTransporteReboque);
        end;
      end;
    finally
      NfeTransporteReboqueEnumerator.Free;
    end;

    { Transporte - Volumes }
    NfeTransporteVolumeEnumerator := pNfeCabecalho.NfeTransporteVO.ListaNfeTransporteVolumeVO.GetEnumerator;
    try
      with NfeTransporteVolumeEnumerator do
      begin
        while MoveNext do
        begin
          NfeTransporteVolume := Current;
          NfeTransporteVolume.IdNfeTransporte := pNfeCabecalho.NfeTransporteVO.Id;
          TT2TiORM.Inserir(NfeTransporteVolume);
        end;
      end;
    finally
      NfeTransporteVolumeEnumerator.Free;
    end;
    (* Fim Grupo de Transporte *)


    (* Grupo de Cobrança *)
    { Fatura }
    pNfeCabecalho.NfeFaturaVO.IdNfeCabecalho := UltimoID;
    TT2TiORM.Inserir(pNfeCabecalho.NfeFaturaVO);

    { Duplicatas }
    NfeDuplicataEnumerator := pNfeCabecalho.ListaNfeDuplicataVO.GetEnumerator;
    try
      with NfeDuplicataEnumerator do
      begin
        while MoveNext do
        begin
          NfeDuplicata := Current;
          NfeDuplicata.IdNfeCabecalho := UltimoID;
          TT2TiORM.Inserir(NfeDuplicata);
        end;
      end;
    finally
      NfeDuplicataEnumerator.Free;
    end;
    (* Fim Grupo de Cobrança *)


    (* Grupo de Detalhes *)
    { NFeDetalhe }
    NFeDetalheEnumerator := pNfeCabecalho.ListaNfeDetalheVO.GetEnumerator;
    try
      with NFeDetalheEnumerator do
      begin
        while MoveNext do
        begin
          NFeDetalhe := Current;
          NFeDetalhe.IdNfeCabecalho := UltimoID;
          NFeDetalhe.Id := TT2TiORM.Inserir(NFeDetalhe);

          // Atualiza estoque TIPO_OPERACAO ->> 0=Entrada | 1=Saída
          if pNfeCabecalho.TipoOperacao = 0 then
            TControleEstoqueController.AtualizarEstoque(NFeDetalhe.QuantidadeComercial, NFeDetalhe.IdProduto, pNFeCabecalho.IdEmpresa, pNFeCabecalho.EmpresaVO.TipoControleEstoque)
          else
            TControleEstoqueController.AtualizarEstoque(NFeDetalhe.QuantidadeComercial * -1, NFeDetalhe.IdProduto, pNFeCabecalho.IdEmpresa, pNFeCabecalho.EmpresaVO.TipoControleEstoque);

          { Detalhe - Imposto - ICMS }
          NFeDetalhe.NfeDetalheImpostoIcmsVO.IdNfeDetalhe := NFeDetalhe.Id;
          TT2TiORM.Inserir(NFeDetalhe.NfeDetalheImpostoIcmsVO);

          { Detalhe - Imposto - IPI }
          NFeDetalhe.NfeDetalheImpostoIpiVO.IdNfeDetalhe := NFeDetalhe.Id;
          TT2TiORM.Inserir(NFeDetalhe.NfeDetalheImpostoIpiVO);

          { Detalhe - Imposto - II }
          NFeDetalhe.NfeDetalheImpostoIiVO.IdNfeDetalhe := NFeDetalhe.Id;
          TT2TiORM.Inserir(NFeDetalhe.NfeDetalheImpostoIiVO);

          { Detalhe - Imposto - PIS }
          NFeDetalhe.NfeDetalheImpostoPisVO.IdNfeDetalhe := NFeDetalhe.Id;
          TT2TiORM.Inserir(NFeDetalhe.NfeDetalheImpostoPisVO);

          { Detalhe - Imposto - COFINS }
          NFeDetalhe.NfeDetalheImpostoCofinsVO.IdNfeDetalhe := NFeDetalhe.Id;
          TT2TiORM.Inserir(NFeDetalhe.NfeDetalheImpostoCofinsVO);

          { Detalhe - Imposto - ISSQN }
          NFeDetalhe.NfeDetalheImpostoIssqnVO.IdNfeDetalhe := NFeDetalhe.Id;
          TT2TiORM.Inserir(NFeDetalhe.NfeDetalheImpostoIssqnVO);

          { Detalhe - Específico - Veículo }
          NFeDetalhe.NfeDetEspecificoVeiculoVO.IdNfeDetalhe := NFeDetalhe.Id;
          TT2TiORM.Inserir(NFeDetalhe.NfeDetEspecificoVeiculoVO);

          { Detalhe - Específico - Combustível }
          NFeDetalhe.NfeDetEspecificoCombustivelVO.IdNfeDetalhe := NFeDetalhe.Id;
          TT2TiORM.Inserir(NFeDetalhe.NfeDetEspecificoCombustivelVO);

          { Detalhe - Específico - Medicamento }
          NfeDetalheEspecificoMedicamentoEnumerator := NFeDetalhe.ListaNfeDetEspecificoMedicamentoVO.GetEnumerator;
          try
            with NfeDetalheEspecificoMedicamentoEnumerator do
            begin
              while MoveNext do
              begin
                NfeDetalheEspecificoMedicamento := Current;
                NfeDetalheEspecificoMedicamento.IdNfeDetalhe := NFeDetalhe.Id;
                TT2TiORM.Inserir(NfeDetalheEspecificoMedicamento);

                // Produto - Lote
                ProdutoLote := TProdutoLoteVO.Create;
                ProdutoLote.IdProduto := NFeDetalhe.IdProduto;
                ProdutoLote.Codigo := NfeDetalheEspecificoMedicamento.NumeroLote;
                ProdutoLote.DataCadastro := now;
                ProdutoLote.DataCompra := pNfeCabecalho.DataHoraEmissao;
                ProdutoLote.DataFabricacao := NfeDetalheEspecificoMedicamento.DataFabricacao;
                ProdutoLote.DataValidade := NfeDetalheEspecificoMedicamento.DataValidade;
                ProdutoLote.Quantidade := NfeDetalheEspecificoMedicamento.QuantidadeLote;
                ProdutoLote.PrecoMaximoConsumidor := NfeDetalheEspecificoMedicamento.PrecoMaximoConsumidor;
                TT2TiORM.Inserir(ProdutoLote);
              end;
            end;
          finally
            NfeDetalheEspecificoMedicamentoEnumerator.Free;
          end;

          { Detalhe - Específico - Armamento }
          NfeDetalheEspecificoArmamentoEnumerator := NFeDetalhe.ListaNfeDetEspecificoArmamentoVO.GetEnumerator;
          try
            with NfeDetalheEspecificoArmamentoEnumerator do
            begin
              while MoveNext do
              begin
                NfeDetalheEspecificoArmamento := Current;
                NfeDetalheEspecificoArmamento.IdNfeDetalhe := NFeDetalhe.Id;
                TT2TiORM.Inserir(NfeDetalheEspecificoArmamento);
              end;
            end;
          finally
            NfeDetalheEspecificoArmamentoEnumerator.Free;
          end;

          { Detalhe - Declaração de Importação }
          NfeDeclaracaoImportacaoEnumerator := NFeDetalhe.ListaNfeDeclaracaoImportacaoVO.GetEnumerator;
          try
            with NfeDeclaracaoImportacaoEnumerator do
            begin
              while MoveNext do
              begin
                NfeDeclaracaoImportacao := Current;
                NfeDeclaracaoImportacao.IdNfeDetalhe := NFeDetalhe.Id;
                NfeDeclaracaoImportacao.Id := TT2TiORM.Inserir(NfeDeclaracaoImportacao);

                { Detalhe - Declaração de Importação - Adições }
                NfeImportacaoDetalheEnumerator := NfeDeclaracaoImportacao.ListaNfeImportacaoDetalheVO.GetEnumerator;
                try
                  with NfeImportacaoDetalheEnumerator do
                  begin
                    while MoveNext do
                    begin
                      NfeImportacaoDetalhe := Current;
                      NfeImportacaoDetalhe.IdNfeDeclaracaoImportacao := NfeDeclaracaoImportacao.Id;
                      NfeImportacaoDetalhe.Id := TT2TiORM.Inserir(NfeImportacaoDetalhe);
                    end;
                  end;
                finally
                  NfeImportacaoDetalheEnumerator.Free;
                end;

              end;
            end;
          finally
            NfeDeclaracaoImportacaoEnumerator.Free;
          end;

        end;
      end;
    finally
      NFeDetalheEnumerator.Free;
    end;
    (* Fim Grupo de Detalhes *)

    Consulta('ID = ' + IntToStr(UltimoID), '0');
    Result := True;
  finally
  end;
end;

class function TNfeCabecalhoController.Altera(pNfeCabecalho: TNfeCabecalhoVO): Boolean;
var
  NfeReferenciadaEnumerator: TEnumerator<TNfeReferenciadaVO>;
  NfReferenciadaEnumerator: TEnumerator<TNfeNfReferenciadaVO>;
  NfeRuralReferenciadaEnumerator: TEnumerator<TNfeProdRuralReferenciadaVO>;
  NfeCteReferenciadoEnumerator: TEnumerator<TNfeCteReferenciadoVO>;
  NfeCupomFiscalReferenciadoEnumerator: TEnumerator<TNfeCupomFiscalReferenciadoVO>;
  NfeTransporteReboqueEnumerator: TEnumerator<TNfeTransporteReboqueVO>;
  NfeTransporteVolumeEnumerator: TEnumerator<TNfeTransporteVolumeVO>;
  NfeDuplicataEnumerator: TEnumerator<TNfeDuplicataVO>;
  //
  NfeDetalheEnumerator: TEnumerator<TNfeDetalheVO>;
  NfeDetalheEnumeratorOld: TEnumerator<TNfeDetalheVO>;
  NfeDeclaracaoImportacaoEnumerator: TEnumerator<TNfeDeclaracaoImportacaoVO>;
  NfeDetalheEspecificoMedicamentoEnumerator: TEnumerator<TNfeDetEspecificoMedicamentoVO>;
  NfeDetalheEspecificoArmamentoEnumerator: TEnumerator<TNfeDetEspecificoArmamentoVO>;
  NfeImportacaoDetalheEnumerator: TEnumerator<TNfeImportacaoDetalheVO>;
  //
  NfeDetalheOld: TNfeDetalheVO;
begin
  try
    try
      Result := TT2TiORM.Alterar(pNfeCabecalho);

      { Destinatario }
      if pNfeCabecalho.NfeDestinatarioVO.Id > 0 then
        Result := TT2TiORM.Alterar(pNfeCabecalho.NfeDestinatarioVO)
      else
      begin
        pNfeCabecalho.NfeDestinatarioVO.IdNfeCabecalho := pNfeCabecalho.Id;
        Result := TT2TiORM.Inserir(pNfeCabecalho.NfeDestinatarioVO) > 0;
      end;

      { Emitente }
      if pNfeCabecalho.NfeEmitenteVO.Id > 0 then
        Result := TT2TiORM.Alterar(pNfeCabecalho.NfeEmitenteVO)
      else
      begin
        pNfeCabecalho.NfeEmitenteVO.IdNfeCabecalho := pNfeCabecalho.Id;
        Result := TT2TiORM.Inserir(pNfeCabecalho.NfeEmitenteVO) > 0;
      end;

      (* Grupo de informação dos documentos referenciados *)
      {NF-e Referenciada}
      NfeReferenciadaEnumerator := pNfeCabecalho.ListaNfeReferenciadaVO.GetEnumerator;
      try
        with NfeReferenciadaEnumerator do
        begin
          while MoveNext do
          begin
            if Current.Id > 0 then
              Result := TT2TiORM.Alterar(Current)
            else
            begin
              Current.IdNfeCabecalho := pNfeCabecalho.Id;
              Result := TT2TiORM.Inserir(Current) > 0;
            end;
          end;
        end;
      finally
        NfeReferenciadaEnumerator.Free;
      end;

      {NF Referenciada}
      NfReferenciadaEnumerator := pNfeCabecalho.ListaNfeNfReferenciadaVO.GetEnumerator;
      try
        with NfReferenciadaEnumerator do
        begin
          while MoveNext do
          begin
            if Current.Id > 0 then
              Result := TT2TiORM.Alterar(Current)
            else
            begin
              Current.IdNfeCabecalho := pNfeCabecalho.Id;
              Result := TT2TiORM.Inserir(Current) > 0;
            end;
          end;
        end;
      finally
        NfReferenciadaEnumerator.Free;
      end;

      {NF Rural Referenciada}
      NfeRuralReferenciadaEnumerator := pNfeCabecalho.ListaNfeProdRuralReferenciadaVO.GetEnumerator;
      try
        with NfeRuralReferenciadaEnumerator do
        begin
          while MoveNext do
          begin
            if Current.Id > 0 then
              Result := TT2TiORM.Alterar(Current)
            else
            begin
              Current.IdNfeCabecalho := pNfeCabecalho.Id;
              Result := TT2TiORM.Inserir(Current) > 0;
            end;
          end;
        end;
      finally
        NfeRuralReferenciadaEnumerator.Free;
      end;

      {CT-e Referenciado}
      NfeCteReferenciadoEnumerator := pNfeCabecalho.ListaNfeCteReferenciadoVO.GetEnumerator;
      try
        with NfeCteReferenciadoEnumerator do
        begin
          while MoveNext do
          begin
            if Current.Id > 0 then
              Result := TT2TiORM.Alterar(Current)
            else
            begin
              Current.IdNfeCabecalho := pNfeCabecalho.Id;
              Result := TT2TiORM.Inserir(Current) > 0;
            end;
          end;
        end;
      finally
        NfeCteReferenciadoEnumerator.Free;
      end;

      {Cupom Fiscal Referenciado}
      NfeCupomFiscalReferenciadoEnumerator := pNfeCabecalho.ListaNfeCupomFiscalReferenciadoVO.GetEnumerator;
      try
        with NfeCupomFiscalReferenciadoEnumerator do
        begin
          while MoveNext do
          begin
            if Current.Id > 0 then
              Result := TT2TiORM.Alterar(Current)
            else
            begin
              Current.IdNfeCabecalho := pNfeCabecalho.Id;
              Result := TT2TiORM.Inserir(Current) > 0;
            end;
          end;
        end;
      finally
        NfeCupomFiscalReferenciadoEnumerator.Free;
      end;
      (* Fim Grupo de informação dos documentos referenciados *)

      { Local Entrega }
      if pNfeCabecalho.NfeLocalEntregaVO.Id > 0 then
        Result := TT2TiORM.Alterar(pNfeCabecalho.NfeLocalEntregaVO)
      else
      begin
        pNfeCabecalho.NfeLocalEntregaVO.IdNfeCabecalho := pNfeCabecalho.Id;
        Result := TT2TiORM.Inserir(pNfeCabecalho.NfeLocalEntregaVO) > 0;
      end;

      { Local Retirada }
      if pNfeCabecalho.NfeLocalRetiradaVO.Id > 0 then
        Result := TT2TiORM.Alterar(pNfeCabecalho.NfeLocalRetiradaVO)
      else
      begin
        pNfeCabecalho.NfeLocalRetiradaVO.IdNfeCabecalho := pNfeCabecalho.Id;
        Result := TT2TiORM.Inserir(pNfeCabecalho.NfeLocalRetiradaVO) > 0;
      end;


      (* Grupo de Transporte *)
      { Transporte }
      if pNfeCabecalho.NfeTransporteVO.Id > 0 then
        Result := TT2TiORM.Alterar(pNfeCabecalho.NfeTransporteVO)
      else
      begin
        pNfeCabecalho.NfeTransporteVO.IdNfeCabecalho := pNfeCabecalho.Id;
        pNfeCabecalho.NfeTransporteVO.Id := TT2TiORM.Inserir(pNfeCabecalho.NfeTransporteVO);
      end;

      { Transporte - Reboque }
      NfeTransporteReboqueEnumerator := pNfeCabecalho.NfeTransporteVO.ListaNfeTransporteReboqueVO.GetEnumerator;
      try
        with NfeTransporteReboqueEnumerator do
        begin
          while MoveNext do
          begin
            if Current.Id > 0 then
              Result := TT2TiORM.Alterar(Current)
            else
            begin
              Current.IdNfeTransporte := pNfeCabecalho.NfeTransporteVO.Id;
              Result := TT2TiORM.Inserir(Current) > 0;
            end;
          end;
        end;
      finally
        NfeTransporteReboqueEnumerator.Free;
      end;

      { Transporte - Volumes }
      NfeTransporteVolumeEnumerator := pNfeCabecalho.NfeTransporteVO.ListaNfeTransporteVolumeVO.GetEnumerator;
      try
        with NfeTransporteVolumeEnumerator do
        begin
          while MoveNext do
          begin
            if Current.Id > 0 then
              Result := TT2TiORM.Alterar(Current)
            else
            begin
              Current.IdNfeTransporte := pNfeCabecalho.NfeTransporteVO.Id;
              Result := TT2TiORM.Inserir(Current) > 0;
            end;
          end;
        end;
      finally
        NfeTransporteVolumeEnumerator.Free;
      end;
      (* Fim Grupo de Transporte *)


      (* Grupo de Cobrança *)
      { Fatura }
      if pNfeCabecalho.NfeFaturaVO.Id > 0 then
        Result := TT2TiORM.Alterar(pNfeCabecalho.NfeFaturaVO)
      else
      begin
        pNfeCabecalho.NfeFaturaVO.IdNfeCabecalho := pNfeCabecalho.Id;
        Result := TT2TiORM.Inserir(pNfeCabecalho.NfeFaturaVO) > 0;
      end;

      { Duplicatas }
      NfeDuplicataEnumerator := pNfeCabecalho.ListaNfeDuplicataVO.GetEnumerator;
      try
        with NfeDuplicataEnumerator do
        begin
          while MoveNext do
          begin
            if Current.Id > 0 then
              Result := TT2TiORM.Alterar(Current)
            else
            begin
              Current.IdNfeCabecalho := pNfeCabecalho.Id;
              Result := TT2TiORM.Inserir(Current) > 0;
            end;
          end;
        end;
      finally
        NfeDuplicataEnumerator.Free;
      end;
      (* Fim Grupo de Cobrança *)


      (* Grupo de Detalhes *)
      { NFeDetalhe }
      NFeDetalheEnumerator := pNfeCabecalho.ListaNfeDetalheVO.GetEnumerator;
      try
        with NFeDetalheEnumerator do
        begin
          while MoveNext do
          begin

            if Current.Id > 0 then
            begin
              try
                //Pega o valor atual do detalhe da NFe para verificar se houve alteração na quantidade
                NfeDetalheOld := ConsultaObjetoDetalhe('ID=' + Current.Id.ToString);

                Result := TT2TiORM.Alterar(Current);

                if Assigned(NfeDetalheOld) then
                begin
                  if NfeDetalheOld.QuantidadeComercial <> Current.QuantidadeComercial then
                  begin
                    // Atualiza estoque TIPO_OPERACAO ->> 0=Entrada | 1=Saída
                    if pNfeCabecalho.TipoOperacao = 0 then
                      TControleEstoqueController.AtualizarEstoque(Current.QuantidadeComercial-NfeDetalheOld.QuantidadeComercial, Current.IdProduto, pNFeCabecalho.IdEmpresa, pNFeCabecalho.EmpresaVO.TipoControleEstoque)
                    else
                      TControleEstoqueController.AtualizarEstoque((Current.QuantidadeComercial-NfeDetalheOld.QuantidadeComercial) * -1, Current.IdProduto, pNFeCabecalho.IdEmpresa, pNFeCabecalho.EmpresaVO.TipoControleEstoque);
                  end;
                end;
              finally
                FreeAndNil(NfeDetalheOld);
              end;
            end
            else
            begin
              Current.IdNfeCabecalho := pNfeCabecalho.Id;
              Current.Id := TT2TiORM.Inserir(Current);

              // Atualiza estoque TIPO_OPERACAO ->> 0=Entrada | 1=Saída
              if pNfeCabecalho.TipoOperacao = 0 then
                TControleEstoqueController.AtualizarEstoque(Current.QuantidadeComercial, Current.IdProduto, pNFeCabecalho.IdEmpresa, pNFeCabecalho.EmpresaVO.TipoControleEstoque)
              else
                TControleEstoqueController.AtualizarEstoque(Current.QuantidadeComercial * -1, Current.IdProduto, pNFeCabecalho.IdEmpresa, pNFeCabecalho.EmpresaVO.TipoControleEstoque);
            end;


            { Detalhe - Imposto - ICMS }
            Current.NfeDetalheImpostoIcmsVO.IdNfeDetalhe := Current.Id;
            if Current.NfeDetalheImpostoIcmsVO.Id > 0 then
              Result := TT2TiORM.Alterar(Current.NfeDetalheImpostoIcmsVO)
            else
            begin
              Current.NfeDetalheImpostoIcmsVO.IdNfeDetalhe := Current.Id;
              Result := TT2TiORM.Inserir(Current.NfeDetalheImpostoIcmsVO) > 0;
            end;

            { Detalhe - Imposto - IPI }
            Current.NfeDetalheImpostoIpiVO.IdNfeDetalhe := Current.Id;
            if Current.NfeDetalheImpostoIpiVO.Id > 0 then
              Result := TT2TiORM.Alterar(Current.NfeDetalheImpostoIpiVO)
            else
            begin
              Current.NfeDetalheImpostoIpiVO.IdNfeDetalhe := Current.Id;
              Result := TT2TiORM.Inserir(Current.NfeDetalheImpostoIpiVO) > 0;
            end;

            { Detalhe - Imposto - II }
            Current.NfeDetalheImpostoIiVO.IdNfeDetalhe := Current.Id;
            if Current.NfeDetalheImpostoIiVO.Id > 0 then
              Result := TT2TiORM.Alterar(Current.NfeDetalheImpostoIiVO)
            else
            begin
              Current.NfeDetalheImpostoIiVO.IdNfeDetalhe := Current.Id;
              Result := TT2TiORM.Inserir(Current.NfeDetalheImpostoIiVO) > 0;
            end;

            { Detalhe - Imposto - PIS }
            Current.NfeDetalheImpostoPisVO.IdNfeDetalhe := Current.Id;
            if Current.NfeDetalheImpostoPisVO.Id > 0 then
              Result := TT2TiORM.Alterar(Current.NfeDetalheImpostoPisVO)
            else
            begin
              Current.NfeDetalheImpostoPisVO.IdNfeDetalhe := Current.Id;
              Result := TT2TiORM.Inserir(Current.NfeDetalheImpostoPisVO) > 0;
            end;

            { Detalhe - Imposto - COFINS }
            Current.NfeDetalheImpostoCofinsVO.IdNfeDetalhe := Current.Id;
            if Current.NfeDetalheImpostoCofinsVO.Id > 0 then
              Result := TT2TiORM.Alterar(Current.NfeDetalheImpostoCofinsVO)
            else
            begin
              Current.NfeDetalheImpostoCofinsVO.IdNfeDetalhe := Current.Id;
              Result := TT2TiORM.Inserir(Current.NfeDetalheImpostoCofinsVO) > 0;
            end;

            { Detalhe - Imposto - ISSQN }
            Current.NfeDetalheImpostoIssqnVO.IdNfeDetalhe := Current.Id;
            if Current.NfeDetalheImpostoIssqnVO.Id > 0 then
              Result := TT2TiORM.Alterar(Current.NfeDetalheImpostoIssqnVO)
            else
            begin
              Current.NfeDetalheImpostoIssqnVO.IdNfeDetalhe := Current.Id;
              Result := TT2TiORM.Inserir(Current.NfeDetalheImpostoIssqnVO) > 0;
            end;

            { Detalhe - Específico - Veículo }
            Current.NfeDetEspecificoVeiculoVO.IdNfeDetalhe := Current.Id;
            if Current.NfeDetEspecificoVeiculoVO.Id > 0 then
              Result := TT2TiORM.Alterar(Current.NfeDetEspecificoVeiculoVO)
            else
            begin
              Current.NfeDetEspecificoVeiculoVO.IdNfeDetalhe := Current.Id;
              Result := TT2TiORM.Inserir(Current.NfeDetEspecificoVeiculoVO) > 0;
            end;

            { Detalhe - Específico - Combustível }
            Current.NfeDetEspecificoCombustivelVO.IdNfeDetalhe := Current.Id;
            if Current.NfeDetEspecificoCombustivelVO.Id > 0 then
              Result := TT2TiORM.Alterar(Current.NfeDetEspecificoCombustivelVO)
            else
            begin
              Current.NfeDetEspecificoCombustivelVO.IdNfeDetalhe := Current.Id;
              Result := TT2TiORM.Inserir(Current.NfeDetEspecificoCombustivelVO) > 0;
            end;

            { Detalhe - Específico - Medicamento }
            NfeDetalheEspecificoMedicamentoEnumerator := Current.ListaNfeDetEspecificoMedicamentoVO.GetEnumerator;
            try
              with NfeDetalheEspecificoMedicamentoEnumerator do
              begin
                while MoveNext do
                begin
                  if Current.Id > 0 then
                    Result := TT2TiORM.Alterar(Current)
                  else
                    Result := TT2TiORM.Inserir(Current) > 0;
                end;
              end;
            finally
              NfeDetalheEspecificoMedicamentoEnumerator.Free;
            end;

            { Detalhe - Específico - Armamento }
            NfeDetalheEspecificoArmamentoEnumerator := Current.ListaNfeDetEspecificoArmamentoVO.GetEnumerator;
            try
              with NfeDetalheEspecificoArmamentoEnumerator do
              begin
                while MoveNext do
                begin
                  if Current.Id > 0 then
                    Result := TT2TiORM.Alterar(Current)
                  else
                    Result := TT2TiORM.Inserir(Current) > 0;
                end;
              end;
            finally
              NfeDetalheEspecificoArmamentoEnumerator.Free;
            end;

            { Detalhe - Declaração de Importação }
            NfeDeclaracaoImportacaoEnumerator := Current.ListaNfeDeclaracaoImportacaoVO.GetEnumerator;
            try
              with NfeDeclaracaoImportacaoEnumerator do
              begin
                while MoveNext do
                begin
                  if Current.Id > 0 then
                    Result := TT2TiORM.Alterar(Current)
                  else
                    Result := TT2TiORM.Inserir(Current) > 0;

                  { Detalhe - Declaração de Importação - Adições }
                  NfeImportacaoDetalheEnumerator := Current.ListaNfeImportacaoDetalheVO.GetEnumerator;
                  try
                    with NfeImportacaoDetalheEnumerator do
                    begin
                      while MoveNext do
                      begin
                        if Current.Id > 0 then
                          Result := TT2TiORM.Alterar(Current)
                        else
                          Result := TT2TiORM.Inserir(Current) > 0;
                      end;
                    end;
                  finally
                    NfeImportacaoDetalheEnumerator.Free;
                  end;

                end;
              end;
            finally
              NfeDeclaracaoImportacaoEnumerator.Free;
            end;

          end;
        end;
      finally
        NFeDetalheEnumerator.Free;
      end;
      (* Fim Grupo de Detalhes *)

    finally
    end;
  except
    on E: Exception do
      Application.MessageBox(PChar('Ocorreu um erro na alteração do registro. Informe a mensagem ao Administrador do sistema.' + #13 + #13 + E.Message), 'Erro do sistema', MB_OK + MB_ICONERROR);
  end;
end;

class function TNfeCabecalhoController.Exclui(pId: Integer): Boolean;
begin
  try
    raise Exception.Create('Não é permitido excluir uma NFe.');
  finally
  end;
end;

class function TNfeCabecalhoController.ExcluiCobranca(pId: Integer): Boolean;
begin
  try
    Result := TT2TiORM.ComandoSQL('DELETE FROM NFE_FATURA where ID_NFE_CABECALHO = ' + IntToStr(pId));
    Result := TT2TiORM.ComandoSQL('DELETE FROM NFE_DUPLICATA where ID_NFE_CABECALHO = ' + IntToStr(pId));
    TratarRetorno(Result);
  finally
  end;
end;

class function TNfeCabecalhoController.ExcluiReferenciado(pId: Integer): Boolean;
begin
  try
    Result := TT2TiORM.ComandoSQL('DELETE FROM NFE_REFERENCIADA where ID_NFE_CABECALHO = ' + IntToStr(pId));
    Result := TT2TiORM.ComandoSQL('DELETE FROM NFE_NF_REFERENCIADA where ID_NFE_CABECALHO = ' + IntToStr(pId));
    Result := TT2TiORM.ComandoSQL('DELETE FROM NFE_CTE_REFERENCIADO where ID_NFE_CABECALHO = ' + IntToStr(pId));
    Result := TT2TiORM.ComandoSQL('DELETE FROM NFE_PROD_RURAL_REFERENCIADA where ID_NFE_CABECALHO = ' + IntToStr(pId));
    Result := TT2TiORM.ComandoSQL('DELETE FROM NFE_CUPOM_FISCAL_REFERENCIADO where ID_NFE_CABECALHO = ' + IntToStr(pId));
    TratarRetorno(Result);
  finally
  end;
end;

class function TNfeCabecalhoController.ExcluiEntregaRetirada(pId: Integer): Boolean;
begin
  try
    Result := TT2TiORM.ComandoSQL('DELETE FROM NFE_LOCAL_ENTREGA where ID_NFE_CABECALHO = ' + IntToStr(pId));
    Result := TT2TiORM.ComandoSQL('DELETE FROM NFE_LOCAL_RETIRADA where ID_NFE_CABECALHO = ' + IntToStr(pId));
    TratarRetorno(Result);
  finally
  end;
end;

class function TNfeCabecalhoController.ExcluiTransporte(pId: Integer): Boolean;
var
  IdRetornado: Integer;
begin
  try
    IdRetornado := TT2TiORM.SelectMax('NFE_TRANSPORTE', 'ID_NFE_CABECALHO= ' + IntToStr(pId));
    if IdRetornado <> -1 then
    begin
      Result := TT2TiORM.ComandoSQL('DELETE FROM NFE_TRANSPORTE_REBOQUE where ID_NFE_TRANSPORTE = ' + IntToStr(IdRetornado));

      IdRetornado := TT2TiORM.SelectMax('NFE_TRANSPORTE_VOLUME', 'ID_NFE_TRANSPORTE= ' + IntToStr(IdRetornado));
      if IdRetornado <> -1 then
      begin
        Result := TT2TiORM.ComandoSQL('DELETE FROM NFE_TRANSPORTE_VOLUME_LACRE where ID_NFE_TRANSPORTE_VOLUME = ' + IntToStr(IdRetornado));
        Result := TT2TiORM.ComandoSQL('DELETE FROM NFE_TRANSPORTE_VOLUME where ID = ' + IntToStr(IdRetornado));
      end;
      Result := TT2TiORM.ComandoSQL('DELETE FROM NFE_TRANSPORTE where ID_NFE_CABECALHO = ' + IntToStr(pId));
    end;
    TratarRetorno(Result);
  finally
  end;
end;

class function TNfeCabecalhoController.ExcluiItem(pId: Integer): Boolean;
var
  IdRetornado: Integer;
  NfeCabecalho: TNfeCabecalhoVO;
  NfeDetalhe: TNfeDetalheVO;
begin
  try
    Result := TT2TiORM.ComandoSQL('DELETE FROM NFE_DETALHE_IMPOSTO_COFINS where ID_NFE_DETALHE = ' + IntToStr(pId));
    Result := TT2TiORM.ComandoSQL('DELETE FROM NFE_DETALHE_IMPOSTO_PIS where ID_NFE_DETALHE = ' + IntToStr(pId));
    Result := TT2TiORM.ComandoSQL('DELETE FROM NFE_DETALHE_IMPOSTO_ICMS where ID_NFE_DETALHE = ' + IntToStr(pId));
    Result := TT2TiORM.ComandoSQL('DELETE FROM NFE_DETALHE_IMPOSTO_II where ID_NFE_DETALHE = ' + IntToStr(pId));
    Result := TT2TiORM.ComandoSQL('DELETE FROM NFE_DETALHE_IMPOSTO_IPI where ID_NFE_DETALHE = ' + IntToStr(pId));
    Result := TT2TiORM.ComandoSQL('DELETE FROM NFE_DETALHE_IMPOSTO_ISSQN where ID_NFE_DETALHE = ' + IntToStr(pId));
    Result := TT2TiORM.ComandoSQL('DELETE FROM NFE_DET_ESPECIFICO_COMBUSTIVEL where ID_NFE_DETALHE = ' + IntToStr(pId));
    Result := TT2TiORM.ComandoSQL('DELETE FROM NFE_DET_ESPECIFICO_VEICULO where ID_NFE_DETALHE = ' + IntToStr(pId));
    Result := TT2TiORM.ComandoSQL('DELETE FROM NFE_DET_ESPECIFICO_ARMAMENTO where ID_NFE_DETALHE = ' + IntToStr(pId));
    Result := TT2TiORM.ComandoSQL('DELETE FROM NFE_DET_ESPECIFICO_MEDICAMENTO where ID_NFE_DETALHE = ' + IntToStr(pId));

    IdRetornado := TT2TiORM.SelectMax('NFE_DECLARACAO_IMPORTACAO', 'ID_NFE_DETALHE= ' + IntToStr(pId));
    if IdRetornado <> -1 then
    begin
      Result := TT2TiORM.ComandoSQL('DELETE FROM NFE_IMPORTACAO_DETALHE where ID_NFE_DECLARACAO_IMPORTACAO = ' + IntToStr(IdRetornado));
      Result := TT2TiORM.ComandoSQL('DELETE FROM NFE_DECLARACAO_IMPORTACAO where ID_NFE_DETALHE = ' + IntToStr(pId));
    end;

    // Atualiza estoque
    NfeDetalhe := ConsultaObjetoDetalhe('ID=' + pId.ToString);
    NfeCabecalho := TT2TiORM.ConsultarUmObjeto<TNfeCabecalhoVO>('ID=' + NfeDetalhe.IdNfeCabecalho.ToString, False);

    if NfeCabecalho.TipoOperacao = 0 then
      TControleEstoqueController.AtualizarEstoque(NFeDetalhe.QuantidadeComercial * -1, NFeDetalhe.IdProduto, NfeCabecalho.EmpresaVO.Id, NfeCabecalho.EmpresaVO.TipoControleEstoque)
    else
      TControleEstoqueController.AtualizarEstoque(NFeDetalhe.QuantidadeComercial, NFeDetalhe.IdProduto, NfeCabecalho.EmpresaVO.Id, NfeCabecalho.EmpresaVO.TipoControleEstoque);

    Result := TT2TiORM.ComandoSQL('DELETE FROM NFE_DETALHE where ID = ' + IntToStr(pId));
    TratarRetorno(Result);
  finally
    FreeAndNil(NfeDetalhe);
    FreeAndNil(NfeCabecalho);
  end;
end;

class function TNfeCabecalhoController.GetDataSet: TClientDataSet;
begin
  Result := FDataSet;
end;

class procedure TNfeCabecalhoController.SetDataSet(pDataSet: TClientDataSet);
begin
  FDataSet := pDataSet;
end;

class procedure TNfeCabecalhoController.TratarListaRetorno(pListaObjetos: TObjectList<TVO>);
begin
  try
    TratarRetorno<TNfeCabecalhoVO>(TObjectList<TNfeCabecalhoVO>(pListaObjetos));
  finally
    FreeAndNil(pListaObjetos);
  end;
end;

initialization
  Classes.RegisterClass(TNfeCabecalhoController);

finalization
  Classes.UnRegisterClass(TNfeCabecalhoController);

end.
