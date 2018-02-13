-module(example_recursion).
echo()->
    receive
	{PID,Msg} ->
	    PID ! Msg,
	    echo()
    end.
