{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [DAV_CABECALHO] 
                                                                                
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
unit DavCabecalhoVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils,
  DavDetalheVO;

type
  [TEntity]
  [TTable('DAV_CABECALHO')]
  TDavCabecalhoVO = class(TVO)
  private
    FID: Integer;
    FID_EMPRESA: Integer;
    FID_PESSOA: Integer;
    FNUMERO_DAV: String;
    FNUMERO_ECF: String;
    FCCF: Integer;
    FCOO: Integer;
    FNOME_DESTINATARIO: String;
    FCPF_CNPJ_DESTINATARIO: String;
    FDATA_EMISSAO: TDateTime;
    FHORA_EMISSAO: String;
    FSITUACAO: String;
    FTAXA_ACRESCIMO: Extended;
    FACRESCIMO: Extended;
    FTAXA_DESCONTO: Extended;
    FDESCONTO: Extended;
    FSUBTOTAL: Extended;
    FVALOR: Extended;
    FIMPRESSO: String;
    FLOGSS: String;
    FTIPO: String;

    FListaDavDetalheVO: TObjectList<TDavDetalheVO>;

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
    [TColumn('NUMERO_DAV', 'Numero Dav', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property NumeroDav: String  read FNUMERO_DAV write FNUMERO_DAV;
    [TColumn('NUMERO_ECF', 'Numero Ecf', 32, [ldGrid, ldLookup, ldCombobox], False)]
    property NumeroEcf: String  read FNUMERO_ECF write FNUMERO_ECF;
    [TColumn('CCF', 'Ccf', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Ccf: Integer  read FCCF write FCCF;
    [TColumn('COO', 'Coo', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Coo: Integer  read FCOO write FCOO;
    [TColumn('NOME_DESTINATARIO', 'Nome Destinatario', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property NomeDestinatario: String  read FNOME_DESTINATARIO write FNOME_DESTINATARIO;
    [TColumn('CPF_CNPJ_DESTINATARIO', 'Cpf Cnpj Destinatario', 112, [ldGrid, ldLookup, ldCombobox], False)]
    property CpfCnpjDestinatario: String  read FCPF_CNPJ_DESTINATARIO write FCPF_CNPJ_DESTINATARIO;
    [TColumn('DATA_EMISSAO', 'Data Emissao', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property DataEmissao: TDateTime  read FDATA_EMISSAO write FDATA_EMISSAO;
    [TColumn('HORA_EMISSAO', 'Hora Emissao', 64, [ldGrid, ldLookup, ldCombobox], False)]
    property HoraEmissao: String  read FHORA_EMISSAO write FHORA_EMISSAO;
    [TColumn('SITUACAO', 'Situacao', 8, [], False)]
    property Situacao: String  read FSITUACAO write FSITUACAO;
    [TColumn('TAXA_ACRESCIMO', 'Taxa Acrescimo', 168, [], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property TaxaAcrescimo: Extended  read FTAXA_ACRESCIMO write FTAXA_ACRESCIMO;
    [TColumn('ACRESCIMO', 'Acrescimo', 168, [], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property Acrescimo: Extended  read FACRESCIMO write FACRESCIMO;
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
    [TColumn('IMPRESSO', 'Impresso', 8, [], False)]
    property Impresso: String  read FIMPRESSO write FIMPRESSO;
    [TColumn('LOGSS', 'Logss', 256, [], False)]
    property HashRegistro: String  read FLOGSS write FLOGSS;
    [TColumn('TIPO', 'Tipo', 256, [], False)]
    property Tipo: String  read FTIPO write FTIPO;

    [TManyValuedAssociation('ID_DAV_CABECALHO', 'ID')]
    property ListaDavDetalheVO: TObjectList<TDavDetalheVO> read FListaDavDetalheVO write FListaDavDetalheVO;

  end;

implementation

constructor TDavCabecalhoVO.Create;
begin
  inherited;
  FListaDavDetalheVO := TObjectList<TDavDetalheVO>.Create;
end;

destructor TDavCabecalhoVO.Destroy;
begin
  FreeAndNil(FListaDavDetalheVO);
  inherited;
end;


initialization
  Classes.RegisterClass(TDavCabecalhoVO);

finalization
  Classes.UnRegisterClass(TDavCabecalhoVO);

end.
