{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [SINDICATO] 
                                                                                
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
unit SindicatoVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils;

type
  [TEntity]
  [TTable('SINDICATO')]
  TSindicatoVO = class(TVO)
  private
    FID: Integer;
    FNOME: String;
    FCODIGO_BANCO: Integer;
    FCODIGO_AGENCIA: Integer;
    FCONTA_BANCO: String;
    FCODIGO_CEDENTE: String;
    FLOGRADOURO: String;
    FNUMERO: String;
    FBAIRRO: String;
    FMUNICIPIO_IBGE: Integer;
    FUF: String;
    FFONE1: String;
    FFONE2: String;
    FEMAIL: String;
    FTIPO_SINDICATO: String;
    FDATA_BASE: TDateTime;
    FPISO_SALARIAL: Extended;
    FCNPJ: String;
    FCLASSIFICACAO_CONTABIL_CONTA: String;

  public
    [TId('ID', [ldGrid, ldLookup, ldComboBox])]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;
    [TColumn('NOME', 'Nome', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property Nome: String  read FNOME write FNOME;
    [TColumn('CODIGO_BANCO', 'Codigo Banco', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property CodigoBanco: Integer  read FCODIGO_BANCO write FCODIGO_BANCO;
    [TColumn('CODIGO_AGENCIA', 'Codigo Agencia', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property CodigoAgencia: Integer  read FCODIGO_AGENCIA write FCODIGO_AGENCIA;
    [TColumn('CONTA_BANCO', 'Conta Banco', 160, [ldGrid, ldLookup, ldCombobox], False)]
    property ContaBanco: String  read FCONTA_BANCO write FCONTA_BANCO;
    [TColumn('CODIGO_CEDENTE', 'Codigo Cedente', 240, [ldGrid, ldLookup, ldCombobox], False)]
    property CodigoCedente: String  read FCODIGO_CEDENTE write FCODIGO_CEDENTE;
    [TColumn('LOGRADOURO', 'Logradouro', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property Logradouro: String  read FLOGRADOURO write FLOGRADOURO;
    [TColumn('NUMERO', 'Numero', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property Numero: String  read FNUMERO write FNUMERO;
    [TColumn('BAIRRO', 'Bairro', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property Bairro: String  read FBAIRRO write FBAIRRO;
    [TColumn('MUNICIPIO_IBGE', 'Municipio Ibge', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property MunicipioIbge: Integer  read FMUNICIPIO_IBGE write FMUNICIPIO_IBGE;
    [TColumn('UF', 'Uf', 16, [ldGrid, ldLookup, ldCombobox], False)]
    property Uf: String  read FUF write FUF;
    [TColumn('FONE1', 'Fone1', 112, [ldGrid, ldLookup, ldCombobox], False)]
    property Fone1: String  read FFONE1 write FFONE1;
    [TColumn('FONE2', 'Fone2', 112, [ldGrid, ldLookup, ldCombobox], False)]
    property Fone2: String  read FFONE2 write FFONE2;
    [TColumn('EMAIL', 'Email', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property Email: String  read FEMAIL write FEMAIL;
    [TColumn('TIPO_SINDICATO', 'Tipo Sindicato', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property TipoSindicato: String  read FTIPO_SINDICATO write FTIPO_SINDICATO;
    [TColumn('DATA_BASE', 'Data Base', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property DataBase: TDateTime  read FDATA_BASE write FDATA_BASE;
    [TColumn('PISO_SALARIAL', 'Piso Salarial', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property PisoSalarial: Extended  read FPISO_SALARIAL write FPISO_SALARIAL;
    [TColumn('CNPJ', 'Cnpj', 112, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftCnpj, taLeftJustify)]
    property Cnpj: String  read FCNPJ write FCNPJ;
    [TColumn('CLASSIFICACAO_CONTABIL_CONTA', 'Classificacao Contabil Conta', 240, [ldGrid, ldLookup, ldCombobox], False)]
    property ClassificacaoContabilConta: String  read FCLASSIFICACAO_CONTABIL_CONTA write FCLASSIFICACAO_CONTABIL_CONTA;

  end;

implementation


initialization
  Classes.RegisterClass(TSindicatoVO);

finalization
  Classes.UnRegisterClass(TSindicatoVO);

end.
