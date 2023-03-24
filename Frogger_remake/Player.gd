extends Area2D

const tile_size = 32

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
	position.x = clamp(position.x, 0+16, 1600-16)
	position.y = clamp(position.y, 0+16, 900-87
	)
	
func move(dir):
	position += inputs[dir] * tile_size
