pub fn rosetta() -> String {
  "Big Gleamy hello from Rosetta 0.1.0"
}

@external(erlang, "rosetta_core_ffi", "ident")
pub fn unsafe_cast(value: typefrom) -> typeto
