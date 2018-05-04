-module(task_3).

-export([member/2, filter/2]).

-include_lib("eunit/include/eunit.hrl").


%% implement lists:member/2
%% http://www.erlang.org/doc/man/lists.html#member-2
member(Elem, List) ->
    %% BEGIN (write your solution here)
    case List of
	[] ->
	    false;
	[H|[]] ->
	    case H of
		Elem -> true;
		_ -> member(Elem, [])
	    end;
	[H|T] ->
	    case H of
		Elem -> true;
		_ -> member(Elem, T)
	    end;
	_-> false
	end.
    %% END

member_test() ->
    ?assertEqual(true, member(55, [1,2,55,77])),
    ?assertEqual(false, member(55, [])),
    ?assertEqual(false, member(55, [1,2,77])),
    ?assertEqual(true, member("ab", ["dd", "bd", "ab"])),
    ok.



%% implement lists:filter/2
%% http://www.erlang.org/doc/man/lists.html#filter-2
filter(Pred, List) ->
    %% BEGIN (write your solution here)
    filter(Pred, List ,[]).
filter([],_,_) -> [];
filter(_Pred,[],Result) ->
    Result;
filter(Pred,List,Result) ->
    case List of
	[H|[]] ->
	    case Pred(H) of
		true ->
		    filter(Pred,[],reverse([H|Result]));
		false ->
		    filter(Pred,[],Result)
	    end;
	[H|T] ->
	    case Pred(H) of
		true ->
		    filter(Pred,T,[H|Result]);
		false ->
		    filter(Pred,T,Result)
	    end
	end.
%% END

reverse(List) ->
    reverse(List,[]).
reverse([],Tail) ->
    Tail;
reverse([H|T], Tail) ->
    reverse(T,[H|Tail]).


filter_test() ->
    F = fun(Val) -> Val rem 5 =:= 0 end,
    ?assertEqual([], filter(F, [])),
    ?assertEqual([], filter(F, [1,2,3,4])),
    ?assertEqual([5,10,15], filter(F, [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15])),
    ok.
