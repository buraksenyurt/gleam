-module(ex00_hello_world).
-compile([no_auto_import, nowarn_unused_vars, nowarn_unused_function, nowarn_nomatch, inline]).
-define(FILEPATH, "src\\ex00_hello_world.gleam").
-export([add/2, main/0]).

-if(?OTP_RELEASE >= 27).
-define(MODULEDOC(Str), -moduledoc(Str)).
-define(DOC(Str), -doc(Str)).
-else.
-define(MODULEDOC(Str), -compile([])).
-define(DOC(Str), -compile([])).
-endif.

-file("src\\ex00_hello_world.gleam", 24).
?DOC(
    " Adds two integers and returns the result.\n"
    " # Parameters\n"
    " - `a`: The first integer.\n"
    " - `b`: The second integer.\n"
    " # Returns\n"
    " The sum of `a` and `b`.\n"
    " # Examples\n"
    " ```gleam\n"
    " let result = add(2, 3)\n"
    " // result is 5\n"
    " ```\n"
).
-spec add(integer(), integer()) -> integer().
add(A, B) ->
    A + B.

-file("src\\ex00_hello_world.gleam", 6).
-spec main() -> nil.
main() ->
    Sum = add(2, 3),
    gleam_stdlib:println(<<"The sum of 2 and 3 is;"/utf8>>),
    gleam_stdlib:println(erlang:integer_to_binary(Sum)),
    nil.
