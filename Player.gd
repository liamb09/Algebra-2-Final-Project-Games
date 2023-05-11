extends Area2D

class_name player

const tile_size = 32
var speed = 0
var num_spawned = 0

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
			

func _process(delta):
	position.x = clamp(position.x, 0+16, get_viewport().size.x-16)
	position.y = clamp(position.y, 0+16, get_viewport().size.y-16)
	position.x += speed*delta
	
func move(dir):
	position += inputs[dir] * tile_size
	emit_signal("spawn_new")


func EOLB_hit(Player, the_EOLB, start):
	num_spawned += 1
	for i in range(start, 5):
		the_EOLB.status[i] = false
	set_process_unhandled_input(false)
	set_process(false)
	

