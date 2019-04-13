{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [ECF_CONFIGURACAO_BALANCA] 
                                                                                
The MIT License                                                                 
                                                                                
Copyright: Copyright (C) 2010 T2Ti.COM                                          
                                                                                
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
@version 1.0                                                                    
*******************************************************************************}
unit EcfConfiguracaoBalancaVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils;

type
  [TEntity]
  [TTable('ECF_CONFIGURACAO_BALANCA')]
  TEcfConfiguracaoBalancaVO = class(TVO)
  private
    FID: Integer;
    FID_ECF_CONFIGURACAO: Integer;
    FMODELO: Integer;
    FIDENTIFICADOR: String;
    FHAND_SHAKE: Integer;
    FPARITY: Integer;
    FSTOP_BITS: Integer;
    FDATA_BITS: Integer;
    FBAUD_RATE: Integer;
    FPORTA: String;
    FTIMEOUT: Integer;
    FTIPO_CONFIGURACAO: String;

  public 
    [TId('ID')]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;
    [TColumn('ID_ECF_CONFIGURACAO', 'Id Ecf Configuracao', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdEcfConfiguracao: Integer  read FID_ECF_CONFIGURACAO write FID_ECF_CONFIGURACAO;
    [TColumn('MODELO', 'Modelo', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Modelo: Integer  read FMODELO write FMODELO;
    [TColumn('IDENTIFICADOR', 'Identificador', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property Identificador: String  read FIDENTIFICADOR write FIDENTIFICADOR;
    [TColumn('HAND_SHAKE', 'Hand Shake', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property HandShake: Integer  read FHAND_SHAKE write FHAND_SHAKE;
    [TColumn('PARITY', 'Parity', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Parity: Integer  read FPARITY write FPARITY;
    [TColumn('STOP_BITS', 'Stop Bits', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property StopBits: Integer  read FSTOP_BITS write FSTOP_BITS;
    [TColumn('DATA_BITS', 'Data Bits', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property DataBits: Integer  read FDATA_BITS write FDATA_BITS;
    [TColumn('BAUD_RATE', 'Baud Rate', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property BaudRate: Integer  read FBAUD_RATE write FBAUD_RATE;
    [TColumn('PORTA', 'Porta', 32, [ldGrid, ldLookup, ldCombobox], False)]
    property Porta: String  read FPORTA write FPORTA;
    [TColumn('TIMEOUT', 'Timeout', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Timeout: Integer  read FTIMEOUT write FTIMEOUT;
    [TColumn('TIPO_CONFIGURACAO', 'Tipo Configuracao', 160, [ldGrid, ldLookup, ldCombobox], False)]
    property TipoConfiguracao: String  read FTIPO_CONFIGURACAO write FTIPO_CONFIGURACAO;

  end;

implementation


initialization
  Classes.RegisterClass(TEcfConfiguracaoBalancaVO);

finalization
  Classes.UnRegisterClass(TEcfConfiguracaoBalancaVO);

end.
