if room = rClient {
	draw_set_alpha(1)
	draw_sprite_ext(sReloadicon, 0, 50, 425, 1, 1, 0, c_black, 1)
	
	if (! surface_exists(surfacewithmask)) {surfacewithmask = surface_create(room_width, room_height); } 
	surface_set_target(surfacewithmask) 
	draw_clear_alpha(c_black, 0)

	draw_sprite(sReloadicon, 0, 50, 425)

	gpu_set_blendmode(bm_subtract)
	draw_set_colour(c_black)

	draw_rectangle(50, 425,50 + reloadtime, 425 + 83, 0)

	gpu_set_blendmode(bm_normal) 



	surface_reset_target(); 
	draw_surface(surfacewithmask,0,0)
}