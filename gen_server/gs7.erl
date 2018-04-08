-module(gs7).

-export([start/0, add_item/2, remove_item/2, show_items/1, stop/1, loop/1]).


start() ->
    InitialState = [],
    spawn(?MODULE, loop, [InitialState]).


add_item(Pid, Item) ->
    call(Pid, {add, Item}).


remove_item(Pid, Item) ->
    call(Pid, {remove, Item}).


show_items(Pid) ->
    call(Pid, show_items).

 call(Pid, Msg) ->
    Ref = make_ref(),
    Pid ! {Msg, self(), Ref},
    receive
	{reply, Ref, Reply} -> Reply
    after 5000 -> no_reply
    end.


stop(Pid) ->
    Pid ! stop,
    ok.


loop(State) ->
    receive
        {{add, Item}, From, Ref} ->
            NewState = [Item | State],
            From ! {reply, Ref, ok},
            ?MODULE:loop(NewState);
        {{remove, Item}, From, Ref} ->
            {Reply, NewState} = case lists:member(Item, State) of
                                    true -> {ok, lists:delete(Item, State)};
                                    false -> {{error, not_exist}, State}
                                end,
            From ! {reply, Ref, Reply},
            ?MODULE:loop(NewState);
        {show_items, From, Ref} ->
            From ! {reply, Ref, State},
            ?MODULE:loop(State);
        stop -> ok;
        _Any -> ?MODULE:loop(State)
    end.

%% Мы блокируем поток клиента, и это не всегда хорошо.
%% Правильно будет позволить клиенту задать timeout, как долго он готов ожидать ответ сервера.

%% timeout можно вынести в аргументы, и предоставить каждую АПИ-функцию в двух вариантах, с явным указанием timeout и без указания.
%% В настоящем gen_server так и сделано.
%% Но мы сейчас не будем сильно усложнять код, а просто добавим timeout в функцию call.
