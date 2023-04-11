extends Area2D

export (int) var speed = 180

var Elaser = preload("res://EnemyLaser.tscn")

onready var muzzle = $Muzzle

var hp = 1

var canShoot = false

func _physics_process(delta):
	global_position.y += -speed * delta
	
func take_damage(damage):
	hp -= damage
	if hp <= 0:
		queue_free()


func _on_Enemy_1_area_entered(area):
	if area is Player:
		area.take_damage(1)


func _on_laserTimer_timeout():
	canShoot = true
