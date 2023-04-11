class_name Enemy extends KinematicBody2D

export var speed: int
export var sprite_path: String
onready var sprite = get_node(sprite_path)

func _ready():
	if speed > 0:
		sprite.flip_h = false
	elif speed < 0:
		sprite.flip_h = true

func _process(delta):
	position.x += speed*delta

