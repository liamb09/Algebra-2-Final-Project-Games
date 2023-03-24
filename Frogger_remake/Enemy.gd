extends Area2D

const tile_size = 32
const speed = 50
var spawnTime = 0

func _process(delta):
	position.x += speed*delta

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()



func _on_SpawnTimer_timeout():
	pass # Replace with function body.
