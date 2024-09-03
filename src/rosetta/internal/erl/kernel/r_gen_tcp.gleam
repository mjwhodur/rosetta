import gleam/dynamic
import gleam/erlang/process
import rosetta/internal/erl/erts/r_erlang
import rosetta/internal/erl/kernel/r_gen_tcp_accept_error

/// connect_option/0
pub type ConnectOption

/// listen_option/0
pub type ListenOption

/// option/0
pub type Option

/// option_name/0
pub type OptionName

/// pktoptions_value/0
pub type PktoptionsValue

/// socket/0
pub type Socket

/// string/0; binary/0 or... HttpPacket (Any)
pub type Packet

/// Reimplements errors returned by Listen/1.
pub type ListenError {
  SystemLimit
  Eaddrinuse
  Eaddrnotavail
  Eafnosupport
  Ealready
  Econnaborted
  Econnrefused
  Econnreset
  Edestaddrreq
  Ehostdown
  Ehostunreach
  Einprogress
  Eisconn
  Emsgsize
  Enetdown
  Enetunreach
  Enopkg
  Enoprotoopt
  Enetconn
  Enotty
  Enotsock
  Eproto
  Eprotonosupport
  Eprototype
  Esocktnosupport
  Etimedout
  Ewouldblock
  Exbadport
  Exbadseq
  Eacces
  Enotblk
  Enotdir
  Eagain
  Ebadf
  Ebadmsg
  Ebusy
  Edeadlk
  Edeadlock
  Edquot
  Eexist
  Efault
  Efbig
  Eftype
  Eintr
  Einval
  Eio
  Eisdir
  Enolck
  Enolink
  Enoent
  Enomem
  Enospc
  Enosr
  Enostr
  Enosys
  Eloop
  Emfile
  Emlink
  Emultihop
  Enametoolong
  Enfile
  Enobufs
  Enodev
  Enotsup
  Enxio
  Eopnotsupp
  Eoverflow
  Eperm
  Epipe
  Erange
  Erofs
  Espipe
  Esrch
  Estale
}

///-type option() ::
// {active, true | false | once | -32768..32767} |
// {buffer, non_neg_integer()} |
// {debug, boolean()} |
// {delay_send, boolean()} |
// {deliver, port | term} |
// {dontroute, boolean()} |
// {exit_on_close, boolean()} |
// {exclusiveaddruse, boolean()} |
// {header, non_neg_integer()} |
// {high_msgq_watermark, pos_integer()} |
// {high_watermark, non_neg_integer()} |
// {keepalive, boolean()} |
// {linger, {boolean(), non_neg_integer()}} |
// {low_msgq_watermark, pos_integer()} |
// {low_watermark, non_neg_integer()} |
// {mode, list | binary} |
// list | binary |
// {nodelay, boolean()} |
// {packet,
//  0 | 1 | 2 | 4 | raw | sunrm | asn1 | cdr | fcgi | line | tpkt | http | httph | http_bin |
//  httph_bin} |
// {packet_size, non_neg_integer()} |
// {priority, non_neg_integer()} |
// {raw, Protocol :: non_neg_integer(), OptionNum :: non_neg_integer(), ValueBin :: binary()} |
// {recbuf, non_neg_integer()} |
// {reuseaddr, boolean()} |
// {reuseport, boolean()} |
// {reuseport_lb, boolean()} |
// {send_timeout, non_neg_integer() | infinity} |
// {send_timeout_close, boolean()} |
// {show_econnreset, boolean()} |
// {sndbuf, non_neg_integer()} |
// {tos, non_neg_integer()} |
// {tclass, non_neg_integer()} |
// {ttl, non_neg_integer()} |
// {recvtos, boolean()} |
// {recvtclass, boolean()} |
// {recvttl, boolean()} |
// {ipv6_v6only, boolean()}.

