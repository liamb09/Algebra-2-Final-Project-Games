class_name Enemy extends KinematicBody2D

export var speed: int
export var sprite_path: String
export var wait_time: int
onready var sprite = get_node(sprite_path)

func _ready():
	if speed > 0:
		sprite.flip_h = false
	elif speed < 0:
		sprite.flip_h = true

func _process(delta):
	position.x += speed*delta
	if stepify(position.x, 2) == get_viewport().size.x+(speed*wait_time):
		position.x = 16
	elif speed < 0:
		if stepify(position.x, 2) == speed*wait_time:
			position.x = get_viewport().size.x - 16



