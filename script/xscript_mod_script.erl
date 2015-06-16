%% autogen from "xscript_compile"
-module(xscript_mod_script).
-compile(export_all).
-include("xscript.hrl").

script_execute(ScriptId) ->
    script_execute(ScriptId, 0, []).
script_execute(ScriptId, Args) ->
    script_execute(ScriptId, 0, Args).

%%erlang
script_execute(7, 0, []) ->
    {ok,T} = xscript_function_define:find_target(200,{300,200}),
    [Hp,Mp] = xscript_function_define:get_attr([hp,mp]),
    lists:max([Hp,Mp]);
script_execute(ScriptId, FunId, Args) ->
    ?LOG_DEBUG("Not Defined ScriptId: ~w, FunId:~w, Args:~w", [ScriptId, FunId, Args]).

script_loop(CondFun, LoopFun) ->
    case CondFun() of
        true ->
            LoopFun(),
            script_loop(CondFun, LoopFun);
        false ->
            ok
    end.
