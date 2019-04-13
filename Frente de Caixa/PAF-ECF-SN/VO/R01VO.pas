{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [R01] 
                                                                                
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
unit R01VO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils;

type
  [TEntity]
  [TTable('R01')]
  TR01VO = class(TVO)
  private
    FID: Integer;
    FSERIE_ECF: String;
    FCNPJ_EMPRESA: String;
    FCNPJ_SH: String;
    FINSCRICAO_ESTADUAL_SH: String;
    FINSCRICAO_MUNICIPAL_SH: String;
    FDENOMINACAO_SH: String;
    FNOME_PAF_ECF: String;
    FVERSAO_PAF_ECF: String;
    FMD5_PAF_ECF: String;
    FDATA_INICIAL: TDateTime;
    FDATA_FINAL: TDateTime;
    FVERSAO_ER: String;
    FNUMERO_LAUDO_PAF: String;
    FRAZAO_SOCIAL_SH: String;
    FENDERECO_SH: String;
    FNUMERO_SH: String;
    FCOMPLEMENTO_SH: String;
    FBAIRRO_SH: String;
    FCIDADE_SH: String;
    FCEP_SH: String;
    FUF_SH: String;
    FTELEFONE_SH: String;
    FCONTATO_SH: String;
    FPRINCIPAL_EXECUTAVEL: String;
    FLOGSS: String;

  public 
    [TId('ID')]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;
    [TColumn('SERIE_ECF', 'Serie Ecf', 160, [ldGrid, ldLookup, ldCombobox], False)]
    property SerieEcf: String  read FSERIE_ECF write FSERIE_ECF;
    [TColumn('CNPJ_EMPRESA', 'Cnpj Empresa', 112, [ldGrid, ldLookup, ldCombobox], False)]
    property CnpjEmpresa: String  read FCNPJ_EMPRESA write FCNPJ_EMPRESA;
    [TColumn('CNPJ_SH', 'Cnpj Sh', 112, [ldGrid, ldLookup, ldCombobox], False)]
    property CnpjSh: String  read FCNPJ_SH write FCNPJ_SH;
    [TColumn('INSCRICAO_ESTADUAL_SH', 'Inscricao Estadual Sh', 112, [ldGrid, ldLookup, ldCombobox], False)]
    property InscricaoEstadualSh: String  read FINSCRICAO_ESTADUAL_SH write FINSCRICAO_ESTADUAL_SH;
    [TColumn('INSCRICAO_MUNICIPAL_SH', 'Inscricao Municipal Sh', 112, [ldGrid, ldLookup, ldCombobox], False)]
    property InscricaoMunicipalSh: String  read FINSCRICAO_MUNICIPAL_SH write FINSCRICAO_MUNICIPAL_SH;
    [TColumn('DENOMINACAO_SH', 'Denominacao Sh', 320, [ldGrid, ldLookup, ldCombobox], False)]
    property DenominacaoSh: String  read FDENOMINACAO_SH write FDENOMINACAO_SH;
    [TColumn('NOME_PAF_ECF', 'Nome Paf Ecf', 320, [ldGrid, ldLookup, ldCombobox], False)]
    property NomePafEcf: String  read FNOME_PAF_ECF write FNOME_PAF_ECF;
    [TColumn('VERSAO_PAF_ECF', 'Versao Paf Ecf', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property VersaoPafEcf: String  read FVERSAO_PAF_ECF write FVERSAO_PAF_ECF;
    [TColumn('MD5_PAF_ECF', 'Md5 Paf Ecf', 256, [ldGrid, ldLookup, ldCombobox], False)]
    property Md5PafEcf: String  read FMD5_PAF_ECF write FMD5_PAF_ECF;
    [TColumn('DATA_INICIAL', 'Data Inicial', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property DataInicial: TDateTime  read FDATA_INICIAL write FDATA_INICIAL;
    [TColumn('DATA_FINAL', 'Data Final', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property DataFinal: TDateTime  read FDATA_FINAL write FDATA_FINAL;
    [TColumn('VERSAO_ER', 'Versao Er', 32, [ldGrid, ldLookup, ldCombobox], False)]
    property VersaoEr: String  read FVERSAO_ER write FVERSAO_ER;
    [TColumn('NUMERO_LAUDO_PAF', 'Numero Laudo Paf', 320, [ldGrid, ldLookup, ldCombobox], False)]
    property NumeroLaudoPaf: String  read FNUMERO_LAUDO_PAF write FNUMERO_LAUDO_PAF;
    [TColumn('RAZAO_SOCIAL_SH', 'Razao Social Sh', 320, [ldGrid, ldLookup, ldCombobox], False)]
    property RazaoSocialSh: String  read FRAZAO_SOCIAL_SH write FRAZAO_SOCIAL_SH;
    [TColumn('ENDERECO_SH', 'Endereco Sh', 320, [ldGrid, ldLookup, ldCombobox], False)]
    property EnderecoSh: String  read FENDERECO_SH write FENDERECO_SH;
    [TColumn('NUMERO_SH', 'Numero Sh', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property NumeroSh: String  read FNUMERO_SH write FNUMERO_SH;
    [TColumn('COMPLEMENTO_SH', 'Complemento Sh', 320, [ldGrid, ldLookup, ldCombobox], False)]
    property ComplementoSh: String  read FCOMPLEMENTO_SH write FCOMPLEMENTO_SH;
    [TColumn('BAIRRO_SH', 'Bairro Sh', 320, [ldGrid, ldLookup, ldCombobox], False)]
    property BairroSh: String  read FBAIRRO_SH write FBAIRRO_SH;
    [TColumn('CIDADE_SH', 'Cidade Sh', 320, [ldGrid, ldLookup, ldCombobox], False)]
    property CidadeSh: String  read FCIDADE_SH write FCIDADE_SH;
    [TColumn('CEP_SH', 'Cep Sh', 64, [ldGrid, ldLookup, ldCombobox], False)]
    property CepSh: String  read FCEP_SH write FCEP_SH;
    [TColumn('UF_SH', 'Uf Sh', 16, [ldGrid, ldLookup, ldCombobox], False)]
    property UfSh: String  read FUF_SH write FUF_SH;
    [TColumn('TELEFONE_SH', 'Telefone Sh', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property TelefoneSh: String  read FTELEFONE_SH write FTELEFONE_SH;
    [TColumn('CONTATO_SH', 'Contato Sh', 160, [ldGrid, ldLookup, ldCombobox], False)]
    property ContatoSh: String  read FCONTATO_SH write FCONTATO_SH;
    [TColumn('PRINCIPAL_EXECUTAVEL', 'Principal Executavel', 320, [ldGrid, ldLookup, ldCombobox], False)]
    property PrincipalExecutavel: String  read FPRINCIPAL_EXECUTAVEL write FPRINCIPAL_EXECUTAVEL;
    [TColumn('LOGSS', 'Log', 8, [], False)]
    property HashRegistro: String  read FLOGSS write FLOGSS;

  end;

implementation


initialization
  Classes.RegisterClass(TR01VO);

finalization
  Classes.UnRegisterClass(TR01VO);

end.
