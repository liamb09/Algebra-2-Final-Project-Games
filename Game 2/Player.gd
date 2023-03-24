extends KinematicBody2D

var speed = 400

func _physics_process(delta):
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	move_and_slide(velocity * speed)
	
	position.y = clamp(position.y, 0+50+56, 720-50-56)
