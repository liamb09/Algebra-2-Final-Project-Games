extends Node2D

var ambulance = load("res://Ambulance.tscn")
var player = load("res://Player1.tscn")
var player2 = load("res://Player2.tscn") 
var player3 = load("res://Player3.tscn")
var player4 = load("res://Player4.tscn")
var player5 = load("res://Player5.tscn")
var Log = load("res://Log.tscn")
var Firetruck = load("res://Firetruck.tscn")
var Police = load("res://Police.tscn")
var end_of_level = load("res://EOLB1.tscn")
var end_of_level2 = load("res://EOLB2.tscn")
var end_of_level3 = load("res://EOLB3.tscn")
var end_of_level4 = load("res://EOLB4.tscn")
var end_of_level5 = load("res://EOLB5.tscn")
var timer = 0

func spawn_entity(pos_x, pos_y, sprite):
	var spriteInstance = sprite.instance()
	spriteInstance.position.x = pos_x
	spriteInstance.position.y = pos_y
	add_child(spriteInstance)

func water_spawn(pos_y, sprite):
	var pos_x = 16
	while pos_x < get_viewport().size.x:
		var spriteInstance = sprite.instance()
		spriteInstance.position.x = pos_x
		spriteInstance.position.y = pos_y
		add_child(spriteInstance)
		pos_x += 32

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

func init_at_intervals(sprite, pos_x, pos_y, interval_time):
	var screen_size_x = get_viewport().size.x
	while pos_x < screen_size_x and pos_x > 0:
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

func _process(delta):
	timer += delta
	timer = stepify(timer, 0.01)
	print(timer)
	$Label.text = str(timer)

func _ready():
	spawn_entity(150, 100, end_of_level)
	spawn_entity(300, 100, end_of_level2)
	spawn_entity(450, 100, end_of_level3)
	spawn_entity(600, 100, end_of_level4)
	spawn_entity(750, 100, end_of_level5)
	init_at_intervals(ambulance, 16, 288, 300)
	init_at_intervals(Log, 16, 208, 200)
	init_at_intervals(Firetruck, 16, 256, 300)
	init_at_intervals(Police, 16, 320, 200)
	spawn_entity(150, 400, player)
	spawn_entity(300, 400, player2)
	spawn_entity(450, 400, player3)
	spawn_entity(600, 400, player4)
	spawn_entity(750, 400, player5)
