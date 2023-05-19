extends Area2D

onready var MainScene = get_node("../")

func _on_Coin_area_entered(area):
	if "Player" in area.name:
		queue_free()
		MainScene.timer -= 4
