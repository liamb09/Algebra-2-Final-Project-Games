extends level

func _ready():
	water_y = [176, 208, 144, 528, 496]
	Globals.cur_water_y = water_y
	otter_want = true
	trains_y = [628]
	next_level = "res://Levels/Level4.tscn"
	num_completed = 0
	spawn_entity(200, 590, Signal, 0)
	init_at_intervals(SUV, 16, 272, 300, 20, 200, 4)
	#init_at_intervals()
	init_at_intervals(truck, 16, 336, 300, 20, 120, 1)
	init_at_intervals(car, 16, 304, 200, 2, -300, 7)
	init_at_intervals(Pickup, 16, 368, 300, 5, 150,2)
	init_at_intervals(Police, 16, 400, 200, 2, -400, 1)
	init_at_intervals(Log, 16, 176, 200, 20, 100, 0)
	init_at_intervals(Log, 16, 208, 340, 6, -200, 0)
	init_at_intervals(Log, 16, 144, 200, 15, 150, 0)
	init_at_intervals(Log, 16, 532, 200, 20, 200, 0)
	init_at_intervals(snake, 16, 564, 0, 1, 300, 0)
	init_at_intervals(dog, 16, 596, 0, 1, -200, 0)
	init_at_intervals(cat, 16, 240, 0, 1, 210, 0)
	init_at_intervals(Log, 16, 500, 200, 20, 150, 0)
	spawn_entity(-188, 176, Alligator, 100)
	coin_spawn()
	spawn_at_beg()
	set_player()

func _on_Button_pressed():
	get_tree().change_scene("res://MainScreen.tscn")
