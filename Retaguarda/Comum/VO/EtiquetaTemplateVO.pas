{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [ETIQUETA_TEMPLATE] 
                                                                                
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
unit EtiquetaTemplateVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils;

type
  [TEntity]
  [TTable('ETIQUETA_TEMPLATE')]
  TEtiquetaTemplateVO = class(TVO)
  private
    FID: Integer;
    FID_ETIQUETA_LAYOUT: Integer;
    FTABELA: String;
    FCAMPO: String;
    FFORMATO: Integer;
    FQUANTIDADE_REPETICOES: Integer;
    FFILTRO: String;

    //Transientes



  public 
    [TId('ID', [ldGrid, ldLookup, ldComboBox])]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;
    [TColumn('ID_ETIQUETA_LAYOUT', 'Id Etiqueta Layout', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdEtiquetaLayout: Integer  read FID_ETIQUETA_LAYOUT write FID_ETIQUETA_LAYOUT;
    [TColumn('TABELA', 'Tabela', 400, [ldGrid, ldLookup, ldCombobox], False)]
    property Tabela: String  read FTABELA write FTABELA;
    [TColumn('CAMPO', 'Campo', 400, [ldGrid, ldLookup, ldCombobox], False)]
    property Campo: String  read FCAMPO write FCAMPO;
    [TColumn('FORMATO', 'Formato', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Formato: Integer  read FFORMATO write FFORMATO;
    [TColumn('QUANTIDADE_REPETICOES', 'Quantidade Repeticoes', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property QuantidadeRepeticoes: Integer  read FQUANTIDADE_REPETICOES write FQUANTIDADE_REPETICOES;
    [TColumn('FILTRO', 'Filtro', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property Filtro: String  read FFILTRO write FFILTRO;


    //Transientes



  end;

implementation


initialization
  Classes.RegisterClass(TEtiquetaTemplateVO);

finalization
  Classes.UnRegisterClass(TEtiquetaTemplateVO);

end.
