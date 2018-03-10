-module(tm1).

-export([sample/1,fact/1,new_fact/1,new_fact/2,sample_tuple/1,is_polindrom/1,simple_sort/1,buble_sort/1]).

sample(X) ->
    X * X.

fact(0) ->
    1;

fact(N) ->
    N * fact(N-1).

new_fact(N) -> new_fact(N, 1).

new_fact(0,Res) ->
    Res;

new_fact(N, Res) ->
    new_fact(N-1, Res * N).

sample_tuple(X) ->
    case X of
	{1,true} ->
	    false;
	{2,false} -> true;
	{_,_} -> wow
    end.

is_polindrom(List) when ((tl(List) == []) or (List == [])) -> true;
is_polindrom([_H| T]) ->
    Last = lists:last(T),
    if _H == Last ->
	    is_polindrom(lists:sublist(T,length(T)-1));
       true -> false
    end.

simple_sort(List) -> simple_sort(List, []).

simple_sort([], Res) ->
    Res;
simple_sort([_H | T], Res) ->
    if
	T == [] ->
	    simple_sort(T, [_H | Res]);
	_H > hd(T) -> simple_sort(lists:append([hd(T) | Res],[_H|tl(T)]));
	true -> simple_sort(T, [_H | Res])
    end.
buble_sort(List) ->
    buble_sort(List,[],0).

buble_sort([],Res,N) ->
    if
	N == length(Res)-1 ->Res;
	true -> buble_sort(lists:reverse(Res),[],N+1)
    end;

buble_sort([_H|T], Res, N) ->
    if
	T == [] ->
	    buble_sort(T,[_H|Res],N);
	_H > hd(T) -> buble_sort([_H|tl(T)], [hd(T)|Res],N);
	true -> buble_sort(T, [_H|Res],N)
    end.

