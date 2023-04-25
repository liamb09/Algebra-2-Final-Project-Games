extends Node2D

onready var main_scene = get_node("/root/MainScene")

func _ready():
	main_scene.connect("train_come", self, "_woork")

func _process(delta):
	pass

func _woork():
	$AnimatedSprite.play("default")
	$Timer.start()

func _on_Timer_timeout():
	$AnimatedSprite.play("Default2")
