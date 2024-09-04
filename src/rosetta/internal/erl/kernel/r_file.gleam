import gleam/dynamic
import rosetta/internal/erl/erts/r_erlang
import rosetta/internal/erl/stdlib/r_calendar

pub type Placeholder =
  dynamic.Dynamic

/// Represents POSIX error codes (`kernel:posix/0` in Erlang).
///
/// This type provides a direct mapping to POSIX error codes commonly used in UNIX systems
/// and many C compiler runtime libraries. These codes are used to indicate various
/// system-level errors that can occur during operations such as file I/O, network
/// communication, and process management.
///
/// POSIX (Portable Operating System Interface) is a family of standards specified by the
/// IEEE Computer Society for maintaining compatibility between operating systems. These
/// error codes are part of that standard, ensuring consistent error reporting across
/// different POSIX-compliant systems.
///
/// When working with system calls or libraries that interact closely with the operating
/// system, functions may return these error codes to indicate specific failure conditions.
/// Understanding these codes can help in diagnosing issues and handling errors appropriately
/// in your application.
///
/// Note: While these codes originate from POSIX standards, their exact behavior or
/// availability may vary slightly depending on the underlying system and the specific
/// Gleam/Erlang libraries being used.
///
/// You may also encounter these atoms in other places, like for example `inet`.
/// This is due to Gleam's limitation: a type can not have fields i.e. from the other type (like in Go, for example)
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
  /// - Operations on message queues when there's insufficient memory for buffering
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
  /// - Attempting to access a remote file system resource that is no longer available
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
  /// - Attempting to lock a file when the system's maximum number of locks is reached
  /// - Issues with file locking mechanisms in the operating system
  ///
  /// Note: This error is often encountered in systems with heavy file I/O operations.
  Enolck
  /// Not enough memory
  Enomem
  /// No space left on the device
  Enospc
  /// Out of streams resources
  /// NOT DOCUMENTED IN ERLANG
  /// Indicates that the system is out of STREAMS resources. This error is specific
  /// to systems that implement STREAMS I/O.
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
  /// - Calling a system call or library function that is not supported by the OS
  /// - Attempting to use a feature that is not available in the current environment
  ///
  /// Note: This error is important for maintaining portability across different systems.
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
  /// - File operations where a file size or offset exceeds the maximum allowed value
  ///
  /// Note: This error is important in systems programming and data processing tasks.
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

// file_info/0
pub type FileInfo =
  Placeholder

/// file_info_option/0
/// FIXME: Not ported
pub type FileInfoOption

/// filename/0
pub type Filename =
  String

/// filename_all/0
/// For whatever reason this should not be only a string.
/// In our scenario: String or Binary
pub type FilenameAll

/// io_device/0: Pid or Fd
/// FIXME: Add conversion to Pid or Fd
pub type IoDevice

// location/0 - partial translation
// We lack: integer() | bof | cur | eof impl.
pub type Location {
  Bof(offset: Int)
  Cur(offset: Int)
  Eof(offset: Int)
}

// mode/0
pub type Mode {
  Read
  Write
  Append
  Exclusive
  Raw
  Binary
  DelayedWrite(size: Int, delay: Int)
  Compressed
  CompressedOne
  /// Broken
  Encoding(r_erlang.Any)
  Sync
}

/// name/0
/// -type name() :: string() | atom() | deep_list().
/// FIXME: It would be ugly, if we'd simply use it as a string...
/// TODO: Needs a converter functions.
pub type Name

/// name_all/0
/// -type name_all() :: string() | atom() | deep_list() | (RawFilename :: binary()).
/// TODO: May need a helper function to convert between these
pub type NameAll

// posix_file_advise/0
pub type PosixFileAdvise {
  Normal
  Sequential
  Random
  NoReuse
  WillNeed
  DontNeed
}

/// Supports only "Raw"... But due to Gleam's limitations we have to workaround this FIXME
pub type ReadFileOption

// sendfile_option/0
pub type SendfileOption {
  ChunkSize(val: r_erlang.NonNegInteger)
  UseThreads(Bool)
}

// Functions

/// `advise/4`
/// `advise/4` can be used to announce an intention to access file data in a specific pattern in the future, thus allowing the operating system to perform appropriate optimizations.
/// On some platforms, this function might have no effect.
/// FIXME: Can result in `badarg` which is not yet supported here.
@external(erlang, "file", "advise")
pub fn r_advise_4(
  iodevice iodevice: IoDevice,
  offset offset: Int,
  length length: Int,
  advise advise: PosixFileAdvise,
) -> Result(Nil, PosixError)

/// allocate/3
@external(erlang, "file", "allocate")
pub fn r_allocate_3(
  arg1: Placeholder,
  arg2: Placeholder,
  arg3: Placeholder,
) -> Placeholder

