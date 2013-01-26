-module(echo).
-export([start/0, print/1, stop/0, loop/0]).

start() ->
  register(echo, spawn(echo, loop, [])).

loop() ->
  receive
    {user, Term} ->
      io:format("~w~n", [Term]),
      loop();
    {internal, stop} ->
      true
  end.

print(Term) ->
  echo ! {user, Term}.

stop() ->
  echo ! {internal, stop}.
