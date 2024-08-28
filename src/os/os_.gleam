import gleam/erlang/charlist.{type Charlist}

@external(erlang, "rosetta_os_ffi", "version")
pub fn external_version() -> #(Int, Int, Int, Charlist)

@external(erlang, "rosetta_os_ffi", "return_an_integer")
pub fn return_integer() -> Int

@external(erlang, "rosetta_os_ffi", "return_a_tuple")
pub fn return_tuple() -> #(Int, Int)
