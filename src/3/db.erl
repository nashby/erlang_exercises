-module(db).

-export([
          new/0,
          destroy/1,
          read/2,
          write/3,
          match/2,
          delete/2
        ]).

% new/0
new() -> [].

% destroy/1
destroy(_) -> ok.

% read/2
read(_, []) -> false;
read(Key, [{Key, Value} | _]) -> Value;
read(Key, [_ | NewDb]) ->
  read(Key, NewDb).

% write/3
write(Key, Value, Db) ->
  [{Key, Value} | Db].

% match/2
match(_, []) -> [];
match(Value, [{Key, Value} | NewDb]) ->
  [Key | match(Value, NewDb)];
match(Value, [_ | NewDb]) ->
  match(Value, NewDb).

% delete/2
delete(_, []) -> false;
delete(Key, [{Key, _} | NewDb]) ->
  NewDb;
delete(Key, [_ | NewDb]) ->
  delete(Key, NewDb).

