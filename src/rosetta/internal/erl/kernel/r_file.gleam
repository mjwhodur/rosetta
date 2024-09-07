import gleam/erlang/process
import rosetta/improper_results.{type ImproperResultOk}
import rosetta/internal/erl/erts/r_erlang
import rosetta/internal/erl/stdlib/r_calendar

/// Represents POSIX error codes (`kernel:posix/0` in Erlang).
///
/// This type provides a direct mapping to POSIX error codes commonly used in
/// UNIX systems
/// and many C compiler runtime libraries. These codes are used to indicate
/// various
/// system-level errors that can occur during operations such as file I/O,
/// network
/// communication, and process management.
///
/// POSIX (Portable Operating System Interface) is a family of standards
/// specified by the
/// IEEE Computer Society for maintaining compatibility between operating
/// systems. These
/// error codes are part of that standard, ensuring consistent error reporting
/// across
/// different POSIX-compliant systems.
///
/// When working with system calls or libraries that interact closely with the
/// operating
/// system, functions may return these error codes to indicate specific failure
/// conditions.
/// Understanding these codes can help in diagnosing issues and handling errors
/// appropriately
/// in your application.
///
/// Note: While these codes originate from POSIX standards, their exact behavior
///  or
/// availability may vary slightly depending on the underlying system and the
/// specific
/// Gleam/Erlang libraries being used.
///
/// You may also encounter these atoms in other places, like for example `inet`.
/// This is due to Gleam's limitation: a type can not have fields i.e. from the
/// other type (like in Go, for example).
/// This type extends, however, Erlang's `posix/0` by adding `badarg` atom.
pub type PosixError {
  /// Resource temporarily unavailable
  Eagain
  /// Permision denied - error code
  Eacces
  /// Bad file number
  Ebadf
  /// Bad message.
  /// NOT DOCUMENTED IN ERLANG
  /// Indicates that the message structure is incorrect or the message is of an
  /// inappropriate type for the operation being performed.
  ///
  /// This error typically occurs in scenarios involving:
  /// - Interprocess communication (IPC)
  /// - Network operations with corrupted or malformed packets
  /// - Stream I/O operations
  /// - Parsing of structured data (e.g., XML, JSON)
  ///
  /// Common situations:
  /// - Reading a malformed message from a queue
  /// - Receiving a corrupted network packet
  /// - Attempting to process a stream with an invalid format
  ///
  /// Note: While this error code originates from POSIX systems, its exact
  /// behavior may vary slightly depending on the underlying system and
  /// the specific Gleam/Erlang libraries being used.
  Ebadmsg
  /// File busy
  Ebusy
  /// Edeadlk
  Edeadlk
  /// Edeadlock
  Edeadlock
  /// Disk quota exceeded
  Edquot
  /// File already exists
  Eexist
  /// Bad address in system call argument
  Efault
  /// File too large
  Efbig
  /// Missing documentation
  Eftype
  /// Interrupted system call
  Eintr
  /// Invalid argument
  Einval
  /// I/O error
  Eio
  /// Illegal operation on a driectory
  Eisdir
  /// Too many open files
  Emfile
  /// Too many links
  Emlink
  /// Multihop attempted
  /// NOT DOCUMENTED IN ERLANG
  /// Indicates that an attempt was made to perform a multihop operation
  /// which is not supported. This error is typically encountered in
  /// distributed or network file systems.
  ///
  /// Common scenarios:
  /// - Accessing a resource in a distributed file system that requires
  ///   traversing multiple network nodes
  /// - Operations on file systems that do not support or have limitations
  ///   on multihop routing
  ///
  /// Note: This error is relatively rare and usually appears in the context
  /// of advanced network operations or specialized distributed systems.
  Emultihop
  /// Filename too long
  Enametoolong
  /// File table overflow
  Enfile
  /// No buffer space available
  /// NOT DOCUMENTED IN ERLANG
  /// Indicates that the system lacks sufficient buffer space to perform
  /// the requested operation. This error is commonly encountered in
  /// network operations and inter-process communication (IPC).
  ///
  /// Common scenarios:
  /// - Attempting to send data through a socket when network buffers are full
  /// - Creating new sockets when the system has reached its resource limits
  /// - Operations on message queues when there's insufficient memory for
  /// buffering
  ///
  /// Possible causes:
  /// - System overload
  /// - Exhaustion of system resources
  /// - Application errors leading to excessive buffer usage
  ///
  /// Handling: Applications should be prepared to handle this error,
  /// typically by retrying the operation after a short delay, implementing
  /// flow control mechanisms, or managing and releasing unused buffers.
  Enobufs
  /// No such device
  Enodev
  /// No such file or directory
  Enoent
  /// Link has been severed
  /// NOT DOCUMENTED IN ERLANG
  /// Indicates that a link has been severed. This error typically occurs
  /// in distributed file systems or network-related operations.
  ///
  /// Common scenarios:
  /// - Attempting to access a remote file system resource that is no longer
  ///   available
  /// - Network connection interruptions in distributed systems
  ///
  /// Note: This error is closely related to operations in network file systems.
  Enolink
  /// No locks available
  /// NOT DOCUMENTED IN ERLANG
  /// Indicates that no locks are available. This error occurs when a process
  /// cannot acquire a lock on a file due to system limits.
  ///
  /// Common scenarios:
  /// - Attempting to lock a file when the system's maximum number of locks is
  ///   reached
  /// - Issues with file locking mechanisms in the operating system
  ///
  /// Note: This error is often encountered in systems with heavy file I/O
  /// operations.
  Enolck
  /// Not enough memory
  Enomem
  /// No space left on the device
  Enospc
  /// Out of streams resources
  /// NOT DOCUMENTED IN ERLANG
  /// Indicates that the system is out of STREAMS resources. This error is
  /// specific to systems that implement STREAMS I/O.
  ///
  /// Common scenarios:
  /// - Attempting to open a STREAMS device when all STREAMS resources are exhausted
  /// - Heavy usage of STREAMS-based communication in the system
  ///
  /// Note: This error is less common in modern systems and may not be relevant
  /// in all operating environments.
  Enosr
  /// Function not implemented
  /// NOT DOCUMENTED IN ERLANG
  /// Indicates that the function is not implemented on the current system.
  ///
  /// Common scenarios:
  /// - Calling a system call or library function that is not supported by the
  /// OS
  /// - Attempting to use a feature that is not available in the current environment
  ///
  /// Note: This error is important for maintaining portability across different
  /// systems.
  Enosys
  /// Not a STREAM
  /// NOT DOCUMENTED IN ERLANG
  /// Indicates that a STREAMS operation was attempted on a non-STREAMS device.
  ///
  /// Common scenarios:
  /// - Attempting STREAMS I/O operations on a file descriptor that doesn't support them
  /// - Misuse of STREAMS-related system calls
  ///
  /// Note: Like ENosr, this error is specific to systems with STREAMS I/O support.
  Enostr
  /// Block device required
  Enotblk
  /// Not a directory
  Enotdir
  /// Operation not supported
  Enotsup
  /// No such device or addres
  Enxio
  /// Operation not supported
  Eopnotsup
  /// Value too large for defined data type
  /// NOT DOCUMENTED IN ERLANG
  /// Indicates that a value is too large to be stored in a specific data type.
  ///
  /// Common scenarios:
  /// - Attempting to store a value in a variable that exceeds its maximum size
  /// - File operations where a file size or offset exceeds the maximum allowed
  ///   value
  ///
  /// Note: This error is important in systems programming and data processing
  /// tasks.
  Eoverflow
  /// Not owner
  Eperm
  /// Broken pipe
  Epipe
  /// Missing documentation
  Erange
  /// Read-only file system
  Erofs
  /// Invalid seek
  Espipe
  /// No such process
  Esrch
  /// Stale remote file handle
  Estale
  /// Cross-device link
  Exdev
  /// Not from POSIX. It's an erlang atom that may be thrown in certain scenarios.
  Badarg
  /// Not from POSIX. FIXME: Document this.
  Terminated
  /// Not from POSIX. When you reach the system_limit
  SystemLimit
}

