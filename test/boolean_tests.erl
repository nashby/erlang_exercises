-module(boolean_tests).

-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").
-endif.

boolean_b_not_test() ->
  ?assert(boolean:b_not(false) =:= true).

boolean_b_and_test() ->
  ?assert(boolean:b_and(true, true) =:= true).

boolean_b_or_test() ->
  ?assert(boolean:b_or(false, true) =:= true).
