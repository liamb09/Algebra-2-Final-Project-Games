extends KinematicBody2D
class_name Ball

var speed = 400
var velocity = Vector2.ZERO
var last_touched

func _on_Delay_timeout():
	$CountdownLabel.visible = false
	randomize()
	velocity.x = [-1,1][randi() % 2]
	velocity.y = [-0.4,0.4][randi() % 2]

func _physics_process(delta):
	$CountdownLabel.text = str(int($Delay.time_left) + 1)
	var collision_object = move_and_collide(velocity * speed * delta)
	if collision_object:
		velocity = velocity.bounce(collision_object.normal)
		#$CollisionSound.play()
		
		if (collision_object.normal.x) == 1:
			last_touched = 1
		if (collision_object.normal.x) == -1:
			last_touched = 2
		if (collision_object.normal.y) == 1:
			last_touched = 3
		if (collision_object.normal.y) == -1:
			last_touched = 4
		

func stop_ball():
	speed = 0

func restart_ball():
	speed = 400

func paddle_hit():
	if (last_touched == 1):
		get_tree().call_group('OppGroup','powerupChangeSpeed')	
	if (last_touched == 2):
		get_tree().call_group('PlayerGroup','powerupChangeSpeed')
	if (last_touched == 4):
		get_tree().call_group('Opp2Group','powerupChangeSpeed')
	if (last_touched == 3):
		get_tree().call_group('Player2Group','powerupChangeSpeed')

func paddle_hit_one():
	if (last_touched == 2):
		get_tree().call_group('OppGroup','powerupIncreaseSpeed')	
	if (last_touched == 1):
		get_tree().call_group('PlayerGroup','powerupIncreaseSpeed')
	if (last_touched == 3):
		get_tree().call_group('Opp2Group','powerupIncreaseSpeed')
	if (last_touched == 4):
		get_tree().call_group('Player2Group','powerupIncreaseSpeed')

func paddle_hit_two():
	if (last_touched == 1):
		get_tree().call_group('OppGroup','freezePow')	
	if (last_touched == 2):
		get_tree().call_group('PlayerGroup','freezePow')
	if (last_touched == 4):
		get_tree().call_group('Opp2Group','freezePow')
	if (last_touched == 3):
		get_tree().call_group('Player2Group','freezePow')
