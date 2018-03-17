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
    case GameStame of
	{Top,Center,Bottom} when Top =:= {x,x,x};
				 Center =:= {x,x,x};
				 Bottom =:= {x,x,x};
				 {x,_,_} =:= Top, {x,_,_} =:= Center,{x,_,_} =:= Bottom;
				 {_,x,_} =:= Top ,{_,x,_} =:= Center,{_,x,_} =:= Bottom;
				 {_,_,x} =:= Top ,{_,_,x} =:= Center,{_,_,x} =:= Bottom;
				 {x,_,_} =:= Top ,{_,x,_} =:= Center,{_,_,x} =:= Bottom;
				 {_,_,x} =:= Top ,{_,x,_} =:= Center,{x,_,_} =:= Bottom ->
	    {win,x};
	{Top,Center,Bottom} when Top =:= {o,o,o};
				 Center =:= {o,o,o};
				 Bottom =:= {o,o,o};
				 {o,_,_} =:= Top ,{o,_,_} =:= Center,{o,_,_} =:= Bottom;
				 {_,o,_} =:= Top ,{_,o,_} =:= Center,{_,o,_} =:= Bottom;
				 {_,_,o} =:= Top ,{_,_,o} =:= Center,{_,_,o} =:= Bottom;
				 {o,_,_} =:= Top ,{_,o,_} =:= Center,{_,_,o} =:= Bottom;
				 {_,_,o} =:= Top ,{_,o,_} =:= Center,{o,_,_} =:= Bottom ->
	    {win,o};
	
	_-> no_win
    end.

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
    ok.
    %% END
