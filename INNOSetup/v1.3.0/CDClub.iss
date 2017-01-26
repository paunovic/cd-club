[Setup]
AppName=CDClub
AppVerName=CDClub v1.3.0
DefaultDirName={pf}\MarkoSoft\CDClub
DefaultGroupName=CDClub
OutputBaseFileName=CDClub v1.3.0 Setup
OutputDir=Output
VersionInfoCompany=MarkoSoft
VersionInfoVersion=1.3.0.0
AllowCancelDuringInstall=NO
AppPublisher=MarkoSoft
AppVersion=1.3.0
UninstallDisplayIcon={app}\CDClub.exe
UninstallDisplayName=CDClub - MarkoSoft
DisableProgramGroupPage=YES

[Languages]
Name: "Srpski"; MessagesFile: "compiler:languages\Serbian.isl"

[Files]
Source: "CDClub.exe"; DestDir: "{app}";
Source: "Readme.txt"; DestDir: "{app}"
Source: "MiniReg.exe"; DestDir: "{tmp}"
Source: "BdeInst.dll"; DestDir: "{tmp}"

[Icons]
Name: "{userdesktop}\CDClub"; Filename: "{app}\CDClub.exe"; WorkingDir: "{app}"
Name: "{commonprograms}\MarkoSoft\CDClub\CDClub"; Filename: "{app}\CDClub.exe"; WorkingDir: "{app}"
Name: "{commonprograms}\MarkoSoft\CDClub\Readme"; Filename: "{app}\Readme.txt"
Name: "{commonprograms}\MarkoSoft\CDClub\Uninstall"; Filename: "{uninstallexe}"; WorkingDir: "{app}"

[Run]
Filename: "{tmp}\MiniReg.exe"; Parameters: """{tmp}\BdeInst.dll"""
Filename: "{app}\Readme.txt"; Description: "Otvori Readme.txt"; Flags: postinstall shellexec skipifsilent
Filename: "{app}\CDClub.exe"; Description: "Pokreni program"; Flags: postinstall nowait skipifsilent unchecked
