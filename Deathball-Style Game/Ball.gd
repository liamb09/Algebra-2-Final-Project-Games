extends RigidBody2D


var screen_size


# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size


func _process(delta):
	position.x = clamp(position.x, 0, screen_size.x - 32)
	position.y = clamp(position.y, 0, screen_size.y - 32)
