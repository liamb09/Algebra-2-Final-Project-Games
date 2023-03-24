extends KinematicBody2D

var speed = 600
#Easy is 300 speed
#Medium is 420 speed
#Hard is 600 speed
var ball
var screen_size = Vector2.ZERO

func _ready():
	ball = get_parent().find_node("Ball")
	screen_size = get_viewport_rect().size

func _physics_process(delta):
	var velocity = Vector2.ZERO
	move_and_slide(Vector2(get_opponent_direction(), 0) * speed)
	
	position += velocity * delta
	position.x = clamp(position.x, 122+20, 720-20)

func get_opponent_direction():
	if abs(ball.position.x - position.x) > 25:
		if ball.position.x > position.x: return 1
		else: return -1
	else: return 0
