extends Area2D

class_name player

const tile_size = Vector2(32, 32)
var speed = 0
var num_spawned = 0
var grid_speed = 200

var target_position = Vector2()
var is_moving = false

onready var player1 = get_node("/root/Player1")

var inputs = {"right": Vector2.RIGHT,
			  "left": Vector2.LEFT,
			  "up": Vector2.UP,
			  "down": Vector2.DOWN
}

func _ready():
	position = position.snapped(Vector2.ONE * tile_size)
	position += Vector2.ONE * tile_size/2


func _unhandled_input(event):
	for dir in inputs.keys():
		if event.is_action_pressed(dir):
			move(dir)
			print(position.y)
			#var direction = inputs[dir] 
			#if direction != Vector2():
			#	var grid_position = position + direction*tile_size
			#	target_position = grid_position
			#	is_moving = true
			#	if direction != position:
			#		target_position = grid_position
			#		is_moving = true
				
	
			

func _process(delta):
	position.x = clamp(position.x, 0+16, get_viewport().size.x-16)
	#position.y = clamp(position.y, 0+16, get_viewport().size.y-16)
	position.x += speed*delta
	#if is_moving:
	#	var current_position = position
	#	position = current_position.linear_interpolate(target_position, grid_speed*delta)
	#	if position.distance_to(target_position) < 0.5:
	#		position = target_position
	#		is_moving = false

func move(dir):
	position += inputs[dir] * tile_size
func EOLB_hit(Player, the_EOLB, start):
	num_spawned += 1
	for i in range(start, 5):
		the_EOLB.status[i] = false
	set_process_unhandled_input(false)
	set_process(false)
	

