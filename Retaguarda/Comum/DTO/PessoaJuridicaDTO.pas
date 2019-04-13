unit PessoaJuridicaDTO;

interface

uses
  Atributos, Constantes, Classes,

  SynCommons,
  mORMot;

type
  TPessoa_Juridica = class(TSQLRecord)
  private
    FID_PESSOA: TID;
    FCNPJ: RawUTF8;
    FFANTASIA: RawUTF8;
    FINSCRICAO_MUNICIPAL: RawUTF8;
    FINSCRICAO_ESTADUAL: RawUTF8;
    FDATA_CONSTITUICAO: TDateTime;
    FTIPO_REGIME: RawUTF8;
    FCRT: RawUTF8;
    FSUFRAMA: RawUTF8;

  published
    [TColumn('ID_PESSOA','Id Pessoa',[ldGrid, ldLookup],False)]
    property Id_Pessoa: TID  read FID_PESSOA write FID_PESSOA;
    [TColumn('CNPJ','Cnpj',[ldGrid, ldLookup],False)]
    property Cnpj: RawUTF8  read FCNPJ write FCNPJ;
    [TColumn('FANTASIA','Fantasia',[ldGrid, ldLookup],False)]
    property Fantasia: RawUTF8  read FFANTASIA write FFANTASIA;
    [TColumn('INSCRICAO_MUNICIPAL','Inscrição Municipal',[ldGrid, ldLookup],False)]
    property Inscricao_Municipal: RawUTF8  read FINSCRICAO_MUNICIPAL write FINSCRICAO_MUNICIPAL;
    [TColumn('INSCRICAO_ESTADUAL','Inscrição Estadual',[ldGrid, ldLookup],False)]
    property Inscricao_Estadual: RawUTF8  read FINSCRICAO_ESTADUAL write FINSCRICAO_ESTADUAL;
    [TColumn('DATA_CONSTITUICAO','Data Constituição',[ldGrid, ldLookup],False)]
    property Data_Constituicao: TDateTime  read FDATA_CONSTITUICAO write FDATA_CONSTITUICAO;
    [TColumn('TIPO_REGIME','Tipo Regime',[ldGrid, ldLookup],False)]
    property Tipo_Regime: RawUTF8  read FTIPO_REGIME write FTIPO_REGIME;
    [TColumn('CRT','Crt',[ldGrid, ldLookup],False)]
    property Crt: RawUTF8  read FCRT write FCRT;
    [TColumn('SUFRAMA','Suframa',[ldGrid, ldLookup],False)]
    property Suframa: RawUTF8  read FSUFRAMA write FSUFRAMA;

  end;

implementation

end.
