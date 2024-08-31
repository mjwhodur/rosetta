# erts OTP app

## erts/erlang (basic)

In the tables: ?? means - not found in a place, may be included in compiler
! - partially incompatible type 

### Predefined datatypes

| Erlang                         | State                       | `Gleam` symbol   | Canonical? | Repository | Package | Module | Link |
|--------------------------------|-----------------------------|------------------|------------|------------|---------|--------|------|
| nil/0                          |                             | Nil??            |            |            |         |        |      |
| any/0                          |                             | Dynamic?         |            |            |         |        |      |
| arity/0                        |                             |                  |            |            |         |        |      |
| atom/0                         |                             | Atom?            |            |            |         |        |      |
| binary/0                       |                             |                  |            |            |         |        |      |
| bitstring/0                    |                             |                  |            |            |         |        |      |
| boolean/0                      |                             | Bool?            |            |            |         |        |      |
| byte/0                         |                             |                  |            |            |         |        |      |
| char/0                         |                             |                  |            |            |         |        |      |
| dynamic/0                      |                             | Dynamic?         |            |            |         |        |      |
| float/0                        |                             | Float            |            |            |         |        |      |
| function/0                     |                             |                  |            |            |         |        |      |
| identifier/0                   |                             |                  |            |            |         |        |      |
| integer/0                      |                             | Int              |            |            |         |        |      |
| iodata/0                       |                             |                  |            |            |         |        |      |
| iolist/0                       |                             |                  |            |            |         |        |      |
| list/0                         |                             | List?            |            |            |         |        |      |
| list/1                         |                             | List?            |            |            |         |        |      |
| map/0                          |                             | Dict! gleam/dict |            |            |         |        |      |
| maybe_improper_list/0          |                             |                  |            |            |         |        |      |
| maybe_improper_list/2          |                             |                  |            |            |         |        |      |
| mfa/0                          |                             |                  |            |            |         |        |      |
| module/0                       |                             |                  |            |            |         |        |      |
| neg_integer/0                  |                             |                  |            |            |         |        |      |
| no_return/0                    |                             | Nil?             |            |            |         |        |      |
| node/0                         |                             | Node             |            |            |         |        |      |
| non_neg_integer/0              |                             |                  |            |            |         |        |      |
| none/0                         |                             | None?            |            |            |         |        |      |
| nonempty_binary/0              |                             |                  |            |            |         |        |      |
| nonempty_bitstring/0           |                             |                  |            |            |         |        |      |
| nonempty_improper_list/2       |                             |                  |            |            |         |        |      |
| nonempty_list/0                |                             |                  |            |            |         |        |      |
| nonempty_list/1                |                             |                  |            |            |         |        |      |
| nonempty_maybe_improper_list/0 |                             |                  |            |            |         |        |      |
| nonempty_maybe_improper_list/2 |                             |                  |            |            |         |        |      |
| nonempty_string/0              |                             |                  |            |            |         |        |      |
| number/0                       | In Erlang: integer or float | ?                |            |            |         |        |      |
| pid/0                          |                             | Pid*             |            |            |         |        |      |
| port/0                         |                             | Port*            |            |            |         |        |      |
| pos_integer/0                  |                             | Integer*?        |            |            |         |        |      |
| reference/0                    |                             |                  |            |            |         |        |      |
| string/0                       |                             | String           |            |            |         |        |      |
| term/0                         | ? can be anything?          |                  |            |            |         |        |      |
| timeout/0                      |                             |                  |            |            |         |        |      |
| tuple/0                        |                             | Tuple            |            |            |         |        |      |

## Types

