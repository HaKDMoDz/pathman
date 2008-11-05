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
    btnApply: TButton;
    procedure btnOKClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnRemoveClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnUpClick(Sender: TObject);
    procedure btnDownClick(Sender: TObject);
    procedure btnReplaceClick(Sender: TObject);
    procedure btnDlgClick(Sender: TObject);
    procedure btnApplyClick(Sender: TObject);
    procedure lstPathListDblClick(Sender: TObject);

  private
    procedure ReadPathToStrings(StrList: TStrings);
    procedure ApplyStringsToPath(strList: TStrings);
    procedure Changed(canApply:Boolean);
  public
    { Public declarations }
  end;

const
  EnvKey = 'System\CurrentControlSet\Control\Session Manager\Environment';
var
  frmMain: TfrmMain;

implementation


{$R *.dfm}

procedure TfrmMain.ReadPathToStrings(StrList: TStrings);
var
  str: String;
begin
  with TRegistry.Create do
  try
    RootKey := HKEY_LOCAL_MACHINE;
    if OpenKey(EnvKey,false) then
    begin
      str := ReadString('Path');
      ExtractStrings([';'],[],PChar(str), strList);
    end;
  finally
    Free;
  end;
end;

procedure TfrmMain.ApplyStringsToPath(strList: TStrings);
var
  envstr: String;
begin
  with TRegistry.Create do
  try
    RootKey := HKEY_LOCAL_MACHINE;
    if OpenKey(EnvKey,false) then
    begin
      strList.Delimiter := ';';
      envstr := StringReplace(strList.DelimitedText, '"','',[rfReplaceAll]);
      WriteString('Path',envstr);
      SendMessage(HWND_BROADCAST, WM_SETTINGCHANGE, 0, Integer(PChar('Environment')));
      SendMessage(HWND_BROADCAST, WM_WININICHANGE, 0, Integer(PChar('Environment')));
    end;
  finally
    Free;
  end;

end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  ReadPathToStrings(lstPathList.Items);
  Changed(false);
end;

procedure TfrmMain.btnOKClick(Sender: TObject);
begin
  ApplyStringsToPath(lstPathList.Items);
  frmMain.Close;
end;

procedure TfrmMain.btnApplyClick(Sender: TObject);
begin
  ApplyStringsToPath(lstPathList.Items);
  Changed(false);
end;

procedure TfrmMain.Changed(canApply:Boolean);
begin
  if canApply then
  begin
    btnApply.Enabled := true;
  end else
  begin
     btnApply.Enabled := False;
  end;
end;

procedure TfrmMain.btnAddClick(Sender: TObject);
begin
  if trim(edtPath.Text) <> '' then
  begin
    lstPathList.Items.Insert(lstPathList.ItemIndex, edtPath.Text);
    Changed(true);
  end;
end;

procedure TfrmMain.btnRemoveClick(Sender: TObject);
begin
  lstPathList.DeleteSelected;
  Changed(true);
end;

procedure TfrmMain.btnReplaceClick(Sender: TObject);
begin
  if (edtPath.Text <> '') and (lstPathList.ItemIndex > 0) then
  begin
    lstPathList.Items[lstPathList.ItemIndex] := edtPath.Text;
    Changed(true);
  end;

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
    Changed(true);
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
    Changed(true);
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
