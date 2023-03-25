extends RigidBody2D

var screen_size

func _ready():
	screen_size = get_viewport_rect().size
		
func _integrate_forces(state):
	if position.x < 32:
		position.x = screen_size.x - 32
	elif position.x > screen_size.x - 32:
		position.x = 32
	if position.y < 30:
		position.y = screen_size.y - 32
	elif position.y > screen_size.y - 32:
		position.y = 32
	if abs(linear_velocity.y) <= 100:
		physics_material_override.absorbent = 1
	else:
		physics_material_override.absorbent = 0
