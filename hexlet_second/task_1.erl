-module(task_1).

-export([any/2, all/2]).

-include_lib("eunit/include/eunit.hrl").

%% implement lists:any/2
%% http://www.erlang.org/doc/man/lists.html#any-2
any(Pred, List) ->
    %% BEGIN (write your solution here)
    
    %% END

any_test() ->
    F1 = fun(V) -> V > 10 end,
    ?assertEqual(true, any(F1, [10, 20, 30])),
    ?assertEqual(false, any(F1, [1, 2, 3])),
    ?assertEqual(false, any(F1, [])),
    F2 = fun(V) -> V rem 2 =:= 0 end,
    ?assertEqual(true, any(F2, [1, 2, 3])),
    ?assertEqual(false, any(F2, [1, 3, 5])),
    ok.


%% implement lists:all/2
%% http://www.erlang.org/doc/man/lists.html#all-2
all(Pred, List) ->
    %% BEGIN (write your solution here)
    
    %% END

all_test() ->
    F1 = fun(V) -> V >= 10 end,
    ?assertEqual(true, all(F1, [10, 20, 30])),
    ?assertEqual(false, all(F1, [1, 20, 30])),
    ?assertEqual(true, all(F1, [])),
    F2 = fun(V) -> V rem 2 =:= 0 end,
    ?assertEqual(true, all(F2, [4, 6, 8])),
    ?assertEqual(false, all(F2, [2, 3, 4])),
    ok.
