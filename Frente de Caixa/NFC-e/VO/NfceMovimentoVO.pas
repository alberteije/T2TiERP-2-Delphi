{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [NFCE_MOVIMENTO] 
                                                                                
The MIT License                                                                 
                                                                                
Copyright: Copyright (C) 2014 T2Ti.COM                                          
                                                                                
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
unit NfceMovimentoVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils,
  NfceCaixaVO, EmpresaVO, NfceTurnoVO, NfceOperadorVO,
  NfceFechamentoVO, NfceSuprimentoVO, NfceSangriaVO;

type
  [TEntity]
  [TTable('NFCE_MOVIMENTO')]
  TNfceMovimentoVO = class(TVO)
  private
    FID: Integer;
    FID_NFCE_CAIXA: Integer;
    FID_NFCE_OPERADOR: Integer;
    FID_NFCE_TURNO: Integer;
    FID_EMPRESA: Integer;
    FID_GERENTE_SUPERVISOR: Integer;
    FDATA_ABERTURA: TDateTime;
    FHORA_ABERTURA: String;
    FDATA_FECHAMENTO: TDateTime;
    FHORA_FECHAMENTO: String;
    FTOTAL_SUPRIMENTO: Extended;
    FTOTAL_SANGRIA: Extended;
    FTOTAL_NAO_FISCAL: Extended;
    FTOTAL_VENDA: Extended;
    FTOTAL_DESCONTO: Extended;
    FTOTAL_ACRESCIMO: Extended;
    FTOTAL_FINAL: Extended;
    FTOTAL_RECEBIDO: Extended;
    FTOTAL_TROCO: Extended;
    FTOTAL_CANCELADO: Extended;
    FSTATUS_MOVIMENTO: String;

    FNfceCaixaVO: TNfceCaixaVO;
    FEmpresaVO: TEmpresaVO;
    FNfceTurnoVO: TNfceTurnoVO;
    FNfceOperadorVO: TNfceOperadorVO;
    FNfceGerenteVO: TNfceOperadorVO;

    FListaNfceFechamentoVO: TObjectList<TNfceFechamentoVO>;
    FListaNfceSuprimentoVO: TObjectList<TNfceSuprimentoVO>;
    FListaNfceSangriaVO: TObjectList<TNfceSangriaVO>;
	
  public 
    constructor Create; override;
    destructor Destroy; override;

    [TId('ID')]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;
    [TColumn('ID_NFCE_CAIXA', 'Id Nfce Caixa', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdNfceCaixa: Integer  read FID_NFCE_CAIXA write FID_NFCE_CAIXA;
    [TColumn('ID_NFCE_OPERADOR', 'Id Nfce Operador', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdNfceOperador: Integer  read FID_NFCE_OPERADOR write FID_NFCE_OPERADOR;
    [TColumn('ID_NFCE_TURNO', 'Id Nfce Turno', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdNfceTurno: Integer  read FID_NFCE_TURNO write FID_NFCE_TURNO;
    [TColumn('ID_EMPRESA', 'Id Empresa', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdEmpresa: Integer  read FID_EMPRESA write FID_EMPRESA;
    [TColumn('ID_GERENTE_SUPERVISOR', 'Id Gerente Supervisor', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdGerenteSupervisor: Integer  read FID_GERENTE_SUPERVISOR write FID_GERENTE_SUPERVISOR;
    [TColumn('DATA_ABERTURA', 'Data Abertura', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property DataAbertura: TDateTime  read FDATA_ABERTURA write FDATA_ABERTURA;
    [TColumn('HORA_ABERTURA', 'Hora Abertura', 64, [ldGrid, ldLookup, ldCombobox], False)]
    property HoraAbertura: String  read FHORA_ABERTURA write FHORA_ABERTURA;
    [TColumn('DATA_FECHAMENTO', 'Data Fechamento', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property DataFechamento: TDateTime  read FDATA_FECHAMENTO write FDATA_FECHAMENTO;
    [TColumn('HORA_FECHAMENTO', 'Hora Fechamento', 64, [ldGrid, ldLookup, ldCombobox], False)]
    property HoraFechamento: String  read FHORA_FECHAMENTO write FHORA_FECHAMENTO;
    [TColumn('TOTAL_SUPRIMENTO', 'Total Suprimento', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property TotalSuprimento: Extended  read FTOTAL_SUPRIMENTO write FTOTAL_SUPRIMENTO;
    [TColumn('TOTAL_SANGRIA', 'Total Sangria', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property TotalSangria: Extended  read FTOTAL_SANGRIA write FTOTAL_SANGRIA;
    [TColumn('TOTAL_NAO_FISCAL', 'Total Nao Fiscal', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property TotalNaoFiscal: Extended  read FTOTAL_NAO_FISCAL write FTOTAL_NAO_FISCAL;
    [TColumn('TOTAL_VENDA', 'Total Venda', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property TotalVenda: Extended  read FTOTAL_VENDA write FTOTAL_VENDA;
    [TColumn('TOTAL_DESCONTO', 'Total Desconto', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property TotalDesconto: Extended  read FTOTAL_DESCONTO write FTOTAL_DESCONTO;
    [TColumn('TOTAL_ACRESCIMO', 'Total Acrescimo', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property TotalAcrescimo: Extended  read FTOTAL_ACRESCIMO write FTOTAL_ACRESCIMO;
    [TColumn('TOTAL_FINAL', 'Total Final', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property TotalFinal: Extended  read FTOTAL_FINAL write FTOTAL_FINAL;
    [TColumn('TOTAL_RECEBIDO', 'Total Recebido', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property TotalRecebido: Extended  read FTOTAL_RECEBIDO write FTOTAL_RECEBIDO;
    [TColumn('TOTAL_TROCO', 'Total Troco', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property TotalTroco: Extended  read FTOTAL_TROCO write FTOTAL_TROCO;
    [TColumn('TOTAL_CANCELADO', 'Total Cancelado', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property TotalCancelado: Extended  read FTOTAL_CANCELADO write FTOTAL_CANCELADO;
    [TColumn('STATUS_MOVIMENTO', 'Status Movimento', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property StatusMovimento: String  read FSTATUS_MOVIMENTO write FSTATUS_MOVIMENTO;


    [TAssociation('ID', 'ID_NFCE_CAIXA')]
    property NfceCaixaVO: TNfceCaixaVO read FNfceCaixaVO write FNfceCaixaVO;

    [TAssociation('ID', 'ID_NFCE_EMPRESA')]
    property NfceEmpresaVO: TEmpresaVO read FEmpresaVO write FEmpresaVO;

    [TAssociation('ID', 'ID_NFCE_TURNO')]
    property NfceTurnoVO: TNfceTurnoVO read FNfceTurnoVO write FNfceTurnoVO;

    [TAssociation('ID', 'ID_NFCE_OPERADOR')]
    property NfceOperadorVO: TNfceOperadorVO read FNfceOperadorVO write FNfceOperadorVO;

    [TAssociation('ID', 'ID_GERENTE_SUPERVISOR')]
    property NfceGerenteVO: TNfceOperadorVO read FNfceGerenteVO write FNfceGerenteVO;

    [TManyValuedAssociation('ID_NFCE_MOVIMENTO', 'ID')]
    property ListaNfceFechamentoVO: TObjectList<TNfceFechamentoVO> read FListaNfceFechamentoVO write FListaNfceFechamentoVO;

    [TManyValuedAssociation('ID_NFCE_MOVIMENTO', 'ID')]
    property ListaNfceSuprimentoVO: TObjectList<TNfceSuprimentoVO> read FListaNfceSuprimentoVO write FListaNfceSuprimentoVO;

    [TManyValuedAssociation('ID_NFCE_MOVIMENTO', 'ID')]
    property ListaNfceSangriaVO: TObjectList<TNfceSangriaVO> read FListaNfceSangriaVO write FListaNfceSangriaVO;

  end;

implementation

constructor TNfceMovimentoVO.Create;
begin
  inherited;

  FNfceCaixaVO := TNfceCaixaVO.Create;
  FEmpresaVO := TEmpresaVO.Create;
  FNfceTurnoVO := TNfceTurnoVO.Create;
  FNfceOperadorVO := TNfceOperadorVO.Create;
  FNfceGerenteVO := TNfceOperadorVO.Create;

  FListaNfceFechamentoVO := TObjectList<TNfceFechamentoVO>.Create;
  FListaNfceSuprimentoVO := TObjectList<TNfceSuprimentoVO>.Create;
  FListaNfceSangriaVO := TObjectList<TNfceSangriaVO>.Create;
end;

destructor TNfceMovimentoVO.Destroy;
begin
  FreeAndNil(FNfceCaixaVO);
  FreeAndNil(FEmpresaVO);
  FreeAndNil(FNfceTurnoVO);
  FreeAndNil(FNfceOperadorVO);
  FreeAndNil(FNfceGerenteVO);

  FreeAndNil(FListaNfceFechamentoVO);
  FreeAndNil(FListaNfceSuprimentoVO);
  FreeAndNil(FListaNfceSangriaVO);

  inherited;
end;

initialization
  Classes.RegisterClass(TNfceMovimentoVO);

finalization
  Classes.UnRegisterClass(TNfceMovimentoVO);

end.
