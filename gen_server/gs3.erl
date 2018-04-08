-module(gs3).

-export([start/0, loop/1]).

start() ->
    InitialState = [],
    spawn(?MODULE, loop, [InitialState]).

loop(State) ->
        receive
            {add, Item} -> io:format("~p adds ~p to its state~n", [self(), Item]),
                           NewState = [Item | State],
                           ?MODULE:loop(NewState);
            {remove, Item} -> NewState = case lists:member(Item, State) of
                                             true -> lists:delete(Item, State);
                                             false -> io:format("I have no ~p~n", [Item]),
                                                      State
                                         end,
                              ?MODULE:loop(NewState);
            show_items -> io:format("my items is ~p~n", [State]),
                          ?MODULE:loop(State);
            stop -> io:format("~p stops now ~n", [self()]);
            _Any -> ?MODULE:loop(State)
        end.


%% Здесь мы заменили вызовы loop(State) на ?MODULE:loop(State).
%% Тем самым мы заменили локальный вызов функции (только по ее имени), на глобальный вызов (по имени модуля и функции).
%% Для глобального вызова действует горячее обновление кода. Как это работает?

%% Нода может держать в памяти 2 версии модуля.
%% Допустим, при создании потока и вызове loop, он начал выполнять версию 1 и прошел несколько итераций рекурсии.
%% Тем временем, мы изменили код, скомпилировали, и загрузили в ноду версию 2.
%% Пока текущая итерация не завершена, поток все еще выполняет версию 1. Но следующий вызов loop уже попадет в версию 2.

%% На следующих этапах мы уже не будем останавливать поток, а будем пользоваться горячим обновлением кода.

