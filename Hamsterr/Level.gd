extends Node2D

class_name level

var Ambulance = load("res://Enemies/Ambulance.tscn")
var player1 = load("res://Player1.tscn")
var Log = load("res://Log.tscn")
var Firetruck = load("res://Enemies/Firetruck.tscn")
var Signal = load("res://Signal.tscn")
var Police = load("res://Enemies/Police.tscn")
var SUV = load("res://Enemies/SUV.tscn")
var Pickup = load("res://Enemies/Pickup.tscn")
var end_of_level1 = load("res://EOLB1.tscn")
var Otter = load("res://Otter.tscn")
var train = load("res://Train.tscn")
var Alligator = load("res://Enemies/Alligator.tscn")
var coin = load("res://Coins/Coin.tscn")
var truck = load("res://Enemies/Truck.tscn")
var car = load("res://Enemies/Car.tscn")
var EOLB_croc = load("res://EOLB_croc.tscn")
var snake = load("res://Enemies/Snake.tscn")
var dog = load("res://Enemies/Dog.tscn")
var cat = load("res://Enemies/Cat.tscn")
var timer = 0
var counter = 1
var log_spawn_count = 0
var EOLB_count = 1
var EOLBS = []
var EOLB_timer = 0
var crocInstance
var i = 0
var Players
var players_used = 1
var croc_timer = 0
var croc_is_active = false
var otter_come = 10
var otter_timer = 0
var num_completed = 0
var chooser = 0
var which_water = 0
var water_y = []
var trains_y = []
var otter_want = false
var next_level = "res://Levels/Level2.tscn"
var num_died = 0

func spawn_entity(pos_x, pos_y, sprite, speed):
	var spriteInstance = sprite.instance()
	spriteInstance.position.x = pos_x
	spriteInstance.position.y = pos_y
	spriteInstance.speed = speed
	add_child(spriteInstance)


func coin_spawn():
	var rand1 = RandomNumberGenerator.new()
	var rand2 = RandomNumberGenerator.new()
	while counter < 4:
		var coin_instance = coin.instance()
		rand1.randomize()
		rand2.randomize()
		var pos_x = rand1.randi_range(64, 708)
		var pos_y = rand2.randi_range(128, 708)
		coin_instance.position = Vector2(pos_x, pos_y)
		add_child(coin_instance)
		counter+=1


func init_at_intervals(sprite, pos_x, pos_y, interval_time, spawn_num, speed, wait_time):
	var spawned_num = 0
	var screen_size_x = get_viewport().size.x
	while pos_x < screen_size_x and pos_x > 0 and spawned_num < spawn_num:
		var sprite_instnance = sprite.instance()
		sprite_instnance.position.y = pos_y
		sprite_instnance.speed = speed
		sprite_instnance.wait_time = wait_time
		if sprite_instnance.speed > 0:
			sprite_instnance.position.x = pos_x
			add_child(sprite_instnance)
			pos_x += interval_time
		if sprite_instnance.speed < 0:
			sprite_instnance.position.x = screen_size_x - pos_x
			add_child(sprite_instnance)
			pos_x += interval_time
		spawned_num += 1

func spawn_at_beg():
	while i < 8:
		var playerInstance = player1.instance()
		playerInstance.position.x = 450
		playerInstance.position.y = 800
		playerInstance.visible = not playerInstance.visible
		add_child(playerInstance)
		playerInstance.add_to_group("Players")
		i += 1

func set_player():
	Players = get_tree().get_nodes_in_group("Players")
	Globals.Players = get_tree().get_nodes_in_group("Players")
	Players[0].remove_from_group("Players")
	for sprite in Players:
		var path1 = "%s/EOLBCollide"
		var path2 = path1 % sprite
		var sprite1 = get_node(path2)
		sprite1.connect("area_entered", self, "_spawn_new_")
		sprite.set_process(false)
		sprite.set_process_unhandled_input(false)
	Players[0].set_process(true)
	Players[0].set_process_unhandled_input(true)
	Players[0].visible = not Players[0].visible

