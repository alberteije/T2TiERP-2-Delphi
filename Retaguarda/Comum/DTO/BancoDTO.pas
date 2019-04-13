unit BancoDTO;

interface

uses
    SynCommons,
  mORMot, Classes,

  Atributos;

type
  TBanco = class(TSQLRecord)
  private
    FPK: Integer;
    FCODIGO: RawUTF8;
    FNOME: RawUTF8;
    FURL: RawUTF8;

  published
    [TPK('ID', [ldGrid, ldLookup, ldComboBox])]
    property PK: Integer  read FPK write FPK;
    [TColumn('CODIGO', 'Codigo', 80, [ldGrid, ldLookup, ldCombobox], False)]
    property Codigo: RawUTF8 index 100  read FCODIGO write FCODIGO;
    [TColumn('NOME', 'Nome', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property Nome: RawUTF8 index 100  read FNOME write FNOME;
    [TColumn('URL', 'Url', 450, [ldGrid, ldLookup, ldCombobox], False)]
    property Url: RawUTF8 index 250  read FURL write FURL;
  end;

implementation

end.
