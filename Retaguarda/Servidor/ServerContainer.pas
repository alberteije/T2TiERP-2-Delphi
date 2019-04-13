{ *******************************************************************************
Title: T2Ti ERP
Description: Unit criada pelo DataSnap - Contem os componentes do SA

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
******************************************************************************* }
unit ServerContainer;

interface

uses
  SysUtils, Classes, DSTCPServerTransport, DSHTTPCommon, DSHTTP, DSServer,
  DSCommonServer, Windows, WideStrings, DB, SqlExpr, DBXJSON,
  UsuarioVO, SessaoUsuario, IPPeerServer,
  Datasnap.DSAuth, UDataModuleConexao, Vcl.Forms, DSServerClass;

type
  TFServerContainer = class(TDataModule)
    DSServer: TDSServer;
    DSHTTPService: TDSHTTPService;
  private
    FLOG: TStrings;
    Modulo: String;

    procedure RegistrarClasse(pClasse: TPersistentClass);
    function GetUsuario(pSessao, pLogin, pSenha: string): TUsuarioVO;
    function Sessao: TListaSessaoUsuario;
  public
    property Log: TStrings read FLOG write FLOG;

    procedure RegistrarClasses;
    procedure GravaLog(Valor: String);
    procedure ConectarBD;

  end;

var
  FServerContainer: TFServerContainer;

implementation

uses
  Controller;
{$R *.dfm}
procedure TFServerContainer.RegistrarClasses;
begin
  // Infra
  Modulo := 'Infra';
  RegistrarClasse(TController);
end;

function TFServerContainer.Sessao: TListaSessaoUsuario;
begin
  Result := TListaSessaoUsuario.Instance;
end;

procedure TFServerContainer.ConectarBD;
begin
  try
    Application.CreateForm(TFDataModuleConexao, FDataModuleConexao);
    GravaLog('Banco de dados conectado.');
  finally
  end;
end;

function TFServerContainer.GetUsuario(pSessao, pLogin, pSenha: string): TUsuarioVO;
//var
  //UsuarioController: TUsuarioController;
  //JSONArray: TJSONArray;
begin
  (*
  UsuarioController := TUsuarioController.Create;
  try
    JSONArray := UsuarioController.Usuario(pSessao, 'LOGIN = ' + QuotedStr(pLogin) + ' AND SENHA = ' + QuotedStr(pSenha), 0);
    try
      if JSONArray.Size = 1 then
        Result := TUsuarioVO.JSONToObject<TUsuarioVO>(JSONArray.Get(0))
      else
        Result := nil;
    finally
      JSONArray.Free;
    end;
  finally
    UsuarioController.Free;
  end;
  *)
end;

procedure TFServerContainer.GravaLog(Valor: String);
begin
  if Assigned(Log) then
    Log.Add(Valor);
end;

procedure TFServerContainer.RegistrarClasse(pClasse: TPersistentClass);
var
  DSServerClass: TServerClassPadrao;
begin
  DSServerClass := TServerClassPadrao.Create(Self);
  DSServerClass.RegisterClass := pClasse;
  DSServerClass.Server := DSServer;
  GravaLog('Classe ' + pClasse.ClassName + ' registrada. '+Modulo+'.');
end;

end.
