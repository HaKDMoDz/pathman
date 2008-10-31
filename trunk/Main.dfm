object frmMain: TfrmMain
  Left = 457
  Top = 221
  BorderStyle = bsSingle
  Caption = 'PathMan'
  ClientHeight = 421
  ClientWidth = 375
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 375
    Height = 369
    Align = alTop
    BiDiMode = bdLeftToRight
    Caption = 'Panel1'
    ParentBiDiMode = False
    TabOrder = 10
  end
  object lstPathList: TListBox
    Left = 24
    Top = 32
    Width = 289
    Height = 249
    ItemHeight = 13
    TabOrder = 0
    OnDblClick = lstPathListDblClick
  end
  object edtPath: TEdit
    Left = 24
    Top = 296
    Width = 289
    Height = 21
    TabOrder = 3
  end
  object btnAdd: TButton
    Left = 24
    Top = 328
    Width = 65
    Height = 25
    Caption = 'Add'
    TabOrder = 5
    OnClick = btnAddClick
  end
  object btnUp: TBitBtn
    Left = 320
    Top = 216
    Width = 41
    Height = 25
    Caption = 'Up'
    TabOrder = 1
    OnClick = btnUpClick
  end
  object btnDown: TBitBtn
    Left = 320
    Top = 256
    Width = 41
    Height = 25
    Caption = 'Down'
    TabOrder = 2
    OnClick = btnDownClick
  end
  object btnRemove: TButton
    Left = 183
    Top = 328
    Width = 66
    Height = 25
    Caption = 'Remove'
    TabOrder = 7
    OnClick = btnRemoveClick
  end
  object btnDlg: TButton
    Left = 320
    Top = 296
    Width = 17
    Height = 22
    Caption = '...'
    TabOrder = 4
    OnClick = btnDlgClick
  end
  object btnOK: TButton
    Left = 184
    Top = 384
    Width = 81
    Height = 25
    Caption = 'OK'
    Default = True
    TabOrder = 8
    OnClick = btnOKClick
  end
  object btnClose: TButton
    Left = 280
    Top = 384
    Width = 81
    Height = 25
    Caption = 'Close'
    TabOrder = 9
    OnClick = btnCloseClick
  end
  object btnReplace: TButton
    Left = 104
    Top = 328
    Width = 65
    Height = 25
    Caption = 'Replace'
    TabOrder = 6
    OnClick = btnReplaceClick
  end
  object XPManifest1: TXPManifest
    Left = 336
    Top = 48
  end
end