| Erlang                          | State | `Gleam` symbol | Canonical? | Repository | Package | Module | Link |
|---------------------------------|-------|----------------|------------|------------|---------|--------|------|
| bitstring_list/0                | ????? | Bitstring?     |            |            |         |        |      |
| cpu_topology/0                  |       |                |            |            |         |        |      |
| deprecated_time_unit/0          |       |                |            |            |         |        |      |
| dist_handle/0                   |       |                |            |            |         |        |      |
| ext_binary/0                    |       |                |            |            |         |        |      |
| ext_iovec/0                     |       |                |            |            |         |        |      |
| fun_info_item/0                 |       |                |            |            |         |        |      |
| garbage_collection_defaults/0   |       |                |            |            |         |        |      |
| halt_options/0                  |       |                |            |            |         |        |      |
| info_list/0                     |       |                |            |            |         |        |      |
| iovec/0                         |       |                |            |            |         |        |      |
| level_entry/0                   |       |                |            |            |         |        |      |
| level_tag/0                     |       |                |            |            |         |        |      |
| match_variable/0                |       |                |            |            |         |        |      |
| max_heap_size/0                 |       |                |            |            |         |        |      |
| memory_type/0                   |       |                |            |            |         |        |      |
| message_queue_data/0            |       |                |            |            |         |        |      |
| monitor_option/0                |       |                |            |            |         |        |      |
| monitor_port_identifier/0       |       |                |            |            |         |        |      |
| monitor_process_identifier/0    |       |                |            |            |         |        |      |
| nif_resource/0                  |       |                |            |            |         |        |      |
| prepared_code/0                 |       |                |            |            |         |        |      |
| priority_level/0                |       |                |            |            |         |        |      |
| process_info_item/0             |       |                |            |            |         |        |      |
| process_info_result_item/0      |       |                |            |            |         |        |      |
| raise_stacktrace/0              |       |                |            |            |         |        |      |
| registered_name/0               |       |                |            |            |         |        |      |
| registered_process_identifier/0 |       |                |            |            |         |        |      |
| scheduler_bind_type/0           |       |                |            |            |         |        |      |
| send_destination/0              |       |                |            |            |         |        |      |
| spawn_opt_option/0              |       |                |            |            |         |        |      |
| stack_item/0                    |       |                |            |            |         |        |      |
| stacktrace/0                    |       |                |            |            |         |        |      |
| stacktrace_extrainfo/0          |       |                |            |            |         |        |      |
| sub_level/0                     |       |                |            |            |         |        |      |
| system_monitor_option/0         |       |                |            |            |         |        |      |
| system_profile_option/0         |       |                |            |            |         |        |      |
| time_unit/0                     |       |                |            |            |         |        |      |
| timestamp/0                     |       |                |            |            |         |        |      |
| trace_flag/0                    |       |                |            |            |         |        |      |
| trace_info_flag/0               |       |                |            |            |         |        |      |
| trace_info_item_result/0        |       |                |            |            |         |        |      |
| trace_info_return/0             |       |                |            |            |         |        |      |
| trace_match_spec/0              |       |                |            |            |         |        |      |
| trace_pattern_flag/0            |       |                |            |            |         |        |      |
| trace_pattern_mfa/0             |       |                |            |            |         |        |      |

### Checksum

| Erlang            | State | `Gleam` symbol | Canonical? | Repository | Package | Module | Link |
|-------------------|-------|----------------|------------|------------|---------|--------|------|
| adler32/1         |       |                |            |            |         |        |      |
| adler32/2         |       |                |            |            |         |        |      |
| adler32_combine/3 |       |                |            |            |         |        |      |
| crc32/1           |       |                |            |            |         |        |      |
| crc32/2           |       |                |            |            |         |        |      |
| crc32_combine/3   |       |                |            |            |         |        |      |
| md5/1             |       |                |            |            |         |        |      |
| md5_final/1       |       |                |            |            |         |        |      |
| md5_init/0        |       |                |            |            |         |        |      |
| md5_update/2      |       |                |            |            |         |        |      |

### Code

| Erlang               | State | `Gleam` symbol | Canonical? | Repository | Package | Module | Link |
|----------------------|-------|----------------|------------|------------|---------|--------|------|
| check_old_code/1     |       |                |            |            |         |        |      |
| check_process_code/2 |       |                |            |            |         |        |      |
| check_process_code/3 |       |                |            |            |         |        |      |
| delete_module/1      |       |                |            |            |         |        |      |
| function_exported/3  |       |                |            |            |         |        |      |
| is_builtin/3         |       |                |            |            |         |        |      |
| load_module/2        |       |                |            |            |         |        |      |
| load_nif/2           |       |                |            |            |         |        |      |
| loaded/0             |       |                |            |            |         |        |      |
| module_loaded/1      |       |                |            |            |         |        |      |
| pre_loaded/0         |       |                |            |            |         |        |      |
| purge_module/1       |       |                |            |            |         |        |      |

