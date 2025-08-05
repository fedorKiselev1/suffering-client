enum network {
	player_establish,
	player_connect,
	player_joined,
	player_disconnect,
	move,
	ready_position,
	countdown,
	shoot
}

client = network_create_socket(network_socket_tcp)
connected = network_connect(client, "127.0.0.1", 12097)

client_buffer = buffer_create(1024, buffer_fixed, 1)

socket_to_instance_id = ds_map_create()