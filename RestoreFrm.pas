unit RestoreFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, MemDS, DBAccess, MSAccess, Grids, DBGridEh;

type
  TRestore = class(TForm)
    grd: TDBGridEh;
    src: TDataSource;
    tbl: TUniTable;
    btnRestore: TButton;
    btnDelete: TButton;
    procedure FormShow(Sender: TObject);
    procedure tblAfterOpen(DataSet: TDataSet);
    procedure btnRestoreClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Restore: TRestore;

implementation

uses RestoreData;

{$R *.dfm}

procedure TRestore.FormShow(Sender: TObject);
begin
  try
    tbl.Open
  except
    Close
  end;
end;

procedure TRestore.tblAfterOpen(DataSet: TDataSet);
begin
  btnRestore.Enabled := not DataSet.IsEmpty;
  btnDelete.Enabled  := not DataSet.IsEmpty;
end;

procedure TRestore.btnRestoreClick(Sender: TObject);
begin
  ExecSQLString('exec ac_Restore ' + tbl.Fields[0].AsString, True);
  ShowMessage('Всё всёрнулось на круги своя')
end;

procedure TRestore.btnDeleteClick(Sender: TObject);
begin
  tbl.Delete
end;

end.
