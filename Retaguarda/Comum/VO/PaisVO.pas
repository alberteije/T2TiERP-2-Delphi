{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [PAIS] 
                                                                                
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
unit PaisVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils;

type
  [TEntity]
  [TTable('PAIS')]
  TPaisVO = class(TVO)
  private
    FID: Integer;
    FCODIGO: Integer;
    FNOME_EN: String;
    FNOME_PTBR: String;
    FSIGLA2: String;
    FSIGLA3: String;

  public
    [TId('ID', [ldGrid, ldLookup, ldComboBox])]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;
    [TColumn('CODIGO', 'Codigo', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Codigo: Integer  read FCODIGO write FCODIGO;
    [TColumn('NOME_EN', 'Nome En', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property NomeEn: String  read FNOME_EN write FNOME_EN;
    [TColumn('NOME_PTBR', 'Nome Ptbr', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property NomePtbr: String  read FNOME_PTBR write FNOME_PTBR;
    [TColumn('SIGLA2', 'Sigla2', 16, [ldGrid, ldLookup, ldCombobox], False)]
    property Sigla2: String  read FSIGLA2 write FSIGLA2;
    [TColumn('SIGLA3', 'Sigla3', 24, [ldGrid, ldLookup, ldCombobox], False)]
    property Sigla3: String  read FSIGLA3 write FSIGLA3;

  end;

implementation


initialization
  Classes.RegisterClass(TPaisVO);

finalization
  Classes.UnRegisterClass(TPaisVO);

end.
