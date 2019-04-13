{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [VIEW_SINTEGRA_60D] 
                                                                                
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
unit ViewSintegra60dVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils;

type
  [TEntity]
  [TTable('VIEW_SINTEGRA_60D')]
  TViewSintegra60dVO = class(TVO)
  private
    FGTIN: String;
    FSERIE: String;
    FDATA_EMISSAO: TDateTime;
    FID: Integer;
    FECF_ICMS_ST: String;
    FSOMA_QUANTIDADE: Extended;
    FSOMA_ITEM: Extended;
    FSOMA_BASE_ICMS: Extended;
    FSOMA_ICMS: Extended;

  public 
    [TColumn('GTIN', 'Gtin', 112, [ldGrid, ldLookup, ldCombobox], False)]
    property Gtin: String  read FGTIN write FGTIN;
    [TColumn('SERIE', 'Serie', 200, [ldGrid, ldLookup, ldCombobox], False)]
    property Serie: String  read FSERIE write FSERIE;
    [TColumn('DATA_EMISSAO', 'Data Emissao', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property DataEmissao: TDateTime  read FDATA_EMISSAO write FDATA_EMISSAO;
    [TId('ID')]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;
    [TColumn('ECF_ICMS_ST', 'Ecf Icms St', 32, [ldGrid, ldLookup, ldCombobox], False)]
    property EcfIcmsSt: String  read FECF_ICMS_ST write FECF_ICMS_ST;
    [TColumn('SOMA_QUANTIDADE', 'Soma Quantidade', 264, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property SomaQuantidade: Extended  read FSOMA_QUANTIDADE write FSOMA_QUANTIDADE;
    [TColumn('SOMA_ITEM', 'Soma Item', 264, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property SomaItem: Extended  read FSOMA_ITEM write FSOMA_ITEM;
    [TColumn('SOMA_BASE_ICMS', 'Soma Base Icms', 264, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property SomaBaseIcms: Extended  read FSOMA_BASE_ICMS write FSOMA_BASE_ICMS;
    [TColumn('SOMA_ICMS', 'Soma Icms', 264, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property SomaIcms: Extended  read FSOMA_ICMS write FSOMA_ICMS;

  end;

implementation


initialization
  Classes.RegisterClass(TViewSintegra60dVO);

finalization
  Classes.UnRegisterClass(TViewSintegra60dVO);

end.
