{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [PRE_VENDA_CABECALHO] 
                                                                                
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
unit PreVendaCabecalhoVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils,
  PreVendaDetalheVO;

type
  [TEntity]
  [TTable('PRE_VENDA_CABECALHO')]
  TPreVendaCabecalhoVO = class(TVO)
  private
    FID: Integer;
    FID_EMPRESA: Integer;
    FID_PESSOA: Integer;
    FDATA_EMISSAO: TDateTime;
    FHORA_EMISSAO: String;
    FSITUACAO: String;
    FCCF: Integer;
    FVALOR: Extended;
    FNOME_DESTINATARIO: String;
    FCPF_CNPJ_DESTINATARIO: String;
    FSUBTOTAL: Extended;
    FDESCONTO: Extended;
    FACRESCIMO: Extended;
    FTAXA_ACRESCIMO: Extended;
    FTAXA_DESCONTO: Extended;

    FListaPreVendaDetalheVO: TObjectList<TPreVendaDetalheVO>;

  public 
    constructor Create; override;
    destructor Destroy; override;

    [TId('ID', [ldGrid, ldLookup, ldComboBox])]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;
    [TColumn('ID_EMPRESA', 'Id Empresa', 80, [], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdEmpresa: Integer  read FID_EMPRESA write FID_EMPRESA;
    [TColumn('ID_PESSOA', 'Id Pessoa', 80, [], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdPessoa: Integer  read FID_PESSOA write FID_PESSOA;
    [TColumn('DATA_EMISSAO', 'Data Emissao', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property DataEmissao: TDateTime  read FDATA_EMISSAO write FDATA_EMISSAO;
    [TColumn('HORA_EMISSAO', 'Hora Emissao', 64, [ldGrid, ldLookup, ldCombobox], False)]
    property HoraEmissao: String  read FHORA_EMISSAO write FHORA_EMISSAO;
    [TColumn('SITUACAO', 'Situacao', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property Situacao: String  read FSITUACAO write FSITUACAO;
    [TColumn('CCF', 'Ccf', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Ccf: Integer  read FCCF write FCCF;
    [TColumn('NOME_DESTINATARIO', 'Nome Destinatario', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property NomeDestinatario: String  read FNOME_DESTINATARIO write FNOME_DESTINATARIO;
    [TColumn('CPF_CNPJ_DESTINATARIO', 'Cpf Cnpj Destinatario', 112, [ldGrid, ldLookup, ldCombobox], False)]
    property CpfCnpjDestinatario: String  read FCPF_CNPJ_DESTINATARIO write FCPF_CNPJ_DESTINATARIO;
    [TColumn('TAXA_DESCONTO', 'Taxa Desconto', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property TaxaDesconto: Extended  read FTAXA_DESCONTO write FTAXA_DESCONTO;
    [TColumn('DESCONTO', 'Desconto', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property Desconto: Extended  read FDESCONTO write FDESCONTO;
    [TColumn('SUBTOTAL', 'Subtotal', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property Subtotal: Extended  read FSUBTOTAL write FSUBTOTAL;
    [TColumn('VALOR', 'Valor', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property Valor: Extended  read FVALOR write FVALOR;
    [TColumn('ACRESCIMO', 'Acrescimo', 168, [], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property Acrescimo: Extended  read FACRESCIMO write FACRESCIMO;
    [TColumn('TAXA_ACRESCIMO', 'Taxa Acrescimo', 168, [], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property TaxaAcrescimo: Extended  read FTAXA_ACRESCIMO write FTAXA_ACRESCIMO;

    [TManyValuedAssociation('ID_PRE_VENDA_CABECALHO', 'ID')]
    property ListaPreVendaDetalheVO: TObjectList<TPreVendaDetalheVO> read FListaPreVendaDetalheVO write FListaPreVendaDetalheVO;

  end;

implementation

constructor TPreVendaCabecalhoVO.Create;
begin
  inherited;
  FListaPreVendaDetalheVO := TObjectList<TPreVendaDetalheVO>.Create;
end;

destructor TPreVendaCabecalhoVO.Destroy;
begin
  FreeAndNil(FListaPreVendaDetalheVO);
  inherited;
end;


initialization
  Classes.RegisterClass(TPreVendaCabecalhoVO);

finalization
  Classes.UnRegisterClass(TPreVendaCabecalhoVO);

end.
