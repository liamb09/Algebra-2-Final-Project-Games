extends Sprite

func _unhandled_input(event):
	if event.is_action_pressed("right"):
		flip_h = false
		rotation_degrees = 0
	if event.is_action_pressed("up"):
		rotation_degrees = -90
		flip_h = false
	if event.is_action_pressed("down"):
		rotation_degrees = 90
		flip_h = false
	if event.is_action_pressed("left"):
		flip_h = true
		rotation_degrees = 0
