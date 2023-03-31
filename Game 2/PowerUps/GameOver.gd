extends Node2D

func _on_Ext_Game_pressed():
	get_tree().quit()

func _on_Play_Again_pressed():
	get_tree().change_scene("res://PowerUps/Intro.tscn")
