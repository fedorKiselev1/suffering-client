audio_group_load(bgm)
audio_group_load(sfx)
global.shootoutactive = false
global.username = "GAMER"
global.ip = "127.0.0.1"
global.port = 42069
shootx = 0
surfacewithmask = noone

shooty = 0
shotalpha = 0

Enemyinitx = 0
Enemyinity = 0
Enemyshootx = 0
Enemyshooty = 0
Enemyvictimx = 0
Enemyvictimy = 0
Enemyshotalpha = 0

shootX1 = 0
shootY1 = 0 
shootX2 = 0
shootY2 = 0

volume = true

reloaded = true
reloadtimemax = 147
reloadtime = 0

scopeeffect = 0

global.particleSYS = part_system_create()
global.miniglass = part_type_create()
part_type_direction(global.miniglass, 0, 360, 0, 0)
part_type_speed(global.miniglass, 10, 25, 0, 0)
part_type_gravity(global.miniglass, 1, 270)
part_type_color1(global.miniglass, c_white)
part_type_life(global.miniglass, 160, 240)
part_type_alpha3(global.miniglass, 1, 1, 0)
part_type_shape(global.miniglass, pt_shape_pixel)
part_type_size(global.miniglass, 2, 3, 0, 0)

global.sfxvolume = 0
global.bgmvolume = 0

global.failedtoconnect = false

sndshootout = noone
preshootout = true

alarm[0] = 1
audio_group_set_gain(bgm, 0.2, 0)