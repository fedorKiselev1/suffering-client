var _pos = animcurve_channel_evaluate(curve, step)

if open {
	if step < 1 {
		step += 1/60
	} else {
		step = 1
	}
} else {
	if step > 0 {
		step -= 1/60
	} else {
		step = 0
	}
}

x = initX - _pos * 300