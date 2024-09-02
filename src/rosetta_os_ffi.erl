-module(rosetta_os_ffi).
-export([version/0]).

%%% FFI Module for OS module in Erlang
version() ->
    case os:version() of
        {Major, Minor, Release} when is_integer(Major), is_integer(Minor), is_integer(Release) ->
            {Major, Minor, Release, "ok"};
        String when is_list(String) ->
            {0,0,0, String}
    end.
