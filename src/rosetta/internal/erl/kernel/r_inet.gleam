pub type PortNumber

pub type InetError {
  InvalidPort
}

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
