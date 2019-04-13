{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [COMPRA_PEDIDO] 
                                                                                
The MIT License                                                                 
                                                                                
Copyright: Copyright (C) 2015 T2Ti.COM
                                                                                
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
unit CompraPedidoVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils, DB,
  ViewPessoaFornecedorVO, CompraTipoPedidoVO, CompraPedidoDetalheVO,
  CompraCotacaoPedidoDetalheVO;

type
  [TEntity]
  [TTable('COMPRA_PEDIDO')]
  TCompraPedidoVO = class(TVO)
  private
    FID: Integer;
    FID_COMPRA_TIPO_PEDIDO: Integer;
    FID_FORNECEDOR: Integer;
    FDATA_PEDIDO: TDateTime;
    FDATA_PREVISTA_ENTREGA: TDateTime;
    FDATA_PREVISAO_PAGAMENTO: TDateTime;
    FLOCAL_ENTREGA: String;
    FLOCAL_COBRANCA: String;
    FCONTATO: String;
    FVALOR_SUBTOTAL: Extended;
    FTAXA_DESCONTO: Extended;
    FVALOR_DESCONTO: Extended;
    FVALOR_TOTAL_PEDIDO: Extended;
    FTIPO_FRETE: String;
    FFORMA_PAGAMENTO: String;
    FBASE_CALCULO_ICMS: Extended;
    FVALOR_ICMS: Extended;
    FBASE_CALCULO_ICMS_ST: Extended;
    FVALOR_ICMS_ST: Extended;
    FVALOR_TOTAL_PRODUTOS: Extended;
    FVALOR_FRETE: Extended;
    FVALOR_SEGURO: Extended;
    FVALOR_OUTRAS_DESPESAS: Extended;
    FVALOR_IPI: Extended;
    FVALOR_TOTAL_NF: Extended;
    FQUANTIDADE_PARCELAS: Integer;
    FDIAS_PRIMEIRO_VENCIMENTO: Integer;
    FDIAS_INTERVALO: Integer;

    //Transientes
    FFornecedorNome: String;
    FCompraTipoPedidoNome: String;

    FFornecedorVO: TViewPessoaFornecedorVO;
    FCompraTipoPedidoVO: TCompraTipoPedidoVO;

    FListaCompraPedidoDetalheVO: TObjectList<TCompraPedidoDetalheVO>;
    FListaCompraCotacaoPedidoDetalheVO: TObjectList<TCompraCotacaoPedidoDetalheVO>;

  public
    constructor Create; override;
    destructor Destroy; override;

    [TId('ID', [ldGrid, ldLookup, ldComboBox])]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;

    [TColumn('ID_COMPRA_TIPO_PEDIDO', 'Id Compra Tipo Pedido', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdCompraTipoPedido: Integer  read FID_COMPRA_TIPO_PEDIDO write FID_COMPRA_TIPO_PEDIDO;
    [TColumnDisplay('COMPRA_TIPO_PEDIDO.NOME', 'Tipo Pedido', 250, [ldGrid, ldLookup, ldCombobox], ftString, 'CompraTipoPedidoVO.TCompraTipoPedidoVO', True)]
    property CompraTipoPedidoNome: String read FCompraTipoPedidoNome write FCompraTipoPedidoNome;

    [TColumn('ID_FORNECEDOR', 'Id Fornecedor', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdFornecedor: Integer  read FID_FORNECEDOR write FID_FORNECEDOR;
    [TColumnDisplay('FORNECEDOR.NOME', 'Nome Fornecedor', 150, [ldGrid, ldLookup], ftString, 'ViewPessoaFornecedorVO.TViewPessoaFornecedorVO', True)]
    property FornecedorNome: String read FFornecedorNome write FFornecedorNome;

    [TColumn('DATA_PEDIDO', 'Data Pedido', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property DataPedido: TDateTime  read FDATA_PEDIDO write FDATA_PEDIDO;
    [TColumn('DATA_PREVISTA_ENTREGA', 'Data Prevista Entrega', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property DataPrevistaEntrega: TDateTime  read FDATA_PREVISTA_ENTREGA write FDATA_PREVISTA_ENTREGA;
    [TColumn('DATA_PREVISAO_PAGAMENTO', 'Data Previsao Pagamento', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property DataPrevisaoPagamento: TDateTime  read FDATA_PREVISAO_PAGAMENTO write FDATA_PREVISAO_PAGAMENTO;
    [TColumn('LOCAL_ENTREGA', 'Local Entrega', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property LocalEntrega: String  read FLOCAL_ENTREGA write FLOCAL_ENTREGA;
    [TColumn('LOCAL_COBRANCA', 'Local Cobranca', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property LocalCobranca: String  read FLOCAL_COBRANCA write FLOCAL_COBRANCA;
    [TColumn('CONTATO', 'Contato', 240, [ldGrid, ldLookup, ldCombobox], False)]
    property Contato: String  read FCONTATO write FCONTATO;
    [TColumn('VALOR_SUBTOTAL', 'Valor Subtotal', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorSubtotal: Extended  read FVALOR_SUBTOTAL write FVALOR_SUBTOTAL;
    [TColumn('TAXA_DESCONTO', 'Taxa Desconto', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property TaxaDesconto: Extended  read FTAXA_DESCONTO write FTAXA_DESCONTO;
    [TColumn('VALOR_DESCONTO', 'Valor Desconto', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorDesconto: Extended  read FVALOR_DESCONTO write FVALOR_DESCONTO;
    [TColumn('VALOR_TOTAL_PEDIDO', 'Valor Total Pedido', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorTotalPedido: Extended  read FVALOR_TOTAL_PEDIDO write FVALOR_TOTAL_PEDIDO;
    [TColumn('TIPO_FRETE', 'Tipo Frete', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property TipoFrete: String  read FTIPO_FRETE write FTIPO_FRETE;
    [TColumn('FORMA_PAGAMENTO', 'Forma Pagamento', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property FormaPagamento: String  read FFORMA_PAGAMENTO write FFORMA_PAGAMENTO;
    [TColumn('BASE_CALCULO_ICMS', 'Base Calculo Icms', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property BaseCalculoIcms: Extended  read FBASE_CALCULO_ICMS write FBASE_CALCULO_ICMS;
    [TColumn('VALOR_ICMS', 'Valor Icms', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorIcms: Extended  read FVALOR_ICMS write FVALOR_ICMS;
    [TColumn('BASE_CALCULO_ICMS_ST', 'Base Calculo Icms St', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property BaseCalculoIcmsSt: Extended  read FBASE_CALCULO_ICMS_ST write FBASE_CALCULO_ICMS_ST;
    [TColumn('VALOR_ICMS_ST', 'Valor Icms St', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorIcmsSt: Extended  read FVALOR_ICMS_ST write FVALOR_ICMS_ST;
    [TColumn('VALOR_TOTAL_PRODUTOS', 'Valor Total Produtos', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorTotalProdutos: Extended  read FVALOR_TOTAL_PRODUTOS write FVALOR_TOTAL_PRODUTOS;
    [TColumn('VALOR_FRETE', 'Valor Frete', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorFrete: Extended  read FVALOR_FRETE write FVALOR_FRETE;
    [TColumn('VALOR_SEGURO', 'Valor Seguro', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorSeguro: Extended  read FVALOR_SEGURO write FVALOR_SEGURO;
    [TColumn('VALOR_OUTRAS_DESPESAS', 'Valor Outras Despesas', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorOutrasDespesas: Extended  read FVALOR_OUTRAS_DESPESAS write FVALOR_OUTRAS_DESPESAS;
    [TColumn('VALOR_IPI', 'Valor Ipi', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorIpi: Extended  read FVALOR_IPI write FVALOR_IPI;
    [TColumn('VALOR_TOTAL_NF', 'Valor Total Nf', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorTotalNf: Extended  read FVALOR_TOTAL_NF write FVALOR_TOTAL_NF;
    [TColumn('QUANTIDADE_PARCELAS', 'Quantidade Parcelas', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property QuantidadeParcelas: Integer  read FQUANTIDADE_PARCELAS write FQUANTIDADE_PARCELAS;
    [TColumn('DIAS_PRIMEIRO_VENCIMENTO', 'Dias Primeiro Vencimento', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property DiasPrimeiroVencimento: Integer  read FDIAS_PRIMEIRO_VENCIMENTO write FDIAS_PRIMEIRO_VENCIMENTO;
    [TColumn('DIAS_INTERVALO', 'Dias Intervalo', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property DiasIntervalo: Integer  read FDIAS_INTERVALO write FDIAS_INTERVALO;

    //Transientes
    [TAssociation('ID', 'ID_COMPRA_TIPO_PEDIDO')]
    property CompraTipoPedidoVO: TCompraTipoPedidoVO read FCompraTipoPedidoVO write FCompraTipoPedidoVO;

    [TAssociation('ID', 'ID_FORNECEDOR')]
    property FornecedorVO: TViewPessoaFornecedorVO read FFornecedorVO write FFornecedorVO;

    [TManyValuedAssociation('ID_COMPRA_PEDIDO', 'ID')]
    property ListaCompraPedidoDetalheVO: TObjectList<TCompraPedidoDetalheVO> read FListaCompraPedidoDetalheVO write FListaCompraPedidoDetalheVO;

    [TManyValuedAssociation('ID_COMPRA_PEDIDO', 'ID')]
    property ListaCompraCotacaoPedidoDetalheVO: TObjectList<TCompraCotacaoPedidoDetalheVO> read FListaCompraCotacaoPedidoDetalheVO write FListaCompraCotacaoPedidoDetalheVO;

  end;

implementation

constructor TCompraPedidoVO.Create;
begin
  inherited;

  FFornecedorVO := TViewPessoaFornecedorVO.Create;
  FCompraTipoPedidoVO := TCompraTipoPedidoVO.Create;

  FListaCompraPedidoDetalheVO := TObjectList<TCompraPedidoDetalheVO>.Create;
  FListaCompraCotacaoPedidoDetalheVO := TObjectList<TCompraCotacaoPedidoDetalheVO>.Create;
end;

destructor TCompraPedidoVO.Destroy;
begin
  FreeAndNil(FFornecedorVO);
  FreeAndNil(FCompraTipoPedidoVO);

  FreeAndNil(FListaCompraPedidoDetalheVO);
  FreeAndNil(FListaCompraCotacaoPedidoDetalheVO);

  inherited;
end;

initialization
  Classes.RegisterClass(TCompraPedidoVO);

finalization
  Classes.UnRegisterClass(TCompraPedidoVO);

end.
