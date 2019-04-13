{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [MUNICIPIO] 
                                                                                
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
unit MunicipioVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils;

type
  [TEntity]
  [TTable('MUNICIPIO')]
  TMunicipioVO = class(TVO)
  private
    FID: Integer;
    FID_UF: Integer;
    FNOME: String;
    FCODIGO_IBGE: Integer;
    FCODIGO_RECEITA_FEDERAL: Integer;
    FCODIGO_ESTADUAL: Integer;
    FUF_SIGLA: String;

  public 
    [TId('ID', [ldGrid, ldLookup, ldComboBox])]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;
    [TColumn('ID_UF', 'Id Uf', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdUf: Integer  read FID_UF write FID_UF;
    [TColumn('NOME', 'Nome', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property Nome: String  read FNOME write FNOME;
    [TColumn('CODIGO_IBGE', 'Codigo Ibge', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property CodigoIbge: Integer  read FCODIGO_IBGE write FCODIGO_IBGE;
    [TColumn('CODIGO_RECEITA_FEDERAL', 'Codigo Receita Federal', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property CodigoReceitaFederal: Integer  read FCODIGO_RECEITA_FEDERAL write FCODIGO_RECEITA_FEDERAL;
    [TColumn('CODIGO_ESTADUAL', 'Codigo Estadual', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property CodigoEstadual: Integer  read FCODIGO_ESTADUAL write FCODIGO_ESTADUAL;
    [TColumn('UF_SIGLA', 'Uf Sigla', 16, [ldGrid, ldLookup, ldCombobox], False)]
    property UfSigla: String  read FUF_SIGLA write FUF_SIGLA;

  end;

implementation


initialization
  Classes.RegisterClass(TMunicipioVO);

finalization
  Classes.UnRegisterClass(TMunicipioVO);

end.
