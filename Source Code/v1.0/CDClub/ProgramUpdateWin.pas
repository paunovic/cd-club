unit ProgramUpdateWin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Gauges;

type
  TProgramUpdateWindow = class(TForm)
    Memo1: TMemo;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    GroupBox1: TGroupBox;
    Gauge1: TGauge;
    Label1: TLabel;
    Label2: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    function DownloadFile(const fileURL, FileName: String; const FileSize : LongInt) : Boolean;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Memo1Enter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ProgramUpdateWindow  : TProgramUpdateWindow;
  iFileSize, pFileSize : String;
  AbortDownload        : Boolean;


implementation

uses WinInet, MainWin, ShellApi;

{$R *.dfm}

procedure TProgramUpdateWindow.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFREE;
end;

function TProgramUpdateWindow.DownloadFile(const fileURL, FileName: String; const FileSize : LongInt) : Boolean;
const
  BufferSize = 1024;
var
  hSession, hURL : HInternet;
  Buffer         : Array[1..BufferSize] of Byte;
  BufferLen      : DWORD;
  f              : File;
  sAppName       : String;
  TotalWrited    : LongInt;
begin
 Result := FALSE;
 TotalWrited := 0;
 sAppName := ExtractFileName(Application.ExeName);
 hSession := InternetOpen(PChar(sAppName),
                          INTERNET_OPEN_TYPE_PRECONFIG,
                          nil,
                          nil,
                          0);
  Try
    hURL := InternetOpenURL(hSession,
                            PChar(fileURL),
                            nil,
                            0,
                            0,
                            0);
    Try
      Gauge1.Progress := 0;
      Gauge1.Refresh;
      AssignFile(f, FileName);
      Rewrite(f, 1);
        Repeat
          If AbortDownload Then
            Break;
          InternetReadFile(hURL,
                           @Buffer,
                           SizeOf(Buffer),
                           BufferLen);
          BlockWrite(f, Buffer, BufferLen);
          Inc(TotalWrited, BufferLen);
          Gauge1.Progress := Round((TotalWrited / FileSize) * 100);
          Gauge1.Refresh;
          Application.ProcessMessages;
        until BufferLen = 0;
      CloseFile(f);
      If not AbortDownload Then
        Result := TRUE;
      Gauge1.Progress := 100;
      Gauge1.Refresh;
    Finally
      InternetCloseHandle(hURL);
    End;
  Finally
    InternetCloseHandle(hSession);
  End;
end;

FUNCTION Online : Boolean;
VAR
  dwFlags : DWORD;
BEGIN
  result := FALSE;
  If (InternetGetConnectedState(@dwFlags, 0)) and
     (dwFlags and 1 = 1) Then
    result := TRUE;
END;

procedure TProgramUpdateWindow.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);

  procedure ShowError;
  begin
    If AbortDownload Then
      Application.MessageBox('Azuriranje prekinuto !',
                             'Information',
                             mb_OK + mb_ICONINFORMATION)
    else
      Application.MessageBox('Azuriranje nemoguce !' + #13#10 +
                             'Molimo pokusajte kasnije.',
                             'Information',
                             mb_OK + mb_ICONINFORMATION);
  end;

  procedure Finish;
  begin
    DeleteFile(ExtractFilePath(Application.ExeName) + 'uVersion.txt');
    DeleteFile(ExtractFilePath(Application.ExeName) + 'uInstaller.exe');
    DeleteFile(ExtractFilePath(Application.ExeName) + 'uProgram.exe');
  end;

var
  F     : File of Byte;
  SFile : TextFile;
  FLine : String;
  Error : Boolean;
