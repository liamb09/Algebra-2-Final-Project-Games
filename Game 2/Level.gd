extends Node

var PlayerScore = 0
var OpponentScore = 0

func _ready():
	$CountdownLabel.visible = false
	$Player.position.x = 35
	$Opponent.position.x = 720 - 35
	$Player2.position.y = 720-50
	$Opponent2.position.y = 15

func _on_Left_body_entered(body):
	$Ball.position = Vector2(360,360)
	OpponentScore += 1
	get_tree().call_group('BallGroup','stop_ball')
	$CountdownTimer.start()
	$CountdownLabel.visible = true
	$Player.position.x = 35
	$Opponent.position.x = 720 - 35
	#$ScoreSound.play()

func _on_Right_body_entered(body):
	$Ball.position = Vector2(360,360)
	PlayerScore += 1
	get_tree().call_group('BallGroup','stop_ball')
	$CountdownTimer.start()
	$CountdownLabel.visible = true
	$Player.position.x = 35
	$Opponent.position.x = 720 - 35
	#$ScoreSound.play()

func _on_Up_body_entered(body):
	$Ball.position = Vector2(360,360)
	PlayerScore += 1
	get_tree().call_group('BallGroup','stop_ball')
	$CountdownTimer.start()
	$CountdownLabel.visible = true
	$Player.position.x = 35
	$Opponent.position.x = 720 - 35
	#$ScoreSound.play()


func _on_Down_body_entered(body):
	$Ball.position = Vector2(360,360)
	OpponentScore += 1
	get_tree().call_group('BallGroup','stop_ball')
	$CountdownTimer.start()
	$CountdownLabel.visible = true
	$Player.position.x = 35
	$Opponent.position.x = 720 - 35
	#$ScoreSound.play()

func _process(delta):
	$PlayerScore.text = str(PlayerScore)
	$OpponentScore.text = str(OpponentScore)
	$CountdownLabel.text = str(int($CountdownTimer.time_left) + 1)

func _on_CountdownTimer_timeout():
	get_tree().call_group('BallGroup','restart_ball')
	$CountdownLabel.visible = false
