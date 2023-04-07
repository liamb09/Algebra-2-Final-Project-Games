extends player

var colide

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
	print(area.name)
	if "EOLB_collide" in area.name and EOLB1.status[0] == true:
		EOLB_hit(player1, EOLB1, 1)
	elif "EOLB_collide2" in area.name and EOLB2.status[0] == true:
		EOLB_hit(player1, EOLB2, 1)
	elif "EOLB_collide3" in area.name and EOLB3.status[0] == true:
		EOLB_hit(player1, EOLB3, 1)
	elif "EOLB_collide4" in area.name and EOLB4.status[0] == true:
		EOLB_hit(player1, EOLB4, 1)
	elif "EOLB_collide5" in area.name and EOLB5.status[0] == true:
		EOLB_hit(player1, EOLB5, 1)
