extends KinematicBody2D

var speed = 400
var screen_size = Vector2.ZERO

func _ready():
	screen_size = get_viewport_rect().size

func _physics_process(delta):
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	move_and_slide(velocity * speed)

	position += velocity * delta
	position.x = clamp(position.x, 122+20, 720-20)
