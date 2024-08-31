/////// This Gleam module aims to represent everything that there is in erts/erlang module
/////// It is not recommended to rely on any of these types here
/////// Functions prepended with r_ are their erlang counterparts, translated here for brevity

import gleam/dynamic.{type Dynamic}
import gleam/erlang
import gleam/erlang/atom.{type Atom}
import gleam/erlang/node.{type Node}

/// This is left here for the sake of brevity. It represents the Erlang Any Type
pub type Any

pub type Arity

pub type Binary

pub type RBitString

pub type BitString =
  BitArray

pub type Boolean =
  Bool

pub type Byte

pub type Char

pub type RDynamic

pub type RFloat =
  Float

pub type RFunction

pub type RIdentifier =
  Identifier

pub type Integer =
  Int

pub type IoData

pub type IoList

pub type RList0

pub type RList1

pub type RMap

pub type MaybeImproperList

pub type MaybeImproperList2

pub type Mfa

pub type Module

pub type NegInteger

pub type NoReturn

pub type RNode =
  Node

pub type NonNegInteger

pub type PosInteger

pub type RNone

pub type NonEmptyBinary

pub type NonEmptyBitString

pub type NonEmptyImproperList

pub type NonEmptyList

pub type NonEmptyList1

pub type NonEmptyMaybeImproperList

pub type NonEmptyMaybeImproperList2

pub type NonEmptyString

/// Erlang's Number Type
/// Gleam's Int or Float
pub type Number

/// This type is here because it may be useful when porting Erlang code
/// The empty AnyList. (list/0 in Erlang)
pub type RNil

pub type AnyList

/// Any of: Pid, Port or Reference
/// These types are defined in gleam_stdlib and gleam_erlang
/// so are omitted in this file.
pub type Identifier

/// In Erlang
pub type Term =
  Any

/// `timeout/0`
pub type RTimeout

/// In order not to clash with Gleam's tuple, it's an Erlang Tuple
pub type RTuple

pub type HelpMeNotTyped

///append_element/2
@deprecated("This has no tests")
@external(erlang, "erlang", "append_element")
pub fn r_append_element_2(tuple: RTuple, term: Any) -> RTuple

/// `erlang:abs/1` Returns a Number - absolute arithmetical value of float or int
@deprecated("This function is lacking tests")
@external(erlang, "erlang", "abs")
pub fn r_abs_1(value: Number) -> Number

/// atom_to_binary/1
@external(erlang, "erlang", "atom_to_binary")
pub fn r_atom_to_binary_1(value: Atom) -> Binary

// atom_to_binary/2
@external(erlang, "erlang", "atom_to_binary")
pub fn r_atom_to_binary_2(value: Atom, encoding: Atom) -> Binary

// atom_to_list/1
@external(erlang, "erlang", "atom_to_list")
pub fn r_atom_to_list(value: Atom) -> String

/// float/1
@deprecated("This function is lacking tests")
@external(erlang, "erlang", "float")
pub fn r_float_1(value: Number) -> Float

/// floor/1
@deprecated("This function is lacking tests")
@external(erlang, "erlang", "floor")
pub fn r_floor_1(value: Number) -> Int

/// fun_to_list/1
/// Returns `String` that represents the code that created Fun
@deprecated("This function is lacking tests. Likely buggy implementation")
@external(erlang, "erlang", "fun_to_list")
pub fn r_fun_to_list_1(value: Dynamic) -> String

/// hd/1
@deprecated("Likely buggy implementation")
@external(erlang, "erlang", "hd")
pub fn r_hd_1(value: AnyList) -> Any

/// insert_element/3
@external(erlang, "erlang", "insert_element")
pub fn r_insert_element(index: PosInteger, tuple1: RTuple, term: Term) -> RTuple

/// integer_to_binary/1
@deprecated("Lacking tests")
@external(erlang, "erlang", "integer_to_binary")
pub fn r_integer_to_binary_1(value: Int) -> BitArray

/// integer_to_binary/2
@deprecated("Lacking tests")
@external(erlang, "erlang", "integer_to_binary")
pub fn r_integer_to_binary_2(val: Any, val2: Any) -> BitArray

