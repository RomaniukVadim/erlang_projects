-module(tic_tac_toe).

-export([new_game/0, win/1, move/3]).


new_game() ->
    {{f, f, f},
     {f, f, f},
     {f, f, f}}.


%% 2> G1 = {{f,f,f},{f,x,f},{o,f,f}}.
%% {{f,f,f},{f,x,f},{o,f,f}}
%% 3> tic_tac_toe:win(G1).
%% no_win
%% 4> G2 = {{f,f,o},{x,x,x},{o,o,f}}.
%% {{f,f,o},{x,x,x},{o,o,f}}
%% 5> tic_tac_toe:win(G2).
%% {win,x}
%% 6> G3 = {{f,f,o},{x,x,o},{x,o,o}}.
%% {{f,f,o},{x,x,o},{x,o,o}}
%% 7> tic_tac_toe:win(G3).
%% {win,o}

win(GameState) ->
    %% BEGIN (write your solution here)
    
    %% END



%% Ячейки нумеруются так:
%%
%% {{1,2,3},
%% {4,5,6},
%% {7,8,9}}
%% Например, в начальной позиции, когда все ячейки свободны, игрок ставит крестик в первую ячейку:
%%
%% 2> G = tic_tac_toe:new_game().
%% {{f,f,f},{f,f,f},{f,f,f}}
%% 3> tic_tac_toe:move(1, x, G).
%% {ok,{{x,f,f},{f,f,f},{f,f,f}}}
%% Функция возвращает кортеж {ok, NewGameState}, где крестик стоит в первой ячейке.
%%
%% А если игрок пытается поставить крестик в ячейку, которая уже занята, то функция возвращает {error, invalid_move}:
%%
%% 2> G1 = {{f,f,f},{f,x,f},{o,f,f}}.
%% {{f,f,f},{f,x,f},{o,f,f}}
%% 3> tic_tac_toe:move(5, o, G1).
%% {error,invalid_move}
%% Пример полного сеанса игры:
%%
%% 2> G = tic_tac_toe:new_game().
%% {{f,f,f},{f,f,f},{f,f,f}}
%% 3> tic_tac_toe:move(1, x, G).
%% {ok,{{x,f,f},{f,f,f},{f,f,f}}}
%% 4> {ok, G2} = tic_tac_toe:move(1, x, G).
%% {ok,{{x,f,f},{f,f,f},{f,f,f}}}
%% 5> {ok, G3} = tic_tac_toe:move(2, o, G2).
%% {ok,{{x,o,f},{f,f,f},{f,f,f}}}
%% 6> {ok, G4} = tic_tac_toe:move(4, x, G3).
%% {ok,{{x,o,f},{x,f,f},{f,f,f}}}
%% 7> {ok, G5} = tic_tac_toe:move(7, x, G4).
%%{ok,{{x,o,f},{x,f,f},{x,f,f}}}
%% 8> tic_tac_toe:win(G5).
%% {win,x}

    
move(Cell, Player, GameState) ->
    %% BEGIN (write your solution here)
    
    %% END
