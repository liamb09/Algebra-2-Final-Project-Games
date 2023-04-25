extends player

var colide

func _ready():
	set_process_unhandled_input(false)

func _on_EnemyCollide_area_entered(area):
	if ("Police" in area.name 
		or "Firetruck" in area.name 
		or "Ambulance" in area.name
		or "TrainCollide" in area.name
		or "Alligator" in area.name):
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
	if "EOLB_collide" in area.name and EOLB1.status[2] == true:
		EOLB_hit(player3, EOLB1, 3)
	elif "EOLB_collide2" in area.name and EOLB2.status[2] == true:
		EOLB_hit(player3, EOLB2, 3)
	elif "EOLB_collide3" in area.name and EOLB3.status[2] == true:
		EOLB_hit(player3, EOLB3, 3)
	elif "EOLB_collide4" in area.name and EOLB4.status[2] == true:
		EOLB_hit(player3, EOLB4, 3)
	elif "EOLB_collide5" in area.name and EOLB5.status[2] == true:
		EOLB_hit(player3, EOLB5, 3)



func _on_WaterCollide_area_entered(area):
	if "Water1" in area.name:
		print("Watercollided and die")
