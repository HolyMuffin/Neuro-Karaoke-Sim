anim_counter++;
y_position = lerp(y_position, target_y, 0.05);
y = base_y + (offset_distance + 10) + y_position;

switch (motion_type) {
	case "Wait":
		squish(0.1);
		
		if (anim_counter >= global.wait_time) {
			swap_motion("Bob and Lean");
		}
	break;
	case "Wait2":
		image_index = 0;
		
		turn(2);
		squish(0.01);
		
		if (anim_counter >= global.wait_time) {
			swap_motion("Quick Bounce");
		}
	break;
	case "Quick Bounce":
		chatter();

		squish_sharp(0.2);
		
		if (anim_counter == 360/5/2) {
			swap_motion("Bob", "Wiggle", "Bounce", "Bow");
		}
	break;
	case "Bob":
		chatter();

		turn(1);
		squish(0.1);
		
		if (anim_counter == 360*2/5) {
			swap_motion("Bob and Lean", "Side to Side", "Wiggle", "Bounce", "Bow");
		}
	break;
	case "Bob and Lean":
		chatter();
		
		turn(5);
		squish(0.1);
		
		if (anim_counter == 360*2/5) {
			swap_motion(choose("Bob", "Bob and Lean Fast", "Side to Side"));
		}
	break;
	case "Bob and Lean Fast":
		anim_counter += 1;
		chatter();
		
		turn(6);
		squish(0.1);
		
		if (anim_counter == 360*2/5) {
			swap_motion(choose("Bob and Lean", "Bob and Lean Fast", "Side to Side Fast", "Wiggle"));
		}
	break;
	case "Side to Side":
		chatter();
		
		turn(1);
		squish_sharp(0.15);
		shift(15, 1);
		
		if (anim_counter == 360*2/5) {
			swap_motion(choose("Bob", "Bob and Lean", "Side to Side Fast"));
		}
	break;
	case "Side to Side Fast":
		anim_counter += 1;
		chatter();
		
		turn(1);
		squish(0.12);
		shift(15, 1/2);
		
		if (anim_counter == 360*2/5) {
			swap_motion(choose("Bob and Lean Fast", "Side to Side", "Side to Side Fast", "Wiggle"));
		}
	break;
	case "Wiggle":
		anim_counter += 1;
		chatter();
		
		image_angle = anim_direction * 4 * dsin(5 * anim_counter / 2);
		squish(0.02);
		shift(6, 1/2);
		
		if (anim_counter == 360*4/5) {
			swap_motion(choose("Bob", "Bob and Lean Fast", "Side to Side Fast", "Bounce"));
		}
	break;
	case "Bounce":
		chatter();
		
		squish_sharp(0.2);
		
		if (anim_counter == 360/5) {
			swap_motion("Bob", "Wiggle", "Bounce", "Bow");
		}
	break;
	case "Bow":
		var anim_rate = 6;
		if (anim_counter % anim_rate == 0) {
			image_index = (image_index + 1);
		}
		
		if (anim_counter == image_number * anim_rate) {
			swap_motion("Bob", "Bounce");
		}
	break;
}