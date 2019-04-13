{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [CTE_AQUAVIARIO_BALSA] 
                                                                                
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
unit CteAquaviarioBalsaVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils;

type
  [TEntity]
  [TTable('CTE_AQUAVIARIO_BALSA')]
  TCteAquaviarioBalsaVO = class(TVO)
  private
    FID: Integer;
    FID_CTE_AQUAVIARIO: Integer;
    FID_BALSA: String;
    FNUMERO_VIAGEM: Integer;
    FDIRECAO: String;
    FPORTO_EMBARQUE: String;
    FPORTO_TRANSBORDO: String;
    FPORTO_DESTINO: String;
    FTIPO_NAVEGACAO: Integer;
    FIRIN: String;

    //Transientes



  public 
    [TId('ID', [ldGrid, ldLookup, ldComboBox])]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;
    [TColumn('ID_CTE_AQUAVIARIO', 'Id Cte Aquaviario', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdCteAquaviario: Integer  read FID_CTE_AQUAVIARIO write FID_CTE_AQUAVIARIO;
    [TColumn('ID_BALSA', 'Id Balsa', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property IdBalsa: String  read FID_BALSA write FID_BALSA;
    [TColumn('NUMERO_VIAGEM', 'Numero Viagem', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property NumeroViagem: Integer  read FNUMERO_VIAGEM write FNUMERO_VIAGEM;
    [TColumn('DIRECAO', 'Direcao', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property Direcao: String  read FDIRECAO write FDIRECAO;
    [TColumn('PORTO_EMBARQUE', 'Porto Embarque', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property PortoEmbarque: String  read FPORTO_EMBARQUE write FPORTO_EMBARQUE;
    [TColumn('PORTO_TRANSBORDO', 'Porto Transbordo', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property PortoTransbordo: String  read FPORTO_TRANSBORDO write FPORTO_TRANSBORDO;
    [TColumn('PORTO_DESTINO', 'Porto Destino', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property PortoDestino: String  read FPORTO_DESTINO write FPORTO_DESTINO;
    [TColumn('TIPO_NAVEGACAO', 'Tipo Navegacao', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property TipoNavegacao: Integer  read FTIPO_NAVEGACAO write FTIPO_NAVEGACAO;
    [TColumn('IRIN', 'Irin', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property Irin: String  read FIRIN write FIRIN;


    //Transientes



  end;

implementation


initialization
  Classes.RegisterClass(TCteAquaviarioBalsaVO);

finalization
  Classes.UnRegisterClass(TCteAquaviarioBalsaVO);

end.
