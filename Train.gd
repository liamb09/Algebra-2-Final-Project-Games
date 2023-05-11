extends Enemy


func _on_VisibilityNotifier2D_viewport_exited(viewport):
	queue_free()
