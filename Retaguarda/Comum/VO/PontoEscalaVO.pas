{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [PONTO_ESCALA] 
                                                                                
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
unit PontoEscalaVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils, DB,
  PontoTurmaVO;

type
  [TEntity]
  [TTable('PONTO_ESCALA')]
  TPontoEscalaVO = class(TVO)
  private
    FID: Integer;
    FID_EMPRESA: Integer;
    FNOME: String;
    FDESCONTO_HORA_DIA: String;
    FDESCONTO_DSR: String;
    FCODIGO_HORARIO_DOMINGO: String;
    FCODIGO_HORARIO_SEGUNDA: String;
    FCODIGO_HORARIO_TERCA: String;
    FCODIGO_HORARIO_QUARTA: String;
    FCODIGO_HORARIO_QUINTA: String;
    FCODIGO_HORARIO_SEXTA: String;
    FCODIGO_HORARIO_SABADO: String;

    //Transientes
    FListaPontoTurmaVO: TObjectList<TPontoTurmaVO>;


  public
    constructor Create; override;
    destructor Destroy; override;

    [TId('ID', [ldGrid, ldLookup, ldComboBox])]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;
    [TColumn('ID_EMPRESA', 'Id Empresa', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdEmpresa: Integer  read FID_EMPRESA write FID_EMPRESA;
    [TColumn('NOME', 'Nome', 400, [ldGrid, ldLookup, ldCombobox], False)]
    property Nome: String  read FNOME write FNOME;
    [TColumn('DESCONTO_HORA_DIA', 'Desconto Hora Dia', 64, [ldGrid, ldLookup, ldCombobox], False)]
    property DescontoHoraDia: String  read FDESCONTO_HORA_DIA write FDESCONTO_HORA_DIA;
    [TColumn('DESCONTO_DSR', 'Desconto Dsr', 64, [ldGrid, ldLookup, ldCombobox], False)]
    property DescontoDsr: String  read FDESCONTO_DSR write FDESCONTO_DSR;
    [TColumn('CODIGO_HORARIO_DOMINGO', 'Codigo Horario Domingo', 32, [ldGrid, ldLookup, ldCombobox], False)]
    property CodigoHorarioDomingo: String  read FCODIGO_HORARIO_DOMINGO write FCODIGO_HORARIO_DOMINGO;
    [TColumn('CODIGO_HORARIO_SEGUNDA', 'Codigo Horario Segunda', 32, [ldGrid, ldLookup, ldCombobox], False)]
    property CodigoHorarioSegunda: String  read FCODIGO_HORARIO_SEGUNDA write FCODIGO_HORARIO_SEGUNDA;
    [TColumn('CODIGO_HORARIO_TERCA', 'Codigo Horario Terca', 32, [ldGrid, ldLookup, ldCombobox], False)]
    property CodigoHorarioTerca: String  read FCODIGO_HORARIO_TERCA write FCODIGO_HORARIO_TERCA;
    [TColumn('CODIGO_HORARIO_QUARTA', 'Codigo Horario Quarta', 32, [ldGrid, ldLookup, ldCombobox], False)]
    property CodigoHorarioQuarta: String  read FCODIGO_HORARIO_QUARTA write FCODIGO_HORARIO_QUARTA;
    [TColumn('CODIGO_HORARIO_QUINTA', 'Codigo Horario Quinta', 32, [ldGrid, ldLookup, ldCombobox], False)]
    property CodigoHorarioQuinta: String  read FCODIGO_HORARIO_QUINTA write FCODIGO_HORARIO_QUINTA;
    [TColumn('CODIGO_HORARIO_SEXTA', 'Codigo Horario Sexta', 32, [ldGrid, ldLookup, ldCombobox], False)]
    property CodigoHorarioSexta: String  read FCODIGO_HORARIO_SEXTA write FCODIGO_HORARIO_SEXTA;
    [TColumn('CODIGO_HORARIO_SABADO', 'Codigo Horario Sabado', 32, [ldGrid, ldLookup, ldCombobox], False)]
    property CodigoHorarioSabado: String  read FCODIGO_HORARIO_SABADO write FCODIGO_HORARIO_SABADO;

    //Transientes
    [TManyValuedAssociation('ID_PONTO_ESCALA', 'ID')]
    property ListaPontoTurmaVO: TObjectList<TPontoTurmaVO> read FListaPontoTurmaVO write FListaPontoTurmaVO;

  end;

implementation

constructor TPontoEscalaVO.Create;
begin
  inherited;

  FListaPontoTurmaVO := TObjectList<TPontoTurmaVO>.Create;
end;

destructor TPontoEscalaVO.Destroy;
begin
  FreeAndNil(FListaPontoTurmaVO);

  inherited;
end;

initialization
  Classes.RegisterClass(TPontoEscalaVO);

finalization
  Classes.UnRegisterClass(TPontoEscalaVO);

end.
