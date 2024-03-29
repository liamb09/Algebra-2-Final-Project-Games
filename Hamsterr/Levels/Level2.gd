extends level

func _ready():
	water_y = [144, 176, 208, 496, 528, 560]
	Globals.cur_water_y = water_y
	otter_want = true
	next_level = "res://Levels/Level3.tscn"
	num_completed = 0
	init_at_intervals(Pickup, 16, 756, 230, 3, 150, 0)
	init_at_intervals(Ambulance, 16, 724, 260, 2, 300, 2)
	init_at_intervals(car, 16, 692, 300, 3, -180, 0)
	init_at_intervals(truck, 16, 660, 250, 3, -100, 0)
	init_at_intervals(SUV, 16, 628, 200, 4, 200, 1)
	init_at_intervals(Log, 16, 564, 400, 5, 150, 0)
	init_at_intervals(Log, 16, 500, 500, 2, -200, 0)
	init_at_intervals(Log, 16, 532, 300, 20, -80, 0)
	init_at_intervals(Firetruck, 16, 434, 300, 2, 200, 1)
	init_at_intervals(Police, 16, 402, 300, 2, -200, 0)
	init_at_intervals(SUV, 16, 370, 200, 20, -100, 0)
	init_at_intervals(car, 266, 338, 250, 3, 240, 4)
	init_at_intervals(Police, 1, 274, 0, 1, -600, 1)
	init_at_intervals(Log, 16, 210, 150, 20, 150, 6)
	init_at_intervals(Log, 16, 178, 500, 2, -350, 1)
	init_at_intervals(Log, 16, 146, 240, 4, 200, 3)
	coin_spawn()
	spawn_at_beg()
	set_player()
	move_child(get_node("GUI"), get_child_count())
	
func _on_Button_pressed():
	get_tree().change_scene("res://MainScreen.tscn")
