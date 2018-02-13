-module(short_url).

-export([start/0, restart/0, stop/0, short/1, long/1, loop/1]).
%%-export([rand_char/0, rand_str/1]).

%% API method
start() ->
    io:format("Function Start called~n"),
    Pid = spawn(fun() -> loop(dict:new()) end),
    register(short_url_server, Pid),
    ok.

stop() ->
    io:format("stop called~n"),
    short_url_server ! stop,
    ok.

restart() ->
    stop(),
    start().
short(LongUrl) ->
    io:format("short for ~p called ~n", [LongUrl]),
    Uniq = make_ref(),
    short_url_server ! {short, LongUrl, self(), Uniq},
    receive
	{Uniq, Ans} -> Ans
    end.

long(ShortUrl) ->
    io:format("long for ~p called ~n",[ShortUrl]),
    Uniq = make_ref(),
    short_url_server ! {long, ShortUrl, self(), Uniq},
    receive
	{Uniq, Ans} -> Ans
    end.

%% main loop
loop(State) ->
    io:format("~p wait for messages~n", [self()]),
    receive
	{short, LongUrl, From, Uniq} ->
	    {Res, NewState} = case dict:is_key(LongUrl, State) of
		true -> {dict:fetch(LongUrl, State), State};
		false -> ShortUrl =  "http://short.by/" ++ rand_str(7),
			 {ShortUrl, dict:store(LongUrl, ShortUrl, State)}
		     end,
	    From ! {Uniq, Res},
	    loop(NewState);
	{long, ShortUrl, From, Uniq} -> %% do something
	    FDict = dict:filter(fun(_Key, Value) -> Value =:= ShortUrl end, State),
	    Flist = dict:to_list(FDict),
	    Res =case Flist of
		     [] -> "";
		     [{Ans, _}] -> Ans;
		     Any -> io:format("matching error ~p~n", [Any])
		 end,
	    From ! {Uniq, Res},
	    loop(State);
	stop -> ok;
	Msg -> io:format("error: unknown message ~p~n", [Msg]),
	       loop(State)
    end.


%% internal methods
rand_str(Length) ->
    L = lists:seq(1, Length),
    lists:flatten([rand_char() || Index <- L]).
    

rand_char() ->
    Chars = "pyfgcrlaoeuidhtnsqjkxbmwvz",
    Index = rand:uniform(length(Chars)),
    lists:nth(Index, Chars).

    
