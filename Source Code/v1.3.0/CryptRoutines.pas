unit CryptRoutines;

interface

function Encrypt(data : String) : String;
function Decrypt(data : String) : String;

implementation

uses DCPcrypt2, DCPblockciphers, DCPblowfish, DCPrijndael, DCPhaval, DCPsha1, MainWin;

const
  pass1 = Chr(255) + '[pCD]' + Chr(255) + 'C1(|-|@V@l)' + Chr(255);
  pass2 = Chr(255) + '[pCD]' + Chr(255) + 'C2($|-|@1)' + Chr(255);

function Encrypt(data : String) : String;
var
  Cipher1 : TDCP_blowfish;
  Cipher2 : TDCP_rijndael;
  Str1    : String;
begin
  result := '';

  Cipher1 := TDCP_blowfish.Create(MainWindow);
  Cipher1.InitStr(pass1, TDCP_haval);
  Str1 := Cipher1.EncryptString(data);
  Cipher1.Burn;
  Cipher1.Free;

  Cipher2 := TDCP_rijndael.Create(MainWindow);
  Cipher2.InitStr(pass2, TDCP_sha1);
  result := Cipher2.EncryptString(Str1);
  Cipher2.Burn;
  Cipher2.Free;
end;

function Decrypt(data : String) : String;
var
  Cipher1 : TDCP_blowfish;
  Cipher2 : TDCP_rijndael;
  Str1    : String;
begin
  result := '';

  Cipher2 := TDCP_rijndael.Create(MainWindow);
  Cipher2.InitStr(pass2, TDCP_sha1);
  Str1 := Cipher2.DecryptString(data);
  Cipher2.Burn;
  Cipher2.Free;

  Cipher1 := TDCP_blowfish.Create(MainWindow);
  Cipher1.InitStr(pass1, TDCP_haval);
  result := Cipher1.DecryptString(Str1);
  Cipher1.Burn;
  Cipher1.Free;
end;

end.
