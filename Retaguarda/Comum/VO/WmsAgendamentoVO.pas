{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [WMS_AGENDAMENTO] 
                                                                                
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
unit WmsAgendamentoVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils;

type
  [TEntity]
  [TTable('WMS_AGENDAMENTO')]
  TWmsAgendamentoVO = class(TVO)
  private
    FID: Integer;
    FID_EMPRESA: Integer;
    FDATA_OPERACAO: TDateTime;
    FHORA_OPERACAO: String;
    FLOCAL_OPERACAO: String;
    FQUANTIDADE_VOLUME: Integer;
    FPESO_TOTAL_VOLUME: Extended;
    FQUANTIDADE_PESSOA: Integer;
    FQUANTIDADE_HORA: Integer;

    //Transientes



  public 
    [TId('ID', [ldGrid, ldLookup, ldComboBox])]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;
    [TColumn('ID_EMPRESA', 'Id Empresa', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdEmpresa: Integer  read FID_EMPRESA write FID_EMPRESA;
    [TColumn('DATA_OPERACAO', 'Data Operacao', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property DataOperacao: TDateTime  read FDATA_OPERACAO write FDATA_OPERACAO;
    [TColumn('HORA_OPERACAO', 'Hora Operacao', 64, [ldGrid, ldLookup, ldCombobox], False)]
    property HoraOperacao: String  read FHORA_OPERACAO write FHORA_OPERACAO;
    [TColumn('LOCAL_OPERACAO', 'Local Operacao', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property LocalOperacao: String  read FLOCAL_OPERACAO write FLOCAL_OPERACAO;
    [TColumn('QUANTIDADE_VOLUME', 'Quantidade Volume', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property QuantidadeVolume: Integer  read FQUANTIDADE_VOLUME write FQUANTIDADE_VOLUME;
    [TColumn('PESO_TOTAL_VOLUME', 'Peso Total Volume', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property PesoTotalVolume: Extended  read FPESO_TOTAL_VOLUME write FPESO_TOTAL_VOLUME;
    [TColumn('QUANTIDADE_PESSOA', 'Quantidade Pessoa', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property QuantidadePessoa: Integer  read FQUANTIDADE_PESSOA write FQUANTIDADE_PESSOA;
    [TColumn('QUANTIDADE_HORA', 'Quantidade Hora', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property QuantidadeHora: Integer  read FQUANTIDADE_HORA write FQUANTIDADE_HORA;


    //Transientes



  end;

implementation


initialization
  Classes.RegisterClass(TWmsAgendamentoVO);

finalization
  Classes.UnRegisterClass(TWmsAgendamentoVO);

end.
