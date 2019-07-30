//delphi unit for libzip


unit libzip;

interface

uses windows,sysutils;

  type
  UINT8 = System.Byte;
  UINT16 = System.Word;
  UINT32 = System.Longword;
{$IFNDEF UINT64}
  UINT64 = System.INT64;
{$ENDIF}
  INT16 = System.Smallint;
  INT32 = System.Longint;
  INT64 = System.INT64;
  TUINT32Array = array of UINT32;
  PUINT32 = ^UINT32;
  PBYTE = ^byte;
const
 ZIP_FL_NOCASE=		1; //* ignore case on name lookup */
ZIP_FL_NODIR=		2; //* ignore directory component */
ZIP_FL_COMPRESSED=	4; //* read compressed data */
ZIP_FL_UNCHANGED=	8; //* use original data, ignoring changes */
ZIP_FL_RECOMPRESS=      16; //* force recompression of data */
ZIP_FL_ENCRYPTED=       32; //* read encrypted data (implies ZIP_FL_COMPRESSED) */
ZIP_FL_ENC_GUESS=        0; //* guess string encoding (is default) */
ZIP_FL_ENC_RAW=         64; //* get unmodified string */
ZIP_FL_ENC_STRICT=     128; //* follow specification strictly */
ZIP_FL_LOCAL=	      256; //* in local header */
ZIP_FL_CENTRAL=	      512; //* in central directory */
                          // 1024    reserved for internal use */
ZIP_FL_ENC_UTF_8=     2048; //* string is UTF-8 encoded */
ZIP_FL_ENC_CP437=     4096; //* string is CP437 encoded */
ZIP_FL_OVERWRITE=     8192; //* zip_file_add: if file with name exists, overwrite (replace) it */


type tzip_stat =record
     valid:int64;                 //* which fields have valid values */
     name:pchar;                   //* name of the file */
     index:int64;                 //* index within archive */
     size:int64;                  //* size of file (uncompressed) */
     comp_size:int64;             //* size of file (compressed) */
     mtime:filetime;                       //* modification time */
     crc:dword;                   //* crc of file data */
     comp_method:word;           //* compression method used */
     encryption_method:word;     //* encryption method used */
     flags:dword;                 //* reserved for future use */
end;
pzip_stat=^tzip_stat;

procedure init;

var
arch:pointer;

zip_open:function(path:pchar;flags:integer;errorp:pinteger):pointer;cdecl;
zip_close:function(archive:pointer):integer;cdecl;

zip_file_add:function(archive:pointer;name:pchar;source:pointer;flags:integer):int64;cdecl;
zip_file_replace:function(archive:pointer;index:int64;source:pointer;flags:integer):integer;cdecl;
zip_dir_add:function(archive:pointer;name:pchar;flags:integer):int64;cdecl;
zip_delete:function(archive:pointer;index:int64):integer;cdecl;
zip_rename:function(archive:pointer;index:int64;name:pchar):integer;cdecl;

zip_fopen:function(archive:pointer; name:pchar;flags:integer):pointer;cdecl;
zip_fopen_index:function(archive:pointer; index:int64;flags:integer):pointer;cdecl;
zip_fread:function(file_:pointer;data:pointer;len:int64):int64;cdecl;
zip_fclose:function(file_:pointer):integer;cdecl;

zip_source_buffer:function(archive:pointer;data:pointer;len:int64;freep:integer):pointer;cdecl;
zip_source_file:function(archive:pointer; fname:pchar;start:int64;len:int64):pointer;cdecl;
zip_source_free:procedure(source:pointer);cdecl;

zip_stat_index:function(archive:pointer; index:int64;flags:integer;sb:pointer):integer;cdecl;
zip_get_num_entries:function(archive:pointer; flags:integer):int64;cdecl;


zip_get_name:function(archive:pointer; index:int64;flags:integer):pointer;cdecl;
zip_name_locate:function(archive:pointer; fname:pchar;flags:integer):int64;cdecl;

implementation

var
lib:thandle=thandle(-1);

function Swap16(ASmallInt : SmallInt) : SmallInt ; register ;
 asm  xchg al,ah  end ;

function Swap32(value : dword) : dword ; assembler ;
  asm  bswap eax  end ;

procedure init;
begin
lib:=LoadLibrary('libzip.dll');
if lib=thandle(-1) then exit;


@zip_open:=getprocaddress(lib,'zip_open');
@zip_close:=getprocaddress(lib,'zip_close');

@zip_file_add:=getprocaddress(lib,'zip_file_add');
@zip_file_replace:=getprocaddress(lib,'zip_file_replace');
@zip_dir_add:=getprocaddress(lib,'zip_dir_add');
@zip_delete:=getprocaddress(lib,'zip_delete');
@zip_rename:=getprocaddress(lib,'zip_rename');

@zip_source_buffer:=getprocaddress(lib,'zip_source_buffer');
@zip_source_file:=getprocaddress(lib,'zip_source_file');
@zip_source_free:=getprocaddress(lib,'zip_source_free');

@zip_stat_index:= getprocaddress(lib,'zip_stat_index');
@zip_get_num_entries:=getprocaddress(lib,'zip_get_num_entries');

//get name of file by index
@zip_get_name:=getprocaddress(lib,'zip_get_name');
//get index of file by name
@zip_name_locate:=getprocaddress(lib,'zip_name_locate');

@zip_fopen_index:=getprocaddress(lib,'zip_fopen_index');
@zip_fopen:=getprocaddress(lib,'zip_fopen');
@zip_fread:=getprocaddress(lib,'zip_fread');
@zip_fclose:=getprocaddress(lib,'zip_fclose');

if not assigned (zip_open) then raise exception.create('zip_open unassigned');
//
end;




end.
