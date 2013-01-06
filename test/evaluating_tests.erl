-module(evaluating_tests).

-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").
-endif.

evaluating_sum_1_test() ->
  ?assert(evaluating:sum(5) =:= 15).

evaluating_sum_2_test() ->
  ?assert(evaluating:sum(1, 3) =:= 6),
  ?assert(evaluating:sum(6, 6) =:= 6),
  ?assertError(undef, valuating:sum(3, 1)).

evaluating_create_test() ->
  ?assert(evaluating:create(3) =:= [1, 2, 3]).

evaluating_reverse_create_test() ->
  ?assert(evaluating:reverse_create(3) =:= [3, 2, 1]).

evaluating_print_integers_test() ->
  ?assert(evaluating:print_integers(3) == "Number: 3\nNumber: 2\nNumber: 1").

evaluating_print_even_integers_test() ->
  ?assert(evaluating:print_even_integers(10) == "Number: 10\nNumber: 8\nNumber: 6\nNumber: 4\nNumber: 2").
