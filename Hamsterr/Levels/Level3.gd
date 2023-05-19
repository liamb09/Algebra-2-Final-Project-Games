extends level

func _ready():
	water_y = [176, 208, 144, 528, 496]
	Globals.cur_water_y = water_y
	otter_want = true
	trains_y = [628]
	next_level = "res://Levels/Level4.tscn"
	num_completed = 0
	spawn_entity(300, 500, Signal, 0)
	init_at_intervals(SUV, 16, 272, 300, 20, 200, 4)
	init_at_intervals(truck, 16, 336, 300, 20, 120, 1)
	init_at_intervals(car, 16, 304, 200, 2, -300, 7)
	init_at_intervals(Pickup, 16, 368, 300, 5, 150,2)
	init_at_intervals(Police, 16, 400, 200, 2, -400, 1)
	init_at_intervals(Log, 16, 176, 100, 20, 100, 0)
	init_at_intervals(Log, 16, 208, 240, 6, -200, 0)
	init_at_intervals(Log, 16, 144, 100, 15, 150, 0)
	init_at_intervals(Log, 16, 532, 100, 20, 200, 0)
	init_at_intervals(Log, 16, 500, 100, 20, 150, 0)
	spawn_entity(-188, 176, Alligator, 100)
	spawn_at_beg()
	set_player()
