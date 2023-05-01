extends RigidBody2D

var screen_size
const max_dy = 2000
var start_pos

func _ready():
	screen_size = get_viewport_rect().size

func reset():
	position = start_pos
	linear_velocity = Vector2.ZERO
	
func _integrate_forces(state):
	$Up.global_rotation_degrees = 0
	$Down.global_rotation_degrees = 0
	if abs(linear_velocity.y) <= 150 or $Up.is_colliding():
		physics_material_override.absorbent = 1
	else:
		physics_material_override.absorbent = 0
	if $Down.is_colliding():
		gravity_scale = 0
	else:
		gravity_scale = 10
	linear_velocity.y = clamp(linear_velocity.y, -max_dy, max_dy)

func _on_Teleports_teleport(direction):
	if direction == "left":
		set_global_position(Vector2(screen_size.x - 32, get_position().y))
	elif direction == "right":
		set_global_position(Vector2(32, get_position().y))
	elif direction == "down":
		set_global_position(Vector2(get_position().x, 32))
	elif direction == "up":
		set_global_position(Vector2(get_position().x, screen_size.y - 32))