// Types
// date_time/0
pub type DateTime =
  r_calendar.Datetime

/// deep_list/0
/// Not yet implemented.
pub type DeepList

/// delete_option/0
pub type DeleteOption

/// fd/0
pub type Fd

/// file_info/0
/// FIXME: Not Implemented
pub type FileInfo

/// file_info_option/0
/// FIXME: Not ported
pub type FileInfoOption

/// filename/0
pub type Filename =
  String

/// filename_all/0
/// For whatever reason this should not be only a string.
/// In our scenario: String or Binary
/// For sake of simplicity, we treat this as string.
/// On extremely rare occasions - when the VM is ran in `latin1` the `filename_all`
/// may come as a binary.
pub type FilenameAll =
  String

/// io_device/0: Pid or Fd
/// This type is equivalent to `Pid` when the file is *not* opened in raw mode.
pub type IoDevice =
  process.Pid

// location/0 - partial translation
// We lack: integer() | bof | cur | eof impl.
pub type Location {
  Bof(offset: Int)
  Cur(offset: Int)
  Eof(offset: Int)
}

// mode/0
pub type Mode {
  /// The file, which must exist, is opened for reading.
  Read
  /// The file is opened for writing. It is created if it does not exist.
  /// If the file exists and write is not combined with read, the file is
  /// truncated.
  Write
  /// The file is opened for writing. It is created if it does not exist.
  /// Every write operation to a file opened with append takes place at the
  /// end of the file.
  Append
  /// The file is opened for writing. It is created if it does not exist.
  /// If the file exists, {error, eexist} is returned.
  Exclusive
  /// Do NOT use that! We could remove this, but for the sake of completeness
  /// this is left here.
  /// Will cause runtime errors.
  Raw
  /// Read operations on the file return binaries rather than lists.
  Binary
  /// Data in subsequent write/2 calls is buffered until at least Size bytes
  /// are buffered, or until the oldest buffered data is Delay milliseconds old.
  ///  Then all buffered data is written in one operating system call.
  ///  The buffered data is also flushed before some other file operation than
  ///  write/2 is executed.
  /// Has side effects. FIXME: Add documentation.
  DelayedWrite(size: Int, delay: Int)
  /// Makes it possible to read or write gzip compressed files. Option
  /// compressed must be combined with read or write, but not both. Notice that
  /// the file size obtained with read_file_info/1 does probably not match the
  /// number of bytes that can be read from a compressed file.
  Compressed
  /// Read one member of a gzip compressed file. Option compressed_one can only
  /// be combined with read. FIXME: Add detailed information regarding the
  /// behaviors
  CompressedOne
  /// Broken
  Encoding
  /// On platforms supporting it, enables the POSIX O_SYNC synchronous I/O flag
  ///  or its platform-dependent equivalent (i.e., FILE_FLAG_WRITE_THROUGH on
  ///  Windows) so that writes to the file block until the data is physically
  ///  written to disk. However, be aware that the exact semantics of this flag
  /// differ from platform to platform. For example, none of Linux or Windows
  /// guarantees that all file metadata are also written before the call
  /// returns. For precise semantics, check the details of your platform
  /// documentation. On platforms with no support for POSIX O_SYNC or equivalent,
  /// use of the sync flag causes open to return {error, enotsup}.
  Sync
  /// Allows open to work on directories.
  Directory
}

