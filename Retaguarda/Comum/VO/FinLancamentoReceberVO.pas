{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [FIN_LANCAMENTO_RECEBER] 
                                                                                
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
unit FinLancamentoReceberVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils, DB,
  ViewPessoaClienteVO, FinParcelaReceberVO, FinDocumentoOrigemVO,
  FinLctoReceberNtFinanceiraVO;

type
  [TEntity]
  [TTable('FIN_LANCAMENTO_RECEBER')]
  TFinLancamentoReceberVO = class(TVO)
  private
    FMesclarRecebimento: String;

    FID: Integer;
    FID_FIN_DOCUMENTO_ORIGEM: Integer;
    FID_CLIENTE: Integer;
    FQUANTIDADE_PARCELA: Integer;
    FVALOR_TOTAL: Extended;
    FVALOR_DESCONTO_CONVENIO: Extended;
    FVALOR_A_RECEBER: Extended;
    FDATA_LANCAMENTO: TDateTime;
    FNUMERO_DOCUMENTO: String;
    FPRIMEIRO_VENCIMENTO: TDateTime;
    FTAXA_COMISSAO: Extended;
    FVALOR_COMISSAO: Extended;
    FINTERVALO_ENTRE_PARCELAS: Integer;
    FCODIGO_MODULO_LCTO: String;
    FMESCLADO_PARA: Integer;

    //Transientes
    FClienteNome: String;
    FDocumentoOrigemSigla: String;

    FClienteVO: TViewPessoaClienteVO;
    FDocumentoOrigemVO: TFinDocumentoOrigemVO;

    FListaParcelaReceberVO: TObjectList<TFinParcelaReceberVO>;
    FListaLancReceberNatFinanceiraVO: TObjectList<TFinLctoReceberNtFinanceiraVO>;

  public
    constructor Create; override;
    destructor Destroy; override;

    [TColumn('CheckBox',' ',16,[ldGrid], True)]
    [TColumn('MesclarRecebimento','Mesclar',16,[], True)]
    property MesclarRecebimento: String  read FMesclarRecebimento write FMesclarRecebimento;

    [TId('ID', [ldGrid, ldLookup, ldComboBox])]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;

    [TColumn('ID_FIN_DOCUMENTO_ORIGEM', 'Id Fin Documento Origem', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdFinDocumentoOrigem: Integer  read FID_FIN_DOCUMENTO_ORIGEM write FID_FIN_DOCUMENTO_ORIGEM;
    [TColumnDisplay('FIN_DOCUMENTO_ORIGEM.SIGLA_DOCUMENTO', 'Sigla Documento', 60, [ldGrid, ldLookup], ftString, 'FinDocumentoOrigemVO.TFinDocumentoOrigemVO', True)]
    property DocumentoOrigemSigla: String read FDocumentoOrigemSigla write FDocumentoOrigemSigla;

    [TColumn('ID_CLIENTE', 'Id Cliente', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdCliente: Integer  read FID_CLIENTE write FID_CLIENTE;
    [TColumnDisplay('CLIENTE.NOME', 'Nome Cliente', 150, [ldGrid, ldLookup], ftString, 'ViewPessoaClienteVO.TViewPessoaClienteVO', True)]
    property ClienteNome: String read FClienteNome write FClienteNome;

    [TColumn('QUANTIDADE_PARCELA', 'Quantidade Parcela', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property QuantidadeParcela: Integer  read FQUANTIDADE_PARCELA write FQUANTIDADE_PARCELA;
    [TColumn('VALOR_TOTAL', 'Valor Total', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorTotal: Extended  read FVALOR_TOTAL write FVALOR_TOTAL;
    [TColumn('VALOR_DESCONTO_CONVENIO', 'Valor Desconto Convenio', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorDescontoConvenio: Extended  read FVALOR_DESCONTO_CONVENIO write FVALOR_DESCONTO_CONVENIO;
    [TColumn('VALOR_A_RECEBER', 'Valor A Receber', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorAReceber: Extended  read FVALOR_A_RECEBER write FVALOR_A_RECEBER;
    [TColumn('DATA_LANCAMENTO', 'Data Lancamento', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property DataLancamento: TDateTime  read FDATA_LANCAMENTO write FDATA_LANCAMENTO;
    [TColumn('NUMERO_DOCUMENTO', 'Numero Documento', 400, [ldGrid, ldLookup, ldCombobox], False)]
    property NumeroDocumento: String  read FNUMERO_DOCUMENTO write FNUMERO_DOCUMENTO;
    [TColumn('PRIMEIRO_VENCIMENTO', 'Primeiro Vencimento', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property PrimeiroVencimento: TDateTime  read FPRIMEIRO_VENCIMENTO write FPRIMEIRO_VENCIMENTO;
    [TColumn('TAXA_COMISSAO', 'Taxa Comissao', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property TaxaComissao: Extended  read FTAXA_COMISSAO write FTAXA_COMISSAO;
    [TColumn('VALOR_COMISSAO', 'Valor Comissao', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorComissao: Extended  read FVALOR_COMISSAO write FVALOR_COMISSAO;
    [TColumn('INTERVALO_ENTRE_PARCELAS', 'Intervalo Entre Parcelas', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IntervaloEntreParcelas: Integer  read FINTERVALO_ENTRE_PARCELAS write FINTERVALO_ENTRE_PARCELAS;
    [TColumn('CODIGO_MODULO_LCTO', 'Codigo Modulo Lcto', 24, [ldGrid, ldLookup, ldCombobox], False)]
    property CodigoModuloLcto: String  read FCODIGO_MODULO_LCTO write FCODIGO_MODULO_LCTO;
    [TColumn('MESCLADO_PARA', 'Mesclado Para', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property MescladoPara: Integer  read FMESCLADO_PARA write FMESCLADO_PARA;

    //Transientes
    [TAssociation('ID', 'ID_CLIENTE')]
    property ClienteVO: TViewPessoaClienteVO read FClienteVO write FClienteVO;

    [TAssociation('ID', 'ID_FIN_DOCUMENTO_ORIGEM')]
    property DocumentoOrigemVO: TFinDocumentoOrigemVO read FDocumentoOrigemVO write FDocumentoOrigemVO;

    [TManyValuedAssociation('ID_FIN_LANCAMENTO_RECEBER', 'ID')]
    property ListaParcelaReceberVO: TObjectList<TFinParcelaReceberVO> read FListaParcelaReceberVO write FListaParcelaReceberVO;

    [TManyValuedAssociation('ID_FIN_LANCAMENTO_RECEBER', 'ID')]
    property ListaLancReceberNatFinanceiraVO: TObjectList<TFinLctoReceberNtFinanceiraVO> read FListaLancReceberNatFinanceiraVO write FListaLancReceberNatFinanceiraVO;

  end;

implementation

constructor TFinLancamentoReceberVO.Create;
begin
  inherited;

  FDocumentoOrigemVO := TFinDocumentoOrigemVO.Create;
  FClienteVO := TViewPessoaClienteVO.Create;

  FListaParcelaReceberVO := TObjectList<TFinParcelaReceberVO>.Create;
  FListaLancReceberNatFinanceiraVO := TObjectList<TFinLctoReceberNtFinanceiraVO>.Create;
end;

destructor TFinLancamentoReceberVO.Destroy;
begin
  FreeAndNil(FClienteVO);
  FreeAndNil(FDocumentoOrigemVO);

  FreeAndNil(FListaParcelaReceberVO);
  FreeAndNil(FListaLancReceberNatFinanceiraVO);

  inherited;
end;

initialization
  Classes.RegisterClass(TFinLancamentoReceberVO);

finalization
  Classes.UnRegisterClass(TFinLancamentoReceberVO);

end.
