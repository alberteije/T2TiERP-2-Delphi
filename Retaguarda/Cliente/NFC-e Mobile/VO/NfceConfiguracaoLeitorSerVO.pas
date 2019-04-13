{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [NFCE_CONFIGURACAO_LEITOR_SER] 
                                                                                
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
unit NfceConfiguracaoLeitorSerVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils;

type
  [TEntity]
  [TTable('NFCE_CONFIGURACAO_LEITOR_SER')]
  TNfceConfiguracaoLeitorSerVO = class(TVO)
  private
    FID: Integer;
    FID_NFCE_CONFIGURACAO: Integer;
    FUSA: String;
    FPORTA: String;
    FBAUD: Integer;
    FHAND_SHAKE: Integer;
    FPARITY: Integer;
    FSTOP_BITS: Integer;
    FDATA_BITS: Integer;
    FINTERVALO: Integer;
    FUSAR_FILA: String;
    FHARD_FLOW: String;
    FSOFT_FLOW: String;
    FSUFIXO: String;
    FEXCLUIR_SUFIXO: String;

  public 
    [TId('ID')]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;
    [TColumn('ID_NFCE_CONFIGURACAO', 'Id Configuracao', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdNfceConfiguracao: Integer  read FID_NFCE_CONFIGURACAO write FID_NFCE_CONFIGURACAO;
    [TColumn('USA', 'Usa', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property Usa: String  read FUSA write FUSA;
    [TColumn('PORTA', 'Porta', 32, [ldGrid, ldLookup, ldCombobox], False)]
    property Porta: String  read FPORTA write FPORTA;
    [TColumn('BAUD', 'Baud', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Baud: Integer  read FBAUD write FBAUD;
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
    [TColumn('INTERVALO', 'Intervalo', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Intervalo: Integer  read FINTERVALO write FINTERVALO;
    [TColumn('USAR_FILA', 'Usar Fila', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property UsarFila: String  read FUSAR_FILA write FUSAR_FILA;
    [TColumn('HARD_FLOW', 'Hard Flow', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property HardFlow: String  read FHARD_FLOW write FHARD_FLOW;
    [TColumn('SOFT_FLOW', 'Soft Flow', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property SoftFlow: String  read FSOFT_FLOW write FSOFT_FLOW;
    [TColumn('SUFIXO', 'Sufixo', 160, [ldGrid, ldLookup, ldCombobox], False)]
    property Sufixo: String  read FSUFIXO write FSUFIXO;
    [TColumn('EXCLUIR_SUFIXO', 'Excluir Sufixo', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property ExcluirSufixo: String  read FEXCLUIR_SUFIXO write FEXCLUIR_SUFIXO;

  end;

implementation


initialization
  Classes.RegisterClass(TNfceConfiguracaoLeitorSerVO);

finalization
  Classes.UnRegisterClass(TNfceConfiguracaoLeitorSerVO);

end.
