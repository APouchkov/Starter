unit AdminFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, ComCtrls, Menus, ImgList, Math, VirtualTable, Buttons, ClipBrd, cxGridDBDataDefinitions,
  Mask, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxDBData, cxTextEdit,
  cxCheckBox, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGridLevel, cxClasses, cxGridCustomView, cxGrid, cxContainer, cxMaskEdit,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, Uni, MemDS,
  DBAccess, UITypes, RTLConsts, cxNavigator, dxCoreClasses, dxSkinsCore,
  dxSkinsDefaultPainters, dxSkinscxPCPainter, System.ImageList;

type
  TAdmin = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    SrcUsers: TDataSource;
    SrcAccess: TDataSource;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    SrcMenu: TDataSource;
    qAccess: TUniQuery;
    pm1: TPopupMenu;
    mnModify1: TMenuItem;
    mnAdd1: TMenuItem;
    N1: TMenuItem;
    mnDelete1: TMenuItem;
    qMenu: TUniTable;
    pm3: TPopupMenu;
    mnModify3: TMenuItem;
    mnAdd3: TMenuItem;
    MenuItem3: TMenuItem;
    mnDelete3: TMenuItem;
    mnCopy3: TMenuItem;
    ImageList: TImageList;
    N2: TMenuItem;
    mnRefresh1: TMenuItem;
    N3: TMenuItem;
    mnRefresh3: TMenuItem;
    btnCopy: TSpeedButton;
    GroupBox3: TGroupBox;
    eProgramPath: TEdit;
    gbServer: TGroupBox;
    eServer: TEdit;
    cbShare: TGroupBox;
    eShare: TEdit;
    GroupBox4: TGroupBox;
    eDir: TEdit;
    GroupBox5: TGroupBox;
    eRepalceValue: TEdit;
    GroupBox6: TGroupBox;
    dsFields: TDataSource;
    vFields: TVirtualTable;
    btnReplace: TSpeedButton;
    qReplace: TUniQuery;
    N4: TMenuItem;
    mnBackLink: TMenuItem;
    qUsers: TUniQuery;
    cxGridUsersDBTableViewUsers: TcxGridDBTableView;
    cxGridUsersLevelUsers: TcxGridLevel;
    cxGridUsers: TcxGrid;
    cxGridUsersDBTableViewUsersColumn1: TcxGridDBColumn;
    cxGridLinks: TcxGrid;
    cxGridDBTableViewLinks: TcxGridDBTableView;
    cxGridDBTableViewLinksColumnChecked: TcxGridDBColumn;
    cxGridLevelLinks: TcxGridLevel;
    cxGridDBTableViewLinksColumnName: TcxGridDBColumn;
    cxGridDBTableViewLinksColumnUser: TcxGridDBColumn;
    cxGridProgramms: TcxGrid;
    cxGridDBTableViewProgramms: TcxGridDBTableView;
    cxGridProgrammsColumnName: TcxGridDBColumn;
    cxGridProgrammsColumnPath: TcxGridDBColumn;
    cxGridLevelProgramms: TcxGridLevel;
    cxGridProgrammsColumnServer: TcxGridDBColumn;
    cxGridProgrammsColumnShare: TcxGridDBColumn;
    cxGridProgrammsColumnDir: TcxGridDBColumn;
    cxGridProgrammsColumnParams: TcxGridDBColumn;
    lcbField: TcxLookupComboBox;
    vFieldsnn: TSmallintField;
    vFieldsFieldName: TStringField;
    cxGridProgrammsColumnWhite: TcxGridDBColumn;
    mnStels: TMenuItem;
    qStels: TUniQuery;
    cxGridProgrammsColumnRunFromLocalCopy: TcxGridDBColumn;

    procedure StringFieldChange(Sender: TField);
    procedure mnModify1Click(Sender: TObject);
    procedure qUsersAfter(DataSet: TDataSet);
    procedure mnAdd1Click(Sender: TObject);
    procedure qUsersAfterScroll(DataSet: TDataSet);
    procedure pm1Popup(Sender: TObject);
    procedure mnDelete1Click(Sender: TObject);

    procedure pm3Popup(Sender: TObject);
    procedure mnDelete3Click(Sender: TObject);
    procedure qMenuAfter(DataSet: TDataSet);
    procedure mnModify3Click(Sender: TObject);
    procedure mnAdd3Click(Sender: TObject);
    procedure mnCopy3Click(Sender: TObject);
    procedure mnRefresh1Click(Sender: TObject);
    procedure mnRefresh3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnCopyClick(Sender: TObject);
    procedure btnReplaceClick(Sender: TObject);
    procedure mnBackLinkClick(Sender: TObject);
    procedure qMenuAfterScroll(DataSet: TDataSet);
    procedure cxGridUsersDBTableViewUsersCellDblClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure cxGridDBTableViewLinksCellClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure cxGridDBTableViewLinksCellDblClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure cxGridDBTableViewLinksKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cxGridUsersDBTableViewUsersFocusedRecordChanged(Sender: TcxCustomGridTableView; APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure qMenuAfterOpen(DataSet: TDataSet);
    procedure qAccessAfterOpen(DataSet: TDataSet);
    procedure mnStelsClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  TDataSourceBookmark = packed record
    KeyFieldValues: Variant;
    RecordIndex   : Integer;
    RowIndex      : Integer;
    Reserved      : Variant;
  public
    procedure Clear;
  end;

procedure GridReOpen(const AGrid: TcxCustomGridTableView; ABookmark: TDataSourceBookmark; const AReOpen: Boolean = True); overload;
procedure GridReOpen(const AGrid: TcxCustomGridTableView); overload;

implementation

uses Main;

{$R *.dfm}

function VarIsPresent(const v: Variant): Boolean;
begin
  Result := not (VarType(v) in [varEmpty, varNull])
end;

procedure GridSavePosition(AGrid: TcxCustomGridTableView; var ABookmark: TDataSourceBookmark);
var
  FDataSet: TDataSet;
  I, J: Integer;
  function VisibleIndex(AItem: TcxCustomGridTableItem): Integer;
  begin
    if AItem = nil then
      Result := -1
    else
      Result := AItem.VisibleIndex
  end;
begin
  if (AGrid.DataController = nil) or (not (AGrid.DataController is TcxGridDBDataController)) then
    FDataSet := nil
  else
    FDataSet := (AGrid.DataController as TcxGridDBDataController).DataSource.DataSet;

  if (FDataSet = nil) or (FDataSet.IsEmpty) or (TcxGridTableController(AGrid.Controller).FocusedRecordIndex < 0) then
    ABookmark.Clear
  else begin
    ABookmark.KeyFieldValues := AGrid.DataController.GetRecordId(AGrid.DataController.FocusedRecordIndex);
    ABookmark.RecordIndex := TcxGridTableController(AGrid.Controller).FocusedRecordIndex;
    ABookmark.RowIndex    := ABookmark.RecordIndex - TcxGridTableController(AGrid.Controller).TopRecordIndex;
    ABookmark.Reserved    := Unassigned;

    if AGrid.IsMaster and (not AGrid.Focused) then with AGrid.DataController do begin
      I := FocusedRecordIndex;
      if (I >= 0) and AGrid.Controller.FocusedRecord.Expanded then begin
        J := GetDetailActiveRelationIndex(I);
        if J >= 0 then
          with TcxGridDBDataController(GetDetailDataController(I, J)) do begin
            AGrid := TcxCustomGridTableView(GetOwner);
            if AGrid.Focused then
              ABookmark.Reserved := VarArrayOf([AGrid.PatternGridView.Name, VisibleIndex(AGrid.Controller.FocusedItem), GetRecordId(FocusedRecordIndex)]);
          end;
      end;
    end;
  end;
end;

procedure GridSetRecNo(const AGrid: TcxCustomGridTableView; ARecNo: Integer);
begin
  TcxGridTableController(AGrid.Controller).FocusedRecordIndex := Min(Pred(AGrid.DataController.FilteredRecordCount), ARecNo);
end;

procedure GridSetRow(const AGrid: TcxCustomGridTableView; ARow: Integer);
var
  FTopIndex: Integer;
begin
  if ARow >= 0 then begin
    FTopIndex := TcxGridTableController(AGrid.Controller).FocusedRecordIndex - ARow;

    if FTopIndex >= 0 then
      TcxGridTableController(AGrid.Controller).TopRecordIndex := FTopIndex;
  end;
end;

procedure GridReOpen(const AGrid: TcxCustomGridTableView; ABookmark: TDataSourceBookmark; const AReOpen: Boolean = True);
var
  FDataSet: TDataSet;
  FFound: Boolean;
  FName: String;
  I, J, K: Integer;
  DDataController: TcxCustomDataController;
  DGrid: TcxCustomGridTableView;
begin
  if (AGrid.DataController = nil) or (not (AGrid.DataController is TcxGridDBDataController)) or (TcxGridDBDataController(AGrid.DataController).DataSource = nil) then
    FDataSet := nil
  else
    FDataSet := TcxGridDBDataController(AGrid.DataController).DataSource.DataSet;

  if (FDataSet <> nil) then begin
    if AReOpen and FDataSet.Active then
      GridSavePosition(AGrid, ABookmark);

    AGrid.BeginUpdate;
    try
      if AReOpen then begin
        FDataSet.Close;
        FDataSet.Open;
      end;

      if FDataSet.IsEmpty or (not VarIsPresent(ABookmark.KeyFieldValues)) then
        FFound := False
      else
        FFound := FDataSet.Locate(TcxGridDBDataController(AGrid.DataController).KeyFieldNames, ABookmark.KeyFieldValues, []);

    finally
      AGrid.EndUpdate;
    end;

    if not FFound then
      GridSetRecNo(AGrid, ABookmark.RecordIndex);
    GridSetRow(AGrid, ABookmark.RowIndex);

    if FFound and AGrid.IsMaster and VarIsArray(ABookmark.Reserved) then begin
      with AGrid.Controller do begin
//        if not (Assigned(FocusedRecord) and FocusedRecord.Expanded) then Exit;
        if not Assigned(FocusedRecord) then Exit;
        if not FocusedRecord.Expanded then FocusedRecord.Expanded := True;
      end;


      DDataController := AGrid.DataController;
      I := DDataController.FocusedRecordIndex;
      J := DDataController.GetDetailActiveRelationIndex(I);
      if (I < 0) or (J < 0) then Exit;
      DDataController := DDataController.GetDetailDataController(I, J);
      if (DDataController = nil) or (DDataController.RecordCount = 0) then Exit;
      DGrid := nil;
      FName := ABookmark.Reserved[0];
      with TcxGridLevel(AGrid.Level) do
        for K := Pred(VisibleCount) downto 0 do
          if VisibleItems[K].GridView.Name = FName then begin
            DGrid := TcxCustomGridTableView(VisibleItems[K].GridView);
            Break;
          end;
      if DGrid = nil then Exit;

      for J := Pred(DGrid.CloneCount) downto 0 do with TcxCustomGridTableView(DGrid.Clones[J]) do
        if MasterRecordIndex = I then begin
          Focused := True;
          K := ABookmark.Reserved[1];
          if (K >= 0) and (K < VisibleItemCount) then
            VisibleItems[K].Focused := True;

          I := TcxGridDBDataController(DDataController).FindRecordIndexByKey(ABookmark.Reserved[2]);
          if I >= 0 then
            TcxGridDBDataController(DDataController).DataSet.Locate(TcxGridDBDataController(DDataController).KeyFieldNames, ABookmark.Reserved[2], []);

          Break;
        end;
    end;
  end;
end;

procedure GridReOpen(const AGrid: TcxCustomGridTableView);
var
  LBookmark: TDataSourceBookmark;
begin
  GridReOpen(AGrid, LBookmark)
end;

procedure TAdmin.StringFieldChange(Sender: TField);
begin
  Sender.OnChange := nil;
    if Sender.AsString = '' then Sender.Clear;
  Sender.OnChange := StringFieldChange
end;

procedure TAdmin.mnModify1Click(Sender: TObject);
begin
  if qUsers.State in [dsEdit, dsInsert] then begin
    qUsers.Post;
  end else begin
    qUsers.Edit;
    cxGridUsersDBTableViewUsers.OptionsData.Editing := True;
    cxGridUsersDBTableViewUsers.DataController.Edit;
    cxGridUsersDBTableViewUsers.Controller.EditingController.ShowEdit;
  end;
end;

procedure TAdmin.qUsersAfter(DataSet: TDataSet);
begin
//  grd1.Options := grd1.Options - [dgEditing];
//  grd1.EditorMode := False;
  if not qUsers.IsEmpty and not qAccess.Active then
    qUsers.AfterScroll(qUsers)
end;

procedure TAdmin.mnAdd1Click(Sender: TObject);
begin
  qUsers.Append;
  qUsers.FieldByName('Login').AsString := GetEnvironmentVariable('USERDOMAIN') + '\';

  cxGridUsersDBTableViewUsers.OptionsData.Editing := True;
  cxGridUsersDBTableViewUsers.DataController.Edit;
  cxGridUsersDBTableViewUsers.Controller.EditingController.ShowEdit;

//  grd1.SelectedIndex := 0;
//  grd1.Options := grd1.Options + [dgEditing];
//  grd1.EditorMode := True;
end;

procedure TAdmin.qUsersAfterScroll(DataSet: TDataSet);
begin
  if qUsers.ControlsDisabled then Exit;

  if qAccess.State = dsEdit then qAccess.Post;
  qAccess.Close;
  if not qUsers.FieldByName('Id').IsNull then begin
    qAccess.ParamByName('User_Id').AsInteger := qUsers.FieldByName('Id').AsInteger;
    qAccess.Open
  end;
end;

procedure TAdmin.pm1Popup(Sender: TObject);
begin
  mnModify1.Enabled := not qUsers.IsEmpty;
  mnDelete1.Enabled := not qUsers.IsEmpty and not qUsers.FieldByName('Id').IsNull;
end;

procedure TAdmin.mnDelete1Click(Sender: TObject);
begin
  if not qUsers.IsEmpty and not qUsers.FieldByName('Id').IsNull and (MessageDlg('Вы уверены что пользователя "' + qUsers.FieldByName('Login').AsString + '" нужно удалить?',mtConfirmation,mbYesNoCancel,0)=mrYes) then
    qUsers.Delete
end;

procedure TAdmin.cxGridDBTableViewLinksCellClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  if not qAccess.IsEmpty and cxGridDBTableViewLinksColumnChecked.Focused then begin
    qAccess.Edit;
      with qAccess.FieldByName('SignVisible') do AsBoolean := not AsBoolean;
    qAccess.Post
  end
end;

procedure TAdmin.cxGridDBTableViewLinksCellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  if (not qAccess.IsEmpty) and qAccess.FieldByName('SignVisible').AsBoolean and cxGridDBTableViewLinksColumnUser.Focused then begin
    qAccess.Edit;
//    grd2.EditorMode := True
  end
end;

procedure TAdmin.cxGridDBTableViewLinksKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key=13) and (qAccess.State=dsEdit) then qAccess.Post
end;