func _spawn_new_(area):
	var collided_area = "%s/../"
	var collided_obj = get_node(collided_area % area.get_path())
	if "EOLB_collide" in area.name and collided_obj.status[0] == true:
		Players[players_used].set_process(true)
		Players[players_used].set_process_unhandled_input(true)
		Players[players_used].visible =  not Players[players_used].visible
		players_used += 1
		num_completed += 1


func train_spawn(pos_y):
	if int(Globals.train_almost_there) == 2:
		spawn_entity(-1000, pos_y, train, 4000)
		randomize()
		Globals.train_timer = 6+randi()%10
		Globals.train_almost_there = 0
		print("train_came")

func _process(delta):
	timer += delta
	EOLB_timer += delta
	otter_timer += delta
	timer = stepify(timer, 0.01)
	$Label.text = str(timer)
	if int(EOLB_timer) == 3 and EOLB_timer != 0:
		EOLB_count = 1+randi()%5
		match EOLB_count:
			1:
				crocInstance = EOLB_croc.instance()
				crocInstance.position.x = 320
				crocInstance.position.y = 100
				add_child(crocInstance)
			2:
				crocInstance = EOLB_croc.instance()
				crocInstance.position.x = 640
				crocInstance.position.y = 100
				add_child(crocInstance)
			3:
				crocInstance = EOLB_croc.instance()
				crocInstance.position.x = 960
				crocInstance.position.y = 100
				add_child(crocInstance)
			4:
				crocInstance = EOLB_croc.instance()
				crocInstance.position.x = 1280
				crocInstance.position.y = 100
				add_child(crocInstance)
			5:
				crocInstance = EOLB_croc.instance()
				crocInstance.position.x = 1600
				crocInstance.position.y = 100
				add_child(crocInstance)
		randomize()
		EOLB_timer = 0
		croc_is_active = true
	if croc_is_active:
		croc_timer += delta
	if int(croc_timer) == 2:
		remove_child(crocInstance)
		croc_timer = 0
		croc_is_active = false
	if int(otter_timer) == otter_come and otter_want:
		otter_come = 5+randi()%15
		randomize()
		which_water = randi()%len(water_y)
		spawn_entity(-188, water_y[which_water], Otter, 120)
		otter_timer = 0
		print("otter")
	on_done()
	for y in trains_y:
		train_spawn(y)
	if players_used == 8:
		get_tree().quit()
	if Globals.player_died:
		Players[players_used].set_process(true)
		Players[players_used].set_process_unhandled_input(true)
		Players[players_used].visible =  not Players[players_used].visible
		players_used += 1
		Globals.players_used = players_used
		Globals.player_died = false
		num_died += 1
		print(num_died)
	if water_y.has(int(Players[players_used-1].position.y)) == false:
		Players[players_used-1].speed = 0
	elif water_y.has(int(Players[players_used-1].position.y)):
		if int(Players[players_used-1].position.x) < 16 or int(Players[players_used-1].position.x) > 884:
			remove_child(Players[players_used-1])
			Globals.player_died = true
	match num_died:
			1:
				$Control/TextureRect.hide()
			2:
				$Control/TextureRect2.hide()
	if num_died == 3:
		Players[players_used-1].set_process_unhandled_input(false)
		Players[players_used-1].set_process(false)
		$Control/VBoxContainer.show()
		$Control/VBoxContainer/Button.grab_focus()

func on_done():
	if num_completed == 5:
		get_tree().change_scene(next_level)
		Globals.player_time = timer

func _ready():
	coin_spawn()
	var h = 0
	var EOLB_x = 320
	var EOLB_y = 100  
	while h < 5:
		spawn_entity(EOLB_x, EOLB_y, end_of_level1, 0)
		h+=1
		EOLB_x += 320
		$Control/VBoxContainer.hide()
