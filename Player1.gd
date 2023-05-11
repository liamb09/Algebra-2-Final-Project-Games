extends player

signal spawn_new

func _ready():
	set_process_unhandled_input(true)

func _on_EnemyCollide_area_entered(area):
	if ("Police" in area.name 
		or "Firetruck" in area.name 
		or "Ambulance" in area.name
		or "TrainCollide" in area.name
		or "Alligator" in area.name):
		print("hit")


func _on_LogCollision_area_entered(area):
	if "Log" in area.name:
		var Loggy = get_node("/root/Log")
		speed = Loggy.speed
	elif "Alligator_kill" in area.name:
		print("hit")
	elif "AlligatorCollide" in area.name:
		var alligator = get_node("../Alligator")
		speed = alligator.speed

func _on_LogCollision_area_exited(area):
	speed = 0

func _on_EOLBCollide_area_entered(area):
	var collided_area = "%s/../"
	var collided_obj = get_node(collided_area % area.get_path())
	if "EOLB_collide" in area.name and collided_obj.status[0] == true: 
		EOLB_hit(player1, collided_obj, 0)


func _on_WaterCollide_area_entered(area):
	if "WaterCollision" in area.name:
		print("Watercollided and die")
