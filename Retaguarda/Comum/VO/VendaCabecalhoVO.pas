{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [VENDA_CABECALHO] 
                                                                                
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
unit VendaCabecalhoVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils, DB,
  ViewPessoaTransportadoraVO, NotaFiscalTipoVO, ViewPessoaClienteVO, VendedorVO,
  VendaCondicoesPagamentoVO, VendaOrcamentoCabecalhoVO, VendaDetalheVO,
  VendaComissaoVO;

type
  [TEntity]
  [TTable('VENDA_CABECALHO')]
  TVendaCabecalhoVO = class(TVO)
  private
    FID: Integer;
    FID_VENDA_ROMANEIO_ENTREGA: Integer;
    FID_VENDA_ORCAMENTO_CABECALHO: Integer;
    FID_VENDA_CONDICOES_PAGAMENTO: Integer;
    FID_TRANSPORTADORA: Integer;
    FID_TIPO_NOTA_FISCAL: Integer;
    FID_CLIENTE: Integer;
    FID_VENDEDOR: Integer;
    FDATA_VENDA: TDateTime;
    FDATA_SAIDA: TDateTime;
    FHORA_SAIDA: String;
    FNUMERO_FATURA: Integer;
    FLOCAL_ENTREGA: String;
    FLOCAL_COBRANCA: String;
    FVALOR_SUBTOTAL: Extended;
    FTAXA_COMISSAO: Extended;
    FVALOR_COMISSAO: Extended;
    FTAXA_DESCONTO: Extended;
    FVALOR_DESCONTO: Extended;
    FVALOR_TOTAL: Extended;
    FTIPO_FRETE: String;
    FFORMA_PAGAMENTO: String;
    FVALOR_FRETE: Extended;
    FVALOR_SEGURO: Extended;
    FOBSERVACAO: String;
    FSITUACAO: String;

    //Transientes
    FTransportadoraNome: String;
    FTipoNotaFiscalModelo: String;
    FClienteNome: String;
    FVendedorNome: String;
    FVendaCondicoesPagamentoNome: String;
    FVendaOrcamentoCabecalhoCodigo: String;

    FTransportadoraVO: TViewPessoaTransportadoraVO;
    FTipoNotaFiscalVO: TNotaFiscalTipoVO;
    FClienteVO: TViewPessoaClienteVO;
    FVendedorVO: TVendedorVO;
    FVendaCondicoesPagamentoVO: TVendaCondicoesPagamentoVO;
    FVendaOrcamentoCabecalhoVO: TVendaOrcamentoCabecalhoVO;
    FVendaComissaoVO: TVendaComissaoVO;

    FListaVendaDetalheVO: TObjectList<TVendaDetalheVO>;


  public
    constructor Create; override;
    destructor Destroy; override;

    [TId('ID', [ldGrid, ldLookup, ldComboBox])]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;

    [TColumn('ID_VENDA_ROMANEIO_ENTREGA', 'Id Venda Romaneio Entrega', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdVendaRomaneioEntrega: Integer  read FID_VENDA_ROMANEIO_ENTREGA write FID_VENDA_ROMANEIO_ENTREGA;

    [TColumn('ID_VENDA_ORCAMENTO_CABECALHO', 'Id Venda Orcamento Cabecalho', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdVendaOrcamentoCabecalho: Integer  read FID_VENDA_ORCAMENTO_CABECALHO write FID_VENDA_ORCAMENTO_CABECALHO;
    [TColumnDisplay('ORCAMENTO_VENDA_CABECALHO.CODIGO', 'Código Orçamento', 300, [ldGrid, ldLookup, ldComboBox], ftString, 'VendaOrcamentoCabecalhoVO.TVendaOrcamentoCabecalhoVO', True)]
    property VendaOrcamentoCabecalhoCodigo: String read FVendaOrcamentoCabecalhoCodigo write FVendaOrcamentoCabecalhoCodigo;

    [TColumn('ID_VENDA_CONDICOES_PAGAMENTO', 'Id Venda Condicoes Pagamento', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdVendaCondicoesPagamento: Integer  read FID_VENDA_CONDICOES_PAGAMENTO write FID_VENDA_CONDICOES_PAGAMENTO;
    [TColumnDisplay('CONDICOESPAGAMENTO.NOME', 'Condições Pagamento', 100, [ldGrid, ldLookup, ldComboBox], ftString, 'VendaCondicoesPagamentoVO.TVendaCondicoesPagamentoVO', True)]
    property VendaCondicoesPagamentoNome: String read FVendaCondicoesPagamentoNome write FVendaCondicoesPagamentoNome;

    [TColumn('ID_TRANSPORTADORA', 'Id Transportadora', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdTransportadora: Integer  read FID_TRANSPORTADORA write FID_TRANSPORTADORA;
    [TColumnDisplay('TRANSPORTADORA.NOME', 'Transportadora Nome', 300, [ldGrid, ldLookup, ldComboBox], ftString, 'ViewPessoaTransportadoraVO.TViewPessoaTransportadoraVO', True)]
    property TransportadoraNome: String read FTransportadoraNome write FTransportadoraNome;

    [TColumn('ID_TIPO_NOTA_FISCAL', 'Id Tipo Nota Fiscal', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdTipoNotaFiscal: Integer  read FID_TIPO_NOTA_FISCAL write FID_TIPO_NOTA_FISCAL;
    [TColumnDisplay('NOTAFISCALTIPO.MODELO', 'Tipo Nota Fiscal', 90, [ldGrid, ldLookup, ldComboBox], ftString, 'NotaFiscalTipoVO.TNotaFiscalTipoVO', True)]
    property TipoNotaFiscalModelo: String read FTipoNotaFiscalModelo write FTipoNotaFiscalModelo;

    [TColumn('ID_CLIENTE', 'Id Cliente', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdCliente: Integer  read FID_CLIENTE write FID_CLIENTE;
    [TColumnDisplay('CLIENTE.NOME', 'Cliente Nome', 300, [ldGrid, ldLookup, ldComboBox], ftString, 'ViewPessoaClienteVO.TViewPessoaClienteVO', True)]
    property ClienteNome: String read FClienteNome write FClienteNome;

    [TColumn('ID_VENDEDOR', 'Id Vendedor', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdVendedor: Integer  read FID_VENDEDOR write FID_VENDEDOR;
    [TColumnDisplay('VENDEDOR.NOME', 'Vendedor Nome', 300, [ldGrid, ldLookup, ldComboBox], ftString, 'VendedorVO.TVendedorVO', True)]
    property VendedorNome: String read FVendedorNome write FVendedorNome;

    [TColumn('DATA_VENDA', 'Data Venda', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property DataVenda: TDateTime  read FDATA_VENDA write FDATA_VENDA;
    [TColumn('DATA_SAIDA', 'Data Saida', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property DataSaida: TDateTime  read FDATA_SAIDA write FDATA_SAIDA;
    [TColumn('HORA_SAIDA', 'Hora Saida', 64, [ldGrid, ldLookup, ldCombobox], False)]
    property HoraSaida: String  read FHORA_SAIDA write FHORA_SAIDA;
    [TColumn('NUMERO_FATURA', 'Numero Fatura', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property NumeroFatura: Integer  read FNUMERO_FATURA write FNUMERO_FATURA;
    [TColumn('LOCAL_ENTREGA', 'Local Entrega', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property LocalEntrega: String  read FLOCAL_ENTREGA write FLOCAL_ENTREGA;
    [TColumn('LOCAL_COBRANCA', 'Local Cobranca', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property LocalCobranca: String  read FLOCAL_COBRANCA write FLOCAL_COBRANCA;
    [TColumn('VALOR_SUBTOTAL', 'Valor Subtotal', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorSubtotal: Extended  read FVALOR_SUBTOTAL write FVALOR_SUBTOTAL;
    [TColumn('TAXA_COMISSAO', 'Taxa Comissao', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property TaxaComissao: Extended  read FTAXA_COMISSAO write FTAXA_COMISSAO;
    [TColumn('VALOR_COMISSAO', 'Valor Comissao', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorComissao: Extended  read FVALOR_COMISSAO write FVALOR_COMISSAO;
    [TColumn('TAXA_DESCONTO', 'Taxa Desconto', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property TaxaDesconto: Extended  read FTAXA_DESCONTO write FTAXA_DESCONTO;
    [TColumn('VALOR_DESCONTO', 'Valor Desconto', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorDesconto: Extended  read FVALOR_DESCONTO write FVALOR_DESCONTO;
    [TColumn('VALOR_TOTAL', 'Valor Total', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorTotal: Extended  read FVALOR_TOTAL write FVALOR_TOTAL;
    [TColumn('TIPO_FRETE', 'Tipo Frete', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property TipoFrete: String  read FTIPO_FRETE write FTIPO_FRETE;
    [TColumn('FORMA_PAGAMENTO', 'Forma Pagamento', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property FormaPagamento: String  read FFORMA_PAGAMENTO write FFORMA_PAGAMENTO;
    [TColumn('VALOR_FRETE', 'Valor Frete', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorFrete: Extended  read FVALOR_FRETE write FVALOR_FRETE;
    [TColumn('VALOR_SEGURO', 'Valor Seguro', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorSeguro: Extended  read FVALOR_SEGURO write FVALOR_SEGURO;
    [TColumn('OBSERVACAO', 'Observacao', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property Observacao: String  read FOBSERVACAO write FOBSERVACAO;
    [TColumn('SITUACAO', 'Situacao', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property Situacao: String  read FSITUACAO write FSITUACAO;


    //Transientes

    [TAssociation('ID', 'ID_TRANSPORTADORA')]
    property TransportadoraVO: TViewPessoaTransportadoraVO read FTransportadoraVO write FTransportadoraVO;

    [TAssociation('ID', 'ID_CLIENTE')]
    property ClienteVO: TViewPessoaClienteVO read FClienteVO write FClienteVO;

    [TAssociation('ID', 'ID_VENDEDOR')]
    property VendedorVO: TVendedorVO read FVendedorVO write FVendedorVO;

    [TAssociation('ID', 'ID_VENDA_CONDICOES_PAGAMENTO')]
    property VendaCondicoesPagamentoVO: TVendaCondicoesPagamentoVO read FVendaCondicoesPagamentoVO write FVendaCondicoesPagamentoVO;

    [TAssociation('ID', 'ID_TIPO_NOTA_FISCAL')]
    property TipoNotaFiscalVO: TNotaFiscalTipoVO read FTipoNotaFiscalVO write FTipoNotaFiscalVO;

    [TAssociation('ID', 'ID_VENDA_ORCAMENTO_CABECALHO')]
    property VendaOrcamentoCabecalhoVO: TVendaOrcamentoCabecalhoVO read FVendaOrcamentoCabecalhoVO write FVendaOrcamentoCabecalhoVO;

    [TAssociation('ID', 'ID_VENDA_CABECALHO')]
    property VendaComissaoVO: TVendaComissaoVO read FVendaComissaoVO write FVendaComissaoVO;

    [TManyValuedAssociation('ID_VENDA_CABECALHO', 'ID')]
    property ListaVendaDetalheVO: TObjectList<TVendaDetalheVO> read FListaVendaDetalheVO write FListaVendaDetalheVO;


  end;

implementation


constructor TVendaCabecalhoVO.Create;
begin
  inherited;

  FTransportadoraVO := TViewPessoaTransportadoraVO.Create;
  FTipoNotaFiscalVO := TNotaFiscalTipoVO.Create;
  FClienteVO := TViewPessoaClienteVO.Create;
  FVendedorVO := TVendedorVO.Create;
  FVendaCondicoesPagamentoVO := TVendaCondicoesPagamentoVO.Create;
  FVendaOrcamentoCabecalhoVO := TVendaOrcamentoCabecalhoVO.Create;
  FVendaComissaoVO := TVendaComissaoVO.Create;

  FListaVendaDetalheVO := TObjectList<TVendaDetalheVO>.Create;
end;

destructor TVendaCabecalhoVO.Destroy;
begin
  FreeAndNil(FTransportadoraVO);
  FreeAndNil(FTipoNotaFiscalVO);
  FreeAndNil(FClienteVO);
  FreeAndNil(FVendedorVO);
  FreeAndNil(FVendaCondicoesPagamentoVO);
  FreeAndNil(FVendaOrcamentoCabecalhoVO);
  FreeAndNil(FVendaComissaoVO);

  FreeAndNil(FListaVendaDetalheVO);

  inherited;
end;


initialization
  Classes.RegisterClass(TVendaCabecalhoVO);

finalization
  Classes.UnRegisterClass(TVendaCabecalhoVO);

end.
