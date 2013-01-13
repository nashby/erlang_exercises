-module(llists).

-export([
          filter/2,
          reverse/1,
          concatenate/1,
          quicksort/1
        ]).

% filter/2
filter([], _) -> [];
filter([Head | NewList], Num) when Head =< Num ->
  [Head | filter(NewList, Num)];
filter([Head | _], Num) when Head > Num -> [].

% reverse/1
reverse(List) -> reverse(List, []).

% reverse/2
reverse([Head | Tail], Result) -> reverse(Tail, [Head | Result]);
reverse([], Result) -> Result.

% concatenate/1
concatenate(List) -> concatenate(List, []).

% concatenate/2
concatenate([], Result) -> Result;
concatenate([Head | Tail], Result) -> Head ++ concatenate(Tail, Result).

% quicksort/1
quicksort([]) -> [];
quicksort([Pivot | Tail]) ->
  quicksort([Less || Less <- Tail, Less =< Pivot]) ++ [Pivot] ++ quicksort([Greater || Greater <- Tail, Greater > Pivot]).
