extends Node

var PlayerScore = 0
var OpponentScore = 0
var preloadedPowerups = [
	preload("res://powerup.tscn"),
	preload("res://PowerUps/OpponentSpeedPow.tscn"),
	preload("res://PowerUps/IncreaseSpeedPow.tscn"),
	preload("res://PowerUps/FreezePowerup.tscn")
]

var timer = 0

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
	$Player2.position.y = 720-50
	$Opponent2.position.y = 15
	#$ScoreSound.play()

func _on_Right_body_entered(body):
	$Ball.position = Vector2(360,360)
	PlayerScore += 1
	get_tree().call_group('BallGroup','stop_ball')
	$CountdownTimer.start()
	$CountdownLabel.visible = true
	$Player.position.x = 35
	$Opponent.position.x = 720 - 35
	$Player2.position.y = 720-50
	$Opponent2.position.y = 15
	#$ScoreSound.play()

func _on_Up_body_entered(body):
	$Ball.position = Vector2(360,360)
	PlayerScore += 1
	get_tree().call_group('BallGroup','stop_ball')
	$CountdownTimer.start()
	$CountdownLabel.visible = true
	$Player.position.x = 35
	$Opponent.position.x = 720 - 35
	$Player2.position.y = 720-50
	$Opponent2.position.y = 15
	#$ScoreSound.play()


func _on_Down_body_entered(body):
	$Ball.position = Vector2(360,360)
	OpponentScore += 1
	get_tree().call_group('BallGroup','stop_ball')
	$CountdownTimer.start()
	$CountdownLabel.visible = true
	$Player.position.x = 35
	$Opponent.position.x = 720 - 35
	$Player2.position.y = 720-50
	$Opponent2.position.y = 15
	#$ScoreSound.play()

func _process(delta):
	$PlayerScore.text = str(PlayerScore)
	$OpponentScore.text = str(OpponentScore)
	$CountdownLabel.text = str(int($CountdownTimer.time_left) + 1)
	timer += 1
	if timer == 200:
		var powerupPreload = preloadedPowerups[randi() % preloadedPowerups.size()]
		var powerupInstance = powerupPreload.instance()
		randomize()
		var x_range = Vector2(50, 200)
		var y_range = Vector2(-50, 200)
		var random_x = randi() % int(x_range[1]- x_range[0]) + 1 + x_range[0] 
		var random_y =  randi() % int(y_range[1]-y_range[0]) + 1 + y_range[0]
		var random_pos = Vector2(random_x, random_y)
		powerupInstance.position = random_pos
		add_child(powerupInstance)
		timer = 0
	if (PlayerScore == 10) or (OpponentScore == 10):
		cut_scene()
	
func _on_CountdownTimer_timeout():
	get_tree().call_group('BallGroup','restart_ball')
	$CountdownLabel.visible = false

func cut_scene():
	get_tree().change_scene("res://PowerUps/GameOver.tscn")
