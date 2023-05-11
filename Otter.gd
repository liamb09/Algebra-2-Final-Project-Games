extends Enemy

var otter_path
var pathy

func _on_LogCollide_area_entered(area):
	if "Otter" in area.name:
		otter_path = "%s/../"
		pathy = otter_path % area.get_path()
		queue_free()
		get_node(pathy).queue_free()


func _on_VisibilityNotifier2D_viewport_exited(viewport):
	queue_free()
