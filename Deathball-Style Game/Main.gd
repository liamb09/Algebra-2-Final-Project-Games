extends Node

export var player1points = 2
export var player2points = 2

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
		if player1points == 0:
			print("Player 2 Wins!")
			$WinMessage.text = "Player 2 Wins!"
		else:
			print("Player 1 Wins!")
			$WinMessage.text = "Player 1 Wins!"

func _on_Goal_body_entered(body):
	if body.get_name() == "Ball":
		player1points -= 1
		$Ball.reset()
		$Ball.linear_velocity = Vector2.ZERO


func _on_Goal2_body_entered(body):
	if body.get_name() == "Ball":
		player2points -= 1
		$Ball.reset()
		$Ball.linear_velocity = Vector2.ZERO
