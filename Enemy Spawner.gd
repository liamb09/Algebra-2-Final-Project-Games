extends Node2D

var spawnPositions = null

var all_enemy = [
	preload("res://Enemy 1.tscn"),
	preload("res://Enemy 2.tscn"),
	preload("res://Enemy 3.tscn"),
	preload("res://Enemy 4.tscn"),
	preload("res://Enemy 5.tscn"),
	preload("res://Enemy 6.tscn"),
	preload("res://Enemy 7.tscn"),
]

func _ready():
	spawnPositions = $SpawnPositions.get_children()

func spawnEnemy():
	var Enemy = all_enemy[randi() % all_enemy.size()]
	var index = randi() % spawnPositions.size()
	var enemy = Enemy.instance()
	enemy.global_position = spawnPositions[index].global_position
	add_child(enemy)
	randomize()


func _on_SpawnTimer_timeout():
	spawnEnemy()
