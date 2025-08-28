if position_meeting(mouse_x, mouse_y, self) {
	image_index = 1
	if mouse_check_button(mb_left) {
		image_index = 2
		confirm = true
	}
} else {
	image_index = 0
	confirm = false
}

if mouse_check_button_released(mb_left) && confirm {
	switch (buttontype) {
		case button_type.start_game:
			room_goto(rClient)
			break;
		case button_type.set_name:
			messageID = get_string_async("im kinda lazy to make a text input widnow so you can input your name here, WARRIOR", global.username)
			prompttype = prompt_type.name
			break;
		case button_type.set_ip:
			messageID = get_string_async("set the server ip", global.ip)
			prompttype = prompt_type.ip
			break;
		case button_type.set_port:
			messageID = get_string_async("set the server port", global.port)
			prompttype = prompt_type.port
			break;
	}
}