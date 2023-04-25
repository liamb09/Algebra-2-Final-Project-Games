extends Enemy

var Loggy = load("res://Log.tscn")
onready var Log_thing = get_node("/root/Log")

func _process(delta):
	if Log_thing.log_exit == 7:
		position.x = 16
