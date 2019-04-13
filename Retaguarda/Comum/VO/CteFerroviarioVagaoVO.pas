{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [CTE_FERROVIARIO_VAGAO] 
                                                                                
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
unit CteFerroviarioVagaoVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils;

type
  [TEntity]
  [TTable('CTE_FERROVIARIO_VAGAO')]
  TCteFerroviarioVagaoVO = class(TVO)
  private
    FID: Integer;
    FID_CTE_FERROVIARIO: Integer;
    FNUMERO_VAGAO: Integer;
    FCAPACIDADE: Extended;
    FTIPO_VAGAO: String;
    FPESO_REAL: Extended;
    FPESO_BC: Extended;

    //Transientes



  public 
    [TId('ID', [ldGrid, ldLookup, ldComboBox])]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;
    [TColumn('ID_CTE_FERROVIARIO', 'Id Cte Ferroviario', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdCteFerroviario: Integer  read FID_CTE_FERROVIARIO write FID_CTE_FERROVIARIO;
    [TColumn('NUMERO_VAGAO', 'Numero Vagao', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property NumeroVagao: Integer  read FNUMERO_VAGAO write FNUMERO_VAGAO;
    [TColumn('CAPACIDADE', 'Capacidade', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property Capacidade: Extended  read FCAPACIDADE write FCAPACIDADE;
    [TColumn('TIPO_VAGAO', 'Tipo Vagao', 24, [ldGrid, ldLookup, ldCombobox], False)]
    property TipoVagao: String  read FTIPO_VAGAO write FTIPO_VAGAO;
    [TColumn('PESO_REAL', 'Peso Real', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property PesoReal: Extended  read FPESO_REAL write FPESO_REAL;
    [TColumn('PESO_BC', 'Peso Bc', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property PesoBc: Extended  read FPESO_BC write FPESO_BC;


    //Transientes



  end;

implementation


initialization
  Classes.RegisterClass(TCteFerroviarioVagaoVO);

finalization
  Classes.UnRegisterClass(TCteFerroviarioVagaoVO);

end.
