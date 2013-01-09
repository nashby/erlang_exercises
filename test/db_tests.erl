-module(db_tests).

-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").
-endif.

db_new_test() ->
  ?assert(db:new() == []).

db_destroy_test() ->
  Db = db:new(),
  ?assert(db:destroy(Db) == ok).

db_read_test() ->
  Db = db:new(),
  Db1 = db:write(erlang, awesome, Db),
  Db2 = db:write(wat, derp, Db1),
  Value = db:read(erlang, Db2),
  ?assert(Value == awesome).

db_write_test() ->
  Db = db:new(),
  Db1 = db:write(erlang, awesome, Db),
  Db2 = db:write(wat, derp, Db1),
  ?assert(Db1 == [{erlang, awesome}]),
  ?assert(Db2 == [{wat, derp}, {erlang, awesome}]).

db_match_test() ->
  Db = db:new(),
  Db1 = db:write(erlang, awesome, Db),
  Db2 = db:write(wat, awesome, Db1),
  Db3 = db:write(omg, not_awesome, Db2),
  Matched = db:match(awesome, Db2),
  ?assert(Matched == [wat, erlang]).

db_delete_test() ->
  Db = db:new(),
  Db1 = db:write(erlang, awesome, Db),
  Db2 = db:write(wat, derp, Db1),
  ?assert(Db2 == [{wat, derp}, {erlang, awesome}]),

  Db3 = db:delete(wat, Db2),
  ?assert(Db3 == [{erlang, awesome}]).
