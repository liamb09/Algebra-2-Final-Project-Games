extends RigidBody2D

var velocity = Vector2.ZERO
var screen_size
var acc = Vector2(0, 0)
var gravity = 10

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	position = screen_size/2

func is_on_side_of_screen(pos):
	if pos.x == 32:
		return "left"
	elif pos.x == screen_size.x - 32:
		return "right"
	elif pos.y == 32:
		return "top"
	elif pos.y == screen_size.y - 32:
		return "bottom"

func _integrate_forces(state):
	pass
	#position.x = clamp(position.x, 32, screen_size.x - 32)
	#position.y = clamp(position.y, 32, screen_size.y - 32)
