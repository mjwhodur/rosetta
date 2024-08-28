import gleeunit
import gleeunit/should
import rosetta/datetime

@external(erlang, "erlang", "date")
fn erl_date() -> #(Int, Int, Int)

pub fn main() {
  gleeunit.main()
}

pub fn date_test() {
  let ymd = erl_date()
  let t = datetime.date()
  case t {
    datetime.NaiveDate(y, m, d) -> should.equal(#(y, m, d), ymd)
  }
}
