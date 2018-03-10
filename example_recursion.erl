-module(example_recursion).

-export([double/1, double_compact/1]).

double([H|T]) ->
    NewH = 2*H,
    NewT = double(T),
    [NewH|NewT];
double([]) ->
    [].


double_compact([H|T]) ->
    [2*H|double(T)];
double_compact([]) ->
    [].
