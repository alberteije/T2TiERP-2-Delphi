{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [PESSOA_FISICA]
                                                                                
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
           t2ti.com@gmail.com</p>                                               
                                                                                
@author Albert Eije (t2ti.com@gmail.com)                            
@version 1.0                                                                    
*******************************************************************************}
unit PessoaFisicaVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils;

type
  [TEntity]
  [TTable('PESSOA_FISICA')]
  TPessoaFisicaVO = class(TVO)
  private
    FID: Integer;
    FID_PESSOA: Integer;
    FID_ESTADO_CIVIL: Integer;
    FCPF: String;
    FRG: String;
    FORGAO_RG: String;
    FDATA_EMISSAO_RG: TDateTime;
    FDATA_NASCIMENTO: TDateTime;
    FSEXO: String;
    FNATURALIDADE: String;
    FNACIONALIDADE: String;
    FRACA: String;
    FTIPO_SANGUE: String;
    FCNH_NUMERO: String;
    FCNH_CATEGORIA: String;
    FCNH_VENCIMENTO: TDateTime;
    FTITULO_ELEITORAL_NUMERO: String;
    FTITULO_ELEITORAL_ZONA: Integer;
    FTITULO_ELEITORAL_SECAO: Integer;
    FRESERVISTA_NUMERO: String;
    FRESERVISTA_CATEGORIA: Integer;
    FNOME_MAE: String;
    FNOME_PAI: String;

  public 
    [TId('ID')]
    [TGeneratedValue(sAuto)]
    property Id: Integer  read FID write FID;
    [TColumn('ID_PESSOA','Id Pessoa',[ldGrid, ldLookup],False)]
    property IdPessoa: Integer  read FID_PESSOA write FID_PESSOA;
    [TColumn('ID_ESTADO_CIVIL','Id Estado Civil',[ldGrid, ldLookup],False)]
    property IdEstadoCivil: Integer  read FID_ESTADO_CIVIL write FID_ESTADO_CIVIL;
    [TColumn('CPF','Cpf',[ldGrid, ldLookup],False)]
    property Cpf: String  read FCPF write FCPF;
    [TColumn('RG','Rg',[ldGrid, ldLookup],False)]
    property Rg: String  read FRG write FRG;
    [TColumn('ORGAO_RG','Orgao Rg',[ldGrid, ldLookup],False)]
    property OrgaoRg: String  read FORGAO_RG write FORGAO_RG;
    [TColumn('DATA_EMISSAO_RG','Data Emissão Rg',[ldGrid, ldLookup],False)]
    property DataEmissaoRg: TDateTime  read FDATA_EMISSAO_RG write FDATA_EMISSAO_RG;
    [TColumn('DATA_NASCIMENTO','Data Nascimento',[ldGrid, ldLookup],False)]
    property DataNascimento: TDateTime  read FDATA_NASCIMENTO write FDATA_NASCIMENTO;
    [TColumn('SEXO','Sexo',[ldGrid, ldLookup],False)]
    property Sexo: String  read FSEXO write FSEXO;
    [TColumn('NATURALIDADE','Naturalidade',[ldGrid, ldLookup],False)]
    property Naturalidade: String  read FNATURALIDADE write FNATURALIDADE;
    [TColumn('NACIONALIDADE','Nacionalidade',[ldGrid, ldLookup],False)]
    property Nacionalidade: String  read FNACIONALIDADE write FNACIONALIDADE;
    [TColumn('RACA','Raca',[ldGrid, ldLookup],False)]
    property Raca: String  read FRACA write FRACA;
    [TColumn('TIPO_SANGUE','Tipo Sangue',[ldGrid, ldLookup],False)]
    property TipoSangue: String  read FTIPO_SANGUE write FTIPO_SANGUE;
    [TColumn('CNH_NUMERO','Cnh Número',[ldGrid, ldLookup],False)]
    property CnhNumero: String  read FCNH_NUMERO write FCNH_NUMERO;
    [TColumn('CNH_CATEGORIA','Cnh Categoria',[ldGrid, ldLookup],False)]
    property CnhCategoria: String  read FCNH_CATEGORIA write FCNH_CATEGORIA;
    [TColumn('CNH_VENCIMENTO','Cnh Vencimento',[ldGrid, ldLookup],False)]
    property CnhVencimento: TDateTime  read FCNH_VENCIMENTO write FCNH_VENCIMENTO;
    [TColumn('TITULO_ELEITORAL_NUMERO','Título Eleitoral Número',[ldGrid, ldLookup],False)]
    property TituloEleitoralNumero: String  read FTITULO_ELEITORAL_NUMERO write FTITULO_ELEITORAL_NUMERO;
    [TColumn('TITULO_ELEITORAL_ZONA','Título Eleitoral Zona',[ldGrid, ldLookup],False)]
    property TituloEleitoralZona: Integer  read FTITULO_ELEITORAL_ZONA write FTITULO_ELEITORAL_ZONA;
    [TColumn('TITULO_ELEITORAL_SECAO','Título Eleitoral Seção',[ldGrid, ldLookup],False)]
    property TituloEleitoralSecao: Integer  read FTITULO_ELEITORAL_SECAO write FTITULO_ELEITORAL_SECAO;
    [TColumn('RESERVISTA_NUMERO','Reservista Número',[ldGrid, ldLookup],False)]
    property ReservistaNumero: String  read FRESERVISTA_NUMERO write FRESERVISTA_NUMERO;
    [TColumn('RESERVISTA_CATEGORIA','Reservista Categoria',[ldGrid, ldLookup],False)]
    property ReservistaCategoria: Integer  read FRESERVISTA_CATEGORIA write FRESERVISTA_CATEGORIA;
    [TColumn('NOME_MAE','Nome Mae',[ldGrid, ldLookup],False)]
    property NomeMae: String  read FNOME_MAE write FNOME_MAE;
    [TColumn('NOME_PAI','Nome Pai',[ldGrid, ldLookup],False)]
    property NomePai: String  read FNOME_PAI write FNOME_PAI;

  end;

implementation

initialization
  Classes.RegisterClass(TPessoaFisicaVO);

finalization
  Classes.UnRegisterClass(TPessoaFisicaVO);


end.