/// is_atom/1
@deprecated("Lacking tests")
@external(erlang, "erlang", "is_atom")
pub fn r_is_atom_1(value: Dynamic) -> Bool

/// is_binary/1
@deprecated("Lacking tests")
@external(erlang, "erlang", "is_binary")
pub fn r_is_binary_1(value: Dynamic) -> Bool

/// is_bitstring/1
@deprecated("Gleam's standard library has tool for that: gleam/bitstring")
@external(erlang, "erlang", "is_bitstring")
pub fn r_is_bitstring_1(value: Dynamic) -> Bool

/// is_boolean/1
@deprecated("Gleam's standard library has tool for that: gleam/dynamic/bool")
@external(erlang, "erlang", "is_boolean")
pub fn r_is_boolean_1(value: Dynamic) -> Bool

/// is_float/1
@deprecated("Gleam's standard library has tool for that: gleam/dynamic/float")
@external(erlang, "erlang", "is_float")
pub fn r_is_float_1(value: Dynamic) -> Bool

/// is_function/1
@deprecated("Lacking tests")
@external(erlang, "erlang", "is_function")
pub fn r_is_function_1(value: Dynamic) -> Bool

/// is_function/2
@deprecated("Lacking tests")
@external(erlang, "erlang", "is_function")
pub fn r_is_function_2(value1: Dynamic, value2: Dynamic) -> Bool

/// is_integer/1
@deprecated("Lacking tests")
@external(erlang, "erlang", "is_integer")
pub fn r_is_integer_1(value1: Dynamic) -> Bool

/// is_list/1
@deprecated("Lacking tests")
@external(erlang, "erlang", "is_list")
pub fn r_is_list_1(value1: Dynamic) -> Bool

/// is_map/1
@deprecated("Lacking tests")
@external(erlang, "erlang", "is_map")
pub fn r_is_map_1(value: Dynamic) -> Bool

/// is_map_key/2
@external(erlang, "erlang", "is_map_key")
pub fn r_is_map_key_2(key: Atom, map: RMap) -> Bool

/// is_number/1
@deprecated("Lacking tests")
@external(erlang, "erlang", "is_number")
pub fn r_is_number_1(value: Dynamic) -> Bool

/// is_pid/1
@deprecated("Lacking tests")
@external(erlang, "erlang", "is_pid")
pub fn r_is_pid_1(value: Dynamic) -> Bool

/// is_port/1
@deprecated("Lacking tests")
@external(erlang, "erlang", "is_port")
pub fn r_is_port_1(value: Dynamic) -> Bool

// @external(erlang, "erlang", "is_record")
/// is_record/2
/// It's broken!
@deprecated("BUGGY IMPLEMENTATION")
@external(erlang, "erlang", "is_bool")
pub fn r_is_record_2(term: Term) -> Bool

/// is_record/3
@deprecated("Lacking tests")
@external(erlang, "erlang", "is_record")
pub fn r_is_record_3(term: Term, record_tag: Atom, size: NonNegInteger) -> Bool

// is_reference/1
@deprecated("Lacking tests")
@external(erlang, "erlang", "is_reference")
pub fn r_is_reference_1(value: Dynamic) -> Bool

/// is_tuple/1
@deprecated("Lacking tests")
@external(erlang, "erlang", "is_tuple")
pub fn r_is_tuple_1(value: Dynamic) -> Bool

// length/1
@deprecated("Lacking tests")
@external(erlang, "erlang", "length")
pub fn r_length_1(value: List(Any)) -> Int

/// list_to_atom/1
/// From docu Returns the atom whose text representation is String.
/// May contain any Unicode Character
@deprecated("Lacking tests")
@external(erlang, "erlang", "list_to_atom")
pub fn r_list_to_atom_1(value: String) -> Atom

/// list_to_binary/1
@deprecated("Lacking tests")
@external(erlang, "erlang", "list_to_binary")
pub fn r_list_to_binary_1(value: IoList) -> Binary

/// round/1
@external(erlang, "erlang", "round")
pub fn r_round_1(value: Number) -> Int

