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
	if speed > 0:
		if position.x > get_viewport().size.x+(speed*wait_time+64):
			position.x = -64
	elif speed < 0:
		if position.x < speed*wait_time-64:
			position.x = get_viewport().size.x + 64



