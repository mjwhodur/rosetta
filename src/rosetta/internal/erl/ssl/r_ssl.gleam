///// ROSETTA SSL

import rosetta/internal/erl/erts/r_erlang.{type Any}
import rosetta/internal/erl/kernel/r_inet

pub type SslSocket

pub type MissingSSLObject

pub type TlsProtocol {
  Tls
  Dtls
}

/// TlsHandshake Type corresponds to... FIXME
pub type TlsHandshakeType {
  Hello
  Full
}

pub type TlsVerificationMode {
  VerifyNone
  VerifyPeer
}

/// TlsServerOption is what `ssl:listen/2` function can accept
pub type TlsServerOption {
  // ServerOptionCert - shall be this type, but gleam does not yet support nested types
  //  {cacerts, CACerts :: [public_key:der_encoded()] | [public_key:combined_cert()]} |
  //         {cacertfile, CACertFile :: file:filename()} |
  //         {verify, Verify :: verify_none | verify_peer} |
  //         {fail_if_no_peer_cert, FailNoPeerCert :: boolean()} |
  //         {certificate_authorities, ServerCertAuth :: boolean()}.
  Cacerts(MissingSSLObject)
  // That should be probably file:filename, but we don't have option for that yet
  Cacertfile(String)
  Verify(TlsVerificationMode)
  FailIfNoPeerCert(Bool)
  CertificateAuthorities(Bool)
  // Not implemented
  // -type common_option_cert() ::
  // {certs_keys, CertsKeys :: [cert_key_conf()]} |
  // {depth, AllowedCertChainLen :: pos_integer()} |
  // {verify_fun, Verify :: {Verifyfun :: fun(), InitialUserState :: any()}} |
  // {cert_policy_opts,
  //  PolicyOpts ::
  //      [{policy_set, [public_key:oid()]} |
  //       {explicit_policy, boolean()} |
  //       {inhibit_policy_mapping, boolean()} |
  //       {inhibit_any_policy, boolean()}]} |
  // {crl_check, Check :: boolean() | peer | best_effort} |
  // {crl_cache, crl_cache_opts()} |
  // {partial_chain, anchor_fun()}.
  // Broken, missing part: cert_key_conf
  CertsKeys(List(Any))
  Depth(allowed_cert_chain_len: Int)
  // Broken
  VerifyFun(#(Any, Any))
  CertPolicyOpts(Any)
  CrlCheck(Any)
  CrlCache(Any)
  PartialChain(Any)
  // Possibly broken
  AlpnPreferredProtocols(List(BitArray))
  // Possibly broken
  SniHosts(List(Any))
  // Definitely BROKEN
  SniFun(fn(String) -> List(Any))
  // Not Implemented
  ServerOptionPreTls13
  CommonOptionPreTls13
  ServerOptionTls13
  CommonOptionTls13
  CommonOptionDtls
  Protocol(TlsProtocol)
  Handshake(TlsHandshakeType)
  Ciphers(MissingSSLObject)
  SignatureAlgs(MissingSSLObject)
  SignatureAlgsCert(MissingSSLObject)
  KeepSecrets(Bool)
  MaxHandshakeSize(Int)
  Versions(MissingSSLObject)
  LogLevel(MissingSSLObject)
  HibernateAfter(MissingSSLObject)
  ReceiverSpawnOpts(MissingSSLObject)
  SenderSpawnOpts(MissingSSLObject)

  //gen_udp:option()
  //gen_tcp:listen_option()
  //gen_tcp:connect_option()
  GenTcpConnectOption

  // Cannot be easily ported here ...
  TransportOption
}

/// lacking implementation
pub type SNIHost

/// lacking implementation
pub type Reason

@external(erlang, "ssl", "listen")
pub fn r_listen_2(
  port: r_inet.PortNumber,
  options: List(TlsServerOption),
) -> Result(SslSocket, Reason)

@external(erlang, "ssl", "start")
pub fn r_start() -> Nil
