extends Enemy

func _process(delta):
	if stepify(position.x, 2) == get_viewport().size.x+(speed*wait_time):
		position.x = 16
	elif speed < 0:
		if stepify(position.x, 2) == speed*wait_time:
			position.x = get_viewport().size.x - 16
