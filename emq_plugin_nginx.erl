-module(emq_plugin_nginx).
-export([load/1, unload/0]).
-export([on_client_connected/2, on_client_disconnected/2]).

load(Env) ->
   emqttd:hook('client.connected', fun ?MODULE:on_client_connected/2, [Env]),
   emqttd:hook('client.disconnected', fun ?MODULE:on_client_disconnected/2, [Env]).

on_client_connected(Message, _Env) ->
    io:format("nginx ~s~n", [emqttd_message:format(Message)]),
	{ok, Message}.
	
on_client_disconnected(Message, _Env) ->
    io:format("nginx ~s~n", [emqttd_message:format(Message)]),
	{ok, Message}.
	
unload() ->
    emqttd:unhook('client.connected', fun ?MODULE:on_client_connected/2).	
	
	
	
	
	
	
	
	
	