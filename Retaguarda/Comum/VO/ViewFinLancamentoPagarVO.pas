{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [VIEW_FIN_LANCAMENTO_PAGAR] 
                                                                                
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
unit ViewFinLancamentoPagarVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils;

type
  [TEntity]
  [TTable('VIEW_FIN_LANCAMENTO_PAGAR')]
  TViewFinLancamentoPagarVO = class(TVO)
  private
    FEmitirCheque: String;
    FID: String;
    FID_LANCAMENTO_PAGAR: Integer;
    FQUANTIDADE_PARCELA: Integer;
    FVALOR_LANCAMENTO: Extended;
    FDATA_LANCAMENTO: TDateTime;
    FNUMERO_DOCUMENTO: String;
    FID_PARCELA_PAGAR: Integer;
    FNUMERO_PARCELA: Integer;
    FDATA_VENCIMENTO: TDateTime;
    FVALOR_PARCELA: Extended;
    FTAXA_JURO: Extended;
    FVALOR_JURO: Extended;
    FTAXA_MULTA: Extended;
    FVALOR_MULTA: Extended;
    FTAXA_DESCONTO: Extended;
    FVALOR_DESCONTO: Extended;
    FSIGLA_DOCUMENTO: String;
    FNOME_FORNECEDOR: String;
    FID_STATUS_PARCELA: Integer;
    FSITUACAO_PARCELA: String;
    FDESCRICAO_SITUACAO_PARCELA: String;
    FID_CONTA_CAIXA: Integer;
    FNOME_CONTA_CAIXA: String;
    FFORNECEDOR_SOFRE_RETENCAO: String;

    //Transientes



  public
    [TColumn('CheckBox',' ',16,[ldGrid], True)]
    [TColumn('EmitirCheque','Emitir',16,[], True)]
    property EmitirCheque: String  read FEmitirCheque write FEmitirCheque;

    [TId('ID', [ldGrid, ldLookup, ldComboBox])]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: String  read FID write FID;
    [TColumn('ID_LANCAMENTO_PAGAR', 'Id Lancamento Pagar', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdLancamentoPagar: Integer  read FID_LANCAMENTO_PAGAR write FID_LANCAMENTO_PAGAR;
    [TColumn('QUANTIDADE_PARCELA', 'Quantidade Parcela', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property QuantidadeParcela: Integer  read FQUANTIDADE_PARCELA write FQUANTIDADE_PARCELA;
    [TColumn('VALOR_LANCAMENTO', 'Valor Lancamento', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorLancamento: Extended  read FVALOR_LANCAMENTO write FVALOR_LANCAMENTO;
    [TColumn('DATA_LANCAMENTO', 'Data Lancamento', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property DataLancamento: TDateTime  read FDATA_LANCAMENTO write FDATA_LANCAMENTO;
    [TColumn('NUMERO_DOCUMENTO', 'Numero Documento', 400, [ldGrid, ldLookup, ldCombobox], False)]
    property NumeroDocumento: String  read FNUMERO_DOCUMENTO write FNUMERO_DOCUMENTO;
    [TColumn('ID_PARCELA_PAGAR', 'Id Parcela Pagar', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdParcelaPagar: Integer  read FID_PARCELA_PAGAR write FID_PARCELA_PAGAR;
    [TColumn('NUMERO_PARCELA', 'Numero Parcela', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property NumeroParcela: Integer  read FNUMERO_PARCELA write FNUMERO_PARCELA;
    [TColumn('DATA_VENCIMENTO', 'Data Vencimento', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property DataVencimento: TDateTime  read FDATA_VENCIMENTO write FDATA_VENCIMENTO;
    [TColumn('VALOR_PARCELA', 'Valor Parcela', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorParcela: Extended  read FVALOR_PARCELA write FVALOR_PARCELA;
    [TColumn('TAXA_JURO', 'Taxa Juro', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property TaxaJuro: Extended  read FTAXA_JURO write FTAXA_JURO;
    [TColumn('VALOR_JURO', 'Valor Juro', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorJuro: Extended  read FVALOR_JURO write FVALOR_JURO;
    [TColumn('TAXA_MULTA', 'Taxa Multa', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property TaxaMulta: Extended  read FTAXA_MULTA write FTAXA_MULTA;
    [TColumn('VALOR_MULTA', 'Valor Multa', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorMulta: Extended  read FVALOR_MULTA write FVALOR_MULTA;
    [TColumn('TAXA_DESCONTO', 'Taxa Desconto', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property TaxaDesconto: Extended  read FTAXA_DESCONTO write FTAXA_DESCONTO;
    [TColumn('VALOR_DESCONTO', 'Valor Desconto', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorDesconto: Extended  read FVALOR_DESCONTO write FVALOR_DESCONTO;
    [TColumn('SIGLA_DOCUMENTO', 'Sigla Documento', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property SiglaDocumento: String  read FSIGLA_DOCUMENTO write FSIGLA_DOCUMENTO;
    [TColumn('NOME_FORNECEDOR', 'Nome Fornecedor', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property NomeFornecedor: String  read FNOME_FORNECEDOR write FNOME_FORNECEDOR;
    [TColumn('ID_STATUS_PARCELA', 'Id Status Parcela', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdStatusParcela: Integer  read FID_STATUS_PARCELA write FID_STATUS_PARCELA;
    [TColumn('SITUACAO_PARCELA', 'Situacao Parcela', 16, [ldGrid, ldLookup, ldCombobox], False)]
    property SituacaoParcela: String  read FSITUACAO_PARCELA write FSITUACAO_PARCELA;
    [TColumn('DESCRICAO_SITUACAO_PARCELA', 'Descricao Situacao Parcela', 240, [ldGrid, ldLookup, ldCombobox], False)]
    property DescricaoSituacaoParcela: String  read FDESCRICAO_SITUACAO_PARCELA write FDESCRICAO_SITUACAO_PARCELA;
    [TColumn('ID_CONTA_CAIXA', 'Id Conta Caixa', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdContaCaixa: Integer  read FID_CONTA_CAIXA write FID_CONTA_CAIXA;
    [TColumn('NOME_CONTA_CAIXA', 'Nome Conta Caixa', 400, [ldGrid, ldLookup, ldCombobox], False)]
    property NomeContaCaixa: String  read FNOME_CONTA_CAIXA write FNOME_CONTA_CAIXA;
    [TColumn('FORNECEDOR_SOFRE_RETENCAO', 'Fornecedor Sofre Retencao', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property FornecedorSofreRetencao: String  read FFORNECEDOR_SOFRE_RETENCAO write FFORNECEDOR_SOFRE_RETENCAO;


    //Transientes



  end;

implementation


initialization
  Classes.RegisterClass(TViewFinLancamentoPagarVO);

finalization
  Classes.UnRegisterClass(TViewFinLancamentoPagarVO);

end.
