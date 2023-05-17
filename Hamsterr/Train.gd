extends KinematicBody2D

var speed = 3000
onready var sprite = $Train_sprite

func _ready():
	if speed > 0:
		sprite.flip_h = false
	elif speed < 0:
		sprite.flip_h = true

func _process(delta):
	position.x += speed*delta

func _on_VisibilityNotifier2D_viewport_exited(viewport):
	queue_free()
