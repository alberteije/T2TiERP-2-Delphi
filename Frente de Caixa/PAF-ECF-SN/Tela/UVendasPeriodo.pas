{ *******************************************************************************
Title: T2TiPDV
Description: Permite a emissão dos relatórios do Sintegra e SPED Fiscal

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
unit UVendasPeriodo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, UBase,
  Dialogs, JvExDBGrids, StdCtrls, JvExStdCtrls,
  JvButton, JvCtrls, Buttons, JvExButtons, JvBitBtn, pngimage, ExtCtrls, Mask,
  JvEdit, JvValidateEdit, JvEnterTab, ComCtrls, JvComponentBase, DateUtils,
  Data.DB, Datasnap.DBClient, Vcl.Grids, Vcl.DBGrids, JvDBGrid, JvDBUltimGrid,
  JvExMask, JvToolEdit, LabeledCtrls, Biblioteca, Controller;

type
  TFVendasPeriodo = class(TFBase)
    Image1: TImage;
    RadioGroup2: TRadioGroup;
    botaoConfirma: TJvBitBtn;
    botaoCancela: TJvImgBtn;
    JvEnterAsTab1: TJvEnterAsTab;
    PageControl1: TPageControl;
    PaginaSintegra: TTabSheet;
    PaginaSped: TTabSheet;
    PanelDados: TPanel;
    PanelMestre: TPanel;
    ComboBoxVersaoLeiauteSped: TLabeledComboBox;
    ComboBoxFinalidadeArquivoSped: TLabeledComboBox;
    ComboBoxPerfilSped: TLabeledComboBox;
    ComboBoxInventario: TLabeledComboBox;
    GroupBox1: TGroupBox;
    Grid: TJvDBUltimGrid;
    Panel1: TPanel;
    Panel2: TPanel;
    ComboBoxCodigoConvenio: TLabeledComboBox;
    LabeledComboBox1: TLabeledComboBox;
    ComboBoxNaturezaInformacoes: TLabeledComboBox;
    LabeledComboBox2: TLabeledComboBox;
    CDSContador: TClientDataSet;
    DSContador: TDataSource;
    EditPeriodoInicial: TLabeledDateEdit;
    EditPeriodoFinal: TLabeledDateEdit;
    procedure Confirma;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure botaoConfirmaClick(Sender: TObject);
    procedure RadioGroup2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FVendasPeriodo: TFVendasPeriodo;

implementation

{$R *.dfm}

uses
  EcfContadorController, EcfContadorVO;

procedure TFVendasPeriodo.FormCreate(Sender: TObject);
begin
  ConfiguraCDSFromVO(CDSContador, TEcfContadorVO);
  ConfiguraGridFromVO(Grid, TEcfContadorVO);
end;

procedure TFVendasPeriodo.FormActivate(Sender: TObject);
begin
  Color := StringToColor(Sessao.Configuracao.CorJanelasInternas);
  //
  EditPeriodoInicial.Clear;
  EditPeriodoFinal.Clear;
  EditPeriodoInicial.Date := Now;
  EditPeriodoFinal.Date := Now;
  //
  TEcfContadorController.SetDataSet(CDSContador);
  TController.ExecutarMetodo('EcfContadorController.TEcfContadorController', 'Consulta', ['ID>0', '0', False], 'GET', 'Lista');
end;

procedure TFVendasPeriodo.botaoConfirmaClick(Sender: TObject);
begin
  Confirma;
end;

procedure TFVendasPeriodo.Confirma;
var
  ArquivoGerado, Filtro: String;
  Camadas: Integer;
begin
  try
    // Guarda Camadas. Se ocorrer algum problema, no Finally tem que setar o mesmo valor
    Camadas := Sessao.Camadas;

    if TController.ServidorAtivo then
    begin

      if RadioGroup2.ItemIndex = 0 then
      begin
        if Application.MessageBox('Deseja gerar o arquivo do SINTEGRA (Convenio 57/95)?', 'Pergunta do Sistema', Mb_YesNo + Mb_IconQuestion) = IdYes then
        begin
          Filtro :=
                    DataParaTexto(EditPeriodoInicial.Date) + '|' +                   //0
                    DataParaTexto(EditPeriodoFinal.Date) + '|' +                     //1
                    IntToStr(ComboBoxCodigoConvenio.ItemIndex) + '|' +               //2
                    IntToStr(ComboBoxFinalidadeArquivoSped.ItemIndex) + '|' +        //3
                    IntToStr(ComboBoxNaturezaInformacoes.ItemIndex) + '|' +          //4
                    IntToStr(Sessao.Configuracao.EcfEmpresaVO.Id) + '|' +            //5
                    IntToStr(ComboBoxInventario.ItemIndex) + '|' +                   //6
                    CDSContador.FieldByName('ID').AsString;                          //7


          Sessao.Camadas := 3;
          ArquivoGerado := TController.BuscarArquivo('SintegraController.TSintegraController', 'GerarSintegra', [Filtro], 'GET');
          Sessao.Camadas := 2;
        end;
      end;
      if RadioGroup2.ItemIndex = 1 then
      begin
        if Application.MessageBox('Deseja gerar o arquivo do SPED FISCAL (Ato COTEPE/ICMS 09/08)?', 'Pergunta do Sistema', Mb_YesNo + Mb_IconQuestion) = IdYes then
        begin
          Filtro :=
                      DataParaTexto(EditPeriodoInicial.Date) + '|' +                 //0
                      DataParaTexto(EditPeriodoFinal.Date) + '|' +                   //1
                      IntToStr(ComboBoxVersaoLeiauteSped.ItemIndex) + '|' +          //2
                      IntToStr(ComboBoxFinalidadeArquivoSped.ItemIndex) + '|' +      //3
                      IntToStr(ComboBoxPerfilSped.ItemIndex) + '|' +                 //4
                      IntToStr(Sessao.Configuracao.EcfEmpresaVO.Id) + '|' +          //5
                      IntToStr(ComboBoxInventario.ItemIndex) + '|' +                 //6
                      CDSContador.FieldByName('ID').AsString;                        //7

          Sessao.Camadas := 3;
          ArquivoGerado := TController.BuscarArquivo('SpedFiscalController.TSpedFiscalController', 'GerarSpedFiscal', [Filtro], 'GET');
          Sessao.Camadas := 2;
        end;
      end;

      if ArquivoGerado <> '' then
      begin
        Application.MessageBox(PChar('Arquivo Gerado em: ' + ArquivoGerado), 'Pergunta do Sistema', Mb_OK + Mb_IconInformation);
      end;
    end
    else
      Application.MessageBox('Não foi possível conectar ao Servidor de Aplicações, tente mais tarde!', 'Informação do Sistema', MB_OK + MB_ICONERROR);

  finally
    Sessao.Camadas := Camadas;
  end;
end;

procedure TFVendasPeriodo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFVendasPeriodo.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = 123 then
    Confirma;
end;

procedure TFVendasPeriodo.RadioGroup2Click(Sender: TObject);
begin
  if RadioGroup2.ItemIndex = 0 then
  begin;
    PageControl1.TabIndex := 0;
  end
  else
  begin
    PageControl1.TabIndex := 1;
  end;
end;

end.
