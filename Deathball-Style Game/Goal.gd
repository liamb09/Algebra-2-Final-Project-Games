extends Area2D

export var goal_for = ""

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


func _on_Goal_body_entered(body):
	if body.get_name() == "Ball":
		print("Goal!")
		if goal_for == "Player 1":
			pass
		elif goal_for == "Player 2":
			pass
