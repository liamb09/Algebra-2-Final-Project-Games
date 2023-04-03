extends KinematicBody2D

class_name Enemy

export var speed = 0
export var sprite_path = ""
onready var sprite = get_node(sprite_path)

func _ready():
	if speed > 0:
		sprite.flip_h = false
	elif speed < 0:
		sprite.flip_h = true

func _process(delta):
	position.x += speed*delta

