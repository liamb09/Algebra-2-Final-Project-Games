extends KinematicBody2D
class_name Opponent

var speed = 450
#Easy is 300 speed
#Medium is 420 speed
#Hard is 600 speed
var ball
var timer

func _ready():
	ball = get_parent().find_node("Ball")

func _physics_process(delta):
	move_and_slide(Vector2(0,get_opponent_direction()) * speed)
	
	position.y = clamp(position.y, 0+50+56, 720-50-56)

func get_opponent_direction():
	if abs(ball.position.y - position.y) > 25:
		if ball.position.y > position.y: return 1
		else: return -1
	else: return 0

func powerupChangeSpeed():
	speed = 200
	$countdownTimer.start()


func _on_countdownTimer_timeout():
	speed = 450

func powerupIncreaseSpeed():
	speed = 900
	$countdownTimer1.start()
	
func _on_countdownTimer1_timeout():
	speed = 450

func freezePow():
	speed = 0
	$countdownTimer2.start()

func _on_countdownTimer2_timeout():
	speed = 450
