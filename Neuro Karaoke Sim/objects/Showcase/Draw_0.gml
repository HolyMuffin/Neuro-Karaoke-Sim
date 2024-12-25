var x_ = x;
var y_ = y;
for(var i = 0; i < array_length(array); i++) {
	var inner_array = array[i];
	for(var j = 0; j < array_length(inner_array); j++) {
		x_ += 100;
		draw_sprite(inner_array[j], 0, x_, y_);
	}
	x_ = x;
	y_ += 150;
}