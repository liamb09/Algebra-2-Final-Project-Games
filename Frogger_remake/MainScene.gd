extends Node2D

var ambulance = load("res://Ambulance.tscn")
var player1 = load("res://Player1.tscn")
var Log = load("res://Log.tscn")
var Firetruck = load("res://Firetruck.tscn")
var Signal = load("res://Signal.tscn")
var Police = load("res://Police.tscn")
var end_of_level1 = load("res://EOLB1.tscn")
var end_of_level2 = load("res://EOLB2.tscn")
var end_of_level3 = load("res://EOLB3.tscn")
var end_of_level4 = load("res://EOLB4.tscn")
var end_of_level5 = load("res://EOLB5.tscn")
var train = load("res://Train.tscn")
var timer = 0
var coin = load("res://Coin.tscn")
var counter = 1
var counter2 = 0
var train_timer = 20
onready var timer_train = $Timer
signal train_come
var Alligator = load("res://Alligator.tscn")
var log_spawn_count = 0
var truck = load("res://Truck.tscn")
var car = load("res://Car.tscn")
var EOLB_count = 1
var EOLB_croc = load("res://EOLB_croc.tscn")
var EOLBS = []
var EOLB_timer = 0
var croc_stay = 0
var crocInstance
var i = 0
var Players
var players_used = 0
onready var EOLB1 = get_node("/root/Eolb1")
onready var EOLB2 = get_node("/root/Eolb2")
onready var EOLB3 = get_node("/root/Eolb3")
onready var EOLB4 = get_node("/root/Eolb4")
onready var EOLB5 = get_node("/root/Eolb5")

func spawn_entity(pos_x, pos_y, sprite):
	var spriteInstance = sprite.instance()
	spriteInstance.position.x = pos_x
	spriteInstance.position.y = pos_y
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
	
func spawn_at_intervals(sprite_path, pos_y, interval_time, timer):
	var screen_size_x = get_viewport().size.x
	timer += 1
	if timer == interval_time:
		var spriteinstance = sprite_path.instance()
		spriteinstance.position.y = pos_y
		if spriteinstance.speed > 0:
			spriteinstance.position.x = 0
			add_child(spriteinstance)
		if spriteinstance.speed < 0:
			spriteinstance.position.x = screen_size_x
			add_child(spriteinstance.name)
		timer = 0
	return timer

func init_at_intervals(sprite, pos_x, pos_y, interval_time, spawn_num):
	var spawned_num = 0
	var screen_size_x = get_viewport().size.x
	while pos_x < screen_size_x and pos_x > 0 and spawned_num < spawn_num:
		var sprite_instnance = sprite.instance()
		sprite_instnance.position.y = pos_y
		if sprite_instnance.speed > 0:
			sprite_instnance.position.x = pos_x
			add_child(sprite_instnance)
			pos_x += interval_time
		if sprite_instnance.speed < 0:
			sprite_instnance.position.x = screen_size_x - pos_x
			add_child(sprite_instnance)
			pos_x += interval_time
		spawned_num += 1

func _process(delta):
	timer += delta
	EOLB_timer += delta
	croc_stay += delta
	timer = stepify(timer, 0.01)
	$Label.text = str(timer)
	counter2 += 1
	if counter2 == train_timer:
		train_timer = 600+randi()%1200
		counter2 = 0
		timer_train.start()
		randomize()
		emit_signal("train_come")
	if int(EOLB_timer) == 3 and EOLB_timer != 0:
		EOLB_count = 1+randi()%5
		match EOLB_count:
			1:
				crocInstance = EOLB_croc.instance()
				crocInstance.position.x = 150
				crocInstance.position.y = 100
				add_child(crocInstance)
			2:
				crocInstance = EOLB_croc.instance()
				crocInstance.position.x = 300
				crocInstance.position.y = 100
				add_child(crocInstance)
			3:
				crocInstance = EOLB_croc.instance()
				crocInstance.position.x = 450
				crocInstance.position.y = 100
				add_child(crocInstance)
			4:
				crocInstance = EOLB_croc.instance()
				crocInstance.position.x = 600
				crocInstance.position.y = 100
				add_child(crocInstance)
			5:
				crocInstance = EOLB_croc.instance()
				crocInstance.position.x = 750
				crocInstance.position.y = 100
				add_child(crocInstance)
		randomize()
		EOLB_timer = 0

func _ready():
	$Player1/EOLBCollide.connect("area_entered", self, "_spawn_new_")
	spawn_entity(150, 100, end_of_level1)
	spawn_entity(300, 100, end_of_level2)
	spawn_entity(450, 100, end_of_level3)
	spawn_entity(600, 100, end_of_level4)
	spawn_entity(750, 100, end_of_level5)
	spawn_entity(300, 500, Signal)
	init_at_intervals(ambulance, 16, 320, 300, 20)
	init_at_intervals(truck, 16, 600, 300, 20)
	init_at_intervals(car, 16, 500, 200, 2)
	init_at_intervals(Log, 16, 208, 200, 20)
	spawn_entity(-188, 208, Alligator)
	init_at_intervals(Firetruck, 16, 448, 300, 5)
	init_at_intervals(Police, 16, 288, 200, 1)
	coin_spawn()
	while i < 7:
		var playerInstance = player1.instance()
		playerInstance.position.x = 450
		playerInstance.position.y = 800
		#playerInstance.visible = not playerInstance.visible
		add_child(playerInstance)
		playerInstance.add_to_group("Players")
		i += 1
	Players = get_tree().get_nodes_in_group("Players")
	Players[0].remove_from_group("Players")
	for sprite in Players:
		var path1 = "%s/EOLBCollide"
		var path2 = path1 % sprite
		var sprite1 = get_node(path2)
		sprite1.connect("area_entered", self, "_spawn_new_")
		sprite.set_process(false)
		sprite.set_process_unhandled_input(false)


func _on_Timer_timeout():
	spawn_entity(-1000, 600, train)
	$Timer.stop()

func _spawn_new_(area):
	if "EOLB_collide" in area.name:
		print("hoi")
		Players[players_used].set_process(true)
		Players[players_used].set_process_unhandled_input(true)
		#Players[players_used].visible = true
		players_used += 1