/// {fd, Fd :: non_neg_integer()} |
///          inet:address_family() |
///          {ifaddr, socket:sockaddr_in() | socket:sockaddr_in6() | inet:socket_address()} |
///          {ip, inet:socket_address()} |
///          {port, inet:port_number()} |
///          {backlog, B :: non_neg_integer()} |
///          {tcp_module, module()} |
///          {netns, file:filename_all()} |
///          {bind_to_device, binary()}
/// OR
/// -type option() ::
/// {active, true | false | once | -32768..32767} |
/// {buffer, non_neg_integer()} |
/// {debug, boolean()} |
/// {delay_send, boolean()} |
/// {deliver, port | term} |
/// {dontroute, boolean()} |
/// {exit_on_close, boolean()} |
/// {exclusiveaddruse, boolean()} |
/// {header, non_neg_integer()} |
/// {high_msgq_watermark, pos_integer()} |
/// {high_watermark, non_neg_integer()} |
/// {keepalive, boolean()} |
/// {linger, {boolean(), non_neg_integer()}} |
/// {low_msgq_watermark, pos_integer()} |
/// {low_watermark, non_neg_integer()} |
/// {mode, list | binary} |
/// list | binary |
/// {nodelay, boolean()} |
/// {packet,
///  0 | 1 | 2 | 4 | raw | sunrm | asn1 | cdr | fcgi | line | tpkt | http | httph | http_bin |
///  httph_bin} |
/// {packet_size, non_neg_integer()} |
/// {priority, non_neg_integer()} |
/// {raw, Protocol :: non_neg_integer(), OptionNum :: non_neg_integer(), ValueBin :: binary()} |
/// {recbuf, non_neg_integer()} |
/// {reuseaddr, boolean()} |
/// {reuseport, boolean()} |
/// {reuseport_lb, boolean()} |
/// {send_timeout, non_neg_integer() | infinity} |
/// {send_timeout_close, boolean()} |
/// {show_econnreset, boolean()} |
/// {sndbuf, non_neg_integer()} |
/// {tos, non_neg_integer()} |
/// {tclass, non_neg_integer()} |
/// {ttl, non_neg_integer()} |
/// {recvtos, boolean()} |
/// {recvtclass, boolean()} |
/// {recvttl, boolean()} |
/// {ipv6_v6only, boolean()}.
pub type ListenOptions {
  /// SAME AS IN r_gen_tcp_options.gleam, but it is an ugly hack because the Gleam does not support redefining types
  /// This option is not fully supported
  Active(Bool)
  /// This option accepts non-negative integer
  Buffer(Int)
  Debug(Bool)
  DelaySend(Bool)
  /// This option is broken
  Deliver
  Dontroute(Bool)
  ExitOnClose(Bool)
  Exclusiveaddruse(Bool)
  /// Partial implementation
  Header(Int)
  /// Partial implementation
  HighMsgqWatermark(Int)
  /// Should be non_neg_integer
  HighWatermark(Int)
  Keepalive(Bool)
  Linger(#(Bool, Int))
  /// Partial implementation
  LowMsgqWatermark(Int)
  /// Partial implementation
  LowWatermark(Int)
  /// BROKEN: should be atom
  Mode(String)
  List
  Binary
  Nodelay(Bool)
  /// Missing implementation
  Packet
  /// Missing implementation
  Raw
  RecBuf(Int)
  Reuseaddr(Bool)
  Reuseport(Bool)
  ReuseportLb(Bool)
  /// Send Timeout set to non-neg integer. If infinity is desired, omit this option
  SendTimeout(Int)
  SendTimeoutClose(Bool)
  ShowEconnreset(Bool)
  /// Shall be non-neg-int
  Sndbuf(Int)
  /// Shall be non-neg-int
  Tos(Int)
  /// Shall be non-neg-int
  Tclass(Int)
  /// Shall be non-neg-int
  Ttl(Int)
  Recvtos(Bool)
  Recvtclass(Bool)
  Ipv6Only(Bool)
  Recvttl(Bool)
  ///
  Fd(Int)
  // Not supported
  Inet
  // missing. Likely won't work
  Ifaddr
  /// Missing part
  Ip
  /// Partially incompatible - needs to be checked
  Port(Int)
  /// Partially incompatible
  Backlog(Int)
  /// Not working
  TcpModule(r_erlang.Module)
  /// Shall be file:filename_all()
  NetNs(String)
  BindToDevice(Bool)
}

/// (listen/2) Port has to be integer in range: 0..65535
/// This function does not check for correct port
/// erlang: `listen(Port, Options) -> {ok, ListenSocket} | {error, Reason}`
/// ```when
///        Port :: inet:port_number(),
///        Options :: [inet:inet_backend() | listen_option()],
///        ListenSocket :: socket(),
///        Reason :: system_limit | inet:posix().
/// ```
/// `inet:posix()` errors are reimplemented in `ListenError` type
///
/// This implementation is broken, as it does not support multiple options
@external(erlang, "gen_tcp", "listen")
pub fn r_listen_2(
  port port: Int,
  options options: List(ListenOptions),
) -> Result(Socket, ListenError)

/// accept/1
@external(erlang, "gen_tcp", "accept")
pub fn r_accept_1(
  listensocket listensocket: Socket,
) -> Result(Socket, r_gen_tcp_accept_error.AcceptError)

/// accept/2
/// If you want timeout to be infinite, use `accept/1` (`r_accept_1`)
@external(erlang, "gen_tcp", "accept")
pub fn r_accept_2(
  listensocket listensocket: Socket,
  timeout timeout: Int,
) -> Result(Socket, r_gen_tcp_accept_error.AcceptError)

/// close/1
/// This function in reality returns "ok" atom.
@external(erlang, "gen_tcp", "close")
pub fn r_close_1(socket socket: Socket) -> Nil

/// connect/2
// @external(erlang, "gen_tcp", "connect")
// pub fn r_connect_2()
// connect/3
// connect/4
/// controlling_process/2
/// Partially broken implementation. Does not resolve with correct error. Error can be unpacked manually
@external(erlang, "gen_tcp", "controlling_process")
pub fn r_controlling_process_2(
  socket socket: Socket,
  pid pid: process.Pid,
) -> Result(Nil, dynamic.Dynamic)

/// recv/2
/// This implementation is lacking proper error handling
@external(erlang, "gen_tcp", "recv")
pub fn r_recv_2(socket: Socket, length: Int) -> Result(Packet, dynamic.Dynamic)

/// recv/3
/// Receive a packet, from a socket in passive mode.
///A closed socket is indicated by the return value {error, closed}. If the socket is not in passive mode, the return value is {error, einval}.
///Argument Length is only meaningful when the socket is in raw mode and denotes the number of bytes to read. If Length is 0, all available bytes are returned. If Length > 0, exactly Length bytes are returned, or an error; except if the socket is closed from the other side, then the last read before the one returning {error, closed} may return less than Length bytes of data.
@external(erlang, "gen_tcp", "recv")
pub fn r_recv_3(
  socket: Socket,
  length: Int,
  timeout timeout: Int,
) -> Result(Packet, dynamic.Dynamic)

/// send/2
/// Send a packet on a socket.
/// Non-blocking send.
/// When using inet_backend = socket, the behaviour is different. There is no buffering, instead the caller will "hang" until all of the data has been sent or the send timeout (as specified by the send_timeout option) expires (the function can "hang" even when using the inet backend if the internal buffers are full).
@external(erlang, "gen_tcp", "send")
pub fn r_send_2(
  socket socket: Socket,
  packet packet: Packet,
) -> Result(Nil, dynamic.Dynamic)

// shutdown/2
@external(erlang, "gen_tcp", "shutdown")
pub fn r_shutdown_2(
  socket socket: Socket,
  how how: ShutdownMethod,
) -> Result(Nil, dynamic.Dynamic)

pub type ShutdownMethod {
  Read
  Write
  ReadWrite
}