/// `name/0`
/// -type name() :: string() | atom() | deep_list().
/// It's only used in set_cwd. We're leaving this however.
/// CAVEAT: In Erlang, filename can be of type Atom.
pub type Name

/// name_all/0
/// `name_all() :: string() | atom() | deep_list() | (RawFilename :: binary())`
/// In this library, it is only supported as string, as it simplifies many
/// things.
pub type NameAll =
  String

// posix_file_advise/0
pub type PosixFileAdvise {
  Normal
  Sequential
  Random
  NoReuse
  WillNeed
  DontNeed
}

/// Supports only "Raw"... But due to Gleam's limitations we have to workaround
/// this FIXME
/// Leftover
pub type ReadFileOption

// sendfile_option/0
pub type SendfileOption {
  ChunkSize(val: r_erlang.NonNegInteger)
  UseThreads(Bool)
}

// Functions

/// `advise/4`
/// `advise/4` can be used to announce an intention to access file data in a
/// specific pattern in the future, thus allowing the operating system to
/// perform appropriate optimizations.
/// On some platforms, this function might have no effect.
/// UNSAFE.
@external(erlang, "file", "advise")
pub fn r_advise_4(
  iodevice iodevice: IoDevice,
  offset offset: Int,
  length length: Int,
  advise advise: PosixFileAdvise,
) -> ImproperResultOk(PosixError)