begin
  Case ModalResult of
    mrOK     : Begin
                 AbortDownload := FALSE;
                 Error := FALSE;

                 If not Online Then
                 Begin
                   CanClose := FALSE;
                   Application.MessageBox('Morate biti konektovani na internet !',
                                          'Information',
                                          mb_OK + mb_ICONINFORMATION);
                   Exit;
                 End;

                 Gauge1.BackColor := clCream;
                 GroupBox1.Font.Color := clBlack;
                 GroupBox1.Refresh;
                 Gauge1.Refresh;

                 Label1.Caption := 'Proveravam da li je azuriranje potrebno...';
                 Label1.Width := 188;
                 Label1.Refresh;
                 If not DownloadFile('http://www5.domaindlx.com/markosoft/cdclub/update/version.up', ExtractFilePath(Application.ExeName) + 'uVersion.txt', 20) Then
                 Begin
                   Error := TRUE;
                   ShowError;
                 End;

                 If Error Then
                 Begin
                   Finish;
                   Exit;
                 End;

                 AssignFile(SFile, ExtractFilePath(Application.ExeName) + 'uVersion.txt');
                 Reset(SFile);
                   ReadLn(SFile, FLine);
                   ReadLn(SFile, iFileSize);
                   ReadLn(SFile, pFileSize);
                 CloseFile(SFile);

                 If FLine = MainWindow.Version Then
                 Begin
                   Application.MessageBox('Azuriranje programa nije potrebno !',
                                          'Information',
                                          mb_OK);
                   MainWindow.SaveUpdateDate;
                   Exit;
                 End;

                 Gauge1.Progress := 0;
                 Label1.Caption := 'Skidam installer.exe...';
                 Label1.Width := 188;
                 Gauge1.Refresh;
                 Label1.Refresh;
                 If not DownloadFile('http://www5.domaindlx.com/markosoft/cdclub/update/installer.up', ExtractFilePath(Application.ExeName) + 'uInstaller.exe', StrToInt64(iFileSize)) Then
                 Begin
                   Error := TRUE;
                   ShowError;
                 End;

                 Try
                   AssignFile(F, ExtractFilePath(Application.ExeName) + 'uInstaller.exe');
                   Reset(F);
                     If FileSize(F) <> StrToInt64(iFileSize) Then
                     Begin
                       Error := TRUE;
                       ShowError;
                     End;
                 Finally
                   CloseFile(F);
                 End;

                 If Error Then
                 Begin
                   Finish;
                   Exit;
                 End;

                 Gauge1.Progress := 0;
                 Label1.Caption := 'Skidam program.exe...';
                 Label1.Width := 188;
                 Label1.Refresh;
                 Gauge1.Refresh;
                 If not DownloadFile('http://www5.domaindlx.com/markosoft/cdclub/update/program.up', ExtractFilePath(Application.ExeName) + 'uProgram.exe', StrToInt64(pFileSize)) Then
                 Begin
                   Error := TRUE;
                   ShowError;
                 End;

                 Try
                   AssignFile(F, ExtractFilePath(Application.ExeName) + 'uProgram.exe');
                   Reset(F);
                     If FileSize(F) <> StrToInt64(pFileSize) Then
                     Begin
                       Error := TRUE;
                       ShowError;
                     End;
                 Finally
                   CloseFile(F);
                 End;

                 If Error Then
                 Begin
                   Finish;
                   Exit;
                 End;

                 MainWindow.SaveUpdateDate;
                 ShellExecute(Handle, 'open', PChar(ExtractFilePath(Application.ExeName) + 'uInstaller.exe'), '', '', SW_SHOWNORMAL);
                 Application.Terminate;
               End;
  End;
end;

procedure TProgramUpdateWindow.FormCreate(Sender: TObject);
begin
  Label2.Caption := Label2.Caption + MainWindow.Settings.LastUpdateDate;
end;

procedure TProgramUpdateWindow.BitBtn2Click(Sender: TObject);
begin
  AbortDownload := TRUE;
end;

procedure TProgramUpdateWindow.Memo1Enter(Sender: TObject);
begin
  GroupBox1.SetFocus;
end;

end.
