-module(chat_room_manager).

-export([start/0,
         create_room/2, remove_room/2, get_rooms/1,
         add_user/3, remove_user/3, get_users_list/2,
         send_message/4,  get_messages_history/2]).
-export([loop/1, handle_call/2]).

-type(server() :: pid()).
-type(room_id() :: reference()).
-type(name() :: binary()).
-type(message() :: {name(), binary()}).

%% BEGIN (write your solution here)

%% END

-spec start() -> server().
start() ->
    %% BEGIN (write your solution here)
    
    %% END


-spec create_room(server(), name()) -> {ok, room_id()} | {error, term()}.
create_room(Server, RoomName) ->
    %% BEGIN (write your solution here)
    
    %% END


-spec remove_room(server(), room_id()) -> ok | {error, term()}.
remove_room(Server, RoomId) ->
    %% BEGIN (write your solution here)
    
    %% END


-spec get_rooms(server()) -> [{room_id(), name()}].
get_rooms(Server) ->
    %% BEGIN (write your solution here)
    
    %% END


-spec add_user(server(), room_id(), name()) -> ok | {error, term()}.
add_user(Server, RoomId, UserName) ->
    %% BEGIN (write your solution here)
    
    %% END


-spec remove_user(server(), room_id(), name()) -> ok | {error, term()}.
remove_user(Server, RoomId, UserName) ->
    %% BEGIN (write your solution here)
    
    %% END


-spec get_users_list(server(), room_id()) -> {ok, [name()]} | {error, term()}.
get_users_list(Server, RoomId) ->
    %% BEGIN (write your solution here)
    
    %% END


-spec send_message(server(), room_id(), name(), binary()) -> ok.
send_message(Server, RoomId, UserName, Message) ->
    %% BEGIN (write your solution here)
    
    %% END


-spec get_messages_history(server(), room_id()) -> [message()].
get_messages_history(Server, RoomId) ->
    %% BEGIN (write your solution here)
    
    %% END


%% BEGIN (write your solution here)

%% END
