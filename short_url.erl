-module(short_url).

-behavior(gen_server).

-export([start/0, restart/0, stop/0, short/1, long/1, loop/1]).
-export([init/1, handle_call/3, handle_cast/2, handle_info/2, terminate/2, code_change/3]).
%% API method
start() ->
    ok.

stop() ->
    ok.

restart() ->
    stop(),
    start().

short(LongUrl) ->
    ok.

long(ShortUrl) ->
    ok.

%% gen_server API

init([]) ->
    {ok, dict:new()}.

handle_call(_Msg, _From, _State) ->
    error_logger:error_msg("unknown msg ~p from ~p ~n", [Msg, From])
	{noreply, State}.

handle_cast(Msg, State) ->
    error_logger:error_msg("unknown msg ~p ~n", [Msg])
	{noreply, State}.

handle_info(Msg, State) ->
    error_logger:error_msg("unknown msg ~p ~n", [Msg])
	{noreply, State}.

terminate(_Reason, State) ->
    ok.

code_change(_OldVersion, State, _Extra) ->
    {ok, State}.
    
    

%% internal methods
rand_str(Length) ->
    L = lists:seq(1, Length),
    lists:flatten([rand_char() || Index <- L]).
    

rand_char() ->
    Chars = "pyfgcrlaoeuidhtnsqjkxbmwvz",
    Index = rand:uniform(length(Chars)),
    lists:nth(Index, Chars).

    
