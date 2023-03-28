extends Area2D

const speed = 100

func _process(delta):
	position.x += speed*delta
