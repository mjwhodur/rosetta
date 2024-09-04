import rosetta/internal/erl/erts/r_erlang
import rosetta/internal/erl/stdlib/r_calendar_helper_types

pub type Date =
  #(Year, Month, Day)

pub type Datetime1970 =
  #(Year1970, Month, Date, Time)

pub type Day =
  Int

pub type Daynum =
  Int

pub type Hour =
  Int

pub type Ldom =
  Int

pub type Minute =
  Int

pub type Month =
  Int

pub type Offset

/// FIXME - not supported yet
pub type Rfc3339String

pub type Rfc3339TimeUnit {
  Microsecond
  Millisecond
  Nanosecond
  Second
  Native
}

pub type Second =
  Int

pub type SecsPerDay =
  Int

pub type Time =
  #(Hour, Minute, Second)

pub type Weeknum =
  Int

pub type Year1970 =
  Int

pub type Year =
  Int

pub type Yearweeknum =
  #(Year, Weeknum)

pub type Datetime =
  #(Date, Time)

/// date_to_gregorian_days/1
/// Computes the number of gregorian days starting with year 0 and ending at the specified date.
/// Shall return "non-negative integer". Simplified for brevity.
@external(erlang, "calendar", "date_to_gregorian_days")
pub fn r_date_to_gregorian_days_1(date date: Date) -> Int

/// date_to_gregorian_days/3
/// Returns non-negative integer
@external(erlang, "calendar", "date_to_gregorian_days")
pub fn r_date_to_gregorian_days_3(
  year year: Year,
  month month: Month,
  day day: Day,
) -> Int

/// datetime_to_gregorian_seconds/1
/// Computes the number of gregorian seconds starting with year 0 and ending at the specified date and time.
@external(erlang, "calendar", "datetime_to_gregorian_seconds")
pub fn r_datetime_to_gregorian_seconds_1(datetime datetime: Datetime) -> Int

/// day_of_the_week/1
@external(erlang, "calendar", "day_of_the_week")
pub fn r_day_of_the_week_1(datetime datetime: Datetime) -> Daynum

/// day_of_the_week/3
@external(erlang, "calendar", "day_of_the_week")
pub fn r_day_of_the_week_3(
  year year: Year,
  month month: Month,
  day day: Day,
) -> Daynum

/// gregorian_days_to_date/1
@external(erlang, "calendar", "gregorian_days_to_date")
pub fn r_gregorian_days_to_date_1(date date: Int) -> Date

/// gregorian_seconds_to_datetime/1
@external(erlang, "calendar", "gregorian_seconds_to_datetime")
pub fn r_gregorian_seconds_to_datetime_1(seconds seconds: Int) -> Datetime

/// is_leap_year/1
@external(erlang, "calendar", "is_leap_year")
pub fn r_is_leap_year_1(year year: Year) -> Bool

// iso_week_number/0
@external(erlang, "calendar", "iso_week_number")
pub fn r_iso_week_number_0() -> Yearweeknum

/// iso_week_number/1
/// Returns tuple {Year, WeekNum} representing the ISO week number for the specified date.
@external(erlang, "calendar", "iso_week_number")
pub fn r_iso_week_number_1(date date: Date) -> Yearweeknum

// last_day_of_the_month/2
@external(erlang, "calendar", "last_day_of_the_month")
pub fn r_last_day_of_the_month_2(year year: Year, month month: Month) -> Ldom

/// local_time/0
/// Returns the local time reported by the underlying operating system.
@external(erlang, "calendar", "local_time")
pub fn r_local_time_0() -> Datetime

// local_time_to_universal_time/1
@deprecated("This function is deprecated. calendar:local_time_to_universal_time/1 is deprecated; use calendar:local_time_to_universal_time_dst/1 instead.")
@external(erlang, "calendar", "local_time_to_universal_time")
pub fn r_local_time_to_universal_time_1(
  datetime datetime: Datetime1970,
) -> Datetime1970

/// local_time_to_universal_time_dst/1
/// Converts from local time to Universal Coordinated Time (UTC). `datetime` must refer to a local date after Jan 1, 1970.
@external(erlang, "calendar", "local_time_to_universal_time_dst")
pub fn r_local_time_to_universal_time_dst_1(
  datetime datetime: Datetime1970,
) -> Datetime1970

/// now_to_datetime/1
@external(erlang, "calendar", "now_to_datetime")
pub fn r_now_to_datetime_1(now now: r_erlang.Timestamp) -> Datetime1970

