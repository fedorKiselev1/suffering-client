if image_alpha > 0 {
	draw_set_alpha(1)
	if (! surface_exists(surfacewithmask)) {surfacewithmask = surface_create(room_width, room_height); } 

	surface_set_target(surfacewithmask) 
	draw_clear_alpha(c_black, 0)

	draw_self()
	draw_set_color(c_lime)
	for (var i = - 5; i < 15; i++) {
		draw_line_width(x - 10 + 30 * i + slide, y - 10, x + sprite_width + 10 + 30 * i + slide, y + sprite_height + 10, 6)
	}


	gpu_set_blendmode(bm_subtract)
	draw_set_colour(c_black)

	draw_rectangle(0, y - 15, x, room_height, 0)
	draw_rectangle(x, y - 15, room_width, y, 0)

	gpu_set_blendmode(bm_normal) 

	draw_set_color(c_lime)
	draw_rectangle(x - 5 + sin(sway) * 3, y - 5 + sin(sway) * 3, x + sprite_width + 5 - sin(sway) * 3, y + sprite_height + 5 - sin(sway) * 3, 1)

	surface_reset_target(); 
	draw_surface(surfacewithmask,0,0)
	draw_set_color(c_black)
	if !global.shootoutactive {
		draw_text(x + sprite_width / 2 - 30, y - 20, "hover here to get ready!")
	} else if !oWorld.reloaded {
		draw_text(x + sprite_width / 2, y - 20, "RELOAD!!!")
	}
}