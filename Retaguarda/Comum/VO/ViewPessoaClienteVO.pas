{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [VIEW_PESSOA_CLIENTE] 
                                                                                
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
unit ViewPessoaClienteVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils;

type
  [TEntity]
  [TTable('VIEW_PESSOA_CLIENTE')]
  TViewPessoaClienteVO = class(TVO)
  private
    FID: Integer;
    FID_OPERACAO_FISCAL: Integer;
    FID_PESSOA: Integer;
    FID_ATIVIDADE_FOR_CLI: Integer;
    FID_SITUACAO_FOR_CLI: Integer;
    FID_CONVENIO: Integer;
    FDESDE: TDateTime;
    FDATA_CADASTRO: TDateTime;
    FOBSERVACAO: String;
    FCONTA_TOMADOR: String;
    FGERA_FINANCEIRO: String;
    FINDICADOR_PRECO: String;
    FPORCENTO_DESCONTO: Extended;
    FFORMA_DESCONTO: String;
    FLIMITE_CREDITO: Extended;
    FTIPO_FRETE: String;
    FDESCONTO_CONVENIO: Extended;
    FLOGRADOURO: String;
    FNUMERO: String;
    FCOMPLEMENTO: String;
    FBAIRRO: String;
    FCIDADE: String;
    FCEP: String;
    FMUNICIPIO_IBGE: Integer;
    FUF: String;
    FFONE: String;
    FNOME: String;
    FTIPO: String;
    FEMAIL: String;
    FSITE: String;
    FCPF_CNPJ: String;
    FRG_IE: String;


  public 
    [TId('ID', [ldGrid, ldLookup, ldComboBox])]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;
    [TColumn('ID_OPERACAO_FISCAL', 'Id Operacao Fiscal', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdOperacaoFiscal: Integer  read FID_OPERACAO_FISCAL write FID_OPERACAO_FISCAL;
    [TColumn('ID_PESSOA', 'Id Pessoa', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdPessoa: Integer  read FID_PESSOA write FID_PESSOA;
    [TColumn('ID_ATIVIDADE_FOR_CLI', 'Id Atividade For Cli', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdAtividadeForCli: Integer  read FID_ATIVIDADE_FOR_CLI write FID_ATIVIDADE_FOR_CLI;
    [TColumn('ID_SITUACAO_FOR_CLI', 'Id Situacao For Cli', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdSituacaoForCli: Integer  read FID_SITUACAO_FOR_CLI write FID_SITUACAO_FOR_CLI;
    [TColumn('ID_CONVENIO', 'Id Convenio', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdConvenio: Integer  read FID_CONVENIO write FID_CONVENIO;
    [TColumn('DESDE', 'Desde', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property Desde: TDateTime  read FDESDE write FDESDE;
    [TColumn('DATA_CADASTRO', 'Data Cadastro', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property DataCadastro: TDateTime  read FDATA_CADASTRO write FDATA_CADASTRO;
    [TColumn('OBSERVACAO', 'Observacao', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property Observacao: String  read FOBSERVACAO write FOBSERVACAO;
    [TColumn('CONTA_TOMADOR', 'Conta Tomador', 240, [ldGrid, ldLookup, ldCombobox], False)]
    property ContaTomador: String  read FCONTA_TOMADOR write FCONTA_TOMADOR;
    [TColumn('GERA_FINANCEIRO', 'Gera Financeiro', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property GeraFinanceiro: String  read FGERA_FINANCEIRO write FGERA_FINANCEIRO;
    [TColumn('INDICADOR_PRECO', 'Indicador Preco', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property IndicadorPreco: String  read FINDICADOR_PRECO write FINDICADOR_PRECO;
    [TColumn('PORCENTO_DESCONTO', 'Porcento Desconto', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property PorcentoDesconto: Extended  read FPORCENTO_DESCONTO write FPORCENTO_DESCONTO;
    [TColumn('FORMA_DESCONTO', 'Forma Desconto', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property FormaDesconto: String  read FFORMA_DESCONTO write FFORMA_DESCONTO;
    [TColumn('LIMITE_CREDITO', 'Limite Credito', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property LimiteCredito: Extended  read FLIMITE_CREDITO write FLIMITE_CREDITO;
    [TColumn('TIPO_FRETE', 'Tipo Frete', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property TipoFrete: String  read FTIPO_FRETE write FTIPO_FRETE;
    [TColumn('DESCONTO_CONVENIO', 'Desconto Convenio', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property DescontoConvenio: Extended  read FDESCONTO_CONVENIO write FDESCONTO_CONVENIO;
    [TColumn('LOGRADOURO', 'Logradouro', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property Logradouro: String  read FLOGRADOURO write FLOGRADOURO;
    [TColumn('NUMERO', 'Numero', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property Numero: String  read FNUMERO write FNUMERO;
    [TColumn('COMPLEMENTO', 'Complemento', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property Complemento: String  read FCOMPLEMENTO write FCOMPLEMENTO;
    [TColumn('BAIRRO', 'Bairro', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property Bairro: String  read FBAIRRO write FBAIRRO;
    [TColumn('CIDADE', 'Cidade', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property Cidade: String  read FCIDADE write FCIDADE;
    [TColumn('CEP', 'Cep', 64, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftCep, taLeftJustify)]
    property Cep: String  read FCEP write FCEP;
    [TColumn('MUNICIPIO_IBGE', 'Municipio Ibge', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property MunicipioIbge: Integer  read FMUNICIPIO_IBGE write FMUNICIPIO_IBGE;
    [TColumn('UF', 'Uf', 16, [ldGrid, ldLookup, ldCombobox], False)]
    property Uf: String  read FUF write FUF;
    [TColumn('FONE', 'Fone', 112, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftTelefone, taLeftJustify)]
    property Fone: String  read FFONE write FFONE;
    [TColumn('NOME', 'Nome', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property Nome: String  read FNOME write FNOME;
    [TColumn('TIPO', 'Tipo', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property Tipo: String  read FTIPO write FTIPO;
    [TColumn('EMAIL', 'Email', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property Email: String  read FEMAIL write FEMAIL;
    [TColumn('SITE', 'Site', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property Site: String  read FSITE write FSITE;
    [TColumn('CPF_CNPJ', 'Cpf Cnpj', 112, [ldGrid, ldLookup, ldCombobox], False)]
    property CpfCnpj: String  read FCPF_CNPJ write FCPF_CNPJ;
    [TColumn('RG_IE', 'Rg Ie', 240, [ldGrid, ldLookup, ldCombobox], False)]
    property RgIe: String  read FRG_IE write FRG_IE;


  end;

implementation


initialization
  Classes.RegisterClass(TViewPessoaClienteVO);

finalization
  Classes.UnRegisterClass(TViewPessoaClienteVO);

end.
