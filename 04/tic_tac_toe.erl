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
    case GameState of
	{{x,x,x},{_,_,_},{_,_,_}} -> {win,x};
	{{_,_,_},{x,x,x},{_,_,_}} -> {win,x};
	{{_,_,_},{_,_,_},{x,x,x}} -> {win,x};
	{{x,_,_},{x,_,_},{x,_,_}} -> {win,x};
	{{_,x,_},{_,x,_},{_,x,_}} -> {win,x};
	{{_,_,x},{_,_,x},{_,_,x}} -> {win,x};
	{{x,_,_},{_,x,_},{_,_,x}} -> {win,x};
	{{_,_,x},{_,x,_},{x,_,_}} -> {win,x};

	{{o,o,o},{_,_,_},{_,_,_}} -> {win,o};
	{{_,_,_},{o,o,o},{_,_,_}} -> {win,o};
	{{_,_,_},{_,_,_},{o,o,o}} -> {win,o};
	{{o,_,_},{o,_,_},{o,_,_}} -> {win,o};
	{{_,o,_},{_,o,_},{_,o,_}} -> {win,o};
	{{_,_,o},{_,_,o},{_,_,o}} -> {win,o};
	{{o,_,_},{_,o,_},{_,_,o}} -> {win,o};
	{{_,_,o},{_,o,_},{o,_,_}} -> {win,o};
  
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
    case GameState of

	{{A,B,C},Second,Third} when Cell =:= 1 andalso A == f->
	    {ok, {{Player,B,C},Second,Third}};
	{{A,B,C},Second,Third} when Cell =:= 2 andalso B == f->
	    {ok, {{A,Player,C},Second,Third}};
	{{A,B,C},Second,Third} when Cell =:= 3 andalso C == f->
	    {ok, {{A,B,Player},Second,Third}};


	{First,{A,B,C},Third} when Cell =:= 4 andalso A == f->
	    {ok, {First,{Player,B,C},Third}};
	{First,{A,B,C},Third} when Cell =:= 5 andalso B == f->
	    {ok, {First,{A,Player,C},Third}};
	{First,{A,B,C},Third} when Cell =:= 6 andalso C == f->
	    {ok, {First,{A,B,Player},Third}};

	
	{First,Second,{A,B,C}} when Cell =:= 7 andalso A == f->
	    {ok, {First,Second,{Player,B,C}}};
	{First,Second,{A,B,C}} when Cell =:= 8 andalso B == f->
	    {ok, {First,Second,{A,Player,C}}};
	{First,Second,{A,B,C}} when Cell =:= 9 andalso C == f->
	    {ok, {First,Second,{A,B,Player}}};

	_ ->
	    {error,invalid_move}
    end.
    
    %% END
