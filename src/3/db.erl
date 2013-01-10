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
read(Key, Db) ->
  [_ | NewDb] = Db,
  read(Key, NewDb).

% write/3
write(Key, Value, Db) ->
  [{Key, Value} | Db].

% match/2
match(_, []) -> [];
match(Value, [{Key, Value} | _] = Db) ->
  [_ | NewDb] = Db,
  [Key | match(Value, NewDb)];
match(Value, Db) ->
  [_ | NewDb] = Db,
  match(Value, NewDb).

% delete/2
delete(_, []) -> false;
delete(Key, [{Key, _} | _] = Db) ->
  [_ | NewDb] = Db,
  NewDb;
delete(Key, Db) ->
  [_ | NewDb] = Db,
  delete(Key, NewDb).

