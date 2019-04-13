unit RESTModel;

interface

uses
  SynCommons,
  mORMot;

type
  TBanco = class(TSQLRecord) // TSQLRecord has already ID: integer primary key
  private
    fNome: RawUTF8;
  published
    /// ORM will create a NAME VARCHAR(80) column
    property Nome: RawUTF8 index 100 read fNome write fNome;
  end;

function DataModel: TSQLModel;

const
  SERVER_ROOT = 'root';
  SERVER_PORT = '888';


implementation

function DataModel: TSQLModel;
begin
  result := TSQLModel.Create([TBanco],SERVER_ROOT);
  TBanco.AddFilterOrValidate('Nome',TSynValidateText.Create); // ensure exists
end;


end.