/// allocate/3
/// allocate/3 can be used to preallocate space for a file.
/// This function only succeeds in platforms that provide this feature.
/// UNSAFE: This function is unsafe. `offset` and `length` should provide
/// non-negative integer.
@external(erlang, "file", "allocate")
pub fn r_allocate_3(
  file file: IoDevice,
  offset offset: Int,
  length length: Int,
) -> ImproperResultOk(PosixError)

/// change_group/2
/// Changes group of a file. See write_file_info/2.
/// Wee should use name_all(), but for compatibility reasons we defailt to String
/// mode has to be positive integer. We don't test that here.
/// UNSAFE
@external(erlang, "file", "change_group")
pub fn r_change_group_2(
  filename filename: String,
  gid gid: Int,
) -> ImproperResultOk(PosixError)

/// change_mode/2
/// Changes permissions of a file. See write_file_info/2.
/// Caveats:: we're using String for filename only.
/// UNSAFE: mode is not checked.
@external(erlang, "file", "change_mode")
pub fn r_change_mode_2(
  filename filename: String,
  mode mode: Int,
) -> ImproperResultOk(PosixError)

/// change_owner/2
@external(erlang, "file", "change_owner")
pub fn r_change_owner_2(
  filename filename: String,
  uid uid: Int,
) -> ImproperResultOk(PosixError)

/// change_owner/3
@external(erlang, "file", "change_owner")
pub fn r_change_owner_3(
  filename filename: NameAll,
  uid uid: Int,
  gid gid: Int,
) -> ImproperResultOk(PosixError)

/// change_time/2
@external(erlang, "file", "change_time")
pub fn r_change_time_2(
  filename filename: NameAll,
  mtime mtime: r_calendar.Datetime,
) -> ImproperResultOk(PosixError)

/// change_time/3
@external(erlang, "file", "change_time")
pub fn r_change_time_3(
  filename filename: NameAll,
  atime atime: r_calendar.Datetime,
  mtime mtime: r_calendar.Datetime,
) -> ImproperResultOk(PosixError)

/// close/1
@external(erlang, "file", "close")
pub fn r_close_1(iodevice iodevice: IoDevice) -> ImproperResultOk(PosixError)

/// consult/1
@external(erlang, "file", "consult")
pub fn r_consult_1(
  filename filename: NameAll,
) -> Result(r_erlang.Any, PosixError)

/// copy/2
/// FIXME: Missing full implementation
@external(erlang, "file", "copy")
pub fn r_copy_2(
  src src: IoDevice,
  dest dest: IoDevice,
) -> Result(Int, PosixError)

/// copy/3
/// FIXME: Missing full implementation
@external(erlang, "file", "copy")
pub fn r_copy_3(
  src src: IoDevice,
  dest dest: IoDevice,
  bytecount bytecount: Int,
) -> Result(Int, PosixError)

/// datasync/1
@external(erlang, "file", "datasync")
pub fn r_datasync_1(iodevice iodevice: IoDevice) -> ImproperResultOk(PosixError)

/// del_dir/1
@external(erlang, "file", "del_dir")
pub fn r_del_dir_1(dir dir: NameAll) -> ImproperResultOk(PosixError)

/// del_dir_r/1
@external(erlang, "file", "del_dir_r")
pub fn r_del_dir_r_1(file file: NameAll) -> ImproperResultOk(PosixError)

/// delete/1
@external(erlang, "file", "delete")
pub fn r_delete_1(file file: NameAll) -> ImproperResultOk(PosixError)

/// delete/2
/// FIXME: missing functionality of DeleteOption
@external(erlang, "file", "delete")
pub fn r_delete_2(
  filename filename: NameAll,
  options options: List(DeleteOption),
) -> ImproperResultOk(PosixError)

/// eval/1
@external(erlang, "file", "eval")
pub fn r_eval_1(name name: NameAll) -> ImproperResultOk(PosixError)

/// eval/2
@external(erlang, "file", "eval")
pub fn r_eval_2(
  arg1: NameAll,
  arg2: r_erlang.Any,
) -> ImproperResultOk(PosixError)

/// format_error/1
@external(erlang, "file", "format_error")
pub fn r_format_error_1(reason reason: PosixError) -> String

