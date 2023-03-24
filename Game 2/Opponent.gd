extends KinematicBody2D

var speed = 600
#Easy is 300 speed
#Medium is 420 speed
#Hard is 600 speed
var ball

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
