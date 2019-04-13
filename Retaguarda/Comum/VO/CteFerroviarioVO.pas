{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [CTE_FERROVIARIO] 
                                                                                
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
unit CteFerroviarioVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils;

type
  [TEntity]
  [TTable('CTE_FERROVIARIO')]
  TCteFerroviarioVO = class(TVO)
  private
    FID: Integer;
    FID_CTE_CABECALHO: Integer;
    FTIPO_TRAFEGO: Integer;
    FRESPONSAVEL_FATURAMENTO: Integer;
    FFERROVIA_EMITENTE_CTE: Integer;
    FFLUXO: String;
    FID_TREM: String;
    FVALOR_FRETE: Extended;

    //Transientes



  public 
    [TId('ID', [ldGrid, ldLookup, ldComboBox])]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;
    [TColumn('ID_CTE_CABECALHO', 'Id Cte Cabecalho', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdCteCabecalho: Integer  read FID_CTE_CABECALHO write FID_CTE_CABECALHO;
    [TColumn('TIPO_TRAFEGO', 'Tipo Trafego', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property TipoTrafego: Integer  read FTIPO_TRAFEGO write FTIPO_TRAFEGO;
    [TColumn('RESPONSAVEL_FATURAMENTO', 'Responsavel Faturamento', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property ResponsavelFaturamento: Integer  read FRESPONSAVEL_FATURAMENTO write FRESPONSAVEL_FATURAMENTO;
    [TColumn('FERROVIA_EMITENTE_CTE', 'Ferrovia Emitente Cte', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property FerroviaEmitenteCte: Integer  read FFERROVIA_EMITENTE_CTE write FFERROVIA_EMITENTE_CTE;
    [TColumn('FLUXO', 'Fluxo', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property Fluxo: String  read FFLUXO write FFLUXO;
    [TColumn('ID_TREM', 'Id Trem', 56, [ldGrid, ldLookup, ldCombobox], False)]
    property IdTrem: String  read FID_TREM write FID_TREM;
    [TColumn('VALOR_FRETE', 'Valor Frete', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorFrete: Extended  read FVALOR_FRETE write FVALOR_FRETE;


    //Transientes



  end;

implementation


initialization
  Classes.RegisterClass(TCteFerroviarioVO);

finalization
  Classes.UnRegisterClass(TCteFerroviarioVO);

end.