/// get_cwd/0
/// The return type should be Result(Filename, )
@external(erlang, "file", "get_cwd")
pub fn r_get_cwd_0() -> Result(String, PosixError)

/// get_cwd/1
/// UNSAFE
/// Has broken implementation on platforms that do not support disks (i.e. UNIX)
@external(erlang, "file", "get_cwd")
pub fn r_get_cwd_1(drive drive: String) -> Result(Filename, PosixError)

/// list_dir/1
@external(erlang, "file", "list_dir")
pub fn r_list_dir_1(dir dir: NameAll) -> Result(List(Filename), PosixError)

/// list_dir_all/1
/// TODO: In theory: returned List(String) on macOS.
@external(erlang, "file", "list_dir_all")
pub fn r_list_dir_all_1(
  dir dir: NameAll,
) -> Result(List(FilenameAll), PosixError)

/// make_dir/1
@external(erlang, "file", "make_dir")
pub fn r_make_dir_1(dirname dirname: NameAll) -> ImproperResultOk(PosixError)

/// make_link/2
@external(erlang, "file", "make_link")
pub fn r_make_link_2(
  existing existing: NameAll,
  new new: NameAll,
) -> ImproperResultOk(PosixError)

/// make_symlink/2
@external(erlang, "file", "make_symlink")
pub fn r_make_symlink_2(
  existing existing: NameAll,
  new new: NameAll,
) -> ImproperResultOk(PosixError)

pub type NativeNameEncoding {
  Latin1
  Utf8
}

/// native_name_encoding/0
@external(erlang, "file", "native_name_encoding")
pub fn r_native_name_encoding_0() -> NativeNameEncoding

/// FIXME: Lacking implementation
pub type Filemodes

/// FIXME: This probably shall have better name...
/// It's NameAll or IoData
pub type File

/// open/2
/// Opens file File in the mode determined by Modes, which can contain one or
/// more of the following options:
///
/// read - The file, which must exist, is opened for reading.
///
/// write - The file is opened for writing. It is created if it does not exist.
/// If the file exists and write is not combined with read, the file is truncated.
///
/// append - The file is opened for writing. It is created if it does not exist.
/// Every write operation to a file opened with append takes place at the end
/// of the file.
///
/// exclusive - The file is opened for writing. It is created if it does not
/// exist. If the file exists, {error, eexist} is returned.
/// binary - Read operations on the file return binaries rather than lists.
/// FIXME: Rewrite this multiple times to workaround with different issues
@external(erlang, "file", "open")
pub fn r_open_2(
  file file: File,
  modes modes: Filemodes,
) -> Result(IoDevice, PosixError)

@external(erlang, "file", "open")
pub fn r_open_2_with_filename(
  file file: NameAll,
  modes modes: Filemodes,
) -> Result(IoDevice, PosixError)

