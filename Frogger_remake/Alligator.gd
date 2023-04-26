extends Enemy

var Loggy = load("res://Log.tscn")
onready var Log_thing = get_node("/root/Log")

func _process(delta):
	if stepify(position.x, 1) == 1212:
		position.x = -184
