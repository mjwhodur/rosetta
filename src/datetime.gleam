import internal/erl/stdlib/datetime_erl

pub type Year =
  Int

pub type Month =
  Int

pub type Day =
  Int

pub type Hour =
  Int

pub type Minute =
  Int

pub type Second =
  Int

pub type DateTimeNaive {
  DateTimeNaive(
    year: Year,
    month: Month,
    day: Day,
    hour: Hour,
    minute: Minute,
    second: Second,
  )
}

pub type NaiveDate {
  NaiveDate(hour: Hour, minute: Minute, second: Second)
}

pub type Timestamp =
  Int

pub type DateTime {
  NaiveTime
  DateTime
}

pub fn date() {
  let ymd = datetime_erl.erl_date()
  NaiveDate(ymd.0, ymd.1, ymd.2)
}

pub fn timestamp() -> Timestamp {
  datetime_erl.erl_timestamp()
}
