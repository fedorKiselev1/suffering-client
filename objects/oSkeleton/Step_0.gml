if inputpointer < 8 {
	if keyboard_check_pressed(inputs[inputpointer])  {
		timer = 50
		inputpointer++
		if inputpointer = 8 {
			run = true	
		}
	}
}
timer--
if timer <= 0 {
	inputpointer = 0
}

if run {
	x += 35
}