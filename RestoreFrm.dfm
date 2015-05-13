object Restore: TRestore
  Left = 203
  Top = 91
  Width = 315
  Height = 277
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = #1042#1086#1089#1089#1090#1072#1085#1086#1074#1083#1077#1085#1080#1077
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  DesignSize = (
    307
    250)
  PixelsPerInch = 96
  TextHeight = 13
  object grd: TDBGridEh
    Left = 0
    Top = 0
    Width = 221
    Height = 250
    Align = alCustom
    AllowedOperations = [alopDeleteEh]
    Anchors = [akLeft, akTop, akRight, akBottom]
    AutoFitColWidths = True
    DataSource = src
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        DisplayFormat = 'dd.mm.yyyy hh:nn:ss'
        EditButtons = <>
        FieldName = 'time'
        Footers = <>
        Title.Caption = #1044#1072#1090#1072' '#1080' '#1074#1088#1077#1084#1103' '#1089#1086#1093#1088#1072#1085#1077#1085#1080#1103
        Width = 200
      end>
  end
  object btnRestore: TButton
    Left = 225
    Top = 1
    Width = 80
    Height = 24
    Anchors = [akTop, akRight]
    Caption = #1042#1086#1089#1089#1090#1072#1085#1086#1074#1080#1090#1100
    TabOrder = 1
    OnClick = btnRestoreClick
  end
  object btnDelete: TButton
    Left = 225
    Top = 225
    Width = 80
    Height = 24
    Anchors = [akRight, akBottom]
    Caption = #1059#1076#1072#1083#1080#1090#1100
    TabOrder = 2
    OnClick = btnDeleteClick
  end
  object src: TDataSource
    DataSet = tbl
    Left = 72
    Top = 72
  end
  object tbl: TUniTable
    TableName = 'bkp_acBackups'
    OrderFields = '[time] desc'
    Connection = MainConnect.MSConnection
    AfterOpen = tblAfterOpen
    AfterDelete = tblAfterOpen
    Left = 104
    Top = 72
  end
end
