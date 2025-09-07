fullscreen = !fullscreen
window_set_fullscreen(fullscreen)
if fullscreen {
	window_set_max_height(display_get_height()) 
	window_set_max_width(display_get_width())
} else {
	window_set_max_height(room_height)
	window_set_max_width(room_width)
}