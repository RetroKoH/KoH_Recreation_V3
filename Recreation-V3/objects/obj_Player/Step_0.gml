/// @description Insert description here
// You can write your code in this editor


if keyboard_check(vk_left) {
	if xsp > 0
		xsp -= 0.5;
	else
		xsp -= 3/256;
}

if keyboard_check(vk_right) {
	if xsp < 0
		xsp += 0.5;
	else
		xsp += 3/256;
}

if keyboard_check(vk_up)
	ysp-=3/256;

if keyboard_check(vk_down)
	ysp+=3/256;

inertia = xsp;

ctrl_Player_GroundCheckWalls();

x += xsp;
y += ysp;