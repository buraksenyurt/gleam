-module(ex01_flow_controls).
-compile([no_auto_import, nowarn_unused_vars, nowarn_unused_function, nowarn_nomatch, inline]).
-define(FILEPATH, "src\\ex01_flow_controls.gleam").
-export([main/0]).

-file("src\\ex01_flow_controls.gleam", 12).
-spec main() -> nil.
main() ->
    Last_exam_score = gleam@int:random(101),
    gleam_stdlib:println(
        <<"Your last exam score was: "/utf8,
            (erlang:integer_to_binary(Last_exam_score))/binary>>
    ),
    case Last_exam_score of
        Score when Score < 50 ->
            gleam_stdlib:println(<<"You failed the exam."/utf8>>);

        Score@1 when Score@1 < 60 ->
            gleam_stdlib:println(<<"You passed the exam."/utf8>>);

        Score@2 when Score@2 < 80 ->
            gleam_stdlib:println(<<"You did well on the exam."/utf8>>);

        _ ->
            gleam_stdlib:println(<<"You aced the exam!"/utf8>>)
    end,
    Result = case Last_exam_score of
        S when S < 50 ->
            <<"You failed the exam."/utf8>>;

        S@1 when S@1 < 60 ->
            <<"You passed the exam."/utf8>>;

        S@2 when S@2 < 80 ->
            <<"You did well on the exam."/utf8>>;

        _ ->
            <<"You aced the exam!"/utf8>>
    end,
    gleam_stdlib:println(Result),
    nil.
