slide -= 1
if slide == -300 slide = 0
sway += 0.05
if sway >= pi * 2 sway = 0

if global.shootoutactive && oWorld.reloaded image_alpha = 0 else image_alpha = 1