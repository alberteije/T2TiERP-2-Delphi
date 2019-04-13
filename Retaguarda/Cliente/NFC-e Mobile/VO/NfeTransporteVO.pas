{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [NFE_TRANSPORTE] 
                                                                                
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
unit NfeTransporteVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils,

  NfeTransporteReboqueVO, NfeTransporteVolumeVO;

type
  [TEntity]
  [TTable('NFE_TRANSPORTE')]
  TNfeTransporteVO = class(TVO)
  private
    FID: Integer;
    FID_TRANSPORTADORA: Integer;
    FID_NFE_CABECALHO: Integer;
    FMODALIDADE_FRETE: Integer;
    FCPF_CNPJ: String;
    FNOME: String;
    FINSCRICAO_ESTADUAL: String;
    FEMPRESA_ENDERECO: String;
    FNOME_MUNICIPIO: String;
    FUF: String;
    FVALOR_SERVICO: Extended;
    FVALOR_BC_RETENCAO_ICMS: Extended;
    FALIQUOTA_RETENCAO_ICMS: Extended;
    FVALOR_ICMS_RETIDO: Extended;
    FCFOP: Integer;
    FMUNICIPIO: Integer;
    FPLACA_VEICULO: String;
    FUF_VEICULO: String;
    FRNTC_VEICULO: String;
    FVAGAO: String;
    FBALSA: String;

    //Usado no lado cliente para controlar quais registros serão persistidos
    FPersiste: String;

    // Grupo X - X22
    FListaNfeTransporteReboqueVO: TObjectList<TNfeTransporteReboqueVO>; //0:5
    // Grupo X - X26
    FListaNfeTransporteVolumeVO: TObjectList<TNfeTransporteVolumeVO>; //0:5000

  public 
    constructor Create; override;
    destructor Destroy; override;

    [TId('ID')]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;
    [TColumn('ID_TRANSPORTADORA', 'Id Transportadora', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdTransportadora: Integer  read FID_TRANSPORTADORA write FID_TRANSPORTADORA;
    [TColumn('ID_NFE_CABECALHO', 'Id Nfe Cabecalho', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdNfeCabecalho: Integer  read FID_NFE_CABECALHO write FID_NFE_CABECALHO;
    [TColumn('MODALIDADE_FRETE', 'Modalidade Frete', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property ModalidadeFrete: Integer  read FMODALIDADE_FRETE write FMODALIDADE_FRETE;
    [TColumn('CPF_CNPJ', 'Cpf Cnpj', 112, [ldGrid, ldLookup, ldCombobox], False)]
    property CpfCnpj: String  read FCPF_CNPJ write FCPF_CNPJ;
    [TColumn('NOME', 'Nome', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property Nome: String  read FNOME write FNOME;
    [TColumn('INSCRICAO_ESTADUAL', 'Inscricao Estadual', 112, [ldGrid, ldLookup, ldCombobox], False)]
    property InscricaoEstadual: String  read FINSCRICAO_ESTADUAL write FINSCRICAO_ESTADUAL;
    [TColumn('EMPRESA_ENDERECO', 'Empresa Endereco', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property EmpresaEndereco: String  read FEMPRESA_ENDERECO write FEMPRESA_ENDERECO;
    [TColumn('NOME_MUNICIPIO', 'Nome Municipio', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property NomeMunicipio: String  read FNOME_MUNICIPIO write FNOME_MUNICIPIO;
    [TColumn('UF', 'Uf', 16, [ldGrid, ldLookup, ldCombobox], False)]
    property Uf: String  read FUF write FUF;
    [TColumn('VALOR_SERVICO', 'Valor Servico', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorServico: Extended  read FVALOR_SERVICO write FVALOR_SERVICO;
    [TColumn('VALOR_BC_RETENCAO_ICMS', 'Valor Bc Retencao Icms', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorBcRetencaoIcms: Extended  read FVALOR_BC_RETENCAO_ICMS write FVALOR_BC_RETENCAO_ICMS;
    [TColumn('ALIQUOTA_RETENCAO_ICMS', 'Aliquota Retencao Icms', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property AliquotaRetencaoIcms: Extended  read FALIQUOTA_RETENCAO_ICMS write FALIQUOTA_RETENCAO_ICMS;
    [TColumn('VALOR_ICMS_RETIDO', 'Valor Icms Retido', 168, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftFloatComSeparador, taRightJustify)]
    property ValorIcmsRetido: Extended  read FVALOR_ICMS_RETIDO write FVALOR_ICMS_RETIDO;
    [TColumn('CFOP', 'Cfop', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Cfop: Integer  read FCFOP write FCFOP;
    [TColumn('MUNICIPIO', 'Municipio', 80, [ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Municipio: Integer  read FMUNICIPIO write FMUNICIPIO;
    [TColumn('PLACA_VEICULO', 'Placa Veiculo', 56, [ldGrid, ldLookup, ldCombobox], False)]
    property PlacaVeiculo: String  read FPLACA_VEICULO write FPLACA_VEICULO;
    [TColumn('UF_VEICULO', 'Uf Veiculo', 16, [ldGrid, ldLookup, ldCombobox], False)]
    property UfVeiculo: String  read FUF_VEICULO write FUF_VEICULO;
    [TColumn('RNTC_VEICULO', 'Rntc Veiculo', 160, [ldGrid, ldLookup, ldCombobox], False)]
    property RntcVeiculo: String  read FRNTC_VEICULO write FRNTC_VEICULO;
    [TColumn('VAGAO', 'Vagao', 160, [ldGrid, ldLookup, ldCombobox], False)]
    property Vagao: String  read FVAGAO write FVAGAO;
    [TColumn('BALSA', 'Balsa', 160, [ldGrid, ldLookup, ldCombobox], False)]
    property Balsa: String  read FBALSA write FBALSA;

    [TColumn('PERSISTE', 'Persiste', 60, [], True)]
    property Persiste: String  read FPersiste write FPersiste;

    [TManyValuedAssociation('ID_NFE_TRANSPORTE','ID')]
    property ListaNfeTransporteReboqueVO: TObjectList<TNfeTransporteReboqueVO> read FListaNfeTransporteReboqueVO write FListaNfeTransporteReboqueVO;

    [TManyValuedAssociation('ID_NFE_TRANSPORTE','ID')]
    property ListaNfeTransporteVolumeVO: TObjectList<TNfeTransporteVolumeVO> read FListaNfeTransporteVolumeVO write FListaNfeTransporteVolumeVO;

  end;

implementation

constructor TNfeTransporteVO.Create;
begin
  inherited;
  FListaNfeTransporteReboqueVO := TObjectList<TNfeTransporteReboqueVO>.Create;
  FListaNfeTransporteVolumeVO := TObjectList<TNfeTransporteVolumeVO>.Create;
end;

destructor TNfeTransporteVO.Destroy;
begin
  FreeAndNil(FListaNfeTransporteReboqueVO);
  FreeAndNil(FListaNfeTransporteVolumeVO);
  inherited;
end;

initialization
  Classes.RegisterClass(TNfeTransporteVO);

finalization
  Classes.UnRegisterClass(TNfeTransporteVO);

end.
