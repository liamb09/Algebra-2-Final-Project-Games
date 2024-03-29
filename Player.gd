extends KinematicBody2D

var velocity = Vector2()
var speed = 100
var acc = 25
var gravity = 20
var jump_height = 800
var screen_size
var colliding_with
const max_y_velocity = 1800
var inertia = 300
var touching_wall_side # which side of the player is touching the wall
var current_map
export var start_pos = Vector2.ZERO
export var control_mode = ""
var direction = 1 #1 means right, -1 means left

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	reset()
	current_map = get_parent().current_map
	if control_mode == "wasd_":
		$AnimatedSprite.frame = 0
	else:
		$AnimatedSprite.frame = 1
	
func reset():
	position = start_pos

func _physics_process(delta):
	if position.x < 32:
		position.x = screen_size.x - 32
	elif position.x > screen_size.x - 32:
		position.x = 32
	if position.y < 32:
		position.y = screen_size.y - 32
	if position.y > screen_size.y - 32:
		position.y = 32
	if velocity.y > max_y_velocity:
		velocity.y = max_y_velocity
	colliding_with = []
	for index in get_slide_count():
		var collision = get_slide_collision(index)
		if collision.collider.is_in_group("bodies") and not $DownRayCast.is_colliding():
			collision.collider.apply_central_impulse(-collision.normal * inertia)
		colliding_with.append(collision.collider.name)
	move_and_slide_with_snap(velocity, Vector2.DOWN, Vector2.UP, false, 4, PI/4 - 0.04, false)
	if is_on_floor():
		velocity.y = 0
	if colliding_with.find(current_map) == -1 or is_on_ceiling() or is_on_wall():
		velocity.y += gravity
	if is_on_wall():
		if $LeftRayCast.is_colliding():
			touching_wall_side = "left"
		elif $RightRayCast.is_colliding():
			touching_wall_side = "right"
	else:
		touching_wall_side = ""
	if Input.is_action_pressed(control_mode+"ui_right") and touching_wall_side != "right":
		velocity.x = max(velocity.x+acc, speed)
		direction = 1
	elif Input.is_action_pressed(control_mode+"ui_left") and touching_wall_side != "left":
		velocity.x = min(velocity.x-acc, -speed)
		direction = -1
	else:
		velocity.x *= .8
		direction = 0
	if Input.is_action_just_pressed(control_mode+"run"):
		velocity.x = 1000*direction
	if Input.is_action_just_pressed(control_mode+"ui_up"):
		velocity.y = -jump_height
