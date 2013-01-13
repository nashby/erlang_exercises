-module(llists_tests).

-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").
-endif.

llists_filter_test() ->
  ?assert(llists:filter([1, 2, 3, 4, 5], 3) == [1, 2, 3]).

llists_reverse_test() ->
  ?assert(llists:reverse([1, 2, 3, 4, 5]) == [5, 4, 3, 2, 1]).

llists_concatenate_test() ->
  ?assert(llists:concatenate([[1, 2, 3], [], [4, five]]) == [1, 2, 3, 4, five]).

llists_quicksort_test() ->
  ?assert(llists:quicksort([3, 7, 8, 5, 2, 1, 9, 5, 4]) == [1, 2, 3, 4, 5, 5, 7, 8, 9]).
