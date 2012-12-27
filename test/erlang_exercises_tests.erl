-module(erlang_exercises_tests).

-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").
-endif.

boolean_b_not_test() ->
  true = boolean:b_not(false).

boolean_b_and_test() ->
  true = boolean:b_and(true, true).

boolean_b_or_test() ->
  true = boolean:b_or(false, true).
