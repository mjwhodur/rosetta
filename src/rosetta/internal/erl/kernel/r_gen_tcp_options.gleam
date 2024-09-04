pub type Options {
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
}
