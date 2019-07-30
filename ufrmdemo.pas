unit ufrmdemo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,libzip, ComCtrls,shellapi,IdHashMessageDigest, idHash;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    OpenDialog1: TOpenDialog;
    ListView1: TListView;
    Button6: TButton;
    Button7: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;


implementation

{$R *.dfm}

function GetTempFile(const APrefix: string): string;
var
  MyBuffer, MyFileName: array[0..MAX_PATH] of char;
begin
  FillChar(MyBuffer, MAX_PATH, 0);
  FillChar(MyFileName, MAX_PATH, 0);
  GetTempPath(SizeOf(MyBuffer), MyBuffer);
  GetTempFileName(MyBuffer, pchar(APrefix), 0, MyFileName);
  Result := MyFileName;
end;

//returns MD5 has for a file
 function MD5(const fileName : string) : string;
 var
   idmd5 : TIdHashMessageDigest5;
   fs : TFileStream;
   hash : T4x4LongWordRecord;
 begin
   idmd5 := TIdHashMessageDigest5.Create;
   fs := TFileStream.Create(fileName, fmOpenRead OR fmShareDenyWrite) ;
   try
     result := idmd5.AsHex(idmd5.HashValue(fs)) ;
   finally
     fs.Free;
     idmd5.Free;
   end;
 end;

//-1 not executed
//0 file not changed
//1 file changed
function wait(executefile:string):integer;
var
 SEInfo: TShellExecuteInfo;
 ExitCode: DWORD;
  //ParamString, StartInString: string;
 MyFd: TWin32FindData;
 ftCreationTime,ftLastWriteTime:tfiletime;
 ST1,ST2: TSystemTime;
 before,after:string;
begin

 result:=-1;
 //
 before:=MD5(executefile );
 //
 FillChar(SEInfo, SizeOf(SEInfo), 0) ;
 SEInfo.cbSize := SizeOf(TShellExecuteInfo) ;
 with SEInfo do begin
 fMask := SEE_MASK_NOCLOSEPROCESS;
 Wnd := Application.Handle;
 lpFile := PChar(ExecuteFile) ;
{
ParamString can contain the
application parameters.
}
// lpParameters := PChar(ParamString) ;
{
StartInString specifies the
name of the working directory.
If ommited, the current directory is used.
}
// lpDirectory := PChar(StartInString) ;
 nShow := SW_SHOWNORMAL;
 end;
 if ShellExecuteEx(@SEInfo) then begin
 repeat
 Application.ProcessMessages;
 GetExitCodeProcess(SEInfo.hProcess, ExitCode) ;
 until (ExitCode <> STILL_ACTIVE) or
 Application.Terminated;
 result:=0;
 //check creation time vs modification time?
 {
 FindFirstFile(PChar(executefile ), MyFd);
 FileTimeToLocalFileTime(MyFd.ftCreationTime,ftCreationTime);
 FileTimeToLocalFileTime(MyFd.ftLastWriteTime,ftLastWriteTime);
 FileTimeToSystemTime(ftCreationTime, St1) ;
 FileTimeToSystemTime(ftLastWriteTime, St2) ;
 if (st1.wHour <>st2.wHour) or (st1.wMinute  <>st2.wMinute) or (st1.wSecond  <>st2.wSecond)  then result:=1;
 //if (ftCreationTime).dwHighDateTime  <>(ftLastWriteTime).dwHighDateTime  then result:=1;
 }
 sleep(50);
 after:=MD5(executefile );
 if before <> after then result:=1;
 end
 else ShowMessage('Error starting exe!') ;
end;

procedure TForm1.Button1Click(Sender: TObject);
var

source,buf:pointer;
fs:TFileStream;
size:int64;
filename:string;
begin
OpenDialog1.Filter :='*.*|*.*';
OpenDialog1.Execute ;
filename:=  OpenDialog1.FileName;
if filename ='' then exit;
if arch=nil then exit;

//
FS := TFileStream.Create(filename, fmOpenRead or fmShareDenyWrite);
size:=fs.Size;
buf:=AllocMem(size );
fs.ReadBuffer(buf^,size );
fs.Free ;
//
//set to 0, zip_source_free must be called
source:=zip_source_buffer(arch,buf,size ,0);
if zip_file_add (arch,pchar(ExtractFileName(filename)),source,0)=-1 then showmessage('zip_file_add failed');
zip_source_free(source);
//
Button2Click(self);
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  err:integer;
  filename:string;
begin
init;
//
OpenDialog1.InitialDir :=ExtractFileDir(Application.ExeName ); 
OpenDialog1.Filter :='*.zip|*.zip';
OpenDialog1.Execute ;
filename:=  OpenDialog1.FileName;
if filename ='' then exit;
//
arch:=zip_open(pchar(filename),0,@err);
if arch=nil then begin showmessage(inttostr(err));exit;end;
//
Button2Click(self);
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
if arch=nil then exit;
zip_close (arch);
ListView1.Clear ;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
sb:pointer;
num:int64;
i:integer;
lv:tlistitem;
begin
if arch=nil then exit;
ListView1.Clear ;
num:=zip_get_num_entries(arch,0);
sb:=AllocMem(sizeof(tzip_stat));

