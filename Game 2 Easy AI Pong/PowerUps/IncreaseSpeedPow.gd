extends Area2D

var timeLeft = 0
var timer = 0

func _process(delta):
	timeLeft += 1
	if timeLeft == 200:
		timeLeft = 0
		queue_free()

func _on_IncreaseSpeedPow_body_entered(body):
	if "Ball" in body.name:
		get_tree().call_group('BallGroup','paddle_hit_one')
		queue_free()
