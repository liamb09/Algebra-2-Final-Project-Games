extends Area2D
export var goal_for = ""

func _ready():
	if goal_for == "Player 1":
		$AnimatedSprite.frame = 1
	else:
		$AnimatedSprite.frame = 0
