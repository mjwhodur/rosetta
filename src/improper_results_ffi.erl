-module(improper_results_ffi).
-export([convert_improper_result/1]).

convert_improper_result(improper_result) ->
    case is_atom(improper_result) of
        true -> {ok, nil};
        false -> improper_result
    end.
