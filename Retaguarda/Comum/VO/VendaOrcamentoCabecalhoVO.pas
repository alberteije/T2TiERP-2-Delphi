{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [VENDA_ORCAMENTO_CABECALHO] 
                                                                                
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
unit VendaOrcamentoCabecalhoVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils, DB,
  VendedorVO, ViewPessoaTransportadoraVO, ViewPessoaClienteVO, VendaCondicoesPagamentoVO,
  VendaOrcamentoDetalheVO;

type
  [TEntity]
  [TTable('VENDA_ORCAMENTO_CABECALHO')]
  TVendaOrcamentoCabecalhoVO = class(TVO)
  private
    FID: Integer;
    FID_VENDA_CONDICOES_PAGAMENTO: Integer;
    FID_VENDEDOR: Integer;
    FID_TRANSPORTADORA: Integer;
    FID_CLIENTE: Integer;
    FTIPO: String;
    FCODIGO: String;
    FDATA_CADASTRO: TDateTime;
    FDATA_ENTREGA: TDateTime;
    FVALIDADE: TDateTime;
    FTIPO_FRETE: String;
    FVALOR_SUBTOTAL: Extended;
    FVALOR_FRETE: Extended;
    FTAXA_COMISSAO: Extended;
    FVALOR_COMISSAO: Extended;
    FTAXA_DESCONTO: Extended;
    FVALOR_DESCONTO: Extended;
    FVALOR_TOTAL: Extended;
    FOBSERVACAO: String;
    FSITUACAO: String;

    //Transientes
    FVendedorNome: String;
    FTransportadoraNome: String;
    FClienteNome: String;
    FVendaCondicoesPagamentoNome: String;

    FVendedorVO: TVendedorVO;
    FTransportadoraVO: TViewPessoaTransportadoraVO;
    FClienteVO: TViewPessoaClienteVO;
    FVendaCondicoesPagamentoVO: TVendaCondicoesPagamentoVO;

    FListaVendaOrcamentoDetalheVO: TObjectList<TVendaOrcamentoDetalheVO>;


  public
    constructor Create; override;
    destructor Destroy; override;

    [TId('ID', [ldGrid, ldLookup, ldComboBox])]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;

    [TColumn('ID_VENDA_CONDICOES_PAGAMENTO', 'Id Venda Condicoes Pagamento', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdVendaCondicoesPagamento: Integer  read FID_VENDA_CONDICOES_PAGAMENTO write FID_VENDA_CONDICOES_PAGAMENTO;
    [TColumnDisplay('CONDICOESPAGAMENTO.NOME', 'Condições Pagamento', 100, [ldGrid, ldLookup, ldComboBox], ftString, 'VendaCondicoesPagamentoVO.TVendaCondicoesPagamentoVO', True)]
    property VendaCondicoesPagamentoNome: String read FVendaCondicoesPagamentoNome write FVendaCondicoesPagamentoNome;

    [TColumn('ID_VENDEDOR', 'Id Vendedor', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdVendedor: Integer  read FID_VENDEDOR write FID_VENDEDOR;
    [TColumnDisplay('VENDEDOR.NOME', 'Vendedor Nome', 300, [ldGrid, ldLookup, ldComboBox], ftString, 'VendedorVO.TVendedorVO', True)]
    property VendedorNome: String read FVendedorNome write FVendedorNome;

    [TColumn('ID_TRANSPORTADORA', 'Id Transportadora', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdTransportadora: Integer  read FID_TRANSPORTADORA write FID_TRANSPORTADORA;
    [TColumnDisplay('TRANSPORTADORA.NOME', 'Transportadora Nome', 300, [ldGrid, ldLookup, ldComboBox], ftString, 'ViewPessoaTransportadoraVO.TViewPessoaTransportadoraVO', True)]
    property TransportadoraNome: String read FTransportadoraNome write FTransportadoraNome;

    [TColumn('ID_CLIENTE', 'Id Cliente', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdCliente: Integer  read FID_CLIENTE write FID_CLIENTE;
    [TColumnDisplay('CLIENTE.NOME', 'Cliente Nome', 300, [ldGrid, ldLookup, ldComboBox], ftString, 'ViewPessoaClienteVO.TViewPessoaClienteVO', True)]
    property ClienteNome: String read FClienteNome write FClienteNome;

    [TColumn('TIPO', 'Tipo', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property Tipo: String  read FTIPO write FTIPO;
    [TColumn('CODIGO', 'Codigo', 160, [ldGrid, ldLookup, ldCombobox], False)]
    property Codigo: String  read FCODIGO write FCODIGO;
    [TColumn('DATA_CADASTRO', 'Data Cadastro', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property DataCadastro: TDateTime  read FDATA_CADASTRO write FDATA_CADASTRO;
    [TColumn('DATA_ENTREGA', 'Data Entrega', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property DataEntrega: TDateTime  read FDATA_ENTREGA write FDATA_ENTREGA;
    [TColumn('VALIDADE', 'Validade', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property Validade: TDateTime  read FVALIDADE write FVALIDADE;
    [TColumn('TIPO_FRETE', 'Tipo Frete', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property TipoFrete: String  read FTIPO_FRETE write FTIPO_FRETE;
    [TColumn('VALOR_SUBTOTAL', 'Valor Subtotal', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorSubtotal: Extended  read FVALOR_SUBTOTAL write FVALOR_SUBTOTAL;
    [TColumn('VALOR_FRETE', 'Valor Frete', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorFrete: Extended  read FVALOR_FRETE write FVALOR_FRETE;
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

    [TManyValuedAssociation('ID_VENDA_ORCAMENTO_CABECALHO', 'ID')]
    property ListaVendaOrcamentoDetalheVO: TObjectList<TVendaOrcamentoDetalheVO> read FListaVendaOrcamentoDetalheVO write FListaVendaOrcamentoDetalheVO;


  end;

implementation


constructor TVendaOrcamentoCabecalhoVO.Create;
begin
  inherited;

  FTransportadoraVO := TViewPessoaTransportadoraVO.Create;
  FClienteVO := TViewPessoaClienteVO.Create;
  FVendedorVO := TVendedorVO.Create;
  FVendaCondicoesPagamentoVO := TVendaCondicoesPagamentoVO.Create;

  FListaVendaOrcamentoDetalheVO := TObjectList<TVendaOrcamentoDetalheVO>.Create;
end;

destructor TVendaOrcamentoCabecalhoVO.Destroy;
begin
  FreeAndNil(FTransportadoraVO);
  FreeAndNil(FClienteVO);
  FreeAndNil(FVendedorVO);
  FreeAndNil(FVendaCondicoesPagamentoVO);

  FreeAndNil(FListaVendaOrcamentoDetalheVO);

  inherited;
end;


initialization
  Classes.RegisterClass(TVendaOrcamentoCabecalhoVO);

finalization
  Classes.UnRegisterClass(TVendaOrcamentoCabecalhoVO);

end.
