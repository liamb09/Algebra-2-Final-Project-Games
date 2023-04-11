extends Area2D

var timeLeft = 0

var start = load("res://Player")

func _process(delta):
	timeLeft += 1
	if timeLeft == 200:
		timeLeft = 0
		queue_free()

func _on_Powerup1_area_entered(area):
	if area is Player2:
		var time = get_node("Player/laserTimer")
		time.wait_time = 0
		print(time.wait_time)
		$QuickFire.start()
		queue_free()

func _on_QuickFire_timeout():
	var time = get_node("Player/laserTimer")
	time.wait_time = 0.5
