{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [OS_ABERTURA] 
                                                                                
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
unit OsAberturaVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils,
  OsProdutoServicoVO, OsAberturaEquipamentoVO, OsEvolucaoVO;

type
  [TEntity]
  [TTable('OS_ABERTURA')]
  TOsAberturaVO = class(TVO)
  private
    FID: Integer;
    FID_OS_STATUS: Integer;
    FID_COLABORADOR: Integer;
    FID_CLIENTE: Integer;
    FNUMERO: String;
    FDATA_INICIO: TDateTime;
    FHORA_INICIO: String;
    FDATA_PREVISAO: TDateTime;
    FHORA_PREVISAO: String;
    FDATA_FIM: TDateTime;
    FHORA_FIM: String;
    FNOME_CONTATO: String;
    FFONE_CONTATO: String;
    FOBSERVACAO_CLIENTE: String;
    FOBSERVACAO_ABERTURA: String;

    FListaOsProdutoServicoVO: TObjectList<TOsProdutoServicoVO>;
    FListaOsEquipamentoVO: TObjectList<TOsAberturaEquipamentoVO>;
    FListaOsEvolucaoVO: TObjectList<TOsEvolucaoVO>;

  public
    constructor Create; override;
    destructor Destroy; override;

    [TId('ID', [ldGrid, ldLookup, ldComboBox])]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;
    [TColumn('ID_OS_STATUS', 'Id Os Status', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdOsStatus: Integer  read FID_OS_STATUS write FID_OS_STATUS;
    [TColumn('ID_COLABORADOR', 'Id Colaborador', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdColaborador: Integer  read FID_COLABORADOR write FID_COLABORADOR;
    [TColumn('ID_CLIENTE', 'Id Cliente', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdCliente: Integer  read FID_CLIENTE write FID_CLIENTE;
    [TColumn('NUMERO', 'Numero', 160, [ldGrid, ldLookup, ldCombobox], False)]
    property Numero: String  read FNUMERO write FNUMERO;
    [TColumn('DATA_INICIO', 'Data Inicio', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property DataInicio: TDateTime  read FDATA_INICIO write FDATA_INICIO;
    [TColumn('HORA_INICIO', 'Hora Inicio', 64, [ldGrid, ldLookup, ldCombobox], False)]
    property HoraInicio: String  read FHORA_INICIO write FHORA_INICIO;
    [TColumn('DATA_PREVISAO', 'Data Previsao', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property DataPrevisao: TDateTime  read FDATA_PREVISAO write FDATA_PREVISAO;
    [TColumn('HORA_PREVISAO', 'Hora Previsao', 64, [ldGrid, ldLookup, ldCombobox], False)]
    property HoraPrevisao: String  read FHORA_PREVISAO write FHORA_PREVISAO;
    [TColumn('DATA_FIM', 'Data Fim', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property DataFim: TDateTime  read FDATA_FIM write FDATA_FIM;
    [TColumn('HORA_FIM', 'Hora Fim', 64, [ldGrid, ldLookup, ldCombobox], False)]
    property HoraFim: String  read FHORA_FIM write FHORA_FIM;
    [TColumn('NOME_CONTATO', 'Nome Contato', 400, [ldGrid, ldLookup, ldCombobox], False)]
    property NomeContato: String  read FNOME_CONTATO write FNOME_CONTATO;
    [TColumn('FONE_CONTATO', 'Fone Contato', 120, [ldGrid, ldLookup, ldCombobox], False)]
    property FoneContato: String  read FFONE_CONTATO write FFONE_CONTATO;
    [TColumn('OBSERVACAO_CLIENTE', 'Observacao Cliente', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property ObservacaoCliente: String  read FOBSERVACAO_CLIENTE write FOBSERVACAO_CLIENTE;
    [TColumn('OBSERVACAO_ABERTURA', 'Observacao Abertura', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property ObservacaoAbertura: String  read FOBSERVACAO_ABERTURA write FOBSERVACAO_ABERTURA;


    [TManyValuedAssociation('ID_OS_ABERTURA', 'ID')]
    property ListaOsProdutoServicoVO: TObjectList<TOsProdutoServicoVO> read FListaOsProdutoServicoVO write FListaOsProdutoServicoVO;

    [TManyValuedAssociation('ID_OS_ABERTURA', 'ID')]
    property ListaOsEquipamentoVO: TObjectList<TOsAberturaEquipamentoVO> read FListaOsEquipamentoVO write FListaOsEquipamentoVO;

    [TManyValuedAssociation('ID_OS_ABERTURA', 'ID')]
    property ListaOsEvolucaoVO: TObjectList<TOsEvolucaoVO> read FListaOsEvolucaoVO write FListaOsEvolucaoVO;



  end;

implementation

constructor TOsAberturaVO.Create;
begin
  inherited;

  FListaOsProdutoServicoVO := TObjectList<TOsProdutoServicoVO>.Create;
  FListaOsEquipamentoVO := TObjectList<TOsAberturaEquipamentoVO>.Create;
  FListaOsEvolucaoVO := TObjectList<TOsEvolucaoVO>.Create;
end;

destructor TOsAberturaVO.Destroy;
begin
  FreeAndNil(FListaOsProdutoServicoVO);
  FreeAndNil(FListaOsEquipamentoVO);
  FreeAndNil(FListaOsEvolucaoVO);

  inherited;
end;


initialization
  Classes.RegisterClass(TOsAberturaVO);

finalization
  Classes.UnRegisterClass(TOsAberturaVO);

end.
