unit PessoaFisicaDTO;

interface

uses
  Atributos, Constantes, Classes,

  SynCommons,
  mORMot;

type
  TPessoa_Fisica = class(TSQLRecord)
  private
    FID_PESSOA: TID;
    FID_ESTADO_CIVIL: Integer;
    FCPF: RawUTF8;
    FRG: RawUTF8;
    FORGAO_RG: RawUTF8;
    FDATA_EMISSAO_RG: TDateTime;
    FDATA_NASCIMENTO: TDateTime;
    FSEXO: RawUTF8;
    FNATURALIDADE: RawUTF8;
    FNACIONALIDADE: RawUTF8;
    FRACA: RawUTF8;
    FTIPO_SANGUE: RawUTF8;
    FCNH_NUMERO: RawUTF8;
    FCNH_CATEGORIA: RawUTF8;
    FCNH_VENCIMENTO: TDateTime;
    FTITULO_ELEITORAL_NUMERO: RawUTF8;
    FTITULO_ELEITORAL_ZONA: Integer;
    FTITULO_ELEITORAL_SECAO: Integer;
    FRESERVISTA_NUMERO: RawUTF8;
    FRESERVISTA_CATEGORIA: Integer;
    FNOME_MAE: RawUTF8;
    FNOME_PAI: RawUTF8;

  published
    [TColumn('ID_PESSOA','Id Pessoa',[ldGrid, ldLookup],False)]
    property Id_Pessoa: TID  read FID_PESSOA write FID_PESSOA;
    [TColumn('ID_ESTADO_CIVIL','Id Estado Civil',[ldGrid, ldLookup],False)]
    property Id_Estado_Civil: Integer  read FID_ESTADO_CIVIL write FID_ESTADO_CIVIL;
    [TColumn('CPF','Cpf',[ldGrid, ldLookup],False)]
    property Cpf: RawUTF8  read FCPF write FCPF;
    [TColumn('RG','Rg',[ldGrid, ldLookup],False)]
    property Rg: RawUTF8  read FRG write FRG;
    [TColumn('ORGAO_RG','Orgao Rg',[ldGrid, ldLookup],False)]
    property Orgao_Rg: RawUTF8  read FORGAO_RG write FORGAO_RG;
    [TColumn('DATA_EMISSAO_RG','Data Emissão Rg',[ldGrid, ldLookup],False)]
    property Data_Emissao_Rg: TDateTime  read FDATA_EMISSAO_RG write FDATA_EMISSAO_RG;
    [TColumn('DATA_NASCIMENTO','Data Nascimento',[ldGrid, ldLookup],False)]
    property Data_Nascimento: TDateTime  read FDATA_NASCIMENTO write FDATA_NASCIMENTO;
    [TColumn('SEXO','Sexo',[ldGrid, ldLookup],False)]
    property Sexo: RawUTF8  read FSEXO write FSEXO;
    [TColumn('NATURALIDADE','Naturalidade',[ldGrid, ldLookup],False)]
    property Naturalidade: RawUTF8  read FNATURALIDADE write FNATURALIDADE;
    [TColumn('NACIONALIDADE','Nacionalidade',[ldGrid, ldLookup],False)]
    property Nacionalidade: RawUTF8  read FNACIONALIDADE write FNACIONALIDADE;
    [TColumn('RACA','Raca',[ldGrid, ldLookup],False)]
    property Raca: RawUTF8  read FRACA write FRACA;
    [TColumn('TIPO_SANGUE','Tipo Sangue',[ldGrid, ldLookup],False)]
    property Tipo_Sangue: RawUTF8  read FTIPO_SANGUE write FTIPO_SANGUE;
    [TColumn('CNH_NUMERO','Cnh Número',[ldGrid, ldLookup],False)]
    property Cnh_Numero: RawUTF8  read FCNH_NUMERO write FCNH_NUMERO;
    [TColumn('CNH_CATEGORIA','Cnh Categoria',[ldGrid, ldLookup],False)]
    property Cnh_Categoria: RawUTF8  read FCNH_CATEGORIA write FCNH_CATEGORIA;
    [TColumn('CNH_VENCIMENTO','Cnh Vencimento',[ldGrid, ldLookup],False)]
    property Cnh_Vencimento: TDateTime  read FCNH_VENCIMENTO write FCNH_VENCIMENTO;
    [TColumn('TITULO_ELEITORAL_NUMERO','Título Eleitoral Número',[ldGrid, ldLookup],False)]
    property Titulo_Eleitoral_Numero: RawUTF8  read FTITULO_ELEITORAL_NUMERO write FTITULO_ELEITORAL_NUMERO;
    [TColumn('TITULO_ELEITORAL_ZONA','Título Eleitoral Zona',[ldGrid, ldLookup],False)]
    property Titulo_Eleitoral_Zona: Integer  read FTITULO_ELEITORAL_ZONA write FTITULO_ELEITORAL_ZONA;
    [TColumn('TITULO_ELEITORAL_SECAO','Título Eleitoral Seção',[ldGrid, ldLookup],False)]
    property Titulo_Eleitoral_Secao: Integer  read FTITULO_ELEITORAL_SECAO write FTITULO_ELEITORAL_SECAO;
    [TColumn('RESERVISTA_NUMERO','Reservista Número',[ldGrid, ldLookup],False)]
    property Reservista_Numero: RawUTF8  read FRESERVISTA_NUMERO write FRESERVISTA_NUMERO;
    [TColumn('RESERVISTA_CATEGORIA','Reservista Categoria',[ldGrid, ldLookup],False)]
    property Reservista_Categoria: Integer  read FRESERVISTA_CATEGORIA write FRESERVISTA_CATEGORIA;
    [TColumn('NOME_MAE','Nome Mae',[ldGrid, ldLookup],False)]
    property Nome_Mae: RawUTF8  read FNOME_MAE write FNOME_MAE;
    [TColumn('NOME_PAI','Nome Pai',[ldGrid, ldLookup],False)]
    property Nome_Pai: RawUTF8  read FNOME_PAI write FNOME_PAI;

  end;

implementation

end.