procedure TAdmin.cxGridUsersDBTableViewUsersCellDblClick(Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  if (not qUsers.IsEmpty) and not (qUsers.State in [dsInsert]) then mnModify1.Click
end;

procedure TAdmin.cxGridUsersDBTableViewUsersFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  if not (qUsers.State in [dsEdit, dsInsert]) then begin
    cxGridUsersDBTableViewUsers.OptionsData.Editing := False;
//    cxGridUsersDBTableViewUsers.Controller.EditingController.HideEdit(;
  end;
end;

procedure TAdmin.pm3Popup(Sender: TObject);
begin
  mnModify3.Enabled := not qMenu.IsEmpty;
  mnCopy3.Enabled   := not qMenu.IsEmpty and not qMenu.FieldByName('Id').IsNull and (qMenu.State = dsBrowse);
  mnDelete3.Enabled := not qMenu.IsEmpty and not qMenu.FieldByName('Id').IsNull;
end;

procedure TAdmin.mnDelete3Click(Sender: TObject);
begin
  if not qMenu.IsEmpty and not qMenu.FieldByName('Id').IsNull and (MessageDlg('Вы уверены что элемент "' + qMenu.FieldByName('Name').AsString + '" нужно удалить?',mtConfirmation,mbYesNoCancel,0)=mrYes) then
    qMenu.Delete
end;

procedure TAdmin.mnModify3Click(Sender: TObject);
begin
  if qMenu.State in [dsEdit,dsInsert] then begin
    qMenu.Post;
  end else begin
//    grd3.Options := grd3.Options + [dgEditing];
    qMenu.Edit;
//    grd3.EditorMode := True;
  end;
end;

procedure TAdmin.qAccessAfterOpen(DataSet: TDataSet);
begin
  qAccess.FieldByName('DefaultUser').OnChange := StringFieldChange;
end;

procedure TAdmin.qMenuAfter(DataSet: TDataSet);
begin
//  grd3.Options := grd3.Options - [dgEditing];
//  grd3.EditorMode := False;
end;

procedure TAdmin.qMenuAfterOpen(DataSet: TDataSet);
begin
  qMenu.FieldByName('Name').OnChange          := StringFieldChange;
  qMenu.FieldByName('CommandLine').OnChange   := StringFieldChange;
  qMenu.FieldByName('Param:Server').OnChange  := StringFieldChange;
  qMenu.FieldByName('Param:Share').OnChange   := StringFieldChange;
  qMenu.FieldByName('Param:List').OnChange    := StringFieldChange;
end;

procedure TAdmin.mnAdd3Click(Sender: TObject);
begin
  qMenu.Append;
  qMenu.FieldByName('Name').AsString := '<новый элемент>';
  qMenu.FieldByName('White').AsBoolean := True;
  qMenu.FieldByName('RunFromLocalCopy').AsBoolean := False;
//  grd3.SelectedIndex := 0;
//  grd3.Options := grd3.Options + [dgEditing];
//  grd3.EditorMode := True;
end;

procedure TAdmin.mnCopy3Click(Sender: TObject);
const
  SCopyFields: String = 'White;CommandLine;Param:Server;Param:Share;Param:List;RunFromLocalCopy';
var
  v: Variant;
begin
  if not cxGridDBTableViewProgramms.OptionsData.Editing then
    cxGridDBTableViewProgramms.DataController.Post(True);

  v := qMenu.FieldValues[SCopyFields];
  qMenu.Append;
  qMenu.FieldByName('Name').AsString := '<новый элемент>';
  qMenu.FieldValues[SCopyFields] := v;

//    grd3.SelectedIndex := 0;
//    grd3.Options := grd3.Options + [dgEditing];
//    grd3.EditorMode := True;
//  end
//  else
//    Clipboard.AsText := grd3.SelectedField.AsString
end;

procedure TAdmin.mnRefresh1Click(Sender: TObject);
begin
  GridReOpen(cxGridUsersDBTableViewUsers)
end;

procedure TAdmin.mnRefresh3Click(Sender: TObject);
begin
  GridReOpen(cxGridDBTableViewProgramms)
end;

procedure TAdmin.mnStelsClick(Sender: TObject);
begin
  qStels.Edit;
    qStels.Fields[0].AsBoolean := not mnStels.Checked;
  qStels.Post;
  mnStels.Checked := not mnStels.Checked;
end;

procedure TAdmin.FormCreate(Sender: TObject);
begin
  qUsers.Open;
  qMenu.Open;
  vFields.Open;
  vFields.AppendRecord([1, 'CommandLine']);
  vFields.AppendRecord([2, 'Param:Server']);
  vFields.AppendRecord([3, 'Param:Share']);
  vFields.AppendRecord([4, 'Param:Dir']);
  lcbField.EditValue := 1;
  try
    qStels.Open;
    mnStels.Enabled := True;
    mnStels.Checked := qStels.Fields[0].AsBoolean;
  except
  end;
end;

procedure TAdmin.btnCopyClick(Sender: TObject);
begin
  if not qMenu.IsEmpty and not qMenu.FieldByName('Id').IsNull then begin
    eProgramPath.Text := qMenu.FieldByName('CommandLine').AsString;
    eServer.Text := qMenu.FieldByName('Param:Server').AsString;
    eShare.Text := qMenu.FieldByName('Param:Share').AsString;
    eDir.Text := qMenu.FieldByName('Param:Dir').AsString;
  end;
end;

procedure TAdmin.btnReplaceClick(Sender: TObject);
var
  where: String;
begin
  eProgramPath.Text := Trim(eProgramPath.Text);
  eServer.Text := Trim(eServer.Text);
  eShare.Text := Trim(eShare.Text);
  eDir.Text := Trim(eDir.Text);
  eRepalceValue.Text := Trim(eRepalceValue.Text);
  if (eProgramPath.Text <> '') and (eRepalceValue.Text <> '') then begin
    vFields.Locate('nn', lcbField.EditValue, []);
    qReplace.ParamByName('CommandLine').AsString := eProgramPath.Text;
    qReplace.ParamByName('FieldValue').AsString := eRepalceValue.Text;
    qReplace.MacroByName('Field').Value := vFields.FieldByName('FieldName').AsString;
    if eServer.Text<>'' then where := where + ' AND [Param:Server]=' + QuotedStr(eServer.Text);
    if eShare.Text<>'' then where := where + ' AND [Param:Share]=' + QuotedStr(eShare.Text);
    if eDir.Text<>'' then where := where + ' AND [Param:Dir]=' + QuotedStr(eDir.Text);
    qReplace.MacroByName('where').Value := where;
    qReplace.Execute;
    GridReOpen(cxGridDBTableViewProgramms)
  end;
end;

procedure TAdmin.mnBackLinkClick(Sender: TObject);
begin
  if mnBackLink.Checked then
    qMenuAfterScroll(qMenu)
  else begin
    qUsers.Close;
      qUsers.Macros[0].Value := '';
    qUsers.Open
  end
end;

procedure TAdmin.qMenuAfterScroll(DataSet: TDataSet);
begin
  if mnBackLink.Checked and not qMenu.IsEmpty then begin
    qUsers.Close;
      qUsers.Macros[0].Value := 'where U.[Id] in (Select v.[User_Id] From [Starter].[Rights] V Where V.[Menu_Id]=' + qMenu.Fields[0].AsString + ')';
    qUsers.Open
  end;
end;

{ TDataSourceBookmark }

procedure TDataSourceBookmark.Clear;
begin
  KeyFieldValues := unAssigned;
  RecordIndex := -1;
  RowIndex := -1;
  Reserved := unAssigned;
end;

end.