/// change_group/2
@external(erlang, "file", "change_group")
pub fn r_change_group_2(arg1: Placeholder, arg2: Placeholder) -> Placeholder

/// change_mode/2
@external(erlang, "file", "change_mode")
pub fn r_change_mode_2(arg1: Placeholder, arg2: Placeholder) -> Placeholder

/// change_owner/2
@external(erlang, "file", "change_owner")
pub fn r_change_owner_2(arg1: Placeholder, arg2: Placeholder) -> Placeholder

/// change_owner/3
@external(erlang, "file", "change_owner")
pub fn r_change_owner_3(
  arg1: Placeholder,
  arg2: Placeholder,
  arg3: Placeholder,
) -> Placeholder

/// change_time/2
@external(erlang, "file", "change_time")
pub fn r_change_time_2(arg1: Placeholder, arg2: Placeholder) -> Placeholder

/// change_time/3
@external(erlang, "file", "change_time")
pub fn r_change_time_3(
  arg1: Placeholder,
  arg2: Placeholder,
  arg3: Placeholder,
) -> Placeholder

/// close/1
@external(erlang, "file", "close")
pub fn r_close_1(arg1: Placeholder) -> Placeholder

/// consult/1
@external(erlang, "file", "consult")
pub fn r_consult_1(arg1: Placeholder) -> Placeholder

/// copy/2
@external(erlang, "file", "copy")
pub fn r_copy_2(arg1: Placeholder, arg2: Placeholder) -> Placeholder

/// copy/3
@external(erlang, "file", "copy")
pub fn r_copy_3(
  arg1: Placeholder,
  arg2: Placeholder,
  arg3: Placeholder,
) -> Placeholder

/// datasync/1
@external(erlang, "file", "datasync")
pub fn r_datasync_1(arg1: Placeholder) -> Placeholder

/// del_dir/1
@external(erlang, "file", "del_dir")
pub fn r_del_dir_1(arg1: Placeholder) -> Placeholder

/// del_dir_r/1
@external(erlang, "file", "del_dir_r")
pub fn r_del_dir_r_1(arg1: Placeholder) -> Placeholder

/// delete/1
@external(erlang, "file", "delete")
pub fn r_delete_1(arg1: Placeholder) -> Placeholder

/// delete/2
@external(erlang, "file", "delete")
pub fn r_delete_2(arg1: Placeholder, arg2: Placeholder) -> Placeholder

/// eval/1
@external(erlang, "file", "eval")
pub fn r_eval_1(arg1: Placeholder) -> Placeholder

/// eval/2
@external(erlang, "file", "eval")
pub fn r_eval_2(arg1: Placeholder, arg2: Placeholder) -> Placeholder

/// format_error/1
@external(erlang, "file", "format_error")
pub fn r_format_error_1(arg1: Placeholder) -> Placeholder

/// get_cwd/0
@external(erlang, "file", "get_cwd")
pub fn r_get_cwd_0() -> Placeholder

/// get_cwd/1
@external(erlang, "file", "get_cwd")
pub fn r_get_cwd_1(arg1: Placeholder) -> Placeholder

/// list_dir/1
@external(erlang, "file", "list_dir")
pub fn r_list_dir_1(arg1: Placeholder) -> Placeholder

/// list_dir_all/1
@external(erlang, "file", "list_dir_all")
pub fn r_list_dir_all_1(arg1: Placeholder) -> Placeholder

/// make_dir/1
@external(erlang, "file", "make_dir")
pub fn r_make_dir_1(arg1: Placeholder) -> Placeholder

/// make_link/2
@external(erlang, "file", "make_link")
pub fn r_make_link_2(arg1: Placeholder, arg2: Placeholder) -> Placeholder

/// make_symlink/2
@external(erlang, "file", "make_symlink")
pub fn r_make_symlink_2(arg1: Placeholder, arg2: Placeholder) -> Placeholder

/// native_name_encoding/0
@external(erlang, "file", "native_name_encoding")
pub fn r_native_name_encoding_0() -> Placeholder

/// open/2
@external(erlang, "file", "open")
pub fn r_open_2(arg1: Placeholder, arg2: Placeholder) -> Placeholder

/// path_consult/2
@external(erlang, "file", "path_consult")
pub fn r_path_consult_2(arg1: Placeholder, arg2: Placeholder) -> Placeholder

/// path_eval/2
@external(erlang, "file", "path_eval")
pub fn r_path_eval_2(arg1: Placeholder, arg2: Placeholder) -> Placeholder

/// path_open/3
@external(erlang, "file", "path_open")
pub fn r_path_open_3(
  arg1: Placeholder,
  arg2: Placeholder,
  arg3: Placeholder,
) -> Placeholder

/// path_script/2
@external(erlang, "file", "path_script")
pub fn r_path_script_2(arg1: Placeholder, arg2: Placeholder) -> Placeholder

