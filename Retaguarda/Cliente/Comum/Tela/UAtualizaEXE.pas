{ *******************************************************************************
  Title: T2Ti ERP
  Description: Atualização automática de executáveis.

  The MIT License

  Copyright: Copyright (C) 2012 Albert Eije

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
  alberteije@gmail.com

  @author Albert Eije
  @version 2.0
  ******************************************************************************* }
unit UAtualizaEXE;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, JvProgressBar, ComCtrls, JvExComCtrls, IniFiles,
  ShellApi, Biblioteca;

type
  TFAtualizaEXE = class(TForm)
    Panel1: TPanel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
  private
    PathVenda: String;
    { Private declarations }
  public
    Tipo: Integer;
    NomeArquivo: string;
    { Public declarations }
  end;

var
  FAtualizaEXE: TFAtualizaEXE;

implementation

uses UMenu, UDataModule;

{$R *.dfm}

procedure TFAtualizaEXE.FormActivate(Sender: TObject);
var
  Ini: TIniFile;
  ArquivoLocal, ArquivoRemoto: String;
  Parametros, Programa: String;
  DataArquivoLocal, DataArquivoRemoto: TDateTime;
begin
  try
    if FileExists(ExtractFilePath(Application.ExeName) + 'Conexao.ini') then
    begin
      Ini := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'Conexao.ini');
      ArquivoLocal := Application.ExeName;
      ArquivoRemoto := Ini.ReadString('AtualizaVersao', 'RemotePath', '') + ExtractFileName(Application.ExeName);
    end
    else
      Application.MessageBox('Arquivo de conexão não encontrado - entre em contato com a Software House.', 'Erro', MB_OK + MB_ICONERROR);
  finally
    Ini.Free;
  end;

  // Verifica se existe um arquivo no servidor
  if not FileExists(ArquivoRemoto) then
  begin
    Application.CreateForm(TFMenu, FMenu);
    Application.CreateForm(TFDataModule, FDataModule);
    Close;
    Exit;
  end;

  // Se o arquivo que está no servidor tiver o mesmo MD5, sai do procedimento
  if MD5File(ArquivoLocal) = MD5File(ArquivoRemoto) then
  begin
    Application.CreateForm(TFMenu, FMenu);
    Application.CreateForm(TFDataModule, FDataModule);
    Close;
    Exit;
  end;

  // Se a data do arquivo remoto for maior que a data do arquivo local, atualiza
  DataArquivoLocal := FileDateToDateTime(FileAge(ArquivoLocal));
  DataArquivoRemoto := FileDateToDateTime(FileAge(ArquivoRemoto));

  if (DataArquivoRemoto > DataArquivoLocal) then
  begin
    Application.MessageBox('Existe uma nova versão deste módulo e o mesmo será atualizado. Aguarde.', 'Informação do Sistema', MB_OK + MB_ICONINFORMATION);
    try
      Repaint;

      CopyFile(PChar(ArquivoRemoto), PChar(ArquivoLocal + 'Novo'), False);

      Sleep(1000);

      Parametros := ' "' + ArquivoLocal + '"';

      Programa := 'C:\Documents and Settings\Eije\Desktop\T2Ti ERP\Fontes\ERP\Cliente\AtualizaVersao\T2TiAtualizaVersao.exe';

      ShellExecute(Handle, 'open', PChar(Programa), PChar(Parametros), '', SW_HIDE);

      Application.Terminate;
    except
      Application.MessageBox('Erro ao tentar executar o módulo.', 'Erro do Sistema', MB_OK + MB_ICONERROR);
    end;
  end
  else
  begin
    Application.CreateForm(TFMenu, FMenu);
    Application.CreateForm(TFDataModule, FDataModule);
    Close;
    Exit;
  end;
end;

procedure TFAtualizaEXE.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  FAtualizaEXE := nil;
end;

end.
