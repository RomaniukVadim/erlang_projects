-module(task_5).

-export([splitwith/2, zipwith/3]).

-include_lib("eunit/include/eunit.hrl").

dropwhile(Pred, List) ->
    case List of
	[] ->
	    [];
	[H|[]] ->
	    case Pred(H) of
		true ->
		    [];
		_ -> [H]
	    end;
	[H|T] ->
	    case Pred(H) of
		true ->
		    dropwhile(Pred,T);
		_ ->[H|T]
	    end
    end.

takewhile(Pred, List) ->
    case List of
	[] ->
	    [];
	[H|[]] ->
	    case Pred(H) of
		true ->
		    [H];
		_ -> []
	    end;
	[H|T] ->
	    case Pred(H) of
		true ->
		    [H|takewhile(Pred,T)];
		_ ->takewhile(Pred,[])
	    end
    end.


%% implement lists:splitwith/2
%% http://www.erlang.org/doc/man/lists.html#splitwith-2
splitwith(Pred, List) ->
    %% BEGIN (write your solution here)
    {takewhile(Pred, List), dropwhile(Pred, List)}.
    %% END


splitwith_test() ->
    F = fun(Val) -> Val rem 2 =:= 0 end,
    ?assertEqual({[], []}, splitwith(F, [])),
    ?assertEqual({[], [1]}, splitwith(F, [1])),
    ?assertEqual({[], [1,2]}, splitwith(F, [1,2])),
    ?assertEqual({[], [1,2,3]}, splitwith(F, [1,2,3])),
    ?assertEqual({[4,6,8], [1,2,3]}, splitwith(F, [4,6,8,1,2,3])),
    ?assertEqual({[2], [3,4,5]}, splitwith(F, [2,3,4,5])),
    ok.


%% implement lists:zipwith/3
%% http://www.erlang.org/doc/man/lists.html#zipwith-3
%% if two lists have different lengths don't throw exception but ignore the rest of longer list
zipwith(Pred, List1, List2) ->
    %% BEGIN (write your solution here)
    case List1 of
	[] ->
	    [];
	[H1|[]] ->
	    case List2 of
		[H2|[]] ->
		    [H1+H2]
	    end;
	[H1|T1] ->
	    case List2 of
		[H2|T2] ->
		    [H1+H2|zipwith(Pred,T1,T2)]
	    end
    end.

    %% END


zipwith_test() ->
    F = fun(Val1, Val2) -> Val1 + Val2 end,
    ?assertEqual([7,7,7], zipwith(F, [1,2,3], [6,5,4])),
    ?assertEqual([], zipwith(F, [], [])),
    ?assertEqual([4], zipwith(F, [1], [3])),
    ?assertEqual([4,6], zipwith(F, [1,2], [3,4])),
    ?assertEqual([2,4,6,8,10], zipwith(F, [1,2,3,4,5], [1,2,3,4,5])),
    ok.