/// term_to_iovec/2
@deprecated("FIXME: I'm untyped")
@external(erlang, "erlang", "term_to_iovec")
pub fn r_term_to_iovec_2(val: Any, val2: Any) -> Any

/// tl/1
@deprecated("This has no tests")
@external(erlang, "erlang", "tl")
pub fn r_tl_1(value: NonEmptyMaybeImproperList) -> Term

/// trunc/1
@deprecated("This has no tests")
@external(erlang, "erlang", "trunc")
pub fn r_trunc(value: Number) -> Int

/// tuple_size/1
@deprecated("This has no tests")
@external(erlang, "erlang", "tuple_size")
pub fn r_tuple_size(value: RTuple) -> Int

/// unique_integer/0
/// Generates and returns an integer unique on current runtime system instance.
@deprecated("This has no tests")
@external(erlang, "erlang", "unique_integer")
pub fn r_unique_integer_0() -> Int

// unique_integer/1
@deprecated("NOT IMPLEMENTED")
@external(erlang, "erlang", "unique_integer")
pub fn r_unique_integer_1() -> Int

/// binary_part/2
@deprecated("NOT IMPLEMENTED")
@external(erlang, "erlang", "binary_part")
pub fn r_binary_part_1() -> Nil

/// binary_part/3
@deprecated("NOT IMPLEMENTED")
@external(erlang, "erlang", "unique_integer")
pub fn r_binary_part_3() -> Nil

// binary_to_atom/1
@deprecated("NOT IMPLEMENTED")
@external(erlang, "erlang", "unique_integer")
pub fn r_binary_to_atom() -> Nil

/// binary_to_atom/2
@deprecated("NOT IMPLEMENTED")
@external(erlang, "erlang", "unique_integer")
pub fn r_binary_to_atom_2() -> Nil

/// binary_to_existing_atom/1
@deprecated("NOT IMPLEMENTED")
@external(erlang, "erlang", "unique_integer")
pub fn r_binary_to_existing_atom_1() -> Nil

/// binary_to_existing_atom/2
@deprecated("NOT IMPLEMENTED")
@external(erlang, "erlang", "unique_integer")
pub fn r_binary_to_existing_atom_2() -> Nil

/// binary_to_float/1
@deprecated("NOT IMPLEMENTED")
@external(erlang, "erlang", "unique_integer")
pub fn r_binary_to_float_1() -> Float

/// binary_to_integer/1
@deprecated("NOT IMPLEMENTED")
@external(erlang, "erlang", "unique_integer")
pub fn r_binary_to_integer_1() -> Integer

/// binary_to_integer/2
@deprecated("NOT IMPLEMENTED")
@external(erlang, "erlang", "unique_integer")
pub fn r_binary_to_integer_2() -> Integer

/// binary_to_list/1
@deprecated("NOT IMPLEMENTED")
@external(erlang, "erlang", "unique_integer")
pub fn r_binary_to_list_1() -> Integer

//' binary_to_list/3
@deprecated("NOT IMPLEMENTED")
@external(erlang, "erlang", "unique_integer")
pub fn r_binary_to_list_3() -> Integer

/// binary_to_term/1
@deprecated("NOT IMPLEMENTED")
@external(erlang, "erlang", "unique_integer")
pub fn r_binary_to_term_1() -> Integer

/// binary_to_term/2
@deprecated("NOT IMPLEMENTED")
@external(erlang, "erlang", "unique_integer")
pub fn r_binary_to_term_2() -> Integer

/// bit_size/1
@deprecated("NOT IMPLEMENTED")
@external(erlang, "erlang", "unique_integer")
pub fn r_bit_size_1() -> Integer

/// bitstring_to_list/1
@deprecated("NOT IMPLEMENTED")
@external(erlang, "erlang", "unique_integer")
pub fn r_bitstring_to_list_1() -> Integer

/// byte_size/1
@deprecated("NOT IMPLEMENTED")
@external(erlang, "erlang", "unique_integer")
pub fn r_byte_size_1() -> Integer

/// ceil/1
@deprecated("NOT IMPLEMENTED")
@external(erlang, "erlang", "unique_integer")
pub fn r_ceil_1() -> Integer

