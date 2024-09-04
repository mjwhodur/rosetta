/// This type represents what sometimes comes from Erlang. Atom`ok` or an Error.
/// Gleam does not support that directly, that's why we have this monstrosity here.
pub type ImproperResultOk(t) {
  Ok
  Error(t)
}

/// FIXME: test me.
@external(erlang, "improper_results_ffi", "convert_improper_result")
pub fn convert_improper_result(r r: ImproperResultOk(t)) -> Result(Nil, t)
