{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado à tabela [COLABORADOR] 
                                                                                
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
unit ColaboradorVO;

interface

uses
  VO, Atributos, Classes, Constantes, Generics.Collections, SysUtils,
  TipoAdmissaoVO, SituacaoColaboradorVO, PessoaVO, TipoColaboradorVO,
  NivelFormacaoVO, CargoVO, SetorVO;

type
  [TEntity]
  [TTable('COLABORADOR')]
  TColaboradorVO = class(TVO)
  private
    FID: Integer;
    FID_TIPO_ADMISSAO: Integer;
    FID_SITUACAO_COLABORADOR: Integer;
    FID_PESSOA: Integer;
    FID_TIPO_COLABORADOR: Integer;
    FID_NIVEL_FORMACAO: Integer;
    FID_CARGO: Integer;
    FID_SETOR: Integer;
    FMATRICULA: String;
    FFOTO_34: String;
    FDATA_CADASTRO: TDateTime;
    FDATA_ADMISSAO: TDateTime;
    FVENCIMENTO_FERIAS: TDateTime;
    FDATA_TRANSFERENCIA: TDateTime;
    FFGTS_OPTANTE: String;
    FFGTS_DATA_OPCAO: TDateTime;
    FFGTS_CONTA: Integer;
    FPAGAMENTO_FORMA: String;
    FPAGAMENTO_BANCO: String;
    FPAGAMENTO_AGENCIA: String;
    FPAGAMENTO_AGENCIA_DIGITO: String;
    FPAGAMENTO_CONTA: String;
    FPAGAMENTO_CONTA_DIGITO: String;
    FEXAME_MEDICO_ULTIMO: TDateTime;
    FEXAME_MEDICO_VENCIMENTO: TDateTime;
    FPIS_DATA_CADASTRO: TDateTime;
    FPIS_NUMERO: String;
    FPIS_BANCO: String;
    FPIS_AGENCIA: String;
    FPIS_AGENCIA_DIGITO: String;
    FCTPS_NUMERO: String;
    FCTPS_SERIE: String;
    FCTPS_DATA_EXPEDICAO: TDateTime;
    FCTPS_UF: String;
    FDESCONTO_PLANO_SAUDE: String;
    FSAI_NA_RAIS: String;
    FCATEGORIA_SEFIP: String;
    FOBSERVACAO: String;
    FOCORRENCIA_SEFIP: Integer;
    FCODIGO_ADMISSAO_CAGED: Integer;
    FCODIGO_DEMISSAO_CAGED: Integer;
    FCODIGO_DEMISSAO_SEFIP: Integer;
    FDATA_DEMISSAO: TDateTime;
    FCODIGO_TURMA_PONTO: String;

    FTipoAdmissaoVO: TTipoAdmissaoVO;
    FSituacaoColaboradorVO: TSituacaoColaboradorVO;
    FPessoaVO: TPessoaVO;
    FTipoColaboradorVO: TTipoColaboradorVO;
    FNivelFormacaoVO: TNivelFormacaoVO;
    FCargoVO: TCargoVO;
    FSetorVO: TSetorVO;

  public
    constructor Create; override;
    destructor Destroy; override;

    [TId('ID', [ldGrid, ldLookup, ldComboBox])]
    [TGeneratedValue(sAuto)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property Id: Integer  read FID write FID;
    // Pessoa
    [TColumn('ID_PESSOA','Id Pessoa',80,[ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdPessoa: Integer  read FID_PESSOA write FID_PESSOA;
    // Tipo Admissão
    [TColumn('ID_TIPO_ADMISSAO','Id Tipo Admissao',80,[ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdTipoAdmissao: Integer  read FID_TIPO_ADMISSAO write FID_TIPO_ADMISSAO;
    // Situação Colaborador
    [TColumn('ID_SITUACAO_COLABORADOR','Id Situacao Colaborador',80,[ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdSituacaoColaborador: Integer  read FID_SITUACAO_COLABORADOR write FID_SITUACAO_COLABORADOR;
    // Tipo de Colaborador
    [TColumn('ID_TIPO_COLABORADOR','Id Tipo Colaborador',80,[ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdTipoColaborador: Integer  read FID_TIPO_COLABORADOR write FID_TIPO_COLABORADOR;
    // Nível de Formação
    [TColumn('ID_NIVEL_FORMACAO','Id Nivel Formacao',80,[ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdNivelFormacao: Integer  read FID_NIVEL_FORMACAO write FID_NIVEL_FORMACAO;
    // Cargo
    [TColumn('ID_CARGO','Id Cargo',80,[ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdCargo: Integer  read FID_CARGO write FID_CARGO;
    // Setor
    [TColumn('ID_SETOR','Id Setor',80,[ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property IdSetor: Integer  read FID_SETOR write FID_SETOR;

    [TColumn('MATRICULA','Matricula',80,[ldGrid, ldLookup, ldCombobox], False)]
    property Matricula: String  read FMATRICULA write FMATRICULA;
    [TColumn('FOTO_34','Foto 34',450,[ldGrid, ldLookup, ldCombobox], False)]
    property Foto34: String  read FFOTO_34 write FFOTO_34;
    [TColumn('DATA_CADASTRO','Data Cadastro',80,[ldGrid, ldLookup, ldCombobox], False)]
    property DataCadastro: TDateTime  read FDATA_CADASTRO write FDATA_CADASTRO;
    [TColumn('DATA_ADMISSAO','Data Admissao',80,[ldGrid, ldLookup, ldCombobox], False)]
    property DataAdmissao: TDateTime  read FDATA_ADMISSAO write FDATA_ADMISSAO;
    [TColumn('VENCIMENTO_FERIAS','Vencimento Ferias',80,[ldGrid, ldLookup, ldCombobox], False)]
    property VencimentoFerias: TDateTime  read FVENCIMENTO_FERIAS write FVENCIMENTO_FERIAS;
    [TColumn('DATA_TRANSFERENCIA','Data Transferencia',80,[ldGrid, ldLookup, ldCombobox], False)]
    property DataTransferencia: TDateTime  read FDATA_TRANSFERENCIA write FDATA_TRANSFERENCIA;
    [TColumn('FGTS_OPTANTE','Fgts Optante',8,[ldGrid, ldLookup, ldCombobox], False)]
    property FgtsOptante: String  read FFGTS_OPTANTE write FFGTS_OPTANTE;
    [TColumn('FGTS_DATA_OPCAO','Fgts Data Opcao',80,[ldGrid, ldLookup, ldCombobox], False)]
    property FgtsDataOpcao: TDateTime  read FFGTS_DATA_OPCAO write FFGTS_DATA_OPCAO;
    [TColumn('FGTS_CONTA','Fgts Conta',80,[ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property FgtsConta: Integer  read FFGTS_CONTA write FFGTS_CONTA;
    [TColumn('PAGAMENTO_FORMA','Pagamento Forma',8,[ldGrid, ldLookup, ldCombobox], False)]
    property PagamentoForma: String  read FPAGAMENTO_FORMA write FPAGAMENTO_FORMA;
    [TColumn('PAGAMENTO_BANCO','Pagamento Banco',80,[ldGrid, ldLookup, ldCombobox], False)]
    property PagamentoBanco: String  read FPAGAMENTO_BANCO write FPAGAMENTO_BANCO;
    [TColumn('PAGAMENTO_AGENCIA','Pagamento Agencia',80,[ldGrid, ldLookup, ldCombobox], False)]
    property PagamentoAgencia: String  read FPAGAMENTO_AGENCIA write FPAGAMENTO_AGENCIA;
    [TColumn('PAGAMENTO_AGENCIA_DIGITO','Pagamento Agencia Digito',80,[ldGrid, ldLookup, ldCombobox], False)]
    property PagamentoAgenciaDigito: String  read FPAGAMENTO_AGENCIA_DIGITO write FPAGAMENTO_AGENCIA_DIGITO;
    [TColumn('PAGAMENTO_CONTA','Pagamento Conta',80,[ldGrid, ldLookup, ldCombobox], False)]
    property PagamentoConta: String  read FPAGAMENTO_CONTA write FPAGAMENTO_CONTA;
    [TColumn('PAGAMENTO_CONTA_DIGITO','Pagamento Conta Digito',80,[ldGrid, ldLookup, ldCombobox], False)]
    property PagamentoContaDigito: String  read FPAGAMENTO_CONTA_DIGITO write FPAGAMENTO_CONTA_DIGITO;
    [TColumn('EXAME_MEDICO_ULTIMO','Exame Medico Ultimo',80,[ldGrid, ldLookup, ldCombobox], False)]
    property ExameMedicoUltimo: TDateTime  read FEXAME_MEDICO_ULTIMO write FEXAME_MEDICO_ULTIMO;
    [TColumn('EXAME_MEDICO_VENCIMENTO','Exame Medico Vencimento',80,[ldGrid, ldLookup, ldCombobox], False)]
    property ExameMedicoVencimento: TDateTime  read FEXAME_MEDICO_VENCIMENTO write FEXAME_MEDICO_VENCIMENTO;
    [TColumn('PIS_DATA_CADASTRO','Pis Data Cadastro',80,[ldGrid, ldLookup, ldCombobox], False)]
    property PisDataCadastro: TDateTime  read FPIS_DATA_CADASTRO write FPIS_DATA_CADASTRO;
    [TColumn('PIS_NUMERO','Pis Numero',80,[ldGrid, ldLookup, ldCombobox], False)]
    property PisNumero: String  read FPIS_NUMERO write FPIS_NUMERO;
    [TColumn('PIS_BANCO','Pis Banco',80,[ldGrid, ldLookup, ldCombobox], False)]
    property PisBanco: String  read FPIS_BANCO write FPIS_BANCO;
    [TColumn('PIS_AGENCIA','Pis Agencia',80,[ldGrid, ldLookup, ldCombobox], False)]
    property PisAgencia: String  read FPIS_AGENCIA write FPIS_AGENCIA;
    [TColumn('PIS_AGENCIA_DIGITO','Pis Agencia Digito',80,[ldGrid, ldLookup, ldCombobox], False)]
    property PisAgenciaDigito: String  read FPIS_AGENCIA_DIGITO write FPIS_AGENCIA_DIGITO;
    [TColumn('CTPS_NUMERO','Ctps Numero',80,[ldGrid, ldLookup, ldCombobox], False)]
    property CtpsNumero: String  read FCTPS_NUMERO write FCTPS_NUMERO;
    [TColumn('CTPS_SERIE','Ctps Serie',80,[ldGrid, ldLookup, ldCombobox], False)]
    property CtpsSerie: String  read FCTPS_SERIE write FCTPS_SERIE;
    [TColumn('CTPS_DATA_EXPEDICAO','Ctps Data Expedicao',80,[ldGrid, ldLookup, ldCombobox], False)]
    property CtpsDataExpedicao: TDateTime  read FCTPS_DATA_EXPEDICAO write FCTPS_DATA_EXPEDICAO;
    [TColumn('CTPS_UF','Ctps Uf',16,[ldGrid, ldLookup, ldCombobox], False)]
    property CtpsUf: String  read FCTPS_UF write FCTPS_UF;
    [TColumn('DESCONTO_PLANO_SAUDE','Desconto Plano Saude',8,[ldGrid, ldLookup, ldCombobox], False)]
    property DescontoPlanoSaude: String  read FDESCONTO_PLANO_SAUDE write FDESCONTO_PLANO_SAUDE;
    [TColumn('SAI_NA_RAIS','Sai Na Rais',8,[ldGrid, ldLookup, ldCombobox], False)]
    property SaiNaRais: String  read FSAI_NA_RAIS write FSAI_NA_RAIS;
    [TColumn('CATEGORIA_SEFIP','Categoria Sefip',16,[ldGrid, ldLookup, ldCombobox], False)]
    property CategoriaSefip: String  read FCATEGORIA_SEFIP write FCATEGORIA_SEFIP;
    [TColumn('OBSERVACAO','Observacao',450,[ldGrid, ldLookup, ldCombobox], False)]
    property Observacao: String  read FOBSERVACAO write FOBSERVACAO;
    [TColumn('OCORRENCIA_SEFIP','Ocorrencia Sefip',80,[ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property OcorrenciaSefip: Integer  read FOCORRENCIA_SEFIP write FOCORRENCIA_SEFIP;
    [TColumn('CODIGO_ADMISSAO_CAGED','Codigo Admissao Caged',80,[ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property CodigoAdmissaoCaged: Integer  read FCODIGO_ADMISSAO_CAGED write FCODIGO_ADMISSAO_CAGED;
    [TColumn('CODIGO_DEMISSAO_CAGED','Codigo Demissao Caged',80,[ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property CodigoDemissaoCaged: Integer  read FCODIGO_DEMISSAO_CAGED write FCODIGO_DEMISSAO_CAGED;
    [TColumn('CODIGO_DEMISSAO_SEFIP','Codigo Demissao Sefip',80,[ldGrid, ldLookup, ldCombobox], False)]
    [TFormatter(ftZerosAEsquerda, taCenter)]
    property CodigoDemissaoSefip: Integer  read FCODIGO_DEMISSAO_SEFIP write FCODIGO_DEMISSAO_SEFIP;
    [TColumn('DATA_DEMISSAO','Data Demissao',80,[ldGrid, ldLookup, ldCombobox], False)]
    property DataDemissao: TDateTime  read FDATA_DEMISSAO write FDATA_DEMISSAO;
    [TColumn('CODIGO_TURMA_PONTO','Codigo Turma Ponto',40,[ldGrid, ldLookup, ldCombobox], False)]
    property CodigoTurmaPonto: String  read FCODIGO_TURMA_PONTO write FCODIGO_TURMA_PONTO;

    [TAssociation('ID', 'ID_TIPO_ADMISSAO')]
    property TipoAdmissaoVO: TTipoAdmissaoVO read FTipoAdmissaoVO write FTipoAdmissaoVO;

    [TAssociation('ID', 'ID_SITUACAO_COLABORADOR')]
    property SituacaoColaboradorVO: TSituacaoColaboradorVO read FSituacaoColaboradorVO write FSituacaoColaboradorVO;

    [TAssociation('ID', 'ID_PESSOA')]
    property PessoaVO: TPessoaVO read FPessoaVO write FPessoaVO;

    [TAssociation('ID', 'ID_TIPO_COLABORADOR')]
    property TipoColaboradorVO: TTipoColaboradorVO read FTipoColaboradorVO write FTipoColaboradorVO;

    [TAssociation('ID', 'ID_NIVEL_FORMACAO')]
    property NivelFormacaoVO: TNivelFormacaoVO read FNivelFormacaoVO write FNivelFormacaoVO;

    [TAssociation('ID', 'ID_CARGO')]
    property CargoVO: TCargoVO read FCargoVO write FCargoVO;

    [TAssociation('ID', 'ID_SETOR')]
    property SetorVO: TSetorVO read FSetorVO write FSetorVO;


  end;

implementation

constructor TColaboradorVO.Create;
begin
  inherited;

  FTipoAdmissaoVO := TTipoAdmissaoVO.Create;
  FSituacaoColaboradorVO := TSituacaoColaboradorVO.Create;
  FPessoaVO := TPessoaVO.Create;
  FTipoColaboradorVO := TTipoColaboradorVO.Create;
  FNivelFormacaoVO := TNivelFormacaoVO.Create;
  FCargoVO := TCargoVO.Create;
  FSetorVO := TSetorVO.Create;
end;

destructor TColaboradorVO.Destroy;
begin
  FreeAndNil(FTipoAdmissaoVO);
  FreeAndNil(FSituacaoColaboradorVO);
  FreeAndNil(FPessoaVO);
  FreeAndNil(FTipoColaboradorVO);
  FreeAndNil(FNivelFormacaoVO);
  FreeAndNil(FCargoVO);
  FreeAndNil(FSetorVO);

  inherited;
end;

initialization
  Classes.RegisterClass(TColaboradorVO);

finalization
  Classes.UnRegisterClass(TColaboradorVO);

end.
