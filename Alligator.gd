extends Enemy


func _process(delta):
	if stepify(position.x, 1) == 1212:
		position.x = -184
