extends Node2D

var Plaser = preload("res://PlayerLaser.tscn")

onready var deadalive = get_node("/root/Global1")

func _physics_process(delta):
	pass

func _on_Player_spawn_laser(location):
	var p = Plaser.instance()
	p.global_position = location
	add_child(p)

func _on_Area2D_area_entered(area):
	var timer = get_node("Enemy Spawner/SpawnTimer")
	timer.wait_time = 0.4
	$EnemyMass.start()


func _on_EnemyMass_timeout():
	var timer = get_node("Enemy Spawner/SpawnTimer")
	timer.wait_time = 1