### Distributed Erlang

| Erlang                            | State | `Gleam` symbol | Canonical? | Repository | Package | Module | Link |
|-----------------------------------|-------|----------------|------------|------------|---------|--------|------|
| disconnect_node/1                 |       |                |            |            |         |        |      |
| dist_ctrl_get_data/1              |       |                |            |            |         |        |      |
| dist_ctrl_get_data_notification/1 |       |                |            |            |         |        |      |
| dist_ctrl_get_opt/2               |       |                |            |            |         |        |      |
| dist_ctrl_input_handler/2         |       |                |            |            |         |        |      |
| dist_ctrl_put_data/2              |       |                |            |            |         |        |      |
| dist_ctrl_set_opt/3               |       |                |            |            |         |        |      |
| get_cookie/0                      |       |                |            |            |         |        |      |
| get_cookie/1                      |       |                |            |            |         |        |      |
| is_alive/0                        |       |                |            |            |         |        |      |
| monitor_node/2                    |       |                |            |            |         |        |      |
| monitor_node/3                    |       |                |            |            |         |        |      |
| node/0                            |       |                |            |            |         |        |      |
| nodes/0                           |       |                |            |            |         |        |      |
| nodes/1                           |       |                |            |            |         |        |      |
| nodes/2                           |       |                |            |            |         |        |      |
| set_cookie/1                      |       |                |            |            |         |        |      |
| set_cookie/2                      |       |                |            |            |         |        |      |

### Erlang terms

