{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [VIEW_PESSOA_COLABORADOR] 
                                                                                
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
unit ViewPessoaColaboradorVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils;

type
  [TEntity]
  [TTable('VIEW_PESSOA_COLABORADOR')]
  TViewPessoaColaboradorVO = class(TVO)
  private
    FID: Integer;
    FID_SINDICATO: Integer;
    FID_TIPO_ADMISSAO: Integer;
    FID_SITUACAO_COLABORADOR: Integer;
    FID_PESSOA: Integer;
    FID_TIPO_COLABORADOR: Integer;
    FID_NIVEL_FORMACAO: Integer;
    FID_CARGO: Integer;
    FID_SETOR: Integer;
    FMATRICULA: String;
    FDATA_CADASTRO: TDateTime;
    FDATA_ADMISSAO: TDateTime;
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
    FCODIGO_TURMA_PONTO: String;
    FPIS_NUMERO: String;

    //Transientes



  public
    [TId('ID')]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;
    [TColumn('NOME', 'Nome', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property Nome: String  read FNOME write FNOME;
    [TColumn('ID_SINDICATO', 'Id Sindicato', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdSindicato: Integer  read FID_SINDICATO write FID_SINDICATO;
    [TColumn('ID_TIPO_ADMISSAO', 'Id Tipo Admissao', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdTipoAdmissao: Integer  read FID_TIPO_ADMISSAO write FID_TIPO_ADMISSAO;
    [TColumn('ID_SITUACAO_COLABORADOR', 'Id Situacao Colaborador', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdSituacaoColaborador: Integer  read FID_SITUACAO_COLABORADOR write FID_SITUACAO_COLABORADOR;
    [TColumn('ID_PESSOA', 'Id Pessoa', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdPessoa: Integer  read FID_PESSOA write FID_PESSOA;
    [TColumn('ID_TIPO_COLABORADOR', 'Id Tipo Colaborador', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdTipoColaborador: Integer  read FID_TIPO_COLABORADOR write FID_TIPO_COLABORADOR;
    [TColumn('ID_NIVEL_FORMACAO', 'Id Nivel Formacao', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdNivelFormacao: Integer  read FID_NIVEL_FORMACAO write FID_NIVEL_FORMACAO;
    [TColumn('ID_CARGO', 'Id Cargo', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdCargo: Integer  read FID_CARGO write FID_CARGO;
    [TColumn('ID_SETOR', 'Id Setor', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdSetor: Integer  read FID_SETOR write FID_SETOR;
    [TColumn('MATRICULA', 'Matricula', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property Matricula: String  read FMATRICULA write FMATRICULA;
    [TColumn('DATA_CADASTRO', 'Data Cadastro', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property DataCadastro: TDateTime  read FDATA_CADASTRO write FDATA_CADASTRO;
    [TColumn('DATA_ADMISSAO', 'Data Admissao', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property DataAdmissao: TDateTime  read FDATA_ADMISSAO write FDATA_ADMISSAO;
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
    [TColumn('CODIGO_TURMA_PONTO', 'Código Turma Ponto', 200, [ldGrid, ldLookup, ldCombobox], False)]
    property CodigoTurmaPonto: String  read FCODIGO_TURMA_PONTO write FCODIGO_TURMA_PONTO;
    [TColumn('PIS_NUMERO', 'Número PIS', 200, [ldGrid, ldLookup, ldCombobox], False)]
    property PisNumero: String  read FPIS_NUMERO write FPIS_NUMERO;


    //Transientes

  end;

implementation


initialization
  Classes.RegisterClass(TViewPessoaColaboradorVO);

finalization
  Classes.UnRegisterClass(TViewPessoaColaboradorVO);

end.
