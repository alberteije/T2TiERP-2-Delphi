{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [CONTABIL_DRE_DETALHE] 
                                                                                
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
unit ContabilDreDetalheVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils;

type
  [TEntity]
  [TTable('CONTABIL_DRE_DETALHE')]
  TContabilDreDetalheVO = class(TVO)
  private
    FID: Integer;
    FID_CONTABIL_DRE_CABECALHO: Integer;
    FCLASSIFICACAO: String;
    FDESCRICAO: String;
    FFORMA_CALCULO: String;
    FSINAL: String;
    FNATUREZA: String;
    FVALOR: Extended;

    //Transientes



  public 
    [TId('ID', [ldGrid, ldLookup, ldComboBox])]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;
    [TColumn('ID_CONTABIL_DRE_CABECALHO', 'Id Contabil Dre Cabecalho', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdContabilDreCabecalho: Integer  read FID_CONTABIL_DRE_CABECALHO write FID_CONTABIL_DRE_CABECALHO;
    [TColumn('CLASSIFICACAO', 'Classificacao', 240, [ldGrid, ldLookup, ldCombobox], False)]
    property Classificacao: String  read FCLASSIFICACAO write FCLASSIFICACAO;
    [TColumn('DESCRICAO', 'Descricao', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property Descricao: String  read FDESCRICAO write FDESCRICAO;
    [TColumn('FORMA_CALCULO', 'Forma Calculo', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property FormaCalculo: String  read FFORMA_CALCULO write FFORMA_CALCULO;
    [TColumn('SINAL', 'Sinal', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property Sinal: String  read FSINAL write FSINAL;
    [TColumn('NATUREZA', 'Natureza', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property Natureza: String  read FNATUREZA write FNATUREZA;
    [TColumn('VALOR', 'Valor', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property Valor: Extended  read FVALOR write FVALOR;


    //Transientes



  end;

implementation


initialization
  Classes.RegisterClass(TContabilDreDetalheVO);

finalization
  Classes.UnRegisterClass(TContabilDreDetalheVO);

end.
