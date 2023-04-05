extends StaticBody2D

var status = true

func _on_EOLB_collide_area_entered(area):
	if "EOLBCollide" in area.name:
		status = false
