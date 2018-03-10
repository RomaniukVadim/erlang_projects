-module(number).

-export([eq/2, more/2, less/2, add/2, sub/2]).

eq(A,B) ->
    A == B.

more(A,B) ->
    A > B.

less(A,B) ->
    A < B.


add(A,B) ->
    io:format("~p",A+B).

sub(A,B) ->
    A - B.
