extends level

func _ready():
	trains_y = [210]
	init_at_intervals(Log, 16, 756, 200, 20, -150, 0)
	init_at_intervals(Log, 16, 724, 400, 2, 250, 1)
	init_at_intervals(truck, 16, 692, 300, 20, 100, 0)
	init_at_intervals(Police, 16, 660, 250, 3, -350, 2)
	init_at_intervals(SUV, 16, 628, 200, 20, -100, 0)
	init_at_intervals(car, 16, 564, 300, 2, 300, 1)
	init_at_intervals(Ambulance, 16, 532, 330, 2, -500, 3)
	init_at_intervals(Pickup, 16, 500, 200, 20, 150, 0)
	init_at_intervals(Firetruck, 16, 468, 400, 2, -400, 2)
	init_at_intervals(SUV, 16, 436, 360, 20, 200, 0)
	init_at_intervals(Log, 16, 404, 500, 1, 500, 3)
	init_at_intervals(Police, 16, 308, 450, 4, -300, 0)
	spawn_entity(64, 180, Signal, 0)
	init_at_intervals(Log, 16, 146, 200, 20, 100, 0)
	spawn_at_beg()
	set_player()
