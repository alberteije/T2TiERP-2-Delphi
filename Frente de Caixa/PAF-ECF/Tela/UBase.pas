{ *******************************************************************************
Title: T2TiPDV
Description: Formulário Base

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

@author Albert Eije
@version 2.0
******************************************************************************* }
unit UBase;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, SessaoUsuario, JvArrowButton, Buttons, Tipos, UDataModule, ComCtrls,
  JvPageList, Rtti, Atributos, ActnList, Menus, Vcl.ExtCtrls;

type
  TFBase = class(TForm)
    TimerIntegracao: TTimer;
    procedure TimerIntegracaoTimer(Sender: TObject);
  private
    procedure ReceberCarga;

    function GetSessaoUsuario: TSessaoUsuario;
    { Private declarations }
  public
    { Public declarations }
    property Sessao: TSessaoUsuario read GetSessaoUsuario;
    procedure ExecutarIntegracao(pProcedimento: String);
  end;

var
  FBase: TFBase;

implementation

uses UCargaPDV;
{$R *.dfm}
{ TFBase }

function TFBase.GetSessaoUsuario: TSessaoUsuario;
begin
  Result := TSessaoUsuario.Instance;
end;

procedure TFBase.TimerIntegracaoTimer(Sender: TObject);
begin
  TimerIntegracao.Enabled := False;
  if Sessao.Configuracao.TipoIntegracao > 0 then
  begin
    ReceberCarga;
  end;
end;

procedure TFBase.ExecutarIntegracao(pProcedimento: String);
begin
  TimerIntegracao.Enabled := False;
  if FCargaPDV = nil then
    Application.CreateForm(TFCargaPDV, FCargaPDV);
  FCargaPDV.Procedimento := pProcedimento;
  FCargaPDV.ShowModal;
  TimerIntegracao.Enabled := True;
end;

procedure TFBase.ReceberCarga;
begin
(*
  TimerIntegracao.Enabled := False;
  try
    if ExecutaPing(Sessao.Configuracao.IpServidor) then
    begin
      PathCarga := FDataModule.RemoteAppPath + 'Caixa' + IntToStr(Sessao.Configuracao.IdEcfCaixa) + '\carga.txt';
      PathSemaforo := FDataModule.RemoteAppPath + 'Caixa' + IntToStr(Sessao.Configuracao.IdEcfCaixa) + '\semaforo';

      if (FileExists(PathCarga)) and (FileExists(PathSemaforo)) then
      begin
        labelMensagens.Caption := 'Aguarde, Importando Dados';
        if FCargaPDV = nil then
          Application.CreateForm(TFCargaPDV, FCargaPDV);
        FCargaPDV.Left := Self.Left;
        FCargaPDV.Width := Self.Left;
        FCargaPDV.Tipo := 0;
        FCargaPDV.ShowModal;
      end
      else if (FileExists(PathCarga)) then
      begin
        Pathlocal := ExtractFilePath(Application.ExeName) + 'ArquivoAuxiliar.ini';
        CopyFile(PChar(Pathlocal), PChar(PathSemaforo), False);
      end;
      GifAnimadoRede.Animate := true;
    end
    else
      GifAnimadoRede.Animate := False;
  finally
    TimerIntegracao.Enabled := true;
    Application.ProcessMessages;
  end;
  *)
end;

end.
