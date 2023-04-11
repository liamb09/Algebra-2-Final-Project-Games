extends Area2D

export (int) var speed = 80

signal spawn_Elaser(loc)

onready var muzzle = $Muzzle

var hp = 2

var canShoot = false

func _physics_process(delta):
	global_position.y += -speed * delta
	
	if canShoot == true:
		shoot_Elaser()
		canShoot = false
	
func take_damage(damage):
	hp -= damage
	if hp <= 0:
		queue_free()

func shoot_Elaser():
	emit_signal("spawn_Elaser", muzzle.global_position)
	

func _on_laserTimer_timeout():
	canShoot = true


func _on_Enemy_3_area_entered(area):
	if area is Player:
		area.take_damage(1)
