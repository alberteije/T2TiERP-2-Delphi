{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [FOLHA_RESCISAO] 
                                                                                
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
unit FolhaRescisaoVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils, DB,
  ViewPessoaColaboradorVO;

type
  [TEntity]
  [TTable('FOLHA_RESCISAO')]
  TFolhaRescisaoVO = class(TVO)
  private
    FID: Integer;
    FID_COLABORADOR: Integer;
    FDATA_DEMISSAO: TDateTime;
    FDATA_PAGAMENTO: TDateTime;
    FMOTIVO: String;
    FMOTIVO_ESOCIAL: String;
    FDATA_AVISO_PREVIO: TDateTime;
    FDIAS_AVISO_PREVIO: Integer;
    FCOMPROVOU_NOVO_EMPREGO: String;
    FDISPENSOU_EMPREGADO: String;
    FPENSAO_ALIMENTICIA: Extended;
    FPENSAO_ALIMENTICIA_FGTS: Extended;
    FFGTS_VALOR_RESCISAO: Extended;
    FFGTS_SALDO_BANCO: Extended;
    FFGTS_COMPLEMENTO_SALDO: Extended;
    FFGTS_CODIGO_AFASTAMENTO: String;
    FFGTS_CODIGO_SAQUE: String;

    //Transientes
    FColaboradorNome: String;

    FColaboradorVO: TViewPessoaColaboradorVO;



  public
    constructor Create; override;
    destructor Destroy; override;

    [TId('ID', [ldGrid, ldLookup, ldComboBox])]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;

    [TColumn('ID_COLABORADOR', 'Id Colaborador', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdColaborador: Integer  read FID_COLABORADOR write FID_COLABORADOR;
    [TColumnDisplay('COLABORADOR.NOME', 'Colaborador', 250, [ldGrid, ldLookup, ldCombobox], ftString, 'ViewPessoaColaboradorVO.TViewPessoaColaboradorVO', True)]
    property ColaboradorNome: String read FColaboradorNome write FColaboradorNome;

    [TColumn('DATA_DEMISSAO', 'Data Demissao', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property DataDemissao: TDateTime  read FDATA_DEMISSAO write FDATA_DEMISSAO;
    [TColumn('DATA_PAGAMENTO', 'Data Pagamento', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property DataPagamento: TDateTime  read FDATA_PAGAMENTO write FDATA_PAGAMENTO;
    [TColumn('MOTIVO', 'Motivo', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property Motivo: String  read FMOTIVO write FMOTIVO;
    [TColumn('MOTIVO_ESOCIAL', 'Motivo Esocial', 16, [ldGrid, ldLookup, ldCombobox], False)]
    property MotivoEsocial: String  read FMOTIVO_ESOCIAL write FMOTIVO_ESOCIAL;
    [TColumn('DATA_AVISO_PREVIO', 'Data Aviso Previo', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property DataAvisoPrevio: TDateTime  read FDATA_AVISO_PREVIO write FDATA_AVISO_PREVIO;
    [TColumn('DIAS_AVISO_PREVIO', 'Dias Aviso Previo', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property DiasAvisoPrevio: Integer  read FDIAS_AVISO_PREVIO write FDIAS_AVISO_PREVIO;
    [TColumn('COMPROVOU_NOVO_EMPREGO', 'Comprovou Novo Emprego', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property ComprovouNovoEmprego: String  read FCOMPROVOU_NOVO_EMPREGO write FCOMPROVOU_NOVO_EMPREGO;
    [TColumn('DISPENSOU_EMPREGADO', 'Dispensou Empregado', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property DispensouEmpregado: String  read FDISPENSOU_EMPREGADO write FDISPENSOU_EMPREGADO;
    [TColumn('PENSAO_ALIMENTICIA', 'Pensao Alimenticia', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property PensaoAlimenticia: Extended  read FPENSAO_ALIMENTICIA write FPENSAO_ALIMENTICIA;
    [TColumn('PENSAO_ALIMENTICIA_FGTS', 'Pensao Alimenticia Fgts', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property PensaoAlimenticiaFgts: Extended  read FPENSAO_ALIMENTICIA_FGTS write FPENSAO_ALIMENTICIA_FGTS;
    [TColumn('FGTS_VALOR_RESCISAO', 'Fgts Valor Rescisao', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property FgtsValorRescisao: Extended  read FFGTS_VALOR_RESCISAO write FFGTS_VALOR_RESCISAO;
    [TColumn('FGTS_SALDO_BANCO', 'Fgts Saldo Banco', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property FgtsSaldoBanco: Extended  read FFGTS_SALDO_BANCO write FFGTS_SALDO_BANCO;
    [TColumn('FGTS_COMPLEMENTO_SALDO', 'Fgts Complemento Saldo', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property FgtsComplementoSaldo: Extended  read FFGTS_COMPLEMENTO_SALDO write FFGTS_COMPLEMENTO_SALDO;
    [TColumn('FGTS_CODIGO_AFASTAMENTO', 'Fgts Codigo Afastamento', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property FgtsCodigoAfastamento: String  read FFGTS_CODIGO_AFASTAMENTO write FFGTS_CODIGO_AFASTAMENTO;
    [TColumn('FGTS_CODIGO_SAQUE', 'Fgts Codigo Saque', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property FgtsCodigoSaque: String  read FFGTS_CODIGO_SAQUE write FFGTS_CODIGO_SAQUE;


    //Transientes
    [TAssociation('ID', 'ID_COLABORADOR')]
    property ColaboradorVO: TViewPessoaColaboradorVO read FColaboradorVO write FColaboradorVO;



  end;

implementation

constructor TFolhaRescisaoVO.Create;
begin
  inherited;

  FColaboradorVO := TViewPessoaColaboradorVO.Create;
end;

destructor TFolhaRescisaoVO.Destroy;
begin
  FreeAndNil(FColaboradorVO);

  inherited;
end;

initialization
  Classes.RegisterClass(TFolhaRescisaoVO);

finalization
  Classes.UnRegisterClass(TFolhaRescisaoVO);

end.
