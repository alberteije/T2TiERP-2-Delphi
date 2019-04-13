unit UPenDrive;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, UBase,
  Dialogs, StdCtrls, Buttons, JvBaseDlg, JvBrowseFolder, FileCtrl, JvExStdCtrls,
  JvButton, JvCtrls, jpeg, ExtCtrls;

type
  TFPenDrive = class(TFBase)
    FolderDialog: TJvBrowseForFolderDialog;
    ListTXT: TFileListBox;
    GroupBox1: TGroupBox;
    editPath: TEdit;
    SpeedButton1: TSpeedButton;
    Image1: TImage;
    botaoCancela: TJvImgBtn;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    Rotina :string;
    { Public declarations }
  end;

var
  FPenDrive: TFPenDrive;

implementation

uses UCargaPDV, UCaixa;

{$R *.dfm}

(*
  ALTERAR - Alterar para o novo processo de carga
*)

procedure TFPenDrive.FormActivate(Sender: TObject);
begin
  Color := StringToColor(Sessao.Configuracao.CorJanelasInternas);
end;

procedure TFPenDrive.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  FPenDrive := nil;
end;

procedure TFPenDrive.FormShow(Sender: TObject);
begin
  if Rotina = 'IMPORTA' then
    Caption := 'Rotina de importação de dados do Pen-Drive'
  else if Rotina = 'EXPORTA' then
    Caption := 'Rotina de exportação de dados para Pen-Drive';

  editPath.Text := '';
end;

procedure TFPenDrive.SpeedButton1Click(Sender: TObject);
var
  iContaTXT: Integer;
  LocalApp, RemoteApp: String;
begin
  if FolderDialog.Execute then
  begin
    editPath.Text:= trim(FolderDialog.Directory);
    if Rotina = 'IMPORTA' then
    begin
      if FileExists(editPath.Text+'\carga.txt') then
      begin
        if FCargaPDV = nil then
          Application.CreateForm(TFCargaPDV, FCargaPDV);
//        FCargaPDV.Tipo := 4;
        FCargaPDV.ShowModal;
        Application.ProcessMessages;
      end;//if FileExists(editPath.Text+'\carga.txt') then
    end
    else
    if Rotina = 'EXPORTA' then
    begin
      if DirectoryExists(editPath.Text) then
      begin
        ListTXT.Mask      := 'C*.txt';
        ListTXT.Directory := ExtractFilePath(Application.ExeName)+'Script\';
        ListTXT.Update;
        Application.ProcessMessages;
        for iContaTXT := 0 to ListTXT.Count -1 do
        begin
          LocalApp :=  ExtractFilePath(Application.ExeName)+'Script\'+ListTXT.Items[iContaTXT];
          RemoteApp := editPath.Text+'\'+ListTXT.Items[iContaTXT];
          if (FileExists(LocalApp)) and (LocalApp <> ExtractFilePath(Application.ExeName)+'Script\carga.txt') then
             if CopyFile(PChar(LocalApp), PChar(RemoteApp), False) then
                Application.ProcessMessages;
          LocalApp := '';
        end;//for iContaTXT := 0 to ListTXT.Count -1 do
        ShowMessage('Arquivos copiados para o Pen-Drive');
      end;//if DirectoryExists(editPath.Text) then
    end;//if Rotina = 'IMPORTA' then
  end;//if FolderDialog.Execute then
end;

end.
