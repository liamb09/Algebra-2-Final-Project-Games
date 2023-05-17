extends player

signal spawn_new
var is_done = false
var enemies = ["Police", "Firetruck", "Ambulace_collide", "TrainCollide",
"AlligatorCollide", "SUV", "Pickup", "Car", "Truck", "Croc"]

func _ready():
	set_process_unhandled_input(true)

func _on_EnemyCollide_area_entered(area):
	if is_done == false:
		for enemy in enemies:
			if enemy in area.name:
				Globals.player_died = true
				queue_free()

func _on_LogCollision_area_entered(area):
	if "Log_collide" in area.name:
		var Loggy = get_node(str(area.get_path())+"/../")
		speed = Loggy.speed
	elif "Alligator_kill" in area.name:
		print("hit")
	elif "AlligatorCollide" in area.name:
		var alligator = get_node(str(area.get_path())+"/../")
		speed = alligator.speed

func _on_LogCollision_area_exited(area):
	pass

func _on_EOLBCollide_area_entered(area):
	var collided_area = "%s/../"
	var collided_obj = get_node(collided_area % area.get_path())
	if "EOLB_collide" in area.name and collided_obj.status[0] == true: 
		EOLB_hit(player1, collided_obj, 0)
		position.x = collided_obj.position.x
		position.y = collided_obj.position.y
		is_done = true


func _on_WaterCollide_area_entered(area):
	if "EWater" in area.name and Globals.on_log == false:
		Globals.player_died = true
		queue_free()

