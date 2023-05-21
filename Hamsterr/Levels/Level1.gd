extends level

func _ready():
	water_y = [592, 560, 176, 144]
	init_at_intervals(Log, 16, 176, 300, 20, 100, 0)
	init_at_intervals(Log, 16, 144, 200, 20, -150, 2)
	init_at_intervals(Log, 16, 560, 250, 20, 100, 0)
	init_at_intervals(Log, 16, 592, 300, 20, -120, 0)
	init_at_intervals(Police, 16, 752, 400, 3, -70, 6)
	init_at_intervals(SUV, 16, 720, 400, 3, 150, 2)
	init_at_intervals(truck, 16, 688, 300, 3, 90, 3)
	init_at_intervals(Firetruck, 16, 432, 500, 5, 100, 0)
	init_at_intervals(Ambulance, 16, 400, 300, 3, -120, 2)
	init_at_intervals(car, 16, 304, 500, 2, -300, 1)
	spawn_at_beg()
	set_player()
