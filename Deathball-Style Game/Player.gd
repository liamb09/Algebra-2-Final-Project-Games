extends KinematicBody2D

var velocity = Vector2()
var speed = 100
var acc = 25
var gravity = 15
var jump_height
var screen_size

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	
func _physics_process(delta):
	if Input.is_action_pressed("run"):
		acc = 50
		speed = 300
	else:
		acc = 25
		speed = 100
	if Input.is_action_pressed("ui_right"):
		velocity.x = max(velocity.x+acc, speed)
	elif Input.is_action_pressed("ui_left"):
		velocity.x = min(velocity.x-acc, -speed)
	else:
		velocity.x *= .8
	if Input.is_action_just_pressed("ui_up"):
		velocity.y = -500
	if not is_on_floor():
		velocity.y += gravity
	move_and_slide(velocity, Vector2.UP)
