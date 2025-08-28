repeat(4) {
	glass = instance_create_layer(x, y, "ready", oGlassshard)
	glass.direction = random(360)
	glass.speed = random_range(10, 20)
	glass.gravity = 1
}
shakeT = 30
initX = x
initY = y

repeat(60) {
	part_particles_create(global.particleSYS, random_range(x - 50,x + 50), random_range(y - 50,y + 50), global.miniglass, 1)
}