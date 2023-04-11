extends Area2D

var speed = 1000

func _physics_process(delta):
	global_position.y += -speed * delta

func _on_EnemyLaser_area_entered(area):
	if area in Player:
		area.take_damage(1)
		queue_free()
