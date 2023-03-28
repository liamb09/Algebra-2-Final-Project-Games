extends Area2D

const speed = 50

func _process(delta):
	position.x += speed*delta

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
