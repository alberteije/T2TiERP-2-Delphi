{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [IBPT] 
                                                                                
The MIT License                                                                 
                                                                                
Copyright: Copyright (C) 2016 T2Ti.COM                                          
                                                                                
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
unit IbptVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils;

type
  [TEntity]
  [TTable('IBPT')]
  TIbptVO = class(TVO)
  private
    FID: Integer;
    FNCM: String;
    FEX: String;
    FTIPO: String;
    FDESCRICAO: String;
    FNACIONAL_FEDERAL: Extended;
    FIMPORTADOS_FEDERAL: Extended;
    FESTADUAL: Extended;
    FMUNICIPAL: Extended;
    FVIGENCIA_INICIO: TDateTime;
    FVIGENCIA_FIM: TDateTime;
    FCHAVE: String;
    FVERSAO: String;
    FFONTE: String;

    //Transientes



  public 
    [TId('ID', [ldGrid, ldLookup, ldComboBox])]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;
    [TColumn('NCM', 'Ncm', 64, [ldGrid, ldLookup, ldCombobox], False)]
    property Ncm: String  read FNCM write FNCM;
    [TColumn('EX', 'Ex', 16, [ldGrid, ldLookup, ldCombobox], False)]
    property Ex: String  read FEX write FEX;
    [TColumn('TIPO', 'Tipo', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property Tipo: String  read FTIPO write FTIPO;
    [TColumn('DESCRICAO', 'Descricao', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property Descricao: String  read FDESCRICAO write FDESCRICAO;
    [TColumn('NACIONAL_FEDERAL', 'Nacional Federal', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property NacionalFederal: Extended  read FNACIONAL_FEDERAL write FNACIONAL_FEDERAL;
    [TColumn('IMPORTADOS_FEDERAL', 'Importados Federal', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ImportadosFederal: Extended  read FIMPORTADOS_FEDERAL write FIMPORTADOS_FEDERAL;
    [TColumn('ESTADUAL', 'Estadual', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property Estadual: Extended  read FESTADUAL write FESTADUAL;
    [TColumn('MUNICIPAL', 'Municipal', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property Municipal: Extended  read FMUNICIPAL write FMUNICIPAL;
    [TColumn('VIGENCIA_INICIO', 'Vigencia Inicio', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property VigenciaInicio: TDateTime  read FVIGENCIA_INICIO write FVIGENCIA_INICIO;
    [TColumn('VIGENCIA_FIM', 'Vigencia Fim', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property VigenciaFim: TDateTime  read FVIGENCIA_FIM write FVIGENCIA_FIM;
    [TColumn('CHAVE', 'Chave', 48, [ldGrid, ldLookup, ldCombobox], False)]
    property Chave: String  read FCHAVE write FCHAVE;
    [TColumn('VERSAO', 'Versao', 48, [ldGrid, ldLookup, ldCombobox], False)]
    property Versao: String  read FVERSAO write FVERSAO;
    [TColumn('FONTE', 'Fonte', 272, [ldGrid, ldLookup, ldCombobox], False)]
    property Fonte: String  read FFONTE write FFONTE;


    //Transientes



  end;

implementation


initialization
  Classes.RegisterClass(TIbptVO);

finalization
  Classes.UnRegisterClass(TIbptVO);

end.
