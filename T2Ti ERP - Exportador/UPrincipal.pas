unit UPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WideStrings, Buttons, StdCtrls, DB, SqlExpr, ExtCtrls,
  ComCtrls, FMTBcd, MidasLib, DBClient, Menus, DBCtrls, DBXMsSQL, DBXInterbase,
  DBXOracle, DBXFirebird, DBXMySql, JvEnterTab, LabeledCtrls, JvToolEdit,
  JvComponentBase, Mask, JvExMask, Grids, DBGrids, ToolWin, ActnMan, ActnCtrls,
  PlatformDefaultStyleActnCtrls, ActnList, ImgList, System.Actions;

type
  TFPrincipal = class(TForm)
    PanelVinculos: TPanel;
    PanelDadosSH: TPanel;
    StatusBar1: TStatusBar;
    EntidadeSH: TSQLDataSet;
    Splitter1: TSplitter;
    JvEnterAsTab1: TJvEnterAsTab;
    Panel4: TPanel;
    EditBuscaTabelaSH: TLabeledEdit;
    Panel1: TPanel;
    GroupBoxSGBDSH: TGroupBox;
    Label7: TLabel;
    EditHostSH: TLabeledEdit;
    ComboConexaoSH: TLabeledComboBox;
    EditUsuarioSH: TLabeledEdit;
    EditSenhaSH: TLabeledEdit;
    BotaoConectarSH: TBitBtn;
    EditBancoDadosSH: TJvFilenameEdit;
    GroupBox2: TGroupBox;
    DBGrid2: TDBGrid;
    CDSVinculos: TClientDataSet;
    DSVinculos: TDataSource;
    ActionManager1: TActionManager;
    ActionToolBar1: TActionToolBar;
    ImageListBotaoNormal: TImageList;
    ImageListBotaoDesabilitado: TImageList;
    ActionGerarArquivo: TAction;
    ActionToolBar2: TActionToolBar;
    Panel2: TPanel;
    ListaTabelasSH: TListBox;
    Splitter2: TSplitter;
    ListaCamposSH: TListBox;
    ActionInserirSH: TAction;
    ActionEditarSH: TAction;
    QConsultaSH: TSQLQuery;
    ActionLimparGrid: TAction;
    TTabelaSH: TSQLTable;
    ActionExcluirLinha: TAction;
    ConexaoSH: TSQLConnection;
    CDSVinculosTABELA: TStringField;
    CDSVinculosCAMPO: TStringField;
    CDSVinculosTAMANHO: TIntegerField;
    CDSVinculosVALOR_PADRAO: TStringField;
    ActionSalvarLayout: TAction;
    procedure ListaTabelasSHClick(Sender: TObject);
    procedure EditBuscaTabelaSHChange(Sender: TObject);
    procedure BotaoConectarSHClick(Sender: TObject);
    procedure ActionInserirSHExecute(Sender: TObject);
    procedure ActionEditarSHExecute(Sender: TObject);
    procedure ActionLimparGridExecute(Sender: TObject);
    procedure ActionGerarArquivoExecute(Sender: TObject);
    procedure ListaTabelasSHDblClick(Sender: TObject);
    procedure ActionExcluirLinhaExecute(Sender: TObject);
    procedure ActionSalvarLayoutExecute(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPrincipal: TFPrincipal;

implementation

uses
  ConexaoBD, UTabelaSelecionada;
{$R *.dfm}


{$REGION 'Software House'}
procedure TFPrincipal.BotaoConectarSHClick(Sender: TObject);
var
  List: TStringList;
begin
  List := TStringList.Create;

  TDBExpress.HostName := EditHostSH.Text;
  TDBExpress.Database := EditBancoDadosSH.Text;
  TDBExpress.User_Name := EditUsuarioSH.Text;
  TDBExpress.Password := EditSenhaSH.Text;

  TDBExpress.Conectar(ComboConexaoSH.Text);
  EntidadeSH.SQLConnection := TDBExpress.getConexao;
  QConsultaSH.SQLConnection := TDBExpress.getConexao;
  TTabelaSH.SQLConnection := TDBExpress.getConexao;
  ConexaoSH := TDBExpress.getConexao;

  EntidadeSH.SQLConnection.GetTableNames(List, false);
  if ListaTabelasSH.itemindex > -1 then
    if ListaTabelasSH.Items.Strings[ListaTabelasSH.itemindex] <> '' then
      EntidadeSH.SQLConnection.GetFieldNames(ListaTabelasSH.Items.Strings[ListaTabelasSH.itemindex], ListaCamposSH.Items);

  ListaTabelasSH.Items.Assign(List);
  EditBuscaTabelaSH.SetFocus;
  List.Free;
end;

procedure TFPrincipal.ListaTabelasSHClick(Sender: TObject);
begin
  EntidadeSH.SQLConnection.GetFieldNames(ListaTabelasSH.Items.Strings[ListaTabelasSH.itemindex], ListaCamposSH.Items);
  //
  QConsultaSH.Active := false;
  QConsultaSH.CommandText := 'select count(*) as TOTAL from ' + ListaTabelasSH.Items.Strings[ListaTabelasSH.itemindex];
  QConsultaSH.Active := True;
  StatusBar1.Panels[0].Text := 'Total Registros: ' + QConsultaSH.FieldByName('TOTAL').AsString;
end;

procedure TFPrincipal.EditBuscaTabelaSHChange(Sender: TObject);
begin
  ListaTabelasSH.Perform(LB_SELECTSTRING, 0, LongInt(PChar(EditBuscaTabelaSH.Text)));
end;

procedure TFPrincipal.ActionInserirSHExecute(Sender: TObject);
begin
  CDSVinculos.Append;
  CDSVinculosTABELA.AsString := ListaTabelasSH.Items.Strings[ListaTabelasSH.itemindex];
  CDSVinculosCAMPO.AsString := ListaCamposSH.Items.Strings[ListaCamposSH.itemindex];
  CDSVinculosTAMANHO.AsString := '10'; //EXERCICIO: tente pegar o tamanho real do campo
  CDSVinculos.Post;
end;

procedure TFPrincipal.ActionEditarSHExecute(Sender: TObject);
begin
  CDSVinculos.Edit;
  CDSVinculosTABELA.AsString := ListaTabelasSH.Items.Strings[ListaTabelasSH.itemindex];
  CDSVinculosCAMPO.AsString := ListaCamposSH.Items.Strings[ListaCamposSH.itemindex];
  CDSVinculos.Post;
end;

procedure TFPrincipal.ListaTabelasSHDblClick(Sender: TObject);
begin
  TTabelaSH.Close;
  TTabelaSH.TableName := ListaTabelasSH.Items.Strings[ListaTabelasSH.itemindex];
  TTabelaSH.Open;
  FTabelaSelecionada.DSPTabelaSelecionada.DataSet := TTabelaSH;
  FTabelaSelecionada.CDSTabelaSelecionada.Close;
  FTabelaSelecionada.CDSTabelaSelecionada.Open;
  FTabelaSelecionada.Caption := 'Tabela Selecionada - SH: ' + ListaTabelasSH.Items.Strings[ListaTabelasSH.itemindex];
  FTabelaSelecionada.ShowModal;
end;
{$ENDREGION}

{$REGION 'Actions'}
procedure TFPrincipal.ActionLimparGridExecute(Sender: TObject);
begin
  if Application.MessageBox('Deseja limpar o conteúdo da Grid?', 'Pergunta do Sistema', MB_YesNo + MB_IconQuestion) = IdYes then
  begin
    CDSVinculos.EmptyDataSet;
  end;
end;

procedure TFPrincipal.ActionSalvarLayoutExecute(Sender: TObject);
begin
/// EXERCICIO: salve o layout num arquivo INI, XML ou no banco de dados
end;

procedure TFPrincipal.ActionExcluirLinhaExecute(Sender: TObject);
begin
  if Application.MessageBox('Deseja excluir a linha selecionada?', 'Pergunta do Sistema', MB_YesNo + MB_IconQuestion) = IdYes then
  begin
    CDSVinculos.Delete;
  end;
end;

procedure TFPrincipal.ActionGerarArquivoExecute(Sender: TObject);
var
  Linha: String;
begin
  try
    /// EXERCICIO: adapte a geração do arquivo nos módulos necessários
    /// Atenção para os tamanhos dos campos
    if Application.MessageBox('Deseja gerar o arquivo?', 'Pergunta do Sistema', MB_YesNo + MB_IconQuestion) = IdYes then
    begin
      FormatSettings.DecimalSeparator := '.';

      CDSVinculos.First;
      while not CDSVinculos.Eof do
      begin
        TTabelaSH.Close;
        TTabelaSH.TableName := CDSVinculos.FieldByName('TABELA').AsString;
        TTabelaSH.Open;

        Linha := Linha + TTabelaSH.FieldByName(CDSVinculos.FieldByName('CAMPO').AsString).AsString + '|';

        CDSVinculos.Next;
      end;

      ShowMessage(Linha);

      Application.MessageBox('Arquivo gerado com sucesso.', 'Informação do Sistema', MB_OK + MB_ICONINFORMATION);
    end;
  finally
    FormatSettings.DecimalSeparator := ',';
  end;
end;
{$ENDREGION}

end.