/// path_consult/2
/// FIXME: Probably proken return
@external(erlang, "file", "path_consult")
pub fn r_path_consult_2(
  path path: List(NameAll),
  filename filename: NameAll,
) -> Result(#(List(r_erlang.Any), NameAll), PosixError)

/// path_eval/2
@external(erlang, "file", "path_eval")
pub fn r_path_eval_2(
  path path: List(NameAll),
  filename filename: NameAll,
) -> Result(FilenameAll, PosixError)

/// path_open/3
/// FIXME (limitation): I don't support mode `directory`
@external(erlang, "file", "path_open")
pub fn r_path_open_3(
  path path: List(NameAll),
  filename filename: NameAll,
  modes modes: Mode,
) -> Result(#(IoDevice, FilenameAll), PosixError)

/// path_script/2
/// FIXME: I have broken return type...
@external(erlang, "file", "path_script")
pub fn r_path_script_2(
  path path: List(NameAll),
  filename filename: NameAll,
) -> Result(r_erlang.Any, PosixError)

/// path_script/3
/// FIXME: I have broken type in bindings. I'm usable, if you'd convert `erl_eval:binding_struct()` to Any
@external(erlang, "file", "path_script")
pub fn r_path_script_3(
  path path: List(NameAll),
  filename filename: NameAll,
  binding bindings: r_erlang.Any,
) -> Result(r_erlang.Any, PosixError)

/// position/2
@external(erlang, "file", "position")
pub fn r_position_2(
  iodevice iodevice: IoDevice,
  location location: Location,
) -> Result(Int, PosixError)

/// string(), binary(), or `eof` atom
/// FIXME: Needs a converter function
pub type RawData

/// pread/2
/// UNSAFE: Parameter locnums accepts only non-negative-int
@external(erlang, "file", "pread")
pub fn r_pread_2(
  iodevice: IoDevice,
  locnums: List(#(Location, Int)),
) -> Result(List(RawData), PosixError)

/// pread/3
/// UNSAFE: Parameter `number` accepts only non-negative-int
/// FIXME: Bad Return Type
@external(erlang, "file", "pread")
pub fn r_pread_3(
  iodevice iodevice: IoDevice,
  location location: Location,
  number number: Int,
) -> Result(r_erlang.Any, PosixError)

/// pwrite/2
/// Returns ImproperResultOk. If you want to unwrap the result use generic function `convert_improper_result` from `rosetta/improper_reults`
@external(erlang, "file", "pwrite")
pub fn r_pwrite_2(
  iodevice: IoDevice,
  locbytes: List(#(Location, r_erlang.IoData)),
) -> ImproperResultOk(#(Int, PosixError))

/// pwrite/3
/// Returns ImproperResultOk. If you want to unwrap the result use generic function `convert_improper_result` from `rosetta/improper_reults`
@external(erlang, "file", "pwrite")
pub fn r_pwrite_3(
  iodevice iodevice: IoDevice,
  location location: Location,
  bytes bytes: r_erlang.IoData,
) -> ImproperResultOk(PosixError)

/// ReadDevice
/// io_device() | atom() | pid() | standard_io() | standard_error() | user().
pub type ReadDevice

/// read/2
/// FIXME: Result - rawdata may give only string or binary
/// FIXME: it may result in no_translation. Runtime error...
/// FIXME: Runtime error when EOF.
/// It is recommended to use "read_file" instead. At least for now.
/// UNSAFE: number nust be > 0
/// WARNING: Our implementation is limited.
/// RawData is a list (string), when file was not open in binary mode. Binary() otherwise.
@external(erlang, "file", "read")
pub fn r_read_2(
  iodevice iodevice: IoDevice,
  number number: Int,
) -> Result(RawData, PosixError)

/// read_file/1
@external(erlang, "file", "read_file")
pub fn r_read_file_1(
  filename filename: NameAll,
) -> Result(r_erlang.Binary, PosixError)

/// read_file/2
/// Status shall be unsupported.
@external(erlang, "file", "read_file")
pub fn r_read_file_2(
  filename filename: NameAll,
  opts opts: r_erlang.Any,
) -> Result(r_erlang.Binary, PosixError)

/// read_file_info/1
/// name_all() | io_device(),
/// FIXME: Split or whatever...
@external(erlang, "file", "read_file_info")
pub fn r_read_file_info_by_handle(
  file file: IoDevice,
) -> Result(FileInfo, PosixError)

@external(erlang, "file", "read_file_info")
pub fn r_read_file_info_by_name(
  file file: NameAll,
) -> Result(FileInfo, PosixError)

/// read_file_info/2
/// FIXME: I'm broken.
@external(erlang, "file", "read_file_info")
pub fn r_read_file_info_2(
  file file: IoDevice,
  opts opts: r_erlang.Any,
) -> Result(FileInfo, PosixError)

/// read_line/1
/// FIXME: Partial implementation. This does not support any other than files.
@external(erlang, "file", "read_line")
pub fn r_read_line_1(
  iodeevice iodevice: IoDevice,
) -> Result(RawData, PosixError)

/// read_link/1
@external(erlang, "file", "read_link")
pub fn r_read_link_1(name name: NameAll) -> Result(Filename, PosixError)

/// read_link_all/1
@external(erlang, "file", "read_link_all")
pub fn r_read_link_all_1(name name: NameAll) -> Result(Filename, PosixError)

/// read_link_info/1
@external(erlang, "file", "read_link_info")
pub fn r_read_link_info_1(name name: NameAll) -> Result(FileInfo, PosixError)

/// read_link_info/2
@external(erlang, "file", "read_link_info")
pub fn r_read_link_info_2(
  name name: NameAll,
  opts opts: List(FileInfoOption),
) -> Result(FileInfo, PosixError)

/// rename/2
/// Returns ImproperResultOk. If you want to unwrap the result use generic function `convert_improper_result` from `rosetta/improper_reults`
@external(erlang, "file", "rename")
pub fn r_rename_2(
  src src: NameAll,
  dest dest: NameAll,
) -> ImproperResultOk(PosixError)

/// script/1
@external(erlang, "file", "script")
pub fn r_script_1(name name: NameAll) -> Result(r_erlang.Any, PosixError)

/// script/2
/// FIXME: I'm lacking erl_eval module
@external(erlang, "file", "script")
pub fn r_script_2(
  name name: NameAll,
  bindings bindings: r_erlang.Any,
) -> Result(r_erlang.Any, PosixError)

/// sendfile/2
/// FIXME: Lacking types for socket
@external(erlang, "file", "sendfile")
pub fn r_sendfile_2(
  filename filename: NameAll,
  socket socket: r_erlang.Any,
) -> Result(Int, PosixError)

/// sendfile/5
/// FIXME: this is broken
@external(erlang, "file", "sendfile")
pub fn r_sendfile_5(
  rawfile rawfile: r_erlang.Any,
  socket socket: r_erlang.Any,
  offset offset: r_erlang.Any,
  bytes bytes: r_erlang.Any,
  opts opts: r_erlang.Any,
) -> Result(Int, PosixError)

/// set_cwd/1
/// Returns ImproperResultOk. If you want to unwrap the result use generic function `convert_improper_result` from `rosetta/improper_reults`
@external(erlang, "file", "set_cwd")
pub fn r_set_cwd_1(dir dir: String) -> ImproperResultOk(PosixError)

/// sync/1
/// Returns ImproperResultOk. If you want to unwrap the result use generic function `convert_improper_result` from `rosetta/improper_reults`
@external(erlang, "file", "sync")
pub fn r_sync_1(iodevice iodevice: IoDevice) -> ImproperResultOk(PosixError)

/// truncate/1
/// Returns ImproperResultOk. If you want to unwrap the result use generic function `convert_improper_result` from `rosetta/improper_reults`
@external(erlang, "file", "truncate")
pub fn r_truncate_1(iodevice iodevice: IoDevice) -> ImproperResultOk(PosixError)

/// write/2
/// FIXME: We do not support all types of writes, yet.
/// Returns ImproperResultOk. If you want to unwrap the result use generic function `convert_improper_result` from `rosetta/improper_reults`
@external(erlang, "file", "write")
pub fn r_write_2(
  iodevice iodevice: IoDevice,
  bytes bytes: r_erlang.IoData,
) -> ImproperResultOk(PosixError)

/// write_file/2
/// Writes the contents of the iodata term Bytes to file Filename. The file is created if it does not exist. If it exists, the previous contents are overwritten. Returns ok if successful, otherwise {error, Reason}.
/// Returns ImproperResultOk. If you want to unwrap the result use generic function `convert_improper_result` from `rosetta/improper_reults`
@external(erlang, "file", "write_file")
pub fn r_write_file_2(
  filename filename: NameAll,
  bytes bytes: r_erlang.IoData,
) -> ImproperResultOk(PosixError)

/// write_file/3
/// Returns ImproperResultOk. If you want to unwrap the result use generic function `convert_improper_result` from `rosetta/improper_reults`
@external(erlang, "file", "write_file")
pub fn r_write_file_3(
  filename filename: NameAll,
  bytes bytes: r_erlang.IoData,
  modes modes: List(Mode),
) -> ImproperResultOk(PosixError)

/// write_file_info/2
/// Returns ImproperResultOk. If you want to unwrap the result use generic function `convert_improper_result` from `rosetta/improper_reults`
@external(erlang, "file", "write_file_info")
pub fn r_write_file_info_2(
  filename filename: NameAll,
  fileinfo fileinfo: FileInfo,
) -> ImproperResultOk(PosixError)

/// write_file_info/3
/// Returns ImproperResultOk. If you want to unwrap the result use generic function `convert_improper_result` from `rosetta/improper_reults`
@external(erlang, "file", "write_file_info")
pub fn r_write_file_info_3(
  filename filename: NameAll,
  fileinfo fileinfo: FileInfo,
  opts opts: List(FileInfoOption),
) -> ImproperResultOk(PosixError)
