extends Node2D

signal teleport(direction)

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Left_body_entered(body):
	if body.get_name() == "Ball":
		emit_signal("teleport", "left")


func _on_Right_body_entered(body):
	if body.get_name() == "Ball":
		emit_signal("teleport", "right")


func _on_Up_body_entered(body):
	if body.get_name() == "Ball":
		emit_signal("teleport", "up")


func _on_Down_body_entered(body):
	if body.get_name() == "Ball":
		emit_signal("teleport", "down")
