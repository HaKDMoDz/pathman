unit main;

interface

uses
  Windows, Messages, SysUtils, Classes, Controls, Forms,
  StdCtrls, Registry, Buttons, XPMan, ExtCtrls, FileCtrl;

type
  TfrmMain = class(TForm)
    lstPathList: TListBox;
    edtPath: TEdit;
    btnAdd: TButton;
    btnUp: TBitBtn;
    btnDown: TBitBtn;
    btnRemove: TButton;
    btnSelectDlg: TButton;
    btnOK: TButton;
    XPManifest1: TXPManifest;
    btnClose: TButton;
    btnReplace: TButton;
    btnApply: TButton;
    btnSystem: TSpeedButton;
    btnUser: TSpeedButton;
    btnAbout: TButton;
    procedure btnOKClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnRemoveClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnUpClick(Sender: TObject);
    procedure btnDownClick(Sender: TObject);
    procedure btnReplaceClick(Sender: TObject);
    procedure btnSelectDlgClick(Sender: TObject);
    procedure btnApplyClick(Sender: TObject);
    procedure lstPathListDblClick(Sender: TObject);
    procedure btnSystemClick(Sender: TObject);
    procedure btnUserClick(Sender: TObject);
  private
    FSystemPaths: TStrings;
    FUserPaths:   TStrings;

    procedure ReadPathToStrings(aRoot:HKEY; aKey:string; StrList: TStrings);
    procedure ApplyStringsToPath(aRoot:HKEY; aKey:string; strList: TStrings);
    procedure Changed(canApply:Boolean);
    procedure ApplyEnvChange;
  public
    { Public declarations }
  end;

const
  SysEnvKey = 'System\CurrentControlSet\Control\Session Manager\Environment';
  UserEnvKey = 'Environment';
var
  frmMain: TfrmMain;

implementation


{$R *.dfm}

procedure TfrmMain.ReadPathToStrings(aRoot:HKEY; aKey:string; StrList: TStrings);
var
  str: String;
begin
  with TRegistry.Create do
  try
    RootKey := aRoot ;
    if OpenKey(aKey,false) then
    begin
      str := ReadString('Path');
      ExtractStrings([';'],[],PChar(str), strList);
    end;
  finally
    Free;
  end;
end;

procedure TfrmMain.ApplyStringsToPath(aRoot:HKEY; aKey:string; strList: TStrings);
var
  envstr: String;
begin
  with TRegistry.Create do
  try
    RootKey := aRoot;
    if OpenKey(aKey,false) then
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

procedure TfrmMain.ApplyEnvChange;
begin
  if btnSystem.Down then
  begin
    FSystemPaths.Assign(lstPathList.Items);
  end
  else if btnUser.Down then
  begin
    FUserPaths.Assign(lstPathList.Items);
  end;
           
  ApplyStringsToPath(HKEY_LOCAL_MACHINE, SysEnvKey, FSystemPaths);
  ApplyStringsToPath(HKEY_CURRENT_USER, UserEnvKey, FUserPaths);
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  FSystemPaths := TStringList.Create;
  FUserPaths := TStringList.Create;
  ReadPathToStrings(HKEY_LOCAL_MACHINE, SysEnvKey, FSystemPaths);
  ReadPathToStrings(HKEY_CURRENT_USER, UserEnvKey, FUserPaths);

  lstPathList.Items := FSystemPaths;
  btnSystem.Down := true;
  
  Changed(false);
end;

procedure TfrmMain.btnOKClick(Sender: TObject);
begin
  ApplyEnvChange;
  frmMain.Close;
end;

procedure TfrmMain.btnApplyClick(Sender: TObject);
begin
  ApplyEnvChange;  
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
      Changed(true);
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
      Changed(true);
    end;
  end;
end;

procedure TfrmMain.lstPathListDblClick(Sender: TObject);
begin
  edtPath.Text := lstPathList.Items[lstPathList.itemIndex];
end;

procedure TfrmMain.btnSelectDlgClick(Sender: TObject);
var
  aPath: String;
begin
  //ShowMessage('To be continued...');
  aPath :=  edtPath.Text;
  if SelectDirectory('Select a directory..', '', aPath) then
    edtPath.Text   := aPath
end;

procedure TfrmMain.btnSystemClick(Sender: TObject);
begin
  FUserPaths.Assign(lstPathList.Items);
  lstPathList.Items:= FSystemPaths;
end;

procedure TfrmMain.btnUserClick(Sender: TObject);
begin
  FSystemPaths.Assign(lstPathList.Items);
  lstPathList.Items:= FUserPaths;
end;

end.
