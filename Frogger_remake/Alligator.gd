extends Enemy

var Loggy = load("res://Log.tscn")
signal Respawn

func _on_VisibilityNotifier2D_viewport_exited(viewport):
	queue_free()
	emit_signal("Respawn")

