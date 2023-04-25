extends KinematicBody2D

var speed = 100

func _process(delta):
	position.x += speed*delta

func _on_VisibilityNotifier2D_viewport_exited(viewport):
	position.x = 16

func _on_AlligatorReplace_body_entered(body):
	if "Alligator" in body.name:
		queue_free()
