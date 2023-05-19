extends Area2D

var player_on_detected
var player_on_y_value

func _process(delta):
	var overlappingBodies = get_overlapping_areas()
	for area in overlappingBodies:
		var player_on = "LogCollision" in area.name 
		if player_on:
			#print("player on")
			pass
		elif player_on == false:
			#print("player off")
			pass
