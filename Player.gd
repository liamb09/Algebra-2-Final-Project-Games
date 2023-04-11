extends Area2D
class_name Player

signal spawn_laser(location)

onready var muzzle = $Muzzle

var speed = 300

var hp = 3

var input_vector = Vector2.ZERO

var canShoot = false

func _physics_process(delta):
	input_vector.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	
	global_position += input_vector * speed * delta

	if Input.is_action_pressed("shoot") and canShoot == true:
		shoot_laser()
		canShoot = false
	
	position.x = clamp(position.x, 0+10, 540-10)

func take_damage(damage):
	hp -= damage
	if hp <= 0:
		queue_free()

func _on_Player_area_entered(area):
	if area.is_in_group("enemies"):
		area.take_damage(1)
		
func shoot_laser():
	emit_signal("spawn_laser", muzzle.global_position)


func _on_laserTimer_timeout():
	canShoot = true