for i:=0 to num-1 do
  begin
  zip_stat_index(arch,i,0,sb);
  lv:=ListView1.Items.Add ;
  lv.Caption :=pzip_stat(sb)^.name;
  lv.SubItems.Add(inttostr(pzip_stat(sb)^.size ));
  lv.SubItems.Add(inttostr(pzip_stat(sb)^.comp_size  ));
  end;
end;

procedure TForm1.Button5Click(Sender: TObject);
var
item:string;
index:int64;
begin
if arch=nil then exit;
if ListView1.Selected =nil then exit;
item:=ListView1.Selected.Caption ;
index:=zip_name_locate(arch,pchar(item),0);
if index=-1 then
  begin
  showmessage('wrong index');
  exit;
  end;
if zip_delete (arch,index)=-1 then showmessage('zip_delete failed');
//
Button2Click(self);
end;

procedure TForm1.Button6Click(Sender: TObject);
var
item:string;
index,size:int64;
file_,data:pointer;
sb:pointer;
fs:TFileStream;
begin
if arch=nil then exit;
if ListView1.Selected =nil then exit;
item:=ListView1.Selected.Caption ;
//showmessage((ListView1.Selected.SubItems[0]));
//size:=strtoint64(ListView1.Selected.SubItems[0]); //not working??
index:=zip_name_locate(arch,pchar(item),0);
if index=-1 then
  begin
  showmessage('wrong index');
  exit;
  end;
// size
sb:=AllocMem(sizeof(tzip_stat));
zip_stat_index(arch,index,0,sb);
size:=pzip_stat(sb)^.size;
//open
file_:=nil;
file_:=zip_fopen_index(arch,index,0);
data:=allocmem(size);
size:= zip_fread (file_,data,size);
if size=-1 then showmessage('zip_fread failed');
//
FS := TFileStream.Create(pzip_stat(sb)^.name , fmCreate);
fs.Position :=0;
//fs.Size:=size;
fs.writeBuffer(data^,size );
fs.Free ;
//
zip_fclose (file_);

end;

procedure TForm1.Button7Click(Sender: TObject);
var
item:string;
index,size:int64;
file_,data,source:pointer;
sb:pointer;
fs:TFileStream;
tempfile:string;
begin
if arch=nil then exit;
if ListView1.Selected =nil then exit;
item:=ListView1.Selected.Caption ;
//showmessage((ListView1.Selected.SubItems[0]));
//size:=strtoint64(ListView1.Selected.SubItems[0]); //not working??
index:=zip_name_locate(arch,pchar(item),0);
if index=-1 then
  begin
  showmessage('wrong index');
  exit;
  end;
// size
sb:=AllocMem(sizeof(tzip_stat));
zip_stat_index(arch,index,0,sb);
size:=pzip_stat(sb)^.size;
//open
file_:=nil;
file_:=zip_fopen_index(arch,index,0);
data:=allocmem(size);
size:= zip_fread (file_,data,size);
if size=-1 then showmessage('zip_fread failed');
//
tempfile:=GetTempFile('tmp');
//{$i-}deletefile(tempfile);{$i+}
FS := TFileStream.Create(tempfile , fmOpenWrite or fmCreate);
fs.Position :=0;
//fs.Size:=size;
fs.writeBuffer(data^,size );
fs.Free ;
freemem(data);
//
zip_fclose (file_);
// or wait until external program finishes
//ShellExecute(Handle,'open',pzip_stat(sb)^.name,'', nil, SW_SHOWNORMAL) ;
if wait(tempfile)=1 then
  begin
  //source the update
  {//does not seem to work for now...
  source:=zip_source_file(arch,pchar(tempfile),0,-1);
  }

  FS := TFileStream.Create(tempfile, fmOpenRead or fmShareDenyWrite);
  size:=fs.Size;
  data:=AllocMem(size );
  fs.ReadBuffer(data^,size );
  fs.Free ;
  //
  source:=zip_source_buffer(arch,data,size ,0);
  //freemem(data);
  //

  if source<>nil then
    begin
    if zip_file_replace (arch,index,source,ZIP_FL_OVERWRITE)=-1 then showmessage('zip_file_replace failed');
    //if zip_file_add (arch,pzip_stat(sb)^.name,source,ZIP_FL_OVERWRITE)=-1 then showmessage('zip_file_replace failed');
    zip_source_free(source);
    end;
  end;
{$i-}deletefile(tempfile);{$i+}
//
Button2Click(self);
end;

end.
