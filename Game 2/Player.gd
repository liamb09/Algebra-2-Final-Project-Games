extends KinematicBody2D
class_name Player

var speed = 400

func _physics_process(delta):
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	move_and_slide(velocity * speed)
	
	position.y = clamp(position.y, 0+50+56, 720-50-56)

func powerupChangeSpeed():
	speed = 200
	$countdownTimer.start()

func _on_countdownTimer_timeout():
	speed = 400

func powerupIncreaseSpeed():
	speed = 900
	$countdownTimer1.start()

func _on_countdownTimer1_timeout():
	speed = 400

func freezePow():
	speed = 0
	$countdownTimer2.start()

func _on_countdownTimer2_timeout():
	speed = 400
