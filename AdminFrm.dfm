object Admin: TAdmin
  Left = 111
  Top = 66
  BorderIcons = [biSystemMenu]
  Caption = #1040#1076#1084#1080#1085#1080#1089#1090#1088#1072#1090#1080#1074#1085#1072#1103' '#1092#1086#1088#1084#1072' '#1076#1086#1089#1090#1091#1087#1072
  ClientHeight = 562
  ClientWidth = 1464
  Color = clBtnFace
  Constraints.MinHeight = 400
  Constraints.MinWidth = 700
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Icon.Data = {
    0000010001001010100000000000280100001600000028000000100000002000
    00000100040000000000C0000000600000006000000010000000000000000000
    000004828400C4C2C400FFFFFF0004FEFC00CCD2D40006001300000000008200
    780000000100001313000000000000083A000000060000000500000000000000
    0000000000000000000000000000001111111111100000134444444410000013
    1111111210000013444444441000001311111112100000134444444410000013
    3333333310000001111111111000000010111110100000001000001000000000
    100000100000000012000110000000000120010000000000001111000000FFFF
    0000C0070000C0030000C0030000C0030000C0030000C0030000C0030000C003
    0000E0030000F0070000F3CF0000F3CF0000F18F0000F81F0000FC3F0000}
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 1464
    Height = 562
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 792
    ExplicitHeight = 523
    object TabSheet1: TTabSheet
      Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1080
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object cxGridUsers: TcxGrid
        Left = 0
        Top = 0
        Width = 250
        Height = 534
        Align = alLeft
        TabOrder = 0
        LookAndFeel.NativeStyle = True
        object cxGridUsersDBTableViewUsers: TcxGridDBTableView
          PopupMenu = pm1
          Navigator.Buttons.CustomButtons = <>
          OnCellDblClick = cxGridUsersDBTableViewUsersCellDblClick
          OnFocusedRecordChanged = cxGridUsersDBTableViewUsersFocusedRecordChanged
          DataController.DataSource = SrcUsers
          DataController.KeyFieldNames = 'Login'
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsBehavior.IncSearch = True
          OptionsCustomize.ColumnFiltering = False
          OptionsCustomize.ColumnGrouping = False
          OptionsCustomize.ColumnHidingOnGrouping = False
          OptionsCustomize.ColumnHorzSizing = False
          OptionsCustomize.ColumnMoving = False
          OptionsCustomize.ColumnSorting = False
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsSelection.InvertSelect = False
          OptionsView.ColumnAutoWidth = True
          OptionsView.GroupByBox = False
          object cxGridUsersDBTableViewUsersColumn1: TcxGridDBColumn
            Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100
            DataBinding.FieldName = 'Login'
            PropertiesClassName = 'TcxTextEditProperties'
            SortIndex = 0
            SortOrder = soAscending
            Width = 228
          end
        end
        object cxGridUsersLevelUsers: TcxGridLevel
          GridView = cxGridUsersDBTableViewUsers
        end
      end
      object cxGridLinks: TcxGrid
        Left = 250
        Top = 0
        Width = 1206
        Height = 534
        Align = alClient
        TabOrder = 1
        LookAndFeel.NativeStyle = True
        object cxGridDBTableViewLinks: TcxGridDBTableView
          OnKeyDown = cxGridDBTableViewLinksKeyDown
          Navigator.Buttons.CustomButtons = <>
          OnCellClick = cxGridDBTableViewLinksCellClick
          OnCellDblClick = cxGridDBTableViewLinksCellDblClick
          DataController.DataSource = SrcAccess
          DataController.KeyFieldNames = 'Menu_Id'
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsCustomize.ColumnFiltering = False
          OptionsCustomize.ColumnGrouping = False
          OptionsCustomize.ColumnHidingOnGrouping = False
          OptionsCustomize.ColumnHorzSizing = False
          OptionsCustomize.ColumnMoving = False
          OptionsCustomize.ColumnSorting = False
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Inserting = False
          OptionsSelection.InvertSelect = False
          OptionsView.ColumnAutoWidth = True
          OptionsView.GroupByBox = False
          object cxGridDBTableViewLinksColumnChecked: TcxGridDBColumn
            Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100
            DataBinding.FieldName = 'SignVisible'
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.ImmediatePost = True
            MinWidth = 25
            Options.Editing = False
            Options.Filtering = False
            Options.IncSearch = False
            Options.AutoWidthSizable = False
            Options.Grouping = False
            Options.HorzSizing = False
            Options.Moving = False
            Options.Sorting = False
            Width = 25
          end
          object cxGridDBTableViewLinksColumnName: TcxGridDBColumn
            Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
            DataBinding.FieldName = 'Menu_Name'
            Options.Editing = False
            SortIndex = 0
            SortOrder = soAscending
            Width = 400
          end
          object cxGridDBTableViewLinksColumnUser: TcxGridDBColumn
            Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100' '#1087#1086'-'#1091#1084#1086#1083#1095#1072#1085#1080#1102
            DataBinding.FieldName = 'DefaultUser'
            Width = 100
          end
        end
        object cxGridLevelLinks: TcxGridLevel
          GridView = cxGridDBTableViewLinks
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = #1069#1083#1077#1084#1077#1085#1090#1099' '#1084#1077#1085#1102
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object GroupBox1: TGroupBox
        Left = 0
        Top = 0
        Width = 1456
        Height = 474
        Align = alClient
        Caption = ' '#1057#1087#1080#1089#1086#1082' '#1089#1091#1097#1077#1089#1090#1074#1091#1102#1097#1080#1093' '#1073#1072#1079' '
        TabOrder = 0
        object cxGridProgramms: TcxGrid
          Left = 2
          Top = 15
          Width = 1452
          Height = 457
          Align = alClient
          TabOrder = 0
          LookAndFeel.NativeStyle = True
          object cxGridDBTableViewProgramms: TcxGridDBTableView
            PopupMenu = pm3
            Navigator.Buttons.CustomButtons = <>
            DataController.DataSource = SrcMenu
            DataController.KeyFieldNames = 'Id'
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            OptionsCustomize.ColumnFiltering = False
            OptionsCustomize.ColumnGrouping = False
            OptionsCustomize.ColumnHidingOnGrouping = False
            OptionsCustomize.ColumnMoving = False
            OptionsCustomize.ColumnSorting = False
            OptionsData.CancelOnExit = False
            OptionsData.Deleting = False
            OptionsData.DeletingConfirmation = False
            OptionsData.Inserting = False
            OptionsSelection.InvertSelect = False
            OptionsView.ColumnAutoWidth = True
            OptionsView.GroupByBox = False
            object cxGridProgrammsColumnWhite: TcxGridDBColumn
              Caption = '!'
              DataBinding.FieldName = 'White'
              PropertiesClassName = 'TcxCheckBoxProperties'
              Properties.ImmediatePost = True
              HeaderAlignmentHorz = taCenter
              Options.AutoWidthSizable = False
              Width = 20
            end
            object cxGridProgrammsColumnName: TcxGridDBColumn
              Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
              DataBinding.FieldName = 'Name'
              Options.AutoWidthSizable = False
              SortIndex = 0
              SortOrder = soAscending
              Width = 250
            end
            object cxGridProgrammsColumnPath: TcxGridDBColumn
              Caption = #1055#1091#1090#1100' '#1082' '#1087#1088#1086#1075#1088#1072#1084#1084#1077
              DataBinding.FieldName = 'CommandLine'
              Width = 100
            end
            object cxGridProgrammsColumnServer: TcxGridDBColumn
              Caption = #1057#1077#1088#1074#1077#1088
              DataBinding.FieldName = 'Param:Server'
              Options.AutoWidthSizable = False
              Width = 100
            end
            object cxGridProgrammsColumnShare: TcxGridDBColumn
              Caption = #1064#1072#1088#1072' / '#1048#1085#1089#1090#1072#1085#1089
              DataBinding.FieldName = 'Param:Share'
              Options.AutoWidthSizable = False
              Width = 100
            end
            object cxGridProgrammsColumnDir: TcxGridDBColumn
              Caption = #1044#1080#1088#1077#1082#1090#1086#1088#1080#1103' / '#1041#1072#1079#1072
              DataBinding.FieldName = 'Param:Dir'
              Options.AutoWidthSizable = False
              Width = 100
            end
            object cxGridProgrammsColumnParams: TcxGridDBColumn
              Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099
              DataBinding.FieldName = 'Param:List'
              Options.AutoWidthSizable = False
              Width = 200
            end
            object cxGridProgrammsColumnRunFromLocalCopy: TcxGridDBColumn
              Caption = #1047#1072#1087#1091#1089#1082#1072#1090#1100' '#1089' '#1083#1086#1082#1072#1083#1100#1085#1086#1081' '#1082#1086#1087#1080#1080
              DataBinding.FieldName = 'RunFromLocalCopy'
              Options.AutoWidthSizable = False
              Width = 20
            end
          end
          object cxGridLevelProgramms: TcxGridLevel
            GridView = cxGridDBTableViewProgramms
          end
        end
      end
      object GroupBox2: TGroupBox
        Left = 0
        Top = 474
        Width = 1456
        Height = 60
        Align = alBottom
        Caption = ' '#1040#1074#1090#1086#1079#1072#1084#1077#1085#1072' '
        Constraints.MinWidth = 1200
        TabOrder = 1
        object btnCopy: TSpeedButton
          Left = 5
          Top = 16
          Width = 20
          Height = 36
          Glyph.Data = {
            E6000000424DE60000000000000076000000280000000C0000000E0000000100
            04000000000070000000C40E0000C40E0000100000000000000000000000CCD2
            D40084020400FFFFFF00F001B800060003005F00130000000000820028000000
            FC0000131500000000000006D800000006000000570000000000111111111111
            0000111222222222000011123333333200001112300000320000000233333332
            0000033230000032000003023333333200000332300322220000030233332321
            0000033233332211000003022222211100000333303011110000033330011111
            00000000001111110000}
          OnClick = btnCopyClick
        end
        object btnReplace: TSpeedButton
          Left = 1055
          Top = 17
          Width = 140
          Height = 35
          Caption = #1047#1072#1084#1077#1085#1080#1090#1100' '#1079#1085#1072#1095#1077#1085#1080#1077
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00000000000000000000000000000000000000000000000000000000000000
            00000000000000000000000000000000000000000000FF00FF00FF00FF000000
            0000008484000084840000000000000000000000000000000000000000000000
            0000C6C6C600C6C6C600000000000084840000000000FF00FF00FF00FF000000
            0000008484000084840000000000000000000000000000000000000000000000
            0000C6C6C600C6C6C600000000000084840000000000FF00FF00FF00FF000000
            0000008484000084840000000000000000000000000000000000000000000000
            0000C6C6C600C6C6C600000000000084840000000000FF00FF00FF00FF000000
            0000008484000084840000000000000000000000000000000000000000000000
            00000000000000000000000000000084840000000000FF00FF00FF00FF000000
            0000008484000084840000848400008484000084840000848400008484000084
            84000084840000848400008484000084840000000000FF00FF00FF00FF000000
            0000008484000084840000000000000000000000000000000000000000000000
            00000000000000000000008484000084840000000000FF00FF00FF00FF000000
            00000084840000000000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
            C600C6C6C600C6C6C600000000000084840000000000FF00FF00FF00FF000000
            00000084840000000000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
            C600C6C6C600C6C6C600000000000084840000000000FF00FF00FF00FF000000
            00000084840000000000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
            C600C6C6C600C6C6C600000000000084840000000000FF00FF00FF00FF000000
            00000084840000000000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
            C600C6C6C600C6C6C600000000000084840000000000FF00FF00FF00FF000000
            00000084840000000000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
            C600C6C6C600C6C6C600000000000000000000000000FF00FF00FF00FF000000
            00000084840000000000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
            C600C6C6C600C6C6C60000000000C6C6C60000000000FF00FF00FF00FF000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000000000000000000000000000000000000000FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
          OnClick = btnReplaceClick
        end
        object GroupBox3: TGroupBox
          Left = 30
          Top = 12
          Width = 250
          Height = 40
          Caption = ' ProgramPath '
          TabOrder = 0
          object eProgramPath: TEdit
            AlignWithMargins = True
            Left = 7
            Top = 15
            Width = 236
            Height = 21
            Margins.Left = 5
            Margins.Top = 0
            Margins.Right = 5
            Margins.Bottom = 2
            Align = alClient
            TabOrder = 0
          end
        end
        object gbServer: TGroupBox
          Left = 285
          Top = 12
          Width = 100
          Height = 40
          Caption = ' Server '
          TabOrder = 1
          object eServer: TEdit
            AlignWithMargins = True
            Left = 7
            Top = 15
            Width = 86
            Height = 21
            Margins.Left = 5
            Margins.Top = 0
            Margins.Right = 5
            Margins.Bottom = 2
            Align = alClient
            TabOrder = 0
          end
        end
        object cbShare: TGroupBox
          Left = 390
          Top = 12
          Width = 100
          Height = 40
          Caption = ' Share '
          TabOrder = 2
          object eShare: TEdit
            AlignWithMargins = True
            Left = 7
            Top = 15
            Width = 86
            Height = 21
            Margins.Left = 5
            Margins.Top = 0
            Margins.Right = 5
            Margins.Bottom = 2
            Align = alClient
            TabOrder = 0
          end
        end
        object GroupBox4: TGroupBox
          Left = 495
          Top = 12
          Width = 115
          Height = 40
          Caption = ' Dir '
          TabOrder = 3
          object eDir: TEdit
            AlignWithMargins = True
            Left = 7
            Top = 15
            Width = 101
            Height = 21
            Margins.Left = 5
            Margins.Top = 0
            Margins.Right = 5
            Margins.Bottom = 2
            Align = alClient
            TabOrder = 0
          end
        end
        object GroupBox5: TGroupBox
          Left = 615
          Top = 12
          Width = 250
          Height = 40
          Caption = ' '#1053#1086#1074#1086#1077' '#1079#1085#1072#1095#1077#1085#1080#1077' '
          TabOrder = 4
          object eRepalceValue: TEdit
            AlignWithMargins = True
            Left = 7
            Top = 15
            Width = 236
            Height = 21
            Margins.Left = 5
            Margins.Top = 0
            Margins.Right = 5
            Margins.Bottom = 2
            Align = alClient
            TabOrder = 0
          end
        end
        object GroupBox6: TGroupBox
          Left = 870
          Top = 12
          Width = 180
          Height = 40
          Caption = ' '#1047#1072#1084#1077#1085#1103#1077#1084#1086#1077' '#1087#1086#1083#1077' '
          TabOrder = 5
          object lcbField: TcxLookupComboBox
            AlignWithMargins = True
            Left = 7
            Top = 15
            Margins.Left = 5
            Margins.Top = 0
            Margins.Right = 5
            Margins.Bottom = 2
            Align = alClient
            Properties.KeyFieldNames = 'nn'
            Properties.ListColumns = <
              item
                FieldName = 'FieldName'
              end>
            Properties.ListOptions.ShowHeader = False
            Properties.ListSource = dsFields
            Style.LookAndFeel.Kind = lfFlat
            StyleDisabled.LookAndFeel.Kind = lfFlat
            StyleFocused.BorderStyle = ebsFlat
            StyleFocused.LookAndFeel.Kind = lfFlat
            StyleHot.BorderStyle = ebsFlat
            StyleHot.LookAndFeel.Kind = lfFlat
            TabOrder = 0
            Width = 166
          end
        end
      end
    end
  end
  object SrcUsers: TDataSource
    DataSet = qUsers
    Left = 60
    Top = 128
  end
  object SrcAccess: TDataSource
    DataSet = qAccess
    Left = 308
    Top = 144
  end
  object SrcMenu: TDataSource
    DataSet = qMenu
    Left = 228
    Top = 264
  end
  object qAccess: TUniQuery
    SQLUpdate.Strings = (
      'MERGE [Starter].[Rights] R'
      
        'USING (VALUES(1)) N([None]) ON R.[User_Id] = :OLD_User_Id AND [M' +
        'enu_Id] = :OLD_Menu_Id'
      'WHEN MATCHED AND :[SignVisible] = 1 THEN UPDATE SET'
      '  [Default:Param:User] = :[Default:Param:User]'
      'WHEN MATCHED AND :[SignVisible] = 0 THEN DELETE'
      'WHEN NOT MATCHED BY TARGET AND :[SignVisible] = 1 THEN'
      '  INSERT ([User_Id], [Menu_Id], [Default:Param:User])'
      '  VALUES(:OLD_User_Id, :OLD_Menu_Id, :[Default:Param:User]);')
    SQLRefresh.Strings = (
      'SELECT'
      '  [User_Id]     = :[User_Id],'
      '  [Menu_Id]     = M.[Id],'
      '  [Menu_Name]   = M.[Name],'
      
        '  [SignVisible] = CASE WHEN V.[Menu_Id] IS NOT NULL THEN CAST(1 ' +
        'AS BIT) ELSE CAST(0 AS BIT) END,'
      '  [DefaultUser] = V.[Default:Param:User]'
      'FROM [Starter].[Menu] m'
      
        'LEFT JOIN [Starter].[Rights] V ON M.[Id] = V.[Menu_Id] AND V.[Us' +
        'er_Id] = :[User_Id]'
      'WHERE M.[Id] = :OLD_Menu_Id')
    Connection = StarterFrm.MSConnection
    SQL.Strings = (
      'SELECT'
      '  [User_Id]     = :[User_Id],'
      '  [Menu_Id]     = M.[Id],'
      '  [Menu_Name]   = M.[Name],'
      
        '  [SignVisible] = CASE WHEN V.[Menu_Id] IS NOT NULL THEN CAST(1 ' +
        'AS BIT) ELSE CAST(0 AS BIT) END,'
      '  [DefaultUser] = V.[Default:Param:User]'
      'FROM [Starter].[Menu] m'
      
        'LEFT JOIN [Starter].[Rights] v ON M.[Id] = V.[Menu_Id] AND V.[Us' +
        'er_Id] = :[User_Id]')
    RefreshOptions = [roAfterUpdate]
    Options.SetFieldsReadOnly = False
    Options.StrictUpdate = False
    AfterOpen = qAccessAfterOpen
    Left = 340
    Top = 144
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Menu_Id'
        Value = nil
      end
      item
        DataType = ftUnknown
        Name = 'User_Id'
        Value = nil
      end>
  end
  object pm1: TPopupMenu
    Images = ImageList
    OnPopup = pm1Popup
    Left = 132
    Top = 128
    object mnAdd1: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103
      ImageIndex = 1
      ShortCut = 45
      OnClick = mnAdd1Click
    end
    object mnModify1: TMenuItem
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      ImageIndex = 0
      ShortCut = 13
      OnClick = mnModify1Click
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object mnRefresh1: TMenuItem
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100' '#1089#1087#1080#1089#1086#1082
      ImageIndex = 4
      ShortCut = 116
      OnClick = mnRefresh1Click
    end
    object N4: TMenuItem
      Caption = '-'
    end
    object mnBackLink: TMenuItem
      AutoCheck = True
      Caption = #1054#1073#1088#1072#1090#1085#1072#1103' '#1089#1074#1103#1079#1100
      ImageIndex = 5
      ShortCut = 16450
      OnClick = mnBackLinkClick
    end
    object mnStels: TMenuItem
      Caption = #1056#1077#1078#1080#1084' '#1086#1075#1088#1072#1085#1080#1095#1077#1085#1080#1081
      Enabled = False
      OnClick = mnStelsClick
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object mnDelete1: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103
      ImageIndex = 3
      ShortCut = 16430
      OnClick = mnDelete1Click
    end
  end
  object qMenu: TUniTable
    TableName = '[Starter].[Menu]'
    OrderFields = 'Name'
    Connection = StarterFrm.MSConnection
    AfterOpen = qMenuAfterOpen
    AfterPost = qMenuAfter
    AfterScroll = qMenuAfterScroll
    Options.SetFieldsReadOnly = False
    Options.RequiredFields = False
    Options.StrictUpdate = False
    Left = 260
    Top = 264
  end
  object pm3: TPopupMenu
    Images = ImageList
    OnPopup = pm3Popup
    Left = 308
    Top = 264
    object mnModify3: TMenuItem
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      ImageIndex = 0
      ShortCut = 13
      OnClick = mnModify3Click
    end
    object mnAdd3: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1101#1083#1077#1084#1077#1085#1090
      ImageIndex = 1
      ShortCut = 45
      OnClick = mnAdd3Click
    end
    object mnCopy3: TMenuItem
      Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100' '#1074' '#1085#1086#1074#1099#1081
      ImageIndex = 2
      OnClick = mnCopy3Click
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object mnRefresh3: TMenuItem
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100' '#1089#1087#1080#1089#1086#1082' '#1073#1072#1079
      ImageIndex = 4
      ShortCut = 116
      OnClick = mnRefresh3Click
    end
    object MenuItem3: TMenuItem
      Caption = '-'
    end
    object mnDelete3: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1101#1083#1077#1084#1077#1085#1090
      ImageIndex = 3
      ShortCut = 16430
      OnClick = mnDelete3Click
    end
  end
  object ImageList: TImageList
    Left = 116
    Top = 200
    Bitmap = {
      494C010106000900780010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000002000000001001000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000004000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      8C31000000000000000000000000000000000040004000400040007C00400000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008C31
      8C31000000000000000000000000000000000040007C007C007C007C007C0040
      1042000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000008C318C31
      8C318C318C310000000000000000000000000040004000400040007C00400000
      1042000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008C31
      8C31000000008C31000000000000000000000000000000000000004000000000
      1042000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      8C31000000008C31000000000000000000000000000000000000100000000000
      1042000000000000000000001000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008C3100000000
      0000000000008C310000000000000000000010001000100010001F0010000000
      1042000010001000100010001F00100000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008C3100000000
      8C310000000000000000000000000000000010001F001F001F001F001F001000
      1042000010001F001F001F001F001F0010000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008C3100000000
      8C318C31000000000000000000000000000010001000100010001F0010000000
      1042000010001000100010001F00100000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000008C318C31
      8C318C318C310000000000000000000000000000000000000000100000000000
      1042000000000000000000001000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      8C318C3100000000000000000000000000000000000000000000000000000000
      1042000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      8C31000000000000000000000000000000000000000000000000E07F00000000
      1042000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000E07FE07FE07FE07FE07F0000
      1042000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E07F00000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000007C00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000010001000
      10001000100010001000100010000000000000000000007C0000000010421042
      104210421042104210421042007C000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000001000FF7F
      FF7FFF7FFF7FFF7FFF7FFF7F10000000000000000000007C007C000000000000
      00000000000000000000007C007C000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000001000FF7F
      00000000000000000000FF7F10000000000000000000007C007C0000E07FFF7F
      FF7FE07FFF7FFF7F007C007C0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000001000FF7F
      FF7FFF7FFF7FFF7FFF7FFF7F100000000000000000000000007C007CFF7F1F00
      1F001F001F00FF7F007C10420000000000000000000000000000000000001000
      0000000000000000000000000000000000000000000000000000004000000000
      000000000040000000000000000000000000000000000000FF7FFF7F1000FF7F
      00000000000000000000FF7F1000000000000000000000000000007C007C1F00
      1F001F00007C007C000010420000000000000000000000000000000000001000
      1000000000000000000000000000000000000000000000000000004000400000
      000000000040004000000000000000000000000000000000FF7F00001000FF7F
      FF7FFF7FFF7FFF7FFF7FFF7F10000000000000000000000000000000007C007C
      FF7FE07F007CFF7F000010420000000000000000000000000000000000001000
      1000100000000000000000000000000000000000000000000000004000400040
      000000000040004000400000000000000000000000000000FF7FFF7F1000FF7F
      00000000FF7F10001000100010000000000000000000000000000000FF7F007C
      007C007C007CFF7F000010420000000000000000000000000000000000001000
      10001F000000000000000000000000000000000000000000000000400040007C
      0000000000400040007C0000000000000000000000000000FF7F00001000FF7F
      FF7FFF7FFF7F1000FF7F100000000000000000000000000000000000FF7F007C
      007C007C007CFF7F000010420000000000000000000000000000000000001000
      1F000000000000000000000000000000000000000000000000000040007C0000
      000000000040007C00000000000000000000000000000000FF7FFF7F1000FF7F
      FF7FFF7FFF7F10001000000000000000000000000000000000000000E07F007C
      FF7F0000007CFF7F000010420000000000000000000000000000000000001F00
      0000000000000000000000000000000000000000000000000000007C00000000
      00000000007C000000000000000000000000000000000000FF7F000010001000
      10001000100010000000000000000000000000000000000000000000007C007C
      FF7F0000007C007C007C00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF7FFF7FFF7FFF7F
      0000FF7F0000000000000000000000000000000000000000007C007C007CE07F
      FF7F0000FF7F0000007C007C0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF7FFF7FFF7FFF7F
      00000000000000000000000000000000000000000000007C007C007C00000000
      00000000000000000000007C007C000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000007C00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000200000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFF00000000FFFFF7FF00000000
      FEFF03FF00000000FCFF00FF00000000F83F02FF00000000FCDFF6FF00000000
      FEDFF6FB00000000F7DF028100000000F6FF008000000000F67F028100000000
      F83FF6FB00000000FE7FF6FF00000000FEFF02FF00000000FFFF00FF00000000
      FFFF03FF00000000FFFFF7FF00000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD
      FFFFFFFFF803D803FFFFFFFFF803C003FFFFFFFFF803C007FDFFF7BFC003E007
      FCFFF39FC003F007FC7FF18FC003F007FC3FF087C003F007FC7FF18FC007F007
      FCFFF39FC00FF007FDFFF7BFC01FF00FFFFFFFFFC03FE027FFFFFFFFC07FC033
      FFFFFFFFC0FFFFFDFFFFFFFFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object dsFields: TDataSource
    DataSet = vFields
    Left = 380
    Top = 328
  end
  object vFields: TVirtualTable
    Options = [voPersistentData, voStored, voSkipUnSupportedFieldTypes]
    Left = 412
    Top = 328
    Data = {03000000000000000000}
    object vFieldsnn: TSmallintField
      FieldName = 'nn'
    end
    object vFieldsFieldName: TStringField
      FieldName = 'FieldName'
      Size = 50
    end
  end
  object qReplace: TUniQuery
    LocalUpdate = True
    Connection = StarterFrm.MSConnection
    SQL.Strings = (
      
        'UPDATE [Starter].[Menu] SET &Field = :FieldValue Where [CommandL' +
        'ine] LIKE :[CommandLine]'
      '&where')
    ReadOnly = True
    Options.SetFieldsReadOnly = False
    Options.StrictUpdate = False
    Left = 468
    Top = 208
    ParamData = <
      item
        DataType = ftString
        Name = 'FieldValue'
        Value = nil
      end>
    MacroData = <
      item
        Name = 'Field'
      end
      item
        Name = 'where'
      end>
  end
  object qUsers: TUniQuery
    Connection = StarterFrm.MSConnection
    SQL.Strings = (
      'SELECT *'
      'FROM [Starter].[Users]'
      '&where')
    Options.SetFieldsReadOnly = False
    Options.RequiredFields = False
    Options.StrictUpdate = False
    AfterPost = qUsersAfter
    AfterCancel = qUsersAfter
    AfterScroll = qUsersAfterScroll
    Left = 92
    Top = 128
    MacroData = <
      item
        Name = 'where'
      end>
  end
  object qStels: TUniQuery
    SQLUpdate.Strings = (
      
        'Update [Starter].[Variables] SET [Value] = :Stels WHERE [Name] =' +
        ' '#39'Stels'#39)
    LocalUpdate = True
    Connection = StarterFrm.MSConnection
    SQL.Strings = (
      
        'SELECT [Stels] = Cast([Value] AS Bit) FROM [Starter].[Variables]' +
        ' WHERE [Name] = '#39'Stels'#39)
    Options.SetFieldsReadOnly = False
    Options.StrictUpdate = False
    Left = 516
    Top = 208
    MacroData = <
      item
        Name = 'Field'
      end
      item
        Name = 'where'
      end>
  end
end
