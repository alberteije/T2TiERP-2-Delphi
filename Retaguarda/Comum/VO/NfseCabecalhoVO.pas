{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [NFSE_CABECALHO] 
                                                                                
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
unit NfseCabecalhoVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils,
  NFSeDetalheVO, NFSeIntermediarioVO;

type
  [TEntity]
  [TTable('NFSE_CABECALHO')]
  TNfseCabecalhoVO = class(TVO)
  private
    FID: Integer;
    FID_OS_ABERTURA: Integer;
    FID_CLIENTE: Integer;
    FID_EMPRESA: Integer;
    FNUMERO: String;
    FCODIGO_VERIFICACAO: String;
    FDATA_HORA_EMISSAO: TDateTime;
    FCOMPETENCIA: String;
    FNUMERO_SUBSTITUIDA: String;
    FNATUREZA_OPERACAO: Integer;
    FREGIME_ESPECIAL_TRIBUTACAO: Integer;
    FOPTANTE_SIMPLES_NACIONAL: String;
    FINCENTIVADOR_CULTURAL: String;
    FNUMERO_RPS: String;
    FSERIE_RPS: String;
    FTIPO_RPS: Integer;
    FDATA_EMISSAO_RPS: TDateTime;
    FOUTRAS_INFORMACOES: String;
    FCODIGO_OBRA: String;
    FNUMERO_ART: String;

    //Transientes
    FListaNFSeDetalheVO: TObjectList<TNFSeDetalheVO>;
    FListaNFSeIntermediarioVO: TObjectList<TNFSeIntermediarioVO>;


  public
    constructor Create; override;
    destructor Destroy; override;

    [TId('ID', [ldGrid, ldLookup, ldComboBox])]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;
    [TColumn('ID_OS_ABERTURA', 'Id Os Abertura', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdOsAbertura: Integer  read FID_OS_ABERTURA write FID_OS_ABERTURA;
    [TColumn('ID_CLIENTE', 'Id Cliente', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdCliente: Integer  read FID_CLIENTE write FID_CLIENTE;
    [TColumn('ID_EMPRESA', 'Id Empresa', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdEmpresa: Integer  read FID_EMPRESA write FID_EMPRESA;
    [TColumn('NUMERO', 'Numero', 120, [ldGrid, ldLookup, ldCombobox], False)]
    property Numero: String  read FNUMERO write FNUMERO;
    [TColumn('CODIGO_VERIFICACAO', 'Codigo Verificacao', 72, [ldGrid, ldLookup, ldCombobox], False)]
    property CodigoVerificacao: String  read FCODIGO_VERIFICACAO write FCODIGO_VERIFICACAO;
    [TColumn('DATA_HORA_EMISSAO', 'Data Hora Emissao', 272, [ldGrid, ldLookup, ldCombobox], False)]
    property DataHoraEmissao: TDateTime  read FDATA_HORA_EMISSAO write FDATA_HORA_EMISSAO;
    [TColumn('COMPETENCIA', 'Competencia', 48, [ldGrid, ldLookup, ldCombobox], False)]
    property Competencia: String  read FCOMPETENCIA write FCOMPETENCIA;
    [TColumn('NUMERO_SUBSTITUIDA', 'Numero Substituida', 120, [ldGrid, ldLookup, ldCombobox], False)]
    property NumeroSubstituida: String  read FNUMERO_SUBSTITUIDA write FNUMERO_SUBSTITUIDA;
    [TColumn('NATUREZA_OPERACAO', 'Natureza Operacao', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property NaturezaOperacao: Integer  read FNATUREZA_OPERACAO write FNATUREZA_OPERACAO;
    [TColumn('REGIME_ESPECIAL_TRIBUTACAO', 'Regime Especial Tributacao', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property RegimeEspecialTributacao: Integer  read FREGIME_ESPECIAL_TRIBUTACAO write FREGIME_ESPECIAL_TRIBUTACAO;
    [TColumn('OPTANTE_SIMPLES_NACIONAL', 'Optante Simples Nacional', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property OptanteSimplesNacional: String  read FOPTANTE_SIMPLES_NACIONAL write FOPTANTE_SIMPLES_NACIONAL;
    [TColumn('INCENTIVADOR_CULTURAL', 'Incentivador Cultural', 8, [ldGrid, ldLookup, ldCombobox], False)]
    property IncentivadorCultural: String  read FINCENTIVADOR_CULTURAL write FINCENTIVADOR_CULTURAL;
    [TColumn('NUMERO_RPS', 'Numero Rps', 120, [ldGrid, ldLookup, ldCombobox], False)]
    property NumeroRps: String  read FNUMERO_RPS write FNUMERO_RPS;
    [TColumn('SERIE_RPS', 'Serie Rps', 40, [ldGrid, ldLookup, ldCombobox], False)]
    property SerieRps: String  read FSERIE_RPS write FSERIE_RPS;
    [TColumn('TIPO_RPS', 'Tipo Rps', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property TipoRps: Integer  read FTIPO_RPS write FTIPO_RPS;
    [TColumn('DATA_EMISSAO_RPS', 'Data Emissao Rps', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property DataEmissaoRps: TDateTime  read FDATA_EMISSAO_RPS write FDATA_EMISSAO_RPS;
    [TColumn('OUTRAS_INFORMACOES', 'Outras Informacoes', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property OutrasInformacoes: String  read FOUTRAS_INFORMACOES write FOUTRAS_INFORMACOES;
    [TColumn('CODIGO_OBRA', 'Codigo Obra', 120, [ldGrid, ldLookup, ldCombobox], False)]
    property CodigoObra: String  read FCODIGO_OBRA write FCODIGO_OBRA;
    [TColumn('NUMERO_ART', 'Numero Art', 120, [ldGrid, ldLookup, ldCombobox], False)]
    property NumeroArt: String  read FNUMERO_ART write FNUMERO_ART;


    //Transientes
    [TManyValuedAssociation('ID_NFSE_CABECALHO', 'ID')]
    property ListaNFSeDetalheVO: TObjectList<TNFSeDetalheVO> read FListaNfseDetalheVO write FListaNfseDetalheVO;


    //Transientes
    [TManyValuedAssociation('ID_NFSE_CABECALHO', 'ID')]
    property ListaNFSeIntermediarioVO: TObjectList<TNFSeIntermediarioVO> read FListaNFSeIntermediarioVO write FListaNFSeIntermediarioVO;

  end;

implementation

constructor TNfseCabecalhoVO.Create;
begin
  inherited;

  FListaNfseDetalheVO := TObjectList<TNFSeDetalheVO>.Create;
  FListaNFSeIntermediarioVO := TObjectList<TNFSeIntermediarioVO>.Create;
end;

destructor TNfseCabecalhoVO.Destroy;
begin
  FreeAndNil(FListaNfseDetalheVO);
  FreeAndNil(FListaNFSeIntermediarioVO);

  inherited;
end;

initialization
  Classes.RegisterClass(TNfseCabecalhoVO);

finalization
  Classes.UnRegisterClass(TNfseCabecalhoVO);

end.
