extends player

var colide

func _ready():
	set_process_unhandled_input(false)

func _on_EnemyCollide_area_entered(area):
	if ("Police" in area.name 
		or "Firetruck" in area.name 
		or "Ambulance" in area.name):
		print("hit")

func _process(delta):
	var guy2 = get_node("/root/Player2")
	if guy2.colide == false:
		set_process_unhandled_input(true)

func _on_LogCollision_area_entered(area):
	if "Log" in area.name:
		var Loggy = get_node("/root/Log")
		speed = Loggy.speed


func _on_LogCollision_area_exited(area):
	speed = 0

func _on_EOLBCollide_area_entered(area):
	if "EOLB_collide" in area.name:
		var player3 = get_node("/root/Player3")
		var guy2 = get_node("/root/Player2")
		player3.colide = false
		guy2.colide = true
		set_process_unhandled_input(false)
		set_process(false)

