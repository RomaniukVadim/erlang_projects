# Erlang Projects
[![Build Status](https://semaphoreci.com/api/v1/romaniukvadim/erlang_projects/branches/master/badge.svg)](https://semaphoreci.com/romaniukvadim/erlang_projects)

In hexlet_N folders I store tasks from Hexlet Erlang course
https://ru.hexlet.io/courses/erlang_101


Own Gen Server 
-------------
**gs1**  
Example:

    1> c(gs1).
    {ok,gs1}
    2> Pid = gs1:start().
    start <0.33.0>
    <0.40.0> enters loop
    <0.40.0>
    3> Pid ! hello.
    <0.40.0> receive hello
    <0.40.0> enters loop
    hello
    4> Pid ! [1,2,3].
    <0.40.0> receive [1,2,3]
    <0.40.0> enters loop
    [1,2,3]
    5> Pid ! stop.
    <0.40.0> stops now
    stop

**gs2**  
Example:

    1> c(gs2).
    {ok,gs2}
    2> Pid = gs2:start().
    <0.40.0>
    3> Pid ! {add, 1}.
    <0.40.0> adds 1 to its state
    {add,1}
    4> Pid ! {add, "hello"}.
    <0.40.0> adds "hello" to its state
    {add,"hello"}
    5> Pid ! show_items.
    my items is ["hello",1]
    show_items
    6> Pid ! {remove, "hello"}.
    {remove,"hello"}
    7> Pid ! show_items.
    my items is [1]
    show_items

**gs4**
Example:

    1> c(gs4).
    {ok,gs4}
    2> Pid = gs4:start().
    <0.40.0>
    3> gs4:add_item(Pid, 1).
    ok
    4> gs4:add_item(Pid, 2).
    ok
    5> gs4:show_items(Pid).
    [2,1]
    6> gs4:remove_item(Pid, 1).
    ok
    7> gs4:show_items(Pid).
    [2]
    8> gs4:stop(Pid).
    ok

**gs5**
Example:

    1> c(gs5).
    {ok,gs5}
    2> Pid = gs5:start().
    <0.40.0>
    3> gs5:add_item(Pid, "hello").
    ok
    4> gs5:add_item(Pid, "hi there").
    ok
    5> gs5:show_items(Pid).
    ["hi there","hello"]
    6> gs5:remove_item(Pid, "hi there").
    ok
    7> gs5:show_items(Pid).
    ["hello"]
    8> gs5:st
    8> gs5:stop(Pid).
    ok

## Contributing

Please read [CONTRIBUTING.md](CONTRIBUTING.md) for details on our code of conduct, and the process for submitting pull requests to us.

## Authors

* **Vadim Romaniuk** - *Initial work* - [glicOne](https://github.com/RomaniukVadim)

See also the list of [contributors](https://github.com/RomaniukVadim/erlang_projects/contributors) who participated in this project.

## License

This project is licensed under the Do What The F*ck You Want To Public License - see the [LICENSE.md](LICENSE.md) file for details
