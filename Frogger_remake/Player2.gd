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
	var guy1 = get_node("/root/Player1")
	if guy1.colide == false:
		set_process_unhandled_input(true)

func _on_LogCollision_area_entered(area):
	if "Log" in area.name:
		var Loggy = get_node("/root/Log")
		speed = Loggy.speed


func _on_LogCollision_area_exited(area):
	speed = 0

func _on_EOLBCollide_area_entered(area):
	if "EOLB_collide" in area.name:
		if EOLB.status[1] == true or EOLB2.status[1] == true:
			var player2 = get_node("/root/Player2")
			var guy1 = get_node("/root/Player1")
			player2.colide = false
			guy1.colide = true
			EOLB.status[2] = false
			EOLB2.status[2] = false
			set_process_unhandled_input(false)
			set_process(false)
