if active {
	x = lerp(x, -120, 0.2)
} else {
	x = lerp(x, -1210, 0.2)	
	if x < -1200 {
		instance_destroy()
	}
}

alarm[0] = 1