/// now_to_local_time/1
@external(erlang, "calendar", "now_to_local_time")
pub fn r_now_to_local_time_1(now now: r_erlang.Timestamp) -> Datetime1970

/// now_to_universal_time/1
@external(erlang, "calendar", "now_to_universal_time")
pub fn r_now_to_universal_time_1(now now: r_erlang.Timestamp) -> Datetime1970

/// rfc3339_to_system_time/1
@external(erlang, "calendar", "rfc3339_to_system_time")
pub fn r_rfc3339_to_system_time_1(
  datetimestring datetimestring: Rfc3339String,
) -> Int

/// rfc3339_to_system_time/2
/// FIXME: Lacking options type
@external(erlang, "calendar", "rfc3339_to_system_time")
pub fn r_rfc3339_to_system_time_2(
  datetimestring datetimestring: Rfc3339String,
  options options: r_calendar_helper_types.Rcf3339ToSystem,
) -> Int

/// seconds_to_daystime/1
/// TODO: This could probably have its own type
@external(erlang, "calendar", "seconds_to_daystime")
pub fn r_seconds_to_daystime_1(seconds seconds: Int) -> #(Int, Time)

/// seconds_to_time/1
@external(erlang, "calendar", "seconds_to_time")
pub fn r_seconds_to_time_1(arg1: SecsPerDay) -> Time

/// system_time_to_local_time/2
@external(erlang, "calendar", "system_time_to_local_time")
pub fn r_system_time_to_local_time_2(
  time time: Int,
  timeunit timeunit: r_erlang.TimeUnit,
) -> Datetime

/// system_time_to_rfc3339/1
@external(erlang, "calendar", "system_time_to_rfc3339")
pub fn r_system_time_to_rfc3339_1(time time: Int) -> Rfc3339String

/// Options for function `r_system_time_to_rfc339_2`
/// Partially broken.
pub type TimeToRfcOptions {
  /// FIXME: This does not fully conform to what we have here. The offset, either a string or an integer, to be included in the formatted string. An empty string, which is the default, is interpreted as local time. A non-empty string is included as is. The time unit of the integer is the same as the one of Time.
  Offset(offset: Offset)
  ///  The character used as time designator, that is, the date and time separator. The default is `$T`.
  TimeDesignator(designator: r_erlang.Byte)
  /// The time unit of Time. The default is second. If some other unit is given (millisecond, microsecond, nanosecond, or native), the formatted string includes a fraction of a second. The number of fractional second digits is three, six, or nine depending on what time unit is chosen. For native three fractional digits are included. Notice that trailing zeros are not removed from the fraction.
  Unit(unit: Rfc3339TimeUnit)
}

// system_time_to_rfc3339/2
@external(erlang, "calendar", "system_time_to_rfc3339")
pub fn r_system_time_to_rfc3339_2(
  time time: Int,
  options options: List(TimeToRfcOptions),
) -> Rfc3339String

/// system_time_to_universal_time/2
@external(erlang, "calendar", "system_time_to_universal_time")
pub fn r_system_time_to_universal_time_2(
  time time: Int,
  timeunit timeunit: r_erlang.TimeUnit,
) -> Datetime

/// time_difference/2
@deprecated("This function is obsolete. Use the conversion functions for gregorian days and seconds instedad.")
@external(erlang, "calendar", "time_difference")
pub fn r_time_difference_2(arg1: Nil, arg2: Nil) -> Nil

/// time_to_seconds/1
/// Returns the number of seconds since midnight up to the specified time.
@external(erlang, "calendar", "time_to_seconds")
pub fn r_time_to_seconds_1(time time: Time) -> SecsPerDay

/// universal_time/0
/// Returns the Universal Coordinated Time (UTC) reported by the underlying operating system. Returns local time if universal time is unavailable.
@external(erlang, "calendar", "universal_time")
pub fn r_universal_time_0() -> Datetime

/// universal_time_to_local_time/1
/// Converts from Universal Coordinated Time (UTC) to local time. DateTime must refer to a date after Jan 1, 1970.
@external(erlang, "calendar", "universal_time_to_local_time")
pub fn r_universal_time_to_local_time_1(
  datetime datetime: Datetime1970,
) -> Datetime

/// valid_date/1
/// This function checks if a date is a valid.
@external(erlang, "calendar", "valid_date")
pub fn r_valid_date_1(date date: Date) -> Bool

/// valid_date/3
/// This function checks if a date is a valid.
/// Equivalent of r_valid_date_1
@external(erlang, "calendar", "valid_date")
pub fn r_valid_date_3(year year: Year, month month: Month, day day: Day) -> Bool
