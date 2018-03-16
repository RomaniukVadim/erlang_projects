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
    TeamStat = lists:map(fun get_team_stat/1, Champ),
    {TotalPlayers,TotalAge,TotalRating} =
	lists:foldl(fun({TeamPlayers,TeamAge,TeamRating},{P,A,R}) ->
			 {P+TeamPlayers,A+TeamAge,R+TeamRating}   
		    end,{0,0,0},TeamStat),
    {length(Champ), TotalPlayers, TotalAge/TotalPlayers,TotalRating/TotalPlayers}.

get_team_stat({team,_,Players}) ->
    {TeamAge,TeamRating} =
	lists:foldl(fun({player,_,Age,Rating,_},{TotalAge,TotalRating}) ->
			    {Age+TotalAge,Rating+TotalRating}
		    end,{0,0},Players),
    {length(Players),TeamAge,TeamRating}.
    %% END


get_stat_test() ->
    ?assertEqual({5,40,24.85,242.8}, get_stat(champ:sample_champ())),
    ok.
