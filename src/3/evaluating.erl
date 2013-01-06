-module(evaluating).

-export([sum/1,
         sum/2,
         create/1,
         reverse_create/1,
         print_integers/1,
         print_even_integers/1]).

% sum/1
sum(0) -> 0;
sum(N) -> N + sum(N - 1).

% sum/2
sum(N, M) when N == M -> N;
sum(N, M) when N < M -> sum(M - 1) + sum(N + 1).

% create/1
create(N) -> create_acc(N, []).

create_acc(1, Acc) -> [1 | Acc];
create_acc(N, Acc) -> create_acc(N - 1, [N | Acc]).

% reverse_create/1
reverse_create(1) -> [1];
reverse_create(N) -> [N | reverse_create(N - 1)].

% print_integers/1
print_integers(1) -> lists:flatten(io_lib:format("Number: ~B", [1]));
print_integers(N) -> lists:flatten(io_lib:format("Number: ~B~n~s", [N, print_integers(N - 1)])).

% print_even_integers/1
print_even_integers(2) -> lists:flatten(io_lib:format("Number: ~B", [2]));
print_even_integers(N) when N rem 2 == 0 -> lists:flatten(io_lib:format("Number: ~B~n~s", [N, print_even_integers(N - 1)]));
print_even_integers(N) -> print_even_integers(N-1).
