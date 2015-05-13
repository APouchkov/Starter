object MainConnect: TMainConnect
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 167
  Top = 60
  Height = 150
  Width = 215
  object MSConnection: TUniConnection
    Database = 'FinamAccess'
    Authentication = auWindows
    Server = 'WALLBOARD'
    LoginPrompt = False
    Left = 24
    Top = 24
  end
  object MSQuery: TUniQuery
    Connection = MSConnection
    ReadOnly = True
    AutoCalcFields = False
    Left = 96
    Top = 24
  end
end
