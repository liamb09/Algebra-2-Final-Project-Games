extends Node2D

var counter2 = 0
var train_about_come = false
var speed = 0

func _process(delta):
	counter2 += delta
	if int(counter2) == Globals.train_timer:
		$AnimatedSprite.play("default")
		$Timer.start()
		train_about_come = true
		counter2 = 0
	if train_about_come:
		Globals.train_almost_there += delta

func _on_Timer_timeout():
	$AnimatedSprite.play("Default2")
	train_about_come = false
