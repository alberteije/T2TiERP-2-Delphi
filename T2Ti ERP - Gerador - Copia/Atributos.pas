unit Atributos;

interface

type
  // Mapeia uma classe como uma entidade persistente
  TEntity = class(TCustomAttribute)
  end;

  // Informa que um campo nao é persistente
  TTransient = class(TCustomAttribute)
  end;

  // Mapeia a classe de acordo com a tabela do banco de dados
  TTable = class(TCustomAttribute)
  private
    FName: String;
    FCatalog: String;
    FSchema: String;
  public
    constructor Create(pName, pCatalog, pSchema: String); overload;
    constructor Create(pName, pSchema: String); overload;
    constructor Create(pName: String); overload;
    property Name: String read FName write FName;
    property Catalog: String read FCatalog write FCatalog;
    property Schema: String read FSchema write FSchema;
  end;

  // Mapeia o identificador da classe, a chave primária na tabela do banco de dados
  TId = class(TCustomAttribute)
  private
    FNameField: String;
  public
    constructor Create(pNameField: String);
    property NameField: String read FNameField write FNameField;
  end;

  // Mapeia um campo de uma tabela no banco de dados
  TColumn = class(TCustomAttribute)
  private
    FName: String;
    FUnique: Boolean;
    FLength: Integer;
  public
    constructor Create(pName: String; pUnique: Boolean; pLength: Integer); overload;
    constructor Create(pName: String; pUnique: Boolean); overload;
    constructor Create(pName: String; pLength: Integer); overload;
    constructor Create(pName: String); overload;
    property Name: String read FName write FName;
    property Unique: Boolean read FUnique write FUnique;
    property Length: Integer read FLength write FLength;
  end;

  // Informa a estratégia de geração de valores para chaves primárias
  TGeneratedValue = class(TCustomAttribute)
  private
    { TABLE = chave gerada por uma tabela exclusiva para este fim
      SEQUENCE = utilização se sequence do banco de dados
      IDENTITY = utilização se identity do banco de dados
      AUTO = o provedor de persistência escolhe a estratégia mais adequada dependendo do banco de dados
      }
    FStrategy: String;
    FGenerator: String;
  public
    constructor Create(pStrategy, pGenerator: String); overload;
    constructor Create(pStrategy: String); overload;
    property Strategy: String read FStrategy write FStrategy;
    property Generator: String read FGenerator write FGenerator;
  end;

implementation

{ TTable }

constructor TTable.Create(pName, pCatalog, pSchema: String);
begin
  FName := pName;
  FCatalog := pCatalog;
  FSchema := pSchema;
end;

constructor TTable.Create(pName, pSchema: String);
begin
  FName := pName;
  FSchema := pSchema;
end;

constructor TTable.Create(pName: String);
begin
  FName := pName;
end;

{ TId }

constructor TId.Create(pNameField: String);
begin
  FNameField := pNameField;
end;

{ TColumn }

constructor TColumn.Create(pName: String; pUnique: Boolean; pLength: Integer);
begin
  FName := pName;
  FUnique := pUnique;
  FLength := pLength;
end;

constructor TColumn.Create(pName: String; pLength: Integer);
begin
  FName := pName;
  FLength := pLength;
end;

constructor TColumn.Create(pName: String; pUnique: Boolean);
begin
  FName := pName;
  FUnique := pUnique;
end;

constructor TColumn.Create(pName: String);
begin
  FName := pName;
end;

{ TGeneratedValue }

constructor TGeneratedValue.Create(pStrategy, pGenerator: String);
begin
  FStrategy := pStrategy;
  FGenerator := pGenerator;
end;

constructor TGeneratedValue.Create(pStrategy: String);
begin
  FStrategy := pStrategy;
end;

end.
