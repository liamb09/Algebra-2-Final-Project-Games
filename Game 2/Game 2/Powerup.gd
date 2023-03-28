extends Area2D

var timeLeft = 0

func _on_Powerup_body_entered(body):
	if "Ball" in body.name:
		body.speed = 600
		queue_free()

func _process(delta):
	timeLeft += 1
	if timeLeft == 200:
		timeLeft = 0
		queue_free()
