{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [VIEW_SPED_C390] 
                                                                                
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
unit ViewSpedC390VO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils;

type
  [TEntity]
  [TTable('VIEW_SPED_C390')]
  TViewSpedC390VO = class(TVO)
  private
    FCST: String;
    FCFOP: Integer;
    FTAXA_ICMS: Extended;
    FDATA_EMISSAO: TDateTime;
    FSOMA_ITEM: Extended;
    FSOMA_BASE_ICMS: Extended;
    FSOMA_ICMS: Extended;
    FSOMA_ICMS_OUTRAS: Extended;

  public 
    [TColumn('CST', 'Cst', 24, [ldGrid, ldLookup, ldCombobox], False)]
    property Cst: String  read FCST write FCST;
    [TColumn('CFOP', 'Cfop', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Cfop: Integer  read FCFOP write FCFOP;
    [TColumn('TAXA_ICMS', 'Taxa Icms', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property TaxaIcms: Extended  read FTAXA_ICMS write FTAXA_ICMS;
    [TColumn('DATA_EMISSAO', 'Data Emissao', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property DataEmissao: TDateTime  read FDATA_EMISSAO write FDATA_EMISSAO;
    [TColumn('SOMA_ITEM', 'Soma Item', 264, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property SomaItem: Extended  read FSOMA_ITEM write FSOMA_ITEM;
    [TColumn('SOMA_BASE_ICMS', 'Soma Base Icms', 264, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property SomaBaseIcms: Extended  read FSOMA_BASE_ICMS write FSOMA_BASE_ICMS;
    [TColumn('SOMA_ICMS', 'Soma Icms', 264, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property SomaIcms: Extended  read FSOMA_ICMS write FSOMA_ICMS;
    [TColumn('SOMA_ICMS_OUTRAS', 'Soma Icms Outras', 264, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property SomaIcmsOutras: Extended  read FSOMA_ICMS_OUTRAS write FSOMA_ICMS_OUTRAS;

  end;

implementation


initialization
  Classes.RegisterClass(TViewSpedC390VO);

finalization
  Classes.UnRegisterClass(TViewSpedC390VO);

end.
