/// Represents something that could be a result, but it's representation does not conform to Gleams.
/// Example could be a tuple that could me managed manually, but we don't want to do it. This could be unwrapped to
/// standard result type.
/// The thing is whether we really need this...?
pub type MalformedResult(oktype, errtype) {
  Ok(oktype)
  Error(errtype)
}
/// Warning. Careless typing may cause runtime `badarg`s
// pub fn malformed_is_ok(result result: MalformedResult(t, n)) -> Bool {
//   todo
// }

// /// Warning. Careless typing may cause runtime `badarg`s
// pub fn malformed_to_result(result result: MalformedResult(t, n)) -> Result(n, t) {
//   todo
// }
