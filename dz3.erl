-module(dz3).

-export([first_word/1]).


first_word(Binary) ->
    first_word(Bin,<< >>).
first_word(<<x,Rest/binary>>, Acc)->
    first_word(1).
