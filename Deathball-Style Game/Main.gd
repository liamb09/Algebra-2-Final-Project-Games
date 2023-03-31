extends Node

export var player1points = 5
export var player2points = 5

func _ready():
	pass

func _process(delta):
	if player1points > 0 and player2points > 0:
		$PointDisplay.show()
		$PointDisplay2.show()
		$PointDisplay.frame = 5 - player2points
		$PointDisplay2.frame = 5 - player1points
	else:
		$PointDisplay.hide()
		$PointDisplay2.hide()



func _on_Goal_body_entered(body):
	if body.get_name() == "Ball":
		player1points -= 1


func _on_Goal2_body_entered(body):
	if body.get_name() == "Ball":
		player2points -= 1
