-module(gs4).

-export([start/0, add_item/2, remove_item/2, show_items/1, stop/1, loop/1]).


start() ->
    InitialState = [],
    spawn(?MODULE, loop, [InitialState]).


add_item(Pid, Item) ->
    Pid ! {add, self(), Item},
    receive
	{reply, Reply} -> Reply
    end.


remove_item(Pid, Item) ->
    Pid ! {remove, self(), Item},
    receive
	{reply, Reply} -> Reply
    end.


show_items(Pid) ->
    Pid ! {show_items, self()},
    receive
	{reply, Reply} -> Reply
    end.


stop(Pid) ->
    Pid ! stop,
    ok.


loop(State) ->
    receive
	{add, From, Item} ->
	    NewState = [Item | State],
	    From ! {reply, ok},
	    ?MODULE:loop(NewState);
	{remove, From, Item} ->
	    {Reply, NewState} = case lists:member(Item, State) of
				    true -> {ok, lists:delete(Item, State)};
				    false -> {{error, not_exist}, State}
				end,
	    From ! {reply, Reply},
	    ?MODULE:loop(NewState);
	{show_items, From} ->
	    From ! {reply, State},
	    ?MODULE:loop(State);
	stop -> ok;
	_Any -> ?MODULE:loop(State)
    end.

%% Это хорошо, что наш сервер умеет хранить состояние и менять его в зависимости от запросов клиентов.
%% Но было бы неплохо, чтобы сервер умел что-нибудь отвечать клиенту.

%% Для этого клиент должен передать свой Pid внутри сообщения. А сервер должен послать ответ на этот Pid.

%% Но мы не хотим делать взаимодействие с сервером слишком сложным для клиента,
%% поэтому спрячем отправку сообщений и получения ответов внутри функций.
