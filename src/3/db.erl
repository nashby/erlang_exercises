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
read(Key, Db) ->
  case Db of
    [] -> false;
    [{Key, Value} | _] ->
      Value;
    _Else ->
      [_ | NewDb] = Db,
      read(Key, NewDb)
  end.

% write/3
write(Key, Value, Db) ->
  [{Key, Value} | Db].

% match/2
match(Value, Db) ->
  case Db of
    [] -> [];
    [{Key, Value} | _] ->
      [_ | NewDb] = Db,
      [Key | match(Value, NewDb)];
    _Else ->
      [_ | NewDb] = Db,
      match(Value, NewDb)
  end.

% delete/2
delete(Key, Db) ->
  case Db of
    [] -> false;
    [{Key, _} | _] ->
      [_ | NewDb] = Db,
      NewDb;
    _Else ->
      [_ | NewDb] = Db,
      delete(Key, NewDb)
  end.

