import internal/erl/stdlib/datetime_erl

/// Alias for year
pub type Year =
  Int

/// Alias for Month
pub type Month =
  Int

/// Alias for Day
pub type Day =
  Int

/// Aliast for Hour
pub type Hour =
  Int

/// Alias for Minute 
pub type Minute =
  Int

/// Alias for Second
pub type Second =
  Int

/// Represents date and time data structure without timezone information.
/// This format is lossy.
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

/// Represents naive date (without timezone data.)
pub type NaiveDate {
  NaiveDate(year: Year, month: Month, day: Day)
}

/// Alias type for Timestamp. Timestamp is always given in UTC.
pub type Timestamp =
  Int

/// Returns current date as NaiveDate. Naive Date is not corrected with timezone.
pub fn date() -> NaiveDate {
  let ymd = datetime_erl.erl_date()
  NaiveDate(ymd.0, ymd.1, ymd.2)
}

/// Returns current system timestamp as Timestamp
pub fn timestamp() -> Timestamp {
  datetime_erl.erl_timestamp()
}

/// Utility function. Converts NaiveDate into tuple.
pub fn naivedate_to_tuple(d: NaiveDate) -> #(Int, Int, Int) {
  #(d.year, d.month, d.day)
}
