extends Area2D

export (int) var speed = 140

export (int) var speed2 = randi()%50+0

signal spawn_Elaser(loc)

onready var muzzle = $Muzzle

var hp = 1

var canShoot = false

func _physics_process(delta):
	global_position.y += -speed * delta
	global_position.x += speed2 * delta
	
	if canShoot == true:
		shoot_Elaser()
		canShoot = false
	
func take_damage(damage):
	hp -= damage
	if hp <= 0:
		queue_free()

func shoot_Elaser():
	emit_signal("spawn_Elaser", muzzle.global_position)

func _on_Enemy_4_area_entered(area):
	if area is Player:
		area.take_damage(1)


func _on_laserTimer_timeout():
	canShoot = true