/// decode_packet/3
@deprecated("NOT IMPLEMENTED")
@external(erlang, "erlang", "unique_integer")
pub fn r_decode_packet_3() -> Integer

/// delete_element/2
@deprecated("NOT IMPLEMENTED")
@external(erlang, "erlang", "unique_integer")
pub fn r_delete_element_2() -> Integer

/// display/1
@deprecated("NOT IMPLEMENTED")
@external(erlang, "erlang", "unique_integer")
pub fn r_display_1() -> Integer

/// element/2
@deprecated("NOT IMPLEMENTED")
@external(erlang, "erlang", "unique_integer")
pub fn r_element_2() -> Integer

/// external_size/1
@deprecated("NOT IMPLEMENTED")
@external(erlang, "erlang", "unique_integer")
pub fn r_external_size_1() -> Integer

/// external_size/2
@deprecated("NOT IMPLEMENTED")
@external(erlang, "erlang", "unique_integer")
pub fn r_external_size_2() -> Integer

/// tuple_to_list/1
@deprecated("NOT IMPLEMENTED")
@external(erlang, "erlang", "unique_integer")
pub fn r_tuple_to_list() -> Integer

/// setelement/3
@deprecated("NOT IMPLEMENTED")
@external(erlang, "erlang", "unique_integer")
pub fn r_setelement_3() -> Integer

/// size/1
@deprecated("NOT IMPLEMENTED")
@external(erlang, "erlang", "unique_integer")
pub fn r_size_1() -> Integer

/// split_binary/2
@deprecated("NOT IMPLEMENTED")
@external(erlang, "erlang", "unique_integer")
pub fn r_split_binary_2() -> Integer

/// term_to_binary/1
@deprecated("NOT IMPLEMENTED")
@external(erlang, "erlang", "unique_integer")
pub fn r_term_to_binary_1() -> Integer

/// term_to_binary/2
@deprecated("NOT IMPLEMENTED")
@external(erlang, "erlang", "unique_integer")
pub fn r_term_to_binary_2() -> Integer

/// term_to_iovec/1
@deprecated("NOT IMPLEMENTED")
@external(erlang, "erlang", "unique_integer")
pub fn r_term_to_iovec() -> Integer

/// list_to_existing_atom/1
@deprecated("NOT IMPLEMENTED")
@external(erlang, "erlang", "unique_integer")
pub fn r_list_to_existing_atom_1() -> Integer

/// list_to_float/1
@deprecated("NOT IMPLEMENTED")
@external(erlang, "erlang", "unique_integer")
pub fn r_list_to_float_1() -> Integer

/// list_to_integer/1
@deprecated("NOT IMPLEMENTED")
@external(erlang, "erlang", "unique_integer")
pub fn r_list_to_integer_1() -> Integer

/// list_to_integer/2
@deprecated("NOT IMPLEMENTED")
@external(erlang, "erlang", "unique_integer")
pub fn r_list_to_integer_2() -> Integer

/// list_to_pid/1
@deprecated("NOT IMPLEMENTED")
@external(erlang, "erlang", "unique_integer")
pub fn r_list_to_pid_1() -> Integer

/// list_to_port/1
@deprecated("NOT IMPLEMENTED")
@external(erlang, "erlang", "unique_integer")
pub fn r_list_to_port_1() -> Integer

/// list_to_ref/1
@deprecated("NOT IMPLEMENTED")
@external(erlang, "erlang", "unique_integer")
pub fn r_list_to_ref_1() -> Integer

/// list_to_tuple/1
@deprecated("NOT IMPLEMENTED")
@external(erlang, "erlang", "unique_integer")
pub fn r_list_to_tuple() -> Integer

/// make_ref/0
@deprecated("NOT IMPLEMENTED")
@external(erlang, "erlang", "unique_integer")
pub fn r_make_ref() -> Integer

/// make_tuple/2
@deprecated("NOT IMPLEMENTED")
@external(erlang, "erlang", "unique_integer")
pub fn r_make_tuple_2() -> Integer

/// make_tuple/3
@deprecated("NOT IMPLEMENTED")
@external(erlang, "erlang", "unique_integer")
pub fn r_make_tuple_3() -> Integer

