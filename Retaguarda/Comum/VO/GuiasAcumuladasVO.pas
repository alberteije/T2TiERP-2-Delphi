{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [GUIAS_ACUMULADAS] 
                                                                                
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
unit GuiasAcumuladasVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils;

type
  [TEntity]
  [TTable('GUIAS_ACUMULADAS')]
  TGuiasAcumuladasVO = class(TVO)
  private
    FID: Integer;
    FID_EMPRESA: Integer;
    FGPS_TIPO: String;
    FGPS_COMPETENCIA: String;
    FGPS_VALOR_INSS: Extended;
    FGPS_VALOR_OUTRAS_ENT: Extended;
    FGPS_DATA_PAGAMENTO: TDateTime;
    FIRRF_COMPETENCIA: String;
    FIRRF_CODIGO_RECOLHIMENTO: Integer;
    FIRRF_VALOR_ACUMULADO: Extended;
    FIRRF_DATA_PAGAMENTO: TDateTime;
    FPIS_COMPETENCIA: String;
    FPIS_VALOR_ACUMULADO: Extended;
    FPIS_DATA_PAGAMENTO: TDateTime;

    //Transientes



  public 
    [TId('ID', [ldGrid, ldLookup, ldComboBox])]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;
    [TColumn('ID_EMPRESA', 'Id Empresa', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdEmpresa: Integer  read FID_EMPRESA write FID_EMPRESA;
    [TColumn('GPS_TIPO', 'Gps Tipo', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property GpsTipo: String  read FGPS_TIPO write FGPS_TIPO;
    [TColumn('GPS_COMPETENCIA', 'Gps Competencia', 56, [ldGrid, ldLookup, ldCombobox], False)]
    property GpsCompetencia: String  read FGPS_COMPETENCIA write FGPS_COMPETENCIA;
    [TColumn('GPS_VALOR_INSS', 'Gps Valor Inss', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property GpsValorInss: Extended  read FGPS_VALOR_INSS write FGPS_VALOR_INSS;
    [TColumn('GPS_VALOR_OUTRAS_ENT', 'Gps Valor Outras Ent', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property GpsValorOutrasEnt: Extended  read FGPS_VALOR_OUTRAS_ENT write FGPS_VALOR_OUTRAS_ENT;
    [TColumn('GPS_DATA_PAGAMENTO', 'Gps Data Pagamento', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property GpsDataPagamento: TDateTime  read FGPS_DATA_PAGAMENTO write FGPS_DATA_PAGAMENTO;
    [TColumn('IRRF_COMPETENCIA', 'Irrf Competencia', 56, [ldGrid, ldLookup, ldCombobox], False)]
    property IrrfCompetencia: String  read FIRRF_COMPETENCIA write FIRRF_COMPETENCIA;
    [TColumn('IRRF_CODIGO_RECOLHIMENTO', 'Irrf Codigo Recolhimento', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IrrfCodigoRecolhimento: Integer  read FIRRF_CODIGO_RECOLHIMENTO write FIRRF_CODIGO_RECOLHIMENTO;
    [TColumn('IRRF_VALOR_ACUMULADO', 'Irrf Valor Acumulado', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property IrrfValorAcumulado: Extended  read FIRRF_VALOR_ACUMULADO write FIRRF_VALOR_ACUMULADO;
    [TColumn('IRRF_DATA_PAGAMENTO', 'Irrf Data Pagamento', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property IrrfDataPagamento: TDateTime  read FIRRF_DATA_PAGAMENTO write FIRRF_DATA_PAGAMENTO;
    [TColumn('PIS_COMPETENCIA', 'Pis Competencia', 56, [ldGrid, ldLookup, ldCombobox], False)]
    property PisCompetencia: String  read FPIS_COMPETENCIA write FPIS_COMPETENCIA;
    [TColumn('PIS_VALOR_ACUMULADO', 'Pis Valor Acumulado', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property PisValorAcumulado: Extended  read FPIS_VALOR_ACUMULADO write FPIS_VALOR_ACUMULADO;
    [TColumn('PIS_DATA_PAGAMENTO', 'Pis Data Pagamento', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property PisDataPagamento: TDateTime  read FPIS_DATA_PAGAMENTO write FPIS_DATA_PAGAMENTO;


    //Transientes



  end;

implementation


initialization
  Classes.RegisterClass(TGuiasAcumuladasVO);

finalization
  Classes.UnRegisterClass(TGuiasAcumuladasVO);

end.
