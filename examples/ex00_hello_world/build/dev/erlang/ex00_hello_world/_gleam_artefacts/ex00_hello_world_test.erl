-module(ex00_hello_world_test).
-compile([no_auto_import, nowarn_unused_vars, nowarn_unused_function, nowarn_nomatch, inline]).
-define(FILEPATH, "test\\ex00_hello_world_test.gleam").
-export([main/0, add_test/0]).

-file("test\\ex00_hello_world_test.gleam", 4).
-spec main() -> nil.
main() ->
    gleeunit:main().

-file("test\\ex00_hello_world_test.gleam", 9).
-spec add_test() -> nil.
add_test() ->
    A = 2,
    B = 3,
    Result = ex00_hello_world:add(A, B),
    _assert_subject = 5,
    case Result =:= _assert_subject of
        true -> nil;
        false -> erlang:error(#{gleam_error => assert,
                message => <<"Assertion failed."/utf8>>,
                file => <<?FILEPATH/utf8>>,
                module => <<"ex00_hello_world_test"/utf8>>,
                function => <<"add_test"/utf8>>,
                line => 13,
                kind => binary_operator,
                operator => '==',
                left => #{kind => expression,
                    value => Result,
                    start => 222,
                    'end' => 228
                    },
                right => #{kind => literal,
                    value => _assert_subject,
                    start => 232,
                    'end' => 233
                    },
                start => 215,
                'end' => 233,
                expression_start => 222})
    end.
