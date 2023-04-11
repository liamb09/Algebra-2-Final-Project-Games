extends Enemy


func _on_VisibilityNotifier2D_viewport_exited(viewport):
	position.x = get_viewport().size.x - 16
