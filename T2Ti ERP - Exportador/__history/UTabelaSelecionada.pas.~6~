unit UTabelaSelecionada;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, ToolWin, ActnMan, ActnCtrls, ActnMenus,
  PlatformDefaultStyleActnCtrls, Grids, DBGrids, DB, Provider, DBClient;

type
  TFTabelaSelecionada = class(TForm)
    DBGridTabelaSelecionada: TDBGrid;
    ActionManager1: TActionManager;
    ActionMainMenuBar1: TActionMainMenuBar;
    ActionFechar: TAction;
    DSTabelaSelecionada: TDataSource;
    CDSTabelaSelecionada: TClientDataSet;
    DSPTabelaSelecionada: TDataSetProvider;
    procedure ActionFecharExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FTabelaSelecionada: TFTabelaSelecionada;

implementation

uses UPrincipal;

{$R *.dfm}

procedure TFTabelaSelecionada.ActionFecharExecute(Sender: TObject);
begin
  Close;
end;

end.