| Erlang                    | State | `Gleam` symbol | Canonical? | Repository | Package | Module | Link |
|---------------------------|-------|----------------|------------|------------|---------|--------|------|
| abs/1                     |       |                |            |            |         |        |      |
| append_element/2          |       |                |            |            |         |        |      |
| atom_to_binary/1          |       |                |            |            |         |        |      |
| atom_to_binary/2          |       |                |            |            |         |        |      |
| atom_to_list/1            |       |                |            |            |         |        |      |
| binary_part/2             |       |                |            |            |         |        |      |
| binary_part/3             |       |                |            |            |         |        |      |
| binary_to_atom/1          |       |                |            |            |         |        |      |
| binary_to_atom/2          |       |                |            |            |         |        |      |
| binary_to_existing_atom/1 |       |                |            |            |         |        |      |
| binary_to_existing_atom/2 |       |                |            |            |         |        |      |
| binary_to_float/1         |       |                |            |            |         |        |      |
| binary_to_integer/1       |       |                |            |            |         |        |      |
| binary_to_integer/2       |       |                |            |            |         |        |      |
| binary_to_list/1          |       |                |            |            |         |        |      |
| binary_to_list/3          |       |                |            |            |         |        |      |
| binary_to_term/1          |       |                |            |            |         |        |      |
| binary_to_term/2          |       |                |            |            |         |        |      |
| bit_size/1                |       |                |            |            |         |        |      |
| bitstring_to_list/1       |       |                |            |            |         |        |      |
| byte_size/1               |       |                |            |            |         |        |      |
| ceil/1                    |       |                |            |            |         |        |      |
| decode_packet/3           |       |                |            |            |         |        |      |
| delete_element/2          |       |                |            |            |         |        |      |
| display/1                 |       |                |            |            |         |        |      |
| element/2                 |       |                |            |            |         |        |      |
| external_size/1           |       |                |            |            |         |        |      |
| external_size/2           |       |                |            |            |         |        |      |
| float/1                   |       |                |            |            |         |        |      |
| float_to_binary/1         |       |                |            |            |         |        |      |
| float_to_binary/2         |       |                |            |            |         |        |      |
| float_to_list/1           |       |                |            |            |         |        |      |
| float_to_list/2           |       |                |            |            |         |        |      |
| floor/1                   |       |                |            |            |         |        |      |
| fun_info/1                |       |                |            |            |         |        |      |
| fun_info/2                |       |                |            |            |         |        |      |
| fun_to_list/1             |       |                |            |            |         |        |      |
| hd/1                      |       |                |            |            |         |        |      |
| insert_element/3          |       |                |            |            |         |        |      |
| integer_to_binary/1       |       |                |            |            |         |        |      |
| integer_to_binary/2       |       |                |            |            |         |        |      |
| integer_to_list/1         |       |                |            |            |         |        |      |
| integer_to_list/2         |       |                |            |            |         |        |      |
| iolist_size/1             |       |                |            |            |         |        |      |
| iolist_to_binary/1        |       |                |            |            |         |        |      |
| iolist_to_iovec/1         |       |                |            |            |         |        |      |
| is_atom/1                 |       |                |            |            |         |        |      |
| is_binary/1               |       |                |            |            |         |        |      |
| is_bitstring/1            |       |                |            |            |         |        |      |
| is_boolean/1              |       |                |            |            |         |        |      |
| is_float/1                |       |                |            |            |         |        |      |
| is_function/1             |       |                |            |            |         |        |      |
| is_function/2             |       |                |            |            |         |        |      |
| is_integer/1              |       |                |            |            |         |        |      |
| is_list/1                 |       |                |            |            |         |        |      |
| is_map/1                  |       |                |            |            |         |        |      |
| is_map_key/2              |       |                |            |            |         |        |      |
| is_number/1               |       |                |            |            |         |        |      |
| is_pid/1                  |       |                |            |            |         |        |      |
| is_port/1                 |       |                |            |            |         |        |      |
| is_record/2               |       |                |            |            |         |        |      |
| is_record/3               |       |                |            |            |         |        |      |
| is_reference/1            |       |                |            |            |         |        |      |
| is_tuple/1                |       |                |            |            |         |        |      |
| length/1                  |       |                |            |            |         |        |      |
| list_to_atom/1            |       |                |            |            |         |        |      |
| list_to_binary/1          |       |                |            |            |         |        |      |
| list_to_bitstring/1       |       |                |            |            |         |        |      |
| list_to_existing_atom/1   |       |                |            |            |         |        |      |
| list_to_float/1           |       |                |            |            |         |        |      |
| list_to_integer/1         |       |                |            |            |         |        |      |
| list_to_integer/2         |       |                |            |            |         |        |      |
| list_to_pid/1             |       |                |            |            |         |        |      |
| list_to_port/1            |       |                |            |            |         |        |      |
| list_to_ref/1             |       |                |            |            |         |        |      |
| list_to_tuple/1           |       |                |            |            |         |        |      |
| make_ref/0                |       |                |            |            |         |        |      |
| make_tuple/2              |       |                |            |            |         |        |      |
| make_tuple/3              |       |                |            |            |         |        |      |
| map_get/2                 |       |                |            |            |         |        |      |
| map_size/1                |       |                |            |            |         |        |      |
| match_spec_test/3         |       |                |            |            |         |        |      |
| max/2                     |       |                |            |            |         |        |      |
| min/2                     |       |                |            |            |         |        |      |
| node/1                    |       |                |            |            |         |        |      |
| phash2/1                  |       |                |            |            |         |        |      |
| phash2/2                  |       |                |            |            |         |        |      |
| pid_to_list/1             |       |                |            |            |         |        |      |
| port_to_list/1            |       |                |            |            |         |        |      |
| ref_to_list/1             |       |                |            |            |         |        |      |
| round/1                   |       |                |            |            |         |        |      |
| setelement/3              |       |                |            |            |         |        |      |
| size/1                    |       |                |            |            |         |        |      |
| split_binary/2            |       |                |            |            |         |        |      |
| term_to_binary/1          |       |                |            |            |         |        |      |
| term_to_binary/2          |       |                |            |            |         |        |      |
| term_to_iovec/1           |       |                |            |            |         |        |      |
| term_to_iovec/2           |       |                |            |            |         |        |      |
| tl/1                      |       |                |            |            |         |        |      |
| trunc/1                   |       |                |            |            |         |        |      |
| tuple_size/1              |       |                |            |            |         |        |      |
| tuple_to_list/1           |       |                |            |            |         |        |      |
| unique_integer/0          |       |                |            |            |         |        |      |
| unique_integer/1          |       |                |            |            |         |        |      |

### Processes and ports

