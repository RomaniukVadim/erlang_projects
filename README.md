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
    
Practical Gen Server
-------------
**Чат с комнатами**
Пользователи могут создавать комнаты, присоединяться к уже существующим комнатам, писать сообщения и получать историю сообщений для данной комнаты.

Нужно реализовать следующие функции:

start()
запускает сервер и возвращает его pid.

create_room(Server, RoomName)
Принимает pid сервера и имя комнаты, создает новую комнату, генерирует для нее уникальный идентификатор, сохраняет комнату в состоянии сервера.

Тип данных для имени комнаты и ее индентификатора выберите сами, какие вы считаете нужными.

Пусть в чате будет лимит -- не больше 5-ти комнат. Если лимит не превышен, то создается новая комната, и функция возвращает {ok, RoomId}. Если лимит превышен, то функция возвращает {error, room_limit}.

remove_room(Server, RoomId)
Принимает pid сервера и идентификатор комнаты. Если такая комната есть, то удаляет ее и возвращает атом ok. Если такой комнаты нет, то возвращает {error, room_not_found}.

get_rooms(Server)
Принимает pid сервера, возвращает список комнат в виде кортежей [{RooId, RoomName}].

add_user(Server, RoomId, UserName)
Для простоты не будем вводить сложный объект User со многими аттрибутами, а ограничимся только строкой UserName. Будем считать, что пользователь полностью определяется этой строкой :)

Функция принимает pid сервера, идентификатор комнаты и имя пользователя. Если комната найдена, пользователь добавляется в комнату, и функция возвращает атом ok. Если такой комнаты нет, то функция возвращает {error, room_not_found}.

remove_user(Server, RoomId, UserName)
Принимает pid сервера, идентификатор комнаты и имя пользователя. Если комната найдена и данный пользователь в ней есть, то функция удаляет пользователя из комнаты и возвращает атом ok.

Если такой комнаты нет, то функция возвращает {error, room_not_found}. Если комната есть, но в ней нет такого пользователя, то функция возвращает {error, user_not_in_room}.

get_users_list(Server, RoomId)
Принимает pid сервера и идентификатор комнаты. Возвращает список имен пользователей {ok, [Name]}. Если такой комнаты нет, то функция возвращает {error, room_not_found}.

send_message(Server, RoomId, UserName, Message)
Принимает pid сервера, идентификатор комнаты, имя пользователя и сообщение от пользователя. Тип данных для сообщения выберите сами.

Функция сохраняет сообщение в истории сообщений для данной комнаты.

Какой-либо бродкаст сообщения всем пользователям реализовывать не нужно, потому что у нас нет сущностей, представляющих пользователей, которые способны принимать сообщения. (Понятно, что в этом случае каждого пользователя должен представлять какой-то отдельный поток).

Разумеется, нужно обработать ошибки и возвращать {error, room_not_found} или {error, user_not_in_room}. Если добавление завершилось успешно, то функция возвращает ok.

get_messages_history(Server, RoomId)
Принимает pid сервера и идентификатор комнаты, возвращает историю сообщений в виде списка кортежей {ok, [{UserName, Message}]}. Или {error, room_not_found}.

## Contributing

Please read [CONTRIBUTING.md](CONTRIBUTING.md) for details on our code of conduct, and the process for submitting pull requests to us.

## Authors

* **Vadim Romaniuk** - *Initial work* - [glicOne](https://github.com/RomaniukVadim)

See also the list of [contributors](https://github.com/RomaniukVadim/erlang_projects/contributors) who participated in this project.

## License

This project is licensed under the Do What The F*ck You Want To Public License - see the [LICENSE.md](LICENSE.md) file for details
