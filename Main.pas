unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, MemDS, DBAccess, ExtCtrls, Registry, HSDialogs,
  ImgList, VirtualTable, StdCtrls, Mask, StrUtils,
  DBCtrls, IniFiles, jpeg, cxGraphics, cxControls, cxLookAndFeels, Math,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxDBData, cxTextEdit, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxClasses, cxGridCustomView,
  cxGrid, cxContainer, cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxLabel, cxDBLabel, LayoutPanel, Uni, SQLServerUniProvider,
  cxNavigator, Winapi.ShellAPI, dxGDIPlusClasses;

type
  TStarterFrm = class(TForm)
    Panel1: TPanel;
    ImageHeader: TImage;
    Src: TDataSource;
    MSConnection: TUniConnection;
    Panel2: TPanel;
    ImageBg: TImage;
    qMenu: TUniQuery;
    ImageList: TImageList;
    Label1: TLabel;
    Label2: TLabel;
    eUser: TcxTextEdit;
    ePassword: TcxTextEdit;
    isMono: TCheckBox;
    btnOk: TButton;
    btnCancel: TButton;
    SrcRegimes: TDataSource;
    IconList: TImageList;
    lAdm: TLabel;
    spPermissions: TUniStoredProc;
    MSStoredProc: TUniStoredProc;
    cxGridDBTableView: TcxGridDBTableView;
    cxGridLevel: TcxGridLevel;
    cxGrid: TcxGrid;
    cxGridDBTableViewColumnImage: TcxGridDBColumn;
    cxGridDBTableViewColumnName: TcxGridDBColumn;
    cxStyleRepository: TcxStyleRepository;
    cxStyleBg: TcxStyle;
    qRegimes: TVirtualTable;
    qRegimesParam: TStringField;
    qRegimesImage: TIntegerField;
    qRegimesLabel: TStringField;
    lbName: TcxDBLabel;
    cxLookAndFeelController: TcxLookAndFeelController;
    lpRegimes: TLayoutPanel;
    lcbMode: TcxLookupComboBox;
    procedure SetFocused;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure qMenuAfterScroll(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure lAdmClick(Sender: TObject);
    procedure qMenuAfterOpen(DataSet: TDataSet);
    procedure cxGridDBTableViewColumnImageCustomDrawCell(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure cxGridDBTableViewCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
  private
    { Private declarations }
//    BitMap: TBitMap;
  public
    { Public declarations }
  end;

const
  ApplicationRegistry = '\Software\Програмный Стартер\';

var
  StarterFrm: TStarterFrm;

procedure SetLocalConfig(Field: String; FieldValue: String);
function  GetLocalConfig(Field: String; Default: String = ''): String;


implementation

uses AdminFrm, SBaseFileUtils;

{$R *.dfm}

procedure SetLocalConfig(Field: String; FieldValue: String);
begin
  with TRegistry.Create do try
    RootKey := HKEY_CURRENT_USER;
    OpenKey(ApplicationRegistry, True);
    WriteString(Field,FieldValue);
    CloseKey
  finally
    free
  end;
end;

function  GetLocalConfig(Field: String; Default: String = ''): String;
begin
  Result := Default;
  with TRegistry.Create(KEY_READ) do try
    RootKey := HKEY_CURRENT_USER;
    OpenKey(ApplicationRegistry, False);
    Result := ReadString(Field);
    if Result='' then Result := Default
  finally
    free
  end;
end;

procedure TStarterFrm.cxGridDBTableViewCellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  btnOk.Click
end;

procedure TStarterFrm.cxGridDBTableViewColumnImageCustomDrawCell(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  try
    ACanvas.FillRect(AViewInfo.RealBounds, cxStyleBg.Color);
    ACanvas.DrawImage(ImageList, AViewInfo.RealBounds.Left + 2, AViewInfo.RealBounds.Top + 2, IfThen(AViewInfo.GridRecord.Focused, 1, 0));
    ADone := True;
  except
  end;
end;

procedure TStarterFrm.FormCreate(Sender: TObject);
var
  fOptions: TStringList;
//  Registry: TRegistry;
begin
  fOptions := TStringList.Create;
  try
    with TIniFile.Create(ChangeFileExt(ParamStr(0), '.ini')) do try
      ReadSectionValues('connect', fOptions);
    finally
      Free
    end;

    if fOptions.Text<>'' then with MSConnection do begin
      Server   := fOptions.Values['server'];
      DataBase := fOptions.Values['database'];
      try
        MSConnection.Connect
      except on E:Exception do
        HSDialogs.HSMessageDlg(E.Message, mtError, [mbOK], 0);
      end;
    end;

    if MSConnection.Connected then begin
{
      with MSStoredProc do try try
        try Params[1].AsInteger := StrToInt(GetLocalConfig('*', '0')) except end;
        Execute;
        if not IsEmpty then begin
          Registry := TRegistry.Create;
          Registry.RootKey := HKEY_CURRENT_USER;
          try
            while not eof do begin
              Registry.DeleteKey(Fields[0].AsString);
              Next;
            end;
          finally
            Registry.Free;
          end;
          if not Params[1].IsNull then SetLocalConfig('*', Params[1].AsString);
        end;
      finally
        Close
      end except end;
}

{
      ehData.Open;
      ehData.AppendRecord([0,'Запуск приложения','enterprise']);
      ehData.AppendRecord([1,'Конфигуратор','config']);
      ehData.AppendRecord([2,'Отладчик','debug']);
      ehData.AppendRecord([3,'Монитор','?']);
      ehMode.KeyValue := 0;
}
      qMenu.Open;
      if qMenu.IsEmpty then
        qMenuAfterScroll(qMenu)
      else
        qMenu.Locate('Id', GetLocalConfig(''), []);
      try
        spPermissions.ExecProc;
        lAdm.Visible := (spPermissions.Params[0].AsInteger and 14) = 14;
      except end;
    end else Close
  finally
    fOptions.Free
  end;
end;

procedure TStarterFrm.FormDestroy(Sender: TObject);
begin
  try
    SetLocalConfig('{WIDTH}', IntToStr(Width));
    SetLocalConfig('{HEIGHT}', IntToStr(Height));
  except
  end;

  qRegimes.Close;
end;

procedure TStarterFrm.SetFocused;
begin
  if eUser.Text = '' then
    eUser.SetFocus
  else
    ePassword.SetFocus
end;

procedure TStarterFrm.btnCancelClick(Sender: TObject);
begin
  Close
end;

procedure TStarterFrm.btnOkClick(Sender: TObject);
var
  LParam, Exe, Dir, Params: String;
  LocalDir, LocalExe: String;
  I: Integer;
  LShowCmd: Integer;
begin
  if not qMenu.IsEmpty then begin
{
    if VarIsNull(ehMode.KeyValue) then
      i := 0
    else
      i := ehMode.KeyValue;

    ehData.Locate('Image', i, []);
}

    Exe := qMenu.FieldByName('CommandLine').AsString;
    I := Pos(';', Exe);
    if I > 0 then begin
      Params := Copy(Exe, Succ(I), Length(Exe) - I);
      Exe := Copy(Exe, 1, Pred(I));

      if not qRegimes.IsEmpty then
        Params := StringReplace(Params, '%PARAMS%', lcbMode.EditValue, [rfIgnoreCase]);

      LParam := qMenu.FieldByName('Param:Server').AsString;
      if not LParam.IsEmpty then begin
        with qMenu.FieldByName('Param:Share') do
          if AsString <> '' then LParam := LParam + '\' + AsString;
        Params := StringReplace(Params, '%SERVER%', LParam, [rfIgnoreCase]);
      end;

      with qMenu.FieldByName('Param:Dir') do
        if AsString <> '' then
          Params := StringReplace(Params, '%DIR%', AsString, [rfIgnoreCase]);

      Params := StringReplace(Params, '%USER%', eUser.Text, [rfIgnoreCase]);
      Params := StringReplace(Params, '%PASSWORD%', ePassword.Text, [rfIgnoreCase]);
      Params := StringReplace(Params, '%USERNAME%', GetEnvironmentVariable('USERNAME'), [rfIgnoreCase]);
    end else
      Params := '';

    Exe := StringReplace(Exe, '%PROGRAMFILES%', GetEnvironmentVariable('PROGRAMFILES'), [rfIgnoreCase]);
    Exe := StringReplace(Exe, '%USERNAME%', GetEnvironmentVariable('USERNAME'), [rfIgnoreCase]);

    Params := StringReplace(Params, '%PROGRAMNAME%', Exe, [rfIgnoreCase]);

    if isMono.Checked then params := params + ' /M';

    SetLocalConfig('', qMenu.FieldByName('Id').AsString);
    SetLocalConfig(qMenu.FieldByName('Name').AsString, eUser.Text);

    Dir := ExtractFilePath(Exe);
    if qMenu.FieldByName('RunFromLocalCopy').AsBoolean then begin
      LocalDir := SBaseFileUtils.GetTempPath;
      LocalExe := IncludeTrailingPathDelimiter(LocalDir) + ExtractFileName(Exe);
      if not CopyFile(PChar(Exe), PChar(LocalExe), True) then
        Raise Exception.Create('Ошибка копирования файла "' + Exe + '" на локальную машину по адресу ..."' + LocalExe + '"');
      Exe := LocalExe;
      LocalExe := SBaseFileUtils.GetTempFile('.cmd');
      SBaseFileUtils.SaveTextFile
      (
        LocalExe,
        'cd "' + Dir + '"'#13#10 +
        '"' + Exe + '" ' + params + #13#10 +
        'rmdir /S /Q "' + LocalDir + '"' + #13#10 +
        'del "' + LocalExe + '"'
      );
      Exe := LocalExe;
      params := '';
      LShowCmd := SW_HIDE;
    end else
      LShowCmd := SW_SHOWNORMAL;

    Winapi.ShellAPI.ShellExecute(Application.Handle
                    , 'open'
                    , PChar(Exe)
                    , PChar(params)
                    , PChar(Dir)
                    , LShowCmd
                );
    Close;
  end;
end;

procedure TStarterFrm.qMenuAfterScroll(DataSet: TDataSet);
var
  Params, Item: String;
  I1, I2: Integer;
begin
  if qMenu.IsEmpty then
    eUser.Text := ''
  else begin
//    lbName.Caption := qRegimesLabel.AsString;
    eUser.Text := GetLocalConfig(qMenu.FieldByName('Name').AsString, qMenu.FieldByName('DefaultUser').AsString);
  end;
  ePassword.Text := '';

  try
    if AnsiPos('%USER%', qMenu.FieldByName('CommandLine').AsString) = 0 then begin
      eUser.Properties.ReadOnly := True;
      eUser.Style.Color := clBtnFace;
    end else begin
      eUser.Properties.ReadOnly := False;
      eUser.Style.Color := clWindow;
    end;

    if AnsiPos('%PASSWORD%', qMenu.FieldByName('CommandLine').AsString) = 0 then begin
      ePassword.Properties.ReadOnly := True;
      ePassword.Style.Color := clBtnFace;
    end else begin
      ePassword.Properties.ReadOnly := False;
      ePassword.Style.Color := clWindow;
    end;

    while (not qRegimes.IsEmpty) do qRegimes.Delete;
    Params := Trim(qMenu.FieldByName('Param:List').AsString);

    while Params <> '' do begin
      I1 := Pos(';', Params);
      if I1 > 0 then begin
        Item   := Copy(Params, 1, Pred(I1));
        Params := Copy(Params, Succ(I1), Length(Params) - I1);
      end else begin
        Item   := Params;
        Params := '';
      end;
      I1 := Pos( ':', Item );
      if I1 = 0 then Break;
      I2 := PosEx( ':', Item, Succ(I1) );
      if I2 <> I1 + 2 then Break;
      qRegimes.AppendRecord([
                  Copy(Item, 1, Pred(I1))
                , StrToInt(Copy(Item,Succ(I1),Pred(I2-I1)))
                , Copy(Item,Succ(I2),Length(Item)-I2)
                          ]);
    end;

    if not qRegimes.IsEmpty then begin
      qRegimes.First;
      lcbMode.EditValue := qRegimesParam.AsString;
      lpRegimes.Visible := True;
    end
    else
//      ehMode.Text := '';
      lpRegimes.Visible := False;
  except
  end;
end;

procedure TStarterFrm.FormShow(Sender: TObject);
begin
  try
    Width  := StrToInt(GetLocalConfig('{WIDTH}'));
    Height := StrToInt(GetLocalConfig('{HEIGHT}'));
  except
  end;
  SetFocused;
end;

procedure TStarterFrm.lAdmClick(Sender: TObject);
begin
  TAdmin.Create(Application).ShowModal;
  GridReOpen(cxGridDBTableView)
end;

procedure TStarterFrm.qMenuAfterOpen(DataSet: TDataSet);
begin
  btnOk.Enabled := not qMenu.IsEmpty
end;

end.
