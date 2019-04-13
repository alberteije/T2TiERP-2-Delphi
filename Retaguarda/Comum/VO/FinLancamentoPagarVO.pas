{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [FIN_LANCAMENTO_PAGAR] 
                                                                                
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
unit FinLancamentoPagarVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils, DB,
  ViewPessoaFornecedorVO, FinParcelaPagarVO, FinDocumentoOrigemVO,
  FinLctoPagarNtFinanceiraVO;

type
  [TEntity]
  [TTable('FIN_LANCAMENTO_PAGAR')]
  TFinLancamentoPagarVO = class(TVO)
  private
    FMesclarPagamento: String;

    FID: Integer;
    FID_FIN_DOCUMENTO_ORIGEM: Integer;
    FID_FORNECEDOR: Integer;
    FPAGAMENTO_COMPARTILHADO: String;
    FQUANTIDADE_PARCELA: Integer;
    FVALOR_TOTAL: Extended;
    FVALOR_A_PAGAR: Extended;
    FDATA_LANCAMENTO: TDateTime;
    FNUMERO_DOCUMENTO: String;
    FIMAGEM_DOCUMENTO: String;
    FPRIMEIRO_VENCIMENTO: TDateTime;
    FCODIGO_MODULO_LCTO: String;
    FINTERVALO_ENTRE_PARCELAS: Integer;
    FMESCLADO_PARA: Integer;

    //Transientes
    FFornecedorNome: String;
    FDocumentoOrigemSigla: String;

    FFornecedorVO: TViewPessoaFornecedorVO;
    FDocumentoOrigemVO: TFinDocumentoOrigemVO;

    FListaParcelaPagarVO: TObjectList<TFinParcelaPagarVO>;
    FListaLancPagarNatFinanceiraVO: TObjectList<TFinLctoPagarNtFinanceiraVO>;

  public
    constructor Create; override;
    destructor Destroy; override;

    [TColumn('CheckBox',' ',16,[ldGrid], True)]
    [TColumn('MesclarPagamento','Mesclar',16,[], True)]
    property MesclarPagamento: String  read FMesclarPagamento write FMesclarPagamento;

    [TId('ID', [ldGrid, ldLookup, ldComboBox])]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;

    [TColumn('ID_FIN_DOCUMENTO_ORIGEM', 'Id Fin Documento Origem', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdFinDocumentoOrigem: Integer  read FID_FIN_DOCUMENTO_ORIGEM write FID_FIN_DOCUMENTO_ORIGEM;
    [TColumnDisplay('FIN_DOCUMENTO_ORIGEM.SIGLA_DOCUMENTO', 'Sigla Documento', 60, [ldGrid, ldLookup], ftString, 'FinDocumentoOrigemVO.TFinDocumentoOrigemVO', True)]
    property DocumentoOrigemSigla: String read FDocumentoOrigemSigla write FDocumentoOrigemSigla;

    [TColumn('ID_FORNECEDOR', 'Id Fornecedor', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdFornecedor: Integer  read FID_FORNECEDOR write FID_FORNECEDOR;
    [TColumnDisplay('FORNECEDOR.NOME', 'Nome Fornecedor', 150, [ldGrid, ldLookup], ftString, 'ViewPessoaFornecedorVO.TViewPessoaFornecedorVO', True)]
    property FornecedorNome: String read FFornecedorNome write FFornecedorNome;

    [TColumn('PAGAMENTO_COMPARTILHADO', 'Pagamento Compartilhado', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property PagamentoCompartilhado: String  read FPAGAMENTO_COMPARTILHADO write FPAGAMENTO_COMPARTILHADO;
    [TColumn('QUANTIDADE_PARCELA', 'Quantidade Parcela', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property QuantidadeParcela: Integer  read FQUANTIDADE_PARCELA write FQUANTIDADE_PARCELA;
    [TColumn('VALOR_TOTAL', 'Valor Total', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorTotal: Extended  read FVALOR_TOTAL write FVALOR_TOTAL;
    [TColumn('VALOR_A_PAGAR', 'Valor A Pagar', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorAPagar: Extended  read FVALOR_A_PAGAR write FVALOR_A_PAGAR;
    [TColumn('DATA_LANCAMENTO', 'Data Lancamento', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property DataLancamento: TDateTime  read FDATA_LANCAMENTO write FDATA_LANCAMENTO;
    [TColumn('NUMERO_DOCUMENTO', 'Numero Documento', 400, [ldGrid, ldLookup, ldCombobox], False)]
    property NumeroDocumento: String  read FNUMERO_DOCUMENTO write FNUMERO_DOCUMENTO;
    [TColumn('IMAGEM_DOCUMENTO', 'Imagem Documento', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property ImagemDocumento: String  read FIMAGEM_DOCUMENTO write FIMAGEM_DOCUMENTO;
    [TColumn('PRIMEIRO_VENCIMENTO', 'Primeiro Vencimento', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property PrimeiroVencimento: TDateTime  read FPRIMEIRO_VENCIMENTO write FPRIMEIRO_VENCIMENTO;
    [TColumn('CODIGO_MODULO_LCTO', 'Codigo Modulo Lcto', 24, [ldGrid, ldLookup, ldCombobox], False)]
    property CodigoModuloLcto: String  read FCODIGO_MODULO_LCTO write FCODIGO_MODULO_LCTO;
    [TColumn('INTERVALO_ENTRE_PARCELAS', 'Intervalo Entre Parcelas', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IntervaloEntreParcelas: Integer  read FINTERVALO_ENTRE_PARCELAS write FINTERVALO_ENTRE_PARCELAS;
    [TColumn('MESCLADO_PARA', 'Mesclado Para', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property MescladoPara: Integer  read FMESCLADO_PARA write FMESCLADO_PARA;

    //Transientes
    [TAssociation('ID', 'ID_FORNECEDOR')]
    property FornecedorVO: TViewPessoaFornecedorVO read FFornecedorVO write FFornecedorVO;

    [TAssociation('ID', 'ID_FIN_DOCUMENTO_ORIGEM')]
    property DocumentoOrigemVO: TFinDocumentoOrigemVO read FDocumentoOrigemVO write FDocumentoOrigemVO;

    [TManyValuedAssociation('ID_FIN_LANCAMENTO_PAGAR', 'ID')]
    property ListaParcelaPagarVO: TObjectList<TFinParcelaPagarVO> read FListaParcelaPagarVO write FListaParcelaPagarVO;

    [TManyValuedAssociation('ID_FIN_LANCAMENTO_PAGAR', 'ID')]
    property ListaLancPagarNatFinanceiraVO: TObjectList<TFinLctoPagarNtFinanceiraVO> read FListaLancPagarNatFinanceiraVO write FListaLancPagarNatFinanceiraVO;


  end;

implementation

constructor TFinLancamentoPagarVO.Create;
begin
  inherited;

  FDocumentoOrigemVO := TFinDocumentoOrigemVO.Create;
  FFornecedorVO := TViewPessoaFornecedorVO.Create;

  FListaParcelaPagarVO := TObjectList<TFinParcelaPagarVO>.Create;
  FListaLancPagarNatFinanceiraVO := TObjectList<TFinLctoPagarNtFinanceiraVO>.Create;
end;

destructor TFinLancamentoPagarVO.Destroy;
begin
  FreeAndNil(FFornecedorVO);
  FreeAndNil(FDocumentoOrigemVO);

  FreeAndNil(FListaParcelaPagarVO);
  FreeAndNil(FListaLancPagarNatFinanceiraVO);

  inherited;
end;


initialization
  Classes.RegisterClass(TFinLancamentoPagarVO);

finalization
  Classes.UnRegisterClass(TFinLancamentoPagarVO);

end.
