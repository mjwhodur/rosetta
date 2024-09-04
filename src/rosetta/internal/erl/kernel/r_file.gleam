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
}
