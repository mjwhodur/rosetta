import gleam/erlang/charlist
import os/os_

pub type OSVersion {
  OSTuple(major: Int, minor: Int, patch: Int)
  OSString(String)
}

pub fn version() -> OSVersion {
  let vsn = os_.external_version()

  case charlist.to_string(vsn.3) {
    "ok" -> OSTuple(vsn.0, vsn.1, vsn.2)
    _ -> OSString(charlist.to_string(vsn.3))
  }
}