/// map_get/2
@deprecated("NOT IMPLEMENTED")
@external(erlang, "erlang", "unique_integer")
pub fn r_map_get_2() -> Integer

/// map_size/1
@deprecated("NOT IMPLEMENTED")
@external(erlang, "erlang", "unique_integer")
pub fn r_make_size_1() -> Integer

/// match_spec_test/3
@deprecated("NOT IMPLEMENTED")
@external(erlang, "erlang", "unique_integer")
pub fn r_match_spec_test_3() -> Integer

/// max/2
@deprecated("NOT IMPLEMENTED")
@external(erlang, "erlang", "unique_integer")
pub fn r_max_2() -> Integer

/// min/2
@deprecated("NOT IMPLEMENTED")
@external(erlang, "erlang", "unique_integer")
pub fn r_min_2() -> Integer

/// node/1
@deprecated("NOT IMPLEMENTED")
@external(erlang, "erlang", "unique_integer")
pub fn r_node_1() -> Integer

/// phash2/1
@deprecated("NOT IMPLEMENTED")
@external(erlang, "erlang", "unique_integer")
pub fn r_phash2_1() -> Integer

/// phash2/2
@deprecated("NOT IMPLEMENTED")
@external(erlang, "erlang", "unique_integer")
pub fn r_phash2_2() -> Integer

/// pid_to_list/1
@deprecated("NOT IMPLEMENTED")
@external(erlang, "erlang", "unique_integer")
pub fn r_pid_to_list_1() -> Integer

/// port_to_list/1
@deprecated("NOT IMPLEMENTED")
@external(erlang, "erlang", "unique_integer")
pub fn r_port_to_list_1() -> Integer

/// ref_to_list/1
@deprecated("NOT IMPLEMENTED")
@external(erlang, "erlang", "unique_integer")
pub fn r_ref_to_list_1() -> Integer

/// list_to_bitstring/1
@deprecated("NOT IMPLEMENTED")
@external(erlang, "erlang", "unique_integer")
pub fn r_list_to_bitstring_1() -> Integer

/// integer_to_list/1
@deprecated("NOT IMPLEMENTED")
@external(erlang, "erlang", "unique_integer")
pub fn r_integer_to_list_1() -> Integer

/// integer_to_list/2
@deprecated("NOT IMPLEMENTED")
@external(erlang, "erlang", "unique_integer")
pub fn r_integer_to_list_2() -> Integer

/// iolist_size/1
@deprecated("NOT IMPLEMENTED")
@external(erlang, "erlang", "unique_integer")
pub fn r_iolist_size_1() -> Integer

/// iolist_to_binary/1
@deprecated("NOT IMPLEMENTED")
@external(erlang, "erlang", "unique_integer")
pub fn r_iolist_to_binary_1() -> Integer

/// iolist_to_iovec/1
@deprecated("NOT IMPLEMENTED")
@external(erlang, "erlang", "unique_integer")
pub fn r_iolist_to_iovec_1() -> Integer

/// fun_info/1
@deprecated("NOT IMPLEMENTED")
@external(erlang, "erlang", "unique_integer")
pub fn r_fun_info_1() -> Integer

/// fun_info/2
@deprecated("NOT IMPLEMENTED")
@external(erlang, "erlang", "unique_integer")
pub fn r_fun_info() -> Integer

/// float_to_binary/1
@deprecated("NOT IMPLEMENTED")
@external(erlang, "erlang", "unique_integer")
pub fn r_float_to_binary_1() -> Integer

/// float_to_binary/2
@deprecated("NOT IMPLEMENTED")
@external(erlang, "erlang", "unique_integer")
pub fn r_float_to_binary_2() -> Integer

/// float_to_list/1
@deprecated("NOT IMPLEMENTED")
@external(erlang, "erlang", "unique_integer")
pub fn r_float_to_list_1() -> Integer

/// float_to_list/2
@deprecated("NOT IMPLEMENTED")
@external(erlang, "erlang", "unique_integer")
pub fn r_float_to_list_2() -> Integer

/// Left here intentionally
pub type ROSETTABROKEN

