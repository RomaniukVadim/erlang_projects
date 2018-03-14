-module(champ_stat).

-export([get_stat/1]).
-include_lib("eunit/include/eunit.hrl").
%%
%% Нужно реализовать функцию champ_stat:get_stat/1,
%% которая на вход принимает структуру данных, описывающую
%% чемпионат и на выходе отдает кортеж:
%%
%% {NumTeams, NumPlayers, AvgAge, AvgRating}
%% где
%%
%% NumTeams -- число команд в чемпионате;
%% NumPlayers -- число игроков в чемпионате;
%% AvgAge -- средний возраст игрока;
%% AvgRating -- средний рейтинг игрока.
%% Например, для указанной выше структуры результат должен быть:
%%
%% {2, 4, 21.0, 348.25}
%%

get_stat(Champ) ->
    %% BEGIN (write your solution here)
    F = fun({team,_,Players},{NumTeams, NumPlayers, AvgAge, AvgRating}) ->
		Players = 
	end,
    lists:foldl(F, {0, 0, 0, 0}, Champ).

			
    %% END


get_stat_test() ->
    ?assertEqual({5,40,24.85,242.8}, get_stat(champ:sample_champ())),
    ok.
