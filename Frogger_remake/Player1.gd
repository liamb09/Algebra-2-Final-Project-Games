extends player
signal player1

func _ready():
	set_process_unhandled_input(true)

func _on_EnemyCollide_area_entered(area):
	if ("Police" in area.name 
		or "Firetruck" in area.name 
		or "Ambulance" in area.name):
		print("hit")


func _on_LogCollision_area_entered(area):
	if "Log" in area.name:
		var Loggy = get_node("/root/Log")
		speed = Loggy.speed


func _on_LogCollision_area_exited(area):
	speed = 0

func _on_EOLBCollide_area_entered(area):
	if "EOLB_collide" in area.name:
		emit_signal("player1")
		print("collide")
		set_process_unhandled_input(false)
