# rosetta

[![Package Version](https://img.shields.io/hexpm/v/rosetta)](https://hex.pm/packages/rosetta)
[![Hex Docs](https://img.shields.io/badge/hex-docs-ffaff3)](https://hexdocs.pm/rosetta/)

Rosetta library for interfacing Erlang VM.
Provides nice static typing for _dynamic_ BEAM values.

Rosetta is very unstable and its API will likely change.
It may be split into two/three separate packages in the future.

Always pin your versions until we reach API stability.

## Installation

Add `rosetta` to your Gleam project.
```sh
gleam add rosetta
```

## Porting status
| Erlang app | Erlang module | Status | Documentation | Description |
|------------|---------------|--------|---------------|-------------|
| `erts`     | `erlang`      | alpha       |               |             |
| `kernel`   | `file`        | not ported       |               |             |
| `kernel`   | `gen_tcp`     | partially ported       |               |             |
| `kernel`   | `inet`        | partially ported       |               |             |
| `ssl`      | `ssl`         | partially ported       |               |             |
| `stdlib`   | `calendar`    | almost 100% ported, unsafe, not tested       |               | Should be used with caution. Most functions do not test whether values are valid. `Offset` type is not implemented. `Rfc3339String` type is not implemented. |
| `stdlib`   | `lists`       | not ported       |               |             |
| `stdlib`   | `math`        | partially ported       |               |             |

## Modules

### Datetime
Provides high level interface to native Clock
