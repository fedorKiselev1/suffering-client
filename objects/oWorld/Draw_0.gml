
if room = rClient {
	if shotalpha > 0 {
		draw_set_alpha(shotalpha)
		draw_set_color(c_white)
		draw_primitive_begin(pr_trianglestrip)
		draw_vertex_texture(850, 500, 0, 0);
		draw_vertex_texture(850, 550, 1, 0);
		draw_vertex_texture(shootx, shooty, 0, 1);
		draw_primitive_end();
	}
	if Enemyshotalpha > 0 {
		draw_set_alpha(Enemyshotalpha)
		draw_primitive_begin(pr_trianglestrip)
		draw_vertex_texture(
							oEnemy.x - 3 + 
							lengthdir_x(800, point_direction(Enemyvictimx, Enemyvictimy, Enemyshootx, Enemyshooty)) +
							lengthdir_x(80, point_direction(Enemyvictimx, Enemyvictimy, Enemyshootx, Enemyshooty) + 90),
							oEnemy.y - 5 + 
							lengthdir_y(800, point_direction(Enemyvictimx, Enemyvictimy, Enemyshootx, Enemyshooty)) +
							lengthdir_y(80, point_direction(Enemyvictimx, Enemyvictimy, Enemyshootx, Enemyshooty) + 90),
							0, 0
							);
		draw_vertex_texture(
							oEnemy.x - 3 + 
							lengthdir_x(800, point_direction(Enemyvictimx, Enemyvictimy, Enemyshootx, Enemyshooty)) +
							lengthdir_x(80, point_direction(Enemyvictimx, Enemyvictimy, Enemyshootx, Enemyshooty) - 90),
							oEnemy.y - 5 + 
							lengthdir_y(800, point_direction(Enemyvictimx, Enemyvictimy, Enemyshootx, Enemyshooty)) +
							lengthdir_y(80, point_direction(Enemyvictimx, Enemyvictimy, Enemyshootx, Enemyshooty) - 90),
							0, 0
							);
		draw_vertex_texture(oEnemy.x - 3, oEnemy.y - 5, 0, 1);
		draw_primitive_end();
	}
}