/// path_script/3
@external(erlang, "file", "path_script")
pub fn r_path_script_3(
  arg1: Placeholder,
  arg2: Placeholder,
  arg3: Placeholder,
) -> Placeholder

/// position/2
@external(erlang, "file", "position")
pub fn r_position_2(arg1: Placeholder, arg2: Placeholder) -> Placeholder

/// pread/2
@external(erlang, "file", "pread")
pub fn r_pread_2(arg1: Placeholder, arg2: Placeholder) -> Placeholder

/// pread/3
@external(erlang, "file", "pread")
pub fn r_pread_3(
  arg1: Placeholder,
  arg2: Placeholder,
  arg3: Placeholder,
) -> Placeholder

/// pwrite/2
@external(erlang, "file", "pwrite")
pub fn r_pwrite_2(arg1: Placeholder, arg2: Placeholder) -> Placeholder

/// pwrite/3
@external(erlang, "file", "pwrite")
pub fn r_pwrite_3(
  arg1: Placeholder,
  arg2: Placeholder,
  arg3: Placeholder,
) -> Placeholder

/// read/2
@external(erlang, "file", "read")
pub fn r_read_2(arg1: Placeholder, arg2: Placeholder) -> Placeholder

/// read_file/1
@external(erlang, "file", "read_file")
pub fn r_read_file_1(arg1: Placeholder) -> Placeholder

/// read_file/2
@external(erlang, "file", "read_file")
pub fn r_read_file_2(arg1: Placeholder, arg2: Placeholder) -> Placeholder

/// read_file_info/1
@external(erlang, "file", "read_file_info")
pub fn r_read_file_info_1(arg1: Placeholder) -> Placeholder

/// read_file_info/2
@external(erlang, "file", "read_file_info")
pub fn r_read_file_info_2(arg1: Placeholder, arg2: Placeholder) -> Placeholder

/// read_line/1
@external(erlang, "file", "read_line")
pub fn r_read_line_1(arg1: Placeholder) -> Placeholder

/// read_link/1
@external(erlang, "file", "read_link")
pub fn r_read_link_1(arg1: Placeholder) -> Placeholder

/// read_link_all/1
@external(erlang, "file", "read_link_all")
pub fn r_read_link_all_1(arg1: Placeholder) -> Placeholder

/// read_link_info/1
@external(erlang, "file", "read_link_info")
pub fn r_read_link_info_1(arg1: Placeholder) -> Placeholder

/// read_link_info/2
@external(erlang, "file", "read_link_info")
pub fn r_read_link_info_2(arg1: Placeholder, arg2: Placeholder) -> Placeholder

/// rename/2
@external(erlang, "file", "rename")
pub fn r_rename_2(arg1: Placeholder, arg2: Placeholder) -> Placeholder

/// script/1
@external(erlang, "file", "script")
pub fn r_script_1(arg1: Placeholder) -> Placeholder

/// script/2
@external(erlang, "file", "script")
pub fn r_script_2(arg1: Placeholder, arg2: Placeholder) -> Placeholder

/// sendfile/2
@external(erlang, "file", "sendfile")
pub fn r_sendfile_2(arg1: Placeholder, arg2: Placeholder) -> Placeholder

/// sendfile/5
@external(erlang, "file", "sendfile")
pub fn r_sendfile_5(
  arg1: Placeholder,
  arg2: Placeholder,
  arg3: Placeholder,
  arg4: Placeholder,
  arg5: Placeholder,
) -> Placeholder

/// set_cwd/1
@external(erlang, "file", "set_cwd")
pub fn r_set_cwd_1(arg1: Placeholder) -> Placeholder

/// sync/1
@external(erlang, "file", "sync")
pub fn r_sync_1(arg1: Placeholder) -> Placeholder

/// truncate/1
@external(erlang, "file", "truncate")
pub fn r_truncate_1(arg1: Placeholder) -> Placeholder

/// write/2
@external(erlang, "file", "write")
pub fn r_write_2(arg1: Placeholder, arg2: Placeholder) -> Placeholder

/// write_file/2
@external(erlang, "file", "write_file")
pub fn r_write_file_2(arg1: Placeholder, arg2: Placeholder) -> Placeholder

/// write_file/3
@external(erlang, "file", "write_file")
pub fn r_write_file_3(
  arg1: Placeholder,
  arg2: Placeholder,
  arg3: Placeholder,
) -> Placeholder

/// write_file_info/2
@external(erlang, "file", "write_file_info")
pub fn r_write_file_info_2(arg1: Placeholder, arg2: Placeholder) -> Placeholder

/// write_file_info/3
@external(erlang, "file", "write_file_info")
pub fn r_write_file_info_3(
  arg1: Placeholder,
  arg2: Placeholder,
  arg3: Placeholder,
) -> Placeholder
