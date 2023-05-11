extends KinematicBody2D

var speed = 100
var log_exit = 0

func _process(delta):
	position.x += speed*delta

func _on_AlligatorReplace_body_entered(body):
	if "Alligator" in body.name:
		hide()

func _on_VisibilityNotifier2D_viewport_exited(viewport):
	position.x = 16
	show()


func _on_OtterCollide_body_entered(body):
	if "Otter" in body.name:
		queue_free()
