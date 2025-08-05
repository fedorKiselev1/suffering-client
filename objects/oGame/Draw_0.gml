if instance_exists(oPlayerClient) {
	scale = 1
	groundY = oEnemy.y
	groundinc = 1.05
	for (var j = 0; j < 10; j++) {
		for (var i = 0; i < ceil((room_width) / (sprite_width)) + (j == 0 ? 1 : 0); i++) {
			draw_sprite_ext(sGround, 0, sprite_width * i * scale - (oPlayerClient.x * scale / 3), groundY, scale, scale, 0, c_white, 1)
		}
		scale += 1
		groundY *= groundinc
		groundinc += 0.02
	}
}