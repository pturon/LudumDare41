//Variablen
posX = x;
posY = y;

hsp = 0; 
vsp = 0; 
grv_normal = 1;
grv_increased = 2;
grv = grv_normal;

global.enemy_health = 3;

walksp_buffed = 11;
walksp_normal = 8;
walksp_slowed = 4;
walksp = walksp_normal;

jumpspeed_normal = -12;
jumpspeed_buffed = -14;
jumpspeed_debuffed = -8;
jumpspeed = jumpspeed_normal;

has_speed_buff = false;
has_jump_buff = false;
has_shield = false;
invincible = false;
freezed = false;

image_speed = 0;

knockback = false;
jump = false;