/// This will require glueing code
/// According to documentation it may have nested lists (worst case scenario - bitstring_list in bitstring_list...)
pub type BitstringList =
  MaybeImproperList

/// Likely cannot be implemented in Gleam
pub type CPUTopology =
  ROSETTABROKEN

pub type DeprecatedTimeUnit {
  Seconds
  MilliSeconds
  MicroSeconds
  NanoSeconds
}

pub type DistHandle =
  ROSETTABROKEN

pub type ExtBinary =
  Binary

pub type ExtIovec =
  Iovec

/// fun_info_item
pub type FunInfoItem {
  Arity
  Env
  Index
  Name
  Module
  NewIndex
  NewUniq
  Pid
  Type
  Uniq
}

pub type GarbageCollectionDefaults =
  List(GarbageCollectionDefaultOption)

/// NOT TESTED! <- Not available in stdlibrary, glueing code
pub type GarbageCollectionDefaultOption {
  MaxHeapSize(NonNegInteger)
  MinBinHeapSize(NonNegInteger)
  MinHeapSize(NonNegInteger)
  FullsweepAfter(NonNegInteger)
}

/// List(HaltOption) (how to implement this?)
pub type HaltOptions =
  List(HaltOption)

/// Glueing code for HaltOptions
pub type HaltOption {
  Flush(Bool)
  FlushTimeout(Int)
  Infinity
}

/// No documentation. Likely a leftover
pub type InfoList =
  RNil

pub type Iovec =
  List(Binary)

/// This has incompatible implementation
/// This will require glueing code
pub type LevelEntry =
  ROSETTABROKEN

/// level_tag
pub type LevelTag {
  Core
  Node
  Processor
  Thread
}

pub type MatchVariable =
  Atom

pub type MaxHeapSize =
  ROSETTABROKEN

pub type MemoryType {
  Total
  Processes
  ProcessesUsed
  System
  Atom
  AtomUsed
  Binary
  Code
  Ets
}

/// message_queue_data
pub type MessageQueueData {
  OffHeap
  OnHeap
}

/// monitor_option (partially broken implementation)
pub type MonitorOption {
  Alias(Atom)
  Tag(Term)
}

///
pub type MonitorPortIdentifier =
  ROSETTABROKEN

///monitor_proces_identifier
pub type MonitorProcessIdentifier =
  ROSETTABROKEN

/// nif_resource / 0 - opaque typ
pub type NifResource =
  ROSETTABROKEN

/// prepared_code/0
pub type PreparedCode =
  ROSETTABROKEN

/// priority_level/0
pub type PriorityLevel {
  Low
  Normal
  High
  Max
}

/// OMITED FOR SANITY
pub type ProcessInfoItem =
  ROSETTABROKEN

/// OMITED FOR SANITY XD
pub type ProcessInfoResultItem =
  ROSETTABROKEN

///rasie_stacktrace/0
pub type RaiseStacktrace =
  ROSETTABROKEN

/// registered_name/0
pub type RegisteredName =
  Atom

/// registered_process_identifier/0
pub type RegisteredProcesIdentifier =
  ROSETTABROKEN

pub type SchedulerBindType {
  NoNodeProcessorSpread
  NoNodeThreadSpread
  NoSpread
  ProcessorSpread
  Spread
  ThreadSpread
  ThreadNoNodeProcessorSpread
  Unbound
}

/// send_destination()
pub type SendDestination =
  ROSETTABROKEN

/// spawn_opt_option/0
pub type SpawnOptOption =
  ROSETTABROKEN

/// stack_item/0
pub type StackItem =
  ROSETTABROKEN

/// stacktrace/0
pub type Stacktrace =
  ROSETTABROKEN

/// stacktrace_extrainfo/0
pub type StacktraceExtrainfo =
  ROSETTABROKEN

/// sub_level/0
pub type SubLevel =
  ROSETTABROKEN

/// system_monitor_option/0
pub type SystemMonitorOption =
  ROSETTABROKEN

/// system_profile_option/0
pub type SystemProfileOption {
  Exclusive
  RunnablePorts
  RunnableProcs
  Scheduler
  Timestamp
  MontonicTimestamp
  StrictMonotonicTimestamp
}

