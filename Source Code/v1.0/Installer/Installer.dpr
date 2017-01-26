{$A+,B-,C+,D+,E-,F-,G+,H+,I-,J-,K-,L+,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+,Z1}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
{$IMAGEBASE $00400000}
{$APPTYPE GUI}

uses
  Windows, ShellApi;

function ExtractFilePath(FP : String) : String;
var
  C1 : Integer;
  LD : Integer;
begin
  LD := Length(FP);
  
  result := '';

  For C1 := 1 to Length(FP) Do
    If FP[C1] = '\' Then
      LD := C1;
  result := Copy(FP, 1, LD);
end;


function FileInUse(FileName : String) : Boolean;
var
  HFileRes : HFile;
begin
  HFileRes := CreateFile(PChar(FileName),
                         $80000000 or $40000000,
                         0,
                         nil,
                         3,
                         $00000080,
                         0);
  result := HFileREs = DWord(-1);
  If not result Then
    CloseHandle(HFileRes);
end;

var
  TFile : TextFile;

begin
  While FileInUse(ExtractFilePath(ParamStr(0)) + 'cdclub.exe') Do
    Sleep(1);
    
  CopyFile(PChar(ExtractFilePath(ParamStr(0)) + 'uProgram.exe'), PChar(ExtractFilePath(ParamStr(0)) + 'cdclub.exe'), FALSE);
  DeleteFile(PChar(ExtractFilePath(ParamStr(0)) + 'uProgram.exe'));
  DeleteFile(PChar(ExtractFilePath(ParamStr(0)) + 'uVersion.txt'));

  AssignFile(TFile, ExtractFilePath(ParamStr(0)) + 'deleter.bat');
  Rewrite(TFile);
    WriteLn(TFile, '"' + ExtractFilePath(ParamStr(0)) + 'cdclub.exe"');
    WriteLn(TFile, 'del "' + ExtractFilePath(ParamStr(0)) + 'uInstaller.exe"');
    WriteLn(TFile, 'del "' + ExtractFilePath(ParamStr(0)) + 'deleter.bat"');
  CloseFile(TFile);
  MessageBox(0, 'Program uspesno azuriran !', 'Information', mb_OK + mb_ICONINFORMATION);
  ShellExecute(HWND_BROADCAST, 'open', PChar(ExtractFilePath(ParamStr(0)) + 'deleter.bat'), '', '', SW_HIDE);
  Exit;
end.
