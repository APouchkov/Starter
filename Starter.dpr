program Starter;

uses
  Forms,
  AdminFrm in 'AdminFrm.pas' {Admin},
  Main in 'Main.pas' {StarterFrm},
  //SBaseStringFunctions in '..\MD FrameWork 3.0\Common\SBaseStringFunctions.pas',
  SBaseConstants in '..\MD FrameWork 3.0\Common\SBaseConstants.pas',
  //SBaseVariantFunctions in '..\MD FrameWork 3.0\Common\SBaseVariantFunctions.pas',
  //SBaseUtils in '..\MD FrameWork 3.0\Common\SBaseUtils.pas',
  //SBaseCxUtils in '..\MD FrameWork 3.0\Common\SBaseCxUtils.pas',
  //SBaseFileUtils in '..\MD FrameWork 3.0\Common\SBaseFileUtils.pas',
  //NamedVariables in '..\MD FrameWork 3.0\Packages\NamedVariables\NamedVariables.pas',
  //RxVerInf in '..\MD FrameWork 3.0\Packages\RX\Units\RxVerInf.pas',
  FileUtil in '..\MD FrameWork 3.0\Packages\RX\Units\FileUtil.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TStarterFrm, StarterFrm);
  Application.Run;
end.
