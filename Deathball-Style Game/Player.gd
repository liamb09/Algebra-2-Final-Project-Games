extends KinematicBody2D

var velocity = Vector2()
var speed = 100
var acc = Vector2(25, 0)
var gravity = 10
var jump_height
var screen_size

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	
func _physics_process(delta):
	if Input.is_action_pressed("ui_right"):
		velocity.x = max(velocity.x+acc.x, speed)
	elif Input.is_action_pressed("ui_left"):
		velocity.x = min(velocity.x-acc.x, -speed)
	else:
		velocity.x *= .8
	if Input.is_action_just_pressed("ui_up"):
		velocity.y = -500
		#acc.y = -50
	velocity.y += gravity
	#velocity.y += acc.y
	print(velocity)
	move_and_slide(velocity)
	position.x = clamp(position.x, 32, screen_size.x - 32)
	position.y = clamp(position.y, 32, screen_size.y - 32)
