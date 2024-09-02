# Porting guide

## About the Result Type
I couldn't find the Result Type in Gleam STDLIB

My assumption is that:
```gleam
type Result {
  Ok(any)
  Error(any)
}
```
matches the following:
```erlang
{ok, any()}
{error, any()}
```

## Mapping the Gleam simple types to types in Erlang

- String -> string/0
- BitArray -> bitarray/0
- Int -> integer/0
- Float -> float/0
- Boolean -> bool/0
- BitArray -> ???
- Nil -> nil. (It's an atom!)


- AnythingElse (simple) -> any() (in typespec) ()

## Mapping the Gleam compund types to Erlang
### Basic Gleam Types
- Tuple -> maps _partially_ to tuple() (in Erlang tuple can have different types of values in it)
- List  -> maps _partially_ to list() (in Erlang list can have different types of items in it)
- Dict -> non bound by the compiler, it's implemented in library

### Other
Apparently this erlang code:

```erlang

func(want_error) ->
    case want_error of
        true -> {ok, "No error"}
        false -> {error, "It's an error"}
```

can be referenced from

```gleam
@external(erlang, "module", "func")
pub fn want_error(a: Bool) -> Result(String)

```

```
conversion between erlang types

pub type OsFamily {
  // The family which includes modern versions of the Windows operating system.
  WindowsNt <- atom
  // The family of operating systems based on the open source Linux kernel.
  Linux <- atom
  // The family of Apple operating systems such as macOS and iOS.
  Darwin <- atom
  // The family of operating systems based on the FreeBSD kernel.
  FreeBsd <-- ATOM!!! (free_bsd)
  // An operating system kernel other than Linux, Darwin, FreeBSD, or NT.
  Other(String) <- {other, string()}
}
```

Following compiles to ERLANG record in hrl, but I'm not sure whether it's used anywhere
```
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

-record(date_time_naive, {
    year :: integer(),
    month :: integer(),
    day :: integer(),
    hour :: integer(),
    minute :: integer(),
    second :: integer()
}).

-record(naive_date, {year :: integer(), month :: integer(), day :: integer()}).

pub type NaiveDate {
  NaiveDate(year: Year, month: Month, day: Day)
}


```

With other types:
```
{win32, nt} ->
            windows_nt;
        {unix, linux} ->
            linux;
        {unix, darwin} ->
            darwin;
        {unix, freebsd} ->
            free_bsd;
        {_, Other} ->
            {other, atom_to_binary(Other, utf8)}

pub type OsFamily {
  // The family which includes modern versions of the Windows operating system.
  WindowsNt
  // The family of operating systems based on the open source Linux kernel.
  Linux
  // The family of Apple operating systems such as macOS and iOS.
  Darwin
  // The family of operating systems based on the FreeBSD kernel.
  FreeBsd
  // An operating system kernel other than Linux, Darwin, FreeBSD, or NT.
  Other(String)
}



```


```


-type date_time_naive() :: {date_time_naive,
        integer(),
        integer(),
        integer(),
        integer(),
        integer(),
        integer()}.

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

-type naive_date() :: {naive_date, integer(), integer(), integer()}.

pub type NaiveDate {
  NaiveDate(year: Year, month: Month, day: Day) // aliases to integer
}


```
