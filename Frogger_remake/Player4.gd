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
	var guy3 = get_node("/root/Player3")
	if guy3.colide == false:
		set_process_unhandled_input(true)

func _on_LogCollision_area_entered(area):
	if "Log" in area.name:
		var Loggy = get_node("/root/Log")
		speed = Loggy.speed


func _on_LogCollision_area_exited(area):
	speed = 0

func _on_EOLBCollide_area_entered(area):
	if "EOLB_collide" in area.name: 
		if EOLB.status[3] == true:
			var player4 = get_node("/root/Player4")
			var guy3 = get_node("/root/Player3")
			player4.colide = false
			guy3.colide = true
			EOLB.status[4] = false
			set_process_unhandled_input(false)
			set_process(false)

