{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [CONTRATO_HISTORICO_REAJUSTE] 
                                                                                
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
unit ContratoHistoricoReajusteVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils;

type
  [TEntity]
  [TTable('CONTRATO_HISTORICO_REAJUSTE')]
  TContratoHistoricoReajusteVO = class(TVO)
  private
    FID: Integer;
    FID_CONTRATO: Integer;
    FINDICE: Extended;
    FVALOR_ANTERIOR: Extended;
    FVALOR_ATUAL: Extended;
    FDATA_REAJUSTE: TDateTime;
    FOBSERVACAO: String;

    //Transientes



  public 
    [TId('ID', [ldGrid, ldLookup, ldComboBox])]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;
    [TColumn('ID_CONTRATO', 'Id Contrato', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdContrato: Integer  read FID_CONTRATO write FID_CONTRATO;
    [TColumn('INDICE', 'Indice', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property Indice: Extended  read FINDICE write FINDICE;
    [TColumn('VALOR_ANTERIOR', 'Valor Anterior', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorAnterior: Extended  read FVALOR_ANTERIOR write FVALOR_ANTERIOR;
    [TColumn('VALOR_ATUAL', 'Valor Atual', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorAtual: Extended  read FVALOR_ATUAL write FVALOR_ATUAL;
    [TColumn('DATA_REAJUSTE', 'Data Reajuste', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property DataReajuste: TDateTime  read FDATA_REAJUSTE write FDATA_REAJUSTE;
    [TColumn('OBSERVACAO', 'Observacao', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property Observacao: String  read FOBSERVACAO write FOBSERVACAO;


    //Transientes



  end;

implementation


initialization
  Classes.RegisterClass(TContratoHistoricoReajusteVO);

finalization
  Classes.UnRegisterClass(TContratoHistoricoReajusteVO);

end.
