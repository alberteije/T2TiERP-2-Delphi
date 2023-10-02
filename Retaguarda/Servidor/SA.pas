{ *******************************************************************************
  Title: T2Ti ERP
  Description: Unit criada pelo DataSnap - Servidor de Aplicações

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
unit SA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, SessaoUsuario, ComCtrls;

type
  TFSA = class(TForm)
    PageControl1: TPageControl;
    TabLogs: TTabSheet;
    TabResposta: TTabSheet;
    MemoLog: TMemo;
    MemoResposta: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FSA: TFSA;

implementation

uses
  ServerContainer;

{$R *.dfm}

procedure TFSA.FormClose(Sender: TObject; var Action: TCloseAction);
var
  ListaSessao: TListaSessaoUsuario;
begin
  // ListaSessao := TListaSessaoUsuario.Instance;
  // ListaSessao.Free;
  FServerContainer.DSServer.Stop;
end;

procedure TFSA.FormCreate(Sender: TObject);
begin
  Application.CreateForm(TFServerContainer, FServerContainer);

  MemoLog.Lines.Clear;
  FServerContainer.Log := MemoLog.Lines;

  FServerContainer.RegistrarClasses;
  FServerContainer.DSServer.Start;
  FServerContainer.ConectarBD;

  FormatSettings.DecimalSeparator := '.';
end;

end.
