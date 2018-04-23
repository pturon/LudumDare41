/// @description Respawn the opponent
	other.walksp = other.walksp_normal;
	other.invincible = false;	
	other.knockback = false;
	other.jump = false;
	other.x = other.posX;
	other.y = other.posY;
	other.hsp = 0;
	other.vsp = 0;
	global.enemy_health  = 3;