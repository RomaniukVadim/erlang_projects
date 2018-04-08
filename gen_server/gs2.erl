-module(gs2).

-export([start/0, loop/1]).

start() ->
    InitialState = [],
    spawn(?MODULE, loop, [InitialState]).

loop(State) ->
    receive
	{add, Item} -> io:format("~p adds ~p to its state~n", [self(), Item]),
		       NewState = [Item | State],
		       loop(NewState);
	{remove, Item} -> NewState = case lists:member(Item, State) of
					 true -> lists:delete(Item, State);
					 false -> io:format("I have no ~p~n", [Item]),
						  State
				     end,
			  loop(NewState);
	show_items -> io:format("my items is ~p~n", [State]),
		      loop(State);
	stop -> io:format("~p stops now ~n", [self()]);
	_Any -> loop(State)
    end.

%% Теперь функция loop получает аргумент. Это состояние потока.
%% После spawn он имеет некое начальное состояние. В данном случае это массив.
%% Но это может быть любая структура данных.

%% Затем поток может модифицировать эту структуру, и в последующие вызовы loop передавать новое состояние.
%% Таким образом, не имея изменяемых переменных, мы все-таки имеем изменяемое состояние потока в его стеке.

%% Тут мы усложнили форматы сообщений, которые умеет обрабатывать поток.
%% И сформировали некое АПИ: добавление и удаление элементов и вывод их на консоль.
