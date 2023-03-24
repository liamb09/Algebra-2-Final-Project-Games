extends RigidBody2D

var screen_size
var prev_applied_force


# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size

func teleport():
	prev_applied_force = applied_force
	if position.x < 32:
		position.x = screen_size.x - 32
	elif position.x > screen_size.x - 32:
		position.x = 32
	if position.y < 32:
		position.y = screen_size.y - 32
	if position.y > screen_size.y - 32:
		position.y = 32
	applied_force = prev_applied_force
		
func _integrate_forces(state):
	teleport()
