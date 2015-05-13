program Starter;

uses
  Forms,
  AdminFrm in 'AdminFrm.pas' {Admin},
  Main in 'Main.pas' {StarterFrm},
  SBaseStringFunctions in '..\BackOffice\Common\SBaseStringFunctions.pas',
  SBaseConstants in '..\BackOffice\Common\SBaseConstants.pas',
  SBaseVariantFunctions in '..\BackOffice\Common\SBaseVariantFunctions.pas',
  SBaseUtils in '..\BackOffice\Common\SBaseUtils.pas',
  SBaseCxUtils in '..\BackOffice\Common\SBaseCxUtils.pas',
  SBaseFileUtils in '..\BackOffice\Common\SBaseFileUtils.pas',
  NamedVariables in '..\BackOffice\Packages\NamedVariables\NamedVariables.pas',
  RxVerInf in '..\BackOffice\Packages\RX\Units\RxVerInf.pas',
  FileUtil in '..\BackOffice\Packages\RX\Units\FileUtil.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TStarterFrm, StarterFrm);
  Application.Run;
end.
