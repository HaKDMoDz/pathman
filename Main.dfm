object frmMain: TfrmMain
  Left = 436
  Top = 103
  Width = 421
  Height = 497
  Caption = 'PathMan'
  Color = clBtnFace
  Constraints.MinHeight = 497
  Constraints.MinWidth = 421
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  DesignSize = (
    413
    462)
  PixelsPerInch = 96
  TextHeight = 13
  object btnSystem: TSpeedButton
    Left = 356
    Top = 32
    Width = 49
    Height = 33
    Anchors = [akTop, akRight]
    GroupIndex = 1
    Caption = 'System'
    OnClick = btnSystemClick
  end
  object btnUser: TSpeedButton
    Left = 356
    Top = 72
    Width = 49
    Height = 33
    Anchors = [akTop, akRight]
    GroupIndex = 1
    Caption = 'User'
    OnClick = btnUserClick
  end
  object lstPathList: TListBox
    Left = 24
    Top = 32
    Width = 327
    Height = 293
    Anchors = [akLeft, akTop, akRight, akBottom]
    ItemHeight = 13
    TabOrder = 0
    OnDblClick = lstPathListDblClick
  end
  object edtPath: TEdit
    Left = 24
    Top = 340
    Width = 327
    Height = 21
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 3
  end
  object btnAdd: TButton
    Left = 24
    Top = 372
    Width = 65
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = '&Add'
    TabOrder = 5
    OnClick = btnAddClick
  end
  object btnUp: TBitBtn
    Left = 358
    Top = 260
    Width = 41
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = '&Up'
    TabOrder = 1
    OnClick = btnUpClick
  end
  object btnDown: TBitBtn
    Left = 358
    Top = 300
    Width = 41
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = '&Down'
    TabOrder = 2
    OnClick = btnDownClick
  end
  object btnRemove: TButton
    Left = 205
    Top = 373
    Width = 66
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Remo&ve'
    TabOrder = 7
    OnClick = btnRemoveClick
  end
  object btnSelectDlg: TButton
    Left = 358
    Top = 340
    Width = 22
    Height = 22
    Anchors = [akRight, akBottom]
    Caption = '...'
    TabOrder = 4
    OnClick = btnSelectDlgClick
  end
  object btnOK: TButton
    Left = 142
    Top = 428
    Width = 81
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = '&OK'
    Default = True
    TabOrder = 8
    OnClick = btnOKClick
  end
  object btnClose: TButton
    Left = 230
    Top = 428
    Width = 81
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = '&Cancel'
    TabOrder = 9
    OnClick = btnCloseClick
  end
  object btnReplace: TButton
    Left = 115
    Top = 372
    Width = 65
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = '&Replace'
    TabOrder = 6
    OnClick = btnReplaceClick
  end
  object btnApply: TButton
    Left = 318
    Top = 428
    Width = 81
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'A&pply'
    TabOrder = 10
    OnClick = btnApplyClick
  end
  object btnAbout: TButton
    Left = 24
    Top = 432
    Width = 25
    Height = 25
    Caption = '?'
    TabOrder = 11
    Visible = False
  end
  object XPManifest1: TXPManifest
    Left = 368
    Top = 192
  end
end
