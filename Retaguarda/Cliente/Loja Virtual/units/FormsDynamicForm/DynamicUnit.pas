unit DynamicUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniStatusBar, uniGUIBaseClasses, uniButton;

type
  TUniForm4 = class(TUniForm)
    UniButton1: TUniButton;
    UniStatusBar1: TUniStatusBar;
    procedure UniButton1Click(Sender: TObject);
  private
    procedure bClick(Sender: TObject);
    { Private declarations }
  public
    { Public declarations }
  end;

function UniForm4: TUniForm4;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication,  UniEdit, UniLabel, UniMemo,
  UniStringGrid, UniCalendar, UniComboBox, UniPageControl, UniTabControl,
  UniListBox;

function UniForm4: TUniForm4;
begin
  Result := TUniForm4(UniMainModule.GetFormInstance(TUniForm4));
end;

procedure TUniForm4.bClick(Sender: TObject);
begin
  TUniForm4.Create(UniApplication).Show;
end;

procedure TUniForm4.UniButton1Click(Sender: TObject);
var
  C : TControl;
begin
  UniButton1.Enabled:=False;

  Width:=800;
  Height:=580;
  Left:=Random(100);
  Top:=Random(10);

  with TUniEdit(InsertControl(TUniEdit.Create(Self))) do
  begin
    Left:=10;
    Top:=40;
    Text:='Text';
  end;

  with TUniButton(InsertControl(TUniButton.Create(Self))) do
  begin
    Left:=10;
    Top:=65;
    Caption:='Button';
  end;

  with TUniLabel(InsertControl(TUniLabel.Create(Self))) do
  begin
    Left:=10;
    Top:=90;
    Caption:='Label';
  end;

  with TUniMemo(InsertControl(TUniMemo.Create(Self))) do
  begin
    Left:=10;
    Top:=105;
    Height:=100;
    Width:=150;
    Text:='Memo Text';
  end;

  with TUniComboBox(InsertControl(TUniComboBox.Create(Self))) do
  begin
    Left:=10;
    Top:=210;
    Items.Add('A');
    Items.Add('B');
    Items.Add('C');
    Items.Add('D');
  end;

  with UniStatusBar1 do
  begin
    Panels.Add.Text:='Panel1';
    Panels.Add.Text:='Panel2';
    Panels.Add.Text:='Panel3';
    Panels.Add.Text:='Panel4';
  end;

  with TUniStringGrid(InsertControl(TUniStringGrid.Create(Self))) do
  begin
    DefaultColWidth:=50;
    Left:=200;
    Top:=40;
    Height:=150;
    Width:=180;
    ColCount:=4;
    RowCount:=4;
    Cells[1,1]:='1,1';
  end;

  with TUniCalendar(InsertControl(TUniCalendar.Create(Self))) do
  begin
    Left:=10;
    Top:=250;
  end;

  C:=TUniPageControl.Create(Self);
  with TUniPageControl(InsertControl(C)) do
  begin
    Left:=200;
    Top:=250;
    with TUniTabSheet.Create(Self) do
    begin
      Caption:='Page-0';
      PageControl:=TUniPageControl(C);
    end;

    with TUniTabSheet.Create(Self) do
    begin
      Caption:='Page-1';
      PageControl:=TUniPageControl(C);
    end;

    with TUniTabSheet.Create(Self) do
    begin
      Caption:='Page-2';
      PageControl:=TUniPageControl(C);
    end;
  end;

  with TUniTabControl(InsertControl(TUniTabControl.Create(Self))) do
  begin
    Left:=400;
    Top:=40;
    Tabs.Add('Tab-0');
    Tabs.Add('Tab-1');
    Tabs.Add('Tab-2');
  end;

  with TUniListBox(InsertControl(TUniListBox.Create(Self))) do
  begin
    Left:=520;
    Top:=250;
    Height:=180;
    Items.Add('Item-0');
    Items.Add('Item-1');
    Items.Add('Item-2');
    Items.Add('Item-3');
  end;

  with TUniButton(InsertControl(TUniButton.Create(Self))) do
  begin
    Left:=700;
    Top:=480;
    Font.Style:=[fsBold];
    Font.Color:=clGreen;
    Caption:='Restart!';
    OnClick:=bClick;
  end;
end;

end.
