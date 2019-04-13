{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [COMPRA_FORNECEDOR_COTACAO] 
                                                                                
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
unit CompraFornecedorCotacaoVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils, DB,
  ViewPessoaFornecedorVO, CompraCotacaoDetalheVO;

type
  [TEntity]
  [TTable('COMPRA_FORNECEDOR_COTACAO')]
  TCompraFornecedorCotacaoVO = class(TVO)
  private
    FID: Integer;
    FID_COMPRA_COTACAO: Integer;
    FID_FORNECEDOR: Integer;
    FPRAZO_ENTREGA: String;
    FCONDICOES_PAGAMENTO: String;
    FVALOR_SUBTOTAL: Extended;
    FTAXA_DESCONTO: Extended;
    FVALOR_DESCONTO: Extended;
    FTOTAL: Extended;

    //Transientes
    FFornecedorNome: String;

    FFornecedorVO: TViewPessoaFornecedorVO;

    FListaCompraCotacaoDetalhe: TObjectList<TCompraCotacaoDetalheVO>;

  public 
    constructor Create; override;
    destructor Destroy; override;

    [TId('ID')]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;
    [TColumn('ID_COMPRA_COTACAO', 'Id Compra Cotacao', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdCompraCotacao: Integer  read FID_COMPRA_COTACAO write FID_COMPRA_COTACAO;

    [TColumn('ID_FORNECEDOR', 'Id Fornecedor', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdFornecedor: Integer  read FID_FORNECEDOR write FID_FORNECEDOR;
    [TColumnDisplay('FORNECEDOR.NOME', 'Nome Fornecedor', 150, [ldGrid, ldLookup], ftString, 'ViewPessoaFornecedorVO.TViewPessoaFornecedorVO', True)]
    property FornecedorNome: String read FFornecedorNome write FFornecedorNome;

    [TColumn('PRAZO_ENTREGA', 'Prazo Entrega', 240, [ldGrid, ldLookup, ldCombobox], False)]
    property PrazoEntrega: String  read FPRAZO_ENTREGA write FPRAZO_ENTREGA;
    [TColumn('CONDICOES_PAGAMENTO', 'Condicoes Pagamento', 240, [ldGrid, ldLookup, ldCombobox], False)]
    property CondicoesPagamento: String  read FCONDICOES_PAGAMENTO write FCONDICOES_PAGAMENTO;
    [TColumn('VALOR_SUBTOTAL', 'Valor Subtotal', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorSubtotal: Extended  read FVALOR_SUBTOTAL write FVALOR_SUBTOTAL;
    [TColumn('TAXA_DESCONTO', 'Taxa Desconto', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property TaxaDesconto: Extended  read FTAXA_DESCONTO write FTAXA_DESCONTO;
    [TColumn('VALOR_DESCONTO', 'Valor Desconto', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorDesconto: Extended  read FVALOR_DESCONTO write FVALOR_DESCONTO;
    [TColumn('TOTAL', 'Total', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property Total: Extended  read FTOTAL write FTOTAL;

    //Transientes
    [TAssociation('ID', 'ID_FORNECEDOR')]
    property FornecedorVO: TViewPessoaFornecedorVO read FFornecedorVO write FFornecedorVO;

    [TManyValuedAssociation('ID_COMPRA_FORNECEDOR_COTACAO', 'ID')]
    property ListaCompraCotacaoDetalhe: TObjectList<TCompraCotacaoDetalheVO> read FListaCompraCotacaoDetalhe write FListaCompraCotacaoDetalhe;

  end;

implementation

constructor TCompraFornecedorCotacaoVO.Create;
begin
  inherited;

  FFornecedorVO := TViewPessoaFornecedorVO.Create;

  FListaCompraCotacaoDetalhe := TObjectList<TCompraCotacaoDetalheVO>.Create;
end;

destructor TCompraFornecedorCotacaoVO.Destroy;
begin
  FreeAndNil(FFornecedorVO);

  FreeAndNil(FListaCompraCotacaoDetalhe);

  inherited;
end;


initialization
  Classes.RegisterClass(TCompraFornecedorCotacaoVO);

finalization
  Classes.UnRegisterClass(TCompraFornecedorCotacaoVO);

end.
