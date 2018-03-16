-module(champ_filter).

-export([filter_sick_players/1]).
-include_lib("eunit/include/eunit.hrl").
%%
%% К несчастью, незадолго до чемпионата началась эпидемия крокодильего гриппа.
%% Многие игроки серьезно заболели.
%% Их здоровье (Health) стало меньше 50 единиц.
%% Таких игроков нужно удалить из команд.
%%
%% В результате может оказаться, что в команде осталось слишком мало игроков.
%% Команды, где число игроков меньше 5, не допускаются к участию в чемпионате.
%%
%% Реализовать функцию champ_filter:filter_sick_players/1,
%% которая на вход принимает структуру данных, описывающую чемпионат,
%% и на выходе отдает такую же структуру, но отфильтрованную согласно описанным правилам.
%%

filter_sick_players(Champ) ->
    %% BEGIN (write your solution here)
    HealthTeam = lists:map(fun team_filter/1, Champ),
	lists:filter(fun({team,_,Players}) -> length(Players) >= 5 end,HealthTeam).
team_filter({team,Name,Players}) ->
    HealthPlayers = lists:filter(fun({player, _,_,_,Health}) -> Health >= 50
			      end,Players),
	{team,Name,HealthPlayers}.
    %% END


filter_sick_players_test() ->
    Result = [{team, "Crazy Bulls",
               [{player, "Big Bull",        22, 545, 99},
                {player, "Small Bull",      18, 324, 95},
                {player, "Bill The Bull",   23, 132, 85},
                {player, "Tall Ball Bull",  38,  50, 50},
                {player, "Bull Dog",        35, 201, 91},
                {player, "Bull Tool",       29,  77, 96},
                {player, "Mighty Bull",     22, 145, 98}
               ]},
              {team, "Fast Cows",
               [{player, "Cow Bow",         28,  89, 90},
                {player, "Boom! Cow",       20, 131, 99},
                {player, "Light Speed Cow", 21, 201, 98},
                {player, "Big Horn",        23,  38, 93},
                {player, "Milky",           25,  92, 95},
                {player, "Jumping Cow",     19, 400, 98}
               ]},
              {team, "Extinct Mosters",
               [{player, "T-Rex",           21, 999, 99},
                {player, "Velociraptor",    29, 656, 99},
                {player, "Giant Mammoth",   30, 382, 99},
                {player, "The Big Croc",    42, 632, 99},
                {player, "Huge Pig",        18, 125, 98},
                {player, "Saber-Tooth",     19, 767, 97},
                {player, "Beer Bear",       24, 241, 99}
               ]}
             ],
    ?assertEqual(Result, filter_sick_players(champ:sample_champ())),
    ok.
