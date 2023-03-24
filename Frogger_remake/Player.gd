extends Area2D

const tile_size = 32
const animation_speed = 3
var moving = false

var inputs = {"right": Vector2.RIGHT,
			  "left": Vector2.LEFT,
			  "up": Vector2.UP,
			  "down": Vector2.DOWN
}

onready var ray = $RayCast2D

func _ready():
	position = position.snapped(Vector2.ONE * tile_size)
	position += Vector2.ONE * tile_size/2

func _unhandled_input(event):
	if moving:
		return
	for dir in inputs.keys():
		if event.is_action_pressed(dir):
			move(dir)
	
func move(dir):
	ray.target_position = inputs[dir] * tile_size
	ray.force_raycast_update()
	if !ray.is_collding():
		position += inputs[dir] * tile_size
