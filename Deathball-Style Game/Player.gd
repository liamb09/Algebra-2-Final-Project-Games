extends KinematicBody2D

var velocity = Vector2()
var speed = 100
var acc = 25
var gravity = 15
var jump_height
var screen_size
var colliding_with
const max_y_velocity = 2000
var inertia = 300
var touching_wall_side # which side of the player is touching the wall

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	
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
		if collision.collider.is_in_group("bodies"):
			collision.collider.apply_central_impulse(-collision.normal * inertia)
		colliding_with.append(collision.collider.name)
	move_and_slide_with_snap(velocity, Vector2.DOWN, Vector2.UP, false, 4, PI/4, false)
	if is_on_floor():
		velocity.y = 0
	if colliding_with.find("TileMap") == -1 or is_on_ceiling():
		velocity.y += gravity
	if Input.is_action_pressed("run"):
		acc = 50
		speed = 300
	else:
		acc = 25
		speed = 100
	if is_on_wall():
		if $LeftRayCast.is_colliding():
			touching_wall_side = "left"
		elif $RightRayCast.is_colliding():
			touching_wall_side = "right"
	else:
		touching_wall_side = ""
	if Input.is_action_pressed("ui_right") and touching_wall_side != "right":
		velocity.x = max(velocity.x+acc, speed)
	elif Input.is_action_pressed("ui_left") and touching_wall_side != "left":
		velocity.x = min(velocity.x-acc, -speed)
	else:
		velocity.x *= .8
	if Input.is_action_just_pressed("ui_up"):
		velocity.y = -500