/// Has implementation nonsuitable to Gleam
pub type TimeUnit =
  ROSETTABROKEN

pub type Timestamp =
  #(Int, Int, Int)

/// Needs glueing code
pub type TraceFlag =
  ROSETTABROKEN

pub type TraceInfoFlag =
  ROSETTABROKEN

pub type TraceInfoItemResult =
  ROSETTABROKEN

pub type TraceInfoReturn =
  ROSETTABROKEN

pub type TraceMatchSpec =
  ROSETTABROKEN

pub type TracePatternFlag =
  ROSETTABROKEN

pub type TracePatternMfa =
  ROSETTABROKEN
// ERLANG CHECKSUM FUNCTIONS
//
// Checksum

// adler32/1
// adler32/2
// adler32_combine/3
// crc32/1
// crc32/2
// crc32_combine/3
// md5/1
// md5_final/1
// md5_init/0
// md5_update/2

// Code

// check_old_code/1
// check_process_code/2
// check_process_code/3
// delete_module/1
// function_exported/3
// is_builtin/3
// load_module/2
// load_nif/2
// loaded/0
// module_loaded/1
// pre_loaded/0
// purge_module/1
// Distributed Erlang

// disconnect_node/1
// dist_ctrl_get_data/1
// dist_ctrl_get_data_notification/1
// dist_ctrl_get_opt/2
// dist_ctrl_input_handler/2
// dist_ctrl_put_data/2
// dist_ctrl_set_opt/3
// get_cookie/0
// get_cookie/1
// is_alive/0
// monitor_node/2
// monitor_node/3
// node/0
// nodes/0
// nodes/1
// nodes/2
// set_cookie/1
// set_cookie/2

// Processes and Ports

// alias/0
// alias/1
// apply/2
// apply/3
// bump_reductions/1
// demonitor/1
// demonitor/2
// erase/0
// erase/1
// error/1
// error/2
// error/3
// exit/1
// exit/2
// garbage_collect/0
// garbage_collect/1
// garbage_collect/2
// get/0
// get/1
// get_keys/0
// get_keys/1
// group_leader/0
// group_leader/2
// hibernate/3
// is_process_alive/1
// link/1
// monitor/2
// monitor/3
// nif_error/1
// nif_error/2
// open_port/2
// port_call/3
// port_close/1
// port_command/2
// port_command/3
// port_connect/2
// port_control/3
// port_info/1
// port_info/2
// ports/0
// process_display/2
// process_flag/2
// process_flag/3
// process_info/1
// process_info/2
// processes/0
// put/2
// raise/3
// register/2
// registered/0
// resume_process/1
// self/0
// send/2
// send/3
// send_nosuspend/2
// send_nosuspend/3
// spawn/1
// spawn/2
// spawn/3
// spawn/4
// spawn_link/1
// spawn_link/2
// spawn_link/3
// spawn_link/4
// spawn_monitor/1
// spawn_monitor/2
// spawn_monitor/3
// spawn_monitor/4
// spawn_opt/2
// spawn_opt/3
// spawn_opt/4
// spawn_opt/5
// spawn_request/1
// spawn_request/2
// spawn_request/3
// spawn_request/4
// spawn_request/5
// spawn_request_abandon/1
// suspend_process/1
// suspend_process/2
// throw/1
// unalias/1
// unlink/1
// unregister/1
// whereis/1
// yield/0
// System

// halt/0
// halt/1
// halt/2
// memory/0
// memory/1
// statistics/1
// system_flag/2
// system_info/1
// system_monitor/0
// system_monitor/1
// system_monitor/2
// system_profile/0
// system_profile/2
// Time and timers

// cancel_timer/1
// cancel_timer/2
// convert_time_unit/3
// date/0
// localtime/0
// localtime_to_universaltime/1
// localtime_to_universaltime/2
// monotonic_time/0
// monotonic_time/1
// read_timer/1
// read_timer/2
// send_after/3
// send_after/4
// start_timer/3
// start_timer/4
// system_time/0
// system_time/1
// time/0
// time_offset/0
// time_offset/1
// timestamp/0
// universaltime/0
// universaltime_to_localtime/1