| Erlang                  | State | `Gleam` symbol | Canonical? | Repository | Package | Module | Link |
|-------------------------|-------|----------------|------------|------------|---------|--------|------|
| alias/0                 |       |                |            |            |         |        |      |
| alias/1                 |       |                |            |            |         |        |      |
| apply/2                 |       |                |            |            |         |        |      |
| apply/3                 |       |                |            |            |         |        |      |
| bump_reductions/1       |       |                |            |            |         |        |      |
| demonitor/1             |       |                |            |            |         |        |      |
| demonitor/2             |       |                |            |            |         |        |      |
| erase/0                 |       |                |            |            |         |        |      |
| erase/1                 |       |                |            |            |         |        |      |
| error/1                 |       |                |            |            |         |        |      |
| error/2                 |       |                |            |            |         |        |      |
| error/3                 |       |                |            |            |         |        |      |
| exit/1                  |       |                |            |            |         |        |      |
| exit/2                  |       |                |            |            |         |        |      |
| garbage_collect/0       |       |                |            |            |         |        |      |
| garbage_collect/1       |       |                |            |            |         |        |      |
| garbage_collect/2       |       |                |            |            |         |        |      |
| get/0                   |       |                |            |            |         |        |      |
| get/1                   |       |                |            |            |         |        |      |
| get_keys/0              |       |                |            |            |         |        |      |
| get_keys/1              |       |                |            |            |         |        |      |
| group_leader/0          |       |                |            |            |         |        |      |
| group_leader/2          |       |                |            |            |         |        |      |
| hibernate/3             |       |                |            |            |         |        |      |
| is_process_alive/1      |       |                |            |            |         |        |      |
| link/1                  |       |                |            |            |         |        |      |
| monitor/2               |       |                |            |            |         |        |      |
| monitor/3               |       |                |            |            |         |        |      |
| nif_error/1             |       |                |            |            |         |        |      |
| nif_error/2             |       |                |            |            |         |        |      |
| open_port/2             |       |                |            |            |         |        |      |
| port_call/3             |       |                |            |            |         |        |      |
| port_close/1            |       |                |            |            |         |        |      |
| port_command/2          |       |                |            |            |         |        |      |
| port_command/3          |       |                |            |            |         |        |      |
| port_connect/2          |       |                |            |            |         |        |      |
| port_control/3          |       |                |            |            |         |        |      |
| port_info/1             |       |                |            |            |         |        |      |
| port_info/2             |       |                |            |            |         |        |      |
| ports/0                 |       |                |            |            |         |        |      |
| process_display/2       |       |                |            |            |         |        |      |
| process_flag/2          |       |                |            |            |         |        |      |
| process_flag/3          |       |                |            |            |         |        |      |
| process_info/1          |       |                |            |            |         |        |      |
| process_info/2          |       |                |            |            |         |        |      |
| processes/0             |       |                |            |            |         |        |      |
| put/2                   |       |                |            |            |         |        |      |
| raise/3                 |       |                |            |            |         |        |      |
| register/2              |       |                |            |            |         |        |      |
| registered/0            |       |                |            |            |         |        |      |
| resume_process/1        |       |                |            |            |         |        |      |
| self/0                  |       |                |            |            |         |        |      |
| send/2                  |       |                |            |            |         |        |      |
| send/3                  |       |                |            |            |         |        |      |
| send_nosuspend/2        |       |                |            |            |         |        |      |
| send_nosuspend/3        |       |                |            |            |         |        |      |
| spawn/1                 |       |                |            |            |         |        |      |
| spawn/2                 |       |                |            |            |         |        |      |
| spawn/3                 |       |                |            |            |         |        |      |
| spawn/4                 |       |                |            |            |         |        |      |
| spawn_link/1            |       |                |            |            |         |        |      |
| spawn_link/2            |       |                |            |            |         |        |      |
| spawn_link/3            |       |                |            |            |         |        |      |
| spawn_link/4            |       |                |            |            |         |        |      |
| spawn_monitor/1         |       |                |            |            |         |        |      |
| spawn_monitor/2         |       |                |            |            |         |        |      |
| spawn_monitor/3         |       |                |            |            |         |        |      |
| spawn_monitor/4         |       |                |            |            |         |        |      |
| spawn_opt/2             |       |                |            |            |         |        |      |
| spawn_opt/3             |       |                |            |            |         |        |      |
| spawn_opt/4             |       |                |            |            |         |        |      |
| spawn_opt/5             |       |                |            |            |         |        |      |
| spawn_request/1         |       |                |            |            |         |        |      |
| spawn_request/2         |       |                |            |            |         |        |      |
| spawn_request/3         |       |                |            |            |         |        |      |
| spawn_request/4         |       |                |            |            |         |        |      |
| spawn_request/5         |       |                |            |            |         |        |      |
| spawn_request_abandon/1 |       |                |            |            |         |        |      |
| suspend_process/1       |       |                |            |            |         |        |      |
| suspend_process/2       |       |                |            |            |         |        |      |
| throw/1                 |       |                |            |            |         |        |      |
| unalias/1               |       |                |            |            |         |        |      |
| unlink/1                |       |                |            |            |         |        |      |
| unregister/1            |       |                |            |            |         |        |      |
| whereis/1               |       |                |            |            |         |        |      |
| yield/0                 |       |                |            |            |         |        |      |

