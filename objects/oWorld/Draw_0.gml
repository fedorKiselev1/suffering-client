
if room = rClient {
	draw_set_alpha(1)
	draw_set_color(c_black)
	
	draw_rectangle(mouse_x - 1, mouse_y - 1, mouse_x + 1, mouse_y + 1, true)
	draw_line(mouse_x - 10 - scopeeffect * 10, mouse_y, mouse_x - 30 - scopeeffect * 80, mouse_y)
	draw_line(mouse_x + 10 + scopeeffect * 10, mouse_y, mouse_x + 30 + scopeeffect * 80, mouse_y)
	draw_line(mouse_x, mouse_y - 10 - scopeeffect * 10, mouse_x, mouse_y - 30 - scopeeffect * 80)
	draw_line(mouse_x, mouse_y + 10 + scopeeffect * 10, mouse_x, mouse_y + 30 + scopeeffect * 80)
	
	draw_set_color(c_white)
	if shotalpha > 0 {
		draw_set_alpha(shotalpha)
		draw_set_color(c_white)
		draw_primitive_begin(pr_trianglestrip) //92
		draw_vertex_texture(shootX1, shootY1, 0, 0);
		draw_vertex_texture(shootX2, shootY2, 1, 0);
		draw_vertex_texture(shootx, shooty, 0, 1);
		draw_primitive_end();
	}
	if Enemyshotalpha == 1 {
		Enemyinitx = oEnemy.x
		Enemyinity = oEnemy.y
	}
	if Enemyshotalpha > 0 {
		draw_set_alpha(Enemyshotalpha)
		draw_primitive_begin(pr_trianglestrip)
		draw_vertex_texture(
							Enemyinitx - 3 + 
							lengthdir_x(800, point_direction(Enemyvictimx, Enemyvictimy, Enemyshootx, Enemyshooty)) +
							lengthdir_x(80, point_direction(Enemyvictimx, Enemyvictimy, Enemyshootx, Enemyshooty) + 90),
							Enemyinity - 5 + 
							lengthdir_y(800, point_direction(Enemyvictimx, Enemyvictimy, Enemyshootx, Enemyshooty)) +
							lengthdir_y(80, point_direction(Enemyvictimx, Enemyvictimy, Enemyshootx, Enemyshooty) + 90),
							0, 0
							);
		draw_vertex_texture(
							Enemyinitx - 3 + 
							lengthdir_x(800, point_direction(Enemyvictimx, Enemyvictimy, Enemyshootx, Enemyshooty)) +
							lengthdir_x(80, point_direction(Enemyvictimx, Enemyvictimy, Enemyshootx, Enemyshooty) - 90),
							Enemyinity - 5 + 
							lengthdir_y(800, point_direction(Enemyvictimx, Enemyvictimy, Enemyshootx, Enemyshooty)) +
							lengthdir_y(80, point_direction(Enemyvictimx, Enemyvictimy, Enemyshootx, Enemyshooty) - 90),
							0, 0
							);
		draw_vertex_texture(Enemyinitx - 3, Enemyinity - 5, 0, 1);
		draw_primitive_end();
	}
	
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

