unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Registry, Buttons, XPMan, ExtCtrls, FileCtrl;

type
  TfrmMain = class(TForm)
    lstPathList: TListBox;
    edtPath: TEdit;
    btnAdd: TButton;
    btnUp: TBitBtn;
    btnDown: TBitBtn;
    btnRemove: TButton;
    btnDlg: TButton;
    btnOK: TButton;
    XPManifest1: TXPManifest;
    btnClose: TButton;
    btnReplace: TButton;
    Panel1: TPanel;
    procedure btnOKClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnRemoveClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ReadPathToList(ListBox: TListBox);
    procedure btnUpClick(Sender: TObject);
    procedure btnDownClick(Sender: TObject);
    procedure lstPathListDblClick(Sender: TObject);
    procedure btnReplaceClick(Sender: TObject);
    procedure btnDlgClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

const
  EnvKey = 'System\CurrentControlSet\Control\Session Manager\Environment';
var
  frmMain: TfrmMain;

implementation


{$R *.dfm}

procedure TfrmMain.ReadPathToList(ListBox: TListBox);
var
  str: String;
begin
  with TRegistry.Create do
  try
    RootKey := HKEY_LOCAL_MACHINE;
    if OpenKey(EnvKey,false) then
    begin
      str := ReadString('Path');
      ExtractStrings([';'],[],PChar(str),ListBox.Items);
    end;
  finally
    Free;
  end;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  ReadPathToList(lstPathList);
end;

procedure TfrmMain.btnOKClick(Sender: TObject);
var
  envstr: String;
begin
  with TRegistry.Create do
  try
    RootKey := HKEY_LOCAL_MACHINE;
    if OpenKey(EnvKey,false) then
    begin
      lstPathList.Items.Delimiter := ';';
      envstr := StringReplace(lstPathList.Items.DelimitedText, '"','',[rfReplaceAll]);
      WriteString('Path',envstr);
      SendMessage(HWND_BROADCAST, WM_SETTINGCHANGE, 0, Integer(PChar('Environment')));
      SendMessage(HWND_BROADCAST, WM_WININICHANGE, 0, Integer(PChar('Environment')));
    end;
  finally
    Free;
  end;
  frmMain.Close;
end;

procedure TfrmMain.btnAddClick(Sender: TObject);
begin
  if trim(edtPath.Text) <> '' then
    lstPathList.Items.Insert(lstPathList.ItemIndex, edtPath.Text);
end;

procedure TfrmMain.btnRemoveClick(Sender: TObject);
begin
  lstPathList.DeleteSelected;
end;

procedure TfrmMain.btnReplaceClick(Sender: TObject);
begin
  if (edtPath.Text <> '') and (lstPathList.ItemIndex > 0) then
    lstPathList.Items[lstPathList.ItemIndex] := edtPath.Text;
end;

procedure TfrmMain.btnCloseClick(Sender: TObject);
begin
  frmMain.Close;
end;

procedure TfrmMain.btnUpClick(Sender: TObject);
begin
  with lstPathList do
  begin
    if ItemIndex > 0 then
    begin
      Items.Exchange(ItemIndex, ItemIndex - 1);
    end;
  end;
end;

procedure TfrmMain.btnDownClick(Sender: TObject);
begin
  with lstPathList do
  begin
    if (ItemIndex <> -1)  and (ItemIndex < Count-1) then
    begin
      Items.Exchange(ItemIndex, ItemIndex + 1);
    end;
  end;
end;

procedure TfrmMain.lstPathListDblClick(Sender: TObject);
begin
  edtPath.Text := lstPathList.Items[lstPathList.itemIndex];
end;

procedure TfrmMain.btnDlgClick(Sender: TObject);
var
  aPath: String;
begin
  //ShowMessage('To be continued...');
  aPath :=  edtPath.Text;
  if SelectDirectory('Select a directory..', '', aPath) then
    edtPath.Text := aPath
end;

end.
