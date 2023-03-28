extends RigidBody2D

var screen_size
var prev_linear_velocity

func _ready():
	screen_size = get_viewport_rect().size
		
func _integrate_forces(state):
	$Up.global_rotation_degrees = 0
	if abs(linear_velocity.y) <= 100 or $Up.is_colliding():
		physics_material_override.absorbent = 1
	else:
		physics_material_override.absorbent = 0
	print(linear_velocity)
	print(global_position)

func _on_Teleports_teleport(direction):
	print("teleport")
	if direction == "left":
		set_global_position(Vector2(screen_size.x - 32, get_position().y))
	elif direction == "right":
		set_global_position(Vector2(32, get_position().y))
	elif direction == "down":
		set_global_position(Vector2(get_position().x, 32))
	elif direction == "up":
		set_global_position(Vector2(get_position().x, screen_size.x - 32))
