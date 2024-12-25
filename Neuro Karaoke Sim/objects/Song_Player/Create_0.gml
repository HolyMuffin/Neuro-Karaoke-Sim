global.music = -69;
randomize();
y_position = 0;
target_y = 0;

name = "Neuro"
anim_counter = 0;
anim_direction = 1;
base_x = x;
base_y = y;
base_scale = 4;
image_xscale = base_scale;
image_yscale = base_scale;
image_speed = 0;

offset_distance = sprite_height + 10; //how far down they start offscreen

base_sprite = sprite_index;
bow_sprite = s_Neuro_Bow;
base_state = "Wait";
motion_type = "Wait";

function play_song(song, wait_time = 0) {
	var song_name = audio_get_name(song);
	audio_stop_sound(global.music);
	global.music = song;
	global.wait_time = wait_time;
	audio_play_sound(global.music, 0, false);
	if (global.nightcore) {
		game_set_speed(90, gamespeed_fps);
		audio_sound_pitch(global.music, 1.18);
	} else {
		game_set_speed(60, gamespeed_fps);
		audio_sound_pitch(global.music, 1);
	}
	
	with(Song_Player) {
		if (string_pos(name, song_name) != 0 || string_pos("Duet", song_name)) {
			target_y = -offset_distance;
		} else {
			target_y = 0;
		}
		swap_motion(base_state);
	}
}

function swap_motion(new_type) {
	x = base_x;
	image_index = choose(0, 0, 0, 1, 1);
	motion_type = new_type;
	anim_counter = 0;
	anim_direction = choose(-1, 1); //only applicable for some things
	if (new_type == "Bow") {
		sprite_index = bow_sprite;
	} else {
		sprite_index = base_sprite;
	}
}

function squish(magnitude) {
	image_xscale = base_scale + magnitude * dsin(5 * anim_counter);
	image_yscale = base_scale - magnitude * dsin(5 * anim_counter);
}

function squish_sharp(magnitude) {
	image_xscale = base_scale + magnitude * dsin(5 * anim_counter) * dsin(5 * anim_counter);
	image_yscale = base_scale - magnitude * dsin(5 * anim_counter) * dsin(5 * anim_counter);
}

function turn(magnitude) {
	image_angle = anim_direction * magnitude * dsin(5 * anim_counter / 2) * abs(dsin(5 * anim_counter / 2));
}

function shift(magnitude, anim_rate_multiplier = 1) {
	x = base_x + anim_direction * magnitude * dsin(5 * anim_counter * anim_rate_multiplier);
}

function chatter() {
	if (anim_counter % 20 == 0) {
		image_index -= image_index % 2;
		if (irandom(100) < 80)
			image_index = (image_index + 2) % 4;
	}
	if (anim_counter >= 360/5 && image_index == 1) {
		image_index = 0;
	}
}