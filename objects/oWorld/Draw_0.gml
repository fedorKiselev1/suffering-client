
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
	

	
	
	if deathflash {
		draw_set_alpha(deathsflashalpha)
		draw_set_color(c_red)
		draw_rectangle(0, 0, room_width, room_height, 0)
	}
	
	if drawedgeL {
		draw_sprite_ext(sGradient, 0, 0, 0, 2, room_height, 0, c_white, drawedgeLalpha - 0.4)
	}
	if drawedgeR {
		draw_sprite_ext(sGradient, 0, room_width, 0, -2, room_height, 0, c_white, drawedgeRalpha - 0.4)
	}
}

