{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [CLIENTE] 
                                                                                
The MIT License                                                                 
                                                                                
Copyright: Copyright (C) 2010 T2Ti.COM                                          
                                                                                
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
@version 1.0                                                                    
*******************************************************************************}
unit ClienteVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils;

type
  [TEntity]
  [TTable('CLIENTE')]
  TClienteVO = class(TVO)
  private
    FID: Integer;
    FID_SITUACAO_CLIENTE: Integer;
    FNOME: String;
    FFANTASIA: String;
    FEMAIL: String;
    FCPF_CNPJ: String;
    FRG: String;
    FORGAO_RG: String;
    FDATA_EMISSAO_RG: TDateTime;
    FSEXO: String;
    FINSCRICAO_ESTADUAL: String;
    FINSCRICAO_MUNICIPAL: String;
    FTIPO_PESSOA: String;
    FDATA_CADASTRO: TDateTime;
    FLOGRADOURO: String;
    FNUMERO: String;
    FCOMPLEMENTO: String;
    FCEP: String;
    FBAIRRO: String;
    FCIDADE: String;
    FUF: String;
    FFONE1: String;
    FFONE2: String;
    FCELULAR: String;
    FCONTATO: String;
    FCODIGO_IBGE_CIDADE: Integer;
    FCODIGO_IBGE_UF: Integer;

  public 
    [TId('ID')]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;
    [TColumn('ID_SITUACAO_CLIENTE', 'Id Situacao Cliente', 80, [], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdSituacaoCliente: Integer  read FID_SITUACAO_CLIENTE write FID_SITUACAO_CLIENTE;
    [TColumn('NOME', 'Nome', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property Nome: String  read FNOME write FNOME;
    [TColumn('FANTASIA', 'Fantasia', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property Fantasia: String  read FFANTASIA write FFANTASIA;
    [TColumn('EMAIL', 'Email', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property Email: String  read FEMAIL write FEMAIL;
    [TColumn('CPF_CNPJ', 'Cpf Cnpj', 112, [ldGrid, ldLookup, ldCombobox], False)]
    property CpfCnpj: String  read FCPF_CNPJ write FCPF_CNPJ;
    [TColumn('RG', 'Rg', 160, [ldGrid, ldLookup, ldCombobox], False)]
    property Rg: String  read FRG write FRG;
    [TColumn('ORGAO_RG', 'Orgao Rg', 160, [ldGrid, ldLookup, ldCombobox], False)]
    property OrgaoRg: String  read FORGAO_RG write FORGAO_RG;
    [TColumn('DATA_EMISSAO_RG', 'Data Emissao Rg', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property DataEmissaoRg: TDateTime  read FDATA_EMISSAO_RG write FDATA_EMISSAO_RG;
    [TColumn('SEXO', 'Sexo', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property Sexo: String  read FSEXO write FSEXO;
    [TColumn('INSCRICAO_ESTADUAL', 'Inscricao Estadual', 240, [ldGrid, ldLookup, ldCombobox], False)]
    property InscricaoEstadual: String  read FINSCRICAO_ESTADUAL write FINSCRICAO_ESTADUAL;
    [TColumn('INSCRICAO_MUNICIPAL', 'Inscricao Municipal', 240, [ldGrid, ldLookup, ldCombobox], False)]
    property InscricaoMunicipal: String  read FINSCRICAO_MUNICIPAL write FINSCRICAO_MUNICIPAL;
    [TColumn('TIPO_PESSOA', 'Tipo Pessoa', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property TipoPessoa: String  read FTIPO_PESSOA write FTIPO_PESSOA;
    [TColumn('DATA_CADASTRO', 'Data Cadastro', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property DataCadastro: TDateTime  read FDATA_CADASTRO write FDATA_CADASTRO;
    [TColumn('LOGRADOURO', 'Logradouro', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property Logradouro: String  read FLOGRADOURO write FLOGRADOURO;
    [TColumn('NUMERO', 'Numero', 48, [ldGrid, ldLookup, ldCombobox], False)]
    property Numero: String  read FNUMERO write FNUMERO;
    [TColumn('COMPLEMENTO', 'Complemento', 400, [ldGrid, ldLookup, ldCombobox], False)]
    property Complemento: String  read FCOMPLEMENTO write FCOMPLEMENTO;
    [TColumn('CEP', 'Cep', 64, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftCep, taLeftJustify)]
    property Cep: String  read FCEP write FCEP;
    [TColumn('BAIRRO', 'Bairro', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property Bairro: String  read FBAIRRO write FBAIRRO;
    [TColumn('CIDADE', 'Cidade', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property Cidade: String  read FCIDADE write FCIDADE;
    [TColumn('UF', 'Uf', 16, [ldGrid, ldLookup, ldCombobox], False)]
    property Uf: String  read FUF write FUF;
    [TColumn('FONE1', 'Fone1', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property Fone1: String  read FFONE1 write FFONE1;
    [TColumn('FONE2', 'Fone2', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property Fone2: String  read FFONE2 write FFONE2;
    [TColumn('CELULAR', 'Celular', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftTelefone, taLeftJustify)]
    property Celular: String  read FCELULAR write FCELULAR;
    [TColumn('CONTATO', 'Contato', 400, [ldGrid, ldLookup, ldCombobox], False)]
    property Contato: String  read FCONTATO write FCONTATO;
    [TColumn('CODIGO_IBGE_CIDADE', 'Codigo Ibge Cidade', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property CodigoIbgeCidade: Integer  read FCODIGO_IBGE_CIDADE write FCODIGO_IBGE_CIDADE;
    [TColumn('CODIGO_IBGE_UF', 'Codigo Ibge Uf', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property CodigoIbgeUf: Integer  read FCODIGO_IBGE_UF write FCODIGO_IBGE_UF;

  end;

implementation


initialization
  Classes.RegisterClass(TClienteVO);

finalization
  Classes.UnRegisterClass(TClienteVO);

end.
