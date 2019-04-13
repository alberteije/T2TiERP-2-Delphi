{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [VIEW_SPED_NFE_ITEM] 
                                                                                
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
unit ViewSpedNfeItemVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils;

type
  [TEntity]
  [TTable('VIEW_SPED_NFE_ITEM')]
  TViewSpedNfeItemVO = class(TVO)
  private
    FID: Integer;
    FNOME: String;
    FGTIN: String;
    FID_UNIDADE_PRODUTO: Integer;
    FSIGLA: String;
    FTIPO_ITEM_SPED: String;
    FNCM: String;
    FEX_TIPI: String;
    FCODIGO_LST: String;
    FALIQUOTA_ICMS_PAF: Extended;

  public 
    [TId('ID')]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;
    [TColumn('NOME', 'Nome', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property Nome: String  read FNOME write FNOME;
    [TColumn('GTIN', 'Gtin', 112, [ldGrid, ldLookup, ldCombobox], False)]
    property Gtin: String  read FGTIN write FGTIN;
    [TColumn('ID_UNIDADE_PRODUTO', 'Id Unidade Produto', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdUnidadeProduto: Integer  read FID_UNIDADE_PRODUTO write FID_UNIDADE_PRODUTO;
    [TColumn('SIGLA', 'Sigla', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property Sigla: String  read FSIGLA write FSIGLA;
    [TColumn('TIPO_ITEM_SPED', 'Tipo Item Sped', 16, [ldGrid, ldLookup, ldCombobox], False)]
    property TipoItemSped: String  read FTIPO_ITEM_SPED write FTIPO_ITEM_SPED;
    [TColumn('NCM', 'Ncm', 64, [ldGrid, ldLookup, ldCombobox], False)]
    property Ncm: String  read FNCM write FNCM;
    [TColumn('EX_TIPI', 'Ex Tipi', 24, [ldGrid, ldLookup, ldCombobox], False)]
    property ExTipi: String  read FEX_TIPI write FEX_TIPI;
    [TColumn('CODIGO_LST', 'Codigo Lst', 32, [ldGrid, ldLookup, ldCombobox], False)]
    property CodigoLst: String  read FCODIGO_LST write FCODIGO_LST;
    [TColumn('ALIQUOTA_ICMS_PAF', 'Aliquota Icms Paf', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property AliquotaIcmsPaf: Extended  read FALIQUOTA_ICMS_PAF write FALIQUOTA_ICMS_PAF;

  end;

implementation


initialization
  Classes.RegisterClass(TViewSpedNfeItemVO);

finalization
  Classes.UnRegisterClass(TViewSpedNfeItemVO);

end.
