unit RestoreData;

interface

uses
  SysUtils, Classes, IniFiles, DB, DBAccess, MSAccess, Dialogs, MemDS, Variants,
  Forms;

type
  TMainConnect = class(TDataModule)
    MSConnection: TUniConnection;
    MSQuery: TUniQuery;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainConnect: TMainConnect;

  function  ExecSQLString(const strSQL: String; ExecuteOnly: Boolean = False): Variant;

implementation

uses RestoreFrm;

{$R *.dfm}

function  ExecSQLString(const strSQL: String; ExecuteOnly: Boolean = False): Variant;
var
  id: Integer;
begin
  Result := Null;
  with MainConnect.MSQuery do try
    Close;
    SQL.Text := strSQL;
    if ExecuteOnly then Execute //except on E:Exception do ShowMessage(strSQL) end
    else begin
      Open;
      if not isEmpty then begin
        if Fields.Count=1 then begin
          if RecordCount>1 then begin
            Result := VarArrayCreate([0,RecordCount-1],varVariant);
            for id := RecordCount-1 downto 0 do begin
              RecNo := id;
              Result[id] := Fields[0].AsVariant
            end;
          end else
            Result := Fields[0].AsVariant
        end else begin
          Result := VarArrayCreate([0,Fields.Count-1],varVariant);
          for id := Fields.Count-1 downto 0 do Result[id] := Fields[id].AsVariant
        end;
      end;
    end
  finally
    Close;
    UnPrepare;
  end
end;

procedure TMainConnect.DataModuleCreate(Sender: TObject);
var
  fOptions: TStringList;
  i: Integer;
  r: Variant;
  Result: String;
begin
  ThousandSeparator:= ' ';
  DecimalSeparator := '.';

  DateSeparator   := '.';
  ShortDateFormat := 'dd.mm.yyyy';
  LongDateFormat  := 'dd.mm.yyyy';

  TimeSeparator   := ':';
  ShortTimeFormat := 'hh:nn:ss';
  LongTimeFormat  := 'hh:nn:ss';

  with TIniFile.Create(ChangeFileExt(ParamStr(0),'.ini')) do try
    fOptions := TStringList.Create;
    ReadSectionValues('connect',fOptions);
  finally
    Free
  end;

  with MSConnection do try
    Server   := fOptions.Values['server'];
    DataBase := fOptions.Values['database'];
    Connect;
    if not Connected then Exception.Create('Not connected');
    if (ParamCount=1) and (ParamStr(1)='/restore') then begin
      Application.CreateForm(TRestore,Restore);
      Restore.Show
    end else begin
      r := ExecSQLString('exec ac_Hide');
      Result := '';
      for i := 0 to VarArrayHighBound(r,1)-1 do begin
        Result := Result + r[i] + #13
      end;
      ShowMessage(Result)
    end;
  except on E:Exception do
    ShowMessage(E.Message)
  end;
end;

end.
