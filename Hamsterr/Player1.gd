extends player

signal spawn_new
var is_done = false
var enemies = ["Police", "Firetruck", "Ambulace_collide", "TrainCollide",
"AlligatorCollide", "SUV", "Pickup", "Car", "Truck", "Croc"]
var colide = false
var colide_count = 0

func _ready():
	set_process_unhandled_input(true)

func _process(delta):
	var overlappingAreas = get_overlapping_areas()
	for area in overlappingAreas:
		if "EWater" in area.name:
			colide = true
			#print(Globals.on_log)
			if Globals.on_log == false:
				#queue_free()
				#Globals.player_died = true
				pass
	if colide:
		colide_count += delta

func _on_EnemyCollide_area_entered(area):
	if is_done == false:
		for enemy in enemies:
			if enemy in area.name:
				Globals.player_died = true
				queue_free()

func _on_LogCollision_area_entered(area):
	print(area.name)
	if "Log_collide" in area.name:
		var Loggy = get_node(str(area.get_path())+"/../")
		speed = Loggy.speed
		print("collided with log")
	elif "Alligator_kill" in area.name:
		print("hit")
	elif "AlligatorCollide" in area.name:
		var alligator = get_node(str(area.get_path())+"/../")
		speed = alligator.speed
	elif "EWater" in area.name:
		print("collided with water")

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