### System

| Erlang           | State | `Gleam` symbol | Canonical? | Repository | Package | Module | Link |
|------------------|-------|----------------|------------|------------|---------|--------|------|
| halt/0           |       |                |            |            |         |        |      |
| halt/1           |       |                |            |            |         |        |      |
| halt/2           |       |                |            |            |         |        |      |
| memory/0         |       |                |            |            |         |        |      |
| memory/1         |       |                |            |            |         |        |      |
| statistics/1     |       |                |            |            |         |        |      |
| system_flag/2    |       |                |            |            |         |        |      |
| system_info/1    |       |                |            |            |         |        |      |
| system_monitor/0 |       |                |            |            |         |        |      |
| system_monitor/1 |       |                |            |            |         |        |      |
| system_monitor/2 |       |                |            |            |         |        |      |
| system_profile/0 |       |                |            |            |         |        |      |
| system_profile/2 |       |                |            |            |         |        |      |

### Time and timers

| Erlang                       | State | `Gleam` symbol | Canonical? | Repository | Package | Module | Link |
|------------------------------|-------|----------------|------------|------------|---------|--------|------|
| cancel_timer/1               |       |                |            |            |         |        |      |
| cancel_timer/2               |       |                |            |            |         |        |      |
| convert_time_unit/3          |       |                |            |            |         |        |      |
| date/0                       |       |                |            |            |         |        |      |
| localtime/0                  |       |                |            |            |         |        |      |
| localtime_to_universaltime/1 |       |                |            |            |         |        |      |
| localtime_to_universaltime/2 |       |                |            |            |         |        |      |
| monotonic_time/0             |       |                |            |            |         |        |      |
| monotonic_time/1             |       |                |            |            |         |        |      |
| read_timer/1                 |       |                |            |            |         |        |      |
| read_timer/2                 |       |                |            |            |         |        |      |
| send_after/3                 |       |                |            |            |         |        |      |
| send_after/4                 |       |                |            |            |         |        |      |
| start_timer/3                |       |                |            |            |         |        |      |
| start_timer/4                |       |                |            |            |         |        |      |
| system_time/0                |       |                |            |            |         |        |      |
| system_time/1                |       |                |            |            |         |        |      |
| time/0                       |       |                |            |            |         |        |      |
| time_offset/0                |       |                |            |            |         |        |      |
| time_offset/1                |       |                |            |            |         |        |      |
| timestamp/0                  |       |                |            |            |         |        |      |
| universaltime/0              |       |                |            |            |         |        |      |
| universaltime_to_localtime/1 |       |                |            |            |         |        |      |

### Tracing

| Erlang            | State | `Gleam` symbol | Canonical? | Repository | Package | Module | Link |
|-------------------|-------|----------------|------------|------------|---------|--------|------|
| trace/3           |       |                |            |            |         |        |      |
| trace_delivered/1 |       |                |            |            |         |        |      |
| trace_info/2      |       |                |            |            |         |        |      |
| trace_pattern/2   |       |                |            |            |         |        |      |
| trace_pattern/3   |       |                |            |            |         |        |      |

### Deprecated

| Erlang  | State | `Gleam` symbol | Canonical? | Repository | Package | Module | Link |
|---------|-------|----------------|------------|------------|---------|--------|------|
| now/0   |       |                |            |            |         |        |      |
| phash/2 |       |                |            |            |         |        |      |
