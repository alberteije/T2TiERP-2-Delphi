{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [ECF_EMPRESA] 
                                                                                
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
unit EcfEmpresaVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils;

type
  [TEntity]
  [TTable('ECF_EMPRESA')]
  TEcfEmpresaVO = class(TVO)
  private
    FID: Integer;
    FID_EMPRESA: Integer;
    FRAZAO_SOCIAL: String;
    FNOME_FANTASIA: String;
    FCNPJ: String;
    FINSCRICAO_ESTADUAL: String;
    FINSCRICAO_ESTADUAL_ST: String;
    FINSCRICAO_MUNICIPAL: String;
    FINSCRICAO_JUNTA_COMERCIAL: String;
    FDATA_INSC_JUNTA_COMERCIAL: TDateTime;
    FMATRIZ_FILIAL: String;
    FDATA_CADASTRO: TDateTime;
    FDATA_INICIO_ATIVIDADES: TDateTime;
    FSUFRAMA: String;
    FEMAIL: String;
    FIMAGEM_LOGOTIPO: String;
    FCRT: String;
    FTIPO_REGIME: String;
    FALIQUOTA_PIS: Extended;
    FALIQUOTA_COFINS: Extended;
    FLOGRADOURO: String;
    FNUMERO: String;
    FCOMPLEMENTO: String;
    FCEP: String;
    FBAIRRO: String;
    FCIDADE: String;
    FUF: String;
    FFONE: String;
    FFAX: String;
    FCONTATO: String;
    FCODIGO_IBGE_CIDADE: Integer;
    FCODIGO_IBGE_UF: Integer;

  public 
    [TId('ID')]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;
    [TColumn('ID_EMPRESA', 'Id Empresa', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdEmpresa: Integer  read FID_EMPRESA write FID_EMPRESA;
    [TColumn('RAZAO_SOCIAL', 'Razao Social', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property RazaoSocial: String  read FRAZAO_SOCIAL write FRAZAO_SOCIAL;
    [TColumn('NOME_FANTASIA', 'Nome Fantasia', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property NomeFantasia: String  read FNOME_FANTASIA write FNOME_FANTASIA;
    [TColumn('CNPJ', 'Cnpj', 112, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftCnpj, taLeftJustify)]
    property Cnpj: String  read FCNPJ write FCNPJ;
    [TColumn('INSCRICAO_ESTADUAL', 'Inscricao Estadual', 240, [ldGrid, ldLookup, ldCombobox], False)]
    property InscricaoEstadual: String  read FINSCRICAO_ESTADUAL write FINSCRICAO_ESTADUAL;
    [TColumn('INSCRICAO_ESTADUAL_ST', 'Inscricao Estadual St', 240, [ldGrid, ldLookup, ldCombobox], False)]
    property InscricaoEstadualSt: String  read FINSCRICAO_ESTADUAL_ST write FINSCRICAO_ESTADUAL_ST;
    [TColumn('INSCRICAO_MUNICIPAL', 'Inscricao Municipal', 240, [ldGrid, ldLookup, ldCombobox], False)]
    property InscricaoMunicipal: String  read FINSCRICAO_MUNICIPAL write FINSCRICAO_MUNICIPAL;
    [TColumn('INSCRICAO_JUNTA_COMERCIAL', 'Inscricao Junta Comercial', 240, [ldGrid, ldLookup, ldCombobox], False)]
    property InscricaoJuntaComercial: String  read FINSCRICAO_JUNTA_COMERCIAL write FINSCRICAO_JUNTA_COMERCIAL;
    [TColumn('DATA_INSC_JUNTA_COMERCIAL', 'Data Insc Junta Comercial', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property DataInscJuntaComercial: TDateTime  read FDATA_INSC_JUNTA_COMERCIAL write FDATA_INSC_JUNTA_COMERCIAL;
    [TColumn('MATRIZ_FILIAL', 'Matriz Filial', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property MatrizFilial: String  read FMATRIZ_FILIAL write FMATRIZ_FILIAL;
    [TColumn('DATA_CADASTRO', 'Data Cadastro', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property DataCadastro: TDateTime  read FDATA_CADASTRO write FDATA_CADASTRO;
    [TColumn('DATA_INICIO_ATIVIDADES', 'Data Inicio Atividades', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property DataInicioAtividades: TDateTime  read FDATA_INICIO_ATIVIDADES write FDATA_INICIO_ATIVIDADES;
    [TColumn('SUFRAMA', 'Suframa', 72, [ldGrid, ldLookup, ldCombobox], False)]
    property Suframa: String  read FSUFRAMA write FSUFRAMA;
    [TColumn('EMAIL', 'Email', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property Email: String  read FEMAIL write FEMAIL;
    [TColumn('IMAGEM_LOGOTIPO', 'Imagem Logotipo', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property ImagemLogotipo: String  read FIMAGEM_LOGOTIPO write FIMAGEM_LOGOTIPO;
    [TColumn('CRT', 'Crt', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property Crt: String  read FCRT write FCRT;
    [TColumn('TIPO_REGIME', 'Tipo Regime', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property TipoRegime: String  read FTIPO_REGIME write FTIPO_REGIME;
    [TColumn('ALIQUOTA_PIS', 'Aliquota Pis', 128, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property AliquotaPis: Extended  read FALIQUOTA_PIS write FALIQUOTA_PIS;
    [TColumn('ALIQUOTA_COFINS', 'Aliquota Cofins', 128, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property AliquotaCofins: Extended  read FALIQUOTA_COFINS write FALIQUOTA_COFINS;
    [TColumn('LOGRADOURO', 'Logradouro', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property Logradouro: String  read FLOGRADOURO write FLOGRADOURO;
    [TColumn('NUMERO', 'Numero', 48, [ldGrid, ldLookup, ldCombobox], False)]
    property Numero: String  read FNUMERO write FNUMERO;
    [TColumn('COMPLEMENTO', 'Complemento', 450, [ldGrid, ldLookup, ldCombobox], False)]
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
    [TColumn('FONE', 'Fone', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftTelefone, taLeftJustify)]
    property Fone: String  read FFONE write FFONE;
    [TColumn('FAX', 'Fax', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftTelefone, taLeftJustify)]
    property Fax: String  read FFAX write FFAX;
    [TColumn('CONTATO', 'Contato', 240, [ldGrid, ldLookup, ldCombobox], False)]
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
  Classes.RegisterClass(TEcfEmpresaVO);

finalization
  Classes.UnRegisterClass(TEcfEmpresaVO);


end.
