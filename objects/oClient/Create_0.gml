enum network {
	player_establish,
	player_connect,
	player_joined,
	player_disconnect,
	move,
	ready_position,
	countdown,
	shoot,
	reset
}



client = network_create_socket(network_socket_tcp)
network_set_timeout(client, 3000, 3000)
connected = network_connect(client, global.ip, global.port)

if connected = -1 {
	room_goto(rMenu)
	global.failedtoconnect = true
}

client_buffer = buffer_create(1024, buffer_fixed, 1)

socket_to_instance_id = ds_map_create()