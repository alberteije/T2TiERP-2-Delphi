{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [WMS_RECEBIMENTO_CABECALHO] 
                                                                                
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
unit WmsRecebimentoCabecalhoVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils,
  WmsRecebimentoDetalheVO;

type
  [TEntity]
  [TTable('WMS_RECEBIMENTO_CABECALHO')]
  TWmsRecebimentoCabecalhoVO = class(TVO)
  private
    FID: Integer;
    FID_WMS_AGENDAMENTO: Integer;
    FDATA_RECEBIMENTO: TDateTime;
    FHORA_INICIO: String;
    FHORA_FIM: String;
    FVOLUME_RECEBIDO: Integer;
    FPESO_RECEBIDO: Extended;
    FINCONSISTENCIA: String;
    FOBSERVACAO: String;

    //Transientes
    FListaWmsRecebimentoDetalheVO: TObjectList<TWmsRecebimentoDetalheVO>;



  public
    constructor Create; override;
    destructor Destroy; override;

    [TId('ID', [ldGrid, ldLookup, ldComboBox])]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;
    [TColumn('ID_WMS_AGENDAMENTO', 'Id Wms Agendamento', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdWmsAgendamento: Integer  read FID_WMS_AGENDAMENTO write FID_WMS_AGENDAMENTO;
    [TColumn('DATA_RECEBIMENTO', 'Data Recebimento', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property DataRecebimento: TDateTime  read FDATA_RECEBIMENTO write FDATA_RECEBIMENTO;
    [TColumn('HORA_INICIO', 'Hora Inicio', 64, [ldGrid, ldLookup, ldCombobox], False)]
    property HoraInicio: String  read FHORA_INICIO write FHORA_INICIO;
    [TColumn('HORA_FIM', 'Hora Fim', 64, [ldGrid, ldLookup, ldCombobox], False)]
    property HoraFim: String  read FHORA_FIM write FHORA_FIM;
    [TColumn('VOLUME_RECEBIDO', 'Volume Recebido', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property VolumeRecebido: Integer  read FVOLUME_RECEBIDO write FVOLUME_RECEBIDO;
    [TColumn('PESO_RECEBIDO', 'Peso Recebido', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property PesoRecebido: Extended  read FPESO_RECEBIDO write FPESO_RECEBIDO;
    [TColumn('INCONSISTENCIA', 'Inconsistencia', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property Inconsistencia: String  read FINCONSISTENCIA write FINCONSISTENCIA;
    [TColumn('OBSERVACAO', 'Observacao', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property Observacao: String  read FOBSERVACAO write FOBSERVACAO;


    //Transientes
    [TManyValuedAssociation('ID_WMS_RECEBIMENTO_CABECALHO', 'ID')]
    property ListaWmsRecebimentoDetalheVO: TObjectList<TWmsRecebimentoDetalheVO> read FListaWmsRecebimentoDetalheVO write FListaWmsRecebimentoDetalheVO;

end;

implementation

constructor TWmsRecebimentoCabecalhoVO.Create;
begin
  inherited;

  FListaWmsRecebimentoDetalheVO := TObjectList<TWmsRecebimentoDetalheVO>.Create;
end;

destructor TWmsRecebimentoCabecalhoVO.Destroy;
begin
  FreeAndNil(FListaWmsRecebimentoDetalheVO);

  inherited;
end;


initialization
  Classes.RegisterClass(TWmsRecebimentoCabecalhoVO);

finalization
  Classes.UnRegisterClass(TWmsRecebimentoCabecalhoVO);

end.
