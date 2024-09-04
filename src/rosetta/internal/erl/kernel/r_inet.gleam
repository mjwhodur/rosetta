import gleam/dynamic

pub type PortNumber

pub type InetError {
  InvalidPort
}

pub type AddressFamily {
  Inet
  Inet6
  Local
}

/// Missing implementation
pub type AncillaryData

/// Missing implementation
pub type FamilyAddress

/// Missing implementation
pub type Hostent

/// Atom or string...
pub type Hostname

pub type InetBackend

/// This can be one of Ip4Address or Ip6Address
/// Which one?
pub type IpAddress

pub type LocalAddress

/// Partially broken. Always have to be checked whether this is a correct ip address
/// Missing implementation of convert functions
pub type Ip4Address =
  #(Int, Int, Int, Int)

pub type Ip6Address =
  #(Int, Int, Int, Int, Int, Int, Int, Int)

/// returned_non_ip_address()
pub type ReturnedNonIpAddress {
  // Won't work, move out
  Localz
  Unspec(BitArray)
  Undefined(dynamic.Dynamic)
}

/// posix/0
pub type PosixError {
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
}

/// Missing implementation
pub type PktoptionsValue

/// socket/0
pub type Socket

/// ip_address or any or local or local_address/0
pub type SocketAddress

///  gen_sctp:option_name() | gen_tcp:option_name() | gen_udp:option_name().
pub type SocketGetopt

pub type SocketOptval

pub type SocketProtocol {
  Tcp
  Udp
  Sctp
}

pub type StatOption {
  RecvCnt
  RecvMax
  RecvAvg
  RecvOct
  RecvDvi
  SendCnt
  SendMax
  SendAvg
  SentOct
  SendPend
}

/// gen_sctp:option() | gen_tcp:option() | gen_udp:option().
pub type SocketSetOpt

pub fn int_to_portnumber(port: Int) -> Result(PortNumber, InetError) {
  case port >= 0 && port <= 65_535 {
    True -> Ok(idx_to_portnumber(port))
    False -> Error(InvalidPort)
  }
}

@external(erlang, "rosetta_core_ffi", "ident")
fn idx_to_portnumber(port: Int) -> PortNumber

@deprecated("This function is unsafe.")
pub fn int_to_portnumber_unsafe(port: Int) -> PortNumber {
  idx_to_portnumber(port)
}
