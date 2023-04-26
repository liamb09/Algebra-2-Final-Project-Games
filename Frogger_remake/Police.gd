extends Enemy

func _on_VisibilityNotifier2D_viewport_exited(viewport):
	if position.x < 450:
		position.x = get_viewport().size.x - 16
	else:
		position.x = 16
