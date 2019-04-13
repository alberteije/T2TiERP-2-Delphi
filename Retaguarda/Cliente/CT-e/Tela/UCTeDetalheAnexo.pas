unit UCTeDetalheAnexo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, LabeledCtrls, ExtCtrls, Mask, JvExMask, JvToolEdit,
  JvBaseEdits, ToolWin, ActnMan, ActnCtrls, Grids, DBGrids, JvExDBGrids,
  JvDBGrid, JvDBUltimGrid, ComCtrls, DBCtrls, LabeledDBCtrls;

type
  TFCTeDetalheAnexo = class(TForm)
    PageControlDadosTributacao: TPageControl;
    tsTransporte: TTabSheet;
    PanelDetalheArmamento: TPanel;
    GridDetalheArmamento: TJvDBUltimGrid;
    tsCarga: TTabSheet;
    PanelDeclaracaoImportacao: TPanel;
    GridDeclaracaoImportacao: TJvDBUltimGrid;
    PageLacres: TPageControl;
    tsLacre: TTabSheet;
    Panel1: TPanel;
    GridDeclaracaoImportacaoDetalhe: TJvDBUltimGrid;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCTeDetalheAnexo: TFCTeDetalheAnexo;

implementation

uses UDataModule, UDataModuleCTe;

{$R *.dfm}

end.
