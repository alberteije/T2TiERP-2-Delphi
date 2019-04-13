{*******************************************************************************
Title: T2Ti ERP
Description: Unit de Sessão do Usuário - Servidor.

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
unit SessaoUsuario;

interface

uses Generics.Collections, UsuarioVO, SysUtils;

type
  TSessaoUsuario = class
  private
    FIdSessao: string;
    FUsuario: TUsuarioVO;
    FUltimaAtividade: TDateTime;
    FIdEmpresa: Integer;
  public
    destructor Destroy; override;
    property IdSessao: string read FIdSessao write FIdSessao;
    property Usuario: TUsuarioVO read FUsuario write FUsuario;
    property UltimaAtividade: TDateTime read FUltimaAtividade write FUltimaAtividade;
    property IdEmpresa: Integer read FIdEmpresa write FIdEmpresa;
  end;

  TListaSessaoUsuario = class
  private
    FSessoes: TObjectList<TSessaoUsuario>;

    class var FInstance: TListaSessaoUsuario;
    function GetItem(Index: Integer): TSessaoUsuario;
    function GetSessoes: Integer;
  public
    constructor Create;
    destructor Destroy; override;

    class function Instance: TListaSessaoUsuario;

    function AdicionaSessao(pIdSessao: string; pUsuario: TUsuarioVO): Integer;
    procedure RemoveSessao(pIdSessao: string); overload;
    procedure RemoveSessao(pSessaoUsuario: TSessaoUsuario); overload;
    function GetSessao(pIdSessao: string): TSessaoUsuario;

    function GetUltimaAtividade(pIdSessao: string): TDateTime;
    procedure SetUltimaAtividade(pIdSessao: string);

    property Sessoes: Integer read GetSessoes;
    property Items[Index: Integer]: TSessaoUsuario read GetItem;
  end;

implementation

{ TListaSessaoUsuario }

function TListaSessaoUsuario.AdicionaSessao(pIdSessao: string; pUsuario: TUsuarioVO): Integer;
var
  SessaoUsuario: TSessaoUsuario;
begin
  SessaoUsuario := TSessaoUsuario.Create;
  SessaoUsuario.IdSessao := pIdSessao;
  SessaoUsuario.Usuario := pUsuario;
  SessaoUsuario.UltimaAtividade := Now;

  Result := FSessoes.Add(SessaoUsuario);
end;

constructor TListaSessaoUsuario.Create;
begin
  inherited Create;

  FSessoes := TObjectList<TSessaoUsuario>.Create;
end;

destructor TListaSessaoUsuario.Destroy;
begin
  FSessoes.Free;

  inherited;
end;

function TListaSessaoUsuario.GetItem(Index: Integer): TSessaoUsuario;
begin
  if (Index < 0) or (Index >= Sessoes) then
  begin
    Result := nil;
  end
  else
  begin
    Result := FSessoes.Items[Index];
  end;
end;

function TListaSessaoUsuario.GetSessao(pIdSessao: string): TSessaoUsuario;
var
  Enumerator: TEnumerator<TSessaoUsuario>;
begin
  Result := nil;

  Enumerator := FSessoes.GetEnumerator;
  try
    with Enumerator do
    begin
      while MoveNext do
      begin
        if Current.IdSessao = pIdSessao then
        begin
          Result := Current;
          Break;
        end;
      end;
    end;
  finally
    Enumerator.Free;
  end;
end;

function TListaSessaoUsuario.GetSessoes: Integer;
begin
  Result := FSessoes.Count;
end;

function TListaSessaoUsuario.GetUltimaAtividade(pIdSessao: string): TDateTime;
var
  SessaoUsuario: TSessaoUsuario;
begin
  SessaoUsuario := GetSessao(pIdSessao);

  if Assigned(SessaoUsuario) then
    Result := SessaoUsuario.UltimaAtividade
  else
    Result := 0;
end;

class function TListaSessaoUsuario.Instance: TListaSessaoUsuario;
begin
  if not Assigned(FInstance) then
    FInstance := TListaSessaoUsuario.Create;
  Result := FInstance;
end;

procedure TListaSessaoUsuario.RemoveSessao(pSessaoUsuario: TSessaoUsuario);
begin
  if Assigned(pSessaoUsuario) then
    FSessoes.Remove(pSessaoUsuario);
end;

procedure TListaSessaoUsuario.RemoveSessao(pIdSessao: string);
var
  SessaoUsuario: TSessaoUsuario;
begin
  SessaoUsuario := GetSessao(pIdSessao);
  RemoveSessao(SessaoUsuario);
end;

procedure TListaSessaoUsuario.SetUltimaAtividade(pIdSessao: string);
var
  SessaoUsuario: TSessaoUsuario;
begin
  SessaoUsuario := GetSessao(pIdSessao);

  if Assigned(SessaoUsuario) then
    SessaoUsuario.UltimaAtividade := Now;
end;

{ TSessaoUsuario }

destructor TSessaoUsuario.Destroy;
begin
  if Assigned(FUsuario) then
    FUsuario.Free;

  inherited;
end;

end.
